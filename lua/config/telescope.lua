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
