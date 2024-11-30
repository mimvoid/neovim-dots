local sources = require("zinnia.plugins.blink.sources")

-- Set highlight groups
local groups = {
  BlinkCmpLabel = { link = "Normal" },
  BlinkCmpMenu = { link = "NormalFloat" },
  BlinkCmpMenuBorder = { link = "FloatBorder" },
  BlinkCmpMenuSelection = { link = "Visual" },
}

for k, v in pairs(groups) do
  vim.api.nvim_set_hl(0, k, v)
end

return {
  "Saghen/blink.cmp",
  version = "v0.*",

  lazy = false,

  dependencies = {
    "rafamadriz/friendly-snippets",
  },

  ---@module "blink.cmp"
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "default" },
    sources = sources,

    accept = { auto_brackets = { enabled = true } },
    highlight = { use_nvim_cmp_as_default = true },
    nerd_font_variant = "mono",
    triggers = { signature_help = { enabled = true } },

    windows = {
      autocomplete = {
        border = vim.g.borderStyle,
      },
      documentation = {
        border = vim.g.borderStyle,
        auto_show = true,
      },
      signature_help = {
        border = vim.g.borderStyle,
      },
    },
  },
  opts_extend = { "sources.completion.enabled_providers" },
}
