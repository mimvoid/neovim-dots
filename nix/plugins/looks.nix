{ pkgs, ... }:

with pkgs.vimPlugins;
[
  catppuccin-nvim
  lualine-nvim

  nvim-web-devicons
  tiny-devicons-auto-colors-nvim

  rainbow-delimiters-nvim
  nvim-highlight-colors
]
