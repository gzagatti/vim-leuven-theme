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
let s:none             = ['NONE', 'NONE']
let s:black            = g:leuven#palette.black
let s:fg               = g:leuven#palette.fg
let s:gray_h1_fg       = g:leuven#palette.gray_h1_fg
let s:gray_dark_fg     = g:leuven#palette.gray_dark_fg
let s:gray_whitespace  = g:leuven#palette.gray_whitespace
let s:gray_dark_bg     = g:leuven#palette.gray_dark_bg
let s:gray_comment_fg  = g:leuven#palette.gray_comment_fg
let s:gray_bg          = g:leuven#palette.gray_bg
let s:gray_light_bg    = g:leuven#palette.gray_light_bg
let s:red_fg           = g:leuven#palette.red_fg
let s:red_light_fg     = g:leuven#palette.red_light_fg
let s:red_bg           = g:leuven#palette.red_bg
let s:green_margins_fg = g:leuven#palette.green_margins_fg
let s:green_h3_fg      = g:leuven#palette.green_h3_fg
let s:green_dark_fg    = g:leuven#palette.green_dark_fg
let s:green_fg         = g:leuven#palette.green_fg
let s:green_light_fg   = g:leuven#palette.green_light_fg
let s:green_h7_fg      = g:leuven#palette.green_h7_fg
let s:green_light_bg   = g:leuven#palette.green_light_bg
let s:green_bg         = g:leuven#palette.green_bg
let s:green_h3_bg      = g:leuven#palette.green_h3_bg
let s:yellow_h4_fg     = g:leuven#palette.yellow_h4_fg
let s:yellow_h8_fg     = g:leuven#palette.yellow_h8_fg
let s:yellow_fg        = g:leuven#palette.yellow_fg
let s:yellow_bg        = g:leuven#palette.yellow_bg
let s:yellow_search_bg = g:leuven#palette.yellow_search_bg
let s:yellow_light_bg  = g:leuven#palette.yellow_light_bg
let s:blue_h2_fg       = g:leuven#palette.blue_h2_fg
let s:blue_content_fg  = g:leuven#palette.blue_content_fg
let s:blue_fg          = g:leuven#palette.blue_fg
let s:blue_on_bg       = g:leuven#palette.blue_on_bg
let s:blue_dark_bg     = g:leuven#palette.blue_dark_bg
let s:blue_light_fg    = g:leuven#palette.blue_light_fg
let s:blue_h6_fg       = g:leuven#palette.blue_h6_fg
let s:blue_on_fg       = g:leuven#palette.blue_on_fg
let s:blue_margins_bg  = g:leuven#palette.blue_margins_bg
let s:blue_bg          = g:leuven#palette.blue_bg
let s:blue_light_bg    = g:leuven#palette.blue_light_bg
let s:magenta_dark_fg  = g:leuven#palette.magenta_dark_fg
let s:magenta_fg       = g:leuven#palette.magenta_fg
let s:magenta_h5_fg    = g:leuven#palette.magenta_h5_fg
let s:magenta_bg       = g:leuven#palette.magenta_bg
let s:cyan_fg          = g:leuven#palette.cyan_fg
let s:cyan_light_fg    = g:leuven#palette.cyan_light_fg
let s:cyan_bg          = g:leuven#palette.cyan_bg
let s:white_dark_bg    = g:leuven#palette.white_dark_bg
let s:bg               = g:leuven#palette.bg
" }}}

function s:h(hlgroup, fg, ...) "bg, attr_list, special
  let l:fg = copy(a:fg)
  let l:bg = get(a:, 1, ['NONE', 'NONE'])
  let l:attr_list = filter(get(a:, 2, ['NONE']), 'type(v:val) == 1')
  let l:attrs = len(l:attr_list) > 0 ? join(l:attr_list, ',') : 'NONE'
  let l:special = get(a:, 3, ['NONE', 'NONE'])

  let l:hl_string = [
    \ 'highlight', a:hlgroup,
    \ 'guifg=' . l:fg[0], 'ctermfg=' . l:fg[1],
    \ 'guibg=' . l:bg[0], 'ctermbg=' . l:bg[1],
    \ 'gui=' . l:attrs, 'cterm=' . l:attrs,
    \ 'guisp=' . l:special[0],
  \]
  execute join(l:hl_string, ' ')
endfunction

" highlight groups {{{
call s:h('LeuvenFg'                      , s:fg                                                                             )

call s:h('LeuvenWhiteSpace'              , s:gray_whitespace                                                                )

call s:h('LeuvenSubtle'                  , s:blue_content_fg        , s:white_dark_bg                                       )
call s:h('LeuvenSubtleBg'                , s:none                   , s:white_dark_bg                                       )

" lualine will not pickup the color from cterm even when it should, so we
" modify the hex color accordingly
call s:h('LeuvenComment'                 , s:gray_comment_fg                                                                )
if !(has('termguicolors') && &termguicolors)
call s:h('LeuvenInvertedComment'         , ['#eeeeee', 0]           , s:gray_comment_fg                                     )
else
call s:h('LeuvenInvertedComment'         , s:bg                     , s:gray_comment_fg                                     )
endif

call s:h('LeuvenMagenta'                 , s:magenta_fg                                                                     )
call s:h('LeuvenGreen'                   , s:green_fg                                                                       )
call s:h('LeuvenBlue'                    , s:blue_fg                                                                        )
call s:h('LeuvenRed'                     , s:red_fg                                                                         )
call s:h('LeuvenYellow'                  , s:yellow_fg                                                                      )

call s:h('LeuvenLightRed'                , s:red_light_fg                                                                   )
call s:h('LeuvenLightGreen'              , s:green_light_fg                                                                 )
call s:h('LeuvenLightBlue'               , s:blue_light_fg                                                                  )

call s:h('LeuvenDarkMagenta'             , s:magenta_dark_fg                                                                )
call s:h('LeuvenDarkGreen'               , s:green_dark_fg                                                                  )
call s:h('LeuvenDarkBlue'                , s:blue_fg                                                                        )
call s:h('LeuvenDarkGray'                , s:gray_dark_fg                                                                   )

call s:h('LeuvenLiveRedHighlight'        , s:red_fg                 , s:red_bg                                              )
call s:h('LeuvenLiveYellowHighlight'     , s:yellow_fg              , s:yellow_light_bg                                     )
call s:h('LeuvenLiveGreenHighlight'      , s:green_light_fg         , s:green_bg                                            )
call s:h('LeuvenLiveBlueHighlight'       , s:blue_h2_fg             , s:blue_bg                                             )
call s:h('LeuvenLiveMagentaHighlight'    , s:magenta_fg             , s:magenta_bg                                          )

call s:h('LeuvenLiveDarkGreenHighlight'  , s:green_dark_fg          , s:green_bg                                            )
call s:h('LeuvenLiveLightRedHighlight'   , s:red_light_fg           , s:red_bg                                              )
call s:h('LeuvenLiveLightGreenHighlight' , s:green_fg               , s:green_h3_bg, ['bold']                               )

call s:h('LeuvenYellowBgBold'            , s:none                   , s:yellow_light_bg , ['bold']                          )
call s:h('LeuvenGreenBg'                 , s:none                   , s:green_bg                                            )
call s:h('LeuvenCyanBg'                  , s:none                   , s:cyan_fg                                             )
call s:h('LeuvenGrayBg'                  , s:bg                     , s:gray_bg                                             )

call s:h('LeuvenLightGreenBg'            , s:none                   , s:green_light_bg                                      )
call s:h('LeuvenLightBlueBg'             , s:none                   , s:blue_light_bg                                       )
call s:h('LeuvenLightCyanBg'             , s:none                   , s:cyan_light_fg                                       )

call s:h('LeuvenLightBlueUnderline'      , s:blue_light_fg          , s:none            , ['underline'] , s:blue_light_fg   )
call s:h('LeuvenLightBlueBgUnderline'    , s:blue_light_fg          , s:bg              , ['underline'] , s:blue_light_fg   )
call s:h('LeuvenDarkBlueBgUnderline'     , s:bg                     , s:blue_dark_bg    , ['underline']                     )
call s:h('LeuvenDarkBlueBg'              , s:bg                     , s:blue_dark_bg                                        )
call s:h('LeuvenDarkGrayBg'              , s:bg                     , s:gray_dark_bg                                        )

call s:h('LeuvenUndercurlRed'            , s:none                   , s:none            , ['undercurl'] , s:red_light_fg    )
call s:h('LeuvenUndercurlYellow'         , s:none                   , s:none            , ['undercurl'] , s:yellow_fg       )
call s:h('LeuvenUndercurlGreen'          , s:none                   , s:none            , ['undercurl'] , s:green_light_fg  )
call s:h('LeuvenUndercurlComment'        , s:none                   , s:none            , ['undercurl'] , s:gray_comment_fg )

call s:h('LeuvenMutedYellowHighlight'    , s:gray_comment_fg        , s:yellow_bg                                           )
call s:h('LeuvenMutedGrayHighlight'      , s:gray_comment_fg        , s:gray_light_bg                                       )

call s:h('LeuvenBlueonDarkGray'          , s:blue_on_fg             , s:gray_dark_fg                                        )
call s:h('LeuvenBlueonBlue'              , s:blue_on_fg             , s:blue_on_bg                                          )
call s:h('LeuvenWhiteBoldonBlue'         , s:bg                     , s:blue_on_bg      , ['bold']                          )
call s:h('LeuvenBlackonYellow'           , s:black                  , s:yellow_search_bg                                    )

call s:h('LeuvenHead1'                   , s:gray_h1_fg             , s:gray_light_bg   , ['bold'       , 'underline']      )
call s:h('LeuvenHead2'                   , s:blue_h2_fg             , s:blue_bg         , ['bold'       , 'underline']      )
call s:h('LeuvenHead3'                   , s:green_h3_fg            , s:green_h3_bg     , ['bold'       , 'underline']      )
call s:h('LeuvenHead4'                   , s:yellow_h4_fg           , s:bg              , ['bold']                          )
call s:h('LeuvenHead5'                   , s:magenta_h5_fg          , s:bg              , ['bold']                          )
call s:h('LeuvenHead6'                   , s:blue_h6_fg             , s:bg              , ['bold']                          )
call s:h('LeuvenHead7'                   , s:green_h7_fg            , s:bg              , ['bold']                          )
call s:h('LeuvenHead8'                   , s:yellow_h8_fg           , s:bg              , ['bold']                          )

if g:leuven_original == 1
call s:h('LeuvenBlockMargins'            , s:green_margins_fg       , s:blue_margins_bg , ['underline']                     )
call s:h('LeuvenBlockContent'            , s:blue_content_fg        , s:bg              , ['nocombine', 'NONE']             )
else
call s:h('LeuvenBlockMargins'            , s:green_margins_fg       , s:blue_margins_bg ,                                   )
call s:h('LeuvenBlockContent'            , s:blue_content_fg        , s:bg              ,                                   )
endif
" }}}

" user interface {{{
set background=light

" required as some plugins will overwrite
call s:h('Normal'                       , s:fg                     , (has('termguicolors') && &termguicolors) ? s:bg : s:none) " normal text
call s:h('WildMenu'                     , s:fg                     , s:magenta_bg, ['bold']                                  ) " current match in 'wildmenu' completion

" status and tab lines
hi! link  StatusLine                LeuvenWhiteBoldonBlue       " status line of current window
hi! link  StatusLineNc              LeuvenGrayBg                " status lines of non-current windows.
hi! link  Tabline                   LeuvenBlueonBlue            " not active tab page label
hi! link  TablineFill               LeuvenBlueonDarkGray        " where there are no labels
hi! link  TabLineSel                LeuvenWhiteBoldonBlue       " active tab page label

" normal
hi! link  NormalFloat               LeuvenSubtle                " normal text in floating windows.
hi! link  NormalNC                  Normal                      " normal text in in non-current windows.

" cursors
hi! link  Cursor                    LeuvenCyanBg                " character under the cursor
hi! link  iCursor                   Cursor                      " insert cursor
hi! link  lCursor                   Cursor                      " character under the cursor when language-mapping is used (see :h guicursor)
hi! link  CursorIM                  Cursor                      " like Cursor, but used when in IME mode, see :h CursorIM
hi! link  TermCursor                Cursor                      " cursor in a focused terminal
hi! clear TermCursorNC                                          " cursor in unfocused terminal
hi! link  CursorLine                LeuvenGreenBg               " screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set
hi! link  CursorColumn              LeuvenGreenBg               " screen-column at the cursor, when 'cursorcolumn' is set.
hi! link  CursorLineNr              LeuvenLiveGreenHighlight    " like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.

"visual
hi! link  Visual                    LeuvenLightCyanBg           " visual mode selection

" side columns
hi! link  LineNr                    LeuvenComment               " line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
hi! link  EndOfBuffer               LeuvenComment               " filler lines (~) after the end of the buffer. By default, this is highlighted like hl-NonText.
hi! link  FoldColumn                LeuvenSubtleBg              " 'foldcolumn'
hi! link  SignColumn                LeuvenSubtleBg              " column where signs are displayed

" diff node, see :h diff.txt
hi! link  DiffChange                LeuvenInvertedComment       " changed line
hi! link  DiffAdd                   LeuvenLiveGreenHighlight    " added line
hi! link  DiffDelete                LeuvenLiveLightRedHighlight " deleted line
hi! link  DiffText                  LeuvenLiveYellowHighlight   " changed text within a changed line

" msg
hi! link  ErrorMsg                  LeuvenLiveRedHighlight      " error messages on the command line
hi! link  WarningMsg                LeuvenLiveYellowHighlight   " warning messages

" splits
hi! link  Winseparator              LeuvenDarkGray              " separator between window splits, inherts from hl-VertSplit by default.
hi! link  VertSplit                 LeuvenDarkGray              " column separating vertically split windows

" fold
hi! link  Folded                    LeuvenSubtleBg              " line used for closed folds

" search
hi! link  IncSearch                 LeuvenDarkBlueBgUnderline   " 'incsearch' highlighting; also used for the text replaced with ":s///c"
hi! link  Search                    LeuvenBlackonYellow         " last search pattern highlighting (see 'hlsearch'). Also used for similar
                                                                " items that need to stand out.
hi! link  MatchParen                LeuvenLightGreenBg          " character under the cursor or just before it, if it is a paired bracket, and
                                                                " its match, see :h pi_paren.txt.

" popup menu
hi! link  Pmenu                     LeuvenLightBlueBg           " normal item.
hi! link  PmenuSel                  LeuvenDarkBlueBg            " selected item
hi! link  PmenuThumb                LeuvenDarkGrayBg            " thumb of the scrollbar.
hi! link  PmenuSbar                 LeuvenGrayBg                " scrollbar

" spell, see :h spell
hi! link  SpellBad                  LeuvenUndercurlRed          " word that is not recognized by the spellchecker.
hi! link  SpellCap                  LeuvenUndercurlComment      " word that should start with a capital.
hi! link  SpellLocal                LeuvenUndercurlComment      " word that recognized by the spellchecker as one used in another region.
hi! link  SpellRare                 LeuvenundercurlComment      " word that is recognized by the spellchecker as one that is hardly ever used.

" vim
hi! link  SpecialKey                LeuvenLiveLightRedHighlight
hi! link  Directory                 LeuvenLightBlue             " directory names (and other special names in listings)
hi! link  Title                     Preproc                     " titles for output from ":set all", ":autocmd" etc.
hi! link  MoreMsg                   LeuvenLiveGreenHighlight    " see :h more-prompt
hi! link  VisualNOS                 Visual                      " visual mode selection when vim is "Not Owning the Selection".
hi! link  Whitespace                LeuvenWhiteSpace            " nbsp, space, tab and trail in 'listchars'
hi! link  Question                  LeuvenFg                    " see :h hit-enter prompt and yes/no questions
hi! link  ColorColumn               LeuvenYellowBgBold          " columns set with 'colorcolumn'
hi! link  ModeMsg                   LeuvenFg                    " 'showmode' message (e.g., "-- INSERT -- ")
hi! link  MsgArea                   LeuvenFg                    " area for messages and cmdline
hi! link  MsgSeparator              LeuvenBlueonDarkGray
hi! link  NonText                   LeuvenComment               " see :h hl-EndOfBuffer.

" common vim syntax groups used for all kinds of code and markup;
" fallback groups are denoted with (*).
" see :h group-name
hi! link  Comment                   LeuvenComment               " any comment

hi! link  String                    LeuvenDarkGreen             " a string constant: "this is a string"
hi! link  Character                 LeuvenLiveGreenHighlight    " a character constant: 'c', '\n'
hi! link  Number                    LeuvenFg                    " a number constant: 234, 0xff
hi! link  Float                     LeuvenFg                    " a floating point constant: 2.3e10

hi! link  Constant                  LeuvenLiveMagentaHighlight  " any constant

hi! link  Boolean                   Constant                    " a boolean constant: TRUE, false

hi! link  Identifier                LeuvenMagenta               " any variable name

hi! link  Function                  LeuvenLightBlue             " function name (also: method for classes)

hi! link  Statement                 LeuvenDarkBlue              " (*) any statement
hi! link  Keyword                   Statement                   " any other keyword
hi! link  Conditional               Statement                   " if, then, else, endif, switch, etc.
hi! link  Repeat                    Statement                   " for, do, while, etc.
hi! link  Operator                  Statement                   " sizeof", "+", "*", etc.
hi! link  Exception                 Statement                   " try, catch, throw

hi! link  Label                     LeuvenMutedYellowHighlight  " case, default, etc.
hi! link  Tag                       Label                       " you can use CTRL-] on this
hi! link  Underlined                LeuvenLightBlueUnderline    " text that stands out, HTML links

hi! link  Preproc                   LeuvenLiveBlueHighlight     " (*) generic preprocessor

hi! link  Type                      LeuvenFg                    " (*) int, long, char, etc.

hi! link  Special                   LeuvenFg                    " (*) any special symbol

hi! link  Error                     LeuvenLiveLightRedHighlight " any erroneous construct
hi! link  Todo                      LeuvenLiveLightRedHighlight " anything that needs extra attention;
                                                                " mostly the keywords TODO FIXME and XXX

" see :h diagnostic-highlights
hi! link  DiagnosticError           LeuvenLightRed              " base highlight group.
                                                                " other diagnostic highlights link to this
                                                                " by default (except Underline)
hi! link  DiagnosticWarn            LeuvenYellow                " base highlight group.
                                                                " other diagnostic highlights link to this
                                                                " by default (except Underline)
hi! link  DiagnosticInfo            None                        " base highlight group.
                                                                " other diagnostic highlights link to this
                                                                " by default (except Underline)
hi! link  DiagnosticHint            None                        " base highlight group.
                                                                " other diagnostic highlights link to this
                                                                " by default (except Underline)
hi! link  DiagnosticVirtualTextInfo LeuvenComment               " used for "Info" diagnostic virtual text.
hi! link  DiagnosticVirtualTextHint LeuvenComment               " used for "Hint" diagnostic virtual text.
hi! link  DiagnosticUnderlineError  LeuvenUndercurlRed          " used to underline "Error" diagnostics.
hi! link  DiagnosticUnderlineWarn   LeuvenUndercurlYellow       " used to underline "Warn" diagnostics.
hi! link  DiagnosticUnderlineInfo   LeuvenUndercurlComment      " used to underline "Info" diagnostics.
hi! link  DiagnosticUnderlineHint   LeuvenUndercurlComment      " used to underline "Hint" diagnostics.
hi! link  DiagnosticFloatingError   LeuvenLiveLightRedHighlight " used to color "Error" diagnostic messages in diagnostics float.
hi! link  DiagnosticFloatingWarn    LeuvenLiveYellowHighlight   " used to color "Warn" diagnostic messages in diagnostics float.
hi! link  DiagnosticFloatingInfo    LeuvenGrayBg                " used to color "Info" diagnostic messages in diagnostics float.
hi! link  DiagnosticFloatingHint    LeuvenGrayBg                " used to color "Hint" diagnostic messages in diagnostics float.
hi! link  DiagnosticSignInfo        LeuvenComment               " used for "Info" signs in sign column.
hi! link  DiagnosticSignHint        LeuvenComment               " used for "Hint" signs in sign column.
" }}}

" ansi {{{
if has('nvim')
  for s:i in range(16)
    let g_terminal_color_{s:i} = g:leuven#terminal_ansi_colors[s:i]
  endfor
endif
if has('terminal')
  let g:terminal_ansi_colors = g:leuven#terminal_ansi_colors
endif
" }}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
