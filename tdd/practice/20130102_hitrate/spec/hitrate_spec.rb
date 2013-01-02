# encoding: utf-8
require 'hitrate'

describe "打率" do
  context "#initialize" do
    it "make instance" do 
      rate = Rate.new(5, 4, 1)
    end
  end
  describe "#rate" do
    let(:rate) { Rate.new(daseki, dasuu, anda ) }
    subject { rate.rate }
    context "5,4,1 => 0.250" do
      let(:daseki) { 5 }
      let(:dasuu)  { 4 }
      let(:anda)   { 1 }
      it { should == "0.250" }
    end
    context "5,4,2 => 0.500" do
      let(:daseki) { 5 }
      let(:dasuu)  { 4 }
      let(:anda)   { 2 }
      it { should == "0.500" }
    end
    context "when daseki = 0 (0,0,0) => nil" do
      let(:daseki) { 0 }
      let(:dasuu)  { 0 }
      let(:anda)   { 0 }
      it { should be_nil }
    end
    context "when daseki is not 0 and dasuu = 0 (2,0,0) => 0.000" do
      let(:daseki) { 2 }
      let(:dasuu)  { 0 }
      let(:anda)   { 0 }
      it { should == "0.000" }
    end
  end
  describe "#format_rate" do
    let(:rate) { Rate.new(daseki, dasuu, anda ) }
    subject { rate.format_rate }
    context "5,4,1 => .250" do
      let(:daseki) { 5 }
      let(:dasuu)  { 4 }
      let(:anda)   { 1 }
      it { should == ".250" }
    end
    context "5,4,2 => .500" do
      let(:daseki) { 5 }
      let(:dasuu)  { 4 }
      let(:anda)   { 2 }
      it { should == ".500" }
    end
    context "5,4,4 => 1.00" do
      let(:daseki) { 5 }
      let(:dasuu)  { 4 }
      let(:anda)   { 4 }
      it { should == "1.00" }
    end
    context "when daseki = 0 (0,0,0) => ----" do
      let(:daseki) { 0 }
      let(:dasuu)  { 0 }
      let(:anda)   { 0 }
      it { should == "----" }
    end
    context "when daseki is not 0 and dasuu = 0 (2,0,0) => 0.000" do
      let(:daseki) { 2 }
      let(:dasuu)  { 0 }
      let(:anda)   { 0 }
      it { should == ".000" }
    end
  end
end

