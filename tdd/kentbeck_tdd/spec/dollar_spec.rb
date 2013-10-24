# encoding: utf-8

require 'dollar'
describe Dollar, "#times" do
  before { @five = Dollar.new(5) }
  describe "instantiation" do
    it { expect(@five).not_to be_nil }
  end
  context "times twice => amount should be 10" do
    it {
      @five.times(2)
      expect(@five.amount).to eq(10)
    }
  end
end
