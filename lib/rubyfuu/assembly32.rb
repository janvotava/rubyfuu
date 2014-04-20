module Rubyfuu
  class Assembly32 < Assembly
    def header
      write <<EOF
.lcomm buffer1, 10000

.globl _main
_main:
\tmov $buffer1, %edi
EOF
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
  end
end
