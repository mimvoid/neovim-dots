return {
  "gcmt/vessel.nvim",
  event = "VeryLazy",

  keys = {
    {
      "<leader>m",
      "<cmd>lua require('vessel').view_marks()<cr>",
      desc = "View marks with vessel.nvim",
    },
    {
      "<leader><leader>",
      "<cmd>lua require('vessel').view_buffers()<cr>",
      desc = "View open buffers with vessel.nvim",
    },
    {
      "<leader>vj",
      "<cmd>lua require('vessel').view_jumps()<cr>",
      desc = "View jump list with vessel.nvim",
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

    marks = { decorations = { "│ ", "└ " } },
    buffers = { view = "tree" },
  },
}
