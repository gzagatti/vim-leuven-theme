if leuven#should_abort('NeogitStatus')
  finish
endif

hi! link NeogitDiffAddHighlight     DiffAdd
hi! link NeogitDiffDeleteHighlight  DiffDelete
hi! link NeogitDiffContextHighlight LeuvenGrayBg
hi! link NeogitHunkHeader           LeuvenDarkGrayBg
hi! link NeogitHunkHeaderHighlight  LeuvenDarkGrayBg

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
