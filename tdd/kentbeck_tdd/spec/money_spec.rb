require 'money'

describe Money, "test equality" do
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

describe Money, "#times" do
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

describe Money, "test currency" do
  context "Dollar => 'USD'" do
    it { expect( Money.dollar(1).currency ).to eq("USD")  }
  end
  context "Franc => 'CHF'" do
    it { expect( Money.franc(1).currency ).to eq("CHF")  }
  end
end

describe Money, "test mixed addition" do
  context "$5 + 10 CHF = $10" do
    five_bucks = Money.dollar(5)
    ten_francs = Money.franc(10)
    bank = Bank.new
    bank.add_rate("CHF", "USD", 2)
    result = bank.reduce(five_bucks.plus(ten_francs), "USD")
    it { expect(result).to eq(Money.dollar(10)) }
  end
end
