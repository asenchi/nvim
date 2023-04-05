-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.o.relativenumber = false

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
