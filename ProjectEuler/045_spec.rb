require './045'

describe "euler045" do
  describe "check class" do
    it { eu = Euler045.new }
  end
  before(:all) do
    @eu = Euler045.new
  end
  describe "#next_hex" do
    context "check method" do
      it { n = @eu.next_hex }
    end
    context "check first some value" do
      it do
        @eu2 = Euler045.new
        @eu2.next_hex.should == 1
        @eu2.next_hex.should == 6
        @eu2.next_hex.should == 15
      end
    end
  end
  describe "#is_penta?" do
    context "check value" do
      it { @eu.is_penta?(5).should be_true }
      it { @eu.is_penta?(6).should be_false }
      it { @eu.is_penta?(35).should be_true }
    end
  end
  describe "#is_tri?" do
    context "check value" do
      it { @eu.is_tri?(3).should be_true }
      it { @eu.is_tri?(11).should be_false }
      it { @eu.is_tri?(15).should be_true }
    end
  end
  describe "#run" do
    context "check method" do
      it { @eu.run.should_not be_false }
    end
  end
end
