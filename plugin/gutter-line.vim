" GutterLine.vim - Show the current line as a gutter sign
" Maintainer:   Statox (me@statox.fr)
" Version:      0.1

" TODO
" - Create a custom highlighting group linked to SignColumn by default

if !has('signs') || exists('g:loaded_GutterLine') || &cp
  finish
endif
let g:loaded_GutterLine = 1

"
" Check for user settings
"

" The string used in the gutter to show the current line
if !exists('g:GutterLineSign')
    let g:GutterLineSign='>'
elseif strlen(g:GutterLineSign) > 2
    " Gutter sign can not be more than 2 signs
    let g:GutterLineSign=strpart(g:GutterLineSign, 0, 2)
endif

" The list of filetypes not to show the current line
if !exists('g:GutterLineIgnore')
    let g:GutterLineIgnore=[]
endif

"
" Define the sign used to indicate the line in the gutter
"
execute 'sign define GutterLine texthl=SignColumn  text=' . g:GutterLineSign

augroup GutterLine
    autocmd!
    autocmd! BufEnter,CursorHold,CursorHoldI * call GutterLine#PlaceLineSign()
augroup end
