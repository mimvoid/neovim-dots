local lsps = {
  "bashls",
  "ruff",
  "clangd",
  "gopls",
  "nixd",
  "rust_analyzer",
  "texlab",
  "vala_ls",
  "vtsls",
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
  lua_ls = {
    settings = {
      Lua = {
        completion = { callSnippet = "Replace" },
        -- Ignore noisy `missing-fields` warnings
        diagnostics = { disable = { "missing-fields" } },
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
  rust_analyzer = {
    settings = {
      cargo = {
        allFeatures = true,
        buildScripts = false,
      },
      completion = {
        fullFunctionSignatures = { enable = true },
      },
      rustfmt = { enable = true },
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
