call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'dikiaap/minimalist'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'mrtazz/DoxygenToolkit.vim'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'Yggdroot/indentLine'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'junegunn/vim-easy-align'
Plug 'Konfekt/FastFold'
Plug 'CoatiSoftware/vim-sourcetrail'
Plug 'ryanoasis/vim-devicons'
Plug 'tikhomirov/vim-glsl'
Plug 'skywind3000/vim-keysound'
Plug 'peterhoeg/vim-qml'
Plug 'SirVer/ultisnips'
Plug 'wow2006/vim-snippets'
Plug 'TaDaa/vimade'
Plug 'jez/vim-superman'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'wow2006/CppUtility-neovim', { 'do': function('DoRemote') }

" Initialize plugin system
call plug#end()

" Include Files
source ~/.vim/global.vim
source ~/.vim/NERDTree.vim
source ~/.vim/airline.vim
source ~/.vim/folding.vim
source ~/.vim/hotkey.vim
source ~/.vim/DoxygenToolKit.vim
source ~/.vim/bookmark.vim
source ~/.vim/coc.vim
source ~/.vim/vimade.vim
source ~/.vim/indentLine.vim
source ~/.vim/utilties.vim
