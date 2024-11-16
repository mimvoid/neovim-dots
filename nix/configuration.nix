{ pkgs, ... }:

{
  imports = [
    ./plugins
    ./runtime
  ];

  plugins = with pkgs.vimPlugins; [
    lazy-nvim

    nvim-lspconfig
    # nvim-dap
  ];

  runtimeDeps = with pkgs; [
    universal-ctags
    gcc
    ripgrep
  ];

  environmentVariables = { };

  aliases = [ "vim" "vi" ];

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
