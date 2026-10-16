
build/native-perf-run/guest-code-diagnostic-20261015/report-branches/guest-2b1368-6eaead72c0.o:	file format elf32-i386

Disassembly of section .text:

002b1368 <trace>:
  2b1368:      	flds	(%eax)
  2b136a:      	movl	(%edx), %ebp
  2b136c:      	flds	(%esi)
  2b136e:      	movl	%ebp, 0x20(%esp)
  2b1372:      	fld	%st(1)
  2b1374:      	movl	0x14(%esp), %ebp
  2b1378:      	fsub	%st(1), %st
  2b137a:      	addl	$0x8, %ebx
  2b137d:      	fstps	0x10(%esp)
  2b1381:      	flds	(%ecx,%eax)
  2b1384:      	fsts	0x28(%esp)
  2b1388:      	fadds	0x20(%esp)
  2b138c:      	fstps	0x30(%esp)
  2b1390:      	fadd	%st(1), %st
  2b1392:      	fstps	(%eax)
  2b1394:      	fstp	%st(0)
  2b1396:      	flds	0x20(%esp)
  2b139a:      	fsubs	0x28(%esp)
  2b139e:      	fstps	(%esi)
  2b13a0:      	subl	%edi, %esi
  2b13a2:      	flds	-0x8(%ebx)
  2b13a5:      	flds	-0x4(%ebx)
  2b13a8:      	flds	0x30(%esp)
  2b13ac:      	fmul	%st(1), %st
  2b13ae:      	fld	%st(2)
  2b13b0:      	fmuls	0x10(%esp)
  2b13b4:      	faddp	%st, %st(1)
  2b13b6:      	fstps	(%ecx,%eax)
  2b13b9:      	addl	%edi, %eax
  2b13bb:      	fxch	%st(1)
  2b13bd:      	fmuls	0x30(%esp)
  2b13c1:      	fxch	%st(1)
  2b13c3:      	fmuls	0x10(%esp)
  2b13c7:      	fsubrp	%st, %st(1)
  2b13c9:      	fstps	(%edx)
  2b13cb:      	subl	%edi, %edx
  2b13cd:      	decl	%ebp
  2b13ce:      	movl	%ebp, 0x14(%esp)
  2b13d2:      	jne	0x2b1368 <trace>
