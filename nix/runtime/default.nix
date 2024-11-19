{ pkgs, ... }:

{
  imports = [
    ./lsp.nix
    ./formatters.nix
  ];

  runtimeDeps = with pkgs; [
    stdenv.cc.cc
    universal-ctags
    gcc
    tree-sitter
    ripgrep
    fd
  ];
}
