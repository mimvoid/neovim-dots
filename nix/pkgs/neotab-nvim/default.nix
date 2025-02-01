{
  lib,
  fetchFromGitHub,
  vimUtils,
}:

vimUtils.buildVimPlugin {
  pname = "neotab.nvim";
  version = "unstable-2025-02-01";

  src = fetchFromGitHub {
    owner = "kawre";
    repo = "neotab.nvim";
    rev = "f6ed1ef49f32586f5db95edae5d6f264c8180d85";
    hash = "sha256-5IJQwZxDGDMM6KBWKU/EZwa5wciHeTXOZgHPCRmlxJk=";
  };

  meta = {
    description = "Tabout plugin for Neovim";
    homepage = "https://github.com/kawre/neotab.nvim";
    license = lib.licenses.mit;
  };
}
