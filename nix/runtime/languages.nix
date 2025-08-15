{ pkgs, ... }:

# A set of lsps, formatters, and linters grouped by language

with pkgs;
{
  bash = bash-language-server;

  c = [
    # clang-tools
    gdb
  ];

  css = stylelint;

  go = [
    gopls
    gotools
    go-tools
  ];

  java = jdt-language-server;

  latex = texlab;

  lua = [
    # lua-language-server
    stylua
    selene
  ];

  markdown = [
    # marksman
    markdownlint-cli2
  ];

  nim = nimlangserver;

  nix = [
    nixd
    statix
  ];

  python = [
    basedpyright
    ruff
  ];

  rust = [
    rust-analyzer
  ];

  typescript = typescript-language-server;

  vala = [
    vala-lint
    vala-language-server
  ];
}
