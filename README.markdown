# vim-wheel

> Screen-anchored cursor movement for Vim

<br/>

- - -
![demo](screenshots/demo2.gif)
- - -

# Features

This plugin merges the standard cursor movement of `j` and `k` with the
scrolling of `<CTRL-E>` and `<CTRL-Y>` to produce a new screen-anchored
cursor movement. This roughly emulates movement when using a trackpad or
scroll wheel.

* By default, two keys are mapped: `<CTRL-J>` (like `j`) moves towards the
  end of buffer and `<CTRL-K>` (like `k`) move towards its beginning
* Movement is tied to trackpad/scroll wheel for ‘natural’ scrolling
* Due to Vim’s inherent jumpiness with `wrap` enabled, behavior will
  degrade to `gj` and `gk` (more details below)
* Supports Visual selection
* Pure Vimscript with no dependencies

## Installation

Install using Pathogen, Vundle, Neobundle, or your favorite Vim package
manager.

## Configuration

You can change the behavior of this plugin in your `.vimrc`:

For instance, you can change the default mappings:

```vim
let g:wheel#map#up   = '<c-k>' 
let g:wheel#map#down = '<c-j>'
```

### Trackpad/Scroll wheel behavior

By default the scroll behavior of the mouse will reflect this new
behavior. You can disable in your `.vimrc` if not desired.

* Natural - content tracks finger movement on trackpad
* Reverse - swiping down moves content up

```vim
let g:wheel#map#mouse = 1       " 1=natural, 0=disable, -1=reverse
```

### End of buffer threshold

_wheel_’s scrolling will cease when cursor nears the start or end of the
buffer, degrading to `gj` and `gk`. You can adjust this threshold in your
`.vimrc`:

```vim
let g:wheel#line#threshold = 5      " lines from start or end
```

### Behavior with wrap

By default, _wheel_’s scrolling behavior will cease when `wrap` is on,
degrading to `gj` and `gk`. This is due to the jumpiness of `CTRL-E` and
`CTRL-Y` on large blocks of wrapped text. (If someone can get this
working, a pull request would be welcome.)

If you don’t mind the jumpiness, you can enable scrolling in your
`.vimrc`:

```
let g:wheel#scroll_on_wrap = 0      " 0=disable (default), 1=enable
```

## See also

If you find this plugin useful, check out these others by [@reedes][re]:

* [vim-colors-pencil][cp] - color scheme for Vim inspired by IA Writer
* [vim-lexical][lx] - building on Vim’s spell-check and thesaurus/dictionary completion
* [vim-litecorrect][lc] - lightweight auto-correction for Vim
* [vim-one][vo] - make use of Vim’s _+clientserver_ capabilities 
* [vim-pencil][pn] - Rethinking Vim as a tool for writers
* [vim-textobj-quote][qu] - extends Vim to support typographic (‘curly’) quotes
* [vim-textobj-sentence][ts] - improving on Vim's native sentence motion command
* [vim-thematic][th] - modify Vim’s appearance to suit your task and environment 
* [vim-wordy][wo] - uncovering usage problems in writing 

[re]: http://github.com/reedes
[cp]: http://github.com/reedes/vim-colors-pencil
[vo]: http://github.com/reedes/vim-one
[pn]: http://github.com/reedes/vim-pencil
[lx]: http://github.com/reedes/vim-lexical
[lc]: http://github.com/reedes/vim-litecorrect
[qu]: http://github.com/reedes/vim-textobj-quote
[ts]: http://github.com/reedes/vim-textobj-sentence
[th]: http://github.com/reedes/vim-thematic
[wo]: http://github.com/reedes/vim-wordy

## Future development

There’s an experimental horizontal scrolling movement hidden within for
those who wish to try it out.

If you’ve spotted a problem or have an idea on improving this plugin,
please post it to the github project issue page.

