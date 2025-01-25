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

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },

    completion = {
      accept = { auto_brackets = { enabled = true } },
      draw = {
        columns = {
          { "kind_icon", "kind", gap = 1 },
          { "label", "label_description" },
        },
      },
      menu = { border = vim.g.borderStyle },
      documentation = {
        window = { border = vim.g.borderStyle },

        auto_show = true,
        auto_show_delay_ms = 200,
      },
    },

    snippets = { preset = "luasnip" },

    signature = { window = { border = vim.g.borderStyle } },
    triggers = { signature_help = { enabled = true } },
  },
  opts_extend = { "sources.default" },
}
