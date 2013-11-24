# encoding: utf-8

require 'franc'

describe "test different class equality" do
  context "compare with Money and Franc" do
    it { expect( Money.new( 10, "CHF" ) ).to eq( Franc.new( 10, "CHF" ) ) }
  end
end
