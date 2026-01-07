-- Local buffer settings
vim.opt_local.lisp = false
vim.opt_local.autoindent = true
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.expandtab = true
vim.opt_local.indentexpr = "v:lua.hcl_indent()"
vim.opt_local.indentkeys:append({ "<:>", "0=}", "0=)" })

-- Undo indent settings
vim.b.undo_indent = "setlocal lisp< autoindent< shiftwidth< tabstop< softtabstop< expandtab< indentexpr< indentkeys<"

-- The indentation function
_G.hcl_indent = function()
  local lnum = vim.v.lnum
  
  -- Beginning of the file should have no indent
  if lnum <= 1 then
    return 0
  end

  -- Usual case is to continue at the same indent as the previous non-blank line.
  local prevlnum = vim.fn.prevnonblank(lnum - 1)
  if prevlnum == 0 then
    return 0
  end
  
  local thisindent = vim.fn.indent(prevlnum)
  local prevline = vim.fn.getline(prevlnum)
  local thisline = vim.fn.getline(lnum)
  local sw = vim.fn.shiftwidth()

  -- If previous line is a non-comment ending in [ { (, increase indent
  if not prevline:match("^%s*[#//]") and prevline:match("[%(%{%[]%s*$") then
    thisindent = thisindent + sw
  end

  -- If the current line starts a block, decrease the indent level
  if thisline:match("^%s*[%]%}%)]") then
    thisindent = thisindent - sw
  end

  -- If the previous line starts a block comment /*, increase by one
  if prevline:match("/%*") then
    thisindent = thisindent + 1
  end

  -- If the previous line ends a block comment */, decrease by one
  if prevline:match("%*/") then
    thisindent = thisindent - 1
  end

  return thisindent
end
