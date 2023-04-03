return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        layout_strategy = "flex",
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
            preview_width = 0.65,
          },
          vertical = {
            mirror = false,
          },
          height = 0.99,
          width = 0.99,
        },
      },
    },
  },
}
