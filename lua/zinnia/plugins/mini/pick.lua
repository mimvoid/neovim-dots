require("mini.pick").setup({
  mappings = {
    move_down = "<C-j>",
    move_up = "<C-k>",
    send_to_qflist = {
      char = "<C-q>",
      func = function()
        MiniPick.default_choose_marked(MiniPick.get_picker_matches().all) -- Choose all matches.
        MiniPick.stop() -- Close picker right away.
      end,
    },
  },
  window = {
    config = function()
      local height = math.floor(0.75 * vim.o.lines)
      local width = math.floor(0.75 * vim.o.columns)

      return {
        anchor = "NW",

        height = height,
        width = width,

        -- Center on screen
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
      }
    end,
  },
})

vim.ui.select = MiniPick.ui_select

local m = vim.keymap.set

m("n", "<leader><leader>", "<cmd>Pick buffers<cr>", { desc = "Find buffers" })
m("n", "<leader>fd", "<cmd>Pick diagnostics<cr>", { desc = "Find diagnostics" })
m("n", "<leader>ff", "<cmd>Pick files<cr>", { desc = "Find files" })
m("n", "<leader>fh", "<cmd>Pick help<cr>", { desc = "Find help tags" })
m("n", "<leader>fk", "<cmd>Pick keymaps<cr>", { desc = "Find keymaps" })
m("n", "<leader>fl", "<cmd>Pick hl_groups<cr>", { desc = "Find highlight groups" })
m("n", "<leader>fr", "<cmd>Pick resume<cr>", { desc = "Resume latest picker" })
m("n", "<leader>ft", "<cmd>Pick hipatterns<cr>", { desc = "Find hipatterns & todos" })
m("n", "<leader>/", "<cmd>Pick grep_live<cr>", { desc = "Find by grep" })

local hl = vim.api.nvim_set_hl
hl(0, "MiniPickMatchRanges", { link = "@markup.strong" })
hl(0, "MiniPickHeader", { link = "@markup.strong" })
