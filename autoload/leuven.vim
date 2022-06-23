" palette {{{
let g:leuven#palette = {}
let g:leuven#palette.fg = ['#333333', ]

let g:leuven#palette.bg = ['#FFFFFF', ]

" cyan
" green
" orange

" }}}

" ansi {{{
" }}}

func! leuven#should_abort(...)
    if ! exists('g:colors_name') || g:colors_name !=# 'leuven'
        return 1
    elseif a:0 > 0 && (! exists('b:current_syntax') || index(a:000, b:current_syntax) == -1)
        return 1
    endif
    return 0
endfunction

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:


