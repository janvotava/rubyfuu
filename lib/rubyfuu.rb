require 'rubyfuu/version'

require 'rubyfuu/file_writer'

require 'rubyfuu/compiler'
require 'rubyfuu/assembly'
require 'rubyfuu/assembly32'
require 'rubyfuu/osx_assembly32'
require 'rubyfuu/linux_assembly32'

require 'tempfile'

module Rubyfuu
  class Builder
    def initialize(compiler = OSXAssembly32)
      @compiler = compiler
    end

    def build(source_path, destination = nil)
      base = source_path.chomp(File.extname(source_path) )

      destination ||= File.basename(base)

      writer = FileWriter.new
      reader = File.open(source_path, 'r')

      compiler = @compiler.new(reader, writer)
      compiler.build(destination)
    end

    def run(source_path)
      tmp = Tempfile.new("out")
      tmp.close
      out_path = tmp.path
      build(source_path, out_path)
      system out_path
      tmp.unlink
    end
  end
end
