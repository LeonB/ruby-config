= ruby-config
    by Leon Bogaert
    http://www.vanutsteen.nl

== DESCRIPTION:



A different interface for the user-choices gem. The config can now be instantiated as an object and supports sub-configs and can be build from different files. The advantage is that you can ruby-config in a kinda plugin structure.

== FEATURES/PROBLEMS:

* No know problems. If you find one: please send it to me

== SYNOPSIS:

  conf = RubyConfig.new
  conf.add_source(UserChoices::CommandLineSource, :usage, 'Usage description')
  conf.add_option(:ssh, :type=>:boolean) { | command_line |
        command_line.uses_switch("-s", "--ssh",
          "Use ssh to open connection.")
      }
  conf.build
  p conf.ssh

  For more examples, see: http://user-choices.rubyforge.org

  There are a few minor changes. For example: user-choices uses add_choice while ruby-config uses add_option

== REQUIREMENTS:

* user-choices gem
* _why's metaid gems

== INSTALL:

* gem install ruby-config

== LICENSE:

(The MIT License)

Copyright (c) 2008 FIXME (different license?)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
