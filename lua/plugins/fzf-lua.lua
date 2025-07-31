return {
  {
    "ibhagwan/fzf-lua",
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "FzfLua",
    keys = {
    --   { "<leader>fg",  "<cmd>FzfLua live_grep_native<cr>",      desc = "Grep" },
    --   { "<leader>fgc", "<cmd>FzfLua grep_cword<cr>",            desc = "Grep word under cursor" },
    --   { "<leader>fgC", "<cmd>FzfLua grep_cword<cr>",            desc = "Grep WORD under cursor" },
    --   { "<leader>ff",  "<cmd>FzfLua files<cr>",                 desc = "Find files" },
    --   { "<leader>fb",   "<cmd>FzfLua buffers<cr>",              desc = "Find buffers" },
       { "<leader>ss",  "<cmd>FzfLua spell_suggest<cr>",         desc = "Spell suggest" },
       { "<leader>ft",  "<cmd>FzfLua filetypes<cr>",             desc = "Change file-types" },
       { "<leader>km",  "<cmd>FzfLua keymaps<cr>",               desc = "View keymaps" },
    --   { "<leader>ch",  "<cmd>FzfLua command_history<cr>",       desc = "Command history" },
    --   { "<leader>sh",  "<cmd>FzfLua search_history<cr>",        desc = "Search history" },
    --   { "<leader>ht",  "<cmd>FzfLua help_tags<cr>",             desc = "Help tags" },
    --   { "<leader>hg",  "<cmd>FzfLua highlights<cr>",            desc = "Highlights" },
    --   { "<leader>sc",  "<cmd>FzfLua git_bcommits<cr>",          desc = "Source control commits" },
    --   { "<leader>fd",  "<cmd>FzfLua lsp_definitions<cr>",       desc = "LSP definitions" },
    --   { "<leader>fr",  "<cmd>FzfLua lsp_references<cr>",        desc = "LSP references" },
    --   { "<leader>fi",  "<cmd>FzfLua lsp_implementations<cr>",   desc = "LSP implementations" },
    --   { "<leader>ftd", "<cmd>FzfLua lsp_typedefs<cr>",          desc = "LSP type definitions" },
    --   { "<leader>fds", "<cmd>FzfLua lsp_document_symbols<cr>",  desc = "LSP document symbols" },
    --   { "<leader>fws", "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "LSP workspace symbols" },
    --   { "<leader>ca",  "<cmd>FzfLua lsp_code_actions<cr>",      desc = "LSP code actions" },
    },
    opts = {
      winopts = {
        height           = 0.90,            -- window height
        width            = 0.90,            -- window width
        row              = 0.35,            -- window row position (0=top, 1=bottom)
        col              = 0.50,            -- window col position (0=left, 1=right)
        border           = "rounded",
        backdrop         = 60,
        fullscreen       = false,           -- start fullscreen?
        treesitter       = {
          enabled    = true,
          fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" }
        },
        preview = {
          -- default     = 'bat',           -- override the default previewer?
                                            -- default uses the 'builtin' previewer
          border         = "rounded",       -- preview border: accepts both `nvim_open_win`
                                            -- and fzf values (e.g. "border-top", "none")
                                            -- native fzf previewers (bat/cat/git/etc)
                                            -- can also be set to `fun(winopts, metadata)`
          wrap           = false,           -- preview line wrap (fzf's 'wrap|nowrap')
          hidden         = false,           -- start preview hidden
          vertical       = "down:45%",      -- up|down:size
          horizontal     = "right:60%",     -- right|left:size
          layout         = "flex",          -- horizontal|vertical|flex
          flip_columns   = 100,             -- #cols to switch to horizontal on flex
          -- Only used with the builtin previewer:
          title          = true,            -- preview border title (file/buf)?
          title_pos      = "center",        -- left|center|right, title alignment
          scrollbar      = "float",         -- `false` or string:'float|border'
                                            -- float:  in-window floating border
                                            -- border: in-border "block" marker
          scrolloff      = -1,              -- float scrollbar offset from right
                                            -- applies only when scrollbar = 'float'
          delay          = 20,              -- delay(ms) displaying the preview
                                            -- prevents lag on fast scrolling
          winopts = {                       -- builtin previewer window options
            number            = true,
            relativenumber    = false,
            cursorline        = true,
            cursorlineopt     = "both",
            cursorcolumn      = false,
            signcolumn        = "no",
            list              = false,
            foldenable        = false,
            foldmethod        = "manual",
          },
        },
      }
    }
  }
}
