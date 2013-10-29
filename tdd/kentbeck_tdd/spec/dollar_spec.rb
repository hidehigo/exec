# encoding: utf-8

require 'dollar'
describe Dollar, "#times" do
  before { @five = Dollar.new(5) }
  describe "instantiation" do
    it { expect(@five).not_to be_nil }
  end
  context "times twice => amount should be 10" do
    it {
      product = @five.times(2)
      expect(product.amount).to eq(10)
    }
  end
  context "times three => amount should be 15" do
    it {
      product = @five.times(3)
      expect(product.amount).to eq(15)
    }
  end
end

describe Dollar, "#equals" do
  before { @five = Dollar.new(5) }
  context "compare with Dollar.new(5)" do
    it { expect( @five.equals?(Dollar.new(5)) ).to be_true }
  end
  context "compare with Dollar.new(6)" do
    it { expect( @five.equals?(Dollar.new(6)) ).to be_false }
  end
end
