local add, later, now = MiniDeps.add, MiniDeps.later, MiniDeps.now

-- plugin: treesitter
now(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    -- Update tree-sitter parser after plugin is updated
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })
  add({
    source = 'nvim-treesitter/nvim-treesitter-textobjects',
    -- Use `main` branch since `master` branch is frozen, yet still default
    -- It is needed for compatibility with 'nvim-treesitter' `main` branch
    checkout = 'main',
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
  _G.Config.new_autocmd('FileType', filetypes, ts_start, 'Start tree-sitter')
end)

-- plugin: lspconfig
now(function()
  add('neovim/nvim-lspconfig')

  vim.lsp.enable({
    'lua_ls',
    'gopls',
    'terraformls',
    'tflint',
  })
end)

-- plugin: conform
later(function()
  add('stevearc/conform.nvim')

  require('conform').setup({
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "goimports", "golines", "gofmt" },
    },
  })
end)

-- plugin: go
later(function()
  add('ray-x/guihua.lua')
  add('ray-x/go.nvim')

  require('go').setup()

  local go_format_import = function() require('go.format').goimports() end
  _G.Config.new_autocmd("BufWritePre", { "*.go" }, go_format_import, "Format on import")
end)

-- plugin: nvim-tree
later(function()
  add('nvim-tree/nvim-web-devicons')
  add('nvim-tree/nvim-tree.lua')

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
    source = 'coder/claudecode.nvim',
    depends = { 'folke/snacks.nvim' },
  })
  require('claudecode').setup()
end)
