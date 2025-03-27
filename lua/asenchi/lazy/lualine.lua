local colors = {
  red = '#ca1243',
  grey = '#a0a1a7',
  black = '#383a42',
  white = '#f3f3f3',
  light_green = '#83a598',
  orange = '#fe8019',
  green = '#8ec07c',
  blueish = '#3a63a6',
  pink = '#ff0f8b',
}

local theme = {
  normal = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.black, bg = colors.grey },
    c = { fg = colors.black, bg = colors.white },
    x = { fg = colors.black, bg = colors.orange },
    y = { fg = colors.white, bg = colors.black },
    z = { fg = colors.white, bg = colors.black },
  },
  insert = {
    a = { fg = colors.white, bg = colors.blueish },
    b = { fg = colors.black, bg = colors.grey },
    y = { fg = colors.white, bg = colors.grey },
  },
  visual = {
    a = { fg = colors.black, bg = colors.orange },
    x = { fg = colors.white, bg = colors.pink },
    y = { fg = colors.white, bg = colors.grey },
  },
  replace = { a = { fg = colors.black, bg = colors.green } },
  terminal = { a = { fg = colors.white, bg = colors.pink } },
}

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg('/')
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 999 }
  return last_search .. '(' .. searchcount.current .. ':' .. searchcount.total .. ')'
end

local function modified()
  if vim.bo.modified then
    return '+'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '-'
  end
  return ''
end

return  {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = theme,
        component_separators = '',
        section_separators = { left = '', right = '' },
      },
      sections = process_sections {
        lualine_a = { 'mode', },
        lualine_b = { 'branch', },
        lualine_c = {
          {
            'diagnostics',
            source = { 'nvim' },
            sections = { 'error' },
            diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
          },
          {
            'diagnostics',
            source = { 'nvim' },
            sections = { 'warn' },
            diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
          },
          {
            'filename',
            file_status = false,
            path = 0
          },
          { modified, color = { bg = colors.red } },
          {
            '%w',
            cond = function()
              return vim.wo.previewwindow
            end,
          },
          {
            '%r',
            cond = function()
              return vim.bo.readonly
            end,
          },
          {
            '%q',
            cond = function()
              return vim.bo.buftype == 'quickfix'
            end,
          },
        },
        lualine_x = { search_result },
        lualine_y = {
          'diff',
          'filetype'
        },
        lualine_z = { '%l:%c', '%p%%/%L' },
      },
      inactive_sections = {},
    }
  }
}
