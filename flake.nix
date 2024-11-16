{
  description = "My neovim config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixPatch = {
      url = "github:NicoElbers/nixPatch-nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixPatch, ... }:
  let
    # Copied from flake utils
    eachSystem = with builtins; systems: f:
        let
        # Merge together the outputs for all systems.
        op = attrs: system:
          let
          ret = f system;
          op = attrs: key: attrs //
            {
              ${key} = (attrs.${key} or { })
              // { ${system} = ret.${key}; };
            }
          ;
          in
          foldl' op attrs (attrNames ret);
        in
        foldl' op { }
        (systems
          ++ # add the current system if --impure is used
          (if builtins ? currentSystem then
             if elem currentSystem systems
             then []
             else [ currentSystem ]
          else []));

    forEachSystem = eachSystem nixpkgs.lib.platforms.all;
  in
  let
    # Easily configure a custom name, this will affect the name of the standard
    # executable, you can add as many aliases as you'd like in the configuration.
    name = "nixPatch";

    extra_pkg_config = { };

    configuration = { pkgs, ... }: {
      luaPath = "${./.}";
      imports = [ ./nix/configuration.nix ];

      settings = {
        withNodeJs = false;
        withRuby = false;
        withPerl = false;
        withPython3 = false;
        extraName = "";
        configDirName = "nvim-test";
        neovim-unwrapped = null;

        # Whether to add custom substitution made in the original repo, makes for
        # a better out of the box experience
        patchSubs = true;

        # Whether to add runtime dependencies to the back of the path
        suffix-path = false;

        # Whether to add shared libraries dependencies to the back of the path
        suffix-LD = false;
      };
    };
  in
  forEachSystem (system: {
    packages.default =
      nixPatch.configWrapper.${system} { inherit configuration extra_pkg_config name; };
  });
}
