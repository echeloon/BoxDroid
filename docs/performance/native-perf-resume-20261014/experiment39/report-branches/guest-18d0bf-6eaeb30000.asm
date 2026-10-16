
build/native-perf-run/guest-code-diagnostic-20261015/report-branches/guest-18d0bf-6eaeb30000.o:	file format elf32-i386

Disassembly of section .text:

0018d0bf <trace>:
  18d0bf:      	incl	%ecx
  18d0c0:      	leal	0x5245(%edi,%ebp), %ebp
  18d0c7:      	movl	(%esi,%ebp,4), %ebp
  18d0ca:      	flds	0xc508(%esi,%ebp,4)
  18d0d1:      	shll	$0x6, %edx
  18d0d4:      	addl	%eax, %edx
  18d0d6:      	movl	0x14914(%esi,%edx,4), %edx
  18d0dd:      	leal	0x5245(%edi,%ebx), %ebx
  18d0e4:      	movl	(%esi,%ebx,4), %ebx
  18d0e7:      	fsubs	0xc508(%esi,%ebx,4)
  18d0ee:      	shll	$0x6, %ecx
  18d0f1:      	addl	%eax, %ecx
  18d0f3:      	movl	0x14914(%esi,%ecx,4), %ecx
  18d0fa:      	fmul	%st(3), %st
  18d0fc:      	flds	0xc508(%esi,%edx,4)
  18d103:      	movl	0x20(%esp), %ebx
  18d107:      	fsubs	0xc508(%esi,%ecx,4)
  18d10e:      	leal	(%edi,%eax), %ecx
  18d111:      	leal	(%ecx,%ecx,8), %edx
  18d114:      	leal	(%ebx,%edx,4), %ecx
  18d117:      	fmul	%st(5), %st
  18d119:      	leal	0x10(%ecx), %edx
  18d11c:      	fld	%st(0)
  18d11e:      	fmul	%st(1), %st
  18d120:      	fld	%st(2)
  18d122:      	fmul	%st(3), %st
  18d124:      	faddp	%st, %st(1)
  18d126:      	fadd	%st(3), %st
  18d128:      	fsqrt
  18d12a:      	fdivrs	0x3b17cc
  18d130:      	fsts	0x18(%esp)
  18d134:      	fmul	%st(2), %st
  18d136:      	fstps	0x24(%esp)
  18d13a:      	movl	0x24(%esp), %ebp
  18d13e:      	flds	0x18(%esp)
  18d142:      	movl	%ebp, (%edx)
  18d144:      	fmul	%st(1), %st
  18d146:      	fstps	0x28(%esp)
  18d14a:      	movl	0x28(%esp), %ebp
  18d14e:      	movl	%ebp, 0x4(%edx)
  18d151:      	fstp	%st(0)
  18d153:      	fstp	%st(0)
  18d155:      	flds	0x18(%esp)
  18d159:      	fmul	%st(2), %st
  18d15b:      	fstps	0x2c(%esp)
  18d15f:      	movl	0x2c(%esp), %ebp
  18d163:      	movl	%ebp, 0x8(%edx)
  18d166:      	leal	0x5245(%edi,%eax), %edx
  18d16d:      	movl	(%esi,%edx,4), %ebp
  18d170:      	movl	0x18914(%esi,%ebp,4), %ebp
  18d177:      	leal	(%esi,%edx,4), %edx
  18d17a:      	movl	%ebp, (%ecx)
  18d17c:      	movl	(%edx), %ebp
  18d17e:      	movl	0x1cb14(%esi,%ebp,4), %ebp
  18d185:      	movl	%ebp, 0x4(%ecx)
  18d188:      	movl	(%edx), %edx
  18d18a:      	movl	0xc508(%esi,%edx,4), %edx
  18d191:      	incl	%eax
  18d192:      	cmpl	$0x3f, %eax
  18d195:      	movl	%edx, 0x8(%ecx)
  18d198:      	movl	0x10(%esp), %ecx
  18d19c:      	jle	0x18d097 <trace+0xffffffffffffffd8>
