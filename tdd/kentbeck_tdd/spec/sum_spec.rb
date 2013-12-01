require 'sum'
require 'money'

describe Sum, "#plus returns Sum" do
  before {
    @five = Money.dollar(5)
    @sum = @five.plus(@five)
  }
  context "check augend" do
    it { expect(@five).to eq(@sum.augend) }
  end
  context "check addend" do
    it { expect(@five).to eq(@sum.addend) }
  end
end

