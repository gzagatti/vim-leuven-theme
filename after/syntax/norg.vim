if leuven#should_abort('norg')
  finish
endif

hi! link @neorg.headings.1.title @text.head1
hi! link @neorg.headings.2.title @text.head2
hi! link @neorg.headings.3.title @text.head3
hi! link @neorg.headings.4.title @text.head4
hi! link @neorg.headings.5.title @text.head5
hi! link @neorg.headings.6.title @text.head6
hi! link @neorg.headings.7.title @text.head7
hi! link @neorg.headings.8.title @text.head8

hi! link @neorg.headings.1.prefix @text.head1
hi! link @neorg.headings.2.prefix @text.head2
hi! link @neorg.headings.3.prefix @text.head3
hi! link @neorg.headings.4.prefix @text.head4
hi! link @neorg.headings.5.prefix @text.head5
hi! link @neorg.headings.6.prefix @text.head6
hi! link @neorg.headings.7.prefix @text.head7
hi! link @neorg.headings.8.prefix @text.head8

hi! link @neorg.tags.carryover.begin LeuvenLiveLightGreenHighlight
hi! link @neorg.tags.carryover.name.word LeuvenLiveLightGreenHighlight
hi! link @neorg.tags.carryover.parameters Function

hi! link @neorg.tags.ranged_verbatim.begin @block.margins
hi! link @neorg.tags.ranged_verbatim.end @block.margins
hi! link @neorg.tags.ranged_verbatim.name @block.margins
hi! link @neorg.tags.ranged_verbatim.name.word @block.margins
hi! link @neorg.tags.ranged_verbatim.parameters @type

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
