local sources = require("zinnia.plugins.blink.sources")
local load = require("lz.n").load

load({
  "blink.cmp",
  after = function()
    require("blink.cmp").setup({
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
        window = { border = vim.g.borderStyle },
      },
    })
  end,
})

load({
  "blink.compat",
  after = function()
    require("blink.compat").setup({ impersonate_nvim_cmp = true })
  end,
})
