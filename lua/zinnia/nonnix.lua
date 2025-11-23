-- Load plugins via Paq when not on Nix

require("nixCatsUtils.catPaq").setup({
  -- Startup --
  { "lumen-oss/lz.n" },
  { "nvim-mini/mini.nvim" },
  { "catppuccin/nvim" },
  { "lervag/vimtex" },

  -- Optionals --
  { "folke/snacks.nvim", opt = true },
  { "nmac427/guess-indent.nvim", opt = true },
  { "chentoast/marks.nvim", opt = true },

  -- lsps & diagnostics
  { "neovim/nvim-lspconfig", opt = true },
  { "williamboman/mason.nvim", opt = true },
  { "williamboman/mason-lspconfig.nvim", opt = true },

  -- lint and format
  { "mfussenegger/nvim-lint", opt = true },
  { "stevearc/conform.nvim", opt = true },

  -- treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", opt = true },
  { "RRethy/nvim-treesitter-endwise", opt = true },

  -- looks
  { "nvim-tree/nvim-web-devicons", opt = true },
  { "nvim-lualine/lualine.nvim", opt = true },
  { "rachartier/tiny-devicons-auto-colors.nvim", opt = true },
  { "HiPhish/rainbow-delimiters.nvim", opt = true },
  { "brenoprata10/nvim-highlight-colors", opt = true },

  -- completion
  { "L3MON4D3/LuaSnip", opt = true, as = "luasnip" },
  { "rafamadriz/friendly-snippets", opt = true },
  { "Saghen/blink.cmp", opt = true },
  { "Saghen/blink.compat", opt = true },

  -- debug
  { "mfussenegger/nvim-dap", opt = true },
  { "miroshQa/debugmaster.nvim", opt = true },

  -- typing
  { "altermo/ultimate-autopair.nvim", opt = true },
  { "windwp/nvim-ts-autotag", opt = true },
  { "kawre/neotab.nvim", opt = true },
})
