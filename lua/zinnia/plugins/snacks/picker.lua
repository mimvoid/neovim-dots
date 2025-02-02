local layouts = {}

layouts.horizontal = {
  layout = {
    backdrop = false,
    box = "horizontal",
    width = 0.8,
    min_width = 100,
    height = 0.8,
    {
      box = "vertical",
      border = vim.g.borderStyle,
      title = "{title} {live} {flags}",
      { win = "input", height = 1, border = "bottom" },
      { win = "list", border = "none" },
    },
    { win = "preview", title = "{preview}", border = vim.g.borderStyle, width = 0.4 },
  },
}

layouts.vertical = {
  layout = {
    backdrop = false,
    width = 0.5,
    min_width = 80,
    height = 0.8,
    min_height = 25,
    box = "vertical",
    border = "none",
    title_pos = "center",
    {
      box = "vertical",
      border = vim.g.borderStyle,
      title = "{title} {live} {flags}",
      { win = "input", height = 1, border = "bottom" },
      { win = "list", border = "none" },
    },
    { win = "preview", title = "{preview}", border = vim.g.borderStyle, height = 0.5 },
  },
}

layouts.select = {
  preview = false,
  layout = {
    backdrop = false,
    width = 0.5,
    min_width = 80,
    height = 0.4,
    min_height = 10,
    box = "vertical",
    border = vim.g.borderStyle,
    title = "{title} {live} {flags}",
    { win = "input", height = 1, border = "bottom" },
    { win = "list", border = "none" },
    { win = "preview", title = "{preview}", height = 0.4, border = "top" },
  },
}

return {
  enabled = true,
  layout = function()
    return vim.o.columns >= 90 and layouts.horizontal or layouts.vertical
  end,

  matcher = {
    cwd_bonus = true,
    frecency = true,
  },

  sources = {
    buffers = {
      focus = "list",
      nofile = true,
      layout = layouts.select,
      formatters = { file = { filename_first = true } },
    },
    commands = { layout = layouts.select },
    command_history = { layout = layouts.select },
    diagnostics = {
      layout = {
        preset = "select",
        layout = { min_width = 100 },
      },
    },
    icons = { layout = layouts.select },
    jumps = {
      focus = "list",
      layout = layouts.vertical,
      formatters = { file = { filename_first = true } },
    },
    marks = {
      focus = "list",
      layout = layouts.vertical,
      matcher = { sort_empty = true },
      formatters = { file = { filename_first = true } },
      -- HACK: only show alphabetic marks
      pattern = "!0 !1 !2 !3 !4 !5 !6 !7 !8 !9 !^' !\" ![ !] !< !> !^. !^^",
      -- filter = {
      --   filter = function(item)
      --     return string.match(item.text, "%a") ~= nil
      --   end,
      -- },
    },
  },
}
