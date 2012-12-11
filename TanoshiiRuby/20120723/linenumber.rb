io = File.open("../README")
while line = io.gets
  printf("%3d %s", io.lineno, line)
end
