#!/bin/bash 

rm -f ~/.config/nvim
ln -s `pwd`/nvim ~/.config/nvim

nvim +PlugClean +qall
nvim +PlugInstall +qall
nvim +PlugUpdate +qall
