# lspsAndRuntimeDeps

{ pkgs }:
let
  # List LSPs & formatter in a separate file
  langs = import ./utils/languages.nix { inherit pkgs; };

  # Specify which languages' tools to include
  used-langs = pkgs.lib.lists.flatten (
    with langs;
    [
      nix
      c
      lua
      latex
      markdown
      python
      typescript
    ]
  );
in
{
  general =
    with pkgs;
    [
      universal-ctags
      tree-sitter
      ripgrep
      prettierd
    ]
    ++ used-langs;
}
