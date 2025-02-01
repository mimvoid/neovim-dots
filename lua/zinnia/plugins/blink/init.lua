local sources = require("zinnia.plugins.blink.sources")

return {
  "Saghen/blink.cmp",
  version = "v0.*",
  lazy = false,

  dependencies = {
    "rafamadriz/friendly-snippets",
    { "L3MON4D3/LuaSnip", version = "v2.*" },
  },

  ---@module "blink.cmp"
  ---@type blink.cmp.Config
  opts = {
    sources = sources,

    keymap = { preset = "default" },

    appearance = { nerd_font_variant = "mono" },

    completion = {
      menu = {
        border = vim.g.borderStyle,
        draw = {
          columns = {
            { "kind_icon" },
            { "label", "label_description" },
          },
          treesitter = { "lsp" },
        },
      },
      documentation = {
        window = { border = vim.g.borderStyle },
        auto_show = true,
        auto_show_delay_ms = 200,
      },
    },

    snippets = { preset = "luasnip" },

    signature = {
      enabled = true,
      window = { border = vim.g.borderStyle }
    },
  },
  opts_extend = { "sources.default" },
}
