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
  set background=light

  call s:Style('Normal', s:fg, s:bg) "normal text
  hi! link NormalFloat Normal "normal text in floating windows.
  hi! link NormalNC Normal "normal text in in non-current windows.

  "" ColorColumn  { }, -- Columns set with 'colorcolumn'
  "" Conceal      { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
  call s:Style('Cursor', s:none, ['#21bdff', 0]) "character under the cursor
  hi! link iCursor Cursor "insert cursor
  hi! link lCursor Cursor "character under the cursor when |language-mapping| is used (see 'guicursor')"
  hi! link CursorIM Cursor "like Cursor, but used when in IME mode |CursorIM|
  hi! link TermCursor Cursor "cursor in a focused terminal
  "" CursorColumn { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
  "" CursorLine   { }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
  "" Directory    { }, -- Directory names (and other special names in listings)
  "" DiffAdd      { }, -- Diff mode: Added line |diff.txt|
  "" DiffChange   { }, -- Diff mode: Changed line |diff.txt|
  "" DiffDelete   { }, -- Diff mode: Deleted line |diff.txt|
  "" DiffText     { }, -- Diff mode: Changed text within a changed line |diff.txt|
  "" EndOfBuffer  { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
  "" TermCursorNC { }, -- Cursor in an unfocused terminal
  "" ErrorMsg     { }, -- Error messages on the command line
  "" VertSplit    { }, -- Column separating vertically split windows
  "" Folded       { }, -- Line used for closed folds
  "" FoldColumn   { }, -- 'foldcolumn'
  "" SignColumn   { }, -- Column where |signs| are displayed
  call s:Style('IncSearch', s:bg, ['#5974ab', 0], ['underline']) " 'incsearch' highlighting; also used for the text replaced with ":s///c"
  hi! link LineNr Comment "line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
  "" CursorLineNr { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
  call s:Style('MatchParen', s:none, ['#c0e8c3', 0]) "character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
  "" ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
  "" MsgArea      { }, -- Area for messages and cmdline
  "" MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
  "" MoreMsg      { }, -- |more-prompt|
  "" NonText      { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
  call s:Style('Pmenu', s:fg, ['#ebf4fe', 0]) "popup menu: normal item.
  call s:Style('PmenuSel', s:bg, ['#5974ab', 0]) "popup menu: selected item.
  cal s:Style('PmenuThumb', s:none,['#686868', 0]) "popup menu: thumb of the scrollbar.
  cal s:Style('PmenuSbar', s:none, ['#a9a9a9', 0]) "popup menu: scrollbar
  "" Question     { }, -- |hit-enter| prompt and yes/no questions
  "" QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
  call s:Style('Search', ['#000000', 0], ['#fff79f', 0]) "last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
  "" SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
  "" SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
  "" SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
  "" SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
  "" SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
  "" StatusLine   { }, -- Status line of current window
  "" StatusLineNC { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
  "" TabLine      { }, -- Tab pages line, not active tab page label
  "" TabLineFill  { }, -- Tab pages line, where there are no labels
  "" TabLineSel   { }, -- Tab pages line, active tab page label
  "" Title        { }, -- Titles for output from ":set all", ":autocmd" etc.
  "" Visual       { }, -- Visual mode selection
  call s:Style('Visual', s:none, ['#8ed3ff', 0])
  "" VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
  "" WarningMsg   { }, -- Warning messages
  call s:Style('Whitespace', ['#636363', 0], s:none) "nbsp, space, tab and trail in 'listchars'
  "" Winseparator { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
  "" WildMenu     { }, -- Current match in 'wildmenu' completion

  "" Common vim syntax groups used for all kinds of code and markup.
  "" Commented-out groups should chain up to their preferred (*) group
  "" by default.
  ""
  "" See :h group-name
  ""
  "" Uncomment and edit if you want more specific syntax highlighting.

  call s:Style('Comment', s:comment) "any comment

  call s:Style('Constant', ['#d0372d', 0]) "any constant
  call s:Style('String', ['#008000', 0]) "a string constant: "this is a string"
  hi! link Character Normal "a character constant: 'c', '\n'
  hi! link Number Normal "a number constant: 234, 0xff
  hi! link Boolean Constant "a boolean constant: TRUE, false
  hi! link Float Normal "a floating point constant: 2.3e10


  call s:Style('Identifier', ['#ba36a5', 0]) "any variable name
  call s:Style('Function', ['#006fe0', 0]) "function name (also: method for classes)

  call s:Style('Statement', ['#0000ff', 0]) "(*) any statement
  hi! link Keyword Statement "any other keyword
  hi! link Conditional Statement "if, then, else, endif, switch, etc.
  hi! link Repeat Statement "for, do, while, etc.
  call s:Style('Label', s:comment, ['#fff68f', 0]) "case, default, etc.
  hi! link Operator Statement "sizeof", "+", "*", etc.
  hi! link Exception Statement "try, catch, throw

  call s:Style('Preproc', ['#123555', 0], ['#e5f4fb', 0]) "(*) generic preprocessor
  "" Include        { }, --   Preprocessor #include
  "" Define         { }, --   Preprocessor #define
  "" Macro          { }, --   Same as Define
  "" PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

  hi! link Type Normal "(*) int, long, char, etc.
  "" StorageClass   { }, --   static, register, volatile, etc.
  "" Structure      { }, --   struct, union, enum, etc.
  "" Typedef        { }, --   A typedef

  hi! link Special Normal "(*) any special symbol
  "" SpecialChar    { }, --   Special character in a constant
  hi! link Tag Label "you can use CTRL-] on this
  "" Delimiter      { }, --   Character that needs attention
  "" SpecialComment { }, --   Special things inside a comment (e.g. '\n')
  "" Debug          { }, --   Debugging statements

  "" Underlined     { gui = "underline" }, -- Text that stands out, HTML links
  "" Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
  call s:Style('Error', ['#cd0000', 0], ['#ffe6e4', 0]) "any erroneous construct
  hi! link Todo Error "anything that needs extra attention; mostly the keywords TODO FIXME and XXX

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
  "" TSConstBuiltin       { } , -- Built-in constant values: `nil` in Lua.
  "" TSConstMacro         { } , -- Constants defined by macros: `NULL` in C.
  hi! link TSConstructor Normal "constructor calls and definitions: `{}` in Lua, and Java constructors.
  "" TSDebug              { } , -- Debugging statements.
  "" TSDefine             { } , -- Preprocessor #define statements.
  "" TSError              { } , -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
  "" TSException          { } , -- Exception related keywords: `try`, `except`, `finally` in Python.
  hi! link TSField Normal "object and struct fields
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
  hi! link TSPunctDelimiter Normal "punctuation delimiters: Periods, commas, semicolons, etc.
  hi! link TSPunctBracket Normal "brackets, braces, parentheses, etc.
  "" TSPunctSpecial       { } , -- Special punctuation that doesn't fit into the previous categories.
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
  call s:Style('TSTitle', ['#3c3c3c', 0], ['#f0f0f0', 0], ['underline']) "text that is part of a title.
  "" TSLiteral            { } , -- Literal or verbatim text.
  "" TSURI                { } , -- URIs like hyperlinks or email addresses.
  "" TSMath               { } , -- Math environments like LaTeX's `$ ... $`
  hi! link TSTextReference Preproc "footnotes, text references, citations, etc.
  "" TSEnvironment        { } , -- Text environments of markup languages.
  "" TSEnvironmentName    { } , -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
  "" TSNote               { } , -- Text representation of an informational note.
  "" TSWarning            { } , -- Text representation of a warning note.
  "" TSDanger             { } , -- Text representation of a danger note.
  call s:Style('TSType', ['#6434a3', 0]) "type (and class) definitions and annotations.
  hi! link TSTypeBuiltin Function "built-in types: `i32` in Rust.
  hi! link TSVariable Normal
  hi! link TSVariableBuiltin Function "variable names defined by the language: `this` or `self` in Javascript.
" }}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
