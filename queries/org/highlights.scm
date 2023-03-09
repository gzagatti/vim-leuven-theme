;; extends
(block "#+begin_" @block.margins name: (expr) @block.margins parameter: (expr)* @block.params)
(block "#+end_" @block.margins end_name: (expr) @block.margins)
(block contents: (contents) @block)
(property_drawer
  ":properties:" @OrgTSPropertyMargin
  (property ":" @OrgTSPropertyMargin name: (expr) @OrgTSPropertyMargin ":" @OrgTSPropertyMargin)
  ":end:" @OrgTSPropertyMargin
)
(drawer
  (":" name: (expr) @OrgTSDrawerMargin ":") @OrgTSDrawerMargin
  ":end:" @OrgTSDrawerMargin
)
