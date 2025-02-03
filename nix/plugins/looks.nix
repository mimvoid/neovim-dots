{ pkgs, ... }:

with pkgs.vimPlugins;
[
  catppuccin-nvim

  lualine-nvim
  alpha-nvim

  nvim-web-devicons
  tiny-devicons-auto-colors-nvim

  rainbow-delimiters-nvim
  nvim-highlight-colors
]
