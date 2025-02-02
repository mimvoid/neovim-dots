require("zinnia.plugins.lsp.extra")

local utils = require("zinnia.utils")
local servers = require("zinnia.plugins.lsp.servers")

return {
  "neovim/nvim-lspconfig",

  dependencies = {
    { "Saghen/blink.cmp" },
    {
      "williamboman/mason.nvim",
      enabled = utils.set(true, false),
      config = true,
    }, -- NOTE: Must be loaded before dependants
    {
      "williamboman/mason-lspconfig.nvim",
      enabled = utils.set(true, false),
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      enabled = utils.set(true, false),
    },
  },

  config = function()
    local lspconfig = require("lspconfig")

    -- Capabilties
    -- merge blink.cmp with opts[server].capabilities, if defined
    for server, config in pairs(servers) do
      config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end

    -- Packages
    -- Use Nix or Meson as the package manager
    if utils.isNix then
      -- Use nixPatch if in Nix
      for server_name, _ in pairs(servers) do
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
          cmd = (servers[server_name] or {}).cmd,
          root_pattern = (servers[server_name] or {}).root_pattern,
        })
      end
    else
      -- Use mason outside Nix
      require("mason").setup()

      local ensure_installed = vim.tbl_keys(servers or {})
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      })
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        local tele = require("telescope.builtin")

        -- Jump to the definition of the word under your cursor.
        --  To jump back, press <C-t>.
        map("gd", tele.lsp_definitions, "[G]oto [D]efinition")
        map("gr", tele.lsp_references, "[G]oto [R]eferences")
        map("gI", tele.lsp_implementations, "[G]oto [I]mplementation")
        map("<leader>D", tele.lsp_type_definitions, "Type [D]efinition")

        -- Fuzzy find all symbols in current document (variables, functions, types, etc.)
        map("<leader>ds", tele.lsp_document_symbols, "[D]ocument [S]ymbols")

        -- Fuzzy find all the symbols in current workspace (entire project)
        map("<leader>ws", tele.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

        -- Rename the variable under your cursor.
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

        --  For example, in C this would take you to the header.
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local hl_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })

          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = hl_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = hl_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
            end,
          })
        end

        -- Toggle inlay hints if the lsp supports them
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          map("<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
          end, "[T]oggle Inlay [H]ints")
        end
      end,
    })
  end,
}
