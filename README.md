# Titan
[![Build Status](https://travis-ci.org/titan-lang/titan-compiler.svg?branch=master)](https://travis-ci.org/titan-lang/titan-compiler)

Titan is a programming language, based on the syntax and semantics of [Lua](http://www.lua.org), to
be a statically-typed, ahead-of-time compiled sister language to Lua. Converting Lua code to Titan
should yield a significant speedup, in some cases approaching the speed of C code. Unlike C, Titan
is garbage-collected, and has nice high-level programming features such as first-class functions,
objects, and generics. Unline other statically-typed, garbage-collected languages, Titan is
designed to interoperate seamlessly with Lua: Titan's native objects are kept in Lua's garbage-collected
heap, and can be traced by Lua's garbage collector. Titan objects can be passed to Lua code,
and Lua objects can be used by Titan code (although with a performance penalty compared to working
with Titan objects).

The Titan compiler is under development and it is still compiling Titan modules to Lua code,
but in the future it will compile them to C code.
For more information, please, see the [reference manual](https://github.com/titan-lang/titan-lang-docs/blob/master/manual.md).

# Requirements for running the compiler

1. Lua >= 5.3.0
1. [LPeg](http://www.inf.puc-rio.br/%7Eroberto/lpeg/) >= 1.0.0

# Install

Titan must be installed in a standard location; [LuaRocks](http://luarocks.org) will do this, and will also install the LPeg dependency automatically.

        $ [install luarocks]
        $ luarocks install titan-lang-scm-1.rockspec

# Usage

        $ tlc [options] [filename]

# Compiler options

        -h       print this help
        -d name  dump the AST (after typechecking) to file 'name'
        -o name  output to file 'name' (default is 'tlc.lua')
        -c       ansi colors on
        -p       print the AST in Metalua format (before typechecking)
        -s       strict mode on
        -v       print current version
        -w       warnings on (consistent-subtyping, unused locals)

# Runtime module loader

Titan also provides a runtime loader to use Titan modules on any
standard Lua virtual machine:

```lua
require "titan-lang"
package.path = "./?.tl;" .. package.path

-- It will load my_module.tl if it exists:
local my_module = require "my_module"
local my_file = loadfile "my_file.tl"
```

The loader functions use the file extension (chunk name extension in the cases
of load and loadstring) to decide whether it contains Titan (.tl) or plain
Lua. If you want to force loading the chunks as Titan you can use the
functions provided by the titan-lang module (these work like their standard Lua
counterparts):

```lua
local tl = require "titan-lang"
tl.loadstring(string, chunkname)
tl.load(func, chunkname)
tl.loadfile(filename)
tl.dofile(filename)
```

# License

Released under the MIT License (MIT)

Copyright (c) 2017 Project Titan Developers

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
