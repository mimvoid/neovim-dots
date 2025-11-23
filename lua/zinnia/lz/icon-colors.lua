local b = require("zinnia.colors").base16
local c = require("zinnia.colors").hues

return {
  "rachartier/tiny-devicons-auto-colors.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",

  opts = function()
    local theme_colors = require("catppuccin.palettes").get_palette("frappe")
    return { colors = theme_colors }
  end
}
