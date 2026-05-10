require("zinnia.core.globals")
require("zinnia.core.options")
require("zinnia.core.keymaps")
require("zinnia.core.autocmds")
require("zinnia.core.lsps")

-- Add filetype mappings

vim.filetype.add({
  extension = {
    html = function(path, bufnr)
      -- Detect Go templates in HTML
      local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 20, false)
      for _, line in ipairs(lines) do
        if line:find("{{") then
          return "gotmpl"
        end
      end
      return "html"
    end,
    txt = function(path, bufnr)
      -- Detect todo.txt files
      return path:match("todo%.txt$") and "todotxt" or "text"
    end,
  },
})

-- Built-in plugins

vim.cmd.packadd("nvim.undotree")
vim.keymap.set("n", "<leader>u", function()
  if not require("undotree").open() then
    -- A new window was opened, disable line numbers
    vim.opt.number = false
    vim.opt.relativenumber = false
  end
end)
