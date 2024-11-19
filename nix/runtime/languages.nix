{ pkgs, ... }:

# A set of lsps and formatters sorted by language

with pkgs;
{
  bash = bash-language-server;

  go = [
    gopls
    gotools
    go-tools
  ];

  latex = texlab;

  lua = [
    lua-language-server
    stylua
  ];

  markdown = marksman;
  nix = nixd;

  python = [
    basedpyright
    ruff
  ];

  rust = rust-analyzer;
  typescript = typescript-language-server;
}
