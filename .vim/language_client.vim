" language server commands
let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
            \ 'cpp': ['clangd'],
            \ 'c': ['clangd'],
            \ }

let g:LanguageClient_rootMarkers = {
            \ 'cpp': ['compile_commands.json', 'build'],
            \ 'c': ['compile_commands.json', 'build'],
            \ }

set omnifunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

