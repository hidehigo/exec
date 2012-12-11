require 'find'

IGNORES = [ /^\./, /^CVS/]

def listdir(top)
  Find.find(top) do |path|
    if FileTest.directory?(path)
      dir, base = File.split(path)
      IGNORES.each do |re|
        if re =~ base
          Find.prune
        end
      end
    puts path
    end
  end
end

listdir(ARGV[0])
