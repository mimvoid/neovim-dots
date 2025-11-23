# startupPlugins
# This is for plugins that will load at startup without using packadd:

{ pkgs }:

{
  general =
    with pkgs.vimPlugins;
    [
      lz-n
      mini-nvim
      catppuccin-nvim

      vimtex
    ];
}
