return {
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "BartSte/nvim-project-marks",
    lazy = false,
    config = function()
      require("projectmarks").setup({})
    end,
  },

  {
    "gcmt/vessel.nvim",
    event = "VeryLazy",

    keys = {
      {
        "<leader>m",
        "<cmd>lua require('vessel').view_marks()<cr>",
        desc = "View marks with vessel.nvim",
      },
    },

    opts = {
      window = {
        options = { border = vim.g.borderStyle },
        width = function()
          return vim.o.columns < 120 and { 70, 70 } or { 60, 70 }
        end,
      },

      preview = {
        options = { border = vim.g.borderStyle },
        position = "bottom",
        min_height = 12,
      },
    },
  },
}
