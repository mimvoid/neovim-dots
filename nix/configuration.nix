{ pkgs, ... }:

{
  imports = [
    ./plugins
    ./runtime
  ];

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
}
