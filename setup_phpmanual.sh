#!/bin/sh

BASE_DIR=$(cd $(dirname $0);pwd)

cd $BASE_DIR
[ ! -d ${BASE_DIR}/php-chunked-xhtml ] && curl -sL http://jp2.php.net/get/php_manual_ja.tar.gz/from/this/mirror | tar xz

# php_chunked_xhtml ディレクトリができていなければ終了
[ ! -d ${BASE_DIR}/php-chunked-xhtml ] && echo 'Error: fail to get php_chunked_xhtml.' 1>&2 && exit

# neovim
[ ! -d ${HOME}/.config/nvim ] && mkdir -p ${HOME}/.config/nvim
[ ! -d ${HOME}/.config/nvim/ref ] && mkdir -p ${HOME}/.config/nvim/ref
[ ! -d ${HOME}/.config/nvim/ref/php-chunked-xhtml ] && ln -sf ${BASE_DIR}/php-chunked-xhtml ${HOME}/.config/nvim/ref/
