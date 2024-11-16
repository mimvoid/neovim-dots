-- Don't yank empty lines with dd
vim.keymap.set("n", "dd", function()
  if vim.fn.getline("."):match("^%s*$") then
    return '"_dd'
  end
  return "dd"
end, { expr = true, silent = true })

-- Insert mode navigation
vim.keymap.set("i", "<A-j>", "<Down>", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<Up>", { desc = "Move up" })
vim.keymap.set("i", "<A-h>", "<Left>", { desc = "Move left" })
vim.keymap.set("i", "<A-l>", "<Right>", { desc = "Move right" })

-- Buffers
vim.keymap.set("n", "<leader>x", "<cmd>bp<bar>sp<bar>bn<bar>bd<cr>", { desc = "Close buffer" })
vim.keymap.set("n", "<Tab>", "<cmd>bn<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab", "<cmd>bp<cr>", { desc = "Previous buffer" })

-- Windows
vim.keymap.set("n", "<leader>j", "<C-W>s", { desc = "Split window below" })
vim.keymap.set("n", "<leader>l", "<C-W>v", { desc = "Split window right" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Focus left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Focus right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Focus lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Focus upper window" })

-- Terminal

vim.keymap.set("n", "<leader>t", "<cmd>vsplit<bar>terminal<cr>", { desc = "Open terminal" })
-- Exit terminal mode in the builtin terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
