-- set the comment string for hcl/packer files
vim.bo.commentstring = "# %s"

-- set tabstop to 2
vim.bo.tabstop = 2

vim.g.packer_exec_path = vim.g.packer_exec_path or 'packer'
if vim.fn.executable(vim.g.packer_exec_path) ~= 1 then
  return
end

-- Update undo_ftplugin
local undo = (vim.b.undo_ftplugin or "")
vim.b.undo_ftplugin = undo .. '|delcommand packer|delcommand packerFmt'

local function packer_fmt()
  -- Use the global variable for the binary path
  local packer_bin = vim.g.packer_exec_path or "packer"

  -- Check if formatting is needed: 'w !packer fmt -check -'
  -- We use vim.fn.system to run this silently and check the exit code
  vim.fn.system(packer_bin .. " fmt -check -", vim.api.nvim_buf_get_lines(0, 0, -1, false))

  -- If exit code is 0, no changes are needed
  if vim.v.shell_error == 0 then
    return
  end

  -- Save the current window view (cursor position, scroll, etc.)
  local curw = vim.fn.winsaveview()

  -- Make a fake change to create a clean undo point
  -- Equivalent to: normal! ix <cr> normal! "_x
  vim.cmd([[normal! ix]])
  vim.cmd([[normal! "_x]])

  -- Prepare temporary file for stderr redirection
  local tmpfile = vim.fn.tempname()
  local shellredir_save = vim.o.shellredir

  -- Set shellredir to capture stderr to the temp file
  vim.o.shellredir = ">%s 2>" .. tmpfile

  -- Execute formatting on the entire buffer: %!packer fmt -no-color -
  -- We use vim.cmd for the filter command as it handles buffer replacement naturally
  vim.cmd(string.format("silent %%!%s fmt -no-color -", packer_bin))

  -- Restore original shellredir
  vim.o.shellredir = shellredir_save

  -- If formatting failed (shell_error != 0)
  if vim.v.shell_error ~= 0 then
    -- Undo the filter changes
    vim.cmd("silent undo")

    -- Read and echo the error messages from the temp file
    local output = vim.fn.readfile(tmpfile)
    if #output > 0 then
      vim.api.nvim_echo({{table.concat(output, "\n"), "ErrorMsg"}}, true, {})
    end
  end

  -- Cleanup: delete temp file and restore window view
  vim.fn.delete(tmpfile)
  vim.fn.winrestview(curw)
end

-- Optional: Export the function or create a command
vim.api.nvim_create_user_command("packerFmt", packer_fmt, {})

-- Autocommands for Formatting on Save
local group = vim.api.nvim_create_augroup('vim.packer.fmt', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = group,
  pattern = { '*.tf', '*.tfvars', '*.tftest.hcl' },
  callback = function()
    vim.cmd("packerFmt")
end})
