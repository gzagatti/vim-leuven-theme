if leuven#should_abort('org')
  finish
endif

hi! link @org.headline.level1  @markup.heading.1
hi! link @org.headline.level2  @markup.heading.2
hi! link @org.headline.level3  @markup.heading.3
hi! link @org.headline.level4  @markup.heading.4
hi! link @org.headline.level5  @markup.heading.5
hi! link @org.headline.level6  @markup.heading.6
hi! link @org.headline.level7  @markup.heading.7
hi! link @org.headline.level8  @markup.heading.8

hi! link @org.keyword.todo     LeuvenLiveRedHighlight
hi! link @org.keyword.done     LeuvenLiveGreenHighlight

hi! link @org.latex_env        @markup.math
hi! link @org.checkbox         Comment
hi! link @org.timestamp.active LeuvenLightBlueBgUnderline
hi! link @org.properties.name  LeuvenGreen
hi! link @org.properties       LeuvenLiveLightGreenHighlight
hi! link @org.drawer           LeuvenGreen

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
