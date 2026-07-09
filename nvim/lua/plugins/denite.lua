-- legacy denite.nvim setup, ported verbatim from the old dein-based config
-- (_dein_lazy.toml) so the original keymaps behave identically under
-- lazy.nvim. defx.nvim lives in defx.lua.
return {
  'Shougo/denite.nvim',
  dependencies = {
    'Shougo/neomru.vim',
    'Shougo/neoyank.vim',
  },
  -- same rplugin/runtimepath timing issue as defx.nvim: keep it eager
  -- rather than event = 'BufRead' so it's always loaded before
  -- :UpdateRemotePlugins (or the keymaps) are needed
  lazy = false,
  -- :UpdateRemotePlugins only finds rplugins that are currently on
  -- 'runtimepath', so regenerate the manifest right after install/update
  -- while lazy.nvim still has the plugin loaded
  build = ':UpdateRemotePlugins',
  config = function()
    vim.cmd([[
      nnoremap    [denite]   <Nop>
      nmap    <Leader>d [denite]
      nnoremap <silent> [denite]m :<C-u>Denite<Space>file_mru<Space>-start-filter<CR>
      nnoremap <silent> [denite]f :<C-u>DeniteProjectDir<Space>file/rec<Space>-path=`expand('%:p')`<Space>-start-filter<CR>
      nnoremap <silent> [denite]b :<C-u>Denite<Space>buffer<Space>-start-filter<CR>
      nnoremap <silent> [denite]g :<C-u>DeniteProjectDir<Space>grep:<Space>-buffer-name=search-buffer-denite<Space>-path=`expand('%:p')`<Space>-start-filter<CR>
      nnoremap <silent> [denite]r :<C-u>Denite<Space>-resume<Space>-buffer-name=search-buffer-denite<Space>-start-filter<CR>
      nnoremap <silent> [denite]y :<C-u>Denite<Space>neoyank<Space>-start-filter<CR>

      autocmd FileType denite call MyDeniteSettings()
      function! MyDeniteSettings() abort
        nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
        nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'preview')
        nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
        nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
        nnoremap <silent><buffer><expr> <Space>
        \ denite#do_map('toggle_select').'j'
        nnoremap <silent><buffer><expr> <C-h>
        \ denite#do_map('move_up_path')
        nnoremap <silent><buffer><expr> <Tab>
        \ denite#do_map('choose_action')
        nnoremap <silent><buffer><expr> <C-o>
        \ denite#do_map('redraw')
        nnoremap <silent><buffer><expr> <Esc>
        \ denite#do_map('quit')
        nnoremap <silent><buffer><expr> a
        \ denite#do_map('open_filter_buffer')
        nnoremap <silent><buffer><expr> t
        \ denite#do_map('do_action', 'tabopen')
      endfunction

      autocmd FileType denite-filter call MyDeniteFilterSettings()
      function! MyDeniteFilterSettings() abort
        nnoremap <silent><buffer> <C-o> <Plug>(denite_filter_update)
        imap <silent><buffer> <C-o> <Plug>(denite_filter_update)
      endfunction

      call denite#custom#var('grep', 'command', ['ag'])
      call denite#custom#var('grep', 'recursive_opts', [])
      call denite#custom#var('grep', 'final_opts', [])
      call denite#custom#var('grep', 'separator', [])
      call denite#custom#var('grep', 'default_opts', ['--nocolor', '--nogroup'])
      call denite#custom#var('grep', 'pattern_opt', [])
      call denite#custom#var('file/rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
      call denite#custom#var('directory_rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
    ]])
  end,
}
