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

  typing = with pkgs.vimPlugins; [
    ultimate-autopair-nvim
    nvim-ts-autotag
    nvim-treesitter-endwise
    nvim-spider
    voids.neotab
  ];
in
{
  general =
    with pkgs.vimPlugins;
    [
      nvim-lspconfig
      nvim-lint
      conform-nvim

      snacks-nvim
      guess-indent-nvim
      marks-nvim
      tiny-inline-diagnostic-nvim
    ]
    ++ [ treesitter ]
    ++ cmp
    ++ looks
    ++ debug
    ++ typing;
}
