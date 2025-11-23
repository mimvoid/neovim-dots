local M = {}

function M.default(_)
  local success, node = pcall(vim.treesitter.get_node)
  if success and node and vim.tbl_contains({ "comment", "line_comment", "block_comment" }, node:type()) then
    return { "buffer" }
  end
  return { "path", "lsp", "snippets", "buffer" }
end

M.providers = {
  path = { opts = { trailing_slash = false } },
  lsp = { min_keyword_length = 1 },
}

return M
