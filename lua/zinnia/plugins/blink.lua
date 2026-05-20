local load = require("lz.n").load

vim.cmd.packadd("blink.cmp")
require("blink.cmp").setup({
  sources = {
    providers = {
      path = { opts = { trailing_slash = false } },
      lsp = { min_keyword_length = 1 },
    },
  },

  keymap = { preset = "default" },
  appearance = { nerd_font_variant = "mono" },

  completion = {
    menu = {
      border = vim.g.winborder,
      draw = {
        columns = {
          { "kind_icon" },
          { "label", "label_description" },
        },
        treesitter = { "lsp" },
      },
    },
    documentation = {
      window = { border = vim.g.winborder },
      auto_show = true,
      auto_show_delay_ms = 200,
    },
  },

  snippets = { preset = "luasnip" },

  signature = {
    enabled = true,
    window = { border = vim.g.winborder },
  },
})

vim.cmd.packadd("blink.compat")
require("blink.compat").setup({ impersonate_nvim_cmp = true })
