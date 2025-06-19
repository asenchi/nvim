require("config.options")
require("core.lazy")
require("core.lsp")
require("config.keymaps")
require("config.autocmds")

-- theme
vim.cmd([[
  set termguicolors
  colorscheme quiet
  highlight Keyword gui=bold
  highlight Comment gui=italic
  highlight Constant guifg=#999999
  highlight Normal ctermbg=none guibg=none
  highlight DiagnosticError guifg=red
  highlight DiagnosticWarn guifg=orange
  highlight DiagnosticInfo guifg=blue
  highlight DiagnosticHint guifg=green
  highlight DiagnosticFloatingError guibg=#222222 guifg=red
  highlight DiagnosticFloatingWarn  guibg=#222222 guifg=orange
  highlight DiagnosticFloatingInfo  guibg=#222222 guifg=blue
  highlight DiagnosticFloatingHint  guibg=#222222 guifg=green
]])
-- set bg=dark
-- highlight NormalFloat guibg=#333333

vim.loader.enable()
