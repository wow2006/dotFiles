" YouCompleteMe
" Calling this command will force YCM to immediately recompile your file and
" display any new diagnostics it encounters
map <silent> <F5>   :YcmForceCompileAndDiagnostics<CR>
map <silent> <C-F5> :YcmCompleter GoTo<CR>
map <silent> <S-F5> :YcmCompleter FixIt<CR>
map <silent> <C-H>  :YcmCompleter GetDoc<CR>
"map <silent> <F6>   :YcmCompleter GoToDefinition<CR>
map <silent> <S-F6> :YcmCompleter GoToDeclaration<CR>
map <silent> <C-F6> :YcmCompleter GetType<CR>

" NERDTree
map <silent> <C-n> :NERDTreeToggle<CR>

" Clighter
map <silent> <C-r> :call clighter#Rename()<CR>

" DoxygenToolkit
map <silent> <F6> :Dox<CR>
map <silent> <C-S-A> :DoxAuthor<CR>
