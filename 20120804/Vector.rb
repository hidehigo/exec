class Vector
  attr_reader :x, :y
  def initialize(x=0, y=0)
    @x, @y = x, y
  end
  def inspect
    "(#{@x}, #{@y})"
  end
  def +(other)
    Vector.new(@x + other.x, @y + other.y)
  end
  def -(other)
    Vector.new(@x - other.x, @y - other.y)
  end
  def +@
    self.dup
  end
  def -@
    Vector.new(-@x, -@y)
  end
  def ~@
    Vector.new(-@y, -@x)
  end

end

vec0 = Vector.new(3, 6)

p vec0
p +vec0
p -vec0
p ~vec0
