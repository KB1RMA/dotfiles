#!/bin/bash
if [ -d "~/.vim/bundle/Vundle.vim" ]; then
    git -C "~/.vim/bundle/Vundle.vim" pull
else
    git clone https://github.com/VundleVim/Vundle.vim.git "~/.vim/bundle/Vundle.vim"
fi