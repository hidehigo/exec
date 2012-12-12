
require 'rspec'
require './bowling'

describe "" do
  before(:each) do
    @bl = Bowling.new
  end
  it "get instance" do 
    bl = Bowling.new
  end
  it "stroke 1 returns true" do
    @bl.stroke(1).should be_true
  end
  it "stroke 1, 1 -> score: 2" do
    @bl.stroke(1)
    @bl.stroke(1)
    @bl.score.should == 2
  end
  it "10 times stroke 0 -> score: 0" do
    10.times { @bl.stroke(0) }
    @bl.score.should == 0
  end
  it "10 times stroke 1 -> score: 10" do
    10.times { @bl.stroke(1) }
    @bl.score.should == 10
  end
end



