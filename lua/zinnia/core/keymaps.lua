local m = vim.keymap.set

-- Insert mode navigation
m("i", "<A-j>", "<Down>", { desc = "Move down" })
m("i", "<A-k>", "<Up>", { desc = "Move up" })
m("i", "<A-h>", "<Left>", { desc = "Move left" })
m("i", "<A-l>", "<Right>", { desc = "Move right" })

m("i", "fj", "<esc>")

-- Buffers
m("n", "<leader>x", "<cmd>bp<bar>sp<bar>bn<bar>bd<cr>", { desc = "Close buffer" })
m("n", "<Tab>", "<cmd>bn<cr>", { desc = "Next buffer" })
m("n", "<S-Tab>", "<cmd>bp<cr>", { desc = "Previous buffer" })

-- Windows
m("n", "<leader>j", "<C-W>s", { desc = "Split window below" })
m("n", "<leader>l", "<C-W>v", { desc = "Split window right" })

m("n", "<C-h>", "<C-w><C-h>", { desc = "Focus left window" })
m("n", "<C-l>", "<C-w><C-l>", { desc = "Focus right window" })
m("n", "<C-j>", "<C-w><C-j>", { desc = "Focus lower window" })
m("n", "<C-k>", "<C-w><C-k>", { desc = "Focus upper window" })

-- Diagnostic keymaps
m("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

m("n", "<leader>kl", function()
  vim.diagnostic.config({
    virtual_lines = { current_line = true },
    virtual_text = false,
  })

  vim.api.nvim_create_autocmd("CursorMoved", {
    group = vim.api.nvim_create_augroup("line-diagnostics", { clear = true }),
    callback = function()
      vim.diagnostic.config({ virtual_lines = false, virtual_text = true })
      return true
    end,
  })
end, { desc = "Show diagnostic virtual [l]ines" })

m("n", "<leader>kk", vim.diagnostic.open_float, { desc = "Open diagnostic float" })

-- {{ Terminal }}

m("n", "<leader>t", function()
  vim.cmd.new()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 8)
end, { desc = "Open terminal" })

-- Exit terminal mode in the builtin terminal
m("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- {{ Quality of life }}

-- Clear highlights on search when pressing <Esc> in normal mode
m("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Clear highlights on search when pressing <Esc> in normal mode
m("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Don't yank empty lines with dd
m("n", "dd", function()
  if vim.fn.getline("."):match("^%s*$") then
    return '"_dd'
  end
  return "dd"
end, { expr = true, silent = true })

-- Cursor stays in place after yanking in visual mode
m("v", "y", "ygv<esc>")
