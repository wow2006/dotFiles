set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Start airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" End airline
" Start NERDtree
Plugin 'scrooloose/nerdtree'
" End NERDtree
" Start Jellybeans
Plugin 'nanotech/jellybeans.vim'
" End Jellybeans
" Start Tagbar
Plugin 'majutsushi/tagbar'
" End Tagbar
" Start YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
" End YouCompleteMe
" Start ColorCoded
Plugin 'jeaye/color_coded'
" End ColorCoded
" Start Doxygen
Plugin 'mrtazz/DoxygenToolkit.vim'
" End Doxygen
" Start Clang Format
Plugin 'rhysd/vim-clang-format'
Plugin 'kana/vim-operator-user'
" End   Clang Format

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Include Files
source ~/.vim/global.vim
source ~/.vim/NERDTree.vim
source ~/.vim/youcompleteme.vim
source ~/.vim/airline.vim
source ~/.vim/dictionary.vim
source ~/.vim/folding.vim
source ~/.vim/hotkey.vim
source ~/.vim/color_coded.vim
source ~/.vim/DoxygenToolKit.vim
source ~/.vim/clangFormat.vim
