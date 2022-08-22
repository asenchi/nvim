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

-- Stop recording... I really hate getting stuck in this
nmap('q', '<Nop>')

-- Clear search results
map("<leader><space>", ":nohlsearch<CR>")
nmap("n", "nzzzv")
nmap("N", "Nzzzv")

-- someday figure this out in lua
vim.cmd('map <leader>e  :e <C-R>=expand("%:p:h") . "/"<CR>')

-- tabs
map('<leader>tt', ':tabnew %<CR>')
map('<leader>tc', '<Esc>:tabclose<CR>')
map(']t', ':tabn<CR>')
map('[t', ':tabp<CR>')

-- buffers
nmap('[b', ':bprevious<CR>')
nmap(']b', ':bnext<CR>')
nmap('[B', ':bfirst<CR>')
nmap(']B', ':blast<CR>')

map('<leader>V', ':vsplit<CR>')
map('<leader>H', ':split<CR>')
map('<leader>q', ':close<CR>')

-- Move to a window
map('<leader>w', ':lua require("nvim-window").pick()<CR>')
-- Move a window
map('<leader>m', ':WinShift<CR>')
-- Swap windows
map('<leader>S', ':WinShift swap<CR>')

map('<leader>l', ':IndentLinesToggle<CR>')

map('<leader>b', ':NvimTreeToggle<CR>')
map('<C-b>', ':NvimTreeToggle<CR>')

-- telescope
map('<leader>ff', ':lua require("telescope.builtin").find_files()<CR>')
map('<leader>fg', ':lua require("telescope.builtin").live_grep()<CR>')
map('<leader>fb', ':lua require("telescope.builtin").buffers()<CR>')
map('<leader>fh', ':lua require("telescope.builtin").help_tags()<CR>')

map('<leader>K', ':retab<CR>')

-- exit the terminal easily
tmap('<Esc>', '<C-\\><C-n><CR>')

-- True Zen
map('<leader>zf', ':TZFocus<CR>')
map('<leader>zm', ':TZMinimalist<CR>')
map('<leader>za', ':TZAtaraxis<CR>')
-- Zen Mode
map('<leader>zz', ':ZenMode<CR>')

-- Open preview
map('<F5>', ':!make open<CR>')
-- Run previous command
map('<F6>', ':w<CR>:!!<CR>')
