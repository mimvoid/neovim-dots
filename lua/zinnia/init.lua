require("zinnia.core")

-- If not on Nix, setup plugins and dependencies traditionally
if not require("nixCatsUtils").isNixCats then
  require("zinnia.nonnix")
end

vim.cmd.packadd("lz.n")
require("zinnia.plugins") -- Load plugins
require("lz.n").load("zinnia.lz") -- Lazy load plugin specs
