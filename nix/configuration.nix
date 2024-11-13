{ pkgs, ... }:

{
  imports = [
    ./plugins
    ./runtime
  ];

  plugins = with pkgs.vimPlugins; [
    lazy-nvim

    nvim-lspconfig
    nvim-autopairs
    nvim-dap
    gitsigns-nvim
    indent-blankline-nvim
    nvim-lint
    neo-tree-nvim
    which-key-nvim
  ];

  runtimeDeps = with pkgs; [
    make
    unzip
    ripgrep
  ];

  environmentVariables = { };

  aliases = [ "vim" "vi" ];

  # Extra wrapper args you want to pass.
  # Look here if you don't know what those are:
  # https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/setup-hooks/make-wrapper.sh
  extraWrapperArgs = [ ];

  python3Packages = [ ];
  extraPython3WrapperArgs = [ ];
  luaPackages = [ ];

  sharedLibraries = [ ];

  # Extra lua configuration put at the top of your init.lua
  extraConfig = [ ];

  # customSubs = with patchUtils; [ ];
}
