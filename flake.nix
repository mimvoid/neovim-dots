{
  description = "My neovim config";

  inputs = {
    nixpkgs.url = "git+https://github.com/NixOS/nixpkgs?shallow=1&ref=nixos-unstable";
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
            };
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
    name = "nvim";

    extra_pkg_config = { };

    configuration = { pkgs, ... }: {
      luaPath = "${./.}";

      plugins = import ./nix/plugins { inherit pkgs; };
      runtimeDeps = import ./nix/runtime { inherit pkgs; };

      environmentVariables = { };

      aliases = [ ];

      # Extra wrapper args you want to pass.
      extraWrapperArgs = [ ];

      python3Packages = [ ];
      extraPython3WrapperArgs = [ ];
      luaPackages = [ ];

      sharedLibraries = [ ];

      # Extra lua configuration put at the top of your init.lua
      extraConfig = [ ];

      # customSubs = with patchUtils; [ ];

      settings = {
        withNodeJs = false;
        withRuby = false;
        withPerl = false;
        withPython3 = false;
        extraName = "";
        configDirName = "nvim";
        neovim-unwrapped = null;

        patchSubs = true; # original repo patches
        suffix-path = false; # runtime dependencies
        suffix-LD = false; # shared libraries dependencies
      };
    };
  in
  forEachSystem (system: {
    packages.default =
      nixPatch.configWrapper.${system} { inherit configuration extra_pkg_config name; };
  });
}
