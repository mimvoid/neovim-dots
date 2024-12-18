local starter = require("zinnia.plugins.mini.mini-starter")
local hipatterns = require("zinnia.plugins.mini.mini-hipatterns")
local clue = require("zinnia.plugins.mini.mini-clue")

return {
  "echasnovski/mini.nvim",
  lazy = false,

  keys = {
    {
      "<leader>e",
      "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0), false)<cr>",
      desc = "Open mini.files",
    },
  },

  config = function()
    require("mini.ai").setup({ n_lines = 500 })
    require("mini.move").setup({})
    require("mini.surround").setup({})

    -- Use the tables from the other files
    require("mini.starter").setup(starter)
    require("mini.hipatterns").setup(hipatterns)

    require("mini.clue").setup({
      clues = {
        require("mini.clue").gen_clues.builtin_completion(),
        require("mini.clue").gen_clues.g(),
        require("mini.clue").gen_clues.marks(),
        require("mini.clue").gen_clues.registers(),
        require("mini.clue").gen_clues.windows(),
        require("mini.clue").gen_clues.z(),
      },
      triggers = clue.triggers,
    })

    require("mini.diff").setup({
      view = {
        priority = 5,
        signs = { add = "┃", change = "┃", delete = "▁" },
        style = "sign",
      },
    })

    require("mini.files").setup({
      mappings = { go_in_plus = "<cr>" },
      options = { permanent_delete = false, use_as_default_explorer = true },
      windows = { width_focus = 25, width_nofocus = 15 },
    })
  end,
}
