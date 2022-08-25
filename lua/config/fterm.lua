local fterm = require('FTerm')

fterm.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})

-- keybindings
vim.keymap.set('n', '<leader>1', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<leader>1', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- btop
local btop = fterm:new({
  ft = 'fterm_btop',
  cmd = "btop"
})

vim.keymap.set('n', '<F12>', function()
  btop:toggle()
end)

-- psql
local psql = fterm:new({
  ft = 'fterm_psql',
  cmd = "psql"
})

vim.keymap.set('n', '<F11>', function()
  psql:toggle()
end)

-- brew update && brew upgrade && brew cleanup
local brew = fterm:new({
  ft = 'fterm_brew',
  cmd = "brew update && brew upgrade && brew cleanup"
})

vim.keymap.set('n', '<F10>', function()
  brew:toggle()
end)

-- Disable for the time being
-- require("toggleterm").setup{}
-- 
-- local Terminal  = require('toggleterm.terminal').Terminal
-- 
-- -- Open htop in a floating terminal via <F6>
-- local htop = Terminal:new({
--   cmd = "htop",
--   dir = "~",
--   direction = "float",
--   float_opts = {
--     border = "double",
--   },
--   -- function to run on opening the terminal
--   on_open = function(term)
--     vim.cmd("startinsert!")
--     vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
--   end,
-- 
--   -- function to run on closing the terminal
--   on_close = function(term)
--     vim.cmd("Closing htop")
--   end,
-- })
-- 
-- function _htop_toggle()
--   htop:toggle()
-- end
-- 
-- vim.api.nvim_set_keymap("n", "<F7>", "<cmd>lua _htop_toggle()<CR>", {noremap = true, silent = true})
