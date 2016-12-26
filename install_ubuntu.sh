#!/usr/bin/bash
mv .vimrc ~
mv .vim ~
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall

# Install YouCompleteMe
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

# Install format
sudo apt-get install clang-format
