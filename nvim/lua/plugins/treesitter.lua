return {
  'nvim-treesitter/nvim-treesitter',
  -- `main` is a full rewrite requiring Neovim 0.12+; use `master` instead if
  -- you're on an older Neovim.
  branch = 'main',
  build = ':TSUpdate',
  lazy = false,
  config = function()
    require('nvim-treesitter').install({
      'bash', 'css', 'dockerfile', 'go', 'haskell', 'html', 'javascript',
      'json', 'lua', 'markdown', 'php', 'python', 'query', 'ruby',
      'terraform', 'toml', 'typescript', 'vim', 'vimdoc', 'yaml',
    })

    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
