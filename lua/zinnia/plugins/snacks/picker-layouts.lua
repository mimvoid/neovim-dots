local function preview(opts)
  local orig = { win = "preview", title = "{preview}", border = vim.g.borderStyle }
  return vim.tbl_extend("force", orig, opts)
end

local info_title = "{title} {live} {flags}"
local input_list = {
  box = "vertical",
  border = vim.g.borderStyle,
  title = info_title,
  { win = "input", height = 1, border = "bottom" },
  { win = "list", border = "none" },
}

return {
  default = {
    layout = {
      box = "horizontal",
      width = 0.8,
      min_width = 100,
      height = 0.8,
      input_list,
      preview({ width = 0.4 }),
    },
  },

  vertical = {
    layout = {
      backdrop = false,
      width = 0.5,
      min_width = 80,
      height = 0.8,
      min_height = 25,
      box = "vertical",
      border = "none",
      title_pos = "center",
      input_list,
      preview({ height = 0.5 }),
    },
  },

  vertical_min_input = {
    layout = {
      backdrop = false,
      width = 0.5,
      min_width = 80,
      height = 0.8,
      min_height = 25,
      box = "vertical",
      border = "none",
      title_pos = "center",
      { win = "input", height = 1, border = "none" },
      { win = "list", border = vim.g.borderStyle, title = info_title },
      preview({ height = 0.5 }),
    },
  },

  select = {
    preview = false,
    layout = {
      backdrop = false,
      width = 0.5,
      min_width = 80,
      height = 0.4,
      min_height = 10,
      box = "vertical",
      border = vim.g.borderStyle,
      title = info_title,
      { win = "input", height = 1, border = "bottom" },
      { win = "list", border = "none" },
      preview({ height = 0.4, border = "top" }),
    },
  },
}
