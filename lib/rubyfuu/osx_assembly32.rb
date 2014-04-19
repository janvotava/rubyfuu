module Rubyfuu
  class OSXAssembly32 < Assembly
    def header
      write <<EOF
.lcomm buffer1, 10000

.globl _main
_main:
\tmov $buffer1, %edi
EOF
    end

    def footer
      write <<EOF
\tpush $0
\tmov $0x1, %eax
\tsubl $0x4, %esp
\tint $0x80
EOF
    end

    def link(source_path, outfile)
      tempfile = Tempfile.new(["out", ".o"])
      tempfile.close

      system "as -arch i386 -o #{tempfile.path} #{source_path} && ld -e _main -macosx_version_min 10.7.0 -o #{outfile} #{tempfile.path}"
      tempfile.unlink
    end
  end
end
