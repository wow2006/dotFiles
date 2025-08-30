return {
  -- LSP Support
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- LSP Support
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},
      {'L3MON4D3/LuaSnip'},
      {'saadparwaiz1/cmp_luasnip'},
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'clangd',
        },
        automatic_installation = true,
      })
    end
  },
}
