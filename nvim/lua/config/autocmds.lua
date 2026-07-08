-- ported from ../../init.vim

vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.opt_local.number = false
  end,
})
