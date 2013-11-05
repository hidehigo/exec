require 'money'
class Dollar
  attr_reader :amount
  def initialize(amount)
    @amount = amount 
  end
  def times(multiplier)
    return Dollar.new( @amount * multiplier )
  end
  def equals?(dollar)
    return true if @amount == dollar.amount
  end
end
