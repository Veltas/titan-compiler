package = "titan-lang"
version = "scm-1"
source = {
  url = "git://github.com/titan-lang/titan-compiler/titan-compiler.git"
}
description = {
  summary = "Titan Programming Language",
  detailed = [[
    Titan is a programming language, based on the syntax and semantics of Lua,
    to be a statically-typed, ahead-of-time compiled sister language to Lua.
    Converting Lua code to Titan should yield a significant speedup, in some
    cases approaching the speed of C code. Unlike C, Titan is garbage-collected,
    and has nice high-level programming features such as first-class functions,
    objects, and generics. Unline other statically-typed, garbage-collected languages,
    Titan is designed to interoperate seamlessly with Lua: Titan's native objects are
    kept in Lua's garbage-collected heap, and can be traced by Lua's garbage collector.
    Titan objects can be passed to Lua code, and Lua objects can be used by Titan code
    (although with a performance penalty compared to working with Titan objects).
  ]],
  homepage = "http://www.titan-lang.org",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "lpeg >= 1.0.0"
}
build = {
  type = "builtin",
  modules = {
    ["titan-lang.tlast"] = "titan-lang/tlast.lua",
    ["titan-lang.tlchecker"] = "titan-lang/tlchecker.lua",
    ["titan-lang.tlcode"] = "titan-lang/tlcode.lua",
    ["titan-lang.tlfilter"] = "titan-lang/tlfilter.lua",
    ["titan-lang.tllexer"] = "titan-lang/tllexer.lua",
    ["titan-lang.tlparser"] = "titan-lang/tlparser.lua",
    ["titan-lang.tlst"] = "titan-lang/tlst.lua",
    ["titan-lang.tltype"] = "titan-lang/tltype.lua",
    ["titan-lang.tldparser"] = "titan-lang/tldparser.lua"
  },
  install = {
    bin = { "tlc" },
    lua = {
      ["titan-lang.lib.base"] = "titan-lang/lib/base.tld",
      ["titan-lang.lib.coroutine"] = "titan-lang/lib/coroutine.tld",
      ["titan-lang.lib.package"] = "titan-lang/lib/package.tld",
      ["titan-lang.lib.string"] = "titan-lang/lib/string.tld",
      ["titan-lang.lib.utf8"] = "titan-lang/lib/utf8.tld",
      ["titan-lang.lib.table"] = "titan-lang/lib/table.tld",
      ["titan-lang.lib.math"] = "titan-lang/lib/math.tld",
      ["titan-lang.lib.io"] = "titan-lang/lib/io.tld",
      ["titan-lang.lib.os"] = "titan-lang/lib/os.tld",
      ["titan-lang.lib.debug"] = "titan-lang/lib/debug.tld"
    }
  }
}
