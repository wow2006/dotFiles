return {
  'neoclide/coc.nvim',
  lazy=false,
  branch="release",
  config = function()
    -- Enable highlight for current word
    vim.opt.updatetime = 300

    -- ==================================================================
    -- Use C to open coc config
    local function setup_command_abbrs(from, to)
      vim.cmd(string.format(
        [[cnoreabbrev <expr> %s ((getcmdtype() ==# ':' && getcmdline() ==# '%s') ? ('%s') : ('%s'))]],
        from, from, to, from
      ))
    end

    setup_command_abbrs('C', 'CocConfig')
    -- ==================================================================

    -- ==================================================================
    vim.cmd([[
    " Select from complete
    inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
    " Go to definition
    nmap <silent><nowait> gd <Plug>(coc-definition)
    ]])

    -- Use <c-space> to trigger completion
    vim.keymap.set('i', '<c-space>', 'coc#refresh()', { silent = true, expr = true })
    -- ==================================================================

    -- ==================================================================
    -- Use K to show documentation in preview window
    local function show_documentation()
      local filetype = vim.bo.filetype
      if vim.tbl_contains({'vim', 'help'}, filetype) then
        vim.cmd('h ' .. vim.fn.expand('<cword>'))
      else
        vim.fn.CocAction('doHover')
      end
    end

    vim.keymap.set('n', 'K', show_documentation, { silent = true })
    -- ==================================================================

    -- coc-vimlsp
    vim.g.markdown_fenced_languages = {
      'vim',
      'help'
    }
  end
}

