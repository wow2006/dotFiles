set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My Bundles
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
" Replace vim-powerline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" end of airline
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
" Start color_coded
Bindle 'jeaye/color_coded'
" End color_coded
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/DoxygenToolkit.vim'
" Start YCM-G
Bundle 'rdnetto/YCM-Generator'
" End   YCM-G
" Start OpenCL
Bundle 'petRUShka/vim-opencl'
" End OpenCL
" Start MarkDown Plugin
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" End MarkDown
" Add Git
Bundle 'motemen/git-vim'
" End Git
" Show WhiteSpaces
Bundle 'ntpeters/vim-better-whitespace'
" End of WhiteSpaces
" Clang Format
Bundle 'kana/vim-operator-user'
Bundle 'rhysd/vim-clang-format'
" End of Clang Format
" CMake
Bundle 'jalcine/cmake.vim'
" End of CMake

filetype plugin indent on

source ~/.vim/global.vim
source ~/.vim/youcompleteme.vim
source ~/.vim/hotkey.vim
source ~/.vim/NERDTree.vim
source ~/.vim/CtrlP.vim
source ~/.vim/DoxygenToolKit.vim
source ~/.vim/airline.vim
source ~/.vim/dictionary.vim
source ~/.vim/folding.vim
