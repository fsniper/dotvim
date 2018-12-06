#!/bin/bash

rm ~/.vimrc
rm -r ~/.vim

ln -s $(pwd)/vim ~/.vim
ln -s $(pwd)/vimrc ~/.vimrc

ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.vim/init.vim
