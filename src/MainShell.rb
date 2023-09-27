require "./FileTypes.rb"
require "../TxtFilesToJunkFolder.rb"

class MainShell
    include Glimmer

    def launch
        shell {
            minimum_size 1000, 1000
            tab_folder {
                tab_item {
                    text "Move files to junk folder"

                    row_layout {
                        type :horizontal
                    }
                    text "File Organizer"
        
                    file_type = FileTypes.new
        
                    label {
                        text "File type"
                    }
                    
                    combo (:read_only) {
                        selection bind(file_type, :extension)
                    }
        
                    button {
                        text "Submit"
                        on_widget_selected do
                            toJunkFolder(file_type.extension)
                        end
                    }
                }
            }
        }.open
    end
end