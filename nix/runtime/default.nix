{ pkgs, ... }:
let
  # List LSPs & formatter in a separate file
  langs = import ./languages.nix { inherit pkgs; };

  # Specify which languages' tools to include
  used-langs = pkgs.lib.lists.flatten (
    with langs;
    [
      nix
      lua
      latex
      markdown
      nim
      python
      go
      typescript
    ]
  );
in
with pkgs;
[
  stdenv.cc.cc
  tree-sitter
  ripgrep
  prettierd
]
++ used-langs
