# encoding: utf-8

require 'franc'

describe Franc, "#times" do
  before { @five = Franc.new(5) }
  describe "instantiation" do
    it { expect(@five).not_to be_nil }
  end
  context "times twice => amount should be 10" do
    it {
      expect(@five.times(2).equals?(Franc.new(10))).to be_true
    }
  end
  context "times three => amount should be 15" do
    it {
      expect(@five.times(3).equals?(Franc.new(15))).to be_true
    }
  end
end
