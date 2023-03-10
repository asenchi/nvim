-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/asenchi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/asenchi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/asenchi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/asenchi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/asenchi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FTerm.nvim"] = {
    config = { 'require("config/fterm")' },
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/FTerm.nvim",
    url = "https://github.com/numToStr/FTerm.nvim"
  },
  ["animation.nvim"] = {
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/animation.nvim",
    url = "https://github.com/anuvyklack/animation.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["elixir.nvim"] = {
    config = { 'require("config/elixir")' },
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/elixir.nvim",
    url = "https://github.com/mhanberg/elixir.nvim"
  },
  ["go.nvim"] = {
    config = { 'require("config/go")' },
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
  },
  ["guihua.lua"] = {
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/guihua.lua",
    url = "https://github.com/ray-x/guihua.lua"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { 'require("config/lualine")' },
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["marks.nvim"] = {
    config = { 'require("config/marks")' },
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/marks.nvim",
    url = "https://github.com/chentoast/marks.nvim"
  },
  middleclass = {
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/middleclass",
    url = "https://github.com/anuvyklack/middleclass"
  },
  ["nvim-cmp"] = {
    config = { 'require("config/nvim-cmp")' },
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { 'require("config/nvim-colorizer")' },
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/NvChad/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    config = { 'require("config/nvim-dap-virtual-text")' },
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    config = { 'require("config/nvim-lspconfig")' },
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-surround"] = {
    config = { 'require("config/nvim-surround")' },
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    config = { 'require("config/nvim-tree")' },
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { 'require("config/nvim-treesitter")' },
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textsubjects"] = {
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textsubjects",
    url = "https://github.com/RRethy/nvim-treesitter-textsubjects"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-window.git"] = {
    config = { 'require("config/nvim-window")' },
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/nvim-window.git",
    url = "https://gitlab.com/yorickpeterse/nvim-window"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["telescope.nvim"] = {
    config = { 'require("config/telescope")' },
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["true-zen.nvim"] = {
    config = { 'require("config/true-zen")' },
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/true-zen.nvim",
    url = "https://github.com/Pocco81/true-zen.nvim"
  },
  ["vim-asciidoctor"] = {
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/vim-asciidoctor",
    url = "https://github.com/habamax/vim-asciidoctor"
  },
  ["vim-fugitive"] = {
    config = { "require('config.fugitive')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-terraform"] = {
    config = { 'require("config/vim-terraform")' },
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/vim-terraform",
    url = "https://github.com/hashivim/vim-terraform"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["windows.nvim"] = {
    config = { 'require("config/windows")' },
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/windows.nvim",
    url = "https://github.com/anuvyklack/windows.nvim"
  },
  ["winshift.nvim"] = {
    config = { 'require("config/winshift")' },
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/winshift.nvim",
    url = "https://github.com/sindrets/winshift.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { 'require("config/zen-mode")' },
    loaded = true,
    path = "/Users/asenchi/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: vim-terraform
time([[Config for vim-terraform]], true)
require("config/vim-terraform")
time([[Config for vim-terraform]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require("config/nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require("config/nvim-colorizer")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: windows.nvim
time([[Config for windows.nvim]], true)
require("config/windows")
time([[Config for windows.nvim]], false)
-- Config for: winshift.nvim
time([[Config for winshift.nvim]], true)
require("config/winshift")
time([[Config for winshift.nvim]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
require("config/zen-mode")
time([[Config for zen-mode.nvim]], false)
-- Config for: nvim-dap-virtual-text
time([[Config for nvim-dap-virtual-text]], true)
require("config/nvim-dap-virtual-text")
time([[Config for nvim-dap-virtual-text]], false)
-- Config for: go.nvim
time([[Config for go.nvim]], true)
require("config/go")
time([[Config for go.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require("config/nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require("config/telescope")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require("config/nvim-tree")
time([[Config for nvim-tree.lua]], false)
-- Config for: FTerm.nvim
time([[Config for FTerm.nvim]], true)
require("config/fterm")
time([[Config for FTerm.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require("config/lualine")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require("config/nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-window.git
time([[Config for nvim-window.git]], true)
require("config/nvim-window")
time([[Config for nvim-window.git]], false)
-- Config for: marks.nvim
time([[Config for marks.nvim]], true)
require("config/marks")
time([[Config for marks.nvim]], false)
-- Config for: elixir.nvim
time([[Config for elixir.nvim]], true)
require("config/elixir")
time([[Config for elixir.nvim]], false)
-- Config for: true-zen.nvim
time([[Config for true-zen.nvim]], true)
require("config/true-zen")
time([[Config for true-zen.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
require("config/nvim-surround")
time([[Config for nvim-surround]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au User InGitRepo ++once lua require("packer.load")({'vim-fugitive'}, { event = "User InGitRepo" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
