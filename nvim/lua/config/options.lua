-- ported from ../../init.vim

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.smartindent = true
vim.opt.fileencodings = { 'utf-8', 'iso-2022-jp', 'euc-jp', 'cp932', 'default', 'latin' }
vim.opt.clipboard:append('unnamedplus')
vim.opt.swapfile = false
vim.opt.fixendofline = false
vim.opt.inccommand = 'split'

vim.g.python3_host_prog = vim.fn.system(
  'type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(cat $(pyenv root)/version | head -n 1)/bin/python" || echo -n $(which python)'
)
