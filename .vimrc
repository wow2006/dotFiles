set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Start A
Plugin 'vim-scripts/a.vim'
" End   A
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
" Start Doxygen
Plugin 'mrtazz/DoxygenToolkit.vim'
" End Doxygen
" Start Clang Format
Plugin 'rhysd/vim-clang-format'
Plugin 'kana/vim-operator-user'
" End   Clang Format
" Start anyfold
Plugin 'pseewald/vim-anyfold'
" End   andfold
" Start indectLine
Plugin 'Yggdroot/indentLine'
" End indectLine
" Start BookMark
Plugin 'MattesGroeger/vim-bookmarks'
" End BookMark
" Start Ctrl-P
Plugin 'ctrlpvim/ctrlp.vim'
" End   Ctrl-P
" Start MiniMap
Plugin 'severin-lemaignan/vim-minimap'
" End MiniMap
" Start vim-easy-align
Plugin 'junegunn/vim-easy-align'
" End vim-easy-align
" Start Simply-Vim
Plugin 'tmhedberg/SimpylFold'
" End   Simply-Vim

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set bs=indent,eol,start     " Backspace over everything in insert mode

" Include Files
source ~/.vim/global.vim
source ~/.vim/NERDTree.vim
source ~/.vim/youcompleteme.vim
source ~/.vim/airline.vim
source ~/.vim/dictionary.vim
source ~/.vim/folding.vim
source ~/.vim/hotkey.vim
source ~/.vim/DoxygenToolKit.vim
source ~/.vim/clangFormat.vim
source ~/.vim/syntax.vim
source ~/.vim/bookmark.vim
