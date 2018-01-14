if expand('%:t') == 'CMakeLists.txt'
    set dictionary+=~/.vim/dictionary/cmake.txt
endif

if expand('%:e') == 'cu'
    set dictionary+=~/.vim/dictionary/cuda.txt
endif
