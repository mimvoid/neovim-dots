{ pkgs, ... }:

with pkgs;
let
  lua = [ stylua ];
  python = [ ruff ];
in
{
  runtimeDeps = pkgs.lib.mkAfter
    [ prettierd ] ++ lua ++ python;
}
