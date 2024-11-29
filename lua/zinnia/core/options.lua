-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

local opts = {
  -- Line numbers
  number = true,
  relativenumber = true,

  -- Tab spaces
  expandtab = true,
  tabstop = 2,
  softtabstop = 2,
  showtabline = 2,
  shiftwidth = 2,

  -- Indentation
  smartindent = true,
  breakindent = true,

  -- Text wrap
  wrap = true,

  -- Backups
  swapfile = false,
  backup = false,
  writebackup = false,
  undofile = true,

  -- Cursor
  cursorline = true,
  scrolloff = 8,

  -- Searching
  hlsearch = true,
  incsearch = true,
  ignorecase = true,
  smartcase = true,

  -- greprg = 'rg --vimgrep'
  -- grepformat = '%f%l%c%m'

  -- Splitting windows
  splitbelow = true,
  splitright = true,

  -- Commandline
  showmode = false,
  cmdheight = 1,

  -- Enable mouse mode
  mouse = "a",

  -- Keep signcolumn on by default
  signcolumn = "yes",

  -- Mapped sequence wait time
  timeoutlen = 1000,

  -- Sets how neovim will display certain whitespace characters in the editor.
  list = true,
  listchars = { tab = "» ", trail = "·", nbsp = "␣" },

  -- Preview substitutions live, as you type!
  inccommand = "split",
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end
