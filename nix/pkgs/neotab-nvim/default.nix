{
  # lib,
  fetchFromGitHub,
  vimUtils,
}:

vimUtils.buildVimPlugin {
  pname = "neotab.nvim";
  version = "unstable-2024-11-11";

  src = fetchFromGitHub {
    owner = "kawre";
    repo = "neotab.nvim";
    rev = "6c6107dddaa051504e433608f59eca606138269b";
    hash = "sha256-bSFKbjj8fJHdfBzYoQ9l3NU0GAYfdfCbESKbwdbLNSw=";
  };

  meta = {
    description = "Tabout plugin for Neovim";
    homepage = "https://github.com/kawre/neotab.nvim";
    # license = lib.;
  };
}
