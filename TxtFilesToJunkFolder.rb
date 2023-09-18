require 'fileutils'

include Glimmer

shell {
  minimum_size 400, 100
  text "File Organizer"

  button{
    text "Relocate .txt files to folder?"

    on_widget_selected do
      Dir.mkdir("junk")
      
      s = Dir["./*.txt"]

      s.each { |file|
        FileUtils.mv(file, './junk') 
      }

      message_box {
	text "Surprise"
	message "The deed has been done. Check your directory"
      }.open
    end
  }
}.open