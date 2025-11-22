return function()
  local lsps = {
    "bashls",
    "ruff",
    "clangd",
    "gopls",
    "nixd",
    "rust_analyzer",
    "teal_ls",
    "texlab",
    "vala_ls",
    "vtsls",
  }

  for i = 1, #lsps do
    local v = lsps[i]
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

  for k, v in pairs(lsps_with_config) do
    if vim.fn.executable(vim.fn.exepath(k)) then
      vim.lsp.config(k, v)
      vim.lsp.enable(k)
    end
  end

  return vim.tbl_extend("keep", lsps, vim.tbl_keys(lsps_with_config))
end
