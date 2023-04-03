return {
  -- elixir
  {
    "mhanberg/elixir.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
    },
  },

  -- golang
  {
    "ray-x/go.nvim",
    requires = {
      "ray-x/guihua.lua",
    },
  },

  -- notify
  {
    "rcarriga/nvim-notify",
    opts = {
      -- compact style
      render = "compact",
      -- show messages at the bottom, not top
      top_down = false,
    },
    keys = {
      { "<leader>uh", "<Cmd>Notifications<CR>", desc = "Show notification history" },
    },
  },
}
