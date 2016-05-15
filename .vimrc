set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'nanotech/jellybeans.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'bbchung/clighter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/DoxygenToolkit.vim'

filetype plugin indent on

source ~/.vim/global.vim
source ~/.vim/clighter.vim
source ~/.vim/youcompleteme.vim
source ~/.vim/hotkey.vim
source ~/.vim/NERDTree.vim
source ~/.vim/CtrlP.vim
source ~/.vim/DoxygenToolKit.vim
