require 'fileutils'

include Glimmer

def toJunkFolder(extension)
  Dir.mkdir("junk")
  s = Dir["./*" + extension]
  s.each { |file|
    FileUtils.mv(file, './junk')
  }
end