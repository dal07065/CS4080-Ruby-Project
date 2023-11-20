require 'fileutils'

include Glimmer

def toJunkFolder(extension, sortType) 
  if !Dir.exist?(extension)
    directory_name = extension[1].upcase + extension[2..-1] + ' files'
    Dir.mkdir(directory_name) 
  end
  s = Dir["./*" + extension]
  s = sortBy(s, sortType)
  s.each { |file|
  FileUtils.mv(file, "./" + directory_name)
  puts Dir.children(directory_name)
  puts "--------------------------"
  
  }
end

def sortBy(files, sortType, ascending = true)
  if sortType == "name"
    files = files.sort
  elsif sortType == "date"
    files = files.sort_by{ |file| File.birthtime(file)}
  end

  if ascending != true
    files = files.reverse
  end

  return files
end
