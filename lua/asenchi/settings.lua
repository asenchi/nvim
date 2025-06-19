vim.diagnostic.config({
  virtual_text = { current_line = true },
  virtual_lines = { current_line = true },
})

vim.g.netrw_liststyle = 3

-- settings
vim.o.autoindent = true
vim.o.autoread = true
vim.o.autowrite = true -- write when switching buffers
vim.o.autowriteall = true -- write on :quit
vim.o.breakindent = true
vim.o.clipboard = "unnamedplus"
vim.o.copyindent = true
vim.o.formatoptions = 'tcqpronj'
vim.o.history = 1000
vim.o.laststatus = 2 -- always show status line
vim.o.list = true
vim.o.number = true
vim.o.numberwidth = 4
vim.o.showbreak= '↪'
vim.o.showcmd = true
vim.o.showmatch = true -- show matching brackets
vim.o.smartindent = true
vim.o.spell = true
vim.o.swapfile = false
vim.o.synmaxcol = 300 -- stop syntax highlight after x lines for perf
vim.o.termguicolors = true
vim.o.textwidth = 0
vim.o.timeoutlen = 300
vim.o.title = true
vim.o.wildignorecase = true
vim.o.wrap = true
vim.o.timeoutlen = 300
vim.o.timeout = true
vim.o.winborder = 'rounded'

vim.o.completeopt = "menu,menuone,noinsert,preview,noselect"

-- Buffers aren't destroyed (required for nvim-terminal)
vim.o.hidden = true

-- search
vim.o.ignorecase = true -- case insensitive searching
vim.o.smartcase = true -- case insensitive unless used in search
vim.o.inccommand = "split"

-- I hate when things are hidden, so hard to understand their shape
vim.o.conceallevel = 0

vim.opt.path:append("**")
vim.opt.wildignore:append { "*/.git/*" }

vim.cmd([[
  au FileType go setl sw=4 ts=4 et
  au FileType elixir setl sw=2 sts=2 et
  au FileType sh setl sw=2 ts=2 et
  au FileType hcl setl sw=2 sts=2 ts=2
  au FileType terraform setl sw=2 sts=2 ts=2
  au FileType lua setl sw=2 ts=2 et
  au FileType toml setl sw=2 ts=2 et
  au FileType markdown setl tw=79
  au FileType css setl sw=2 ts=2 et
  au FileType html setl sw=2 ts=2 et
  au FileType json setl sw=2 ts=2 et

  silent! autocmd! filetypedetect BufRead,BufNewFile *.tf
  au BufNewFile,BufRead *.hcl set filetype=hcl
  au BufNewFile,BufRead *.terraformrc,terraform.rc set filetype=hcl
  au BufNewFile,BufRead *.tf,*.tfvars,*.tfbackend set filetype=terraform
  au BufNewFile,BufRead *.tfstate,*.tfstate.backup set filetype=json

  au BufNewFile,BufRead json set ft=json conceallevel=0
  au BufNewFile,BufRead bash setf sh
  au BufNewFile,BufRead sh setf sh
  au BufNewFile,BufRead css setf css
  au BufNewFile,BufRead html setf html
  au BufNewFile,BufRead *.md set ft=markdown syntax=markdown conceallevel=0
  au BufNewFile,BufRead *.markdown set ft=markdown syntax=markdown conceallevel=0
  au BUfNewFile,BufRead *.ex,*.exs set ft=elixir syntax=elixir
  au BufRead,BufNewFile mix.lock set filetype=elixir
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
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown", command = "set awa"
})

-- Use the following if your buffer is set to become hidden
vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*.md", command = "silent! wall"
})
