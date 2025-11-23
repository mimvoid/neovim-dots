return {
  { "nvim-treesitter-endwise" },
  {
    "nvim-treesitter",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    after = function()
      require("nvim-treesitter").setup({
        auto_install = false,

        endwise = { enable = true }, -- For nvim-treesitter-endwise
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
      })
    end,
  }
}
