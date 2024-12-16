return {
  "nvim-lualine/lualine.nvim",

  dependencies = { "nvim-tree/nvim-web-devicons" },

  opts = {
    options = {
      theme = "catppuccin",

      always_divide_middle = false,
      globalstatus = true,
      icons_enabled = true,

      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },

    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = {
        {
          "filetype",
          icon_only = true,
          padding = { left = 1, right = 0 },
        },
        {
          "filename",
          padding = { left = 0, right = 1 },
          symbols = { modified = "", readonly = "󰌾" },
        },
        "filesize",
      },

      lualine_x = {
        "diff",
        {
          "diagnostics",
          symbols = { error = " ", hint = " ", info = " ", warn = " " },
        },
        {
          -- Lists the LSPs in the current buffer filetype
          function()
            local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
            local clients = vim.lsp.get_active_clients()

            if next(clients) == nil then
              return ""
            end

            for _, client in ipairs(clients) do
              local filetypes = client.config.filetypes

              -- list clients
              local ft_clients = {}
              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                table.insert(ft_clients, client.name)
              end

              return table.concat(ft_clients, ", ")
            end
          end,
        },
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
