require "glimmer-dsl-swt"
require "./src/FileTypes.rb"
require "./src/TxtFilesToJunkFolder.rb"

class MainShell
    include Glimmer::UI::CustomShell

    attr_accessor :default, :sortType

    before_body do
        self.default = "txt"
        self.sortType = "name"
    end

    body {
        shell {
            minimum_size 100, 100
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
                    
                    text {
                        layout_data :fill, :center, true, false
                        text <=> [self, :default]
                    }

                    label {
                        text "Sort type"
                    }
                    
                    text {
                        layout_data :fill, :center, true, false
                        text <=> [self, :sortType]
                    }
        
                    button {
                        text "Submit"
                        on_widget_selected do
                            toJunkFolder('.' + self.default, self.sortType)
                        end
                    }
                }
            }
        }.open
    }
end

MainShell.launch