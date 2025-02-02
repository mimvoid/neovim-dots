local horizontal = {
  reverse = true,
  layout = {
    backdrop = false,
    box = "horizontal",
    width = 0.8,
    min_width = 100,
    height = 0.8,
    {
      box = "vertical",
      border = "rounded",
      title = "{title} {live} {flags}",
      { win = "list", border = "none" },
      { win = "input", height = 1, border = "top" },
    },
    { win = "preview", title = "{preview}", border = "rounded", width = 0.4 },
  },
}

local vertical = {
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
      border = "rounded",
      title = "{title} {live} {flags}",
      { win = "input", height = 1, border = "bottom" },
      { win = "list", border = "none" },
    },
    { win = "preview", title = "{preview}", border = "rounded", height = 0.5 },
  },
}

return {
  enabled = true,
  layout = function()
    return vim.o.columns >= 90 and horizontal or vertical
  end,

  matcher = {
    cwd_bonus = true,
    frecency = true,
  },

  sources = {
    buffers = {
      focus = "list",
      nofile = true,
      layout = { preset = "select" },
      formatters = { file = { filename_only = true } },
    },
    commands = { layout = { preset = "select" } },
    diagnostics = {
      layout = {
        preset = "select",
        layout = { min_width = 100 },
      },
    },
    icons = { layout = { preset = "select" } },
    marks = {
      focus = "list",
      layout = vertical,
      matcher = {
        sort_empty = true,
        filename_bonus = false,
      },
    },
  },
}
