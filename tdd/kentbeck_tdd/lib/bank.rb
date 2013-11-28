class Bank
  def reduce( source, to )
    sum = source
    amount = sum.augend.amount + sum.addend.amount
    return Money.new(amount, to)
  end
end
