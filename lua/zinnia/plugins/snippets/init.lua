local snippets = require("zinnia.plugins.snippets.all")
local load = require("lz.n").load

load({ "friendly-snippets" })
load({
  "luasnip",
  after = function()
    -- for friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    local ls = require("luasnip")

    ls.config.set_config({
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
    })

    ls.add_snippets("all", snippets(ls))
  end,
})
