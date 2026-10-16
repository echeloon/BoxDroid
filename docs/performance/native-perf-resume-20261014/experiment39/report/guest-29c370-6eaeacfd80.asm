
build/native-perf-run/guest-code-diagnostic-20261015/report/guest-29c370-6eaeacfd80.o:	file format elf32-i386

Disassembly of section .text:

0029c370 <trace>:
  29c370:      	movl	0x34(%esp), %ecx
  29c374:      	flds	0x4(%ecx)
  29c377:      	movl	0x1c(%esp), %ecx
  29c37b:      	flds	(%ecx)
  29c37d:      	addl	$0x10, %eax
  29c380:      	flds	0x4(%ecx)
  29c383:      	movl	0x18(%esp), %ecx
  29c387:      	flds	(%ecx)
  29c389:      	subl	$0x10, %ebx
  29c38c:      	flds	0x4(%ecx)
  29c38f:      	movl	0x14(%esp), %ecx
  29c393:      	flds	(%ecx)
  29c395:      	flds	0x4(%ecx)
  29c398:      	movl	0x34(%esp), %ecx
  29c39c:      	movl	(%ecx), %ecx
  29c39e:      	fxch	%st(5)
  29c3a0:      	movl	%ecx, -0x18(%eax)
  29c3a3:      	fstps	-0x14(%eax)
  29c3a6:      	movl	0x1c(%esp), %ecx
  29c3aa:      	fxch	%st(2)
  29c3ac:      	fstps	-0x10(%eax)
  29c3af:      	addl	%esi, %ecx
  29c3b1:      	movl	%ecx, 0x1c(%esp)
  29c3b5:      	fxch	%st(1)
  29c3b7:      	movl	0x18(%esp), %ecx
  29c3bb:      	fstps	-0xc(%eax)
  29c3be:      	addl	%esi, %ecx
  29c3c0:      	fxch	%st(2)
  29c3c2:      	fstps	0xc(%ebx)
  29c3c5:      	movl	%ecx, 0x18(%esp)
  29c3c9:      	movl	0x14(%esp), %ecx
  29c3cd:      	fxch	%st(1)
  29c3cf:      	fstps	0x10(%ebx)
  29c3d2:      	addl	%esi, %ecx
  29c3d4:      	movl	%ecx, 0x14(%esp)
  29c3d8:      	movl	0x34(%esp), %ecx
  29c3dc:      	fstps	0x14(%ebx)
  29c3df:      	addl	%esi, %ecx
  29c3e1:      	decl	%edi
  29c3e2:      	fstps	0x18(%ebx)
  29c3e5:      	movl	%ecx, 0x34(%esp)
  29c3e9:      	jne	0x29c370 <trace>
