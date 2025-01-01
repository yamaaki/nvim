if exists("b:current_syntax")
  finish
endif

syntax clear
syntax sync fromstart

syntax match 01 "^[*].*$"
highlight 01 guifg=#5FA7FF gui=NONE

syntax match 02 "^[>].*$"
highlight 02 guifg=#E4D46C gui=NONE

syntax match 03 "^[-].*$"
highlight 03 guifg=#FF65B4 gui=NONE

syntax match 04 "^\s*===\s.*\s==="
highlight 04 guifg=#EAEAEA gui=NONE

syntax match 05 "--\s.*$" containedin=ALL
highlight 05 guifg=#999999 gui=NONE

syntax match 06 "<-\s.*$" containedin=ALL
highlight 06 guifg=#999999 gui=NONE

syntax match 07 "^[#].*$"
highlight 07 guifg=#666666 gui=NONE

syntax region 08 start='^\s*```' end='^\s*```' keepend
highlight 08 guifg=#5FA7FF gui=NONE

let b:current_syntax = "memo"
