-- set the comment string for hcl/terraform files
vim.bo.commentstring = "# %s"

-- set tabstop to 2
vim.bo.tabstop = 2

vim.g.terraform_exec_path = vim.g.terraform_exec_path or 'terraform'
if vim.fn.executable(vim.g.terraform_binary_path) ~= 1 then
  return
end

vim.api.nvim_buf_create_user_command(0, 'Terraform', function(opts)
  local cmd = string.format('!%s %s -no-color', vim.g.terraform_binary_path, opts.args)
  vim.cmd(cmd)
end, {
  nargs = '+',
  complete = 'custom,terraform#commands', -- Calls the existing Vimscript completion function
  desc = 'Execute terraform command'
})

-- Equivalent to `command! -nargs=0 -buffer TerraformFmt call terraform#fmt()`
vim.api.nvim_buf_create_user_command(0, 'TerraformFmt', function()
  vim.fn['terraform#fmt']()
end, {
  nargs = 0,
  desc = 'Format terraform file'
})

-- Update undo_ftplugin
local undo = (vim.b.undo_ftplugin or "")
vim.b.undo_ftplugin = undo .. '|delcommand Terraform|delcommand TerraformFmt'

-- Autocommands for Formatting on Save
if vim.g.terraform_fmt_on_save == 1 then
  local group = vim.api.nvim_create_augroup('vim.terraform.fmt', { clear = true })
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = group,
    pattern = { '*.tf', '*.tfvars', '*.tftest.hcl' },
    callback = function()
      vim.fn['terraform#fmt']()
    end,
  })
end
