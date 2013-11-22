autoload :Dollar, 'dollar'
autoload :Franc, 'franc'
class Money
  attr_reader :amount, :currency
  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end
  def ==(money)
    return @amount == money.amount && @currency == money.currency
  end
  def self.dollar(amount)
    return Dollar.new(amount, "USD")
  end
  def self.franc(amount)
    return Franc.new(amount, "CHF")
  end
end
