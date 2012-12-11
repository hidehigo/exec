module HelloModule
  Version = "1.0"
  def hello(name)
    print "Hello, ", name, ".\n"
  end
  module_function :hello
end

module FooModule
  Version = "1.0"
  def fuga
    p "fugafuga"
  end
  def foo
    p self # Mix-inされるとselfはclassになる
  end
  #module_function :foo
end

p HelloModule::Version
HelloModule.hello("Alice")

include HelloModule
p Version
hello("hoge")

#FooModule.foo # module_fuctionで公開してなかったらNoMethodError

class MixInTest
  Version = "1.0"
  def fuga
    p "fuga"
  end
  include FooModule
end

a = MixInTest.new
a.foo
a.fuga # moduleよりもclass内が優先(そりゃそうか)
