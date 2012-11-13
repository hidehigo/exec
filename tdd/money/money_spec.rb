require 'rubygems'
require 'rspec'
require './money.rb'

describe Money, 'with initial value 5' do
  before(:all) { @money = Money.new(5) } 
  subject { @money }
  it { subject.amount.should == 5 } 
  it { subject.times(2).should be_true }
  it { subject.amount.should == 10 }
end

