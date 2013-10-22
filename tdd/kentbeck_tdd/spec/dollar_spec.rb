# encoding: utf-8

require 'Dollar'
describe Dollar, "" do
  before { @five = Dollar.new(5) }
  describe "instantiation" do
    it { @five.sould_not be nil }
  end
  describe "times twice" do
    pending do
    it { @five.times(2) }
    end
  end
  describe "amount should be 10" do
    pending do
    it { @five.amount.should eq(10) }
    end
  end
end
