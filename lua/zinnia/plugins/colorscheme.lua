local colors = require("zinnia.colors")

return {
  "RRethy/base16-nvim",
  priority = 1000,

  init = function()
    local base16 = require("base16-colorscheme")

    base16.with_config { telescope_borders = true }
    base16.setup {
      base00 = colors.base00,
      base01 = colors.base01,
      base02 = colors.base02,
      base03 = colors.base03,
      base04 = colors.base04,
      base05 = colors.base05,
      base06 = colors.base06,
      base07 = colors.base07,
      base08 = colors.red,
      base09 = colors.magenta,
      base0A = colors.yellow,
      base0B = colors.green,
      base0C = colors.cyan,
      base0D = colors.blue,
      base0E = colors.magenta,
      base0F = colors.base0F,
    }

    -- Transparency
    -- background
    vim.cmd.highlight({ "Normal", "guibg=NONE", "ctermbg=NONE" })
    vim.cmd.highlight({ "NonText", "guibg=NONE", "ctermbg=NONE" })

    -- signcolumn
    vim.cmd.highlight({ "SignColumn", "guibg=NONE", "ctermbg=NONE" })
  end,
}
