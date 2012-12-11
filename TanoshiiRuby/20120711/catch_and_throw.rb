
catch(:exit) do
  i = 0
  loop do
    print "i:", i, "\n"
    i += 1
    for j in 1 .. 10
      print "j:",j, "\n"
      j += 1
      if i > 2 && j == 10
        throw :exit
      end
    end
  end
end



# test_throw

def test_throw
  throw :test
end

puts "test start"
catch(:test) do
  puts "before test_throw"
  test_throw()
  puts "after test_throw" # not executed
end

puts "test end"
