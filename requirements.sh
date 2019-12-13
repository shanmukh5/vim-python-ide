#!/bin/bash
# Installing ctags
if [[ "$OSTYPE" == "linux-gnu" ]]; then
        sudo apt-get install ctags
elif [[ "$OSTYPE" == "darwin"* ]]; then
	brew install ctags

VIM_VERSION="v8.1.0664"
CURDIR=${PWD}
CPUS=$(grep -c ^processor /proc/cpuinfo)

read -p "Please backup your .vimrc file and .vim directory before starting. Press [Enter] to continue."

git clone --branch $VIM_VERSION https://github.com/vim/vim.git /tmp/vim-build/
cd /tmp/vim-build

./configure --prefix=${HOME}/tools/vim --with-features=huge --enable-multibyte --enable-pythoninterp=yes --enable-python3interp=yes

make -j $CPUS && make install

pip2 install --user rope jedi ropevim flake8

UPDATE_PATH='export PATH=${HOME}/tools/vim/bin:$PATH'

export PATH=${HOME}/tools/vim/bin:$PATH

if grep -qF "$UPDATE_PATH" ${HOME}/.bashrc; then
	echo "Not updating bashrc"
else
	echo "$UPDATE_PATH"  >> ${HOME}/.bashrc
fi
