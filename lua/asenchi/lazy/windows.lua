return {
  {
    "anuvyklack/windows.nvim",
    dependencies = {
       "anuvyklack/middleclass",
       "anuvyklack/animation.nvim",
    },
    opts = {},
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
    end
  }
}
