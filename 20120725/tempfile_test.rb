require 'tempfile'

tempfiles = Array.new

p "opening temp files"
10.times do |i|
  tempfile = Tempfile.new("tmp", ".")
  tempfiles << tempfile
  #p tempfile.path
  #p tempfile
end

p tempfiles
p "sleeping"
sleep 10

p "release tempfiles"
tempfiles = nil
sleep 10

p "program ends"

