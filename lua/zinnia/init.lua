require("zinnia.core")

-- If not on Nix, setup plugins and dependencies traditionally
if not require("nixCatsUtils").isNixCats then
  require("zinnia.nonnix")
end

require("zinnia.plugins") -- Load plugins
require("lz.n").load("zinnia.lz") -- Lazy load plugin specs
