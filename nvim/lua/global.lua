-- Aliases
local cmd = vim.cmd
local opt = vim.opt
local g   = vim.g

g["mapleader"] = ","
g["g:load_doxygen_syntax"] = 3
cmd 'syntax enable'

opt.cursorline = true
opt.encoding = 'utf-8'
opt.wrap = false
opt.number = true
opt.writebackup = false
opt.swapfile = false
opt.backup = false
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
-- TAB Control
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.softtabstop = 2
opt.smarttab = true
-- Set Terminal Tab to name of VIM file
-- Don't set the title to 'Thanks for flying Vim' when exiting
g['&titlestring'] = '@%'
opt.title = true
opt.titleold = "Terminal"
-- Allow vim to update file without asking
opt.autoread = true
-- highlight matching braces
opt.showmatch = true
-- TODO: intelligent comments
-- opt.comments="sl:/*,mb:\ *,elx:\ */"

-- Color
cmd 'colorscheme minimalist'
-- Quit with :Q
cmd 'command -nargs=0 Quit :qa!'
-- CUDA
cmd 'au BufNewFile,BufRead *.cu set ft=cuda'
cmd 'au BufNewFile,BufRead *.cuh set ft=cuda'
-- (TODO):PTX
-- if expand('%:e') == 'ptx'
--   set syntax=asm
-- endif
-- yank and paste xclip
opt.clipboard      = opt.clipboard + 'unnamedplus'
opt.relativenumber = true

g['keysound_enable']     = 1
g['keysound_py_version'] = 3
g['keysound_volume']     = 1000

cmd("xnoremap p \"_dP")

-- highlight tailing
opt.list = true
cmd("set listchars+=trail:.")
cmd("highlight TrailingWhitespace ctermbg=red guibg=red")
cmd([[match TrailingWhitespace /\s\+$/]])
-- Remove Trailing Command
-- cmd([[command RemoveTrailing :%s/\s\+$//]])
-- Maintain undo history between sessions
opt.undofile = true
opt.undodir = "/tmp/undodir"

cmd("set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor")

--[[ TODO
function! SortLines() range
    execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
    execute a:firstline . "," . a:lastline . 'sort n'
    execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction
--]]

-- NERDTree
g.NERDTreeHighlightCursorline = 1
g.NERDTreeIgnore = {'tmp', '.yardoc', 'pkg'}
-- airline
g["airline_theme"] = 'minimalist'
g['airline#extensions#tabline#enabled'] = 1
g['airline_powerline_fonts'] = 1
-- Enable the list of buffers
g['airline#extensions#tabline#enabled'] = 1
-- Show just the filename
g['airline#extensions#tabline#fnamemod'] = ':t'

-- folding
opt.foldmethod='indent'
-- treesitter
-- opt.foldmethod='expr'
-- opt.foldexpr='nvim_treesitter#foldexpr()'
-- cmd('autocmd BufReadPost,FileReadPost * normal zR')

-- Disable Mouse
opt.mouse='r'
-- cmd('let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1')

-- DoxygenToolkit_authorName
g.DoxygenToolkit_authorName="Ahmed Abd El-Aal <eng.ahmedhussein89@gmail.com>"
g.DoxygenToolkit_interCommentTag = "* "
g.DoxygenToolkit_interCommentBlock = "* "
g.DoxygenToolkit_cinoptions = "c0C1"

-- bookmark
cmd('highlight BookmarkSign ctermbg=NONE ctermfg=160')
cmd('highlight BookmarkLine ctermbg=194 ctermfg=NONE')
g.bookmark_sign = '♥'
g.bookmark_highlight_lines = 1

-- indentLine
g.indentLine_enabled = 1
g.indentLine_leadingSpaceEnabled = 1
--g.indentLine_char_list = []
g.indentLine_char = '┊'
g.indentLine_leadingSpaceChar = '·'

g.python3_host_prog = '/usr/bin/python3'
