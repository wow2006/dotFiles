let mapleader=","
" Doxygen Syntax
let g:load_doxygen_syntax=3

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
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable
colorscheme minimalist

" Quit with :Q
command -nargs=0 Quit :qa!

" CUDA
au BufNewFile,BufRead *.cu set ft=cuda
au BufNewFile,BufRead *.cuh set ft=cuda
" PTX
if expand('%:e') == 'ptx'
    set syntax=asm
endif

set termguicolors
" yank and paste xclip
set clipboard+=unnamedplus
set relativenumber

" Python tab to 2
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4

let g:keysound_enable = 1

xnoremap p "_dP

