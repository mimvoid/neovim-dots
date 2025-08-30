{
  lib,
  fetchFromGitHub,
  vimUtils,
}:

vimUtils.buildVimPlugin rec {
  pname = "nvim-project-marks";
  version = "0.2.1";

  src = fetchFromGitHub {
    owner = "BartSte";
    repo = "nvim-project-marks";
    rev = version;
    hash = "sha256-tDw0mKDSYwJkOoWcw4G0cmgJK1+s0vVU/+OGxsDOM7w=";
  };

  meta = {
    description = "Minimal plugin for Neovim that stores file marks in a local ShaDa file.";
    homepage = "https://github.com/BartSte/nvim-project-marks";
    license = lib.licenses.mit;
  };
}
