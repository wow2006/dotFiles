call plug#begin('~/.local/share/nvim/plugged')

" Start A
Plug 'vim-scripts/a.vim'
" Start airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Start NERDtree
Plug 'scrooloose/nerdtree'
" color iceberg
Plug 'cocopon/iceberg.vim'
" Start Tagbar
Plug 'majutsushi/tagbar'
" End Tagbar
" Start YouCompleteMe
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'rdnetto/YCM-Generator'
Plug 'arakashic/chromatica.nvim'
Plug 'vim-syntastic/syntastic'
" End YouCompleteMe
" Start Doxygen
Plug 'mrtazz/DoxygenToolkit.vim'
" End Doxygen
" Start Clang Format
Plug 'rhysd/vim-clang-format'
Plug 'kana/vim-operator-user'
" End   Clang Format
" Start anyfold
Plug 'pseewald/vim-anyfold'
" End   andfold
" Start indectLine
Plug 'Yggdroot/indentLine'
" End indectLine
" Start BookMark
Plug 'MattesGroeger/vim-bookmarks'
" End BookMark
" Start Ctrl-P
Plug 'ctrlpvim/ctrlp.vim'
" End   Ctrl-P
" Start MiniMap
Plug 'severin-lemaignan/vim-minimap'
" End MiniMap
" Start vim-easy-align
Plug 'junegunn/vim-easy-align'
" End vim-easy-align
" Start Simply-Vim
Plug 'tmhedberg/SimpylFold'
" End   Simply-Vim
" Start Ack
Plug 'mileszs/ack.vim'
" End   Ack
" DevIcons
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

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
source ~/.vim/chromatica.vim
source ~/.vim/syntastic.vim
source ~/.vim/Zoom.vim
