function! CommitCursor()
  :normal ea*/bbi/*
endfunction

function! OpenVimrc()
  :vsplit ~/.config/nvim/init.vim
endfunction

function! SpaceToNewLine()
  :%s/ /\r/g<CR>
endfunction

function! RemoveWinNewLine()
  %s///g<CR>
endfunction

