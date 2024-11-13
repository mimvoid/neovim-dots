{ pkgs, ... }:
let
  blink-compat = pkgs.callPackage ../pkgs/blink-compat { };
  cmp-r = pkgs.callPackage ../pkgs/cmp-r { };
in
{
  plugins = with pkgs.vimPlugins;
    pkgs.lib.mkAfter
    [
      blink-cmp
      blink-compat

      cmp-r

      luasnip
      friendly-snippets
    ];
}
