return {
  'neoclide/coc.nvim',
  branch = 'release',
  event  = 'BufReadPost',
  config = function()
    vim.opt.updatetime = 300

    local function setup_command_abbrs(from, to)
      vim.cmd(string.format(
        [[cnoreabbrev <expr> %s ((getcmdtype() ==# ':' && getcmdline() ==# '%s') ? ('%s') : ('%s'))]],
        from, from, to, from
      ))
    end
    setup_command_abbrs('C', 'CocConfig')

    vim.cmd([[
      inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
      nmap <silent><nowait> gd <Plug>(coc-definition)
    ]])

    vim.keymap.set('i', '<c-space>', 'coc#refresh()', { silent = true, expr = true })

    local function show_documentation()
      local ft = vim.bo.filetype
      if vim.tbl_contains({ 'vim', 'help' }, ft) then
        vim.cmd('h ' .. vim.fn.expand('<cword>'))
      else
        vim.fn.CocAction('doHover')
      end
    end
    vim.keymap.set('n', 'K', show_documentation, { silent = true })

    vim.g.markdown_fenced_languages = { 'vim', 'help' }
  end,
}
