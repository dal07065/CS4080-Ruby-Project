require 'fileutils'

include Glimmer

def toJunkFolder(extension) 
  if !Dir.exist?(extension)
    directory_name = extension[1].upcase + extension[2..-1] + ' files'
    Dir.mkdir(directory_name) 
  end
  s = Dir["./*" + extension]
  s.each { |file|
  FileUtils.mv(file, "./" + directory_name)
  }
end