{ pkgs, ... }:
let
  # Get custom packages
  my = import ../pkgs { inherit pkgs; };

  cmp = import ./cmp.nix { inherit pkgs my; };
  looks = import ./looks.nix { inherit pkgs; };

  language-specific = [
    pkgs.vimPlugins.vimtex
    my.r-nvim
  ];

  marks = [
    pkgs.vimPlugins.marks-nvim
    my.nvim-project-marks
  ];

  treesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins (
    plugins: (import ../utils/treesitter-langs.nix { inherit plugins; })
  );

  typing = with pkgs.vimPlugins; [
    ultimate-autopair-nvim
    my.neotab
    fcitx-vim
  ];
in
with pkgs.vimPlugins;
[
  lazy-nvim

  nvim-lspconfig
  treesitter

  mini-nvim
  telescope-nvim
  plenary-nvim
]
++ cmp
++ language-specific
++ looks
++ marks
++ typing
