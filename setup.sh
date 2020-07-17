#!/bin/bash
mkdir ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
ln -s ~/.vim/.vimrc ~/.vimrc
echo " > Open vim and download the bundles... "
vim ~/.vimrc
rm -fr ~/.vim/setup.sh ~/.vim/.git
