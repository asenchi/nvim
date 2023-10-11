local u = require("utilities")

u.nmap('<leader>cb', u.blink_cursor(), "Blink cursor location")
u.map('<leader><space>', ":nohlsearch<CR>", "Clear search")
u.map('<leader>e', ':e <C-R>=expand(%:p:h") . "/"<CR>', "Edit a file in current path")
-- vim.cmd('map <leader>e  :e <C-R>=expand("%:p:h") . "/"<CR>')

-- buffers
u.nmap('<leader>bn', ':bnext<CR>', "Next Buffer")
u.nmap('<leader>bp', ':bprevious<CR>', "Prev Buffer")

-- NvimTree
u.map('<leader>p', ':NvimTreeToggle<CR>', "Toggle NvimTree")
u.map('<C-b>', ':NvimTreeToggle<CR>', "Toggle NvimTree")

-- telescope
u.map('<leader>ff', ':lua require("telescope.builtin").find_files()<CR>', "Find Files")
u.map('<leader>fg', ':lua require("telescope.builtin").live_grep()<CR>', "Live Grep")
u.map('<leader>fb', ':lua require("telescope.builtin").buffers()<CR>', "Find Buffers")
u.map('<leader>fh', ':lua require("telescope.builtin").help_tags()<CR>', "Find Tags")

-- exit the terminal easily
u.tmap('<Esc>', '<C-\\><C-n><CR>')

-- Open preview
u.map('<F5>', ':!make<CR>', "Run 'make'")
-- Get popup window of diagnostic on current line
u.map('<F7>', ':lua vim.diagnostic.open_float(0)<CR>', "Popup Diagnostics")

-- Move to a window
u.map('<leader>p', ':lua require("nvim-window").pick()<CR>', "Pick a Window")
u.map('<leader>|', ':vsplit<CR>', "Split Vertically")
u.map('<leader>-', ':split<CR>', "Split Horizontally")
-- Move a window
u.map('<leader>wm', ':WinShift<CR>', "Shift Windows")
-- Swap windows
u.map('<leader>ws', ':WinShift swap<CR>', "Swap Windows")
-- Auto-size windows
u.map('<leader>wa', ':WindowsToggleAutowidth<CR>', "Toggle Autowidth")
u.map('<leader>wz', ':WindowsMaximize<CR>', "Maximize Window")
