module Rubyfuu
  class LinuxAssembly32 < Assembly32
    def footer
      write <<EOF
\tmov $0, %ebx
\tmov $1, %eax
\tint $0x80
EOF
    end

    def period
      write 'mov $1, %edx'
      write 'mov %edi, %ecx'
      write 'mov $1, %ebx'
      write 'mov $4, %eax'
      write 'int $0x80'
    end

    def comma
      write 'mov $1, %edx'
      write 'mov %edi, %ecx'
      write 'mov $1, %ebx'
      write 'mov $3, %eax'
      write 'int $0x80'
    end

    def link(source_path, outfile)
      tempfile = Tempfile.new(["out", ".o"])
      tempfile.close

      system "as --32 -o #{tempfile.path} #{source_path} && ld -e _main -o #{outfile} #{tempfile.path}"
      tempfile.unlink
    end
  end
end
