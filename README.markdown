# vim-wheel

> Screen-anchored scrolling for Vim

# Features

Vim users may note that the relative window position of the cursor is
maintained when scrolling by half-page with <CTRL-U> and <CTRL-D>, at
least until the start or end of the buffer nears. The behavior can be seen
in other applications when using a track pad or mouse wheel to scroll.

This plugin takes Vim a step further in that direction:

* By default, two keys are mapped: <CTRL-J> scrolls doc up and <CTRL-K> down
* Cursor maintains screen row position when scrolling document with those keys
* This behavior tied to track pad/scroll wheel for ‘natural’ scrolling
* Due to Vim jumpiness, behavior is disabled when `Wrap` is enabled (more details below)
* Pure Vimscript with no dependencies

How is this behavior different from that of <CTRL-E> and <CTRL-Y>? For
those mappings, the cursor moves with the document with its position
relative to the screen changing. Useful, but meeting a different need.

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
behavior. You can disable if not desired. The ‘reverse’ style is

* Natural - content tracks finger movement on trackpad
* Reverse - swiping down moves content up

```vim
let g:wheel#map#mouse = 1       " 1=natural, 0=disable, -1=reverse
```

### End of buffer threshold

Normal cursor movement kicks in when cursor is this many lines from the
start or end of the buffer:

```vim
let g:wheel#line#threshold = 5
```

## See also

If you find this plugin useful, you may want to check out these others by
[@reedes][re]:

* [vim-colors-pencil][cp] - color scheme for Vim inspired by IA Writer
* [vim-lexical][lx] - building on Vim’s spell-check and thesaurus/dictionary completion
* [vim-litecorrect][lc] - lightweight auto-correction for Vim
* [vim-quotable][qu] - extends Vim to support typographic (‘curly’) quotes
* [vim-textobj-sentence][ts] - improving on Vim's native sentence motion command
* [vim-thematic][th] — modify Vim’s appearance to suit your task and environment 
* [vim-wordy][wo] - uncovering usage problems in writing 

[re]: http://github.com/reedes
[cp]: http://github.com/reedes/vim-colors-pencil
[lx]: http://github.com/reedes/vim-lexical
[lc]: http://github.com/reedes/vim-litecorrect
[qu]: http://github.com/reedes/vim-quotable
[ts]: http://github.com/reedes/vim-textobj-sentence
[th]: http://github.com/reedes/vim-thematic
[wo]: http://github.com/reedes/vim-wordy

## Future development

It’d be great to get _wheel_ to work with Wrap mode, but Vim’s CTRL-E and
CTRL-Y are too jumpy for Wrapped text. If someone can get this working,
a pull request would be welcome.

There’s an experimental horizontal scroll mode hidden within for those who
wish to try it out.

If you’ve spotted a problem or have an idea on improving this plugin,
please post it to the github project issue page.

