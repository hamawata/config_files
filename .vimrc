if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
if isdirectory(expand('~/.vim/userautoload'))
    set runtimepath+=~/.vim/
    runtime! userautoload/*.vim
endif

"---------------plugin settings
if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

"neocomplcache
NeoBundle 'Shougo/neocomplcache'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
"~neocomplcache

"neosnippet
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
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

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'sudo.vim'
NeoBundle 'thinca/vim-quickrun'
"NeoBundle 'itchyny/calendar.vim'
NeoBundle 'https://github.com/kmnk/vim-unite-giti.git'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'tpope/vim-surround'
NeoBundle 'https://github.com/leafgarland/typescript-vim.git'
NeoBundle 'https://github.com/clausreinke/typescript-tools.git'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/neossh.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'kana/vim-filetype-haskell'
NeoBundle 'eagletmt/ghcmod-vim'

call neobundle#end()

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

" vinarise
let g:vinarise_enable_auto_detect = 1

" unite-build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>
"~unite.vim

"quick run
nnoremap <Leader>qa :QuickRun -args

"easy align
vmap <Enter> <Plug>(EasyAlign)

set tags=~/.tags
autocmd FileType php :set dictionary=~/.vim/dict/php.dict
endif
"----------------~plugin setting

"for tab complement
set nocompatible

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

syntax on

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
"set encoding=utf-8
set number
set smartindent
set backspace=indent,eol,start
set fileencodings=euc-jp,iso-2022-jp,utf-8,cp932,default,latin
"set clipboard=unnamed,autoselect
set noswapfile
filetype plugin indent on
