return {
  { "nvim-treesitter-endwise" },
  { "vim-matchup" },
  {
    "nvim-treesitter",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    after = function()
      -- Enable highlights and indentation on supported filetypes
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local buf, filetype = args.buf, args.match
          local lang = vim.treesitter.language.get_lang(filetype)

          -- Check if the language's parser is loaded
          if lang and vim.treesitter.language.add(lang) then
            vim.treesitter.start(buf, lang)
          end
        end
      })
    end,
  },
}
