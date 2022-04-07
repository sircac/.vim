#!/bin/bash
mkdir ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
ln -s ~/.vim/.vimrc ~/.vimrc
echo -e "\n Just download all the bundles... \n" | tee ~/.vim/tmp.txt
vim ~/.vim/tmp.txt
rm -fr ~/.vim/setup.sh ~/.vim/.git ~/.vim/tmp.txt ~/.vim/myvim.JPG
