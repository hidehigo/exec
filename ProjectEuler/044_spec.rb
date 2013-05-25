require './044'

describe "euler044" do
  describe "check class" do
    it { eu = Euler044.new }
  end
  before(:all) do
    @eu = Euler044.new
  end
  describe "#add_penta" do 
    context "check method" do
      it { @eu.add_penta(3) }
    end
    context "2nd penta" do
      it { @eu.add_penta(2).should == 5 }
    end
    context "4th penta" do
      it { @eu.add_penta(4).should == 22 }
    end
  end
  describe "#expand_penta" do
    context "check method" do
      it { @eu.expand_penta(20) }
    end
    context "check max of penta" do
      it do
        ret = @eu.expand_penta(12)
        ret.should >= 12
      end
      it do
        ret = @eu.expand_penta(35)
        ret.should >= 35
      end
    end
  end
  describe "#is_penta?" do
    context "check method" do 
      it { @eu.is_penta?(35) }
    end
    context "check result" do
      it "35 is penta" do
        @eu.is_penta?(35).should be_true
      end
      it "116 is not penta" do
        @eu.is_penta?(116).should be_false
      end
      it "117 is penta "do
        @eu.is_penta?(117).should be_true
      end
    end
  end
end
