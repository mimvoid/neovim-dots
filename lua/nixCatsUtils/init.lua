local M = {}

M.isNixCats = vim.g[ [[nixCats-special-rtp-entry-nixCats]] ] ~= nil

---Sets up a mock nixCats plugin when not using Nix.
---It will help avoid indexing errors when the nixCats plugin doesn't exist.
---@param v? { non_nix_value: boolean } non_nix_value defaults to true if not provided or not a boolean.
---@return nil
function M.setup(v)
  if M.isNixCats then
    return
  end

  local nixCats_default_value
  if type(v) == "table" and type(v.non_nix_value) == "boolean" then
    nixCats_default_value = v.non_nix_value
  else
    nixCats_default_value = true
  end

  local function mk_with_meta(tbl)
    return setmetatable(tbl, {
      __call = function(_, attrpath)
        local strtable = {}
        local attr_type = type(attrpath)

        if attr_type == "table" then
          strtable = attrpath
        elseif attr_type == "string" then
          for key in attrpath:gmatch("([^%.]+)") do
            table.insert(strtable, key)
          end
        else
          print("mk_with_meta requires a table of strings or a dot separated string")
          return
        end

        return vim.tbl_get(tbl, unpack(strtable))
      end,
    })
  end

  package.preload["nixCats"] = function()
    local ncsub = {
      get = function(_)
        return nixCats_default_value
      end,
      cats = mk_with_meta({
        nixCats_config_location = vim.fn.stdpath("config"),
        wrapRc = false,
      }),
      settings = mk_with_meta({
        nixCats_config_location = vim.fn.stdpath("config"),
        configDirName = os.getenv("NVIM_APPNAME") or "nvim",
        wrapRc = false,
      }),
      petShop = mk_with_meta({}),
      extra = mk_with_meta({}),
      pawsible = mk_with_meta({
        allPlugins = {
          start = {},
          opt = {},
        },
      }),
      configDir = vim.fn.stdpath("config"),
      packageBinPath = os.getenv("NVIM_WRAPPER_PATH_NIX") or vim.v.progpath,
    }
    return setmetatable(ncsub, {
      __call = function(_, cat)
        return ncsub.get(cat)
      end,
    })
  end

  _G.nixCats = require("nixCats")
end

---Allows you to guarantee a boolean is returned, and also declare a different
---default value than specified in setup when not using Nix to load the config.
---@param v string|string[]
---@param default? boolean
---@return boolean
function M.enable_for_category(v, default)
  if M.isNixCats or default == nil then
    if nixCats(v) then
      return true
    end
    return false
  end
  return default
end

---If Nix, return value of nixCats(v), else return default.
---Exists to specify a different non_nix_value than the one in setup().
---@param v string|string[]
---@param default any
---@return any
function M.getCatOrDefault(v, default)
  if M.isNixCats then
    return nixCats(v)
  end
  return default
end

---Return the specified values if or if not on Nix.
---@generic T, E
---@param nix T The value to return if on Nix.
---@param non_nix E The value to return if not on Nix.
---@return T|E
function M.nix_or(nix, non_nix)
  if M.isNixCats then
    return nix
  end
  return non_nix
end

return M
