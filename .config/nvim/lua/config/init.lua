-- ================================================================
-- Aliases
-- ================================================================
local cmd = vim.cmd
local opt = vim.opt
local g   = vim.g

g["mapleader"] = ","
cmd 'syntax enable'

--mappings
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

opt.compatible     = false   -- disable compatibility to old-time vi
opt.cursorline     = true    -- highlight current cursorline
opt.encoding       = 'utf-8'
opt.wrap           = false
opt.number         = true    -- add line numbers
opt.relativenumber = true
opt.writebackup    = false
opt.swapfile       = false   -- disable creating swap file
opt.backup         = false
opt.hlsearch       = true    -- highlight search
opt.ignorecase     = true
opt.smartcase      = true
opt.spell          = false   -- enable spell check (may need to download language package)
-- TAB Control
-- see multiple spaces as tabstops so <BS> does the right thing
opt.tabstop    = 2    -- number of columns occupied by a tab
opt.shiftwidth = 2    -- width for autoindents
opt.expandtab  = true -- converts tabs to white space
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
-- Quit with :Q
cmd 'command -nargs=0 Quit :qa!'
-- yank and paste xclip
opt.clipboard = opt.clipboard + 'unnamedplus'

cmd("xnoremap p \"_dP")

-- highlight tailing
opt.list = true
cmd("set listchars+=trail:.")
cmd("highlight TrailingWhitespace ctermbg=red guibg=red")
cmd([[match TrailingWhitespace /\s\+$/]])
-- Maintain undo history between sessions
opt.undofile = true
opt.undodir = "/tmp/undodir"

cmd("set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor")
-- folding
opt.foldmethod='indent'
vim.api.nvim_create_autocmd("FileType", {
    pattern = "TelescopeResults",
    callback = function()
        vim.opt_local.foldenable = false
    end,
})
-- Disable Mouse
opt.mouse='r'
-- indentLine
g.indentLine_enabled = 1
g.indentLine_leadingSpaceEnabled = 1
g.indentLine_char = '┊'
g.indentLine_leadingSpaceChar = '·'

g.python3_host_prog = '/usr/bin/python3'

g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
-- ================================================================
-- Clear last search highlighting
map('n', '<Space>', ':noh<cr>')
-- ================================================================
-- Next buffer
map('n', 'gn', ':bn<CR>')
map('n', 'gb', ':bp<CR>')
-- ================================================================
-- Disable Mouse
cmd('nnoremap <Left>  :vertical resize -1<CR>')
cmd('nnoremap <Right> :vertical resize +1<CR>')
cmd('nnoremap <Up>    :resize -1<CR>')
cmd('nnoremap <Down>  :resize +1<CR>')
-- Disable arrow keys completely in Insert Mode
cmd('imap <up>    <nop>')
cmd('imap <down>  <nop>')
cmd('imap <left>  <nop>')
cmd('imap <right> <nop>')
-- ================================================================
-- Fix tab/Index
map('', '<F10>', 'mzgg=G`z')
cmd('command RemoveWindowNewLine :%s///g<CR>')
-- ================================================================
