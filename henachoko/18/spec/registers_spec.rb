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
  context "transact twice when [9,9,9,9,9]" do
    regi = Registers.new()
    5.times { regi.visit(9) }
    regi.transact
    regi.transact
    it { expect(regi.waiting).to eq([5,0,3,0,5]) }
  end
end

describe Registers, "#visit_x and #transact" do
  context "visit craimer after 9*5" do
    regi = Registers.new()
    5.times { regi.visit(9) }
    regi.visit_x()
    regi.transact
    it { expect(regi.waiting).to eq([8,2,6,4,7]) }
  end
  context "transact twice after visit craimer after (9*5 and transact)" do
    regi = Registers.new()
    5.times { regi.visit(9) }
    regi.transact
    regi.visit_x()
    regi.transact
    regi.transact
    it { expect(regi.waiting).to eq([3,1,0,0,3]) }
  end
end

describe Registers, "prepared tests" do
  IO.foreach('spec/case.txt') do |l|
    (input, expects) = l.split(/\s+/)
    expects = expects.split(/,/).map{|s|s.to_i}.to_a 
    #p [input, expects]
    context "case: #{input}" do
      regi = Registers.new()
      input.split(//).each do |c|
        case c 
        when "x" then
          regi.visit_x
        when "." then
          regi.transact
        else
          regi.visit(c.to_i)
        end
      end
      it { expect(regi.waiting).to eq(expects) }
    end
  end
end

