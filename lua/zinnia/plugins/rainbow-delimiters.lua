local c = require("zinnia.colors").hues

return {
  "HiPhish/rainbow-delimiters.nvim",

  config = function()
    -- Highlight groups
    local highlights = {
      RainbowDelimiterRed = { fg = c.red },
      RainbowDelimiterYellow = { fg = c.yellow },
      RainbowDelimiterBlue = { fg = c.blue },
      RainbowDelimiterOrange = { fg = c.yellow },
      RainbowDelimiterGreen = { fg = c.green },
      RainbowDelimiterViolet = { fg = c.magenta },
      RainbowDelimiterCyan = { fg = c.cyan },
    }

    for k, v in pairs(highlights) do
      vim.api.nvim_set_hl(0, k, v)
    end
  end,
}
