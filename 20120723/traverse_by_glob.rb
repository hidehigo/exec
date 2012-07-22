def traverse(path)
  Dir.glob( [ "#{path}/**/*", "#{path}/**/.*" ] ).each do |name|
    unless File.directory?(name)
      process_file(name)
    end
  end
end

def process_file(name)
  puts name
end

if ARGV[0]
  traverse(ARGV[0])
end
