local b = require("zinnia.colors").base16
local c = require("zinnia.colors").hues

return {
  {
    "catppuccin/nvim",
    name = "catppuccin-nvim",
    priority = 1000,

    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,

    opts = {
      transparent_background = true,

      styles = {
        loops = { "italic" },
        types = { "italic" },
      },

      -- plugins
      default_integrations = false,
      integrations = {
        blink_cmp = true,
        mini = { enabled = true },
        markdown = true,
        rainbow_delimiters = true,
        snacks = { enabled = true },
        telescope = { enabled = true },
        treesitter = true,

        native_lsp = {
          enabled = true,
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
          inlay_hints = {
            background = true,
          },
        },
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
    },
  },
  {
    "rachartier/tiny-devicons-auto-colors.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",

    opts = function()
      local theme_colors = require("catppuccin.palettes").get_palette("frappe")
      return { colors = theme_colors }
    end
  },
}
