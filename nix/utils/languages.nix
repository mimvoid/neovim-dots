# A set of lsps, formatters, and linters grouped by language
{ pkgs }:

with pkgs;
{
  bash = bash-language-server;
  c = gdb;
  css = stylelint;

  go = [
    gopls
    gotools
    go-tools
  ];

  java = jdt-language-server;
  latex = texlab;

  lua = [
    stylua
    selene
  ];

  markdown = markdownlint-cli2;
  nim = nimlangserver;

  nix = [
    nixd
    statix
    nixfmt
  ];

  python = [
    basedpyright
    ruff
  ];

  rust = rust-analyzer;
  typescript = vtsls;

  vala = [
    vala-lint
    vala-language-server
  ];
}
