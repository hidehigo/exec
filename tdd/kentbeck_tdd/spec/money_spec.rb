require 'dollar'
require 'franc'

describe "test equality" do
  context "compare Franc with Dollar.new(5)" do
    it { expect( Franc.new(5).equals?(Dollar.new(5)) ).to be_false }
  end
end

