local opt = vim.opt
local g   = vim.g

-- mappings helper
local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, vim.tbl_extend('force', { noremap = true }, opts or {}))
end

opt.cursorline     = true
opt.encoding       = 'utf-8'
opt.wrap           = false
opt.number         = true
opt.relativenumber = true
opt.writebackup    = false
opt.swapfile       = false
opt.backup         = false
opt.hlsearch       = true
opt.ignorecase     = true
opt.smartcase      = true
opt.spell          = false

-- TAB
opt.tabstop     = 2
opt.shiftwidth  = 2
opt.expandtab   = true
opt.softtabstop = 2
opt.smarttab    = true

-- Terminal title
opt.title       = true
opt.titlestring = '%t'
opt.titleold    = "Terminal"

opt.autoread  = true
opt.showmatch = true

-- Quit with :Q
vim.cmd('command -nargs=0 Quit :qa!')

-- clipboard
opt.clipboard:append('unnamedplus')

-- paste without overwriting register
map('x', 'p', '"_dP')

-- trailing whitespace highlight
opt.list = true
opt.listchars = { trail = '.' }
vim.cmd("highlight TrailingWhitespace ctermbg=red guibg=red")
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  callback = function()
    vim.fn.matchadd("TrailingWhitespace", [[\s\+$]])
  end,
})

-- undo history
opt.undofile = true
opt.undodir  = "/tmp/undodir"

vim.cmd("set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor")

-- folding
opt.foldmethod = 'indent'
vim.api.nvim_create_autocmd("FileType", {
  pattern  = "TelescopeResults",
  callback = function() vim.opt_local.foldenable = false end,
})

-- mouse disabled
opt.mouse = ''

-- indentLine
g.indentLine_enabled            = 1
g.indentLine_leadingSpaceEnabled = 1
g.indentLine_char               = '┊'
g.indentLine_leadingSpaceChar   = '·'

g.python3_host_prog    = '/usr/bin/python3'
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0

-- keymaps
map('n', '<Space>', ':noh<CR>')
map('n', 'gn', ':bn<CR>')
map('n', 'gb', ':bp<CR>')
map('n', '<Left>',  ':vertical resize -1<CR>')
map('n', '<Right>', ':vertical resize +1<CR>')
map('n', '<Up>',    ':resize -1<CR>')
map('n', '<Down>',  ':resize +1<CR>')
map('i', '<Up>',    '<nop>')
map('i', '<Down>',  '<nop>')
map('i', '<Left>',  '<nop>')
map('i', '<Right>', '<nop>')
map('', '<F10>', 'mzgg=G`z')

vim.cmd('command RemoveWindowNewLine :%s///g<CR>')
