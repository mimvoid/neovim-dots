local palette = require("zinnia.colors").base16

return {
  "RRethy/base16-nvim",
  priority = 1000,

  init = function()
    local base16 = require("base16-colorscheme")

    base16.with_config({ telescope_borders = true })
    base16.setup(palette)

    -- Transparency
    -- background
    vim.cmd.highlight({ "Normal", "guibg=NONE", "ctermbg=NONE" })
    vim.cmd.highlight({ "NonText", "guibg=NONE", "ctermbg=NONE" })

    -- signcolumn
    vim.cmd.highlight({ "SignColumn", "guibg=NONE", "ctermbg=NONE" })

    -- Window split borders
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = palette.base03 })
  end,
}
