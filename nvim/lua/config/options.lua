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

-- dedicated venv (pynvim only) so remote plugins like denite/defx have a
-- python3 host regardless of whichever python/pyenv version is active.
-- created with:
--   uv venv ~/.local/share/nvim-python --python 3.12
--   uv pip install --python ~/.local/share/nvim-python/bin/python --exclude-newer "1 week" pynvim
-- (re-run the second command to recreate the venv after a rm -rf)
--
-- this file is synced to every machine via dotfiles, but the venv itself is
-- local and machine-specific (not committed), so only point at it if it was
-- actually set up here -- an unconditional assignment would make denite.nvim
-- try to spawn a nonexistent python3 host on every other machine
local nvim_python = vim.fn.expand('~/.local/share/nvim-python/bin/python')
if vim.fn.executable(nvim_python) == 1 then
  vim.g.python3_host_prog = nvim_python
end
