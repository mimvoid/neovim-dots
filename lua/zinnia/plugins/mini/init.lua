require("zinnia.plugins.mini.clue")
require("zinnia.plugins.mini.files")
require("zinnia.plugins.mini.hipatterns")
require("zinnia.plugins.mini.starter")

local c = require("zinnia.colors")

require("mini.ai").setup({ n_lines = 500 })
require("mini.move").setup()
require("mini.surround").setup()
require("mini.splitjoin").setup()
require("mini.jump2d").setup()

require("mini.diff").setup({
  view = {
    priority = 5,
    signs = { add = "┃", change = "┃", delete = "▁" },
    style = "sign",
  },
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
