local colors = require("zinnia.colors")

return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",

  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },

  config = function()
    -- Highlight groups
    local groups = {
      TelescopePreviewTitle = { bg = colors.base00, fg = colors.green },
      TelescopePromptPrefix = { fg = colors.red },
      TelescopePromptTitle = { bg = colors.base00, fg = colors.red },
    }

    for k, v in pairs(groups) do
      vim.api.nvim_set_hl(0, k, v)
    end

    -- Setup
    require("telescope").setup {
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
    }

    -- Enable Telescope extensions if they are installed
    -- pcall(require('telescope').load_extension, 'fzf')
    -- pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
    vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
    vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
    vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

    vim.keymap.set("n", "<leader>f/", function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      }
    end, { desc = "[F]ind [/] in Open Files" })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set("n", "<leader>fn", function()
      builtin.find_files { cwd = vim.fn.stdpath("config") }
    end, { desc = "[F]ind [N]eovim files" })
  end,
}
