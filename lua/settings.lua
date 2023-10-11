vim.g.mapleader = ','

-- looks cleaner to me
local opt = vim.o

-- settings
opt.showmatch = true -- show matching brackets
opt.synmaxcol = 300 -- stop syntax highlight after x lines for perf
opt.laststatus = 2 -- always show status line
opt.smartindent = true
opt.autoindent = true
opt.copyindent = true
opt.autowrite = true -- write when switching buffers
opt.autowriteall = true -- write on :quit
opt.number = true
opt.numberwidth = 4
opt.formatoptions = 'tcqpronj'
opt.wrap = true
opt.textwidth = 0
opt.title = true
opt.list = true
opt.clipboard = "unnamedplus"
opt.history = 1000
opt.swapfile = false
opt.termguicolors = true
opt.showbreak= '↪'
opt.showcmd = true
opt.spell = true
opt.syntax = true
opt.timeoutlen = 300
opt.timeout = true

-- Buffers aren't destroyed (required for nvim-terminal)
opt.hidden = true

-- search
opt.ignorecase = true -- case insensitive searching
opt.smartcase = true -- case insensitive unless used in search

-- I hate when things are hidden, so hard to understand their shape
opt.conceallevel = 0

o.winwidth = 10
o.winminwidth = 10
o.equalalways = false

vim.cmd([[
  au BufWritePre *.go :silent! lua require('go.format').gofmt()
]])

vim.cmd([[
  augroup cline
      au!
      au WinLeave * set nocursorline
      au WinEnter * set cursorline
      au InsertEnter * set nocursorline
      au InsertLeave * set cursorline
  augroup END
]])

vim.cmd([[
  hi ColorColumn guibg=#ABB2BF
  augroup colorcol
    au!
    au InsertEnter * setlocal colorcolumn=80
    au InsertLeave * setlocal colorcolumn=0
  augroup END
]])

-- If you have an init.lua
vim.api.nvim_create_autocmd("FileType", {pattern = "markdown", command = "set awa"})
-- Use the following if your buffer is set to become hidden
vim.api.nvim_create_autocmd("BufLeave", {pattern = "*.md", command = "silent! wall"})
