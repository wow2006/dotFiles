function! Zoom() range
    let src = expand('%:t')
    let g:dst = tempname() . "." . expand('%:e')
    let fs  = &syntax

    execute ":" . a:firstline . "," . a:lastline . "y"
    execute ":vnew"
    execute ":set syntax=" . fs
    execute "normal gg"
    execute "normal p"
    execute "wincmd l"
endfunction

