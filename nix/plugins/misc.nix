{ pkgs, ... }:

{
  plugins = with pkgs.vimPlugins;
    pkgs.lib.mkAfter
    [
      mini-nvim
      telescope-nvim
      plenary-nvim
    ];
}
