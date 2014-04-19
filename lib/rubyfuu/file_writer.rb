require 'tempfile'

module Rubyfuu
  class FileWriter
    def initialize(target = :temp)
      if target == :temp
        @file = Tempfile.new("out.S")
      else
        @file = File.open(target, "w")
      end
    end

    def write(string, tab = true)
      @file.write "\t" if tab
      @file.write string
      @file.write "\n"
    end

    def path
      @file.path
    end

    def close
      @file.close
    end

    def unlink
      @file.unlink
    end
  end
end
