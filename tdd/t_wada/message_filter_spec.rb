require 'rubygems'
require 'rspec'
require './message_filter'

describe MessageFilter do
  before() do
    @filter = MessageFilter.new('foo')
  end
  it 'shold detect message with NG word' do
    @filter.should be_detect('hello from foo')
  end
  it 'shold not detect message without NG word' do
    @filter.should_not be_detect('hello, world!')
  end
end
