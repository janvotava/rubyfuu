module Rubyfuu
  class Assembly < Compiler
    def initialize(*params)
      super

      @loop_counter = 0
      @stack = []
    end
  end
end
