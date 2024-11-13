{ pkgs, ... }:

let
  nvim-treesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins (
    plugins: with plugins;
      let
        required_langs = [ c lua vim vimdoc query markdown markdown_inline ];
      in
      [
        nix lua bash css scss html latex python r
        javascript typescript rust
        xml json toml yaml hyprlang
        csv tsv
        git_config git_rebase gitattributes gitignore
        cmake
        comment
        bibtex
        gnuplot
      ] ++ required_langs
  );
in
{
  plugins = pkgs.lib.mkAfter [
    nvim-treesitter
    pkgs.vimPlugins.nvim-treesitter-textobjects
  ];
}
