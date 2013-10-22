# encoding: utf-8

require 'dollar'
describe Dollar, "" do
  before { @five = Dollar.new(5) }
  describe "instantiation" do
    it { @five.should_not be nil }
  end
  describe "times twice" do
    it { @five.times(2) }
  end
  describe "amount should be 10" do
    it { @five.amount.should eq(10) }
  end
end
