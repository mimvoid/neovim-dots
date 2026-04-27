# optionalPlugins
# not loaded automatically at startup.
# use with packadd and an autocommand in config to achieve lazy loading
{ pkgs }:
let
  # Custom packages, use with voids.<package>
  voids = import ./pkgs { inherit pkgs; };
in
{
  general = builtins.attrValues {
    inherit (pkgs.vimPlugins)
      nvim-lspconfig
      nvim-lint
      conform-nvim

      indent-o-matic
      marks-nvim
      tiny-inline-diagnostic-nvim

      # Completion
      blink-cmp
      blink-compat

      luasnip
      friendly-snippets

      # Appearance
      lualine-nvim

      nvim-web-devicons
      tiny-devicons-auto-colors-nvim

      rainbow-delimiters-nvim
      nvim-highlight-colors

      # Debug
      nvim-dap
      debugmaster-nvim

      # Typing
      ultimate-autopair-nvim
      nvim-ts-autotag
      nvim-treesitter-endwise
      vim-matchup
      nvim-spider
      ;

    inherit (voids) neotab;

    # Languages defined in a separate file
    treesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins (
      plugins: (import ./utils/treesitter-langs.nix { inherit plugins; })
    );
  };
}
