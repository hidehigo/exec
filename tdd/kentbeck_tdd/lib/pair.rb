class Pair
  attr_accessor :from, :to
  #def initialize(from, to)
  #end
  def eql?(obj)
    return from == obj.from && to == obj.to
  end
  def hash_code()
    return 0
  end
end
