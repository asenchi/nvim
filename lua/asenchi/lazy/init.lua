return {
  { "nvim-lua/plenary.nvim", name = "plenary" },
  { 'ray-x/go.nvim', dependencies = { 'ray-x/guihua.lua' }, opts = {} },
  { "NvChad/nvim-colorizer.lua", opts = {} },
  { "nvim-tree/nvim-web-devicons" },
  {
    "https://gitlab.com/yorickpeterse/nvim-window.git",
    opts ={
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
    }
  },
  { "habamax/vim-asciidoctor" },
  { "tpope/vim-fugitive", event = { "User InGitRepo" }, opts = {} },
}
