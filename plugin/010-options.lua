-- Options
local globals = {
  mapleader = " ",
  maplocalleader = " ",
  netrw_liststyle = 3,
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
  showmode = false,
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
}

-- load globals and options
for n,v in pairs(globals) do vim.g[n] = v end
for n,v in pairs(options) do vim.o[n] = v end

vim.opt.path:append("**")
vim.opt.wildignore:append { "*/.git/*" }

local diagnostic_opts = {
  -- Show signs on top of any other sign, but only for warnings and errors
  signs = { priority = 9999, severity = { min = 'WARN', max = 'ERROR' } },

  -- Show all diagnostics as underline (for their messages type `<Leader>ld`)
  underline = { severity = { min = 'HINT', max = 'ERROR' } },

  -- Show more details immediately for errors on the current line
  virtual_lines = false,
  virtual_text = {
    current_line = true,
    severity = { min = 'ERROR', max = 'ERROR' },
  },

  -- Don't update diagnostics when typing
  update_in_insert = false,
}

Config.later(function() vim.diagnostic.config(diagnostic_opts) end)

vim.cmd([[
  "hi ColorColumn guibg=#ABB2BF
  augroup colorcol
    au!
    au InsertEnter * setlocal colorcolumn=80
    au InsertLeave * setlocal colorcolumn=0
  augroup END
]])
