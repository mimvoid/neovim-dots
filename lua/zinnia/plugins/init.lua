-- Plugins that do not need to be lazy loaded
require("zinnia.plugins.colorscheme")
require("zinnia.plugins.mini")

require("projectmarks").setup()

-- VimTeX
vim.g.vimtex_callback_progpath = "nvim"
vim.g.vimtex_enabled = true
vim.g.vimtex_view_method = "zathura"
