if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
if isdirectory(expand('~/.vim/userautoload'))
    set runtimepath+=~/.vim/
    runtime! userautoload/*.vim
endif

if has('nvim')
"" dein settings
if &compatible
  set nocompatible
endif
" dein.vimのディレクトリ
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" なければgit clone
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " 管理するプラグインを記述したファイル
  let s:toml = '~/.dein.toml'
  let s:lazy_toml = '~/.dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif
" プラグインの追加・削除やtomlファイルの設定を変更した後は
" 適宜 call dein#update や call dein#clear_state を呼んでください。
" そもそもキャッシュしなくて良いならload_state/save_stateを呼ばないようにしてください。

" 2016.04.16 追記
" load_cache -> load_state
" save_cache -> save_state
" となり書き方が少し変わりました。
" 追記終わり

" vimprocだけは最初にインストールしてほしい
if dein#check_install(['vimproc'])
  call dein#install(['vimproc'])
endif
" その他インストールしていないものはこちらに入れる
if dein#check_install()
  call dein#install()
endif

endif
" -- dein

"neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" For snippet_complete marker.
if has('conceal')
      set conceallevel=2 concealcursor=i
endif

let g:neosnippet#snippets_directory='~/snippets/'
"~neosnippet

"ctags setting to open file using tab.
nnoremap <C-]> <C-w><C-]><C-w>T

"vimfiler.vim
let g:vimfiler_as_default_explorer = 1
"~vimfiler

"unite.vim
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <Leader>f [unite]

" unite.vim keymap
let g:unite_enable_start_insert = 0
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]d :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
"nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file file/new -buffer-name=file<CR>
nnoremap <silent> <Leader>gt :<C-u>Unite<Space>giti<CR>
nnoremap <silent> <Leader>gs :<C-u>Unite<Space>giti/status<CR>
nnoremap <silent> <Leader>gb :<C-u>Unite<Space>giti/branch<CR>
nnoremap <silent> <Leader>gl :<C-u>Unite<Space>giti/log<CR>
nnoremap <silent> <Leader>gr :<C-u>Unite<Space>giti/remote<CR>
nnoremap <silent> ,vr :UniteResume<CR>

nnoremap <silent> [unite]p :<C-u>Unite<Space>history/yank -default-action=append<CR>

" vinarise
let g:vinarise_enable_auto_detect = 1

" unite-build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>

" unite-grep
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200
"~unite.vim

"quick run
nnoremap <Leader>qa :QuickRun -args

"easy align
vmap <Enter> <Plug>(EasyAlign)

set tags=~/.tags
autocmd FileType php :set dictionary=~/.vim/dict/php.dict

" vim-ref
let g:ref_phpmanual_path = $HOME . '/.config/nvim/ref/php-chunked-xhtml'

" vimshell
nnoremap <Leader>s :VimShell<CR>

" deoplete
call deoplete#enable()

"----------------~plugin setting

"key binding
nnoremap <Leader>ee :tabe   $MYVIMRC<CR>
nnoremap <Leader>es :source $MYVIMRC<CR>
nnoremap gc :tab sp<CR>
"cmdline-editing
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
if has('nvim')
    nmap <BS> <C-h>
endif

syntax on

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
if !has('nvim')
    set encoding=utf-8
endif
set number
set smartindent
set backspace=indent,eol,start
set fileencodings=euc-jp,iso-2022-jp,utf-8,cp932,default,latin
set clipboard+=unnamedplus
set noswapfile
filetype plugin indent on
