return {
  'nvim-lualine/lualine.nvim',
  event        = 'VeryLazy',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup{
      options = {
        icons_enabled        = true,
        component_separators = { left = '', right = '' },
        section_separators   = { left = '', right = '' },
        always_divide_middle = true,
        globalstatus         = false,
        refresh              = { statusline = 1000 },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'diff', 'diagnostics' },
        lualine_c = {},
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      extensions = { 'man', 'quickfix', 'trouble' },
    }
  end,
}
