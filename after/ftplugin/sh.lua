-- Set buffer-local options
vim.opt.local.shiftwidth = 2
vim.opt.local.tabstop = 2
vim.opt.local.expandtab = true -- Use spaces instead of tabs
vim.opt.local.formatoptions = "tcqrn" -- Adjust text formatting options

-- Example of a buffer-local keymap (Normal mode, leader + x to make file executable)
vim.api.nvim_buf_set_keymap(
  0, -- Buffer number 0 means the current buffer
  'n', -- Normal mode
  '<leader>x', -- The key combination
  ':silent !chmod +x %<CR>:echo "Made file executable"<CR>', -- The command to run
  { noremap = true, silent = true } -- Options
)

-- Example of a buffer-local command (Run the current script in the terminal)
vim.api.nvim_create_buf_cmd(0, "RunBashScript", ":terminal ./%", {nargs = 0})
-- You can now run :RunBashScript when editing a bash file
