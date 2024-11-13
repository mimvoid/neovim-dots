{ pkgs, ... }:
let
  # nvim-project-marks = pkgs.callPackage ../pkgs/nvim-project-marks;
in 
{
  plugins = pkgs.lib.mkAfter [
    pkgs.vimPlugins.marks-nvim
    # nvim-project-marks
  ];
}
