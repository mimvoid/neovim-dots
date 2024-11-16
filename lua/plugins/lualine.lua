return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  opts = {
    options = {
      always_divide_middle = false,
      component_separators = { left = "", right = "" },
      disabled_filetypes = { statusline = { "alpha" } },
      globalstatus = true,
      icons_enabled = true,
      section_separators = { left = "", right = "" },
      theme = "base16",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = {
        { "filetype", icon_only = true, padding = { left = 1, right = 0 } },
        { "filename", padding = { left = 0, right = 1 }, symbols = { modified = "", readonly = "󰌾" } },
        "filesize",
      },
      lualine_x = {
        "diff",
        { "diagnostics", symbols = { error = " ", hint = " ", info = " ", warn = " " } },
        {
          function()
            local msg = ""
            local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
            local clients = vim.lsp.get_active_clients()
            if next(clients) == nil then
              return msg
            end
            for _, client in ipairs(clients) do
              local filetypes = client.config.filetypes
              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
              end
            end
            return msg
          end,
        },
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
