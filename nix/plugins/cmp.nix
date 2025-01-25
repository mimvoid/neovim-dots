{ pkgs, voids, ... }:

with pkgs.vimPlugins;
[
  blink-cmp
  luasnip
  friendly-snippets

  voids.blink-compat
  # voids.cmp-r
]
