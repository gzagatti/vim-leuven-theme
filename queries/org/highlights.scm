(block) @block.margins
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
