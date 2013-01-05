# encoding: utf-8
require 'rspec'
require './040'

# 1桁が9個並ぶ
# 2桁が90個並ぶ 10~99
# 3桁が900個並ぶ 100~999

describe "040" do
  it "get instance" do
    @eu = Euler40.new
    @eu.should_not be_nil
  end
  describe "#order 桁数を返す" do
    before  { @eu = Euler40.new }
    subject { @eu.order(n) }
    context "return order of 8" do
      let(:n) { 8 }
      it { should == 1 } 
    end
    context "return order of 213" do
      let(:n) { 213 }
      it { should == 3 }
    end
    context "return order of 100" do
      let(:n) { 100 }
      it { should == 3 }
    end
  end
  describe "#get_number_of_a_position" do
    before  { @eu = Euler40.new }
    subject { @eu.get_number_of_a_position(n) }
    context "position:10 => 10" do
      let(:n) { 10 }
      it { should == [ 10, 1 ] } 
    end
    context "position:20 => 15" do
      let(:n) { 20 }
      it { should == [ 15, 1 ] }
    end
    context "position:11 => 10" do
      let(:n) { 11 }
      it { should == [ 10, 0 ] }
    end

  end
end
