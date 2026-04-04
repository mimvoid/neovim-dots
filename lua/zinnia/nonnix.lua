-- Install and load plugins via vim.pack when not on Nix

vim.pack.add{
  -- Startup --
  "https://github.com/lumen-oss/lz.n",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/catppuccin/nvim",
  "https://github.com/lervag/vimtex",

  -- Optionals --
  "https://github.com/Darazaki/indent-o-matic.nvim",
  "https://github.com/chentoast/marks.nvim",

  -- lsps & diagnostics
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/rachartier/tiny-inline-diagnostic.nvim",

  -- lint and format
  "https://github.com/mfussenegger/nvim-lint",
  "https://github.com/stevearc/conform.nvim",

  -- treesitter
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/RRethy/nvim-treesitter-endwise",

  -- looks
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/rachartier/tiny-devicons-auto-colors.nvim",
  "https://github.com/HiPhish/rainbow-delimiters.nvim",
  "https://github.com/brenoprata10/nvim-highlight-colors",

  -- completion
  { src = "https://github.com/L3MON4D3/LuaSnip", name = "luasnip" },
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/saghen/blink.compat",

  -- debug
  "https://github.com/mfussenegger/nvim-dap",
  "https://github.com/MironPascalCaseFan/debugmaster.nvim",

  -- typing
  "https://github.com/altermo/ultimate-autopair.nvim",
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/kawre/neotab.nvim",
})

-- Update treesitter parsers when nvim-treesitter updates
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function()
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
      vim.cmd("TSUpdate")
    end
  end,
})
