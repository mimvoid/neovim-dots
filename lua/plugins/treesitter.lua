return {
	"nvim-treesitter/nvim-treesitter",
	-- build = ':TSUpdate',
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"html",
			"lua",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
		},
		auto_install = false,

		highlight = {
			enable = true,
			disable = { "latex" },
		},

		indent = { enable = true, disable = { "ruby" } },

		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<leader>s",
				node_decremental = "<bs>",
				node_incremental = "<leader>s",
			},
		},

		-- textobjects = {
		--     move = {
		--         enable = true,
		--         goto_next_end = {
		--             ["]C"] = { desc = "Next class end", query = "@class.outer" },
		--             ["]D"] = { desc = "Next method/function definition end", query = "@function.outer" },
		--             ["]F"] = { desc = "Next function call end", query = "@call.outer" },
		--             ["]I"] = { desc = "Next conditional end", query = "@conditional.outer" },
		--             ["]L"] = { desc = "Next loop end", query = "@loop.outer" },
		--         },
		--         goto_next_start = {
		--             ["]c"] = { desc = "Next class start", query = "@class.outer" },
		--             ["]d"] = { desc = "Next method/function definition start", query = "@function.outer" },
		--             ["]f"] = { desc = "Next function call start", query = "@call.outer" },
		--             ["]i"] = { desc = "Next conditional start", query = "@conditional.outer" },
		--             ["]l"] = { desc = "Next loop start", query = "@loop.outer" },
		--             ["]s"] = { desc = "Next scope", query = "@scope", query_group = "locals" },
		--             ["]z"] = { desc = "Next fold", query = "@fold", query_group = "folds" },
		--         },
		--         goto_previous_end = {
		--             ["[C"] = { desc = "Prev class end", query = "@class.outer" },
		--             ["[D"] = { desc = "Prev method/function definition end", query = "@function.outer" },
		--             ["[F"] = { desc = "Prev function call end", query = "@call.outer" },
		--             ["[I"] = { desc = "Prev conditional end", query = "@conditional.outer" },
		--             ["[L"] = { desc = "Prev loop end", query = "@loop.outer" },
		--         },
		--         goto_previous_start = {
		--             ["[c"] = { desc = "Prev class start", query = "@class.outer" },
		--             ["[d"] = { desc = "Prev method/function definition start", query = "@function.outer" },
		--             ["[f"] = { desc = "Prev function call start", query = "@call.outer" },
		--             ["[i"] = { desc = "Prev conditional start", query = "@conditional.outer" },
		--             ["[l"] = { desc = "Prev loop start", query = "@loop.outer" },
		--         },
		--         set_jumps = true,
		--     },
		--     select = {
		--         enable = true,
		--         keymaps = {
		--             ["a="] = { desc = "Select around assignment", query = "@assignment.outer" },
		--             ac = { desc = "Select around class", query = "@class.outer" },
		--             ad = { desc = "Select around method/function definition", query = "@function.outer" },
		--             af = { desc = "Select around function call", query = "@call.outer" },
		--             ai = { desc = "Select around conditional", query = "@conditional.outer" },
		--             al = { desc = "Select around loop", query = "@loop.outer" },
		--             ap = { desc = "Select around parameter", query = "@parameter.outer" },
		--             ["i="] = { desc = "Select inside assignment", query = "@assignment.inner" },
		--             ic = { desc = "Select inside class", query = "@class.inner" },
		--             id = { desc = "Select inside method/function definition", query = "@function.inner" },
		--             ["if"] = { desc = "Select inside function call", query = "@call.inner" },
		--             ii = { desc = "Select inside conditional", query = "@conditional.outer" },
		--             il = { desc = "Select inside loop", query = "@loop.inner" },
		--             ip = { desc = "Select inside parameter", query = "@parameter.inner" },
		--             ["l="] = { desc = "Select left assignment", query = "@assignment.lhs" },
		--             ["r="] = { desc = "Select right assignment", query = "@assignment.rhs" },
		--         },
		--         lookahead = true,
		--     },
		--     swap = {
		--         enable = true,
		--         swap_next = { ["<leader>nd"] = "@function.outer", ["<leader>np"] = "@parameter.inner" },
		--         swap_previous = { ["<leader>pd"] = "@function.outer", ["<leader>pp"] = "@parameter.inner" },
		--     },
		-- },
	},
}
