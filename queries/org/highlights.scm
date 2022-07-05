(block) @TSBlockMargins
(block contents: (contents) @TSBlockContent)
(property_drawer
  ":properties:" @OrgTSPropertyName
  (property ":" @OrgTSPropertyName name: (expr) @OrgTSPropertyName ":" @OrgTSPropertyName)*
  ":end:" @OrgTSPropertyName
)
