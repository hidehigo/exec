# encoding: UTF-8

array = [0, 1, "str"]

hash = { :small => 0, :small2 => "0" }

# add hash elements
hash[:big] = "+1"

# value can be symbol
hash[:sym] = :symbol

# key needs to be symbol? =>error
hash[str] = "str2"

puts_hash()


def puts_hash
  hash.each do |n|
    puts n
  end
end

