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
  hi! link TSComment         Comment             " line comments and block comments.
  hi! link TSConstant        Constant            " constants identifiers
  hi! link TSConstBuiltin    Constant            " built-in constant values: `nil` in Lua.
  hi! link TSConstructor     LeuvenFg            " constructor calls and definitions: `{}` in Lua, and Java constructors.
  hi! link TSField           LeuvenFg            " object and struct fields
  hi! link TSKeyword         LeuvenDarkBlue      " keywords that don't fit into other categories.
  hi! link TSLabel           Label               " GOTO labels: `label:` in C, and `::label::` in Lua.
  hi! link TSNamespace       Identifier          " identifiers referring to modules and namespaces.
  hi! link TSOperator        Operator            " binary or unary operators: `+`, and also `->` and `*` in C.
  hi! link TSString          String              " string literals
  hi! link TSURI             Underlined          " URIs like hyperlinks or email addresses
  hi! link TSLiteral         String              " literal or verbatim text.
  hi! link TSMath            LeuvenBlockContent  " math environments like LaTeX's `$ ... $`
  hi! link TSTextReference   Preproc             " footnotes, text references, citations, etc.
  hi! link TSWarning         WarningMsg          " text representation of a warning note.
  hi! link TSDanger          ErrorMsg            " text representation of a danger note.
  hi! link TSType            LeuvenDarkMagenta   " type (and class) definitions and annotations.
  hi! link TSTypeBuiltin     TSConstBuiltin      " built-in types: `i31` in Rust.
  hi! link TSVariable        LeuvenFg            " Variable names that don't fit into other categories.
  hi! link TSVariableBuiltin TSConstBuiltin      " variable names defined by the language: `this` or `self` in Javascript.
  hi! link TSTitle           LeuvenHead1         " text that is part of a title.
  hi! link TSHead1           LeuvenHead1         " text that is part of a heading level 1.
  hi! link TSHead2           LeuvenHead2         " text that is part of a heading level 2.
  hi! link TSHead3           LeuvenHead3         " text that is part of a heading level 3.
  hi! link TSHead4           LeuvenHead4         " text that is part of a heading level 4.
  hi! link TSHead5           LeuvenHead5         " text that is part of a heading level 5.
  hi! link TSHead6           LeuvenHead6         " text that is part of a heading level 6.
  hi! link TSHead7           LeuvenHead7         " text that is part of a heading level 7.
  hi! link TSHead8           LeuvenHead8         " text that is part of a heading level 8.
  hi! link TSBlockMargins    LeuvenBlockMargins  " margins of code blocks
  hi! link TSBlockContent    LeuvenBlockContent  " code block contents
endif
"}}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
