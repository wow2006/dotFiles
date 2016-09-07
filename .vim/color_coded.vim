" Disable color_coded in diff mode
let g:color_coded_enabled = 1
if &diff
    let g:color_coded_enabled = 0
endif
