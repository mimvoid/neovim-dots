local nixcats = require("nixCatsUtils")

return {
  "nvim-lspconfig",
  after = function()
    -- Capabilties
    local client_caps = vim.lsp.protocol.make_client_capabilities()
    local capabilities = require("blink.cmp").get_lsp_capabilities(client_caps)
    vim.lsp.config("*", { capabilties = capabilities })

    -- Use mason outside Nix
    if not nixcats.isNixCats then
      vim.cmd.packadd("mason.nvim")
      require("mason").setup()
    end
  end,
}
