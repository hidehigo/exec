require 'dollar'
class Money
  attr_reader :amount
  def initialize(amount)
    @amount = amount
  end
  def equals?(money)
    return @amount == money.amount && self.class == money.class
  end
  def self.dollar(amount)
    return Dollar.new(amount)
  end
end
