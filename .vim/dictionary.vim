if expand('%:t') == 'CMakeLists.txt'
    set dictionary+=~/.vim/dictionary/cmake.txt

    iabbrev app list(APPEND 
    iabbrev for foreach( 
    iabbrev mac macro( 
    iabbrev fun function( 
endif