local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Clear search results
map("", "<leader><space>", ":nohlsearch<CR>", opts)
map("", '<leader>q', ':close<CR>', opts)
map("n", '<leader>xr', ":%s/<C-r><C-w>//g<Left><Left>", opts)
map("n", '<leader>L', ":Lazy<CR>", opts)

-- someday figure this out in lua
vim.cmd('map <leader>e  :e <C-R>=expand("%:p:h") . "/"<CR>')

-- tabs
map("", '<leader>tt', ':tabnew %<CR>', opts)
map("", '<leader>tc', '<Esc>:tabclose<CR>', opts)
map("", ']t', ':tabn<CR>', opts)
map("", '[t', ':tabp<CR>', opts)

-- buffers
map("n", '<leader>bf', ':bfirst<CR>', opts)
map("n", '<leader>bl', ':blast<CR>', opts)

map("", '<C-b>', ':NvimTreeToggle<CR>')

map('n', '<leader>d', vim.diagnostic.setloclist, opts)

map("", '<leader>K', ':retab<CR>', opts)

-- exit the terminal easily
map("t", '<Esc>', '<C-\\><C-n><CR>', opts)

-- Terminal creation with different layouts
map("n", "<C-t>", ":TermNew layout=below<CR>", opts)   -- Split below
map("n", "<leader>cs", ":TermNew layout=below<CR>", opts)   -- Split below
map("n", "<leader>cv", ":TermNew layout=right<CR>", opts)   -- Vertical split
map("n", "<leader>cf", ":TermNew layout=float<CR>", opts)   -- Floating window
map("n", "<leader>ct", ":TermNew layout=tab<CR>", opts)     -- New tab

-- Open terminal picker
map("n", "<leader>cl", ":TermSelect<CR>", opts)  -- List and select terminals

-- Send text to last focused terminal
map("n", "<leader>cy", ":TermSend! new_line=false<CR>", opts)  -- Send line without newline
map("x", "<leader>cy", ":TermSend! new_line=false<CR>", opts)  -- Send selection without newline

-- Send and show output without focusing terminal
map("n", "<leader>cx", ":TermSend! action=visible<CR>", opts)  -- Execute in terminal, keep focus
map("x", "<leader>cx", ":TermSend! action=visible<CR>", opts)  -- Execute selection in terminal, keep focus

-- Send as markdown code block
map("n", "<leader>cS", ":TermSend! action=visible trim=false decorator=markdown_code<CR>", opts)
map("x", "<leader>cS", ":TermSend! action=visible trim=false decorator=markdown_code<CR>", opts)

-- Move to a window
map("", '<leader>p', ':lua require("nvim-window").pick()<CR>', opts)
map("", '<leader>v', ':vsplit<CR>', opts)
map("", '<leader>s', ':split<CR>', opts)

local timer = vim.uv.new_timer()
local blink = function()
  if not timer then
    timer = vim.uv.new_timer()
  end
  if timer then
    local cnt, blink_times = 0, 8
    timer:start(0, 100, vim.schedule_wrap(function()
        vim.cmd('set cursorcolumn! cursorline!')
        cnt = cnt + 1
        if cnt == blink_times and timer then timer:stop() end
    end))
  end
end
map("n", '<leader>cb', blink, opts)
