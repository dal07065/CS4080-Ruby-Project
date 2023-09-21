require "./FileTypes.rb"

class MainShell
    include Glimmer

    def launch
        shell {
            minimum_size 1000, 1000
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

                on_widget_selected {
                    puts file_type.extension
                }
            }
        }.open
    end
end