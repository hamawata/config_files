-- ported from ../../init.vim

-- cmdline-editing
vim.keymap.set('c', '<C-a>', '<Home>')
vim.keymap.set('c', '<C-f>', '<Right>')
vim.keymap.set('c', '<C-b>', '<Left>')
vim.keymap.set('c', '<Esc>b', '<S-Left>')
vim.keymap.set('c', '<Esc>f', '<S-Right>')

vim.keymap.set('n', '<BS>', '<C-h>')
vim.keymap.set('n', 'gb', '<cmd>tab split<CR>')

-- :terminal
vim.keymap.set('n', '<Leader>t', '<cmd>terminal<CR>')
vim.keymap.set('n', '<Leader>T', '<cmd>tabe<CR><cmd>terminal<CR>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { silent = true })
