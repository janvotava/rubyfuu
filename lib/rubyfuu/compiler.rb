module Rubyfuu
  class Compiler
    OPERATORS = {
      '+' => nil,
      '-' => nil,
      '>' => nil,
      '<' => nil,
      ',' => 'comma',
      '.' => 'period',
      '[' => 'left_bracket',
      ']' => 'right_bracket'
    }

    def initialize(readable, writable)
      @readable = readable
      @writable = writable
    end

    def write(*params)
      @writable.write(*params)
    end

    def build(outfile)
      link(compile, outfile)
    end

    def link
      raise Error::NotImplemented
    end

    def compile
      header
      while c = @readable.getc
        if OPERATORS.has_key?(c)
          parse(c)
        end
      end
      footer
      @writable.close
      @writable.path
    end

    def parse(char)
      public_send method_name(char)
    end

    def method_name(char)
      OPERATORS.each do |from,to|
        char.gsub!(from, to) if to
      end
      char
    end
  end
end
