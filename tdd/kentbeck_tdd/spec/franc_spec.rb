# encoding: utf-8

require 'franc'

describe Franc, "#times" do
  before { @five = Money.franc(5) }
  describe "instantiation" do
    it { expect(@five).not_to be_nil }
  end
  context "times twice => amount should be 10" do
    it {
      expect(@five.times(2) == Money.franc(10)).to be_true
    }
  end
  context "times three => amount should be 15" do
    it {
      expect(@five.times(3) == Money.franc(15)).to be_true
    }
  end
end

describe Franc, "#equals" do
  before { @five = Money.franc(5) }
  context "compare with Franc.new(5)" do
    it { expect( @five == Money.franc(5) ).to be_true }
  end
  context "compare with Franc.new(6)" do
    it { expect( @five == Money.franc(6) ).to be_false }
  end
end

describe "test different class equality" do
  context "compare with Money and Franc" do
    it { expect( Money.new( 10, "CHF" ) ).to eq( Franc.new( 10, "CHF" ) ) }
  end
end
