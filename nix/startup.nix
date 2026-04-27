# startupPlugins
# This is for plugins that will load at startup without using packadd:
{ pkgs }:

{
  general = [
    pkgs.vimPlugins.lz-n
    pkgs.vimPlugins.mini-nvim
    pkgs.vimPlugins.catppuccin-nvim
    pkgs.vimPlugins.vimtex
  ];
}
