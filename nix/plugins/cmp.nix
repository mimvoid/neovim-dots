{ pkgs, my, ... }:

with pkgs.vimPlugins;
[
  blink-cmp
  luasnip
  friendly-snippets

  my.blink-compat
  my.cmp-r
]
