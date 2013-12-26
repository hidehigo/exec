require 'sum'
require 'money'

describe Sum, "#plus returns Sum" do
  before {
    @five = Money.dollar(5)
    @sum = @five.plus(@five)
  }
  context "check augend" do
    it { expect(@five).to eq(@sum.augend) }
  end
  context "check addend" do
    it { expect(@five).to eq(@sum.addend) }
  end
end

describe Sum, "#plus" do
  context "sum plus money" do
    fiveBucks = Money.dollar(5)
    tenFrancs = Money.franc(10)
    bank = Bank.new
    bank.add_rate("CHF", "USD", 2)
    sum = Sum.new(fiveBucks, tenFrancs).plus(fiveBucks)
    result = bank.reduce(sum, "USD")
    it { expect(result).to eq(Money.dollar(15)) }
  end
end

