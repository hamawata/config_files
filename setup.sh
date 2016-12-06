#!/bin/sh

BASE_DIR=$(cd $(dirname $0);pwd)

# bash
[ ! -f ${HOME}/.bash_aliases ] && ln -sf ${BASE_DIR}/_bash_aliases ${HOME}/.bash_aliases

# neovim
[ ! -d ${HOME}/.config/nvim ] && mkdir -p ${HOME}/.config/nvim
[ ! -d ${HOME}/.config/nvim/after ] && mkdir -p ${HOME}/.config/nvim/after
[ ! -e ${HOME}/.config/nvim/init.vim ] && ln -sf ${BASE_DIR}/init.vim ${HOME}/.config/nvim
[ ! -f ${HOME}/.dein.toml ] && ln -sf ${BASE_DIR}/_dein.toml ${HOME}/.dein.toml
[ ! -f ${HOME}/.dein_lazy.toml ] && ln -sf ${BASE_DIR}/_dein_lazy.toml ${HOME}/.dein_lazy.toml
[ ! -d ${HOME}/.config/nvim/after/ftplugin ] && ln -sf ${BASE_DIR}/ftplugin ${HOME}/.config/nvim/after/

# vim
[ ! -f ${HOME}/.vimrc ] && ln -sf ${BASE_DIR}/_vimrc ${HOME}/.vimrc

# tmux
[ ! -f ${HOME}/.tmux.conf ] && ln -sf ${BASE_DIR}/_tmux.conf ${HOME}/.tmux.conf

# ctags
# うまく動かない
#[ ! -f ${HOME}/.ctags ] && ln -sf ${BASE_DIR}/_ctags ${HOME}/.ctags
