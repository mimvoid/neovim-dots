local utils = require("zinnia.utils")

return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "RRethy/nvim-treesitter-endwise" },

  build = utils.set(":TSUpdate"),

  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  main = "nvim-treesitter.configs",

  opts = {
    -- For nvim-treesitter-endwise
    endwise = { enable = true },

    auto_install = false,

    matchup = { enable = true },

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
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
