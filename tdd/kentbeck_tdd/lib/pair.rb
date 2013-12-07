class Pair
  attr_accessor :from, :to
  def initialize(from, to)
    @from = from
    @to = to
  end
  def eql?(obj)
    return @from == obj.from && @to == obj.to
  end
  def hash()
    return 0
  end
end
