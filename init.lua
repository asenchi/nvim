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
]])
-- set bg=dark
-- highlight NormalFloat guibg=#333333

vim.loader.enable()
