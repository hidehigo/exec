require 'rspec'
require './038.rb'

describe "pandegital class" do
  before { @pan = Pandigital.new }
  describe "check pan" do
    it { @pan.should be_pan(123456789) }
  end
  describe "check not pan" do
    it { @pan.should_not be_pan(111111112) }
  end
  describe "check length over 9digit" do
    it { @pan.should be_length_over(1234567891) }
  end
  describe "check length under 9digit" do
    it { @pan.should_not be_length_over(999999999) }
  end
  describe "get multiplyer ary when get pan" do
    it "should return multiplyer ary" do
      @pan.get_multiplyer(192).should == [1,2,3]
    end
  end
  describe "get multiplyer ary case 2" do
    it "should return mulplyer ary" do
      @pan.get_multiplyer(9).should == [1,2,3,4,5]
    end
  end
  describe "can't get multiplyer ary" do
    it "should return empty ary when can't get pan" do
      @pan.get_multiplyer(2).should == []
    end
  end
end
