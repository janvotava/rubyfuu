require 'rubyfuu'
require 'thor'

module Rubyfuu
  class CLI < Thor
    desc "compile PATH", "Compile file & output it to the current directory"
    def compile(path)
      builder = Rubyfuu::Builder.new
      with_rescue { builder.build(path) }
    end

    desc "execute PATH", "Compile file and run it from temporary location"
    def execute(path)
      builder = Rubyfuu::Builder.new
      with_rescue { builder.run(path) }
    end

    desc "version", "Show Rubyfuu version"
    def version
      puts "Rubyfuu #{VERSION}"
    end

    private
    def with_rescue(&block)
      yield
    rescue Errno::ENOENT
      puts "File does not exist."
    end
  end
end
