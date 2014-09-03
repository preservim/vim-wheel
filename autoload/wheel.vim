" ============================================================================
" File:        wheel.vim
" Description: autoload functions for vim-wheel plugin
" Maintainer:  Reed Esau <github.com/reedes>
" Created:     February 01, 2014
" License:     The MIT License (MIT)
" ============================================================================

if &cp || exists('g:wheel#autoloaded') | fini | en

fu! wheel#VScroll(cmd, visual)
  " cmd: 0=up 1=down
  let l:threshold = max([&scrolloff, g:wheel#line#threshold])
  let l:ln = line('.')
  let l:degrade = &wrap && !g:wheel#scroll_on_wrap
  if a:visual ==# ''
    if a:cmd
      if l:degrade || l:ln <= l:threshold
        exe "sil norm! gj"
      el
        exe "sil norm! gj\<C-E>"
      en
    el
      if l:degrade || (line('$') - l:ln) < l:threshold
        exe "sil norm! gk"
      el
        exe "sil norm! gk\<C-Y>"
      en
    en
  el          " some kind of visual
    if a:cmd
      if l:degrade
        exe "sil norm! gvgj"
      el
        exe "sil norm! gvgj\<C-E>"
      en
    el
      if l:degrade
        exe "sil norm! gvgk"
      el
        exe "sil norm! gvgk\<C-Y>"
      en
    en
  en
endf

fu! wheel#HScroll(cmd, visual)
  " cmd: 0=left 1=right
  if a:visual ==# ''
    if &wrap
      if a:cmd
        exe "sil norm! l"
      el
        exe "sil norm! h"
      en
    el
      let l:c = col('.')
      let l:e = col('$')
      if a:cmd
        if l:c <# (l:e - &sidescrolloff - 1)
          exe "sil norm! zll"
        elsei l:c <# (l:e - 1)
          exe "sil norm! l"
        en
      elsei l:c ># &sidescrolloff
        exe "sil norm! zhh"
      elsei l:c ># 1
        exe "sil norm! h"
      en
    en
  el          " some kind of visual
    if &wrap
      if a:cmd
        exe "sil norm! gvl"
      el
        exe "sil norm! gvh"
      en
    el
      if a:cmd
        exe "sil norm! gvzll"
      el
        exe "sil norm! gvzhh"
      en
    en
  en
endf

let g:wheel#autoloaded = 1
