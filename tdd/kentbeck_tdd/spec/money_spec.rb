require 'money'

describe "test equality" do
  before { @five = Money.dollar(5) }
  context "compare with Dollar.new(5)" do
    it { expect( @five == Money.dollar(5) ).to be_true }
  end
  context "compare with Dollar.new(6)" do
    it { expect( @five == Money.dollar(6) ).to be_false }
  end
  context "compare Franc with Dollar.new(5)" do
    it { expect( Money.franc(5) == Money.dollar(5) ).to be_false }
  end
end

describe "#times" do
  before { @five = Money.dollar(5) }
  describe "instantiation" do
    it { expect(@five).not_to be_nil }
  end
  context "times twice => amount should be 10" do
    it {
      expect(@five.times(2) == Money.dollar(10)).to be_true
    }
  end
  context "times three => amount should be 15" do
    it {
      expect(@five.times(3) == Money.dollar(15)).to be_true
    }
  end
end

describe "test currency" do
  context "Dollar => 'USD'" do
    it { expect( Money.dollar(1).currency ).to eq("USD")  }
  end
  context "Franc => 'CHF'" do
    it { expect( Money.franc(1).currency ).to eq("CHF")  }
  end
end

describe "#plus" do
  context "sinple addition with bank" do
    five = Money.dollar(5)
    sum = five.plus(five)
    bank = Bank.new
    reduced = bank.reduce(sum, "USD")
    it { expect(reduced).to eq(Money.dollar(10)) }
  end
end

describe Sum, "plus returns Sum" do 
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

describe "#reduce" do
  context "reduce sum" do
    sum = Sum.new(Money.dollar(3), Money.dollar(4))
    bank = Bank.new
    result = bank.reduce(sum, "USD")
    it { expect(result).to eq(Money.dollar(7)) }
  end
end
