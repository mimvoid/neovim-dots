require("zinnia.core.globals")
require("zinnia.core.options")
require("zinnia.core.keymaps")
require("zinnia.core.autocmds")
require("zinnia.core.lsps")

-- Built-in plugins

vim.cmd.packadd("nvim.undotree")
vim.keymap.set("n", "<leader>u", require("undotree").open)
