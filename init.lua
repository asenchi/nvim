-- Put this at the top of 'init.lua'
local path_package = vim.fn.stdpath('data') .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    -- Uncomment next line to use 'stable' branch
    -- '--branch', 'stable',
    'https://github.com/nvim-mini/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require('mini.deps').setup()

-- NOTE: I found this pattern from the MiniMax configs
-- Define global configuration table
_G.Config = {}
-- Define custom autocommand group and helper to create autocommands.
local myaugroup = vim.api.nvim_create_augroup('asenchi', {})
_G.Config.new_autocmd = function(event, pattern, callback, desc)
  local opts = { group = myaugroup, pattern = pattern, callback = callback, desc = desc }
  vim.api.nvim_create_autocmd(event, opts)
end

vim.cmd("colorscheme asenchi")
