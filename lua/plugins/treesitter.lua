local utils = require("utils")

return {
  "nvim-treesitter/nvim-treesitter",
  build = utils.set(":TSUpdate"),

  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  main = "nvim-treesitter.configs",

  opts = {
    auto_install = false,

    highlight = {
      enable = true,
      disable = { "latex" },
    },

    indent = { enable = true, disable = { "ruby" } },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<leader>s",
        node_decremental = "<bs>",
        node_incremental = "<leader>s",
      },
    },
  },
}
