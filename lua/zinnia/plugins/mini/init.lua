local starter_opts = require("zinnia.plugins.mini.mini-starter")
local hipatterns_opts = require("zinnia.plugins.mini.mini-hipatterns")
local clue_opts = require("zinnia.plugins.mini.mini-clue")

local c = require("zinnia.colors")

return {
  "echasnovski/mini.nvim",
  lazy = false,

  keys = {
    {
      "<leader>e",
      function()
        if vim.bo.buftype == "" then
          MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
        else
          MiniFiles.open()
        end
      end,
      desc = "Open mini.files",
    },
  },

  config = function()
    require("mini.ai").setup({ n_lines = 500 })
    require("mini.move").setup()
    require("mini.surround").setup()
    require("mini.splitjoin").setup()
    require("mini.jump2d").setup()

    -- Use the tables from the other files
    require("mini.starter").setup(starter_opts)
    require("mini.hipatterns").setup(hipatterns_opts)
    require("mini.clue").setup(clue_opts())

    require("mini.diff").setup({
      view = {
        priority = 5,
        signs = { add = "┃", change = "┃", delete = "▁" },
        style = "sign",
      },
    })

    require("mini.files").setup({
      mappings = { go_in_plus = "<cr>" },
      options = { permanent_delete = false, use_as_default_explorer = true },
      windows = { width_focus = 25, width_nofocus = 15 },
    })

    require("mini.tabline").setup({
      format = function(buf_id, label)
        local faded = { fg = c.base16.base03 }
        local hl = {
          Current = { fg = c.hues.cyan, bold = true },
          ModifiedCurrent = { fg = c.hues.red, bold = true },
          Visible = faded,
          ModifiedVisible = faded,
          Hidden = faded,
          ModifiedHidden = faded,
        }
        for k, v in pairs(hl) do
          vim.api.nvim_set_hl(0, "MiniTabline" .. k, v)
        end

        local suffix = vim.bo[buf_id].modified and "● " or ""
        return MiniTabline.default_format(buf_id, label) .. suffix
      end,
    })

    vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = c.base16.base02 })
    require("mini.indentscope").setup({
      draw = {
        delay = 50,
        animation = require("mini.indentscope").gen_animation.none(),
      },
      options = {
        n_lines = 500,
        try_as_border = true,
      },
    })
  end,
}
