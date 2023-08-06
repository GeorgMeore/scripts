# My personal scripts.

### `bm`
A `dmenu`-based bookmarking utility.

It looks for files in `~/.bm/` and treats them as a list of bookmark categories.
Each of those files is assumed to be a list of bookmarks with the following structure:
```
A human readable bookmark description
	https://some-url-preceeded-by-a-single-tab
```

First the script lets you select one or more categories, then you can select one or more
bookmarks from the selected categories and then they are opened in your browser.

### `brt`
My-machine-specific script for controlling the display backlight.

### `clip`
Just a convenience wrapper around `xclip` that uses `clipboard` selection by default.

### `ffrec`
A script for screen recording that uses `dmenu` and `ffmpeg`.

When called this script prompts if you want to start recording
and then starts an `ffmpeg` process.
If you call it once more it asks you if you want to stop recording
and then terminates the recording.

### `howto`
This script is kind of like `bm`, but a little different.

When started it reads `~/.howto` file that is assumed to have
the following format:
```
Some one-line description of some thing
	A body which is a sequence of tab-indented lines.
	This could be a list of commands to do the described thing.
```
Then the script lets you select one of the descriptions via `fzf` and
then prints the body of the selected one.

### `mmv`
This script allows you to mass-move files.

It takes a list of files to move as arguments and opens a temporary file containing those names
one per line with your `$EDITOR` (names are assumed to have no newlines).
You can then edit it. When the editor is closed, the files are moved.

### `news`
A script for viewing rss feed updates.

The script checks feed files (in TSV format) and shows a menu with entries that are
newer than the last check date (which is the timestamp of the file
`~/.sfeed/last` which is updated every time `news` is called).
You can select entries that you are interested in and they will be opened in the browser.
It is also possible to specify the starting date in the arguments
(e.g `news day ago` will show you items that are less than one day old).
`news` itself doesn't actually fetch or parse rss feeds - this job is done by `sfeed`.

### `pw`
`pw` takes a command along with its arguments and runs it only when all of stdin is read.

It is useful in situations where you want to run multiple interactive commands in one pipeline.
For example, `find -type d | fzf | xargs -d'\n' ls | pw fzf`: if you didn't use `pw` both
instances of `fzf` would try to output to the terminal at the same time.
Another use case would be building pipelines that both read and modify some file.
For example, `grep foo somefile | pw tee somefile`: without `pw` the contents of `somefile`
would just be deleted.

### `sb`
This is a statusline generator script, it is written in `bash` and
is a relatively more compilcated one.

When started (via `sb run`) the script reads its configuration from `~/.sbrc`,
which describes what modules are there and how often their values need to
be refreshed, and starts outputting the statusline to stdout.

Example configuration file:
```
# module that shows date and time
# this function is called every time when module value needs to be updated
datetime() {
	# set a variable with the same name to the desired value
	datetime=$(printf 'date: %(%a %-e %b %H:%M:%S)T')
}

# refresh 3 times a second
frequency=3

# specify the order and refresh frequencies of the modules
modules=(
	# renew the datetime module value on every second refresh
	datetime:2
)
```

`sb` also supports on-demand updating of module values via `sb upd MODULE`.
For example, in my configuration, there is `rss` module that shows me the
number of new items (since I last checked them via `news`) in my rss feeds.
Usually, it is updated every two minutes. But when I actually run `news` it explicitly
requests an update (via `sb upd rss`), and I can see in my statusbar right away
that there are no new items.

### `shot`
A wrapper around `maim`. It provides flags for specifying what
part of the screen needs to be saved (full or manually selected region),
and what to do with the image (save to a file, open in the image viewer or copy to the clipboard).
It also takes care to enable (and disable afterwards) the touchpad (if it is switched off)
if manual selection is used.

### `tp`
My-machine-specific script for controlling the touchpad.
