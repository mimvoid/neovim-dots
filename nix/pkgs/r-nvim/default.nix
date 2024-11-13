{
  lib,
  fetchFromGitHub,
  vimUtils,
}:

vimUtils.buildVimPlugin rec {
  pname = "R.nvim";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "R-nvim";
    repo = "R.nvim";
    rev = "v${version}";
    hash = "sha256-TMcnmMkMsB0lNAAcVAC1751pnV44xz2BCMLGcMbs8Xs=";
  };

  meta = {
    description = "Neovim plugin to edit R files";
    homepage = "https://github.com/R-nvim/R.nvim";
    license = lib.licenses.gpl3;
  };
}
