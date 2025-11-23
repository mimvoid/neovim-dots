{
  description = "My neovim flake, with extra cats! nixCats!";

  inputs = {
    nixpkgs.url = "git+https://github.com/NixOS/nixpkgs?shallow=1&ref=nixos-unstable";
    nixCats.url = "github:BirdeeHub/nixCats-nvim";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      inherit (inputs.nixCats) utils;
      luaPath = ./.;
      forEachSystem = utils.eachSystem nixpkgs.lib.platforms.all;

      extra_pkg_config = { };
      dependencyOverlays = [ ];

      categoryDefinitions =
        { pkgs, ... }:
        {
          lspsAndRuntimeDeps = import ./nix/runtime.nix { inherit pkgs; };
          startupPlugins = import ./nix/startup.nix { inherit pkgs; };
          optionalPlugins = import ./nix/optional.nix { inherit pkgs; };

          sharedLibraries = { };
          environmentVariables = { };
          extraWrapperArgs = { };

          python3.libraries = { };
          extraLuaPackages = { };
        };

      packageDefinitions = {
        nvim =
          { ... }:
          {
            settings = {
              suffix-path = true;
              suffix-LD = true;
              wrapRc = true;
              aliases = [ ];
            };
            categories.general = true;
          };
      };
      defaultPackageName = "nvim";
    in
    forEachSystem (
      system:
      let
        nixCatsBuilder = utils.baseBuilder luaPath {
          inherit
            nixpkgs
            system
            dependencyOverlays
            extra_pkg_config
            ;
        } categoryDefinitions packageDefinitions;

        defaultPackage = nixCatsBuilder defaultPackageName;
      in
      {
        packages = utils.mkAllWithDefault defaultPackage;
      }
    );
}
