require "./FileTypes.rb"

class MainShell
    include Glimmer

    def launch
        shell {
            minimum_size 1000, 1000
            text "File Organizer"

            file_types = FileTypes.new

            combo {
                selection bind(file_types, :extension)
            }
        }.open
    end
end