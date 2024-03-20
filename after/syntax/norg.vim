if leuven#should_abort('norg')
  finish
endif

hi! link @neorg.headings.1.title @markup.heading.1
hi! link @neorg.headings.2.title @markup.heading.2
hi! link @neorg.headings.3.title @markup.heading.3
hi! link @neorg.headings.4.title @markup.heading.4
hi! link @neorg.headings.5.title @markup.heading.5
hi! link @neorg.headings.6.title @markup.heading.6
hi! link @neorg.headings.7.title @markup.heading.7
hi! link @neorg.headings.8.title @markup.heading.8

hi! link @neorg.headings.1.prefix @markup.heading.1
hi! link @neorg.headings.2.prefix @markup.heading.2
hi! link @neorg.headings.3.prefix @markup.heading.3
hi! link @neorg.headings.4.prefix @markup.heading.4
hi! link @neorg.headings.5.prefix @markup.heading.5
hi! link @neorg.headings.6.prefix @markup.heading.6
hi! link @neorg.headings.7.prefix @markup.heading.7
hi! link @neorg.headings.8.prefix @markup.heading.8

hi! link @neorg.tags.carryover.begin LeuvenLiveLightGreenHighlight
hi! link @neorg.tags.carryover.name.word LeuvenLiveLightGreenHighlight
hi! link @neorg.tags.carryover.parameters Function

hi! link @neorg.tags.ranged_verbatim.begin @block.margins
hi! link @neorg.tags.ranged_verbatim.end @block.margins
hi! link @neorg.tags.ranged_verbatim.name @block.margins
hi! link @neorg.tags.ranged_verbatim.name.word @block.margins
hi! link @neorg.tags.ranged_verbatim.parameters @type

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
