-- From https://github.com/muhammadzkralla/zvim.nvim/blob/main/lua%2Fplugins%2Fnvim-jdtls.lua

return {
  "mfussenegger/nvim-jdtls",
  dependencies = { "nvim-lua/plenary.nvim" },
  ft = { "java" }, -- Automatically load for Java files

  opts = function()
    return {
      cmd = { vim.fn.exepath("jdtls") },
      root_dir = require("lspconfig").util.root_pattern(".git", "mvnw", "gradlew"),
      dap = { hotcodereplace = "auto", config_overrides = {} },
      dap_main = {},
      test = true,
      settings = {
        -- Disable semantic tokens
        semanticHighlighting = {
          enabled = false,
        },
      },
    }
  end,

  config = function(_, opts)
    local function attach_jdtls()
      local fname = vim.api.nvim_buf_get_name(0)
      local config = vim.tbl_extend("force", {
        cmd = opts.cmd,
        root_dir = opts.root_dir(fname),
        settings = opts.settings,
        on_attach = function(client, _)
          client.server_capabilities.semanticTokensProvider = nil -- Disable LSP semantic highlighting
        end,
      }, opts.jdtls or {})
      require("jdtls").start_or_attach(config)
    end

    -- Attach jdtls when a Java file is opened
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = attach_jdtls,
    })

    -- Attach jdtls initially for the first Java file opened
    attach_jdtls()
  end,
}
