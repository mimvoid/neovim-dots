{
  lib,
  fetchFromGitHub,
  vimUtils,
}:

vimUtils.buildVimPlugin {
  pname = "cmp-r";
  version = "unstable-2024-11-11";

  src = fetchFromGitHub {
    owner = "R-nvim";
    repo = "cmp-r";
    rev = "18b88eeb7e47996623b9aa0a763677ac00a16221";
    hash = "sha256-3h+7q/x5xST50b9MdjR+9JULTwgn6kAyyrL5qhCtta0=";
  };

  meta = {
    description = "Completion source for nvim-cmp using R.nvim as backend";
    homepage = "https://github.com/R-nvim/cmp-r";
    license = lib.licenses.gpl3;
  };
}
