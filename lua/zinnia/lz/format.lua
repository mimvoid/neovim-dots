return {
  "conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },

  keys = {
    {
      "<leader>bf",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      desc = "[F]ormat buffer",
    },
  },

  after = function()
    local prettier = { "prettierd", "prettier", stop_after_first = true }

    require("conform").setup({
      formatters_by_ft = {
        ["_"] = { "trim_whitespace", "trim_newlines" },

        c = { "clang-format" },
        cpp = { "clang-format" },

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
        nix = { "nixfmt" },
        ocaml = { "ocamlformat" },
      },

      notify_on_error = false,
    })
  end,
}
