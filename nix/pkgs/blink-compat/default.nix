{
  lib,
  fetchFromGitHub,
  vimUtils,
}:

vimUtils.buildVimPlugin rec {
  pname = "blink.compat";
  version = "1.0.2";

  src = fetchFromGitHub {
    owner = "Saghen";
    repo = "blink.compat";
    rev = "v${version}";
    hash = "sha256-4uoehv/qe74IivgXc69ekYLod3Zo+oPUvXJHtt4wc2U=";
  };

  meta = {
    description = "Compatibility layer for using nvim-cmp sources on blink.cmp";
    homepage = "https://github.com/Saghen/blink.compat";
    license = lib.licenses.mit;
  };
}
