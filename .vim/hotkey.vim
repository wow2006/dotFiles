" YouCompleteMe
" Calling this command will force YCM to immediately recompile your file and
" display any new diagnostics it encounters
map <silent> <F3>   :YcmForceCompileAndDiagnostics<CR>
map <silent> <F4>   :YcmCompleter GetDoc<CR>
map <silent> <F5>   :YcmCompleter GoToInclude<CR>
"map <silent> <C-F5> :YcmCompleter GoToDeclaration<CR>
"map <silent> <S-F5>   :YcmCompleter GoTo<CR>
map <silent> <F6> :YcmCompleter GoToDefinition<CR>
map <silent> <F7>   :YcmCompleter FixIt<CR>
"map <silent> <S-F7> :YcmCompleter GetParent<CR>
map <silent> <F8> :YcmCompleter GetType<CR>

map <silent> gn :bn<CR>
map <silent> gp :bp<CR>

" NERDTree
map <silent> <C-n> :NERDTreeToggle<CR>

" Tagbar
nmap <F9> :TagbarToggle<CR>

" DoxygenToolkit
map <silent> <F11> :Dox<CR>
map <silent> <F12> :DoxAuthor<CR>

" Map Custom Dictionary
if expand('%:t') == 'CMakeLists.txt'
    " Dictionary
    imap <C-space> <C-x><C-k>
endif
if expand('%:e') == 'cu'
    " Dictionary
    imap <C-space> <C-x><C-k>
endif

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Fix tab/Index
map <F9> mzgg=G`z
" Neomake bind
map <C-m> :Neomake<CR>
