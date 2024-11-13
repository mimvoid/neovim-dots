{ pkgs, ... }:

{
  imports = [
    ./plugins
    # ./runtime
  ];

  # Plugins you use in your configuration.
  plugins = with pkgs.vimPlugins; [
    nvim-autopairs
    nvim-dap
    gitsigns-nvim
    indent-blankline-nvim
    nvim-lint
    neo-tree-nvim
  ];

  # Runtime dependencies. This is thing like tree-sitter, lsps or programs
  # like ripgrep.
  runtimeDeps = with pkgs; [ ];

  environmentVariables = { };

  # Aliases for the patched config
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
