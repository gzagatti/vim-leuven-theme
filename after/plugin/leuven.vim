if leuven#should_abort()
  finish
endif

" treesitter {{{
" the nvim-treesitter library defines many global highlight groups that are
" linked to the regular vim syntax highlight groups;
" most link to corresponding vim syntax groups (eg. TSKeyword => Keyword) by default;
" we only need to redefine those highlight groups when the defaults do not
" match the leuven specification.
" see :h nvim-treesitter-highlights.
if exists('g:loaded_nvim_treesitter')
  hi! link @block              LeuvenBlockContent " code block contents
  hi! link @block.margins      LeuvenBlockMargins " margins of code blocks
  hi! link @block.params       LeuvenBlockParams  " parameters in margins of code blocks

  hi! link @comment            Comment            " line comments and block comments.
  hi! link @comment.warning    WarningMsg         " text representation of a warning note.
  hi! link @comment.error      ErrorMsg           " text representation of a danger note.

  hi! link @type               LeuvenDarkMagenta  " type (and class) definitions and annotations.
  hi! link @type.builtin       TSConstBuiltin     " built-in types: `i31` in Rust.
  hi! link @variable           LeuvenFg           " Variable names that don't fit into other categories.
  hi! link @variable.builtin   TSConstBuiltin     " variable names defined by the language: `this` or `self` in Javascript.
  hi! link @constant           Constant           " constants identifiers
  hi! link @constant.builtin   Constant           " built-in constant values: `nil` in Lua.
  hi! link @constructor        LeuvenFg           " constructor calls and definitions: `{}` in Lua, and Java constructors.
  hi! link @field              LeuvenFg           " object and struct fields
  hi! link @keyword            LeuvenDarkBlue     " keywords that don't fit into other categories.
  hi! link @label              Label              " GOTO labels: `label:` in C, and `::label::` in Lua.
  hi! link @namespace          Identifier         " identifiers referring to modules and namespaces.
  hi! link @operator           Operator           " binary or unary operators: `+`, and also `->` and `*` in C.
  hi! link @function.builtin   Function           " built-in functions

  hi! link @string             String             " string literals
  hi! link @string.special.uri Underlined         " URIs like hyperlinks or email addresses

  hi! link @markup.italic      LeuvenEmphasis     " emphasized text, i.e. italic
  hi! link @markup.strong      LeuvenStrong       " emphasized text, i.e. bold
  hi! link @markup.link        Underlined         " footnotes, text references, citations, etc.
  hi! link @markup.link.url    Underlined         " footnotes, text references, citations, etc.
  hi! link @markup.math        LeuvenBlockContent " math environments like LaTeX's `$ ... $`
  hi! link @markup.raw         String             " literal or verbatim text (e.g. inline code)
  hi! link @markup.heading.1   LeuvenHead1        " text that is part of a heading level 1.
  hi! link @markup.heading.2   LeuvenHead2        " text that is part of a heading level 2.
  hi! link @markup.heading.3   LeuvenHead3        " text that is part of a heading level 3.
  hi! link @markup.heading.4   LeuvenHead4        " text that is part of a heading level 4.
  hi! link @markup.heading.5   LeuvenHead5        " text that is part of a heading level 5.
  hi! link @markup.heading.6   LeuvenHead6        " text that is part of a heading level 6.
  hi! link @markup.heading.7   LeuvenHead7        " text that is part of a heading level 7.
  hi! link @markup.heading.8   LeuvenHead8        " text that is part of a heading level 8.

  hi! link @diff.plus          DiffAdd            " added text
  hi! link @diff.minus         DiffDelete         " deleted text
  hi! link @diff.delta         DiffText           " changed text
endif
"}}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
