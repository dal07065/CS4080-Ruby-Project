require 'fileutils'

def toJunkFolder(extension)
  directory_name = extension + "_junk"

  if !Dir.exist?(directory_name)
    Dir.mkdir(directory_name)
  end

  allFiles = Dir["./*" + extension]
  puts "\tMoved files:"

  allFiles.each { |file|
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

  puts "\tFiles sorted by " + sortType + ':'
  files.each { |f|
    puts f
  }
end

def sortAll()
  allFiles = Dir.entries('.').reject { |file|
    File.directory?(file)
  }

  allFiles.each { |f|
    directory_name = allFiles.length() > 1 ? f.split('.', -1)[1] + "_files" : "some_files"

    if !Dir.exist?(directory_name)
      Dir.mkdir(directory_name)
    end

    FileUtils.mv(f, directory_name)
  }
end
