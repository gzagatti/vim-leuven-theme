" leuven --- the awesome Emacs color theme on white background

scriptencoding utf8

if v:version > 580
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'leuven'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" palette {{{


" }}}

" highlight groups {{{
" }}}
"

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
