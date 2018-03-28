call plug#begin('~/.local/share/nvim/plugged')

" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'
" Start A
Plug 'vim-scripts/a.vim'
" Start airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Start NERDtree
Plug 'scrooloose/nerdtree'
" color tender
Plug 'jacoborus/tender.vim'
" Start Tagbar
Plug 'majutsushi/tagbar'
" End Tagbar
" Start YouCompleteMe
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'rdnetto/YCM-Generator'
Plug 'arakashic/chromatica.nvim'
" End YouCompleteMe
" Start Doxygen
Plug 'mrtazz/DoxygenToolkit.vim'
" End Doxygen
" Start Clang Format
Plug 'rhysd/vim-clang-format'
Plug 'kana/vim-operator-user'
" End   Clang Format
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
" Start FastFold
Plug 'Konfekt/FastFold'
" Start sourcetrail
"Plug 'CoatiSoftware/vim-sourcetrail'
" End   sourcetrail
" Icon
Plug 'ryanoasis/vim-devicons'
" Git
Plug 'airblade/vim-gitgutter'
" Debug
"Plug 'critiqjo/lldb.nvim'
"

" If installed using git
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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
