local M = {}

M.LazyFile = { "BufReadPost", "BufNewFile", "BufWritePre" }

-- Add boolean values to this table
M.isNix = vim.g.nix ~= nil

-- Add the set function to this table,
-- we can now call it with require("utils").set(a, b)
function M.set(nonNix, nix)
  return vim.g.nix and nix or nonNix
end

return M
