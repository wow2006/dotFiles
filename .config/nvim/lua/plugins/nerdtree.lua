return {
  'scrooloose/nerdtree',
  lazy=false,
  config = function()
    local g = vim.g
    --mappings
    local function map(mode, lhs, rhs, opts)
      local options = {noremap = true}
      if opts then
        options = vim.tbl_extend('force', options, opts)
      end
      vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    end

    g.NERDTreeHighlightCursorline = 1
    g.NERDTreeIgnore = {'tmp', '.yardoc', 'pkg'}
    map('n', '<C-n>', ':NERDTreeToggle<CR>')
  end
}
