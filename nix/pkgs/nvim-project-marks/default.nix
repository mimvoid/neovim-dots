{
  lib,
  fetchFromGitHub,
  vimUtils,
}:

vimUtils.buildVimPlugin rec {
  pname = "nvim-project-marks";
  version = "0.2.0";
  
  src = fetchFromGitHub {
    owner = "BartSte";
    repo = "nvim-project-marks";
    rev = version;
    hash = "sha256-/LC/URb4sEURa7S9Ht20k9eTbJ3tZCvkHRwcxlBfra0=";
  };

  meta = {
    description = "Minimal plugin for Neovim that stores file marks in a local ShaDa file.";
    homepage = "https://github.com/BartSte/nvim-project-marks";
    license = lib.licenses.mit;
  };
}
