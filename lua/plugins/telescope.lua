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

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		-- -- Slightly advanced example of overriding default behavior and theme
		-- vim.keymap.set('n', '<leader>/', function()
		--   -- You can pass additional configuration to Telescope to change the theme, layout, etc.
		--   builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		--     winblend = 10,
		--     previewer = false,
		--   })
		-- end, { desc = '[/] Fuzzily search in current buffer' })

		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
