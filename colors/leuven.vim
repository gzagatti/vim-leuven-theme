" leuven --- the awesome Emacs color theme on white background

scriptencoding utf8

if v:version > 580
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'leuven'

"color palette {{{
let s:fg = g:leuven#palette.fg
let s:bg = g:leuven#palette.bg
let s:comment = g:leuven#palette.comment

let s:black_fg = g:leuven#palette.black_fg
let s:black_bg = g:leuven#palette.black_bg

let s:red_fg = g:leuven#palette.red_fg
let s:red_bg = g:leuven#palette.red_bg

let s:green_fg = g:leuven#palette.green_fg
let s:green_bg = g:leuven#palette.green_bg

let s:yellow_fg = g:leuven#palette.yellow_fg
let s:yellow_bg = g:leuven#palette.yellow_bg

let s:blue_fg = g:leuven#palette.blue_fg
let s:blue_bg = g:leuven#palette.blue_bg

let s:magenta_fg = g:leuven#palette.magenta_fg
let s:magenta_bg = g:leuven#palette.magenta_bg

let s:cyan_fg = g:leuven#palette.cyan_fg
let s:cyan_bg = g:leuven#palette.cyan_bg

let s:white_fg = g:leuven#palette.white_fg
let s:white_bg = g:leuven#palette.white_bg

let s:none = ['NONE', 'NONE']
"}}}

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

function s:Style(hlgroup, fg, ...) "bg, attr_list, special
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
  call s:Style('LeuvenFg', s:fg, s:none)

  call s:Style('LeuvenSubtleBg', s:none, ['#f4f4f1', 0])

  call s:Style('LeuvenComment', s:comment)
  call s:Style('LeuvenInvertedComment', s:bg, s:comment)

  call s:Style('LeuvenMagenta', ['#ba36a5', 0])
  call s:Style('LeuvenBlue', ['#006fe0', 0], s:none)

  call s:Style('LeuvenDarkMagenta', ['#6434a3', 0])
  call s:Style('LeuvenDarkGreen', ['#008000', 0])
  call s:Style('LeuvenDarkBlue', ['#0000ff', 0])
  call s:Style('LeuvenDarkGray', ['#454545', 0])

  call s:Style('LeuvenLiveRedHighlight', ['#ff8080', 0], ['#ffe6e4', 0])
  call s:Style('LeuvenLiveYellowHighlight', ['#ffa500', 0], ['#f6fecd', 0])
  call s:Style('LeuvenLiveGreenHighlight', ['#10C200', 0], ['#ccffcc', 0])
  call s:Style('LeuvenLiveBlueHighlight', ['#123555', 0], ['#e5f4fb', 0])
  call s:Style('LeuvenLiveMagentaHighlight', ['#ba36a5', 0], ['#ffe4ff', 0])

  call s:Style('LeuvenTransparentGreenHighlight', s:none, ['#ccffcc', 0])
  call s:Style('LeuvenTransparentCyanHighlight', s:none, ['#21bdff', 0])
  call s:Style('LeuvenTransparentLightCyanHighlight', s:none, ['#8ed3ff', 0])

  call s:Style('LeuvenMutedYellowHighlight', s:comment, ['#fff68f', 0])


  call s:Style('LeuvenTitle',['#3c3c3c', 0], ['#f0f0f0', 0], ['bold', 'underline'])
  hi! link LeuvenHead1 LeuvenTitle
  call s:Style('LeuvenHead2', ['#123555', 0], ['#e5f4fb', 0], ['bold', 'underline'])
  call s:Style('LeuvenHead3', ['#005522', 0], ['#efffef', 0], ['bold', 'underline'])
  call s:Style('LeuvenHead4', ['#ea6300', 0], s:bg, ['bold'])
  call s:Style('LeuvenHead5', ['#e3258d', 0], s:bg, ['bold'])
  call s:Style('LeuvenHead6', ['#0077cc', 0], s:bg, ['bold'])
  call s:Style('LeuvenHead7', ['#2eae2c', 0], s:bg, ['bold'])
  call s:Style('LeuvenHead8', ['#fd8008', 0], s:bg, ['bold'])

  call s:Style('LeuvenBlockMargins', ['#006666', 0], ['#ddeded', 0])
  call s:Style('LeuvenBlockContent', ['#000088', 0], s:bg)

"}}}

" user interface {{{
  set background=light

  " required as some plugins will overwrite
  call s:Style('Normal', s:fg, has('gui_running') ? s:bg : s:none) "normal text
  call s:Style('WildMenu', s:fg, ['#ffe4ff', 0], ['bold']) "current match in 'wildmenu' completion
  "" StatusLine   { }, -- Status line of current window
  "" StatusLineNC { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.

  " normal
  hi! link NormalFloat Normal "normal text in floating windows.
  hi! link NormalNC Normal "normal text in in non-current windows.

  " cursors
  hi! link Cursor LeuvenTransparentCyanHighlight "character under the cursor
  hi! link iCursor Cursor "insert cursor
  hi! link lCursor Cursor "character under the cursor when |language-mapping| is used (see 'guicursor')"
  hi! link CursorIM Cursor "like Cursor, but used when in IME mode |CursorIM|
  hi! link TermCursor Cursor "cursor in a focused terminal
  hi! clear TermCursorNC "cursor in unfocused terminal

  hi! link CursorLine LeuvenTransparentGreenHighlight "screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set
  hi! link CursorColumn LeuvenTransparentGreenHighlight "screen-column at the cursor, when 'cursorcolumn' is set.
  hi! link CursorLineNr LeuvenLiveGreenHighlight "like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.

  hi! link Visual LeuvenTransparentLightCyanHighlight "visual mode selection

  " support columns
  hi! link LineNr LeuvenComment "line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
  hi! link EndOfBuffer LeuvenComment "filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
  hi! link FoldColumn LeuvenSubtleBg "'foldcolumn'
  hi! link SignColumn LeuvenSubtleBg "column where |signs| are displayed

  " special
  hi! link Directory Function "directory names (and other special names in listings)

  " diff node
  hi! link DiffChange LeuvenInvertedComment "changed line
  hi! link DiffAdd LeuvenLiveGreenHighlight "added line |diff.txt|
  hi! link DiffDelete LeuvenLiveRedHighlight "deleted line |diff.txt|
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
  call s:Style('IncSearch', s:bg, ['#5974ab', 0], ['underline']) " 'incsearch' highlighting; also used for the text replaced with ":s///c"
  call s:Style('MatchParen', s:none, ['#c0e8c3', 0]) "character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|

  " popup menu
  call s:Style('Pmenu', s:fg, ['#ebf4fe', 0]) "normal item.
  call s:Style('PmenuSel', s:bg, ['#5974ab', 0]) "selected item.
  call s:Style('PmenuThumb', s:none,['#686868', 0]) "thumb of the scrollbar.
  call s:Style('PmenuSbar', s:none, ['#a9a9a9', 0]) "scrollbar
  call s:Style('Search', ['#000000', 0], ['#fff79f', 0]) "last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
  hi! link SpecialKey ErrorMsg

  " spell
  "" SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
  "" SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
  "" SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
  "" SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.

  " tab
  "" TabLine      { }, -- Tab pages line, not active tab page label
  "" TabLineFill  { }, -- Tab pages line, where there are no labels
  "" TabLineSel   { }, -- Tab pages line, active tab page label

  " vim
  hi! link Title Preproc "titles for output from ":set all", ":autocmd" etc.
  hi! link MoreMsg LeuvenLiveGreenHighlight "|more-prompt|

  hi! link VisualNOS Visual "visual mode selection when vim is "Not Owning the Selection".

  call s:Style('Whitespace', ['#636363', 0], s:none) "nbsp, space, tab and trail in 'listchars'

  "" Question     { }, -- |hit-enter| prompt and yes/no questions
  "" QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.

  "" ColorColumn  { }, -- Columns set with 'colorcolumn'
  "" Conceal      { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')

  "" ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
  "" MsgArea      { }, -- Area for messages and cmdline
  "" MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
  "" NonText      { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.

  "" Common vim syntax groups used for all kinds of code and markup.
  "" Commented-out groups should chain up to their preferred (*) group
  "" by default.
  ""
  "" See :h group-name
  ""
  "" Uncomment and edit if you want more specific syntax highlighting.

  call s:Style('Comment', s:comment) "any comment

  hi! link String LeuvenDarkGreen "a string constant: "this is a string"
  hi! link Character LeuvenFg "a character constant: 'c', '\n'
  hi! link Number LeuvenFg "a number constant: 234, 0xff
  hi! link Float LeuvenFg "a floating point constant: 2.3e10

  hi! link Constant LeuvenLiveMagentaHighlight "any constant
  hi! link Boolean Constant "a boolean constant: TRUE, false


  hi! link Identifier LeuvenMagenta "any variable name
  hi! link Function LeuvenBlue "function name (also: method for classes)

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

  hi! link Error ErrorMsg "any erroneous construct
  hi! link Todo LeuvenLiveRedHighlight "anything that needs extra attention; mostly the keywords TODO FIXME and XXX

  "" These groups are for the native LSP client and diagnostic system. Some
  "" other LSP clients may use these groups, or use their own. Consult your
  "" LSP client's documentation.

  "" See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
  ""
  "" LspReferenceText            { } , -- Used for highlighting "text" references
  "" LspReferenceRead            { } , -- Used for highlighting "read" references
  "" LspReferenceWrite           { } , -- Used for highlighting "write" references
  "" LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
  "" LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
  "" LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

  "" See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
  ""
  "" DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  "" DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  "" DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  "" DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
  "" DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
  "" DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
  "" DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
  "" DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
  "" DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
  "" DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
  "" DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
  "" DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
  "" DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
  "" DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
  "" DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
  "" DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
  "" DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
  "" DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
  "" DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
  "" DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

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
  hi! link TSFuncBuiltin Function "built-in functions: `print` in Lua.
  "" TSFuncMacro          { } , -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
  "" TSInclude            { } , -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
  call s:Style('TSKeyword', ['#0000ff', 0]) "keywords that don't fit into other categories.
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
  hi! link TSPunctDelimiter LeuvenFg "punctuation delimiters: Periods, commas, semicolons, etc.
  hi! link TSPunctBracket LeuvenFg "brackets, braces, parentheses, etc.
  hi! link TSPunctSpecial LeuvenFg "special punctuation that doesn't fit into the previous categories.
  "" TSRepeat             { } , -- Keywords related to loops: `for`, `while`, etc.
  "" TSStorageClass       { } , -- Keywords that affect how a variable is stored: `static`, `comptime`, `extern`, etc.
  hi! link TSString String "string literals
  "" TSStringRegex        { } , -- Regular expression literals.
  "" TSStringEscape       { } , -- Escape characters within a string: `\n`, `\t`, etc.
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
  hi! link TSTitle LeuvenTitle "text that is part of a title.
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

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
