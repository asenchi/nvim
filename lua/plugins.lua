function requireconfig(plugin)
  return string.format('require("config/%s")', plugin)
end

local packer = require("packer")

packer.init({
  enable = true,
  max_jobs = 20,
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

packer.startup(function(use)

  use 'wbthomason/packer.nvim'

  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }

  -- colortheme
  -- use 'navarasu/onedark.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = requireconfig('lualine')
  }

  use {
    'neovim/nvim-lspconfig',
    config = requireconfig('nvim-lspconfig'),
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'onsails/lspkind-nvim',
      'hrsh7th/vim-vsnip',
      'hrsh7th/cmp-vsnip',
    },
    config = requireconfig('nvim-cmp'),
  }

  use {
    "ibhagwan/fzf-lua",
    requires = { "nvim-tree/nvim-web-devicons" },
  }

  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    config = requireconfig('telescope'),
  }

  use {
    "https://gitlab.com/yorickpeterse/nvim-window.git",
    config = requireconfig('nvim-window'),
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = requireconfig("nvim-treesitter"),
    run = ":TSUpdate",
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = requireconfig("nvim-tree"),
  }

  use 'mfussenegger/nvim-dap'

  use {
    'theHamsta/nvim-dap-virtual-text',
    requires = {
      "mfussenegger/nvim-dap"
    },
    config = requireconfig("nvim-dap-virtual-text"),
  }

  use {
    'ray-x/go.nvim',
    requires = {
      'ray-x/guihua.lua',
    },
    config = requireconfig('go'),
  }

  use {
    'sindrets/winshift.nvim',
    config = requireconfig("winshift"),
  }

  -- use {
  --   'chentoast/marks.nvim',
  --   config = requireconfig("marks"),
  -- }

  use({ "elixir-tools/elixir-tools.nvim", tag = "stable", requires = { "nvim-lua/plenary.nvim" }})

  use { "tpope/vim-fugitive", event = "User InGitRepo", config = [[require('config.fugitive')]] }

  use { "anuvyklack/windows.nvim",
    requires = {
       "anuvyklack/middleclass",
       "anuvyklack/animation.nvim"
    },
    config = requireconfig("windows")
  }

  use {
    "NvChad/nvim-colorizer.lua",
    config = requireconfig("nvim-colorizer")
  }

  use {
    "habamax/vim-asciidoctor"
  }

  use {
    "hashivim/vim-terraform",
    config = requireconfig("vim-terraform")
  }

  use { 
    "lukas-reineke/indent-blankline.nvim",
    config = requireconfig("indent-blankline")
  }

end)
