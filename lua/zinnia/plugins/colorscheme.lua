local b = require("zinnia.colors").base16
local c = require("zinnia.colors").hues

local opts = {
  transparent_background = true,
  float = { transparent = true },

  styles = {
    loops = { "italic" },
    types = { "italic" },
  },

  lsp_styles = {
    virtual_text = {
      errors = { "italic" },
      hints = { "italic" },
      warnings = { "italic" },
      information = { "italic" },
      ok = { "italic" },
    },
    underlines = {
      errors = { "undercurl" },
      hints = { "undercurl" },
      warnings = { "undercurl" },
      information = { "undercurl" },
      ok = { "undercurl" },
    },
    inlay_hints = { background = true },
  },

  -- plugins
  default_integrations = false,
  integrations = {
    blink_cmp = { enabled = true },
    mini = { enabled = true },
    rainbow_delimiters = true,
    snacks = { enabled = true },
  },

  -- Set custom color palette, since I don't use frappe
  flavour = "frappe",

  background = {
    light = "latte",
    dark = "frappe",
  },

  color_overrides = {
    frappe = {
      text = b.base06,
      subtext1 = b.base05,
      subtext0 = b.base05,
      overlay2 = b.base04,
      overlay1 = b.base03,
      overlay0 = b.base0F,
      surface2 = b.base07,
      surface1 = b.base02,
      surface0 = b.base01,
      base = b.base00,
      mantle = b.base00,
      crust = b.base00,

      -- regular colors
      red = c.red,
      green = c.green,
      yellow = c.yellow,
      teal = c.cyan,
      blue = c.blue,
      pink = c.magenta,

      -- window colors
      lavender = c.cyan,
      rosewater = c.yellow,

      -- etc
      flamingo = c.yellow,
      mauve = c.magenta,
      maroon = c.red,
      peach = c.yellow,
      sky = c.cyan,
      sapphire = c.cyan,
    },
  },
}

require("catppuccin").setup(opts)
vim.cmd.colorscheme("catppuccin")
