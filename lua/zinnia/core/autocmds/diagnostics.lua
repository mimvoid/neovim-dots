-- Change diagnostic symbols in the sign column (gutter)
return function()
  if not vim.g.have_nerd_font then
    return
  end

  local signs = {
    Error = "",
    Warn = "",
    Hint = "",
    Info = "",
  }

  local signs_config = {
    text = {},
    linehl = {},
    numhl = {},
  }

  for type, icon in pairs(signs) do
    local key = vim.diagnostic.severity[type:upper()]
    local hl = "DiagnosticSign" .. type

    signs_config.text[key] = icon
    signs_config.numhl[key] = hl
  end

  vim.diagnostic.config({ signs = signs_config })
end
