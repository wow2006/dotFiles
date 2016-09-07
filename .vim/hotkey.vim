" YouCompleteMe
" Calling this command will force YCM to immediately recompile your file and
" display any new diagnostics it encounters
map <silent> <F3>   :YcmForceCompileAndDiagnostics<CR>
map <silent> <F4>   :YcmCompleter GetDoc<CR>
" GOTO
map <silent> <F5>   :YcmCompleter GoToInclude<CR>
map <silent> <C-F5> :YcmCompleter GoToDeclaration<CR>
map <silent> <S-F5> :YcmCompleter GoToDefinition<CR>
map <silent> <F6>   :YcmCompleter GoTo<CR>

map <silent> <F7>   :YcmCompleter FixIt<CR>
map <silent> <C-F7> :YcmCompleter GetType<CR>
map <silent> <S-F7> :YcmCompleter GetParent<CR>


" NERDTree
map <silent> <C-n> :NERDTreeToggle<CR>

" Clighter
map <silent> <C-r> :call clighter#Rename()<CR>

" DoxygenToolkit
map <silent> <F11> :Dox<CR>
map <silent> <F12> :DoxAuthor<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>

if expand('%:t') == 'CMakeLists.txt'
    " Dictionary
    imap <C-space> <C-x><C-k>
endif
