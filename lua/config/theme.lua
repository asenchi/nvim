-- Theme configuration
vim.opt.termguicolors = true
vim.cmd.colorscheme("quiet")

-- Custom highlights
local highlights = {
  Keyword = { bold = true },
  Comment = { italic = true, fg = "#777777" },
  Constant = { fg = "#999999" },
  Normal = { bg = "none" },
  DiagnosticError = { fg = "red" },
  DiagnosticWarn = { fg = "orange" },
  DiagnosticInfo = { fg = "cyan" },
  DiagnosticHint = { fg = "green" },
  DiagnosticFloatingError = { bg = "#222222", fg = "red" },
  DiagnosticFloatingWarn = { bg = "#222222", fg = "orange" },
  DiagnosticFloatingInfo = { bg = "#222222", fg = "cyan" },
  DiagnosticFloatingHint = { bg = "#222222", fg = "green" },
}

for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, opts)
end
