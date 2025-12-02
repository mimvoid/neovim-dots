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

  local signs_config = { text = {}, numhl = {} }

  for diag_level, icon in pairs(signs) do
    local key = vim.diagnostic.severity[diag_level:upper()]

    signs_config.text[key] = icon
    signs_config.numhl[key] = "DiagnosticSign" .. diag_level
  end

  vim.diagnostic.config({ signs = signs_config })
end
