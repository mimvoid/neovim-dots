return {
  "echasnovski/mini.nvim",
  lazy = false,
  config = function()
    require("mini.ai").setup { n_lines = 500 }
    require("mini.move").setup {}
    require("mini.surround").setup {}
    require("mini.trailspace").setup {}

    require("mini.starter").setup {
      header = table.concat({
        [[███╗   ██╗███████╗ ███████╗ ██╗   ██╗██╗███╗   ███╗]],
        [[████╗  ██║██╔════╝██╔════██╗██║   ██║██║████╗ ████║]],
        [[██╔██╗ ██║█████╗  ██║  ♥ ██║██║   ██║██║██╔████╔██║]],
        [[██║╚██╗██║██╔══╝  ██║    ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
        [[██║ ╚████║███████╗╚███████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
        [[╚═╝  ╚═══╝╚══════╝ ╚══════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      }, "\n"),

      footer = os.date(),
      evaluate_single = true,
    }

    require("mini.clue").setup {
      clues = {
        require("mini.clue").gen_clues.builtin_completion(),
        require("mini.clue").gen_clues.g(),
        require("mini.clue").gen_clues.marks(),
        require("mini.clue").gen_clues.registers(),
        require("mini.clue").gen_clues.windows(),
        require("mini.clue").gen_clues.z(),
      },
      triggers = {
        -- Leader triggers
        { mode = "n", keys = "<Leader>" },
        { mode = "x", keys = "<Leader>" },

        -- Built-in completion
        { mode = "i", keys = "<C-x>" },

        -- `g` key
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },

        -- Marks
        { mode = "n", keys = "'" },
        { mode = "n", keys = "`" },
        { mode = "x", keys = "'" },
        { mode = "x", keys = "`" },

        -- Registers
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },
        { mode = "i", keys = "<C-r>" },
        { mode = "c", keys = "<C-r>" },

        -- Window commands
        { mode = "n", keys = "<C-w>" },

        -- `z` key
        { mode = "n", keys = "z" },
        { mode = "x", keys = "z" },
      },
    }

    require("mini.diff").setup {
      view = {
        priority = 5,
        signs = { add = "┃", change = "┃", delete = "▁" },
        style = "sign",
      },
    }

    require("mini.files").setup {
      mappings = { go_in_plus = "<cr>" },
      options = { permanent_delete = false, use_as_default_explorer = true },
      windows = { width_focus = 25, width_nofocus = 15 },
    }

    require("mini.hipatterns").setup {
      highlighters = {
        fixme = {
          extmark_opts = { sign_text = "" },
          group = "MiniHipatternsFixme",
          pattern = "FIXME:",
        },
        hack = {
          extmark_opts = { sign_text = "" },
          group = "MiniHipatternsHack",
          pattern = "HACK:",
        },
        note = {
          extmark_opts = { sign_text = "" },
          group = "MiniHipatternsNote",
          pattern = "NOTE:",
        },
        todo = {
          extmark_opts = { sign_text = "" },
          group = "MiniHipatternsTodo",
          pattern = "TODO:",
        },
      },
    }
  end,
}
