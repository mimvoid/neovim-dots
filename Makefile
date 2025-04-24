all:

run:
	nix build && ./result/bin/nvim
