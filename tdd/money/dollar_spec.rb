require 'rubygems'
require 'rspec'
require './dollar.rb'

describe Dollar, 'with initial value 5' do
  before(:all) { @dollar = Dollar.new(5) } 
  subject { @dollar }
  it { subject.amount.should == 5 } 
  it { subject.times(2).should be_true }
  it { subject.amount.should == 10 }
end

