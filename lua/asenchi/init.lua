vim.g.mapleader = ','

require("asenchi.settings")
require("asenchi.mappings")
require("asenchi.theme")

-- initialize lazy.nvim
require("asenchi.init_lazy")

vim.loader.enable()
