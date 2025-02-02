local picker = require("zinnia.plugins.snacks.picker")

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesActionRename",
  callback = function(event)
    Snacks.rename.on_rename_file(event.data.from, event.data.to)
  end,
})

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

  keys = {
    { "<leader>gl", function() Snacks.lazygit.open() end, desc = "Open Lazygit" },
    { "<leader>go", function() Snacks.lazygit.log() end, desc = "Open Git log" },

    { "<leader><leader>", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>m", function()
      -- HACK: only show alphabetic marks
      Snacks.picker.marks({ pattern = "!0 !1 !2 !3 !4 !5 !6 !7 !8 !9 !^' !\" ![ !] !< !> !^. !^^" })
    end, desc = "Find marks" },
    { "<leader>M", function() Snacks.picker.marks() end, desc = "Find all marks" },

    { "<leader>/", function() Snacks.picker.grep() end, desc = "Find by grep" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Search command history" },
    { "<leader>z", function() Snacks.picker.zoxide() end, desc = "Find by zoxide" },

    { "<leader>fh", function() Snacks.picker.help() end, desc = "Find help" },
    { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Find keymaps" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Find recent files" },
    { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Find current word" },
    { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Find diagnostics" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Find projects" },
    { "<leader>fi", function() Snacks.picker.icons() end, desc = "Find icons" },
    { "<leader>fe", function() Snacks.picker.registers() end, desc = "Find registers" },
    { "<leader>fj", function() Snacks.picker.jumps() end, desc = "Find jumps" },
    { "<leader>fs", function() Snacks.picker.pickers() end, desc = "Find Snacks pickers" },
    { "<leader>fn", function()
      Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
    end, desc = "Find config file" },
  },
}
