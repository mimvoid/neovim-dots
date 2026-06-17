-- LSPs without settings
local lsps = {
  "bashls",
  "ruff",
  "clangd",
  "gopls",
  "jdtls",
  "nixd",
  "rust_analyzer",
  "teal_ls",
  "texlab",
  "vala_ls",
  "vtsls",
}
for i = 1, #lsps do
  vim.lsp.enable(lsps[i])
end

-- LSPs with settings
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
  emmylua_ls = {
    settings = {
      runtime = { version = "LuaJIT" },
      completion = { callSnippet = true },
    },
  },
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT", -- Probably the most often used
        },
        completion = { callSnippet = "Replace" },
        diagnostics = {
          disable = { "missing-fields" }, -- Ignore noisy `missing-fields` warnings
          globals = { "vim" },
        },
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  },
  nim_langserver = {
    settings = {
      nim = {
        nimsuggestPath = "~/.nimble/bin/custom_lang_server_build",
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

for lsp, config in pairs(lsps_with_config) do
  vim.lsp.config(lsp, config)
  vim.lsp.enable(lsp)
end

-- Kotlin LSP may have different ways to launch
if vim.fn.executable(vim.fn.exepath("kotlin-lsp")) == 1 then
  vim.lsp.config("kotlin_lsp", { cmd = { "kotlin-lsp", "--stdio" } })
  vim.lsp.enable("kotlin_lsp")
elseif vim.fn.executable(vim.fn.exepath("intellij-server")) == 1 then
  vim.lsp.enable("kotlin_lsp")
end
