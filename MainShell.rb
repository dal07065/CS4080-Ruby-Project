require "glimmer-dsl-swt"
require "fileutils"
require "./src/SortTypes.rb"
require "./src/ToJunkFolder.rb"

class MainShell
  include Glimmer::UI::CustomShell
  attr_accessor :extension, :cwd, :sortType

  before_body do
    @extension = "txt"
    @cwd = Dir.pwd
    @sortType = SortTypes.new
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
                toJunkFolder(self.extension)
              end
            }
          }
        }

        tab_item {
          text "Sort files"
          grid_layout 2, true

          composite {
            layout_data :beginning, :center, true, false

            row_layout {
              type :horizontal
            }

            label {
              text "Sort type"
            }

            list {
              selection <=> [@sortType, :sortAttr]
            }
          }

          composite {
            layout_data :end, :center, true, false

            button {
              text "Submit"
              on_widget_selected do
                sortBy(Dir.entries('.'), self.sortType)
              end
            }
          }

          composite {
            layout_data :beginning, :center, true, false

            button {
              text "Sort all files"
              on_widget_selected do
                sortAll
              end
            }
          }
        }
      }

      composite {
        label {
          text <= [self, :cwd]
        }

        files = Dir.entries(@cwd).reject { |file| file == '.' || file == '..'}

        for f in files do
          if File.directory?(f) then
            button {
              text f
              background rgb(247, 198, 109)

              on_widget_selected do
                FileUtils.cd(File.join(@cwd, @name))
                @cwd = Dir.pwd
              end
            }
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
