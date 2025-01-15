if exists("b:current_syntax")
  finish
endif

syntax clear
syntax sync fromstart

syntax match todo01 "^\s*\[\s\].*$"
highlight todo01 guifg=#EAEAEA gui=NONE

syntax match todo02 "^\s*\[x\].*$"
highlight todo02 guifg=#AAAAAA gui=NONE

syntax match todo03 "^[*].*$"
highlight todo03 guifg=#5FA7FF gui=NONE

syntax match todo04 "^[>].*$"
highlight todo04 guifg=#E4D46C gui=NONE

syntax match todo05 "^[-].*$"
highlight todo05 guifg=#FF65B4 gui=NONE

syntax match todo06 "^\s*===\s.*\s==="
highlight todo06 guifg=#EAEAEA gui=NONE

syntax match todo07 "^\s*---\s.*\s---"
highlight todo07 guifg=#E4D46C gui=NONE

syntax match todo08 "--\s.*$" contained
highlight todo08 guifg=#999999 gui=NONE

syntax match todo09 "<-\s.*$" containedin=ALL
highlight todo09 guifg=#999999 gui=NONE

syntax match todo10 "^[#].*$"
highlight todo10 guifg=#666666 gui=NONE

syntax region todo11 start='^\s*```' end='^\s*```' keepend
highlight todo11 guifg=#5FA7FF gui=NONE

let b:current_syntax = "todo"
