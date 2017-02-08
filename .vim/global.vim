let mapleader=","
" Doxygen Syntax
let g:load_doxygen_syntax=1

syntax on
set cursorline
set encoding=utf-8
set nowrap
set number
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set ignorecase
set smartcase
" TAB Control
set tabstop=4  
set shiftwidth=4  
set expandtab  
set softtabstop=4  
set smarttab
" Set Terminal Tab to name of VIM file
" Don't set the title to 'Thanks for flying Vim' when exiting
let &titlestring = @%
set title
execute "set titleold=Terminal"
" Allow vim to update file without asking
set autoread
" Clear last search highlighting
map <Space> :noh<cr>
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Color
color jellybeans
let g:airline_theme='jellybeans'

" Quit with :Q
command -nargs=0 Quit :qa!

" CUDA
au BufNewFile,BufRead *.cu set ft=cuda
au BufNewFile,BufRead *.cuh set ft=cuda
