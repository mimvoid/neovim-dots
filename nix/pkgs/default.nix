{ pkgs, ... }:

with pkgs;
{
  blink-compat = callPackage ./blink-compat { };
  cmp-r = callPackage ./cmp-r { };
  r-nvim = callPackage ./r-nvim { };
  nvim-project-marks = callPackage ./nvim-project-marks { };
  neotab = callPackage ./neotab-nvim { };
}
