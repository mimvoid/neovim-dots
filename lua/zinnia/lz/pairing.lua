return {
  {
    "ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    after = function()
      require("ultimate-autopair").setup({ cmap = false })
    end,
  },
  {
    "nvim-ts-autotag",
    after = function()
      require("nvim-ts-autotag").setup({ opts = { enable_close_on_slash = true } })
    end,
  },
}
