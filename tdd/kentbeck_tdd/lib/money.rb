class Money
  attr_reader :amount
  def initialize(amount)
    @amount = amount
  end
  def equals?(money)
    return @amount == money.amount
  end
end
