{
  lib,
  fetchFromGitHub,
  vimUtils,
}:

vimUtils.buildVimPlugin rec {
  pname = "vessel.nvim";
  version = "2.4.1";

  src = fetchFromGitHub {
    owner = "gcmt";
    repo = "vessel.nvim";
    rev = "v${version}";
    hash = "sha256-biz3MnYAHaBiJ6O3zlBERmiRun5w26YAco2Z80AF3f8=";
  };

  meta = {
    description = " Enhanced Neovim navigation ";
    homepage = "https://github.com/gcmt/vessel.nvim";
    license = lib.licenses.mit;
  };
}
