local snippets = require("zinnia.plugins.snippets.all")

vim.cmd.packadd("friendly-snippets")
vim.cmd.packadd("luasnip")

-- for friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

local luasnip = require("luasnip")

luasnip.config.set_config({
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
})

luasnip.add_snippets("all", snippets(luasnip))
