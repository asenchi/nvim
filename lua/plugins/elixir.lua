return {
  -- elixir
  {
    "elixir-tools/elixir-tools.nvim",
    ft = { "elixir", "eex", "heex", "surface" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")
      elixir.setup({
        credo = {},
        elixirls = {
          enabled = true,
          settings = elixirls.settings({
            dialyzerEnabled = false,
            enableTestLenses = false,
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
          end,
        },
      })
    end,
  },
}
