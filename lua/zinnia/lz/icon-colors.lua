local b = require("zinnia.colors").base16
local c = require("zinnia.colors").hues

return {
  "tiny-devicons-auto-colors.nvim",
  event = "DeferredUIEnter",

  after = function()
    local theme_colors = require("catppuccin.palettes").get_palette("frappe")
    require("tiny-devicons-auto-colors").setup({ colors = theme_colors })
  end,
}
