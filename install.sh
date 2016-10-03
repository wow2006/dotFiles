#!/usr/bin/bash
mv .vimrc ~
mv .vim ~
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall
# Install YouCompleteMe
sudo dnf install automake gcc gcc-c++ kernel-devel cmake
sudo dnf install python-devel python3-devel
cd ~/.vim/bundle/YouCompleteMe
python install.py --clang-completer
