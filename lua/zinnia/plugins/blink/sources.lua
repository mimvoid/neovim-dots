local M = {}

M.default = function(ctx)
  local success, node = pcall(vim.treesitter.get_node)
  if success and node and vim.tbl_contains({ "comment", "line_comment", "block_comment" }, node:type()) then
    return { "buffer" }
  else
    return { "path", "lsp", "snippets", "buffer" }
  end
end

M.providers = {
  path = { opts = { trailing_slash = false } },
  lsp = { min_keyword_length = 1 },

  -- cmp_r = {
  --   name = 'cmp_r',
  --   module = 'blink.compat.source',
  --   opts = { impersonate_nvim_cmp = true, },
  -- },
}

return M
