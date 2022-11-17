-- Aliases
local cmd = vim.cmd

--mappings
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Clear last search highlighting
map('n', '<Space>', ':noh<cr>')

-- NERDTree
map('n', '<C-n>', ':NERDTreeToggle<CR>')

-- Tagbar
map('n', '<F9>', ':TagbarToggle<CR>')

-- ================================================================
-- Start interactive EasyAlign in visual mode (e.g. vipga)
cmd('xmap ga <Plug>(EasyAlign)')
-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
cmd('nmap ga <Plug>(EasyAlign)')
-- ================================================================

-- ================================================================
-- Next buffer
map('n', 'gn', ':bn<CR>')
map('n', 'gb', ':bp<CR>')
-- ================================================================

-- ================================================================
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
-- FZF-lua
map('n', '<C-t>', "<cmd>lua require('fzf-lua').files()<CR>")
map('n', '<C-l>', "<cmd>lua require('fzf-lua').blines()<CR>")
map('n', '<C-s>', "<cmd>lua require('fzf-lua').live_grep()<CR>")

map('n', '<space>r', "<cmd>lua require('fzf-lua').lsp_references()<CR>")
map('n', '<space>ds', "<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>")
map('n', '<space>ca', "<cmd>lua require('fzf-lua').lsp_code_actions()<CR>")
map('n', '<space>dd', "<cmd>lua require('fzf-lua').lsp_document_diagnostics()<CR>")
-- ================================================================
