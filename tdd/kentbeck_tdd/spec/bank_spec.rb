require 'bank'
require 'money'
require 'sum'

describe Bank, "#plus" do
  context "sinple addition with bank" do
    five = Money.dollar(5)
    sum = five.plus(five)
    bank = Bank.new
    reduced = bank.reduce(sum, "USD")
    it { expect(reduced).to eq(Money.dollar(10)) }
  end
end

describe Bank, "#reduce" do
  context "reduce sum" do
    sum = Sum.new(Money.dollar(3), Money.dollar(4))
    bank = Bank.new
    result = bank.reduce(sum, "USD")
    it { expect(result).to eq(Money.dollar(7)) }
  end
  context "reduce money" do
    bank = Bank.new
    result = bank.reduce(Money.dollar(1), "USD")
    it { expect(Money.dollar(1)).to eq(result) }
  end
end

describe Bank, "#reduce" do
  context "reduce money different currency" do
    bank = Bank.new
    bank.add_rate("CHF", "USD", 2)
    result = bank.reduce(Money.franc(2), "USD")
    it { expect(result).to eq(Money.dollar(1)) }
  end
end

describe Bank, "#rate" do
  context "identity rate" do
    bank = Bank.new
    it { expect(bank.rate("USD","USD")).to eq(1) }
  end
end
