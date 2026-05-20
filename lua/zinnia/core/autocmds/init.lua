-- [[ Autocommands ]]

require("zinnia.core.autocmds.lsp")

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

-- Treesitter
-- Enable highlights and indentation on supported filetypes
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local buf, filetype = args.buf, args.match
    local lang = vim.treesitter.language.get_lang(filetype)

    -- Check if the language's parser is loaded
    if lang and vim.treesitter.language.add(lang) then
      vim.treesitter.start(buf, lang)
    end
  end
})
