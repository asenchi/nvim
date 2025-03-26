return {
  cmd = vim.fn.expand("~/src/elixir-lsp/language_server.sh"),
  settings = {
    elixirLS = {
      dialyzerEnabled = true,
      fetchDeps = true,
    }
  },
}
