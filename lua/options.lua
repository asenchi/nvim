-- Options

local globals = {
  mapleader = ",",
  maplocalleader = ",",
  netrw_liststyle = 3,
  -- used by to toggle diagnostics
  diagnoistics_active = true,
  terraform_fmt_on_save = 1,
  terraform_align = 1,
}

local options = {
  autoindent = true,
  autoread = true,
  autowrite = true,
  autowriteall = true,
  backup = false,
  breakindent = true,
  clipboard = "unnamedplus",
  completeopt = "menu,menuone,noinsert,preview,noselect",
  conceallevel = 0,
  copyindent = true,
  formatoptions = 'tcqpronj',
  helpheight = 10,
  hidden = true,
  history = 1000,
  ignorecase = true,
  inccommand = "split",
  laststatus = 2,
  list = true,
  number = true,
  numberwidth = 4,
  showbreak= '↪',
  showcmd = true,
  showmatch = true,
  smartcase = true,
  smartindent = true,
  spell = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  synmaxcol = 300,
  termguicolors = true,
  textwidth = 0,
  timeout = true,
  timeoutlen = 300,
  title = true,
  wildignorecase = true,
  winborder = 'rounded',
  wrap = true,
  writebackup = false,

  -- used for anuvyklack/windows.nvim
  winwidth = 10,
  winminwidth = 10,
  equalalways = false,
}

-- load globals and options
for n,v in pairs(globals) do vim.g[n] = v end
for n,v in pairs(options) do vim.o[n] = v end

vim.opt.path:append("**")
vim.opt.wildignore:append { "*/.git/*" }

vim.diagnostic.config({
  virtual_text = { current_line = true },
  virtual_lines = { current_line = true },
  underline = { current_line = true },
})


vim.cmd([[
  hi ColorColumn guibg=#ABB2BF
  augroup colorcol
    au!
    au InsertEnter * setlocal colorcolumn=80
    au InsertLeave * setlocal colorcolumn=0
  augroup END
]])

