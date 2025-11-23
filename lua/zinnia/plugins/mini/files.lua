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
