#!/bin/bash 

rm -f ~/.config/nvim
ln -s `pwd`/nvim ~/.config/nvim

nvim +PlugInstall +qall
nvim +PlugUpdate +qall
