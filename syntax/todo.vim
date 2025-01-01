if exists("b:current_syntax")
  finish
endif

syntax clear
syntax sync fromstart

syntax match 01 "^\s*\[\s\].*$"
highlight 01 guifg=#EAEAEA gui=NONE

syntax match 02 "^\s*\[x\].*$"
highlight 02 guifg=#AAAAAA gui=NONE

syntax match 03 "^[*].*$"
highlight 03 guifg=#5FA7FF gui=NONE

syntax match 04 "^[>].*$"
highlight 04 guifg=#E4D46C gui=NONE

syntax match 05 "^[-].*$"
highlight 05 guifg=#FF65B4 gui=NONE

syntax match 06 "^\s*===\s.*\s==="
highlight 06 guifg=#EAEAEA gui=NONE

syntax match 07 "--\s.*$" containedin=ALL
highlight 07 guifg=#999999 gui=NONE

syntax match 08 "<-\s.*$" containedin=ALL
highlight 08 guifg=#999999 gui=NONE

syntax match 09 "^[#].*$"
highlight 09 guifg=#666666 gui=NONE

let b:current_syntax = "todo"
