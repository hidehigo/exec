require 'dollar'
require 'franc'

describe "test equality" do
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
