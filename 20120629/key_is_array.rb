# encoding: UTF-8

def puts_hash (hash)
  hash.each do |key, val|
    print "key: ", key, " val: ", val, "\n"
  end
end

array = [0, 1, "str"]

hash = { :small => 0, :small2 => "0" }

# add hash elements
hash[:big] = "+1"

# value can be symbol
hash[:sym] = :symbol

# key needs to be symbol? =>error
#hash[str] = "str2"

hash[:array] = "key is symbol :array"

hash[array] = "key is array"

puts_hash(hash)

