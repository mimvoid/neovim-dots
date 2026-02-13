return {
  "tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  after = function()
    require("tiny-inline-diagnostic").setup({
      preset = "classic",
      transparent_bg = true,
      options = {
        show_source = {
          enabled = true,
          if_many = true,
        },
        multilines = {
          enabled = true,
          tabstop = 2,
          severity = {
            vim.diagnostic.severity.WARN,
            vim.diagnostic.severity.ERROR,
          },
        },
      },
    })

    -- Disable Neovim's default virtual text diagnostics
    vim.diagnostic.config({ virtual_text = false })
  end,
}
