{ pkgs, ... }:
let
  langs = import ./languages.nix { inherit pkgs; };

  used-langs = pkgs.lib.lists.flatten (with langs;
    [ nix lua latex markdown python ]
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
