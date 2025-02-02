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

layouts.vertical_min_input = {
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
    { win = "list", border = vim.g.borderStyle, title = "{title} {live} {flags}" },
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
      -- start in normal mode
      layout = layouts.vertical_min_input,
      on_show = function()
        vim.cmd.stopinsert()
      end,

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
      layout = layouts.vertical_min_input,
      on_show = function()
        vim.cmd.stopinsert()
      end,

      focus = "list",
      formatters = { file = { filename_first = true } },
    },
    marks = {
      layout = layouts.vertical_min_input,
      on_show = function()
        vim.cmd.stopinsert()
      end,

      focus = "list",
      matcher = { sort_empty = true },
      formatters = { file = { filename_first = true } },

      transform = function(item)
        if item.text:match("^[a-z]") then
          item.score_add = 1000
        end
        if item.text:match("^[A-Z]") then
          item.score_add = 500
        end
        return item
      end,
    },
  },
}
