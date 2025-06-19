-- Search Google
vim.api.nvim_create_user_command('Google', function(o)
  local escaped = vim.uri_encode(o.args)
  local url = ('https://www.google.com/search?q=%s'):format(escaped)
  vim.ui.open(url)
end, { nargs = 1, desc = "Google search" })


vim.api.nvim_create_user_command('Bible', function(o)
  local escaped = vim.uri_encode(o.args)
  local url = ('https://www.biblegateway.com/passage/?search=%s&version=NIV;CSB'):format(escaped)
  vim.ui.open(url)
end, { nargs = 1, desc = "BibleGateway search" })

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.highlight.on_yank() end,
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }), pattern = "*",
})
