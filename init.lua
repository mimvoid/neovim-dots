require("options")
require("keymaps")
require("autocommands")

local utils = require("utils")

local load_lazy = utils.set(function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
  end
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
  vim.opt.rtp:prepend(lazypath)
end, function()
    vim.opt.rtp:prepend([[lazy.nvim-plugin-path]])
end)

load_lazy()

require("lazy").setup({ import = "plugins" })
