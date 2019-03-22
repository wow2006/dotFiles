#!/bin/bash

# Update system
sudo pacman -Syu --noconfirm

# Install tmux and zsh
sudo pacman -S tmux zsh --noconfirm

# Install powerline
sudo pacman -S python-pip git curl --noconfirm
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
# set virtualenvwrapper
printf "# set virtualenvwrapper\nexport WORKON_HOME=~/.Envs\nsource ~/.local/bin/virtualenvwrapper.sh\n" >> ~/.zshrc

# Install oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
cp .zshrc ~

sudo pacman -S \
     ctags     \
     cmake     \
     clang     \
     xclip     \
     neovim    \
     --noconfirm

printf 'alias vim="nvim"' >> ~/.zshrc
     
# nvim config
cp .vim ~ -r
mkdir -p $HOME/.config/nvim
cp init.vim $HOME/.config/nvim/init.vim

# Install plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install neovim plugs
vim +PlugInstall +qall
vim +UpdateRemotePlugins

# install nerd-fonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install my analysis tool
sudo pacman -S \
     cppcheck  \
     aurman    \
     --noconfirm

# Install pvs-studio and source-trail
aurman -S         \
     pvs-studio   \
     source-trail \
     cov-analysis \
     --noconfirm

# pysdl2 -> keysound
pip3 install pysdl2 pynvim --user
sudo pacman -S \
  sdl2  \
     sdl2_mixer \
     --noconfirm
