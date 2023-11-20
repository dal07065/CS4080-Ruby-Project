require "glimmer-dsl-swt"
require "fileutils"

# attempted to use this custom widget to enable changing directory by selecting a DirBtn
# unfortunately, observer hooks are useful for updating data in widgets, not the widgets themselves
class DirBtn
  include Glimmer::UI::CustomWidget

  attr_reader :name, :path

  def initialize(path, name)
    @path = path
    @name = name
  end

  def body
    button {
      text <= [self, :name]
      background rgb(247, 198, 109)

      on_widget_selected do
        FileUtils.cd(File.join(@path, @name))
      end
    }
  end
end
