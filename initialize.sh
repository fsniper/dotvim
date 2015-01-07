#!/bin/bash

git submodule init
git submodule update --recursive --init

rm ~/.vimrc
rm -r ~/.vim

ln -s $(pwd)/vim ~/.vim
ln -s $(pwd)/vimrc ~/.vimrc

