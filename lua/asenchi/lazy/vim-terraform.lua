return {
  {
    "hashivim/vim-terraform",
    config = function()
      vim.cmd([[
        let g:terraform_fmt_on_save=1
        let g:terraform_align=1
      ]])
    end
  }
}
