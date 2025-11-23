# startupPlugins
# This is for plugins that will load at startup without using packadd:

{ pkgs }:
let
  # Custom packages, use with voids.<package>
  voids = import ./pkgs { inherit pkgs; };
in
{
  general =
    with pkgs.vimPlugins;
    [
      lz-n
      mini-nvim
      catppuccin-nvim

      vimtex
    ]
    ++ [ voids.nvim-project-marks ];
}
