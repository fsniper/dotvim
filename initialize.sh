#!/bin/bash

git submodule init
git submodule update

rm ~/.vimrc
rm -r ~/.vim

ln -s $(pwd)/vim ~/.vim
ln -s $(pwd)/vimrc ~/.vimrc

