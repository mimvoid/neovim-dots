vim.cmd.packadd("markview.nvim")

local presets = require("markview.presets")

require("markview.spec").setup({
  markdown = {
    enable = true,
    headings = {
      shift_width = 0,
      heading_1 = { icon = "# " },
      heading_2 = { icon = "## " },
      heading_3 = { icon = "### " },
      heading_4 = { icon = "#### " },
      heading_5 = { icon = "##### " },
      heading_6 = { icon = "###### " },
    },
    horizontal_rules = presets.horizontal_rules.dashed,
    tables = presets.tables.single,
    list_items = {
      indent_size = function(buffer)
        if type(buffer) ~= "number" then
          return vim.bo.shiftwidth or 2;
        end

        --- Use 'shiftwidth' value.
        return vim.bo[buffer].shiftwidth or 2;
      end,
      shiftwidth = 2,

      marker_minus = { add_padding = false, text = "-" };
      marker_plus = { add_padding = false, text = "+" };
      marker_star = { add_padding = false, text = "*" };
      marker_dot = { adding_padding = false },
      marker_parenthesis = { adding_padding = false },
    }
  },
})
