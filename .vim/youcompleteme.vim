" controls the number of characters the user needs to type before
" identifier-based completion suggestions are triggered.
let g:ycm_min_num_of_chars_for_completion = 2
" this option turns on YCM's diagnostic display features.
let g:ycm_show_diagnostics_ui = 1
" YCM will use the value of this option as the symbol for errors in the Vim
" gutter.
let g:ycm_error_symbol = '>'
" YCM will use the value of this option as the symbol for warnings in the Vim
" gutter.
let g:ycm_warning_symbol = '*'
" YCM will put icons in Vim's gutter on lines that have a diagnostic set.
" Turning this off will also turn off the YcmErrorLine and YcmWarningLine
" highlighting.
let g:ycm_enable_diagnostic_signs = 1
" YCM will highlight regions of text that are related to the diagnostic that
" is present on a line, if any.
let g:ycm_enable_diagnostic_highlighting = 1
" YCM will echo the text of the diagnostic present on the current line when
" you move your cursor to that line
let g:ycm_echo_current_diagnostic = 1
" YCM will show the completion menu even when typing inside comments.
let g:ycm_complete_in_comments = 1
" YCM will show the completion menu even when typing inside strings.
let g:ycm_complete_in_strings = 1
" CM will add the preview string to Vim's completeopt
let g:ycm_add_preview_to_completeopt = 1
" YCM will auto-close the preview window after the user accepts the offered
"completion string.
let g:ycm_autoclose_preview_window_after_completion = 1
" YCM will auto-close the preview window after the user leaves insert mode.
let g:ycm_autoclose_preview_window_after_insertion = 1
" This option controls the key mappings used to select the first completion
" string.
let g:ycm_key_list_select_completion = ['<Down>']
"s option controls the key mappings used to select the previous completion
"string. Invoking any of them repeatedly cycles backwards through the
"completion list.
let g:ycm_key_list_previous_completion = ['<Up>']
" This option controls the key mapping used to invoke the completion menu for
" semantic completion.
let g:ycm_key_invoke_completion = '<C-Space>'
" This option controls the key mapping used to show the full diagnostic text
" when the user's cursor is on the line with the diagnostic. It basically
" calls :YcmShowDetailedDiagnostic.
let g:ycm_key_detailed_diagnostics = '<C>d'
" When this option is set to 1 YCM will ask once per .ycm_extra_conf.py file
" if it is safe to be loaded.
let g:ycm_confirm_extra_conf = 0
" This option controls the character-based triggers for the various semantic
" completion engines.
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.', '::'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
" YCM searches for a .ycm_extra_conf.py file for compilation flags 
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

"
let g:ycm_collect_identifiers_from_tags_files = 1
