vim.o.background = "dark"
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

vim.o.termguicolors = true
vim.g.colors_name = "asenchi"

vim.g.terminal_color_foreground = "#212121"
vim.g.terminal_color_background = "#c0c0c0"
vim.g.terminal_color_0 = "#212121"
vim.g.terminal_color_1 = "#c0c0c0"
vim.g.terminal_color_2 = "#c0c0c0"
vim.g.terminal_color_3 = "#c0c0c0"
vim.g.terminal_color_4 = "#c0c0c0"
vim.g.terminal_color_5 = "#c0c0c0"
vim.g.terminal_color_6 = "#c0c0c0"
vim.g.terminal_color_7 = "#c0c0c0"
vim.g.terminal_color_8 = "#1d1d1d"
vim.g.terminal_color_9 = "#c0c0c0"
vim.g.terminal_color_10 = "#c0c0c0"
vim.g.terminal_color_11 = "#c0c0c0"
vim.g.terminal_color_12 = "#c0c0c0"
vim.g.terminal_color_13 = "#c0c0c0"
vim.g.terminal_color_14 = "#c0c0c0"
vim.g.terminal_color_15 = "#ffffff"

-- Handle Options (Italic/Bold)
local asenchi_italic = vim.g.asenchi_italic or 0
local asenchi_bold = vim.g.asenchi_bold or 0

local italic_gui = asenchi_italic == 1 and "italic" or "NONE"
local bold_gui = asenchi_bold == 1 and "bold" or "NONE"

-- Helper function for repetitive highlight definitions
local function hi(group, opts)
  local defaults = { fg = "NONE", bg = "NONE", ctermfg = "NONE", ctermbg = "NONE", gui = "NONE", cterm = "NONE" }
  opts = vim.tbl_extend("force", defaults, opts)
  
  vim.api.nvim_set_hl(0, group, {
    foreground = opts.fg,
    background = opts.bg,
    ctermfg = opts.ctermfg,
    ctermbg = opts.ctermbg,
    bold = opts.gui:lower():find("bold") ~= nil,
    italic = opts.gui:lower():find("italic") ~= nil,
    underline = opts.gui:lower():find("underline") ~= nil,
    reverse = opts.gui:lower():find("reverse") ~= nil,
  })
end

-- UI Highlights
hi("Normal",       { fg = "#c0c0c0", bg = "#212121", ctermfg = 255, ctermbg = 235 })
hi("ColorColumn",  { bg = "#323232", ctermbg = 236 })
hi("CursorLine",   { bg = "#323232", ctermbg = 236 })
hi("CursorLineNr", { fg = "#c0c0c0", ctermfg = 81 })
hi("VertSplit",    { fg = "#212121", bg = "#212121", ctermfg = 235, ctermbg = 235 })
hi("LineNr",       { fg = "#444444", ctermfg = 238 })
hi("SignColumn",   { fg = "#999999", bg = "#212121", ctermfg = 246, ctermbg = 235 })
hi("PMenu",        { fg = "#212121", bg = "#d0d0d0", ctermfg = 235, ctermbg = 81 })
hi("PMenuSel",     { fg = "#c0c0c0", bg = "#666666", ctermfg = 235, ctermbg = 185 })
hi("Search",       { fg = "#ffffff", gui = "underline,bold", ctermfg = 15 })
hi("IncSearch",    { fg = "#212121", bg = "#ffffff", ctermfg = 235, ctermbg = 15 })
hi("MatchParen",   { fg = "#f43753", gui = "Bold", ctermfg = 203 })

-- Syntax Highlights
hi("Comment",      { fg = "#666666", ctermfg = 242, gui = italic_gui })
hi("Constant",     { fg = "#c0c0c0", ctermfg = 215 })
hi("String",       { fg = "#c0c0c0", ctermfg = 180 })
hi("Identifier",   { fg = "#c0c0c0", ctermfg = 153 })
hi("Function",     { fg = "#c0c0c0", ctermfg = 153 })
hi("Statement",    { fg = "#c0c0c0", ctermfg = 153 })
hi("Conditional",  { fg = "#c0c0c0", ctermfg = 185 })
hi("PreProc",      { fg = "#c0c0c0", ctermfg = 185 })
hi("Type",         { fg = "#c0c0c0", ctermfg = 81 })
hi("Special",      { fg = "#c0c0c0", ctermfg = 81 })
hi("Operator",     { fg = "#c0c0c0", ctermfg = 203 })
hi("Todo",         { fg = "#ffc24b", ctermfg = 203, gui = "Bold" })

-- CSS Specific
hi("cssTagName",   { fg = "#c0c0c0", ctermfg = 142 })
hi("cssProp",      { fg = "#c0c0c0", ctermfg = 153 })
hi("cssClassName", { fg = "#c0c0c0", ctermfg = 185 })

-- Diff & Git
hi("diffRemoved",               { fg = "#c0c0c0", ctermfg = 203 })
hi("diffChanged",               { fg = "#c0c0c0", ctermfg = 153 })
hi("diffAdded",                 { fg = "#c0c0c0", ctermfg = 185 })
hi("diffSubname",               { fg = "#c0c0c0", ctermfg = 142 })
hi("gitcommitBranch",           { fg = "#c0c0c0", ctermfg = 81 })
hi("gitcommitDiscardedType",    { fg = "#c0c0c0", ctermfg = 160 })
hi("gitcommitSelectedType",     { fg = "#c0c0c0", ctermfg = 142 })
hi("gitcommitHeader",           { fg = "#c0c0c0", ctermfg = 153 })
hi("gitcommitUntrackedFile",    { fg = "#c0c0c0", ctermfg = 215 })
hi("gitcommitDiscardedFile",    { fg = "#c0c0c0", ctermfg = 203 })
hi("gitcommitSelectedFile",     { fg = "#c0c0c0", ctermfg = 185 })
hi("FugitiveblameHash",         { fg = "#c0c0c0", ctermfg = 153 })
hi("FugitiveblameUncommitted",  { fg = "#c0c0c0", ctermfg = 203 })
hi("FugitiveblameTime",         { fg = "#c0c0c0", ctermfg = 185 })
hi("FugitiveblameNotCommittedYet", { fg = "#c0c0c0", ctermfg = 215 })
hi("GitGutterAdd",              { fg = "#5af78d", ctermfg = 185 })
hi("GitGutterChange",           { fg = "#ffc24b", ctermfg = 153 })
hi("GitGutterDelete",           { fg = "#f43753", ctermfg = 203 })
hi("GitGutterChangeDelete",     { fg = "#f43753", ctermfg = 203 })

-- JSON
hi("jsonEscape",                { fg = "#c0c0c0", ctermfg = 81 })
hi("jsonNumber",                { fg = "#c0c0c0", ctermfg = 215 })
hi("jsonBraces",                { fg = "#c0c0c0", ctermfg = 255 })
hi("jsonNull",                  { fg = "#c0c0c0", ctermfg = 215 })
hi("jsonBoolean",               { fg = "#c0c0c0", ctermfg = 215 })
hi("jsonKeywordMatch",          { fg = "#c0c0c0", ctermfg = 203 })
hi("jsonQuote",                 { fg = "#c0c0c0", ctermfg = 255 })
hi("jsonNoise",                 { fg = "#c0c0c0", ctermfg = 203 })

-- Markdown
hi("markdownH1",                { fg = "#c0c0c0", ctermfg = 153, gui = "Bold" })
hi("markdownHeadingRule",       { fg = "#c0c0c0", ctermfg = 203, gui = "Bold" })
hi("markdownHeadingDelimiter",  { fg = "#c0c0c0", ctermfg = 203, gui = "Bold" })
hi("markdownListMarker",        { fg = "#c0c0c0", ctermfg = 215 })
hi("markdownLinkText",          { fg = "#c0c0c0", ctermfg = 185 })
hi("markdownUrl",               { fg = "#c0c0c0", ctermfg = 81 })
hi("markdownCode",              { fg = "#c0c0c0", ctermfg = 180 })

-- NERDTree
hi("NERDTreeHelp",              { fg = "#c0c0c0", ctermfg = 255 })
hi("NERDTreeUp",                { fg = "#c0c0c0", ctermfg = 185 })
hi("NERDTreeCWD",               { fg = "#c0c0c0", ctermfg = 81 })
hi("NERDTreeOpenable",          { fg = "#c0c0c0", ctermfg = 203 })
hi("NERDTreeClosable",          { fg = "#c0c0c0", ctermfg = 215 })
