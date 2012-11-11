require 'rubygems'
require 'rspec'
require './message_filter'

describe MessageFilter do
  share_examples_for 'MessageFilter with argument "foo"' do
    it { should be_detect('hello from foo') }
    it { should_not be_detect('hello, world!') }
    its(:ng_words) { should_not be_empty }
  end

  context 'with argument "foo"' do
    subject { MessageFilter.new('foo') }
    it_should_behave_like 'MessageFilter with argument "foo"'
    it { should have(1).ng_words }
  end

  context 'with argument "foo","bar"' do
    subject { MessageFilter.new('foo','bar') }
    it { should be_detect('hello from bar') }
    it_should_behave_like 'MessageFilter with argument "foo"'
    it { should have(2).ng_words }
  end
end
