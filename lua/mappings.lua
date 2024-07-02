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

-- Clear search results
map("<leader><space>", ":nohlsearch<CR>")
map('<leader>q', ':close<CR>')
nmap('<leader>xr', ":%s/<C-r><C-w>//g<Left><Left>")

-- someday figure this out in lua
vim.cmd('map <leader>e  :e <C-R>=expand("%:p:h") . "/"<CR>')

-- tabs
map('<leader>tt', ':tabnew %<CR>')
map('<leader>tc', '<Esc>:tabclose<CR>')
map('<leader>tn', ':tabn<CR>')
map('<leader>tp', ':tabp<CR>')

-- buffers
map('<leader>fb', ':lua require("telescope.builtin").buffers()<CR>')
nmap('<leader>bn', ':bnext<CR>')
nmap('<leader>bp', ':bprevious<CR>')
nmap('<leader>bf', ':bfirst<CR>')
nmap('<leader>bl', ':blast<CR>')

map('<leader>l', ':IndentLinesToggle<CR>')

map('<leader>p', ':NvimTreeToggle<CR>')
map('<C-b>', ':NvimTreeToggle<CR>')

-- telescope
map('<leader>ff', ':lua require("telescope.builtin").find_files()<CR>')
map('<leader>fg', ':lua require("telescope.builtin").live_grep()<CR>')
map('<leader>fb', ':lua require("telescope.builtin").buffers()<CR>')
map('<leader>fh', ':lua require("telescope.builtin").help_tags()<CR>')

map('<leader>K', ':retab<CR>')

-- exit the terminal easily
tmap('<Esc>', '<C-\\><C-n><CR>')

-- Open preview
map('<F5>', ':!make<CR>')
-- Run previous command
map('<F6>', ':w<CR>:!!<CR>')
-- Get popup window of diagnostic on current line
-- map('<F7>', ':lua vim.diagnostic.open_float(0)<CR>')

map('<leader>$', ':luafile $MYVIMRC')

-- Move to a window
map('<leader>p', ':lua require("nvim-window").pick()<CR>')
map('<leader>v', ':vsplit<CR>')
map('<leader>s', ':split<CR>')
-- Move a window
map('<leader>wm', ':WinShift<CR>')
-- Swap windows
map('<leader>wS', ':WinShift swap<CR>')
-- Auto-size windows
map('<leader>wa', ':WindowsToggleAutowidth<CR>')
map('<leader>wz', ':WindowsMaximize<CR>')
