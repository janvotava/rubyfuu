module Rubyfuu
  class Assembly < Compiler
    def initialize(*params)
      super

      @loop_counter = 0
      @stack = []
    end

    def >
      write 'inc %edi'
    end

    def <
      write 'dec %edi'
    end

    def +
      write 'incb (%edi)'
    end

    def -
      write 'decb (%edi)'
    end

    def comma
      write 'push $0x1'
      write 'push %edi'
      write 'push $0x1'

      write 'mov $0x3, %eax'
      write 'subl $0x4, %esp'
      write 'int $0x80'
      write 'addl $16, %esp'
    end

    def period
      write 'push $0x1'
      write 'push %edi'
      write 'push $0x1'

      write 'mov $0x4, %eax'
      write 'subl $0x4, %esp'
      write 'int $0x80'
      write 'addl $16, %esp'
    end

    def left_bracket
      loop = @loop_counter+=1
      @stack << loop

      write 'cmpb $0, (%edi)'
      write "jz .LE#{loop}"
      write ".LS#{loop}:", false
    end

    def right_bracket
      loop = @stack.pop

      write 'cmpb $0, (%edi)'
      write "jnz .LS#{loop}"
      write ".LE#{loop}:", false
    end
  end
end
