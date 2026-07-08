#!/bin/bash
if [ -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    git -C "$HOME/.vim/bundle/Vundle.vim" pull
else
    git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
fi