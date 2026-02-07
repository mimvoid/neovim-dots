return {
  "neotab.nvim",
  event = "InsertEnter",
  after = function()
    require("neotab").setup({
      smart_punctuators = {
        enabled = true,
        semicolon = {
          enabled = true,
          ft = { "cs", "c", "cpp", "java", "nix", "javascript", "typescript" },
        },
      },
    })
  end,
}
