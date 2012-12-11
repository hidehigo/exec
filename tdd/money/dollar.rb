class Dollar
  def initialize(amount)
    @amount = amount
  end
  attr_reader :amount 
  def times(multiplier)
    @amount *= multiplier
  end
end
