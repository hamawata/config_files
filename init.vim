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

"ctags setting to open file using tab.
nnoremap <C-]> <C-w><C-]><C-w>T

" vinarise
let g:vinarise_enable_auto_detect = 1

set tags=~/.tags
autocmd FileType php :set dictionary=~/.vim/dict/php.dict

"----------------~plugin setting

"key binding
nnoremap <Leader>ee :tabe   $MYVIMRC<CR>
nnoremap <Leader>es :source $MYVIMRC<CR>
nnoremap <Leader>ed :tabe   ~/.dein.toml<CR>
nnoremap <Leader>el :tabe   ~/.dein_lazy.toml<CR>
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
