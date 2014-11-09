" ============================================================================
" File:        wheel.vim
" Description: vim-wheel plugin
" Maintainer:  Reed Esau <github.com/reedes>
" Created:     January 30, 2014
" License:     The MIT License (MIT)
" ============================================================================

if &cp || exists('g:wheel#loaded') | finish | endif

" Save 'cpoptions' and set Vim default to enable line continuations.
let s:save_cpo = &cpo
set cpo&vim

if !exists('g:wheel#line#threshold')
  " how close to begin/end of file to stop behavior
  " a larger scrolloff will automatically increase this threshold
  let g:wheel#line#threshold = 5
endif

if !exists('g:wheel#scroll_on_wrap')
  let g:wheel#scroll_on_wrap = 1       " 0=disable, 1=enable (def)
endif

if !exists('g:wheel#map#mouse')
  let g:wheel#map#mouse = 1       " 1=natural, 0=disable, -1=reverse
endif

if !exists('g:wheel#map#up')
  if empty(maparg('<c-k>', 'n'))
    let g:wheel#map#up = '<c-k>'
  else
    let g:wheel#map#up = ''
  en
endif
if !exists('g:wheel#map#down')
  if empty(maparg('<c-j>', 'n'))
    let g:wheel#map#down = '<c-j>'
  else
    let g:wheel#map#down = ''
  en
endif

if !exists('g:wheel#map#left')
  let g:wheel#map#left = ''         " CTRL-H
endif
if !exists('g:wheel#map#right')
  let g:wheel#map#right = ''        " CTRL-L
endif

nnoremap <Plug>(WheelUp)    :call wheel#VScroll(0, '')<CR>
vnoremap <Plug>(WheelUp)    :<C-U>call wheel#VScroll(0, visualmode())<CR>
nnoremap <Plug>(WheelDown)  :call wheel#VScroll(1, '')<CR>
vnoremap <Plug>(WheelDown)  :<C-U>call wheel#VScroll(1, visualmode())<CR>

nnoremap <Plug>(WheelLeft)  :call wheel#HScroll(0, '')<CR>
vnoremap <Plug>(WheelLeft)  :<C-U>call wheel#HScroll(0, visualmode())<CR>
nnoremap <Plug>(WheelRight) :call wheel#HScroll(1, '')<CR>
vnoremap <Plug>(WheelRight) :<C-U>call wheel#HScroll(1, visualmode())<CR>

if !exists("g:wheel_no_mappings") || !g:wheel_no_mappings
  if exists('g:wheel#map#up') && g:wheel#map#up != ''
    exe 'nmap <silent> ' . g:wheel#map#up . ' <Plug>(WheelUp)'
    exe 'vmap <silent> ' . g:wheel#map#up . ' <Plug>(WheelUp)'
  endif
  if exists('g:wheel#map#down') && g:wheel#map#down != ''
    exe 'nmap <silent> ' . g:wheel#map#down . ' <Plug>(WheelDown)'
    exe 'vmap <silent> ' . g:wheel#map#down . ' <Plug>(WheelDown)'
  endif

  if exists('g:wheel#map#left') && g:wheel#map#left != ''
    exe 'nmap <silent> ' . g:wheel#map#left . ' <Plug>(WheelLeft)'
    exe 'vmap <silent> ' . g:wheel#map#left . ' <Plug>(WheelLeft)'
  endif
  if exists('g:wheel#map#right') && g:wheel#map#right != ''
    exe 'nmap <silent> ' . g:wheel#map#right . ' <Plug>(WheelRight)'
    exe 'vmap <silent> ' . g:wheel#map#right . ' <Plug>(WheelRight)'
  endif

  let s:regress = &wrap && !g:wheel#scroll_on_wrap
  if !s:regress && g:wheel#map#mouse ==# 1
    " natural
    map <silent> <ScrollWheelDown> <Plug>(WheelDown)
    map <silent> <ScrollWheelUp>   <Plug>(WheelUp)
  elseif !s:regress && g:wheel#map#mouse ==# -1
    " reverse
    map <silent> <ScrollWheelDown> <Plug>(WheelUp)
    map <silent> <ScrollWheelUp>   <Plug>(WheelDown)
  endif
  unlet s:regress
endif

let &cpo = s:save_cpo
unlet s:save_cpo

let g:wheel#loaded = 1

" vim:ts=2:sw=2:sts=2
