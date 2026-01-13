-- Set local tabstop and shiftwidth to 4
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
-- Ensure comments are not automatically inserted on new lines (example for Lua)
vim.opt_local.comments:remove(":--")
