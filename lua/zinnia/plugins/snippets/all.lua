return function(ls)
  local s = ls.snippet
  local t = ls.text_node

  -- ISO date time stamp, with timezone as +00:00
  local function disotz()
    local z = os.date("%z")
    local utc_offset = ("%s:%s"):format(z:sub(1, 3), z:sub(4, 5))
    return os.date("%Y-%m-%dT%H:%M:%S") .. utc_offset
  end

  return {
    s("disotz", { t(disotz()) })
  }
end
