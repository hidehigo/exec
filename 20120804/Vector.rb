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
end

vec0 = Vector.new(3, 6)
vec1 = Vector.new(1, 8)
vec2 = Vector.new

p vec0
p vec1
p vec2
p vec0 + vec1
p vec0 - vec1
