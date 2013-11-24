require 'dollar'
require 'franc'

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

describe "test currency" do
  context "Dollar => 'USD'" do
    it { expect( Money.dollar(1).currency ).to eq("USD")  }
  end
  context "Franc => 'CHF'" do
    it { expect( Money.franc(1).currency ).to eq("CHF")  }
  end
end
