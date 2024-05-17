local elixir = require("elixir")
local elixirls = require("elixir.elixirls")

elixir.setup({
  credo = {
    enable = false,
  },
  elixirls = {
    enable = true,
    -- specify a repository and branch
    repo = "mhanberg/elixir-ls", -- defaults to elixir-lsp/elixir-ls
    branch = "mh/all-workspace-symbols", -- defaults to nil, just checkouts out the default branch, mutually exclusive with the `tag` option
    tag = "v0.14.6", -- defaults to nil, mutually exclusive with the `branch` option

    -- default settings, use the `settings` function to override settings
    settings = elixirls.settings({
      dialyzerEnabled = true,
      fetchDeps = false,
      enableTestLenses = false,
      suggestSpecs = false,
    }),

    on_attach = function(client, bufnr)
      local map_opts = { buffer = true, noremap = true}

      -- run the codelens under the cursor
      vim.keymap.set("n", "<space>r",  vim.lsp.codelens.run, map_opts)
      -- remove the pipe operator
      vim.keymap.set("n", "<space>ef", ":ElixirFromPipe<cr>", map_opts)
      -- add the pipe operator
      vim.keymap.set("n", "<space>et", ":ElixirToPipe<cr>", map_opts)
      vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", map_opts)
    end
  }
})
