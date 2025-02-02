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
      require("projectmarks").setup()
    end,
  },
}
