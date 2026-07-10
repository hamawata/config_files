#!/bin/sh

set -e

BASE_DIR=$(cd $(dirname $0);pwd)

# bash
[ ! -f ${HOME}/.bash_aliases ] && ln -sf ${BASE_DIR}/_bash_aliases ${HOME}/.bash_aliases
[ ! -f ${HOME}/.bash_profile ] && ln -sf ${BASE_DIR}/_bash_profile ${HOME}/.bash_profile

# neovim (modern lazy.nvim config; the legacy dein.vim + init.vim setup has
# been fully ported over -- denite/defx/surround etc. now live under nvim/lua
# -- so it's no longer symlinked here)
[ ! -d ${HOME}/.config/nvim ] && mkdir -p ${HOME}/.config/nvim
[ ! -d ${HOME}/.config/nvim/after ] && mkdir -p ${HOME}/.config/nvim/after
[ ! -d ${HOME}/.config/nvim/after/ftplugin ] && ln -sf ${BASE_DIR}/ftplugin ${HOME}/.config/nvim/after/
[ ! -e ${HOME}/.config/nvim/init.lua ] && ln -sf ${BASE_DIR}/nvim/init.lua ${HOME}/.config/nvim/
[ ! -e ${HOME}/.config/nvim/lua ] && ln -sf ${BASE_DIR}/nvim/lua ${HOME}/.config/nvim/

# vim
[ ! -f ${HOME}/.vimrc ] && ln -fs ${BASE_DIR}/_vimrc ${HOME}/.vimrc

# gvim
[ ! -f ${HOME}/.gvimrc ] && ln -sf ${BASE_DIR}/_gvimrc ${HOME}/.gvimrc

# tmux
[ ! -f ${HOME}/.tmux.conf ] && ln -sf ${BASE_DIR}/_tmux.conf ${HOME}/.tmux.conf

# ctags
# うまく動かない
#[ ! -f ${HOME}/.ctags ] && ln -sf ${BASE_DIR}/_ctags ${HOME}/.ctags
