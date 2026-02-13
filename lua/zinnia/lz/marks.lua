return {
  "marks.nvim",
  keys = {
    {
      "<leader>m",
      "<cmd>MarksQFListBuf<cr>",
      "List buffer marks",
    },
    {
      "<leader>M",
      "<cmd>MarksQFListAll<cr>",
      "List all marks",
    },
  },
  after = function()
    require("marks").setup({ default_mappings = true, signs = true, mappings = {} })
  end,
}
