{ pkgs, ... }:
let
  r = pkgs.callPackage ../pkgs/r-nvim { };
in
{
  packages = with pkgs;
    pkgs.lib.mkAfter
    [
      r
      vimPlugins.vimtex
    ];
}
