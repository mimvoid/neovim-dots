require("mini.hipatterns").setup({
  highlighters = {
    fixme = {
      extmark_opts = { sign_text = "" },
      group = "MiniHipatternsFixme",
      pattern = "%f[%w]()FIX()%f[%W]",
    },
    hack = {
      extmark_opts = { sign_text = "" },
      group = "MiniHipatternsHack",
      pattern = "%f[%w]()HACK()%f[%W]",
    },
    note = {
      extmark_opts = { sign_text = "" },
      group = "MiniHipatternsNote",
      pattern = "%f[%w]()NOTE()%f[%W]",
    },
    todo = {
      extmark_opts = { sign_text = "" },
      group = "MiniHipatternsTodo",
      pattern = "%f[%w]()TODO()%f[%W]",
    },
  },
})
