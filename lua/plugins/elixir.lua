return {
  -- elixir
  {
    "mhanberg/elixir.nvim",
    ft = { "elixir", "eex", "heex", "surface" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local elixir = require("elixir")
      elixir.setup({
        settings = elixir.settings({
          dialyzerEnabled = true,
          fetchDeps = false,
          enableTestLenses = false,
          suggestSpecs = false,
        }),
        on_attach = function(_, _)
          local map_opts = { buffer = true, noremap = true }

          -- run the codelens under the cursor
          vim.keymap.set("n", "<space>r", vim.lsp.codelens.run, map_opts)
          -- remove the pipe operator
          vim.keymap.set("n", "<space>ef", ":ElixirFromPipe<cr>", map_opts)
          -- add the pipe operator
          vim.keymap.set("n", "<space>et", ":ElixirToPipe<cr>", map_opts)
          vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", map_opts)

          -- keybinds for vim-vsnip: https://github.com/hrsh7th/vim-vsnip
          vim.cmd([[imap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']])
          vim.cmd([[smap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']])
        end,
      })
    end,
  },
}
