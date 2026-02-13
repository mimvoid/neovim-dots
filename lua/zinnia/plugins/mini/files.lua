require("mini.files").setup({
  mappings = { go_in_plus = "<cr>" },
  options = { permanent_delete = false, use_as_default_explorer = true },
  windows = { width_focus = 25, width_nofocus = 15 },
})

vim.keymap.set("n", "<leader>e", function()
  if vim.bo.buftype == "" then
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
  else
    MiniFiles.open()
  end
end, { desc = "Open mini.files" })

-- [[ Taken from Snacks.rename ]]

--- Lets LSP clients know that a file has been renamed
---@param from string
---@param to string
local function on_rename_file(from, to)
  local changes = {
    files = {
      {
        oldUri = vim.uri_from_fname(from),
        newUri = vim.uri_from_fname(to),
      }
    }
  }

  local clients = (vim.lsp.get_clients or vim.lsp.get_active_clients)()
  for _, client in ipairs(clients) do
    if client.supports_method("workspace/willRenameFiles") then
      local resp = client.request_sync("workspace/willRenameFiles", changes, 1000, 0)
      if resp and resp.result ~= nil then
        vim.lsp.util.apply_workspace_edit(resp.result, client.offset_encoding)
      end
    end
  end

  for _, client in ipairs(clients) do
    if client.supports_method("workspace/didRenameFiles") then
      client.notify("workspace/didRenameFiles", changes)
    end
  end
end

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesActionRename",
  callback = function(event)
    on_rename_file(event.data.from, event.data.to)
  end,
})
