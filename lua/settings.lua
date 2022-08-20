HOME = os.getenv("HOME")

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
opt.colorcolumn = 81 -- highlight the 81st column as an indicator of width
opt.number = true
opt.numberwidth = 4
opt.formatoptions = 'tcpronj'
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

-- Buffers aren't destroyed (required for nvim-terminal)
opt.hidden = true

-- search
opt.ignorecase = true -- case insensitive searching
opt.smartcase = true -- case insensitive unless used in search

vim.cmd([[
  au FileType go setl sw=4 ts=4 et
  au FileType elixir setl sw=2 sts=2 et
  au FileType sh setl sw=2 ts=2 et
  au FileType terraform setl sw=2 sts=2 ts=2
  au FileType lua setl sw=2 ts=2 et
  au FileType toml setl sw=2 ts=2 et
  au BufNewFile,BufRead bash setf sh
  au BufNewFile,BufRead sh setf sh
  au BufNewFile,BufRead *.md set ft=mkd syntax=markdown
  au BufNewFile,BufRead *.markdown set ft=mkd syntax=markdown
  au BUfNewFile,BufRead *.ex,*.exs set ft=elixir syntax=elixir
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

-- If you have an init.lua
vim.api.nvim_create_autocmd("FileType", {pattern = "markdown", command = "set awa"})
-- Use the following if your buffer is set to become hidden
vim.api.nvim_create_autocmd("BufLeave", {pattern = "*.md", command = "silent! wall"})
