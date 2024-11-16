-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tab spaces
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.showtabline = 2
vim.opt.shiftwidth = 2

-- Indentation
vim.opt.smartindent = true
vim.opt.breakindent = true

-- Text wrap
vim.opt.wrap = true

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- Backups
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true

-- Cursor
vim.opt.cursorline = true
vim.opt.scrolloff = 8

-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- vim.opt.greprg = 'rg --vimgrep'
-- vim.opt.grepformat = '%f%l%c%m'

-- Splitting windows
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Commandline
vim.opt.showmode = false
vim.opt.cmdheight = 1

-- Enable mouse mode
vim.opt.mouse = "a"

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Mapped sequence wait time
vim.opt.timeoutlen = 1000

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit",
  "tutor_mode_plugin",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end
