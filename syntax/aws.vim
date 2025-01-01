if exists("b:current_syntax")
  finish
endif

syntax clear
syntax sync fromstart

syntax region 01 start=/^=\+$/ end=/^=\+$/
highlight 01 guifg=#7EE787 gui=NONE

syntax match 02 /^---.*$/
highlight 02 guifg=#F2CC60 gui=NONE

syntax region 03 start=/^[[:space:]]*\* / end=/^$/ keepend
highlight 03 guifg=#8B949E gui=NONE

syntax match 04 /^-\ze /
highlight 04 guifg=#58A6FF gui=NONE

syntax match 05 /#.*$/
highlight 05 guifg=#8B949E gui=NONE

syntax match 06 /<-.*$/
highlight 06 guifg=#8B949E gui=NONE

syntax region 07 start=/^#\+$/ end=/^#\+$/
highlight 07 guifg=#58A6FF gui=NONE

syntax region 08 start=/^[[:space:]]*```$/ end=/^[[:space:]]*```$/ keepend
highlight 08 guifg=#F778BA gui=NONE

syntax match 09 /\[\zs[^]]*\ze\]/
highlight 09 guifg=#F778BA gui=NONE

let b:current_syntax = "aws"
