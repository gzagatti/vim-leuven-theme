" leuven --- the awesome Emacs color theme on white background

scriptencoding utf8

if v:version > 580
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'leuven'

"palette {{{
let s:none                   = ['NONE', 'NONE']
let s:black                  = g:leuven#palette.black
let s:fg                     = g:leuven#palette.fg
let s:gray_h1_fg             = g:leuven#palette.gray_h1_fg
let s:gray_dark_fg           = g:leuven#palette.gray_dark_fg
let s:gray_whitespace        = g:leuven#palette.gray_whitespace
let s:gray_dark_bg           = g:leuven#palette.gray_dark_bg
let s:gray_comment_fg        = g:leuven#palette.gray_comment_fg
let s:gray_bg                = g:leuven#palette.gray_bg
let s:gray_light_bg          = g:leuven#palette.gray_light_bg
let s:red_fg                 = g:leuven#palette.red_fg
let s:red_light_fg           = g:leuven#palette.red_light_fg
let s:red_bg                 = g:leuven#palette.red_bg
let s:green_block_margins_fg = g:leuven#palette.green_block_margins_fg
let s:green_h3_fg            = g:leuven#palette.green_h3_fg
let s:green_dark_fg          = g:leuven#palette.green_dark_fg
let s:green_fg               = g:leuven#palette.green_fg
let s:green_light_fg         = g:leuven#palette.green_light_fg
let s:green_h7_fg            = g:leuven#palette.green_h7_fg
let s:green_light_bg         = g:leuven#palette.green_light_bg
let s:green_bg               = g:leuven#palette.green_bg
let s:green_h3_bg            = g:leuven#palette.green_h3_bg
let s:yellow_h4_fg           = g:leuven#palette.yellow_h4_fg
let s:yellow_h8_fg           = g:leuven#palette.yellow_h8_fg
let s:yellow_fg              = g:leuven#palette.yellow_fg
let s:yellow_bg              = g:leuven#palette.yellow_bg
let s:yellow_search_bg       = g:leuven#palette.yellow_search_bg
let s:yellow_light_bg        = g:leuven#palette.yellow_light_bg
let s:blue_h1_fg             = g:leuven#palette.blue_h1_fg
let s:blue_block_content_fg  = g:leuven#palette.blue_block_content_fg
let s:blue_fg                = g:leuven#palette.blue_fg
let s:blue_on_bg             = g:leuven#palette.blue_on_bg
let s:blue_dark_bg           = g:leuven#palette.blue_dark_bg
let s:blue_light_fg          = g:leuven#palette.blue_light_fg
let s:blue_h6_fg             = g:leuven#palette.blue_h6_fg
let s:blue_on_fg             = g:leuven#palette.blue_on_fg
let s:blue_block_margins_bg  = g:leuven#palette.blue_block_margins_bg
let s:blue_bg                = g:leuven#palette.blue_bg
let s:blue_light_bg          = g:leuven#palette.blue_light_bg
let s:magenta_dark_fg        = g:leuven#palette.magenta_dark_fg
let s:magenta_fg             = g:leuven#palette.magenta_fg
let s:magenta_h5_fg          = g:leuven#palette.magenta_h5_fg
let s:magenta_bg             = g:leuven#palette.magenta_bg
let s:cyan_fg                = g:leuven#palette.cyan_fg
let s:cyan_light_fg          = g:leuven#palette.cyan_light_fg
let s:cyan_bg                = g:leuven#palette.cyan_bg
let s:white_dark_bg          = g:leuven#palette.white_dark_bg
let s:bg                     = g:leuven#palette.bg
"}}}

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

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
  call s:h('LeuvenFg', s:fg)

  call s:h('LeuvenWhiteSpace', s:gray_whitespace)

  call s:h('LeuvenSubtle', s:blue_block_content_fg, s:white_dark_bg)
  call s:h('LeuvenSubtleBg', s:none, s:white_dark_bg)

  call s:h('LeuvenComment', s:gray_comment_fg)
  call s:h('LeuvenInvertedComment', s:bg, s:gray_comment_fg)

  call s:h('LeuvenMagenta', s:magenta_fg)
  call s:h('LeuvenGreen', s:green_fg)
  call s:h('LeuvenBlue', s:blue_fg)
  call s:h('LeuvenRed', s:red_fg)
  call s:h('LeuvenYellow', s:yellow_fg)

  call s:h('LeuvenLightRed', s:red_light_fg)
  call s:h('LeuvenLightGreen', s:green_light_fg)
  call s:h('LeuvenLightBlue', s:blue_light_fg)

  call s:h('LeuvenDarkMagenta', s:magenta_dark_fg)
  call s:h('LeuvenDarkGreen', s:green_dark_fg)
  call s:h('LeuvenDarkBlue', s:blue_fg)
  call s:h('LeuvenDarkGray', s:gray_dark_fg)

  call s:h('LeuvenLiveRedHighlight', s:red_fg, s:red_bg)
  call s:h('LeuvenLiveYellowHighlight', s:yellow_fg, s:yellow_light_bg)
  call s:h('LeuvenLiveGreenHighlight', s:green_light_fg, s:green_bg)
  call s:h('LeuvenLiveBlueHighlight', s:blue_h1_fg, s:blue_bg)
  call s:h('LeuvenLiveMagentaHighlight', s:magenta_fg, s:magenta_bg)

  call s:h('LeuvenLiveDarkGreenHighlight', s:green_dark_fg, s:green_bg)
  call s:h('LeuvenLiveLightRedHighlight', s:red_light_fg, s:red_bg)

  call s:h('LeuvenYellowBgBold', s:none, s:yellow_light_bg, ['bold'])
  call s:h('LeuvenGreenBg', s:none, s:green_bg)
  call s:h('LeuvenCyanBg', s:none, s:cyan_fg)
  call s:h('LeuvenGrayBg', s:bg, s:gray_bg)

  call s:h('LeuvenLightGreenBg', s:none, s:green_light_bg)
  call s:h('LeuvenLightBlueBg', s:none, s:blue_light_bg)
  call s:h('LeuvenLightCyanBg', s:none, s:cyan_light_fg)

  call s:h('LeuvenDarkBlueBgUnderline', s:bg, s:blue_dark_bg, ['underline'])
  call s:h('LeuvenDarkBlueBg', s:bg, s:blue_dark_bg)
  call s:h('LeuvenDarkGrayBg', s:bg,s:gray_dark_bg)

  call s:h('LeuvenUndercurlRed', s:none, s:none, ['undercurl'], s:red_light_fg)
  call s:h('LeuvenUndercurlYellow', s:none, s:none, ['undercurl'], s:yellow_fg)
  call s:h('LeuvenUndercurlGreen', s:none, s:none, ['undercurl'], s:green_light_fg)
  call s:h('LeuvenUndercurlComment', s:none, s:none, ['undercurl'], s:gray_comment_fg)

  call s:h('LeuvenMutedYellowHighlight', s:gray_comment_fg, s:yellow_bg)
  call s:h('LeuvenMutedGrayHighlight', s:gray_comment_fg, s:gray_light_bg)

  call s:h('LeuvenBlueonDarkGray', s:blue_on_fg, s:gray_dark_fg)
  call s:h('LeuvenBlueonBlue', s:blue_on_fg, s:blue_on_bg)
  call s:h('LeuvenWhiteBoldonBlue',s:bg, s:blue_on_bg, ['bold'])
  call s:h('LeuvenBlackonYellow',s:black, s:yellow_search_bg)

  call s:h('LeuvenHead1',s:gray_h1_fg, s:gray_light_bg, ['bold', 'underline'])
  call s:h('LeuvenHead2', s:blue_h1_fg, s:blue_bg, ['bold', 'underline'])
  call s:h('LeuvenHead3', s:green_h3_fg, s:green_h3_bg, ['bold', 'underline'])
  call s:h('LeuvenHead4', s:yellow_h4_fg, s:bg, ['bold'])
  call s:h('LeuvenHead5', s:magenta_h5_fg, s:bg, ['bold'])
  call s:h('LeuvenHead6', s:blue_h6_fg, s:bg, ['bold'])
  call s:h('LeuvenHead7', s:green_h7_fg, s:bg, ['bold'])
  call s:h('LeuvenHead8', s:yellow_h8_fg, s:bg, ['bold'])

  call s:h('LeuvenBlockMargins', s:green_block_margins_fg, s:blue_block_margins_bg)
  call s:h('LeuvenBlockContent', s:blue_block_content_fg, s:bg)
"}}}

" user interface {{{
  set background=light

  " required as some plugins will overwrite
  call s:h('Normal', s:fg, has('gui_running') ? s:bg : s:none) "normal text
  call s:h('WildMenu', s:fg, s:magenta_bg, ['bold']) "current match in 'wildmenu' completion

  "status and tab lines
  hi! link StatusLine LeuvenWhiteBoldonBlue
  hi! link StatusLineNc LeuvenGrayBg "status lines of non-current windows.
  hi! link Tabline LeuvenBlueonBlue "not active tab page label
  hi! link TablineFill LeuvenBlueonDarkGray "where there are no labels
  hi! link TabLineSel LeuvenWhiteBoldonBlue "active tab page label

  " normal
  hi! link NormalFloat LeuvenSubtle "normal text in floating windows.
  hi! link NormalNC Normal "normal text in in non-current windows.

  " cursors
  hi! link Cursor LeuvenCyanBg "character under the cursor
  hi! link iCursor Cursor "insert cursor
  hi! link lCursor Cursor "character under the cursor when |language-mapping| is used (see 'guicursor')"
  hi! link CursorIM Cursor "like Cursor, but used when in IME mode |CursorIM|
  hi! link TermCursor Cursor "cursor in a focused terminal
  hi! clear TermCursorNC "cursor in unfocused terminal

  hi! link CursorLine LeuvenGreenBg "screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set
  hi! link CursorColumn LeuvenGreenBg "screen-column at the cursor, when 'cursorcolumn' is set.
  hi! link CursorLineNr LeuvenLiveGreenHighlight "like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.

  hi! link Visual LeuvenLightCyanBg "visual mode selection

  " support columns
  hi! link LineNr LeuvenComment "line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
  hi! link EndOfBuffer LeuvenComment "filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
  hi! link FoldColumn LeuvenSubtleBg "'foldcolumn'
  hi! link SignColumn LeuvenSubtleBg "column where |signs| are displayed

  " special
  hi! link Directory LeuvenLightBlue "directory names (and other special names in listings)

  " diff node
  hi! link DiffChange LeuvenInvertedComment "changed line
  hi! link DiffAdd LeuvenLiveGreenHighlight "added line |diff.txt|
  hi! link DiffDelete LeuvenLiveLightRedHighlight "deleted line |diff.txt|
  hi! link DiffText LeuvenLiveYellowHighlight "changed text within a changed line |diff.txt|

  " msg
  hi! link ErrorMsg LeuvenLiveRedHighlight "error messages on the command line
  hi! link WarningMsg LeuvenLiveYellowHighlight "warning messages

  " split
  hi! link VertSplit LeuvenDarkGray "column separating vertically split windows
  hi! link Winseparator LeuvenDarkGray "separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.

  " fold
  hi! link Folded LeuvenSubtleBg "line used for closed folds

  " search
  hi! link IncSearch LeuvenDarkBlueBgUnderline " 'incsearch' highlighting; also used for the text replaced with ":s///c"
  hi! link Search LeuvenBlackonYellow "last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
  hi! link MatchParen LeuvenLightGreenBg "character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|

  " popup menu
  hi! link Pmenu LeuvenLightBlueBg "normal item.
  hi! link PmenuSel LeuvenDarkBlueBg "selected item
  hi! link PmenuThumb LeuvenDarkGrayBg "thumb of the scrollbar.
  hi! link PmenuSbar LeuvenGrayBg "scrollbar

  hi! link SpecialKey LeuvenLiveLightRedHighlight

  " spell
  hi! link SpellBad LeuvenUndercurlRed "word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
  hi! link SpellCap LeuvenUndercurlComment "word that should start with a capital. |spell| Combined with the highlighting used otherwise.
  hi! link SpellLocal LeuvenUndercurlComment "word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
  hi! link SpellRare LeuvenundercurlComment "word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.

  " vim
  hi! link Title Preproc "titles for output from ":set all", ":autocmd" etc.
  hi! link MoreMsg LeuvenLiveGreenHighlight "|more-prompt|

  hi! link VisualNOS Visual "visual mode selection when vim is "Not Owning the Selection".

  hi! link Whitespace LeuvenWhiteSpace "nbsp, space, tab and trail in 'listchars'

  hi! link Question LeuvenFg "|hit-enter| prompt and yes/no questions
  "" QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.

  hi! link ColorColumn LeuvenYellowBgBold "columns set with 'colorcolumn'
  "" Conceal      { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')

  hi! link ModeMsg LeuvenFg "'showmode' message (e.g., "-- INSERT -- ")
  hi! link MsgArea LeuvenFg "area for messages and cmdline
  hi! link MsgSeparator LeuvenBlueonDarkGray
  hi! link NonText LeuvenComment "'@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.

  "" Common vim syntax groups used for all kinds of code and markup.
  "" Commented-out groups should chain up to their preferred (*) group
  "" by default.
  ""
  "" See :h group-name
  ""
  "" Uncomment and edit if you want more specific syntax highlighting.

  hi! link Comment LeuvenComment "any comment

  hi! link String LeuvenDarkGreen "a string constant: "this is a string"
  hi! link Character LeuvenLiveGreenHighlight "a character constant: 'c', '\n'
  hi! link Number LeuvenFg "a number constant: 234, 0xff
  hi! link Float LeuvenFg "a floating point constant: 2.3e10

  hi! link Constant LeuvenLiveMagentaHighlight "any constant
  hi! link Boolean Constant "a boolean constant: TRUE, false

  hi! link Identifier LeuvenMagenta "any variable name
  hi! link Function LeuvenLightBlue "function name (also: method for classes)

  hi! link Statement LeuvenDarkBlue "(*) any statement
  hi! link Keyword Statement "any other keyword
  hi! link Conditional Statement "if, then, else, endif, switch, etc.
  hi! link Repeat Statement "for, do, while, etc.
  hi! link Operator Statement "sizeof", "+", "*", etc.
  hi! link Exception Statement "try, catch, throw

  hi! link Label LeuvenMutedYellowHighlight "case, default, etc.
  hi! link Tag Label "you can use CTRL-] on this

  hi! link Preproc LeuvenLiveBlueHighlight "(*) generic preprocessor
  "" Include        { }, --   Preprocessor #include
  "" Define         { }, --   Preprocessor #define
  "" Macro          { }, --   Same as Define
  "" PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

  hi! link Type LeuvenFg "(*) int, long, char, etc.
  "" StorageClass   { }, --   static, register, volatile, etc.
  "" Structure      { }, --   struct, union, enum, etc.
  "" Typedef        { }, --   A typedef

  hi! link Special LeuvenFg "(*) any special symbol
  "" SpecialChar    { }, --   Special character in a constant
  "" Delimiter      { }, --   Character that needs attention
  "" SpecialComment { }, --   Special things inside a comment (e.g. '\n')
  "" Debug          { }, --   Debugging statements

  "" Underlined     { gui = "underline" }, -- Text that stands out, HTML links
  "" Ignore         { }, -- Left blank, hidden |hl-Ignore|

  hi! link Error LeuvenLiveLightRedHighlight "any erroneous construct
  hi! link Todo LeuvenLiveLightRedHighlight "anything that needs extra attention; mostly the keywords TODO FIXME and XXX

  "" These groups are for the native LSP client and diagnostic system. Some
  "" other LSP clients may use these groups, or use their own. Consult your
  "" LSP client's documentation.

  "" See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
  ""
  " hi! link LspReferenceText LeuvenLightBlueBg "used for highlighting "text" references
  " hi! link LspReferenceRead LeuvenLightBlueBg "used for highlighting "read" references
  " hi! link LspReferenceWrite LeuvenLightBlueBg "used for highlighting "write" references
  " hi! link LspCodeLens LeuvenLightBlueBg " used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
  " hi! link LspCodeLensSeparator LeuvenDarkGray "used to color the separator between two or more code lens.
  " hi! link LspSignatureActiveParameter LeuvenLightBlueBg "used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

  "" See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
  ""
  hi! link DiagnosticError LeuvenLightRed "used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  hi! link DiagnosticWarn  LeuvenYellow "used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  hi! link DiagnosticInfo None "used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  hi! link DiagnosticHint None "used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  " hi! link DiagnosticVirtualTextError LeuvenLightRed "used for "Error" diagnostic virtual text.
  " hi! link DiagnosticVirtualTextWarn LeuvenYellow "used for "Warn" diagnostic virtual text.
  hi! link DiagnosticVirtualTextInfo LeuvenComment "used for "Info" diagnostic virtual text.
  hi! link DiagnosticVirtualTextHint LeuvenComment "used for "Hint" diagnostic virtual text.
  hi! link DiagnosticUnderlineError LeuvenUndercurlRed "used to underline "Error" diagnostics.
  hi! link DiagnosticUnderlineWarn LeuvenUndercurlYellow "used to underline "Warn" diagnostics.
  hi! link DiagnosticUnderlineInfo LeuvenUndercurlComment "used to underline "Info" diagnostics.
  hi! link DiagnosticUnderlineHint LeuvenUndercurlComment "used to underline "Hint" diagnostics.
  hi! link DiagnosticFloatingError LeuvenLiveLightRedHighlight "used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
  hi! link DiagnosticFloatingWarn LeuvenLiveYellowHighlight "used to color "Warn" diagnostic messages in diagnostics float.
  hi! link DiagnosticFloatingInfo LeuvenGrayBg "used to color "Info" diagnostic messages in diagnostics float.
  hi! link DiagnosticFloatingHint LeuvenGrayBg "used to color "Hint" diagnostic messages in diagnostics float.
  " hi! link DiagnosticSignError LeuvenLightRed "used for "Error" signs in sign column.
  " hi! link DiagnosticSignWarn LeuvenYellow "used for "Warn" signs in sign column.
  hi! link DiagnosticSignInfo LeuvenComment "used for "Info" signs in sign column.
  hi! link DiagnosticSignHint LeuvenComment "used for "Hint" signs in sign column.

  "" Tree-Sitter syntax groups. Most link to corresponding
  "" vim syntax groups (e.g. TSKeyword => Keyword) by default.
  ""
  "" See :h nvim-treesitter-highlights, some groups may not be listed, submit a PR fix to lush-template!
  ""
  "" TSAttribute          { } , -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
  "" TSBoolean            { } , -- Boolean literals: `True` and `False` in Python.
  "" TSCharacter          { } , -- Character literals: `'a'` in C.
  "" TSCharacterSpecial   { } , -- Special characters.
  hi! link TSComment Comment "line comments and block comments.
  "" TSConditional        { } , -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
  hi! link TSConstant Constant "constants identifiers
  hi! link TSConstBuiltin Constant "built-in constant values: `nil` in Lua.
  "" TSConstMacro         { } , -- Constants defined by macros: `NULL` in C.
  hi! link TSConstructor LeuvenFg "constructor calls and definitions: `{}` in Lua, and Java constructors.
  "" TSDebug              { } , -- Debugging statements.
  "" TSDefine             { } , -- Preprocessor #define statements.
  "" TSError              { } , -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
  "" TSException          { } , -- Exception related keywords: `try`, `except`, `finally` in Python.
  hi! link TSField LeuvenFg "object and struct fields
  "" TSFloat              { } , -- Floating-point number literals.
  "" TSFunction           { } , -- Function calls and definitions.
  " hi! link TSFuncBuiltin LeuvenLiveBlueHighlight "built-in functions: `print` in Lua.
  "" TSFuncMacro          { } , -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
  "" TSInclude            { } , -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
  hi! link TSKeyword LeuvenDarkBlue "keywords that don't fit into other categories.
  "" TSKeywordFunction    { } , -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
  "" TSKeywordOperator    { } , -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
  "" TSKeywordReturn      { } , -- Keywords like `return` and `yield`.
  hi! link TSLabel Label "GOTO labels: `label:` in C, and `::label::` in Lua.
  "" TSMethod             { } , -- Method calls and definitions.
  hi! link TSNamespace Identifier "identifiers referring to modules and namespaces.
  "" TSNone               { } , -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
  "" TSNumber             { } , -- Numeric literals that don't fit into other categories.
  hi! link TSOperator Operator "binary or unary operators: `+`, and also `->` and `*` in C.
  "" TSParameter          { } , -- Parameters of a function.
  "" TSParameterReference { } , -- References to parameters of a function.
  "" TSPreProc            { } , -- Preprocessor #if, #else, #endif, etc.
  "" TSProperty           { } , -- Same as `TSField`.
  " hi! link TSPunctDelimiter LeuvenFg "punctuation delimiters: Periods, commas, semicolons, etc.
  " hi! link TSPunctBracket LeuvenFg "brackets, braces, parentheses, etc.
  " hi! link TSPunctSpecial LeuvenFg "special punctuation that doesn't fit into the previous categories.
  "" TSRepeat             { } , -- Keywords related to loops: `for`, `while`, etc.
  "" TSStorageClass       { } , -- Keywords that affect how a variable is stored: `static`, `comptime`, `extern`, etc.
  hi! link TSString String "string literals
  "" TSStringRegex        { } , -- Regular expression literals.
  hi! link TSStringEscape LeuvenLiveDarkGreenHighlight "escape characters within a string: `\n`, `\t`, etc.
  "" TSStringSpecial      { } , -- Strings with special meaning that don't fit into the previous categories.
  "" TSSymbol             { } , -- Identifiers referring to symbols or atoms.
  "" TSTag                { } , -- Tags like HTML tag names.
  "" TSTagAttribute       { } , -- HTML tag attributes.
  "" TSTagDelimiter       { } , -- Tag delimiters like `<` `>` `/`.
  "" TSText               { } , -- Non-structured text. Like text in a markup language.
  "" TSStrong             { } , -- Text to be represented in bold.
  "" TSEmphasis           { } , -- Text to be represented with emphasis.
  "" TSUnderline          { } , -- Text to be represented with an underline.
  "" TSStrike             { } , -- Strikethrough text.
  hi! link TSHead1 LeuvenHead1 "text that is part of a heading level 1.
  hi! link TSHead2 LeuvenHead2 "text that is part of a heading level 2.
  hi! link TSHead3 LeuvenHead3 "text that is part of a heading level 3.
  hi! link TSHead4 LeuvenHead4 "text that is part of a heading level 4.
  hi! link TSHead5 LeuvenHead5 "text that is part of a heading level 5.
  hi! link TSHead6 LeuvenHead6 "text that is part of a heading level 6.
  hi! link TSHead7 LeuvenHead7 "text that is part of a heading level 7.
  hi! link TSHead8 LeuvenHead8 "text that is part of a heading level 8.
  hi! link TSTitle LeuvenHead1 "text that is part of a title.
  hi! link TSLiteral String "literal or verbatim text.
  "" TSURI                { } , -- URIs like hyperlinks or email addresses.
  "" TSMath               { } , -- Math environments like LaTeX's `$ ... $`
  hi! link TSTextReference Preproc "footnotes, text references, citations, etc.
  "" TSEnvironment        { } , -- Text environments of markup languages.
  "" TSEnvironmentName    { } , -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
  "" TSNote               { } , -- Text representation of an informational note.
  hi! link TSWarning WarningMsg "text representation of a warning note.
  hi! link TSDanger ErrorMsg "text representation of a danger note.
  hi! link TSType LeuvenDarkMagenta "type (and class) definitions and annotations.
  hi! link TSTypeBuiltin TSConstBuiltin "built-in types: `i32` in Rust.
  hi! link TSVariable LeuvenFg
  hi! link TSVariableBuiltin TSConstBuiltin "variable names defined by the language: `this` or `self` in Javascript.
  hi! link TSBlockMargins LeuvenBlockMargins "margins of code blocks
  hi! link TSBlockContent LeuvenBlockContent "code block contents
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
