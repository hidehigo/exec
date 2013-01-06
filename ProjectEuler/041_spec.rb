require './041'

describe "Pandigital" do
  context "make instance" do
    it { @pan = Pandigital.new(4) }
  end
  subject { Pandigital.new(4) }
  context "#check" do
    it { should_not be_check(1111) }
    it { should be_check(1234) }
  end
  context "#include" do
    it { should_not be_include(1111) }
    it { should be_include(1234) }
  end
  context "#get_next_biggest" do
    it { subject.get_next_biggest(4321).should == 4312 }
    it { subject.get_next_biggest(1234).should be_false }
  end
end
