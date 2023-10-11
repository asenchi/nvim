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

  -- Manage packer itself
  use { 'wbthomason/packer.nvim' }

  -- colortheme
  use { 'navarasu/onedark.nvim' }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = config('lualine')
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = config("nvim-treesitter"),
    run = function()
      local tsup = require('nvim-treesitter.install').update({ with_sync = true })
      tsup()
    end,
  }

  use {
    'neovim/nvim-lspconfig',
    config = config('nvim-lspconfig'),
  }

  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    config = config('telescope'),
  }

  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { { "nvim-telescope/telescope.nvim" }, { "nvim-lua/plenary.nvim" } }
    config = function() require("telescope").load_extension "file_browser" end
  }

  use {
    "https://gitlab.com/yorickpeterse/nvim-window.git",
    config = config('nvim-window'),
    config = function()
      require("nvim-window").setup({
          -- The characters available for hinting windows.
          chars = {"a", "s", "f", "g", "h", "j", "k", "l"},
          -- A group to use for overwriting the Normal highlight group in the floating
          -- window. This can be used to change the background color.
          normal_hl = "Normal",
          -- The highlight group to apply to the line that contains the hint characters.
          -- This is used to make them stand out more.
          hint_hl = "Bold",
          -- The border style to use for the floating window.
          border = "single"
      })
    end,
  }

  use {
    'ray-x/go.nvim',
    requires = { 'ray-x/guihua.lua', },
    config = function() require('go').setup() end,
  }

  use {
    'sindrets/winshift.nvim',
    config = config("winshift"),
  }

  use {
    "numToStr/FTerm.nvim",
    config = requireconfig("fterm")
  }

  use {
    'chentoast/marks.nvim',
    config = requireconfig("marks"),
    config = function()
      require('marks').setup({
        mappings = {
          next = "]m",
          prev = "[m",
        }
      })
    end,
  }

  use {
    'elixir-tools/elixir-tools.nvim',
    tag = "stable",
    requires = { "nvim-lua/plenary.nvim" },
    config = config("elixir-tools")
  }

  use { "tpope/vim-fugitive", event = "User InGitRepo", config = [[require('config.fugitive')]] }

  use {
    "anuvyklack/windows.nvim",
    requires = {
       "anuvyklack/middleclass",
       "anuvyklack/animation.nvim"
    },
    config = function() require('windows').setup() end,
  }

  use {
    "NvChad/nvim-colorizer.lua",
    config = function() require('colorizer').setup() end,
  }

  use {
    "hashivim/vim-terraform",
    config = function()
      vim.cmd([[
        let g:terraform_fmt_on_save=1
        let g:terraform_align=1
      ]])
    end,
  }

  use { 
    "lukas-reineke/indent-blankline.nvim",
    config = function() require("ibl").setup() end,
  }

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

end)
