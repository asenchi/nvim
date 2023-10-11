-- Set our site/pack directory in the repo
local this = 
local this_site = 
vim.opt.packpath:append(vim.fn.expand(this_site))

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('utilities')
require('plugins')


-- require('settings')
-- require('mappings')

-- colortheme
require('onedark').setup {
  style = 'darker'
}
require('onedark').load()
