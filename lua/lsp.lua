-- This is copied straight from blink
-- https://cmp.saghen.dev/installation#merging-lsp-capabilities
local capabilities = {
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    },
  },
}

-- capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
vim.lsp.config('*', {
  -- capabilities = capabilities,
  root_markers = { ".git" },
})

vim.lsp.enable({
  'html',
  'json',
  'cssls',
  'gopls',
  'terraformls',
  'tflint',
  'solargraph',
  'elixirls',
  'lua-language-server',
})

-- -- Setup autocompletion
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if client:supports_method('textDocument/completion') then
--       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--     end
--   end,
-- }

---[[AUTOCOMPLETION SETUP
vim.o.completeopt = "menu,noselect,popup,fuzzy"

---[[ Setup keymaps so we can accept completion using Enter and choose items using arrow keys or Tab.
local pumMaps = {
  ['<Tab>'] = '<C-n>',
  ['<S-Tab>'] = '<C-p>',
  ['<Down>'] = '<C-n>',
  ['<Up>'] = '<C-p>',
  ['<CR>'] = '<C-y>',
}
for insertKmap, pumKmap in pairs(pumMaps) do
  vim.keymap.set('i', insertKmap, function()
    return vim.fn.pumvisible() == 1 and pumKmap or insertKmap
  end, { expr = true })
end
---]]

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    ---[[Code required to activate autocompletion and trigger it on each keypress
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    client.server_capabilities.completionProvider.triggerCharacters = vim.split(
      "qwertyuiopasdfghjklzxcvbnm. ", ""
    )
    vim.api.nvim_create_autocmd({ 'TextChangedI' }, {
      buffer = args.buf,
      callback = function()
        vim.lsp.completion.get()
      end
    })
    vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    ---]]

    ---[[Code required to add documentation popup for an item
    local _, cancel_prev = nil, function() end
    vim.api.nvim_create_autocmd('CompleteChanged', {
      buffer = args.buf,
      callback = function()
        cancel_prev()
        local info = vim.fn.complete_info({ 'selected' })
        local completionItem = vim.tbl_get(
          vim.v.completed_item, 'user_data', 'nvim', 'lsp', 'completion_item'
        )
        if nil == completionItem then
          return
        end
        _, cancel_prev = vim.lsp.buf_request(args.buf,
          vim.lsp.protocol.Methods.completionItem_resolve,
          completionItem,
          function(err, item, ctx)
            if not item then
              return
            end
            local docs = (item.documentation or {}).value
            local win = vim.api.nvim__complete_set(info['selected'], { info = docs })
            if win.winid and vim.api.nvim_win_is_valid(win.winid) then
              vim.treesitter.start(win.bufnr, 'markdown')
              vim.wo[win.winid].conceallevel = 3
            end
          end)
      end
    })
    ---]]
  end
})
---AUTOCOMPLETION SETUP END]])

vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Prev Diagnostic" })

vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next Diagnostic" })
