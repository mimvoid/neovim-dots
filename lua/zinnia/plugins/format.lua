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
      go = { "gofmt" },
      html = { "prettierd" },
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      json = { "prettierd" },
      lua = { "stylua" },
      markdown = { "prettierd" },
      nim = { "nimpretty" },
      scss = { "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      yaml = { "prettierd" },
    },

    notify_on_error = false,
  },
}
