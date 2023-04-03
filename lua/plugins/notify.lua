return {
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
