class FileTypes
    attr_accessor :extension, :extension_options

    def initialize
        self.extension_options = [".txt", ".pdf"]
        self.extension = ".txt"
    end
end