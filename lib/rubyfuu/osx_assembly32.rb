module Rubyfuu
  class OSXAssembly32 < Assembly32
    def footer
      write <<EOF
\tpush $0
\tmov $0x1, %eax
\tsubl $0x4, %esp
\tint $0x80
EOF
    end

    def comma
      write 'push $0x1'
      write 'push %edi'
      write 'push $0x1'

      write 'mov $3, %eax'
      write 'subl $4, %esp'
      write 'int $0x80'
      write 'addl $16, %esp'
    end

    def period
      write 'push $1'
      write 'push %edi'
      write 'push $1'

      write 'mov $4, %eax'
      write 'subl $4, %esp'
      write 'int $0x80'
      write 'addl $16, %esp'
    end

    def link(source_path, outfile)
      tempfile = Tempfile.new(["out", ".o"])
      tempfile.close

      system "as -arch i386 -o #{tempfile.path} #{source_path} && ld -e _main -macosx_version_min 10.7.0 -o #{outfile} #{tempfile.path}"
      tempfile.unlink
    end
  end
end
