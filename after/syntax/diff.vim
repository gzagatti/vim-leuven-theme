if leuven#should_abort('diff')
  finish
endif

hi! link diffAdded DiffAdd
hi! link diffRemoved DiffDelete
hi! link diffChanged DiffChange
