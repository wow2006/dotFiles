#!/bin/bash

# Install tmux and zsh
sudo apt-get install tmux zsh -y

# Install powerline
sudo apt-get install python3-pip git curl -y
sudo pip3 install --upgrade pip
pip3 install --user virtualenvwrapper
pip3 install --user powerline-status powerline-mem-segment neovim

WORKON_HOME=~/.Envs
ZSH_PATH="set -g default-shell $(which zsh)"
PWR_PATH="source $(python3 getTmuxPowerlinePath.py)"

mkdir -p $WORKON_HOME

# Copy powerline config
cp .config ~ -r
printf "$ZSH_PATH\n$PWR_PATH\nset -sg escape-time 0\n" > ~/.tmux.conf
printf "unbind C-b\nset -g prefix C-a\nbind C-a send-prefix\n" >> ~/.tmux.conf
printf "export WORKON_HOME=~/.Envs\nsource ~/.local/bin/virtualenvwrapper.sh\n" >> ~/.zshrc

# Install oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
cp .zshrc ~

# Install ctags
sudo apt-get install exuberant-ctags -y

# Install YouCompleteMe
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev

# Install format
sudo apt install clang-format

# install ack and xclip
sudo apt install xclip

# install nerd-fonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
