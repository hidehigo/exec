# encoding: utf-8

require 'dollar'
describe Dollar, "#times" do
  five = Dollar.new(5)
  describe "instantiation" do
    it { expect(five).not_to be_nil }
  end
  context "times twice => amount should be 10" do
    it {
      five.times(2)
      expect(five.amount).to eq(10)
    }
  end
  context "times three => amount should be 15" do
    it {
      five.times(3)
      expect(five.amount).to eq(15)
    }
  end
end
