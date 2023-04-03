-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- someday figure this out in lua
vim.cmd('map <leader>a  :e <C-R>=expand("%:p:h") . "/"<CR>')
