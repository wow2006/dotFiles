# Install Vim
cp .vimrc ~
cp .vim ~  -rf
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall

