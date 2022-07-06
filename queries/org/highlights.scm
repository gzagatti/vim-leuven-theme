(block) @TSBlockMargins
(block contents: (contents) @TSBlockContent)
(property_drawer
  ":properties:" @OrgTSPropertyMargin
  (property ":" @OrgTSPropertyMargin name: (expr) @OrgTSPropertyMargin ":" @OrgTSPropertyMargin)
  ":end:" @OrgTSPropertyMargin
)
(drawer
  (":" name: (expr) @OrgTSDrawerMargin ":") @OrgTSDrawerMargin
  ":end:" @OrgTSDrawerMargin
)
