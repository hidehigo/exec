# encoding: utf-8

require 'franc'

describe Franc, "#times" do
  before { @five = Money.franc(5) }
  describe "instantiation" do
    it { expect(@five).not_to be_nil }
  end
  context "times twice => amount should be 10" do
    it {
      expect(@five.times(2).equals?(Money.franc(10))).to be_true
    }
  end
  context "times three => amount should be 15" do
    it {
      expect(@five.times(3).equals?(Money.franc(15))).to be_true
    }
  end
end

describe Franc, "#equals" do
  before { @five = Franc.new(5) }
  context "compare with Franc.new(5)" do
    it { expect( @five.equals?(Franc.new(5)) ).to be_true }
  end
  context "compare with Franc.new(6)" do
    it { expect( @five.equals?(Franc.new(6)) ).to be_false }
  end
end

