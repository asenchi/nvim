vim.lsp.enable({
  'gopls',
  'terraformls',
  'tflint',
  'solargraph',
  'elixirls',
  'lua-language-server',
})

-- Setup autocompletion
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

vim.cmd("set completeopt+=noselect")
vim.o.winborder = 'rounded'
