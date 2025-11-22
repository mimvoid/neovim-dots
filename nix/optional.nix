# optionalPlugins
# not loaded automatically at startup.
# use with packadd and an autocommand in config to achieve lazy loading

{ pkgs }:
let
  # Custom packages, use with voids.<package>
  voids = import ./pkgs { inherit pkgs; };

  # Languages defined in a separate file
  treesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins (
    plugins: (import ./utils/treesitter-langs.nix { inherit plugins; })
  );

  # Separated plugin lists
  cmp = with pkgs.vimPlugins; [
    blink-cmp
    blink-compat

    luasnip
    friendly-snippets
  ];

  looks = with pkgs.vimPlugins; [
    catppuccin-nvim
    lualine-nvim

    nvim-web-devicons
    tiny-devicons-auto-colors-nvim

    rainbow-delimiters-nvim
    nvim-highlight-colors
  ];

  debug = with pkgs.vimPlugins; [
    nvim-dap
    debugmaster-nvim
  ];

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
  ];

  lang-specific = [
    pkgs.vimPlugins.vimtex
  ];
in
{
  general = [
    treesitter
  ];

  full =
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
    ++ debug
    ++ marks
    ++ typing
    ++ lang-specific;
}
