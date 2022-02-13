# vim-wheel

> Screen-anchored cursor movement for Vim

<br/>

- - -
![demo](https://i.imgur.com/kTSkSB2.gif)
- - -

# Features

This plugin merges the standard cursor movement of `j` and `k` with the
scrolling of `<CTRL-E>` and `<CTRL-Y>` to produce a new screen-anchored
cursor movement. This roughly emulates movement when using a trackpad or
scroll wheel.

* By default, two keys are mapped: `<CTRL-J>` (like `j`) moves towards the
  end of buffer and `<CTRL-K>` (like `k`) move towards its beginning
* Movement is tied to trackpad/scroll wheel for ‘natural’ scrolling
* Due to Vim’s inherent jumpiness with `wrap` enabled, you have option to
  degrade to `gj` and `gk` (more details below)
* Supports Visual selection
* Pure Vimscript with no dependencies

## Installation

You can install using your favorite Vim package manager. (E.g.,
[Pathogen][pathogen], [Vundle][vundle], or [Plug][plug].) If you are using
a recent version of vim or neovim, you can also use native package
support. (See [:help packages][packages].)

[pathogen]: https://github.com/tpope/vim-pathogen
[vundle]: https://github.com/VundleVim/Vundle.vim
[plug]: https://github.com/junegunn/vim-plug
[packages]: https://vimhelp.org/repeat.txt.html#packages

## Configuration

You can change the behavior of this plugin in your `.vimrc`:

For instance, the default mappings of:

```vim
let g:wheel#map#up   = '<c-k>'
let g:wheel#map#down = '<c-j>'
```

...can be changed to use the Command key in MacVim:

```vim
let g:wheel#map#up   = '<D-k>'
let g:wheel#map#down = '<D-j>'
```

If you have any existing mappings to `<c-k>` or `<c-j>`, they will be
preserved.

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

With large blocks of wrapped text, Vim’s native scrolling with `CTRL-E`
and `CTRL-Y` can be jumpy. _wheel_ inherits this behavior, unfortunately.
If you would prefer that _wheel_ degrade to `gj` and `gk` when `wrap` is on,
you can disable the anchored scrolling in your `.vimrc`:

```
let g:wheel#scroll_on_wrap = 1      " 0=disable, 1=enable (default)
```

## See also

If you find this plugin useful, check out these others originally by
[@reedes][re]:

* [vim-colors-pencil][cp] - color scheme for Vim inspired by IA Writer
* [vim-lexical][lx] - building on Vim’s spell-check and thesaurus/dictionary completion
* [vim-litecorrect][lc] - lightweight auto-correction for Vim
* [vim-pencil][pn] - Rethinking Vim as a tool for writers
* [vim-textobj-quote][qu] - extends Vim to support typographic (‘curly’) quotes
* [vim-textobj-sentence][ts] - improving on Vim's native sentence motion command
* [vim-thematic][th] - modify Vim’s appearance to suit your task and environment
* [vim-wordy][wo] - uncovering usage problems in writing
* [vim-wordchipper][wc] - power tool for shredding text in Insert mode

[re]: https://github.com/reedes
[cp]: https://github.com/preservim/vim-colors-pencil
[pn]: https://github.com/preservim/vim-pencil
[lx]: https://github.com/preservim/vim-lexical
[lc]: https://github.com/preservim/vim-litecorrect
[qu]: https://github.com/preservim/vim-textobj-quote
[ts]: https://github.com/preservim/vim-textobj-sentence
[th]: https://github.com/preservim/vim-thematic
[wo]: https://github.com/preservim/vim-wordy
[wc]: https://github.com/preservim/vim-wordchipper

## Future development

There’s an experimental horizontal scrolling movement hidden within for
those who wish to try it out.

If you’ve spotted a problem or have an idea on improving this plugin,
please post it to the [GitHub project issue page][issues].

[issues]: https://github.com/preservim/vim-wheel/issues

