if exists("b:current_syntax")
  finish
endif

syntax clear
syntax sync fromstart

syntax match memo01 "^[*].*$"
highlight memo01 guifg=#5FA7FF gui=NONE

syntax match memo02 "^[>].*$"
highlight memo02 guifg=#E4D46C gui=NONE

syntax match memo03 "^[-].*$"
highlight memo03 guifg=#FF65B4 gui=NONE

syntax match memo04 "^\s*===\s.*\s==="
highlight memo04 guifg=#EAEAEA gui=NONE

syntax match memo05 "--\s.*$" containedin=ALL
highlight memo05 guifg=#999999 gui=NONE

syntax match memo06 "<-\s.*$" containedin=ALL
highlight memo06 guifg=#999999 gui=NONE

syntax match memo07 "^[#].*$"
highlight memo07 guifg=#666666 gui=NONE

syntax region memo08 start='^\s*```' end='^\s*```' keepend
highlight memo08 guifg=#5FA7FF gui=NONE

syntax match memo09 "^[?].*$"
highlight memo09 guifg=#1A1D23 gui=NONE

let b:current_syntax = "memo"
