#!/usr/bin/bash

# Install tmux and zsh
sudo apt-get install tmux zsh -y

# Install powerline
sudo apt-get install python3-pip git -y
sudo pip3 install --upgrade pip
pip3 install --user powerline powerline-mem-segment

ZSH_PATH="set -g default-shell $(which zsh)"
PWR_PATH="source $(python3 getTmuxPowerlinePath.py)"

# Copy powerline config
cp .config ~ -r
echo "$(ZSH_PATH)\n$(PWR_PATH)\nset -sg escape-time 0\n" > ~/.tmux.conf
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
cp .zshrc ~

# Install Vim
cp .vimrc ~
cp .vim ~  -rf
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall

# Install ctags
sudo apt-get install exuberant-ctags -y

# Install YouCompleteMe
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

# Install format
sudo apt-get install clang-format

