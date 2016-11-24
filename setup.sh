#!/bin/sh

BASE_DIR=$(cd $(dirname $0);pwd)

# neovim
[ ! -d ${HOME}/.config/nvim ] && mkdir -p ${HOME}/.config/nvim
[ ! -e ${HOME}/.config/nvim/init.vim ] && ln -sf ${BASE_DIR}/init.vim ${HOME}/.config/nvim
[ ! -f ${HOME}/.dein.toml ] && ln -sf ${BASE_DIR}/_dein.toml ${HOME}/.dein.toml
[ ! -f ${HOME}/.dein_lazy.toml ] && ln -sf ${BASE_DIR}/_dein_lazy.toml ${HOME}/.dein_lazy.toml

# vim
[ ! -f ${HOME}/.vimrc ] && ln -sf ${BASE_DIR}/_vimrc ${HOME}/.vimrc

# tmux
[ ! -f ${HOME}/.tmux.conf ] && ln -sf ${BASE_DIR}/_tmux.conf ${HOME}/.tmux.conf
