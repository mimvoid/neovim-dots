-- Plugins that fall outside the structure of lz.n plugin specs
require("zinnia.plugins.colorscheme")
require("zinnia.plugins.debug")
require("zinnia.plugins.mini")
require("zinnia.plugins.snacks")
require("zinnia.plugins.snippets")
require("zinnia.plugins.blink")

-- VimTeX
vim.g.vimtex_callback_progpath = "nvim"
vim.g.vimtex_enabled = true
vim.g.vimtex_view_method = "zathura"
