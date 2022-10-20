if leuven#should_abort('org')
  finish
endif

hi! link OrgHeadlineLevel1    @text.head1
hi! link OrgHeadlineLevel2    @text.head2
hi! link OrgHeadlineLevel3    @text.head3
hi! link OrgHeadlineLevel4    @text.head4
hi! link OrgHeadlineLevel5    @text.head5
hi! link OrgHeadlineLevel6    @text.head6
hi! link OrgHeadlineLevel7    @text.head7
hi! link OrgHeadlineLevel8    @text.head8

hi! link OrgTSHeadlineLevel1  @text.head1
hi! link OrgTSHeadlineLevel1  @text.head1
hi! link OrgTSHeadlineLevel2  @text.head2
hi! link OrgTSHeadlineLevel3  @text.head3
hi! link OrgTSHeadlineLevel4  @text.head4
hi! link OrgTSHeadlineLevel5  @text.head5
hi! link OrgTSHeadlineLevel6  @text.head6
hi! link OrgTSHeadlineLevel7  @text.head7
hi! link OrgTSHeadlineLevel8  @text.head8

hi! link OrgTODO              LeuvenLiveRedHighlight
hi! link OrgDone              LeuvenLiveGreenHighlight

hi! link OrgTSLatex           @text.math
hi! link OrgTSCheckbox        Comment
hi! link OrgTSTimestampActive LeuvenLightBlueBgUnderline
hi! link OrgTSPropertyDrawer  LeuvenGreen
hi! link OrgTSPropertyMargin  LeuvenLiveLightGreenHighlight
hi! link OrgTSDrawer          LeuvenGreen
hi! link OrgTSDrawerMargin    LeuvenLiveLightGreenHighlight

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
