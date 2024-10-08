
-- ██╗    ██╗ ██████╗ ██╗    ██╗██████╗  ██████╗  ██████╗  ██████╗
-- ██║    ██║██╔═══██╗██║    ██║╚════██╗██╔═████╗██╔═████╗██╔════╝
-- ██║ █╗ ██║██║   ██║██║ █╗ ██║ █████╔╝██║██╔██║██║██╔██║███████╗
-- ██║███╗██║██║   ██║██║███╗██║██╔═══╝ ████╔╝██║████╔╝██║██╔═══██╗
-- ╚███╔███╔╝╚██████╔╝╚███╔███╔╝███████╗╚██████╔╝╚██████╔╝╚██████╔╝
--  ╚══╝╚══╝  ╚═════╝  ╚══╝╚══╝ ╚══════╝ ╚═════╝  ╚═════╝  ╚═════╝
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
-- Lazy nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'dikiaap/minimalist',
    lazy=false,
    priority=1000,
    config = function()
      vim.cmd([[colorscheme minimalist]])
    end
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup{}
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy=false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('lualine').setup{
        options = {
          icons_enabled = true,
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
          },
          sections = {
            lualine_a = {'mode'},
            lualine_b = {'diff', 'diagnostics'},
            lualine_c = {},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
          },
          extensions = {
            'man',
            'quickfix',
            'trouble',
            'trouble',
          },
        }
      }
    end
  },
  {
    'ryanoasis/vim-devicons',
    lazy=false,
  },
  {
    'neoclide/coc.nvim',
    lazy=false,
    branch='release',
    config = function()
      vim.cmd [[source /home/ahussein/.config/nvim/vim/coc.vim]]
    end
  },
  {
    'scrooloose/nerdtree',
    lazy=false,
    config = function()
      g.NERDTreeHighlightCursorline = 1
      g.NERDTreeIgnore = {'tmp', '.yardoc', 'pkg'}
      map('n', '<C-n>', ':NERDTreeToggle<CR>')
    end
  },
  {
    'mrtazz/DoxygenToolkit.vim',
    lazy=true,
    config = function()
      g["g:load_doxygen_syntax"] = 3
      g.DoxygenToolkit_authorName="Ahmed Abd El-Aal <eng.ahmedhussein89@gmail.com>"
      g.DoxygenToolkit_interCommentTag = "* "
      g.DoxygenToolkit_interCommentBlock = "* "
      g.DoxygenToolkit_cinoptions = "c0C1"
    end
  },
  {
    'google/vim-codefmt',
    dependencies = {
      'google/vim-maktaba'
    },
    lazy=false,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    lazy=false,
    tag='0.1.8',
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<C-f>', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<C-h>', builtin.help_tags, { desc = 'Telescope help tags' })
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy=false,
    config = function()
      cmd([[:TSUpdate]])
      require'nvim-treesitter.configs'.setup {
        highlight = {
          enable = true,
          custom_captures = {
            -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
            ["foo.bar"] = "Identifier",
          },
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
      }
      require'nvim-treesitter.configs'.setup {
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      }
      require'nvim-treesitter.configs'.setup {
        indent = {
          enable = true
        }
      }
    end
  },
  {
    'peterhoeg/vim-qml',
    lazy=true,
  },
  {
    'Neui/cmakecache-syntax.vim',
    lazy=true,
  },
  {
    'junegunn/vim-easy-align',
    lazy=false,
    config = function()
      -- Start interactive EasyAlign in visual mode (e.g. vipga)
      cmd('xmap ga <Plug>(EasyAlign)')
      -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
      cmd('nmap ga <Plug>(EasyAlign)')
    end
  },
  {
    'jez/vim-superman',
    lazy=true,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true,   -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
        },
      })
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  }
})
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
