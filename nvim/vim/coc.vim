" Enable highlight for current word
set updatetime=300

" ==================================================================
" Use C to open coc config
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

call SetupCommandAbbrs('C', 'CocConfig')
" ==================================================================

" ==================================================================
" Select from complete
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" ==================================================================

" ==================================================================
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" ==================================================================

" coc-vimlsp
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]
