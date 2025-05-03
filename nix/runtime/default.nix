{ pkgs, ... }:
let
  # List LSPs & formatter in a separate file
  langs = import ./languages.nix { inherit pkgs; };

  # Specify which languages' tools to include
  used-langs = pkgs.lib.lists.flatten (
    with langs;
    [
      nix
      c
      lua
      latex
      markdown
      nim
      python
      go
      typescript
      java
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
