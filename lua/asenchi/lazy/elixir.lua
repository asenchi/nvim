return {
  {
    "elixir-tools/elixir-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")

      elixir.setup({
        nextls = { enable = true },
        elixirls = {
          enable = true,
          -- default settings, use the `settings` function to override settings
          settings = elixirls.settings({
            dialyzerEnabled = false,
            fetchDeps = false,
            enableTestLenses = false,
            suggestSpecs = false,
          }),
          on_attach = function(client, bufnr)
            local map_opts = { buffer = true, noremap = true}
            -- run the codelens under the cursor
            vim.keymap.set("n", "<space>ef", ":ElixirFromPipe<cr>", map_opts)
            vim.keymap.set("n", "<space>et", ":ElixirToPipe<cr>", map_opts)
            vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", map_opts)
          end,
        },
        projectionist = { enable = true },
      })
    end,
  }
}
