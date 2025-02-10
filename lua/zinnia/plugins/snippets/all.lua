function snippets(ls)
  local s = ls.snippet
  local t = ls.text_node

  function hugo_date()
    return os.date("%Y-%m-%dT%H:%M:%S-05:00")
  end

  return {
    s("hugodate", { t(hugo_date()) })
  }
end

return snippets
