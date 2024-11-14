return {
	"RRethy/base16-nvim",
	priority = 1000,

	init = function()
		local base16 = require("base16-colorscheme")

		base16.with_config({ telescope_borders = true })
		base16.setup({
			base00 = "#25223a",
			base01 = "#312c48",
			base02 = "#38344e",
			base03 = "#5d5573",
			base04 = "#9e92a5",
			base05 = "#e8dfdd",
			base06 = "#e8dfdd",
			base07 = "#44415a",
			base08 = "#f281a6",
			base09 = "#c37ac9",
			base0A = "#efa4b7",
			base0B = "#6990d6",
			base0C = "#b1b5e4",
			base0D = "#9673de",
			base0E = "#c37ac9",
			base0F = "#55486b",
		})

		-- You can configure highlights by doing something like:
		-- vim.cmd.hi 'Comment gui=none'
	end,
}
