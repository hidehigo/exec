class HelloWorld
  Version = "1.0"
  attr_accessor :name

  def initialize(myname="Ruby")
    @name = myname
  end

  def hello
    print "Hello, world. I am ", self.name, ".\n"
  end

  def oreore
    self.name = "Ruby"
  end

  def self.hello(name)
    print name, " said hello.\n"
  end
end

bob = HelloWorld.new("Bob")
alice = HelloWorld.new("Alice")
ruby = HelloWorld.new

bob.hello
alice.hello
ruby.hello

p bob.name
bob.name = "hide"
p bob.name
bob.hello
bob.oreore
bob.hello

HelloWorld.hello("John")
