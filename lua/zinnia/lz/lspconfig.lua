return {
  "nvim-lspconfig",

  --[[
  dependencies = {
    {
      "williamboman/mason.nvim",
      enabled = utils.set(true, false),
      config = true,
    }, -- NOTE: Must be loaded before dependants
    {
      "williamboman/mason-lspconfig.nvim",
      enabled = utils.set(true, false),
    },
  },
  ]]

  after = function()
    -- Capabilties
    local capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
    vim.lsp.config("*", { capabilties = capabilities })

    -- Packages
    --[[
    if not utils.isNix then
      -- Use mason outside Nix
      require("mason").setup()
      require("mason-lspconfig").setup({ ensure_installed = servers })
    end
    --]]
  end,
}
