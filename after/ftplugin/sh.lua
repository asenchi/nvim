-- Set buffer-local options
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.expandtab = true -- Use spaces instead of tabs
vim.opt_local.formatoptions = "tcqrn" -- Adjust text formatting options

-- Example of a buffer-local keymap (Normal mode, leader + x to make file executable)
vim.api.nvim_buf_set_keymap(
  0, -- Buffer number 0 means the current buffer
  'n', -- Normal mode
  '<leader>x', -- The key combination
  ':silent !chmod +x %<CR>:echo "Made file executable"<CR>', -- The command to run
  { noremap = true, silent = true } -- Options
)
