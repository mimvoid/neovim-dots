{ pkgs, ... }:
let
  # Get custom packages
  # Use with voids.<package>
  voids = import ../pkgs { inherit pkgs; };

  # Languages defined in a separate file
  treesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins (
    plugins: (import ../utils/treesitter-langs.nix { inherit plugins; })
  );

  # Separated plugin lists
  cmp = import ./cmp.nix { inherit pkgs voids; };
  looks = import ./looks.nix { inherit pkgs; };

  marks = [
    pkgs.vimPlugins.marks-nvim
    voids.nvim-project-marks
  ];

  typing = with pkgs.vimPlugins; [
    ultimate-autopair-nvim
    nvim-ts-autotag
    nvim-treesitter-endwise
    vim-matchup
    voids.neotab
    fcitx-vim
  ];

  lang-specific = [
    pkgs.vimPlugins.vimtex
    pkgs.vimPlugins.nvim-jdtls
    # voids.r-nvim
  ];
in
with pkgs.vimPlugins;
[
  lazy-nvim

  nvim-lspconfig
  nvim-lint

  mini-nvim
  plenary-nvim
  snacks-nvim
  guess-indent-nvim
]
++ [ treesitter ]
++ cmp
++ looks
++ marks
++ typing
++ lang-specific
