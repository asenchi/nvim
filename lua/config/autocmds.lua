-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("colorcol", { clear = true }),
  pattern = "*",
  callback = function(ev)
    vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#565f89" })
    if ev.event == "InsertEnter" then
      vim.opt.colorcolumn = "80"
    elseif ev.event == "InsertLeave" then
      vim.opt.colorcolumn = "0"
    end
  end,
})
