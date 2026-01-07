-- Replaces: setlocal formatoptions-=t formatoptions+=croql and silent! setlocal formatoptions+=j
vim.opt_local.formatoptions:remove('t')
vim.opt_local.formatoptions:append('croql')
pcall(function() vim.opt_local.formatoptions:append('j') end) -- Equivalent to silent!

-- set the comment string for hcl/terraform files
vim.bo.commentstring = "# %s"
vim.b.undo_ftplugin = 'setlocal formatoptions<'
vim.b.undo_ftplugin = vim.b.undo_ftplugin .. ' commentstring<'
