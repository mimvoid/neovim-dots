{ pkgs, ... }:

with pkgs.vimPlugins;
[
  catppuccin-nvim

  lualine-nvim
  alpha-nvim
  nvim-web-devicons

  rainbow-delimiters-nvim
  nvim-highlight-colors
]
