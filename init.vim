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
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" End YouCompleteMe
" Start Doxygen
Plug 'mrtazz/DoxygenToolkit.vim'
" End Doxygen
" Start Clang Format
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
" End   Clang Format
" Start indectLine
Plug 'Yggdroot/indentLine'
" End indectLine
" Start BookMark
Plug 'MattesGroeger/vim-bookmarks'
" End BookMark
" Start MiniMap
Plug 'severin-lemaignan/vim-minimap'
" End MiniMap
" Start vim-easy-align
Plug 'junegunn/vim-easy-align'
" End vim-easy-align
" Start FastFold
Plug 'Konfekt/FastFold'
" Start sourcetrail
Plug 'CoatiSoftware/vim-sourcetrail'
" End   sourcetrail
" Icon
Plug 'ryanoasis/vim-devicons'
" Git
Plug 'airblade/vim-gitgutter'
" Debug
"Plug 'critiqjo/lldb.nvim'
" cpp highlight
Plug 'octol/vim-cpp-enhanced-highlight'
" cpp highlight
" If installed using git
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" GLSL
Plug 'tikhomirov/vim-glsl'
" GLSL
" Sound
Plug 'skywind3000/vim-keysound'
" Sound
" vim-qml
Plug 'peterhoeg/vim-qml'
" vim-qml
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Initialize plugin system
call plug#end()

" Include Files
source ~/.vim/global.vim
source ~/.vim/NERDTree.vim
source ~/.vim/airline.vim
source ~/.vim/dictionary.vim
source ~/.vim/folding.vim
source ~/.vim/fzf.vim
source ~/.vim/hotkey.vim
source ~/.vim/DoxygenToolKit.vim
source ~/.vim/syntax.vim
source ~/.vim/bookmark.vim
source ~/.vim/deoplete.vim
source ~/.vim/language_client.vim
