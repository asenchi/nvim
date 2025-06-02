---[[ Lazy.nvim package manager bootstrap and some essential plugins installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell ~= 0 then
    error('Error cloning lazy.vim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = "asenchi.plugins",
  change_detection = { notify = false },
})
