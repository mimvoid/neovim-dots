{
  description = "My neovim config";

  inputs = {
    nixpkgs.url = "git+https://github.com/NixOS/nixpkgs?shallow=1&ref=nixos-unstable";
    nixPatch = {
      url = "github:NicoElbers/nixPatch-nvim";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        neovim-nightly-overlay.follows = ""; # Unused
      };
    };
  };

  outputs = { nixpkgs, nixPatch, ... }:
  let
    # Copied from flake utils
    eachSystem =
      systems: f:
      let
        # Merge together the outputs for all systems.
        op =
          attrs: system:
          let
            ret = f system;
          in
          builtins.foldl' (
            attrs: key:
            attrs
            // {
              ${key} = (attrs.${key} or { }) // {
                ${system} = ret.${key};
              };
            }
          ) attrs (builtins.attrNames ret);
      in
      builtins.foldl' op { } (
        if !builtins ? currentSystem || builtins.elem builtins.currentSystem systems then
          systems
        else
          # Add the current system if --impure is used
          systems ++ [ builtins.currentSystem ]
      );

    forEachSystem = eachSystem nixpkgs.lib.platforms.all;
  in
  let
    name = "nvim";

    extra_pkg_config = { };

    configuration =
      { pkgs, ... }:
      {
        luaPath = "${./.}";

        plugins = import ./nix/plugins { inherit pkgs; };
        runtimeDeps = import ./nix/runtime { inherit pkgs; };

        environmentVariables = { };
        aliases = [ ];
        extraWrapperArgs = [ ];

        python3Packages = [ ];
        extraPython3WrapperArgs = [ ];
        luaPackages = [ ];
        sharedLibraries = [ ];

        extraConfig = [ ]; # Extra lua configuration put at the top of your init.lua
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
    packages.default = nixPatch.configWrapper.${system} {
      inherit configuration extra_pkg_config name;
    };
  });
}
