local function as_normal(tbl)
  local normal_opts = {
    layout = "vertical_min_input",
    focus = "list",

    -- start in normal mode
    on_show = vim.cmd.stopinsert,
  }

  return vim.tbl_extend("force", normal_opts, tbl)
end

return {
  enabled = true,

  layout = function()
    return vim.o.columns >= 90 and "default" or "vertical"
  end,
  layouts = require("zinnia.plugins.snacks.picker-layouts"),

  matcher = {
    cwd_bonus = true,
    frecency = true,
  },

  sources = {
    buffers = as_normal({
      layout = "select",
      nofile = true,
      formatters = { file = { filename_first = true } },
    }),

    commands = { layout = "select" },
    command_history = { layout = "select" },

    diagnostics = {
      layout = {
        preset = "select",
        layout = { min_width = 100 },
      },
    },

    icons = { layout = "select" },

    jumps = as_normal({
      formatters = { file = { filename_first = true } },
    }),

    marks = as_normal({
      matcher = { sort_empty = true },
      formatters = { file = { filename_first = true } },

      -- prioritize local and global alphabetic marks
      transform = function(item)
        if item.text:match("^[a-z]") then
          item.score_add = 1000
        elseif item.text:match("^[A-Z]") then
          item.score_add = 500
        end
        return item
      end,
    }),
  },
}
