return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },
  },
  keys = {
    { '<Leader>ff', function() require('telescope.builtin').find_files() end, desc = 'Telescope find files' },
    { '<Leader>fg', function() require('telescope.builtin').live_grep() end, desc = 'Telescope live grep' },
    { '<Leader>fb', function() require('telescope.builtin').buffers() end, desc = 'Telescope buffers' },
    { '<Leader>fh', function() require('telescope.builtin').help_tags() end, desc = 'Telescope help tags' },
  },
  config = function()
    require('telescope').setup({})
    pcall(require('telescope').load_extension, 'fzf')
  end,
}
