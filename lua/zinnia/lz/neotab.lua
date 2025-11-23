return {
  "kawre/neotab.nvim",
  event = "InsertEnter",

  opts = {
    smart_punctuators = {
      enabled = true,
      semicolon = {
        enabled = true,
        ft = { "nix", "javascript", "typescript" },
      },
    },
  },
}
