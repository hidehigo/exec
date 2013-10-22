# encoding: utf-8
class Version
  attr_reader :family_number, :update_number
  @@regex = /^JDK(0|[1-9][0-9]*)u(0|[1-9][0-9]*)$/ 
  def initialize(family_number, update_number)
    @family_number = family_number
    @update_number = update_number
  end
  def self.valid?(str) 
    @@regex.match(str) ? true : false
  end
  def self.parse(str)
    raise unless valid?(str)
    @@regex.match(str)
    return new($1, $2)
  end
end
