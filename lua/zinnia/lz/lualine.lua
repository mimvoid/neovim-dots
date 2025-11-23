return {
  "lualine.nvim",
  after = function()
    require("lualine").setup({
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
              local clients = vim.lsp.get_clients({ bufnr = 0 })
              if #clients == 0 then
                return ""
              end

              local ft_clients = {}
              for i = 1, #clients do
                table.insert(ft_clients, clients[i].name)
              end

              return table.concat(ft_clients, ", ")
            end,
          },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
