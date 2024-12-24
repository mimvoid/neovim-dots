return {
  bashls = {},

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
  ruff = {},

  gopls = {},

  -- lua_ls = {
  --   settings = {
  --     Lua = {
  --       completion = {
  --         callSnippet = "Replace",
  --       },
  --       -- Ignore Lua_LS's noisy `missing-fields` warnings
  --       diagnostics = { disable = { "missing-fields" } },
  --     },
  --   },
  -- },
  --
  marksman = {},
  nixd = {},

  nim_langserver = {
    settings = {
      nim = {
        nimsuggestPath = "~/.nimble/bin/custom_lang_server_build"
      },
    },
  },

  texlab = {},
  ts_ls = {},
}
