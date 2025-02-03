local prettier = { "prettierd", "prettier", stop_after_first = true }

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
      ["_"] = { "trim_whitespace", "trim_newlines" },

      css = prettier,
      javascript = prettier,
      javascriptreact = prettier,
      typescript = prettier,
      typescriptreact = prettier,
      json = prettier,

      scss = prettier,
      html = prettier,
      markdown = prettier,
      yaml = prettier,

      go = { "gofmt" },
      latex = { "latexindent" },
      lua = { "stylua" },
      nim = { "nimpretty" },
      ocaml = { "ocamlformat" },
    },

    notify_on_error = false,
  },

  formatters = {
    biome = {
      args = { "format", "--indent-style=space", "--stdin-file-path", "$FILENAME" },
    },
  },
}
