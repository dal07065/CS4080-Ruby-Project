require "glimmer-dsl-swt"
require "fileutils"

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
