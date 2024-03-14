
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
      print("minimalist")
    end
  },
  {
    'vim-airline/vim-airline',
    lazy=false,
    dependencies = {
      "vim-airline/vim-airline-themes",
      "ryanoasis/vim-devicons",
    },
    config = function()
      print("airline")
      g["airline_theme"] = 'minimalist'
      g['airline#extensions#tabline#enabled'] = 1
      g['airline_powerline_fonts'] = 1
      -- Enable the list of buffers
      g['airline#extensions#tabline#enabled'] = 1
      -- Show just the filename
      g['airline#extensions#tabline#fnamemod'] = ':t'
      g['g:airline#extensions#tabline#formatter'] = 'unique_tail'
    end
  },
  {
    'ryanoasis/vim-devicons',
    lazy=false,
  },
  {
    'neoclide/coc.nvim',
    lazy=false,
    branch='release'
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
    lazy=true,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    lazy=false,
    tag='0.1.6',
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy=true,
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
    lazy=true,
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
