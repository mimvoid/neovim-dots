return {
  "saghen/blink.cmp",
  version = "v0.*",

  lazy = false,

  dependencies = {
    { "rafamadriz/friendly-snippets" },
  },

  ---@module "blink.cmp"
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "default" },
    sources = {
      completion = {
        enabled_providers = { "path", "lsp", "snippets", "buffer" },
      },

      providers = {
        path = {
          name = "Path",
          module = "blink.cmp.sources.path",
          score_offset = 3,
          opts = {
            trailing_slash = false,
            label_trailing_slash = true,
            get_cwd = function(context)
              return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
            end,
            show_hidden_files_by_default = false,
          },
        },
        lsp = {
          name = "LSP",
          module = "blink.cmp.sources.lsp",
          enabled = true,
          should_show_items = true,
          min_keyword_length = 1,
        },
        snippets = {
          name = "Snippets",
          module = "blink.cmp.sources.snippets",
          score_offset = -3,
          min_keyword_length = 2,
          opts = {
            friendly_snippets = true,
            search_paths = { vim.fn.stdpath("config") .. "/snippets" },
            global_snippets = { "all" },
            extended_filetypes = {},
            ignored_filetypes = {},
          },
        },
        buffer = {
          name = "Buffer",
          module = "blink.cmp.sources.buffer",
          min_keyword_length = 3,
          fallback_for = { "lsp" },
        },

        -- cmp_r = {
        --   name = 'cmp_r',
        --   module = 'blink.compat.source',
        --   opts = { impersonate_nvim_cmp = true, },
        -- },
      },
    },

    accept = { auto_brackets = { enabled = true } },
    highlight = { use_nvim_cmp_as_default = true },
    nerd_font_variant = "mono",
    triggers = { signature_help = { enabled = true } },

    windows = {
      autocomplete = {
        border = vim.g.borderStyle,
      },
      documentation = {
        border = vim.g.borderStyle,
        auto_show = true,
      },
      signature_help = {
        border = vim.g.borderStyle,
      },
    },
  },
  opts_extend = { "sources.completion.enabled_providers" },
}
