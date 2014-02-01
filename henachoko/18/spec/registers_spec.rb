# encoding : utf-8
require 'registers'

describe Registers, "#visit" do
  context "最初の客が来る" do
    regi = Registers.new()
    regi.visit(3)
    it { expect(regi.waiting).to eq([3,0,0,0,0]) }
  end
  context "visit 3,4" do
    regi = Registers.new()
    regi.visit(3)
    regi.visit(4)
    it { expect(regi.waiting).to eq([3,4,0,0,0]) }
  end
  context "visit 3,4,1,1,1,1" do
    regi = Registers.new()
    regi.visit(3)
    regi.visit(4)
    regi.visit(1)
    regi.visit(1)
    regi.visit(1)
    regi.visit(1)
    it { expect(regi.waiting).to eq([3,4,2,1,1]) }
  end
end

describe Registers, "#transact" do
  context "transact when [9,9,9,9,9]" do
    regi = Registers.new()
    5.times { regi.visit(9) }
    regi.transact
    it { expect(regi.waiting).to eq([7,2,6,4,7]) }
  end
end




