local c = require("zinnia.colors")

return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",

  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },

  config = function()
    require("telescope").setup({
      defaults = {
        dynamic_preview_title = true,
        file_ignore_patterns = {
          "^.git/",
          "^.mypy_cache/",
          "^__pycache__/",
          "^output/",
          "^data/",
          "%.ipynb",
          ".sass-cache/*",
        },
        layout_config = {
          height = 0.85,
          horizontal = { preview_width = 0.4, prompt_position = "bottom" },
          preview_cutoff = 1,
          width = 0.8,
        },
        mappings = {
          i = {
            ["<A-j>"] = require("telescope.actions").move_selection_next,
            ["<A-k>"] = require("telescope.actions").move_selection_previous,
          },
        },
        path_display = { "truncate" },
        previewer = true,
        prompt_title = "",
        results_title = "",
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob",
          "!**/.git/*",
        },
      },
    })

    -- Enable Telescope extensions if they are installed
    -- pcall(require('telescope').load_extension, 'fzf')
    -- pcall(require('telescope').load_extension, 'ui-select')

    local m = vim.keymap.set
    local tl = require("telescope.builtin")

    m("n", "<leader>fh", tl.help_tags, { desc = "[F]ind [H]elp" })
    m("n", "<leader>fk", tl.keymaps, { desc = "[F]ind [K]eymaps" })
    m("n", "<leader>ff", tl.find_files, { desc = "[F]ind [F]iles" })
    m("n", "<leader>fs", tl.builtin, { desc = "[F]ind [S]elect Telescope" })
    m("n", "<leader>fw", tl.grep_string, { desc = "[F]ind current [W]ord" })
    m("n", "<leader>fg", tl.live_grep, { desc = "[F]ind by [G]rep" })
    m("n", "<leader>fd", tl.diagnostics, { desc = "[F]ind [D]iagnostics" })
    m("n", "<leader>fr", tl.resume, { desc = "[F]ind [R]esume" })
    m("n", "<leader>f.", tl.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })

    m("n", "<leader>f/", function()
      tl.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "[F]ind [/] in Open Files" })

    -- Shortcut for searching your Neovim configuration files
    m("n", "<leader>fn", function()
      tl.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "[F]ind [N]eovim files" })
  end,
}
