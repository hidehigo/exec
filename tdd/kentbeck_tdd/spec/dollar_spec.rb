# encoding: utf-8

require 'dollar'
describe Dollar, "#times" do
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

