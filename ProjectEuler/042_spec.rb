# encodigns: utf-8
require './042'

describe "euler042" do
  context "make instance" do
    it { Euler042.new.should_not be_nil }
  end
  before(:all) do
    @eu = Euler042.new
  end
  describe "#tri(idx)" do
    context "method check" do
      it { @eu.tri(3).should_not be_nil }
    end
    context "check return val" do
      subject { @eu.tri(idx) }
      context do
        let(:idx){ 2 }
        it {should == 3}
      end
      context do
        let(:idx){ 3 }
        it {should == 6}
      end
    end
  end
  describe "#check?(num)" do
    context "method check" do
      it { @eu.should be_check(3) }
    end
    context "check return" do
      subject { @eu.check?(num) }
      context do
        let(:num){ 3 }
        it { should be_true }
      end
      context do
        let(:num){ 4 }
        it { should_not be_true }
      end
    end
  end
  describe "#check_word?(str)" do
    context "method check" do
      it { @eu.should be_check_word("sky") }
    end
    context "check word" do
      it { @eu.should be_check_word("sky") }
    end
    context "check word" do
      it { @eu.should_not be_check_word("sk") }
    end
  end
  describe "#get_val_of_word(str)" do
    context "method check" do
      it { @eu.get_val_of_word("sky").should be_true }
    end
    context "check return val" do
      it { @eu.get_val_of_word("sky").should == 55 }
    end
  end
  describe "#chr2idx(chr)" do
    context "method check" do
      it { @eu.chr2idx("a").should be_true }
    end
    context "error when given not 1 chr" do
      it { @eu.chr2idx("aa").should be_false }
    end
    context "check return val" do
      subject { @eu.chr2idx(chr) }
      context do
        let(:chr){ "a" }
        it { should == 1 }
      end
      context do
        let(:chr){ "b" }
        it { should == 2 }
      end
    end
  end
  #context "#check?(3)" do
  #  it { @eu.should be_check(3) }
  #end
  #context "#check?(5)" do
  #  it { @eu.should_not be_check(5) }
  #end
end
