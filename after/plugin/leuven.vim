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
  hi! link @block            LeuvenBlockContent " code block contents
  hi! link @block.margins    LeuvenBlockMargins " margins of code blocks
  hi! link @comment          Comment            " line comments and block comments.
  hi! link @constant         Constant           " constants identifiers
  hi! link @constant.builtin Constant           " built-in constant values: `nil` in Lua.
  hi! link @constructor      LeuvenFg           " constructor calls and definitions: `{}` in Lua, and Java constructors.
  hi! link @field            LeuvenFg           " object and struct fields
  hi! link @keyword          LeuvenDarkBlue     " keywords that don't fit into other categories.
  hi! link @label            Label              " GOTO labels: `label:` in C, and `::label::` in Lua.
  hi! link @namespace        Identifier         " identifiers referring to modules and namespaces.
  hi! link @operator         Operator           " binary or unary operators: `+`, and also `->` and `*` in C.
  hi! link @string           String             " string literals
  hi! link @text.uri         Underlined         " URIs like hyperlinks or email addresses
  hi! link @text.literal     String             " literal or verbatim text.
  hi! link @text.math        LeuvenBlockContent " math environments like LaTeX's `$ ... $`
  hi! link @text.reference   Preproc            " footnotes, text references, citations, etc.
  hi! link @text.warning     WarningMsg         " text representation of a warning note.
  hi! link @text.danger      ErrorMsg           " text representation of a danger note.
  hi! link @type             LeuvenDarkMagenta  " type (and class) definitions and annotations.
  hi! link @type.builtin     TSConstBuiltin     " built-in types: `i31` in Rust.
  hi! link @variable         LeuvenFg           " Variable names that don't fit into other categories.
  hi! link @variable.builtin TSConstBuiltin     " variable names defined by the language: `this` or `self` in Javascript.
  hi! link @text.title       LeuvenHead1        " text that is part of a title.
  hi! link @text.head1       LeuvenHead1        " text that is part of a heading level 1.
  hi! link @text.head2       LeuvenHead2        " text that is part of a heading level 2.
  hi! link @text.head3       LeuvenHead3        " text that is part of a heading level 3.
  hi! link @text.head4       LeuvenHead4        " text that is part of a heading level 4.
  hi! link @text.head5       LeuvenHead5        " text that is part of a heading level 5.
  hi! link @text.head6       LeuvenHead6        " text that is part of a heading level 6.
  hi! link @text.head7       LeuvenHead7        " text that is part of a heading level 7.
  hi! link @text.head8       LeuvenHead8        " text that is part of a heading level 8.
endif
"}}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
