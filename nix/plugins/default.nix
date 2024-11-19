{ pkgs, ... }:

{
  imports = [
    ./cmp.nix
    ./languages.nix
    ./looks.nix
    ./marks.nix
    ./misc.nix
    ./treesitter.nix
    ./typing.nix
  ];

  plugins = with pkgs.vimPlugins; [
    lazy-nvim
    nvim-lspconfig
    # nvim-dap
  ];
}
