class SortTypes
  attr_accessor :sortAttr, :sortAttr_options

  def initialize
    self.sortAttr = "name"
    self.sortAttr_options = ["name", "date"]
  end
end
