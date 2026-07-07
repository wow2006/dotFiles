local parsers   = { 'lua', 'c', 'cpp', 'python', 'bash', 'cmake', 'vim', 'vimdoc' }
local filetypes = { 'lua', 'c', 'cpp', 'python', 'sh', 'bash', 'cmake', 'vim', 'help' }

return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  event  = { 'BufReadPost', 'BufNewFile' },
  build  = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install(parsers)
    vim.api.nvim_create_autocmd('FileType', {
      pattern  = filetypes,
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
