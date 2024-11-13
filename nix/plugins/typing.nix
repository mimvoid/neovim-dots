{ pkgs, ... }:
let
  # neotab = pkgs.callPackage ../pkgs/neotab-nvim { };
in
{
  plugins = with pkgs.vimPlugins;
    pkgs.lib.mkAfter
    [
      ultimate-autopair-nvim
      # neotab

      fcitx-vim
    ];
}
