" ============================================================================
" File:        wheel.vim
" Description: autoload functions for vim-wheel plugin
" Maintainer:  Reed Esau <github.com/reedes>
" Created:     February 01, 2014
" License:     The MIT License (MIT)
" ============================================================================

if &cp || exists('g:wheel#autoloaded') | finish | endif

function! wheel#VScroll(cmd, visual)
  " cmd: 0=up 1=down
  let l:threshold = max([&scrolloff, g:wheel#line#threshold])
  let l:ln = line('.')
  let l:degrade = &wrap && !g:wheel#scroll_on_wrap
  if a:visual ==# ''
    if a:cmd
      if l:degrade || l:ln <= l:threshold
        let l:keys = "gj"
      else
        let l:keys = "gj\<C-E>"
      endif
    else
      if l:degrade || (line('$') - l:ln) < l:threshold
        let l:keys = "gk"
      else
        let l:keys = "gk\<C-Y>"
      endif
    endif
  else          " some kind of visual
    if a:cmd
      if l:degrade
        let l:keys = "gvgj"
      else
        let l:keys = "gvgj\<C-E>"
      endif
    else
      if l:degrade
        let l:keys = "gvgk"
      else
        let l:keys = "gvgk\<C-Y>"
      endif
    endif
  endif
  exe "silent normal! " . l:keys
endfunction

function! wheel#HScroll(cmd, visual)
  " cmd: 0=left 1=right
  if a:visual ==# ''
    if &wrap
      if a:cmd
        let l:keys = "l"
      else
        let l:keys = "h"
      endif
    else
      let l:c = col('.')
      let l:e = col('$')
      if a:cmd
        if l:c <# (l:e - &sidescrolloff - 1)
          let l:keys = "zll"
        elseif l:c <# (l:e - 1)
          let l:keys = "l"
        endif
      elseif l:c ># &sidescrolloff
        let l:keys = "zhh"
      elseif l:c ># 1
        let l:keys = "h"
      endif
    endif
  else          " some kind of visual
    if &wrap
      if a:cmd
          let l:keys = "gvl"
      else
          let l:keys = "gvh"
      endif
    else
      if a:cmd
          let l:keys = "gvzll"
      else
          let l:keys = "gvzhh"
      endif
    endif
  endif
  exe "silent normal! " . l:keys
endfunction

let g:wheel#autoloaded = 1
