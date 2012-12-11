class HelloWorld
  Version = "1.0"
  attr_accessor :name
  @@count = 0

  def initialize(myname="Ruby")
    @name = myname
  end

  def hello
    @@count += 1
    print "Hello, world. I am ", self.name, ".\n"
  end

  def oreore
    self.name = "Ruby"
  end

  class << self
    def hello(name)
      print name, " said hello.\n"
    end

    def count
      @@count
    end
  end
end

bob = HelloWorld.new("Bob")
alice = HelloWorld.new("Alice")
ruby = HelloWorld.new

p HelloWorld.count
bob.hello
alice.hello
ruby.hello

p HelloWorld.count
p bob.name
bob.name = "hide"
p bob.name
bob.hello
bob.oreore
bob.hello

p HelloWorld.count
HelloWorld.hello("John")
p HelloWorld.count
