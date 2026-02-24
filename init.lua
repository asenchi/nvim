-- Define global configuration table
_G.Config = {}

-- 'mini.nvim' - all-in-one plugin powering most MiniMax features.
-- See 'plugin/30_mini.lua' for how it is used.
vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

-- Loading helpers used to organize config into fail-safe parts. Example usage:
-- - `now` - execute immediately. Use for colorscheme, statusline, tabline, etc.
-- - `later` - execute a bit later. Use for things not needed during startup.
-- - `now_if_args` - execute now only if Neovim was started with file arguments,
--   otherwise defer. Good for LSP, treesitter, and other file-specific features.
Config.now = function(f)
  local ok, err = pcall(f)
  if not ok then vim.notify(tostring(err), vim.log.levels.ERROR) end
end

local _later_queue = {}
Config.later = function(f)
  table.insert(_later_queue, f)
end

Config.now_if_args = vim.fn.argc(-1) > 0 and Config.now or Config.later

Config.on_event = function(ev, f)
  vim.api.nvim_create_autocmd(ev, {
    once = true,
    callback = function()
      local ok, err = pcall(f)
      if not ok then vim.notify(tostring(err), vim.log.levels.ERROR) end
    end,
  })
end

Config.on_filetype = function(ft, f)
  vim.api.nvim_create_autocmd('FileType', {
    pattern = ft,
    once = true,
    callback = function()
      local ok, err = pcall(f)
      if not ok then vim.notify(tostring(err), vim.log.levels.ERROR) end
    end,
  })
end

-- Define custom autocommand group and helper to create autocommands.
local gr = vim.api.nvim_create_augroup('asenchi', {})
Config.new_autocmd = function(event, pattern, callback, desc)
  local opts = { group = gr, pattern = pattern, callback = callback, desc = desc }
  vim.api.nvim_create_autocmd(event, opts)
end

-- Process the later queue after UI is ready
vim.api.nvim_create_autocmd('VimEnter', {
  group = gr,
  once = true,
  callback = vim.schedule_wrap(function()
    for _, f in ipairs(_later_queue) do
      local ok, err = pcall(f)
      if not ok then vim.notify(tostring(err), vim.log.levels.ERROR) end
    end
    _later_queue = {}
  end),
})

-- Define custom vim.pack hook helper. See `:h vim.pack-events`.
Config.on_packchanged = function(plugin_name, kinds, callback, desc)
  local f = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if not (name == plugin_name and vim.tbl_contains(kinds, kind)) then return end
    if not ev.data.active then vim.cmd.packadd(plugin_name) end
    callback()
  end
  Config.new_autocmd('PackChanged', '*', f, desc)
end

vim.cmd("colorscheme asenchi")
