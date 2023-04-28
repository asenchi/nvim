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

vim.api.nvim_create_autocmd({ "WinEnter", "WinLeave", "InsertEnter", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("cline", { clear = true }),
  pattern = "*",
  callback = function(ev)
    if ev.event == "InsertLeave" or ev.event == "WinEnter" then
      vim.opt.cursorline = true
    elseif ev.event == "InsertEnter" or ev.event == "WinLeave" then
      vim.opt.cursorline = false
    end
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "go",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "bash", "sh", "hcl", "elixir", "terraform", "lua", "json" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})
