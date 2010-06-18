FlushServ is a Sinatra-powered web service which exposes the wonders of [toilet](http://caca.zoy.org/wiki/toilet) to the world.

### Usage

FlushServ requries that version 0.1 or higher of `toilet` be available. Your package manager probably has a copy ready to go. You'll also need [Sinatra](http://www.sinatrarb.com/) and [Haml](http://haml-lang.com/).

You may tell FlushServ where to find `toilet` and its list of fonts using the `TOILET_PATH` and `TOILET_FONTS_PATH` environment variables.

Start the service using `ruby flushserv.rb` or your preferred Sinatra deployment option.

Send a `GET` or `POST` request to FlushServ with a `message` parameter:

    $ curl 'http://localhost:4567/?message=Hello%20world!'
    m    m        ""#    ""#                                       ""#        #  m
    #    #  mmm     #      #     mmm         m     m  mmm    m mm    #     mmm#  #
    #mmmm# #"  #    #      #    #" "#        "m m m" #" "#   #"  "   #    #" "#  #
    #    # #""""    #      #    #   #         #m#m#  #   #   #       #    #   #  "
    #    # "#mm"    "mm    "mm  "#m#"          # #   "#m#"   #       "mm  "#m##  #

You may also use many standard toilet command-line options, e.g.

    $ curl 'http://localhost:4567/?message=Honk!&f=mono9'
    ▄    ▄               █        ▄   
    █    █  ▄▄▄   ▄ ▄▄   █   ▄    █   
    █▄▄▄▄█ █▀ ▀█  █▀  █  █ ▄▀     █   
    █    █ █   █  █   █  █▀█      ▀   
    █    █ ▀█▄█▀  █   █  █  ▀▄    █

The allowed switches are, in no particular order: `f, font, s, S, k, W, o, w, width, F, filter, gay, metal, E, export, irc` and `html`. See the [toilet man page](http://manpages.ubuntu.com/manpages/hardy/man1/toilet.1.html) for details.

#### Fonts

For a list of available fonts, visit `http://localhost:4567/fonts`. These fonts may be used with the `f` or `font` options.

### About

FlushServ was created by Ross Paffett, but would not be possible without the work of the creator of toilet, Sam Hocevar.

### License <small>(MIT)</small>

<small>Copyright © 2010 Ross Paffett.</small>

<small>Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:</small>

<small>The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.</small>

<small>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.</small>
