local nixcats = require("nixCatsUtils")

return {
  "nvim-lspconfig",
  after = function()
    -- Capabilties
    local capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
    vim.lsp.config("*", { capabilties = capabilities })

    if not nixcats.isNixCats then
      -- Use mason outside Nix
      local load = require("lz.n").load
      load({
        { "mason.nvim", lazy = false },
        { "mason-lspconfig.nvim", lazy = false },
      })

      require("mason").setup()
      require("mason-lspconfig").setup({ ensure_installed = servers })
    end
  end,
}
