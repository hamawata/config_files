return {
  'FabijanZulj/blame.nvim',
  cmd = 'BlameToggle',
  keys = {
    { '<Space>gb', '<cmd>BlameToggle<CR>', desc = 'Git blame (per line)' },
  },
  -- focus_blame=true makes blame.nvim resolve its git cwd from the unnamed
  -- blame buffer, so `<CR>`/`o` fail with "not a git repository" when nvim was
  -- started outside the repo (upstream issue #62). Keeping focus on the file
  -- window makes it resolve cwd from the real file instead. Move into the blame
  -- window (<C-w>h) to use its mappings.
  opts = {
    focus_blame = false,
  },
}
