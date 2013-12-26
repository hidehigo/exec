require 'expression'
include Expression
class Sum
  attr_reader :augend, :addend
  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end
  def plus(addend)
    return Sum.new(self, addend)
  end
  def reduce(bank, to)
    amount = @augend.reduce(bank, to).amount + @addend.reduce(bank, to).amount
    return Money.new(amount, to)
  end
end
