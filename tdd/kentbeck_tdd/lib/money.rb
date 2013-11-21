autoload :Dollar, 'dollar'
autoload :Franc, 'franc'
class Money
  attr_reader :amount, :currency
  def initialize(amount)
    @amount = amount
    @currency
  end
  def ==(money)
    return @amount == money.amount && self.class == money.class
  end
  def self.dollar(amount)
    return Dollar.new(amount)
  end
  def self.franc(amount)
    return Franc.new(amount)
  end
end
