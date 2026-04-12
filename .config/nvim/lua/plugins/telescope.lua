return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
  },
  lazy=false,
  tag='0.1.8',
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-P>', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<C-f>', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<C-h>', builtin.help_tags, { desc = 'Telescope help tags' })
  end
}
