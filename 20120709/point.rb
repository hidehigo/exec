class Point
  attr_accessor :x, :y
  protected :x=, :y=

  def initialize(x=0.0, y=0.0)
    @x, @y = x, y
  end

  def swap(other)
    tmp_x, tmp_y = @x, @y
    @x, @y = other.x, other.y
    other.x, other.y = tmp_y, tmp_x # this is not error(同じclassのインスタンス同志)
    return other
  end
end

p "before:"
p0 = Point.new(1.0, 2.0)
p1 = Point.new(4.0, 5.0)
p [ p0.x, p0.y ]
p [ p1.x, p1.y ]

p "after:"
p2 = Point.new
p2 = p1.swap(p0)
p p0
p [ p0.x, p0.y ]
p p1
p [ p1.x, p1.y ]
p p2
p [ p2.x, p2.y ]

# protected method => error
p0.x = 10.0
