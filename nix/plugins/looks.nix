{ pkgs, ... }:

with pkgs.vimPlugins;
[
  base16-nvim

  lualine-nvim
  bufferline-nvim
  alpha-nvim
  nvim-web-devicons

  rainbow-delimiters-nvim
  nvim-highlight-colors
]
