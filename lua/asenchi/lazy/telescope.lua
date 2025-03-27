return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" }
    },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = 'flex',
          layout_config = {
            horizontal = {
              prompt_position = "bottom",
              preview_width = 0.65,
              results_width = 0.9,
            },
            vertical = {
              mirror = false
            },
            height = 0.99,
            width = 0.99,
          },
        },
      })
    end
  }
}
