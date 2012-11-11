require 'rubygems'
require 'rspec'
require './message_filter'

describe MessageFilter do
  before() do
    @filter = MessageFilter.new('foo')
  end
  it {
    @filter.should be_detect('hello from foo')
  }
  it {
    @filter.should_not be_detect('hello, world!')
  }
end
