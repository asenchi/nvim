function keymap(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function map(shortcut, command)
  keymap('', shortcut, command)
end

function nmap(shortcut, command)
  keymap('n', shortcut, command)
end

function imap(shortcut, command)
  keymap('i', shortcut, command)
end

function vmap(shortcut, command)
  keymap('v', shortcut, command)
end

function cmap(shortcut, command)
  keymap('c', shortcut, command)
end

function tmap(shortcut, command)
  keymap('t', shortcut, command)
end

map("<leader>c", ":nohlsearch<cr>")
nmap("n", "nzzzv")
nmap("N", "Nzzzv")
map('<leader><space>', ':nohlsearch<CR>')

-- someday figure this out in lua
vim.cmd('map <leader>e  :e <C-R>=expand("%:p:h") . "/"<CR>')

map('<leader>t', ':tabnew %<CR>')
map('<leader>tn', ':tabn<cr>')
map('<leader>tp', ':tabp<cr>')
map('<leader>tc', '<esc>:tabclose<cr>')

map('<leader>V', ':vsplit<cr>')
map('<leader>H', ':split<cr>')
map('<leader>q', ':close<cr>')

map('<leader>w', ':lua require("nvim-window").pick()<CR>')

map('<leader>l', ':IndentLinesToggle<CR>')

map('<leader>b', ':NvimTreeToggle<CR>')
map('<C-b>', ':NvimTreeToggle<CR>')

map('<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>')
map('<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>')
map('<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>')
map('<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>')

map('<leader>K', ':retab<cr>')

map('<C-W>m', '<Cmd>WinShift<cr>')
map('<C-W>X', '<Cmd>WinShift swap<cr>')

map('<leader>1', '<Cmd>terminal<cr>')
