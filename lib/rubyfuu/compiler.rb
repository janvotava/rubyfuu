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

    def compile
      header
      while c = @readable.getc
        c = c.chr
        if OPERATORS.has_key?(c)
          parse(c)
        end
      end
      footer
      @writable.close
      @writable.path
    end

    def parse(char)
      send method_name(char)
    end

    def method_name(char)
      OPERATORS[char] || char
    end
  end
end
