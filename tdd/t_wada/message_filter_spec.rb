require 'rubygems'
require 'rspec'
require './message_filter'

describe MessageFilter, 'with augument "foo"' do
  before() do
    @filter = MessageFilter.new('foo')
  end
  subject { @filter }
  it {
    should be_detect('hello from foo')
  }
  it {
    should_not be_detect('hello, world!')
  }
end
