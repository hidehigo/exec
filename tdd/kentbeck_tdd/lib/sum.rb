require 'expression'
include Expression
class Sum
  attr_reader :augend, :addend
  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end
  def plus
    return new Sum(self, addend)
  end
  def reduce(to)
    amount = @augend.amount + @addend.amount
    return Money.new(amount, to)
  end
end
