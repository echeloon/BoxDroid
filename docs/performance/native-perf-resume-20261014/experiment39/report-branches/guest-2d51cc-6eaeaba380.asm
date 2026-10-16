
build/native-perf-run/guest-code-diagnostic-20261015/report-branches/guest-2d51cc-6eaeaba380.o:	file format elf32-i386

Disassembly of section .text:

002d51cc <trace>:
  2d51cc:      	faddp	%st, %st(1)
  2d51ce:      	fstps	0x14(%esp)
  2d51d2:      	fxch	%st(1)
  2d51d4:      	fmul	%st(2), %st
  2d51d6:      	fxch	%st(1)
  2d51d8:      	fmul	%st(3), %st
  2d51da:      	fsubrp	%st, %st(1)
  2d51dc:      	fstps	0x20(%esp)
  2d51e0:      	fstp	%st(0)
  2d51e2:      	fstp	%st(0)
  2d51e4:      	fld	%st(1)
  2d51e6:      	fsubs	0x14(%esp)
  2d51ea:      	fstps	(%eax,%edx,8)
  2d51ed:      	flds	0x14(%esp)
  2d51f1:      	fadd	%st(2), %st
  2d51f3:      	fstps	(%eax)
  2d51f5:      	flds	0x20(%esp)
  2d51f9:      	fadd	%st(1), %st
  2d51fb:      	fstps	0x4(%eax)
  2d51fe:      	fsubs	0x20(%esp)
  2d5202:      	fstps	0x4(%eax,%edx,8)
  2d5206:      	addl	%esi, %eax
  2d5208:      	fstp	%st(0)
  2d520a:      	flds	(%eax)
  2d520c:      	flds	0x4(%eax)
  2d520f:      	flds	(%eax,%edx,8)
  2d5212:      	flds	0x4(%eax,%edx,8)
  2d5216:      	flds	-0x8(%ecx)
  2d5219:      	flds	-0x4(%ecx)
  2d521c:      	fld	%st(0)
  2d521e:      	fmul	%st(3), %st
  2d5220:      	fld	%st(2)
  2d5222:      	fmul	%st(5), %st
  2d5224:      	faddp	%st, %st(1)
  2d5226:      	fstps	0x14(%esp)
  2d522a:      	fxch	%st(1)
  2d522c:      	fmul	%st(2), %st
  2d522e:      	fxch	%st(1)
  2d5230:      	fmul	%st(3), %st
  2d5232:      	fsubrp	%st, %st(1)
  2d5234:      	fstps	0x20(%esp)
  2d5238:      	fstp	%st(0)
  2d523a:      	fstp	%st(0)
  2d523c:      	fld	%st(1)
  2d523e:      	fsubs	0x14(%esp)
  2d5242:      	fstps	(%eax,%edx,8)
  2d5245:      	flds	0x14(%esp)
  2d5249:      	fadd	%st(2), %st
  2d524b:      	fstps	(%eax)
  2d524d:      	flds	0x20(%esp)
  2d5251:      	fadd	%st(1), %st
  2d5253:      	fstps	0x4(%eax)
  2d5256:      	fsubs	0x20(%esp)
  2d525a:      	fstps	0x4(%eax,%edx,8)
  2d525e:      	addl	%esi, %eax
  2d5260:      	decl	%edi
  2d5261:      	fstp	%st(0)
  2d5263:      	jne	0x2d5100 <trace+0xffffffffffffff34>
