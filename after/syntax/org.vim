if leuven#should_abort('org')
  finish
endif

hi! link OrgHeadlineLevel1   TSHead1
hi! link OrgHeadlineLevel2   TSHead2
hi! link OrgHeadlineLevel3   TSHead3
hi! link OrgHeadlineLevel4   TSHead4
hi! link OrgHeadlineLevel5   TSHead5
hi! link OrgHeadlineLevel6   TSHead6
hi! link OrgHeadlineLevel7   TSHead7
hi! link OrgHeadlineLevel8   TSHead8

hi! link OrgTSHeadlineLevel1 TSHead1
hi! link OrgTSHeadlineLevel1 TSHead1
hi! link OrgTSHeadlineLevel2 TSHead2
hi! link OrgTSHeadlineLevel3 TSHead3
hi! link OrgTSHeadlineLevel4 TSHead4
hi! link OrgTSHeadlineLevel5 TSHead5
hi! link OrgTSHeadlineLevel6 TSHead6
hi! link OrgTSHeadlineLevel7 TSHead7
hi! link OrgTSHeadlineLevel8 TSHead8

hi! link OrgTODO LeuvenLiveRedHighlight
hi! link OrgDone LeuvenLiveGreenHighlight

hi! link OrgTSBlock TSBlockMargins

hi! link OrgTSCheckbox Comment

hi! link OrgTSTimestampActive LeuvenLightBlueBgUnderline

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
