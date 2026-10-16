
build/native-perf-run/guest-code-diagnostic-20261015/report/guest-e9d69-6eae60ab80.o:	file format elf32-i386

Disassembly of section .text:

000e9d69 <trace>:
   e9d69:      	cmpb	$0x14, %al
   e9d6b:      	flds	0x14(%ebp)
   e9d6e:      	fsubs	0x64(%ebx)
   e9d71:      	flds	0x18(%ebp)
   e9d74:      	fsubs	0x68(%ebx)
   e9d77:      	flds	0x1c(%ebp)
   e9d7a:      	fsubs	0x6c(%ebx)
   e9d7d:      	fld	%st(0)
   e9d7f:      	fmul	%st(1), %st
   e9d81:      	fld	%st(2)
   e9d83:      	fmul	%st(3), %st
   e9d85:      	faddp	%st, %st(1)
   e9d87:      	fld	%st(3)
   e9d89:      	fmul	%st(4), %st
   e9d8b:      	faddp	%st, %st(1)
   e9d8d:      	fstps	0x20(%esp)
   e9d91:      	fstp	%st(0)
   e9d93:      	fstp	%st(0)
   e9d95:      	fstp	%st(0)
   e9d97:      	je	0xe9dca <trace+0x61>
