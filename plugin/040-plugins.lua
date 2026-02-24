local add = vim.pack.add
local now, later = Config.now, Config.later

-- plugin: treesitter
now(function()
  -- Define hook to update tree-sitter parsers after plugin is updated
  local ts_update = function() vim.cmd('TSUpdate') end
  Config.on_packchanged('nvim-treesitter', { 'update' }, ts_update, ':TSUpdate')

  add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  })

  -- Define languages which will have parsers installed and auto enabled
  local languages = {
    -- These are already pre-installed with Neovim. Used as an example.
    'lua',
    'vimdoc',
    'markdown',
    -- mine
    'hcl', 'terraform',
    'luadoc', 'luap',
    'bash',
    'json', 'yaml',
    'go', 'gomod', 'gowork', 'gosum',
    'ruby',
    'zig',
  }
  local isnt_installed = function(lang)
    return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
  end
  local to_install = vim.tbl_filter(isnt_installed, languages)
  if #to_install > 0 then require('nvim-treesitter').install(to_install) end

  -- Enable tree-sitter after opening a file for a target language
  local filetypes = {}
  for _, lang in ipairs(languages) do
    for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
      table.insert(filetypes, ft)
    end
  end
  local ts_start = function(ev) vim.treesitter.start(ev.buf) end
  Config.new_autocmd('FileType', filetypes, ts_start, 'Start tree-sitter')
end)

-- plugin: lspconfig
now(function()
  add({ 'https://github.com/neovim/nvim-lspconfig' })

  vim.lsp.enable({
    'lua_ls',
    'gopls',
    'terraformls',
    'tflint',
  })
end)

-- plugin: conform
later(function()
  add({ 'https://github.com/stevearc/conform.nvim' })

  require('conform').setup({
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "goimports", "golines", "gofmt" },
    },
  })
end)

-- plugin: go
later(function()
  add({
    'https://github.com/ray-x/guihua.lua',
    'https://github.com/ray-x/go.nvim',
  })

  require('go').setup()

  local go_format_import = function() require('go.format').goimports() end
  Config.new_autocmd("BufWritePre", { "*.go" }, go_format_import, "Format on import")
end)

-- plugin: nvim-tree
later(function()
  add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-tree/nvim-tree.lua',
  })

  local nt_api = require('nvim-tree.api')
  nt_api.events.subscribe(nt_api.events.Event.TreeOpen, function()
    local tree_winid = nt_api.tree.winid()

    if tree_winid ~= nil then
      vim.api.nvim_set_option_value('statusline', '%t', {win = tree_winid})
    end
  end)

  require('nvim-tree').setup({
    view = {
      width = 30,
      adaptive_size = true,
      side = "left",
      preserve_window_proportions = true,
    },
    update_focused_file = {
      enable = true,
      update_root = false,
      ignore_list = {},
    },
  })
end)

-- plugin: claudecode
later(function()
  add({
    'https://github.com/folke/snacks.nvim',
    'https://github.com/coder/claudecode.nvim',
  })
  require('claudecode').setup()
end)

now(function()
  add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim',
	})

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

  local function lsp_status_short()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients and vim.lsp.get_clients({ bufnr = bufnr }) or
       vim.lsp.get_active_clients({ bufnr = bufnr })

    if #clients == 0 then
      return "" -- Return empty string when no LSP
    end

    local names = {}
    for _, client in ipairs(clients) do
      table.insert(names, client.name)
    end
    return "> " .. table.concat(names, ",")
  end

  local function lsp_status()
    local ok, result = pcall(lsp_status_short)
    return ok and result or ""
  end

  require('lualine').setup({
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
      lualine_x = { search_result, lsp_status },
      lualine_y = { 'diff', 'filetype' },
      lualine_z = { '%l:%c', '%p%%/%L' },
    },
    inactive_sections = {},
  })
end)
