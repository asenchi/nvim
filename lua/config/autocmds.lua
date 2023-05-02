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

-- Golang likes 4
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "go",
  callback = function()
    vim.opt_local.tabstop = 4
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.json", "*.md", "*.markdown" },
  callback = function()
    vim.o.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.ex", "*.exs", "mix.lock" },
  callback = function()
    vim.o.filetype = "elixir"
    vim.bo.syntax = "elixir"
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.tfstate", "*.tfstate.backup" },
  callback = function()
    vim.o.filetype = "json"
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.tf", "*.tfbackend" },
  callback = function()
    vim.o.filetype = "terraform"
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.terraformrc", "terraform.rc", "*.hcl" },
  callback = function()
    vim.o.filetype = "hcl"
  end,
})
