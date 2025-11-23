-- Setup outside Nix
local nixcats = require("nixCatsUtils")

nixcats.setup({ non_nix_value = true })
if not nixcats.isNixCats then
  require("zinnia.nonnix")
end

-- Main config
require("zinnia")
