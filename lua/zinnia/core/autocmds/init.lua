-- [[ Autocommands ]]

local load_diagnostic_icons = require("zinnia.core.autocmds.diagnostics")
local augroup = vim.api.nvim_create_augroup("zinnia", { clear = true })

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = augroup,
  callback = vim.highlight.on_yank,
})

vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Set Neovim terminal settings",
  group = augroup,
  callback = function()
    -- Don't show line numbers
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  desc = "Detect go templates in html",
  pattern = "*.html",
  group = augroup,
  callback = function()
    if vim.fn.search("{{") ~= 0 then
      vim.opt.filetype = "gotmpl"
    end
  end,
})

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    load_diagnostic_icons()

    ---@param keys string
    ---@param desc string
    ---@param mode? string | string[]
    local function map(keys, func, desc, mode)
      vim.keymap.set(mode or "n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    -- Rename variable under cursor
    map("<leader>rn", vim.lsp.buf.rename, "Rename")

    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate
    map("<leader>ca", vim.lsp.buf.code_action, "Code action", { "n", "x" })

    --  For example, in C this would take you to the header
    map("gD", vim.lsp.buf.declaration, "Go to declaration")

    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client then
      -- Highlight references
      if client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
        local hl_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

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
          group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
          callback = function(event2)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
          end,
        })
      end

      -- Toggle inlay hints if the lsp supports them
      if client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
        map("<leader>ih", function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
        end, "[T]oggle Inlay [H]ints")
      end
    end
  end,
})
