function! HelpCommand()
    let nWord = expand("<cword>")
    echo nWord
    execute "!cmake --help-command " . nWord
endfunction

if expand('%:t') == 'CMakeLists.txt'
    set dictionary+=~/.vim/dictionary/cmake.txt
    nnoremap <F2> :call HelpCommand()<CR>
endif

if expand('%:e') == 'cu'
    set dictionary+=~/.vim/dictionary/cuda.txt
endif
