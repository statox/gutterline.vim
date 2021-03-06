*GutterLine.vim* Show the current line as a gutter sign
>
   _____       _   _            _      _
  / ____|     | | | |          | |    (_)
 | |  __ _   _| |_| |_ ___ _ __| |     _ _ __   ___
 | | |_ | | | | __| __/ _ \ '__| |    | | '_ \ / _ \
 | |__| | |_| | |_| ||  __/ |  | |____| | | | |  __/
  \_____|\__,_|\__|\__\___|_|  |______|_|_| |_|\___|
<

GutterLine.vim                                             *GutterLine.txt*

1. Introduction                                          |GutterLine-intro|
2. Configuration                                 |GutterLine-configuration|
3. About                                                 |GutterLine-about|

==============================================================================
1. Introduction                                          *GutterLine-intro*

This plugin allows you to easily see the current line by adding a sign in
the gutter.

==============================================================================
2. configuration                                 *GutterLine-configuration*

                                                    *GutterLine-updatetime*
GutterLine.vim use the |updatetime| option to refresh the sign in the gutter. By
default it is set to 4000 milliseconds. I tested this plugin with a setting of
300 ms:
>
    set updatetime=300
<
If you already have some autocommands relying on the |CursorHold| or
|CursorHoldI| or if you use swapfiles changing this setting may slow down Vim
because it will processes the autocommands and write the swap files more often.

I recommend that you test this setting and adjust it to get a response time you
like.

                                                *GutterLine-GutterLineSign*
GutterLine.vim has several several options which can be set by the user to
change its behavior.

You can change the string used to show the current line, by default it is `>`:
>
    let g:GutterLineSign='->'
<
                                              *GutterLine-GutterLineIgnore*
You can define a list of filetypes where the current line should not be shown in
the gutter. For example to ignore the helpfiles:
>
    let g:GutterLineIgnore=['help']
<
==============================================================================
3. About GutterLine                                      *GutterLine-about*

If you spot a bug in the plugin you can use the issue tracker:

https://github.com/statox/gutterline.vim/issues

Pull requests are also welcome!

vim:tw=75:ts=8:ft=help:norl:
