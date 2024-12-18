function keymap(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
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
nmap('<leader>bn', ':bnext<CR>')
nmap('<leader>bp', ':bprevious<CR>')
nmap('<leader>bf', ':bfirst<CR>')
nmap('<leader>bl', ':blast<CR>')

map('<C-b>', ':NvimTreeToggle<CR>')

-- fzf-lua
map('<leader>fb', ':lua require("fzf-lua").buffers()<CR>')
map('<leader>ff', ':lua require("fzf-lua").files()<CR>')
map('<leader>fg', ':lua require("fzf-lua").live_grep()<CR>')
map('<leader>fb', ':lua require("fzf-lua").buffers()<CR>')
map('<leader>fh', ':lua require("fzf-lua").btags()<CR>')
vim.keymap.set({ "n", "v", "i" }, "<C-x><C-f>", function() require("fzf-lua").complete_path() end, { silent = true, desc = "Fuzzy complete path" })

map('<leader>K', ':retab<CR>')

-- exit the terminal easily
tmap('<Esc>', '<C-\\><C-n><CR>')

map('<leader>$', ':luafile $MYVIMRC')

-- Move to a window
map('<leader>p', ':lua require("nvim-window").pick()<CR>')
map('<leader>v', ':vsplit<CR>')
map('<leader>s', ':split<CR>')
