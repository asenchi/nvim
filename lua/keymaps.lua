-- Mappings

-- Clear search results
vim.keymap.set("", "<leader><space>", ":nohlsearch<CR>", { desc = "General | Clear search highlights", silent = true })

-- open new tab with existing buffer
vim.keymap.set("", '<leader>tt', ':tabnew %<CR>', { desc = "Tabs | New tab from buffer", silent = true })

-- close existing tab
vim.keymap.set("", '<leader>tc', '<Esc>:tabclose<CR>', { desc = "Tabs | close tab", silent = true })

-- next tab
vim.keymap.set("n", ']t', ':tabn<CR>', { desc = "Tabs | next", silent = true })

-- prev tab
vim.keymap.set("n", '[t', ':tabp<CR>', { desc = "Tabs | prev", silent = true })

-- open NvimTree
vim.keymap.set("", '<C-b>', ':NvimTreeToggle<CR>', { desc = "General | Toggle tree", silent = true })

-- toggle diagnostics
vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist, { desc = "General | toggle diagnostics", silent = true })

-- terminal things
vim.keymap.set("", '<leader>K', ':retab<CR>', { desc = "General | Retab current buffer", silent = true })

-- exit the terminal easily
vim.keymap.set("t", '<Esc>', '<C-\\><C-n><CR>', { desc = "Terminal | Escape to normal mode", silent = true })

-- Terminal creation with different layouts
vim.keymap.set("n", "<C-t>", ":TermNew layout=below<CR>", { desc = "Terminal | Open below", silent = true })
vim.keymap.set("n", "<leader>cs", ":TermNew layout=below<CR>", { desc = "Terminal | Open below", silent = true })
vim.keymap.set("n", "<leader>cv", ":TermNew layout=right<CR>", { desc = "Terminal | Open right", silent = true })
vim.keymap.set("n", "<leader>cf", ":TermNew layout=float<CR>", { desc = "Terminal | Open float", silent = true })
vim.keymap.set("n", "<leader>ct", ":TermNew layout=tab<CR>", { desc = "Terminal | Open tab", silent = true })

-- Open terminal picker
vim.keymap.set("n", "<leader>cl", ":TermSelect<CR>", { desc = "Terminal | Select open", silent = true })

-- Send text to last focused terminal
vim.keymap.set("n", "<leader>cy", ":TermSend! new_line=false<CR>", { desc = "Terminal | Send selection to last open", silent = true })

-- Send selection without newline
vim.keymap.set("x", "<leader>cy", ":TermSend! new_line=false<CR>", { desc = "Terminal | Send select without new line", silent = true })

-- Send and show output without focusing terminal
vim.keymap.set({ "n", "x" }, "<leader>cx", ":TermSend! action=visible<CR>", { desc = "Terminal | Send and show output without changing focus", silent = true })

-- Move to a window
vim.keymap.set("", '<leader>w', ':lua require("nvim-window").pick()<CR>', { desc = "Window | Pick a window", silent = true })
vim.keymap.set("", '<leader>v', ':vsplit<CR>', { desc = "Window | vertical split", silent = true })
vim.keymap.set("", '<leader>s', ':split<CR>', { desc = "Window | horizontal split", silent = true })

vim.keymap.set("n", "<leader>CB", function()
  local timer = vim.uv.new_timer()
  if timer then
    local cnt, blink_times = 0, 8
    timer:start(0, 100, vim.schedule_wrap(function()
        vim.cmd('set cursorcolumn! cursorline!')
        cnt = cnt + 1
        if cnt == blink_times and timer then timer:stop() end
    end))
  end
end, { desc = "General | Blink cursor", silent = true })

vim.keymap.set("n", "<leader>xd", function()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.enable(false)
  else
    vim.g.diagnostics_active = true
    vim.diagnostic.enable(true)
  end
end, { desc = "General | Toggle vim diagnostics", noremap = true, silent = true })

-- Better Down
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { desc = "General | Better Down", expr = true, silent = true })

-- Better Up
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { desc = "General | Better Up", expr = true, silent = true })

-- Go to upper window
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "General | Go to upper window", silent = true })

-- Go to lower window
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "General | Go to lower window", silent = true })

-- Go to left window
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "General | Go to left window", silent = true })

-- Go to right window
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "General | Go to right window", silent = true })

-- Indent backward
vim.keymap.set("n", "<", "<<", { desc = "General | Indent backward", silent = true })

-- Indent forward
vim.keymap.set("n", ">", ">>", { desc = "General | Indent forward", silent = true })

-- Move the line up
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "General | Move the line up", silent = true })

-- Move the line down
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "General | Move the line down", silent = true })

-- Move the line up (Insert Mode)
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "General | Move the line up", silent = true })

-- Move the line down (Insert Mode)
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "General | Move the line down", silent = true })

-- Better Down (Visual Mode)
vim.keymap.set("v", "j", "v:count == 0 ? 'gj' : 'j'", { desc = "General | Better Down", expr = true, silent = true })

-- Better Up (Visual Mode)
vim.keymap.set("v", "k", "v:count == 0 ? 'gk' : 'k'", { desc = "General | Better Up", expr = true, silent = true })

-- Messages
vim.keymap.set("n", "<leader>nm", "<cmd>messages<cr>", { desc = "Neovim | Messages", silent = true })

-- Health
vim.keymap.set("n", "<leader>nh", "<cmd>checkhealth<cr>", { desc = "Neovim | Health", silent = true })

-- Version
vim.keymap.set("n", "<leader>nv", function()
  local version = vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
  return vim.notify(version, vim.log.levels.INFO, { title = "Neovim Version" })
end, { desc = "Neovim | Version", silent = true })

-- Restart Neovim
vim.keymap.set("n", "<leader>nn", function()
  -- check if the current version is the latesto
  if vim.version().minor >= 12 then
    vim.cmd "restart"
  else
    vim.notify("Restart isn't available in this neovim version", vim.log.levels.WARN, { title = "Restart" })
  end
end, { desc = "Neovim | Restart", silent = true })

-- Clean
vim.keymap.set("n", "<leader>pc", "<cmd>Lazy clean<cr>", { desc = "Lazy | Clean", silent = true })

-- Check
vim.keymap.set("n", "<leader>pC", "<cmd>Lazy check<cr>", { desc = "Lazy | Check", silent = true })

-- Debug
vim.keymap.set("n", "<leader>pd", "<cmd>Lazy debug<cr>", { desc = "Lazy | Debug", silent = true })

-- Install
vim.keymap.set("n", "<leader>pi", "<cmd>Lazy install<cr>", { desc = "Lazy | Install", silent = true })

-- Sync
vim.keymap.set("n", "<leader>ps", "<cmd>Lazy sync<cr>", { desc = "Lazy | Sync", silent = true })

-- Log
vim.keymap.set("n", "<leader>pl", "<cmd>Lazy log<cr>", { desc = "Lazy | Log", silent = true })

-- Home
vim.keymap.set("n", "<leader>ph", "<cmd>Lazy home<cr>", { desc = "Lazy | Home", silent = true })

-- Help
vim.keymap.set("n", "<leader>pH", "<cmd>Lazy help<cr>", { desc = "Lazy | Help", silent = true })

-- Profile
vim.keymap.set("n", "<leader>pp", "<cmd>Lazy profile<cr>", { desc = "Lazy | Profile", silent = true })

-- Update
vim.keymap.set("n", "<leader>pu", "<cmd>Lazy update<cr>", { desc = "Lazy | Update", silent = true })

-- Open at path of file in open buffer
vim.cmd('map <leader>e  :e <C-R>=expand("%:p:h") . "/"<CR>')

vim.keymap.set("", "<leader>fg", "<cmd>FzfLua live_grep_native<cr>", { desc = "FzF | Grep" })
vim.keymap.set("", "<leader>fgc", "<cmd>FzfLua grep_cword<cr>", { desc = "FzF | Grep word under cursor" })
vim.keymap.set("", "<leader>fgC", "<cmd>FzfLua grep_cword<cr>", { desc = "FzF | Grep WORD under cursor" })
vim.keymap.set("", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "FzF | Find files" })
vim.keymap.set("", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "FzF | Find buffers" })
vim.keymap.set("", "<leader>ft", "<cmd>FzfLua tabs<cr>", { desc = "FzF | Find tabs" })
vim.keymap.set("", "<leader>ss", "<cmd>FzfLua spell_suggest<cr>", { desc = "FzF | Spell suggest" })
vim.keymap.set("", "<leader>ft", "<cmd>FzfLua filetypes<cr>", { desc = "FzF | Change file-types" })
vim.keymap.set("", "<leader>kk", "<cmd>FzfLua keymaps<cr>", { desc = "FzF | View keymaps" })
vim.keymap.set("", "<leader>:", "<cmd>FzfLua command_history<cr>", { desc = "FzF | Command history" })
vim.keymap.set("", "<leader>sh", "<cmd>FzfLua search_history<cr>", { desc = "FzF | Search history" })
vim.keymap.set("", "<leader>ht", "<cmd>FzfLua help_tags<cr>", { desc = "FzF | Help tags" })
vim.keymap.set("", "<leader>hg", "<cmd>FzfLua highlights<cr>", { desc = "FzF | Highlights" })
vim.keymap.set("", "<leader>sc", "<cmd>FzfLua git_bcommits<cr>",     { desc = "FzF | Source control commits" })
vim.keymap.set("", "<leader>fd", "<cmd>FzfLua lsp_definitions<cr>", { desc = "FzF | LSP definitions" })
vim.keymap.set("", "<leader>fr", "<cmd>FzfLua lsp_references<cr>", { desc = "FzF | LSP references" })
vim.keymap.set("", "<leader>fi", "<cmd>FzfLua lsp_implementations<cr>", { desc = "FzF | LSP implementations" })
vim.keymap.set("", "<leader>ftd", "<cmd>FzfLua lsp_typedefs<cr>", { desc = "FzF | LSP type definitions" })
vim.keymap.set("", "<leader>fds", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "FzF | LSP document symbols" })
vim.keymap.set("", "<leader>fws", "<cmd>FzfLua lsp_workspace_symbols<cr>", { desc = "FzF | LSP workspace symbols" })
vim.keymap.set("", "<leader>ca", "<cmd>FzfLua lsp_code_actions<cr>", { desc = "FzF | LSP code actions" })
