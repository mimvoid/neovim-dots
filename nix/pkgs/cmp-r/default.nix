{
  lib,
  fetchFromGitHub,
  vimUtils,
}:

vimUtils.buildVimPlugin {
  pname = "cmp-r";
  version = "unstable-2024-11-11";

  src = fetchFromGitHub {
    owner = "R.nvim";
    repo = "cmp-r";
    rev = "a951034404c14051129b47e09cfed83f7a306898";
    hash = "sha256-/2fGykyb8gmAdchCf96udZLuBxN8feWkQ1BlCl5LsIw=";
  };

  meta = {
    description = "Completion source for nvim-cmp using R.nvim as backend";
    homepage = "https://github.com/R-nvim/cmp-r";
    license = lib.licenses.gpl3;
  };
}
