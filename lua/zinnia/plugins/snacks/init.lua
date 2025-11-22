local picker = require("zinnia.plugins.snacks.picker")
picker.layouts = require("zinnia.plugins.snacks.picker-layouts")

return {
  "folke/snacks.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  --@type snacks.Config
  opts = {
    layout = {
      width = 0.8,
      height = 0.8,
    },

    picker = picker,

    input = { enabled = true },
    lazygit = { enabled = true },
    rename = { enabled = true },
  },

  config = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesActionRename",
      callback = function(event)
        Snacks.rename.on_rename_file(event.data.from, event.data.to)
      end,
    })
  end,

  keys = function()
    local function pick(key, cmd, desc)
      if not desc then
        desc = "Find " .. cmd
      end

      return {
        "<leader>" .. key,
        function()
          Snacks.picker[cmd]()
        end,
        desc = desc,
      }
    end

    return {
      {
        "<leader>gl",
        function()
          Snacks.lazygit.open()
        end,
        desc = "Open Lazygit",
      },
      {
        "<leader>go",
        function()
          Snacks.lazygit.log()
        end,
        desc = "Open Git log",
      },

      pick("<leader>", "buffers", "Buffers"),
      {
        "<leader>m",
        function()
          -- HACK: only show alphabetic marks
          Snacks.picker.marks({ pattern = "!0 !1 !2 !3 !4 !5 !6 !7 !8 !9 !^' !\" ![ !] !< !> !^. !^^" })
        end,
        desc = "Find marks",
      },
      pick("M", "marks", "Find all marks"),

      pick("/", "grep", "Find by grep"),
      pick(":", "command_history", "Search command history"),
      pick("z", "zoxide", "Find by zoxide"),

      pick("fh", "help"),
      pick("fk", "keymaps"),
      pick("ff", "files"),
      pick("fr", "recent", "Find recent files"),
      pick("fw", "grep_word", "Find current word"),
      pick("fd", "diagnostics"),
      pick("fi", "icons"),
      pick("fe", "registers"),
      pick("fj", "jumps"),
      pick("fs", "pickers", "Find Snacks pickers"),
      {
        "<leader>fn",
        function()
          Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Find config file",
      },
    }
  end,
}
