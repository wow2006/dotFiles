return {
  'scrooloose/nerdtree',
  cmd = 'NERDTreeToggle',
  config = function()
    vim.g.NERDTreeHighlightCursorline = 1
    vim.g.NERDTreeIgnore = { 'tmp', '.yardoc', 'pkg' }
  end,
  keys = {
    { '<C-n>', ':NERDTreeToggle<CR>', desc = 'Toggle NERDTree' },
  },
}
