return {
  "lervag/vimtex",
  lazy = false,

  init = function()
    local globals = {
      vimtex_callback_progpath = "nvim",
      vimtex_enabled = true,
      vimtex_view_method = "zathura",
    }
    for k, v in pairs(globals) do
      vim.g[k] = v
    end
  end,
}
