#!/usr/bin/ruby

#hsh = { "red" => 0xf00, "green" => 0x0f0 }
hsh = colors = hoge = { "red" => 0xf00, "green" => 0x0f0 }
hoge.each do |key, value|
  print key, " is ", value, "\n"
end

