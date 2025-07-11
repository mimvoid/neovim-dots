return {
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6", --recommended as each new version will have breaking changes
    opts = { cmap = false },
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {
      opts = { enable_close_on_slash = true },
    },
  },
  { "andymass/vim-matchup" },
}
