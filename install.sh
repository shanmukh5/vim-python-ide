#!/bin/bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -u ${CURDIR}/plugins +PlugInstall! +qall!

cat ${CURDIR}/plugins ${CURDIR}/configs > ${HOME}/.vimrc
