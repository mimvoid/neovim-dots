{ pkgs, ... }:

with pkgs;
let
  bash = [ bash-language-server ];

  go = [
    gopls
    gotools
    go-tools
    gccgo
  ];

  latex = [ texlab ];

  lua = [
    lua-language-server
    stylua
  ];

  markdown = [ marksman ];

  nix = [ nixd ];

  python = [
    basedpyright
    ruff
  ];

  # r = [ (pkgs.callPackage ../pkgs/r-nvim { }) ];
  rust = [ rust-analyzer ];

  typescript = [ typescript-language-server ];
in
{
  runtimeDeps = pkgs.lib.mkAfter
    bash ++ latex ++ lua ++ markdown ++ nix ++ python;
}
