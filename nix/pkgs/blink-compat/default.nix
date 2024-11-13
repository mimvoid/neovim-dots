{
  lib,
  fetchFromGitHub,
  vimUtils,
}:

vimUtils.buildVimPlugin {
  pname = "blink.compat";
  version = "unstable-2024-11-11";

  src = fetchFromGitHub {
    owner = "Saghen";
    repo = "blink.compat";
    rev = "a951034404c14051129b47e09cfed83f7a306898";
    hash = "sha256-/2fGykyb8gmAdchCf96udZLuBxN8feWkQ1BlCl5LsIw=";
  };

  meta = {
    description = "Compatibility layer for using nvim-cmp sources on blink.cmp";
    homepage = "https://github.com/Saghen/blink.compat";
    license = lib.licenses.mit;
  };
}
