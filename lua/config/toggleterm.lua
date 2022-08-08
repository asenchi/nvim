require("toggleterm").setup{}

local Terminal  = require('toggleterm.terminal').Terminal

-- Open htop in a floating terminal via <F6>
local htop = Terminal:new({
  cmd = "htop",
  dir = "~",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,

  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("Closing htop")
  end,
})

function _htop_toggle()
  htop:toggle()
end

vim.api.nvim_set_keymap("n", "<F6>", "<cmd>lua _htop_toggle()<CR>", {noremap = true, silent = true})