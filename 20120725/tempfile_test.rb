require 'tempfile'
1000.times do |i|
  tempfile = Tempfile.new("tmp", ".")
  #p tempfile.path
end

sleep 10

