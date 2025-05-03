local lsps = {
  "bashls",
  "ruff",
  "clangd",
  "gopls",
  "nixd",
  "texlab",
  "ts_ls",
  "vala_ls",
}

for _, v in ipairs(lsps) do
  if vim.fn.executable(vim.fn.exepath(v)) then
    vim.lsp.enable(v)
  end
end

local lsps_with_config = {
  basedpyright = {
    settings = {
      basedpyright = {
        analysis = {
          typeCheckingMode = "off",
          inlayHints = {
            variableTypes = false,
            callArgumentNames = false,
            functionReturnTypes = false,
          },
        },
      },
    },
  },
  nim_langserver = {
    settings = {
      nim = {
        nimsuggestPath = "~/.nimble/bin/custom_lang_server_build"
      },
    },
  },
}

for k, v in pairs(lsps_with_config) do
  if vim.fn.executable(vim.fn.exepath(k)) then
    vim.lsp.config(k, v)
    vim.lsp.enable(k)
  end
end

return vim.tbl_extend("keep", lsps, vim.tbl_keys(lsps_with_config))
