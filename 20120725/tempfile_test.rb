require 'tempfile'
1000.times do |i|
  tempfile = Tempfile.new("tmp", ".")
  #p tempfile.path
  p tempfile
end

sleep 10

