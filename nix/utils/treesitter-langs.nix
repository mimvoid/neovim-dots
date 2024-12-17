{ plugins, ... }:

with plugins;
let
  required_langs = [ c lua vim vimdoc query markdown markdown_inline ];
in
[
  nix lua bash go rust nim
  css scss html javascript typescript
  latex python r
  json toml yaml xml
  hyprlang
  csv tsv
  git_config git_rebase gitattributes gitignore
  cmake
  comment
  bibtex
  gnuplot
]
++ required_langs
