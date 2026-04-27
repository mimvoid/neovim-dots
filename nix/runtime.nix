# lspsAndRuntimeDeps
{ pkgs }:

rec {
  general = [
    pkgs.universal-ctags
    pkgs.tree-sitter
    pkgs.ripgrep
    pkgs.prettierd
  ]
  ++ nix
  ++ c
  ++ lua
  ++ latex
  ++ markdown
  ++ python
  ++ typescript;

  bash = [ pkgs.bash-language-server ];
  c = [ pkgs.gdb ];
  css = [ pkgs.stylelint ];

  go = [
    pkgs.gopls
    pkgs.gotools
    pkgs.go-tools
  ];

  java = [ pkgs.jdt-language-server ];
  latex = [ pkgs.texlab ];

  lua = [
    pkgs.stylua
    pkgs.selene
  ];

  markdown = [ pkgs.markdownlint-cli2 ];
  nim = [ pkgs.nimlangserver ];

  nix = [
    pkgs.nixd
    pkgs.statix
    pkgs.nixfmt
  ];

  python = [
    pkgs.basedpyright
    pkgs.ruff
  ];

  rust = [ pkgs.rust-analyzer ];
  typescript = [ pkgs.vtsls ];

  vala = [
    pkgs.vala-lint
    pkgs.vala-language-server
  ];
}
