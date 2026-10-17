
build/native-perf-run/guest-code-diagnostic-20261015/report/guest-2d5169-6eaeab8f00.o:	file format elf32-i386

Disassembly of section .text:

002d5169 <trace>:
  2d5169:      	fld	%st(0)
  2d516b:      	fmul	%st(3), %st
  2d516d:      	fld	%st(2)
  2d516f:      	fmul	%st(5), %st
  2d5171:      	faddp	%st, %st(1)
  2d5173:      	fstps	0x14(%esp)
  2d5177:      	fxch	%st(1)
  2d5179:      	fmul	%st(2), %st
  2d517b:      	fxch	%st(1)
  2d517d:      	fmul	%st(3), %st
  2d517f:      	fsubrp	%st, %st(1)
  2d5181:      	fstps	0x20(%esp)
  2d5185:      	fstp	%st(0)
  2d5187:      	fstp	%st(0)
  2d5189:      	fld	%st(1)
  2d518b:      	fsubs	0x14(%esp)
  2d518f:      	fstps	(%eax,%edx,8)
  2d5192:      	flds	0x14(%esp)
  2d5196:      	fadd	%st(2), %st
  2d5198:      	fstps	(%eax)
  2d519a:      	flds	0x20(%esp)
  2d519e:      	fadd	%st(1), %st
  2d51a0:      	fstps	0x4(%eax)
  2d51a3:      	fsubs	0x20(%esp)
  2d51a7:      	fstps	0x4(%eax,%edx,8)
  2d51ab:      	addl	%esi, %eax
  2d51ad:      	fstp	%st(0)
  2d51af:      	flds	(%eax)
  2d51b1:      	flds	0x4(%eax)
  2d51b4:      	flds	(%eax,%edx,8)
  2d51b7:      	flds	0x4(%eax,%edx,8)
  2d51bb:      	flds	0x10(%ecx)
  2d51be:      	flds	0x14(%ecx)
  2d51c1:      	fld	%st(0)
  2d51c3:      	fmul	%st(3), %st
  2d51c5:      	addl	$0x20, %ecx
  2d51c8:      	fld	%st(2)
  2d51ca:      	fmul	%st(5), %st
