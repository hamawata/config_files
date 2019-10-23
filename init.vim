"" dein settings
if &compatible
  set nocompatible
endif

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let g:dein_dir = s:dein_dir
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

let s:toml = '~/.dein.toml'
let s:lazy_toml = '~/.dein_lazy.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  if filereadable(expand('~/.secret_vimrc'))
    execute 'source' expand('~/.secret_vimrc')
  endif

  call dein#end()
  call dein#save_state()
endif

"if dein#check_install(['vimproc'])
"  call dein#install(['vimproc'])
"endif
if dein#check_install()
  call dein#install()
endif

" -- dein

"ctags setting to open file using tab.
"nnoremap <C-]> <C-w><C-]><C-w>T

" vinarise
let g:vinarise_enable_auto_detect = 1

"set tags=~/.tags
autocmd FileType php :set dictionary=~/.vim/dict/php.dict

" for pyenv
let g:python3_host_prog = system('type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(cat $(pyenv root)/version | head -n 1)/bin/python" || echo -n $(which python)')

"----------------~plugin setting

"key binding
if $MYVIMRC_REAL == ""
  let $MYVIMRC_REAL = $MYVIMRC
endif
nnoremap <Leader>es :source $MYVIMRC_REAL<CR>

nnoremap <Leader>ee :e   $MYVIMRC_REAL<CR>
nnoremap <Leader>ete :tabe   $MYVIMRC_REAL<CR>
nnoremap <Leader>ed :e   ~/.dein.toml<CR>
nnoremap <Leader>etd :tabe   ~/.dein.toml<CR>
nnoremap <Leader>el :e   ~/.dein_lazy.toml<CR>
nnoremap <Leader>etl :tabe   ~/.dein_lazy.toml<CR>
nnoremap <Leader>em :e   ~/.secret_vimrc<CR>
nnoremap <Leader>etm :tabe   ~/.secret_vimrc<CR>
nnoremap gc :tab sp<CR>
"cmdline-editing
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
if has('nvim')
  nmap <BS> <C-h>
  " :terminal
  nnoremap <Leader>t :terminal<CR>
  nnoremap <Leader>T :tabe<CR>:terminal<CR>
  tnoremap <silent> <ESC> <C-\><C-n>

  set inccommand=split
endif

syntax on

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
if !has('nvim')
  set encoding=utf-8
endif
set number
set smartindent
set backspace=indent,eol,start
set fileencodings=euc-jp,iso-2022-jp,utf-8,cp932,default,latin
set clipboard+=unnamedplus
set noswapfile
set nofixeol
filetype plugin indent on
colorscheme desert
