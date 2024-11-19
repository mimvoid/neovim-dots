{
  description = "My neovim config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixPatch = {
      url = "github:NicoElbers/nixPatch-nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixPatch, ... }:
  let
    # Copied from flake utils
    eachSystem = with builtins; systems: f:
      let
      # Merge together the outputs for all systems.
      op = attrs: system:
        let
          ret = f system;
          op = attrs: key: attrs //
            {
              ${key} = (attrs.${key} or { })
              // { ${system} = ret.${key}; };
            };
        in
        foldl' op attrs (attrNames ret);
      in
      foldl' op { }
      (systems
        ++ # add the current system if --impure is used
        (if builtins ? currentSystem then
           if elem currentSystem systems
           then []
           else [ currentSystem ]
        else []));

    forEachSystem = eachSystem nixpkgs.lib.platforms.all;
  in
  let
    # Easily configure a custom name, this will affect the name of the standard
    # executable, you can add as many aliases as you'd like in the configuration.
    name = "nvim";

    extra_pkg_config = { };

    configuration = { pkgs, ... }: {
      luaPath = "${./.}";

      # --------- Plugins ----------

      plugins = 
        let
          blink-compat = pkgs.callPackage ./nix/pkgs/blink-compat { };
          cmp-r = pkgs.callPackage ./nix/pkgs/cmp-r { };
          r-nvim = pkgs.callPackage ./nix/pkgs/r-nvim { };
          nvim-project-marks = pkgs.callPackage ./nix/pkgs/nvim-project-marks { };
          neotab = pkgs.callPackage ./nix/pkgs/neotab-nvim { };
        in
        with pkgs.vimPlugins;
        let
          cmp = [
            blink-cmp
            blink-compat

            luasnip
            friendly-snippets
            cmp-r
          ];

          languages = [
            r-nvim
            vimtex
          ];

          looks = [
            base16-nvim

            lualine-nvim
            bufferline-nvim
            alpha-nvim
            nvim-web-devicons

            rainbow-delimiters-nvim
            nvim-highlight-colors
          ];

          marks = [
            marks-nvim
            nvim-project-marks
          ];

          treesitter = [
            (pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins: with plugins;
              let
                required_langs = [ c lua vim vimdoc query markdown markdown_inline ];
              in
              [
                nix lua bash css scss html latex python r
                javascript typescript rust
                xml json toml yaml hyprlang
                csv tsv
                git_config git_rebase gitattributes gitignore
                cmake
                comment
                bibtex
                gnuplot
              ] ++ required_langs
            ))
          ];

          typing = [
            ultimate-autopair-nvim
            neotab
            fcitx-vim
          ];
        in
        with pkgs.vimPlugins; [
          lazy-nvim
          nvim-lspconfig
          mini-nvim
          telescope-nvim
          plenary-nvim
        ]
        ++ cmp ++ languages ++ looks ++ marks ++ treesitter ++ typing;

      # --------- Runtime Dependencies ---------
      runtimeDeps = with pkgs;
        let
          # lsps & formatters
          go = [ gopls gotools go-tools ];
          bash = bash-language-server;
          latex = texlab;
          lua = [ lua-language-server stylua ];
          markdown = marksman;
          nix = nixd;
          python = [ basedpyright ruff ];
          rust = rust-analyzer;
          typescript = typescript-language-server;

          langs = pkgs.lib.lists.flatten [ latex lua markdown nix python ];
        in
        [
          stdenv.cc.cc
          tree-sitter
          ripgrep
          prettierd
        ] ++ langs;

      environmentVariables = { };

      aliases = [ ];

      # Extra wrapper args you want to pass.
      extraWrapperArgs = [ ];

      python3Packages = [ ];
      extraPython3WrapperArgs = [ ];
      luaPackages = [ ];

      sharedLibraries = [ ];

      # Extra lua configuration put at the top of your init.lua
      extraConfig = [ ];

      # customSubs = with patchUtils; [ ];

      settings = {
        withNodeJs = false;
        withRuby = false;
        withPerl = false;
        withPython3 = false;
        extraName = "";
        configDirName = "nvim";
        neovim-unwrapped = null;

        patchSubs = true; # original repo patches
        suffix-path = false; # runtime dependencies
        suffix-LD = false; # shared libraries dependencies
      };
    };
  in
  forEachSystem (system: {
    packages.default =
      nixPatch.configWrapper.${system} { inherit configuration extra_pkg_config name; };
  });
}
