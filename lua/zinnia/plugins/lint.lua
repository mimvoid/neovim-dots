return {
  "mfussenegger/nvim-lint",

  keys = {
    {
      "<leader>bl",
      function() require("lint").try_lint() end,
      mode = "n",
      desc = "Lint buffer",
    },
  },

  config = function()
    require("lint").linters_by_ft = {
      c = { "clangtidy" },
      cpp = { "clangtidy" },
      bash = { "bash" },
      latex = { "chktex" },
      lua = { "selene" },
      markdown = { "markdownlint-cli2" },
      nix = { "statix" },
      zsh = { "zsh" },
    }
  end,
}
