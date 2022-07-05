" palette {{{
let g:leuven#palette = {}
let g:leuven#palette.black                  = ['#000000', 16]
let g:leuven#palette.fg                     = ['#333333', 236]
let g:leuven#palette.gray_h1_fg             = ['#3c3c3c', 237]
let g:leuven#palette.gray_dark_fg           = ['#454545', 239]
let g:leuven#palette.gray_whitespace        = ['#636363', 241]
let g:leuven#palette.gray_dark_bg           = ['#686868', 15]
let g:leuven#palette.gray_comment_fg        = ['#8d8d84', 245]
let g:leuven#palette.gray_bg                = ['#a9a9a9', 248]
let g:leuven#palette.gray_light_bg          = ['#f0f0f0', 255]
let g:leuven#palette.red_fg                 = ['#cd0000', 1]
let g:leuven#palette.red_light_fg           = ['#ff8080', 210]
let g:leuven#palette.red_bg                 = ['#ffe6e4', 9]
let g:leuven#palette.green_block_margins_fg = ['#006666', 23]
let g:leuven#palette.green_h3_fg            = ['#005522', 22]
let g:leuven#palette.green_dark_fg          = ['#008000', 28]
let g:leuven#palette.green_fg               = ['#0fb300', 2]
let g:leuven#palette.green_light_fg         = ['#10c200', 40]
let g:leuven#palette.green_h7_fg            = ['#2eae2c', 34]
let g:leuven#palette.green_light_bg         = ['#c0e8c3', 152]
let g:leuven#palette.green_bg               = ['#ccffcc', 10]
let g:leuven#palette.green_h3_bg            = ['#efffef', 194]
let g:leuven#palette.yellow_h4_fg           = ['#ea6300', 166]
let g:leuven#palette.yellow_h8_fg           = ['#fd8008', 208]
let g:leuven#palette.yellow_fg              = ['#ffa500', 3]
let g:leuven#palette.yellow_bg              = ['#fff68f', 11]
let g:leuven#palette.yellow_search_bg       = ['#fff79f', 228]
let g:leuven#palette.yellow_light_bg        = ['#f6fecd', 230]
let g:leuven#palette.blue_h2_fg             = ['#123555', 17]
let g:leuven#palette.blue_block_content_fg  = ['#000088', 18]
let g:leuven#palette.blue_fg                = ['#0000ff', 4]
let g:leuven#palette.blue_on_bg             = ['#335ea8', 25]
let g:leuven#palette.blue_dark_bg           = ['#5974ab', 67]
let g:leuven#palette.blue_light_fg          = ['#006fe0', 32]
let g:leuven#palette.blue_h6_fg             = ['#0077cc', 26]
let g:leuven#palette.blue_on_fg             = ['#85ceeb', 111]
let g:leuven#palette.blue_block_margins_bg  = ['#ddeded', 194]
let g:leuven#palette.blue_bg                = ['#e5f4fb', 12]
let g:leuven#palette.blue_light_bg          = ['#ebf4fe', 255]
let g:leuven#palette.magenta_dark_fg        = ['#6434a3', 55]
let g:leuven#palette.magenta_fg             = ['#ba36a5', 5]
let g:leuven#palette.magenta_h5_fg          = ['#e3258d', 162]
let g:leuven#palette.magenta_bg             = ['#ffe4ff', 13]
let g:leuven#palette.cyan_fg                = ['#21bdff', 6]
let g:leuven#palette.cyan_light_fg          = ['#8ed3ff', 117]
let g:leuven#palette.cyan_bg                = ['#e0ffff', 14]
let g:leuven#palette.white_dark_bg          = ['#f4f4f1', 255]
let g:leuven#palette.bg                     = ['#f8fbf8', 0]
"}}}

" ansi {{{
let g:leuven#terminal_ansi_colors = [
  \ g:leuven#palette.bg,
  \ g:leuven#palette.red_fg,
  \ g:leuven#palette.green_fg,
  \ g:leuven#palette.yellow_fg,
  \ g:leuven#palette.blue_fg,
  \ g:leuven#palette.magenta_fg,
  \ g:leuven#palette.cyan_fg,
  \ g:leuven#palette.fg,
  \ g:leuven#palette.fg,
  \ g:leuven#palette.red_bg,
  \ g:leuven#palette.green_bg,
  \ g:leuven#palette.yellow_bg,
  \ g:leuven#palette.blue_bg,
  \ g:leuven#palette.magenta_bg,
  \ g:leuven#palette.cyan_bg,
  \ g:leuven#palette.gray_dark_bg,
\ ]
"}}}

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
