-- Alias
local cmd = vim.cmd
local fn  = vim.fn
local g   = vim.g

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Plugins
cmd 'packadd paq-nvim'               -- load the package manager
local paq = require('paq-nvim').paq  -- a convenient alias
paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself
paq {'vim-airline/vim-airline'}      -- airline
paq {'vim-airline/vim-airline-themes'}
paq {'scrooloose/nerdtree'}          -- nerdtree
paq {'dikiaap/minimalist'}           -- Theme
paq {'mrtazz/DoxygenToolkit.vim'}    -- Doxygen
paq {'google/vim-maktaba'}
paq {'google/vim-codefmt'}           -- Format
paq {'google/vim-glaive'}
paq {'Yggdroot/indentLine'}          -- IndentLine
paq {'junegunn/vim-easy-align'}      -- easy-align
paq {'ryanoasis/vim-devicons'}       -- icons

-- Global
cmd 'syntax on'
cmd 'set cursorline'
cmd 'set encoding=utf-8'
cmd 'set nowrap'
cmd 'set number'
cmd 'set relativenumber'
cmd 'set nowritebackup'
cmd 'set noswapfile'
cmd 'set nobackup'
cmd 'set hlsearch'
cmd 'set ignorecase'
cmd 'set smartcase'
-- TAB Control
cmd 'set tabstop=2'
cmd 'set shiftwidth=2'
cmd 'set expandtab'
cmd 'set softtabstop=2'
cmd 'set smarttab'
-- Set Terminal Tab to name of VIM file
-- Don't set the title to 'Thanks for flying Vim' when exiting
cmd 'let &titlestring = @%'
cmd 'set title'
cmd 'execute "set titleold=Terminal"'
-- Allow vim to update file without asking
cmd 'set autoread'
-- Clear last search highlighting
cmd 'map <Space> :noh<cr>'
-- highlight matching braces
cmd 'set showmatch'
-- intelligent comments
-- cmd 'set comments=sl:/*,mb:\ *,elx:\ */'
-- Themes
cmd 'colorscheme minimalist'
cmd 'let g:airline_theme=\'minimalist\''
cmd 'command -nargs=0 Quit :qa!'

cmd 'xnoremap p "_dP'

-- highlight tailing
cmd 'set list'
cmd 'set listchars+=trail:.'
cmd 'highlight TrailingWhitespace ctermbg=red guibg=red'
-- cmd 'match TrailingWhitespace /\s\+$/'
-- Remove Trailing Command
-- cmd 'command RemoveTrailing :%s/\s\+$//'

-- cmd 'set undofile " Maintain undo history between sessions'
-- cmd 'set undodir=/tmp/undodir'

-- NERDTree
cmd 'let NERDTreeHighlightCursorline=1'
cmd "let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']"

-- airline
cmd 'let g:airline#extensions#tabline#enabled = 1'
cmd 'let g:airline_powerline_fonts = 1'

-- Enable the list of buffers
cmd 'let g:airline#extensions#tabline#enabled = 1'
-- Show just the filename
cmd "let g:airline#extensions#tabline#fnamemod = ':t'"

-- hotkeys
-- 1. NERDTree
cmd 'map <silent> <C-n> :NERDTreeToggle<CR>'
-- 2. Tagbar
cmd 'nmap <F9> :TagbarToggle<CR>'
-- 3. DoxygenToolkit
cmd 'map <silent> <F11> :Dox<CR>'
cmd 'map <silent> <F12> :DoxAuthor<CR>'
-- Start interactive EasyAlign in visual mode (e.g. vipga)
cmd 'xmap ga <Plug>(EasyAlign)'
-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
cmd 'nmap ga <Plug>(EasyAlign)'
-- Fix tab/Index
cmd 'map <F9> mzgg=G`z'
-- Next buffer
cmd 'nmap gn :bn<CR>'
cmd 'nmap gb :bp<CR>'
-- Disable Mouse
cmd 'set mouse=r'
cmd 'let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1'
cmd 'nnoremap <Left>  :vertical resize -1<CR>'
cmd 'nnoremap <Right> :vertical resize +1<CR>'
cmd 'nnoremap <Up>    :resize -1<CR>'
cmd 'nnoremap <Down>  :resize +1<CR>'
-- Disable arrow keys completely in Insert Mode
cmd 'imap <up>    <nop>'
cmd 'imap <down>  <nop>'
cmd 'imap <left>  <nop>'
cmd 'imap <right> <nop>'
-- Doxygen
cmd 'let g:DoxygenToolkit_authorName=\"Ahmed Abd El-Aal <eng.ahmedhussein89@gmail.com>\"'
cmd 'let g:DoxygenToolkit_interCommentTag = \"* \"'
cmd 'let g:DoxygenToolkit_interCommentBlock = \"* \"'
cmd 'let g:DoxygenToolkit_cinoptions = \"c0C1\"'
-- indentLine
cmd 'let g:indentLine_enabled = 1'
cmd 'let g:indentLine_leadingSpaceEnabled = 1'
cmd 'let g:indentLine_char_list = []'
cmd 'let g:indentLine_char = \'┊\''
cmd 'let g:indentLine_leadingSpaceChar = \'·\''

