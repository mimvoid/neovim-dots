local colors = require("zinnia.colors")

return {
  "HiPhish/rainbow-delimiters.nvim",

  config = function()
    -- Highlight groups
    local highlights = {
      RainbowDelimiterRed = { fg = colors.red },
      RainbowDelimiterYellow = { fg = colors.yellow },
      RainbowDelimiterBlue = { fg = colors.blue },
      RainbowDelimiterOrange = { fg = colors.yellow },
      RainbowDelimiterGreen = { fg = colors.green },
      RainbowDelimiterViolet = { fg = colors.magenta },
      RainbowDelimiterCyan = { fg = colors.cyan },
    }

    for k, v in pairs(highlights) do
      vim.api.nvim_set_hl(0, k, v)
    end
  end,
}
