local snippets = require("zinnia.plugins.snippets.all")

return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  dependences = { "rafamadriz/friendly-snippets" },

  config = function()
    -- for friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    local ls = require("luasnip")

    ls.config.set_config({
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
    })

    ls.add_snippets("all", snippets(ls))
  end
}
