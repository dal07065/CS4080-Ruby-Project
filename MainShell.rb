require "glimmer-dsl-swt"
require "./src/TxtFilesToJunkFolder.rb"
require "./src/Icons.rb"

class MainShell
    include Glimmer::UI::CustomShell
    attr_accessor :extension

    before_body do
        self.extension = "txt"
    end

  body {
    shell {
      text "File Organizer"
      grid_layout 1, true
      minimum_size 360, 360

            tab_folder {
                layout_data :fill, :beginning, true, false

                tab_item {
                    text "Move files to junk folder"
                    grid_layout 2, true

                    composite {
                        layout_data :beginning, :center, true, false

                        row_layout {
                            type :horizontal
                        }

                        label {
                            text "File type"
                        }

                        text {
                            text <=> [self, :extension]
                        }
                    }

                    composite {
                        layout_data :end, :center, true, false

                        button {
                            text "Submit"
                            on_widget_selected do
                                toJunkFolder('.' + @extension)
                            end
                        }
                    }
                }
            }

            composite {
                files = Dir.entries(Dir.pwd).reject { |file| file == '.' || file == '..'}

                for f in files do
                    if File.directory?(f) then
                        DirBtn.new(Dir.pwd, f).body
                    else
                        button {
                            text f
                        }
                    end
                end
            }
        }.open
    }
end

MainShell.launch
