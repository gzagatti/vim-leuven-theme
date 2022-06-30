let g:leuven#palette = {}

" ansi {{{
let g:leuven#palette.ansi = [
  \ '#ffffff',
  \ '#cd0000',
  \ '#0fb300',
  \ '#ffcc33',
  \ '#0000ee',
  \ '#cd00cd',
  \ '#00bfff',
  \ '#ffffff',
  \ '#000000',
  \ '#ffe6e4',
  \ '#ccffcc',
  \ '#fff68f',
  \ '#0000ff',
  \ '#ffe4ff',
  \ '#00cdcd',
  \ '#666666',
\ ]
"}}}

" palette {{{
let g:leuven#palette.fg = ['#333333', 51]
let g:leuven#palette.bg = ['#f8fbf8', 256]

let g:leuven#palette.comment = ['#8D8D84', 15]

let g:leuven#palette.black_fg = [g:leuven#palette.ansi[0], 0]
let g:leuven#palette.black_bg = [g:leuven#palette.ansi[8], 8]

let g:leuven#palette.red_fg = [g:leuven#palette.ansi[1], 1]
let g:leuven#palette.red_bg = [g:leuven#palette.ansi[9], 9]

let g:leuven#palette.green_fg = ['#008000', 2]
let g:leuven#palette.green_bg = [g:leuven#palette.ansi[10], 10]

let g:leuven#palette.yellow_fg = [g:leuven#palette.ansi[3], 3]
let g:leuven#palette.yellow_bg = [g:leuven#palette.ansi[11], 11]

let g:leuven#palette.blue_fg = [g:leuven#palette.ansi[4], 4]
let g:leuven#palette.blue_bg = [g:leuven#palette.ansi[12], 12]

let g:leuven#palette.magenta_fg = [g:leuven#palette.ansi[5], 5]
let g:leuven#palette.magenta_bg = [g:leuven#palette.ansi[13], 13]

let g:leuven#palette.cyan_fg = [g:leuven#palette.ansi[6], 6]
let g:leuven#palette.cyan_bg = [g:leuven#palette.ansi[14], 14]

let g:leuven#palette.white_fg = [g:leuven#palette.ansi[7], 7]
let g:leuven#palette.white_bg = [g:leuven#palette.ansi[15], 15]
" }}}

func! leuven#should_abort(...)
    if ! exists('g:colors_name') || g:colors_name !=# 'leuven'
      return 1
    elseif a:0 > 0 
          \ && (! exists('b:current_syntax') || index(a:000, b:current_syntax) == -1) 
          \ && index(a:000, &filetype) == -1
      return 1
    endif
    return 0
endfunction

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
