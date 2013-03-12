
require './043'

describe "euler043" do
  describe "check class" do
    it { Euler043.new(1406357289).should_not be_nil } 
  end
  before(:all) { 
    @eu = Euler043.new(1406357289) 
    @eu2 = Euler043.new(1406357298)
  }
  describe "#check_pan?" do
    context "check method and should be true" do
      it { @eu.should be_check_pan(1406357289) }
    end
    context "should be false" do
      it { @eu.should_not be_check_pan(1106357289) }
    end
    context "should be check instanse_value without arg" do
      it { @eu.should be_check_pan }
    end
  end
  describe "#pan getter/setter" do
    it "set then get" do
      @eu.pan = 1406357289
      @eu.pan.should == 1406357289
    end
  end
  describe "#get_partial" do
    context "check method" do
      it { @eu.partial(2).should == 406 }
      it { @eu.partial(8).should == 289 }
      it { @eu.partial(9).should be_false }
    end
  end
  describe "#check_partial" do
    context "check method" do
      it { @eu.check_partial(2).should be_true }
      it { @eu.check_partial(8).should be_true }
    end
    context "false case" do
      it { @eu2.check_partial(2).should be_true }
      it { @eu2.check_partial(8).should be_false }
    end
  end
  describe "#omoshiroi?" do
    context "check method" do
      it { @eu.should be_omoshiroi }
    end
    context "omoshirokunai" do
      it do
        @eu2.should_not be_omoshiroi
      end
    end
  end
end
