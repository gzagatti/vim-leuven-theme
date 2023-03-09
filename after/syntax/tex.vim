if leuven#should_abort('tex')
  finish
endif

hi! link @namespace             Function
hi! link @include               Function
hi! link @function.macro        Function
hi! link @text.environment      Function
hi! link @text.environment.name Preproc
hi! link @string                Preproc

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
