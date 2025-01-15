if exists("b:current_syntax")
  finish
endif

syntax clear
syntax sync fromstart

syntax region aws01 start=/^=\+$/ end=/^=\+$/
highlight aws01 guifg=#7EE787 gui=NONE

syntax match aws02 /^---.*$/
highlight aws02 guifg=#F2CC60 gui=NONE

syntax region aws03 start=/^[[:space:]]*\* / end=/^$/ keepend
highlight aws03 guifg=#8B949E gui=NONE

syntax match aws04 /^-\ze /
highlight aws04 guifg=#58A6FF gui=NONE

syntax match aws05 /#.*$/
highlight aws05 guifg=#8B949E gui=NONE

syntax match aws06 /<-.*$/
highlight aws06 guifg=#8B949E gui=NONE

syntax region aws07 start=/^#\+$/ end=/^#\+$/
highlight aws07 guifg=#58A6FF gui=NONE

syntax region aws08 start=/^[[:space:]]*```$/ end=/^[[:space:]]*```$/ keepend
highlight aws08 guifg=#F778BA gui=NONE

syntax match aws09 /\[\zs[^]]*\ze\]/
highlight aws09 guifg=#F778BA gui=NONE

let b:current_syntax = "aws"
