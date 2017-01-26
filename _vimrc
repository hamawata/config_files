if version >= 740 || has('nvim')
  let $MYVIMRC_REAL = fnamemodify(resolve(expand("<sfile>:p")), ':h') . '/init.vim'
else
  let $MYVIMRC_REAL = fnamemodify(resolve(expand("<sfile>:p")), ':h') . '/_vimrc_real'
endif
execute 'source' $MYVIMRC_REAL
