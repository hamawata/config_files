#!/bin/sh

BASE_DIR=$(cd $(dirname $0);pwd)

# neovim
[ ! -d ${HOME}/.config/nvim ] && mkdir -p ${HOME}/.config/nvim
[ ! -e ${HOME}/.config/nvim/init.vim ] && ln -s ${BASE_DIR}/init.vim ${HOME}/.config/nvim
[ ! -f ${HOME}/.dein.toml ] && ln -s ${BASE_DIR}/.dein.toml ${HOME}
[ ! -f ${HOME}/.dein_lazy.toml ] && ln -s ${BASE_DIR}/.dein_lazy.toml ${HOME}

# vim
[ ! -f ${HOME}/.vimrc ] && ln -s ${BASE_DIR}/.vimrc ${HOME}

# tmux
[ ! -f ${HOME}/.tmux.conf ] && ln -s ${BASE_DIR}/.tmux.conf ${HOME}
