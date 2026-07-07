return {
  'nvim-telescope/telescope.nvim',
  branch       = 'master',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = {
    { '<C-P>', function() require('telescope.builtin').find_files() end, desc = 'Telescope find files' },
    { '<C-f>', function() require('telescope.builtin').live_grep()  end, desc = 'Telescope live grep'  },
    { '<C-h>', function() require('telescope.builtin').help_tags()  end, desc = 'Telescope help tags'  },
  },
  config = function()
    require('telescope').setup{}
    require('telescope').load_extension('fzf')
  end,
}
