MyError = Class.new(StandardError)

MyError1 = Class.new(MyError)

err = MyError1.new
p err.class
p err.is_a?(StandardError)
p err.is_a?(MyError)


