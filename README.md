homebrew-avr
============

This repository contains the GNU AVR Toolchain as formulae for
[Homebrew](http://brew.sh).

AVR is a popular family of microcontrollers, used for example in the
[Arduino](http://arduino.cc) project.

Current Versions
----------------

- `gcc 5.4.0`
- `binutils 2.26.0`
- `avr-libc 2.0.0`
- `gdb 7.11`

Installing homebrew-avr formulae
--------------------------------

First, just `brew tap ubcsailbot/avr` and then `brew install <formula>`.

To install the entire AVR toolchain, do:

```Bash
# to tap the repository
brew tap ubcsailbot/avr

# to install the latests versions of avr-gcc, avr-gdb, and simavr
brew install avr-libc avr-gdb
brew install --HEAD simavr

This will pull in the prerequisites `avr-binutils` and `avr-gcc`.

Docs
----

`brew help`, `man brew`, or the Homebrew [wiki][].

Thanks
------

This repository is based on the works of:

- [WeAreLeka](https://github.com/WeAreLeka/homebrew-avr)
- [larsimmisch](https://github.com/larsimmisch/homebrew-avr)
- [plietar](https://github.com/plietar/homebrew-avr/)
- [0xPIT](https://github.com/0xPIT/homebrew-avr)

[Homebrew]: https://github.com/mxcl/homebrew
[Arduino]: http://arduino.cc
[wiki]: http://wiki.github.com/mxcl/homebrew
