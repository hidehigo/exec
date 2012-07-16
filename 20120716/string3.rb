# ecoding: utf-8

hello = "hello, "
world = "world."
ref_hello = hello

# concat
hello.concat(world)
p hello
p ref_hello

# <<
hello << world
p hello
p ref_hello

# new str
hello = hello + world
p hello
p ref_hello
# ↑新しいobjで置き換えてるので、効率は悪い
