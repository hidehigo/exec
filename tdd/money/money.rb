class Money
  def initialize(amount)
    @amount = amount
  end
  attr_reader :amount 
  def times(q)
    @amount *= q
  end
end
