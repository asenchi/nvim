-- require('ts_context_commentstring').setup {}
require('nvim-treesitter.configs').setup {

  context_commentstring = {
    enable = true
  },

  ensure_installed = {
    "bash",
    "css",
    "elixir",
    "go",
    "hcl",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "python",
    "ruby",
    "toml",
    "yaml",
  },

  highlight_definitions = {
    enable = true,
  },

  ignore_install = { "javascript" },

  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {}, -- list of language that will be disabled
  },

  indent = { enable = true },

  autopairs = { enable = true },

  rainbow = {
    enabled = true,
    extended_mode = true
  },

  autotag = {
    enable = true
  },

  textobjects = {

    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim 
      lookahead = true,
      keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner"
      }
    },

    move = {
      enable = true,
      set_jumps = true, 
      goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer'
      },
      goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer'
      },
      goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer'
      },
      goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer'
      }
    },

    swap = {
      enable = true,
      swap_next = {
        ['<leader>xp'] = "@parameter.inner"
      },
      swap_previous = {
        ['<leader>xP'] = "@parameter.inner"
      },
    },

    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ["<leader>pf"] = "@function.outer",
        ["<leader>pc"] = "@class.outer"
      }
    }
  }

}
