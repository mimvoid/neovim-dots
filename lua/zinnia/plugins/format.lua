return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },

  keys = {
    {
      "<leader>bf",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },

  opts = {
    formatters_by_ft = {
      _ = { "trim_whitespace", "trim_newlines" },
      css = { "prettierd" },
      html = { "prettierd" },
      javascript = { "prettierd" },
      lua = { "stylua" },
      markdown = { "prettierd" },
      scss = { "prettierd" },
      typescript = { "prettierd" },
    },

    notify_on_error = false,
  },
}
