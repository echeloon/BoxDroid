
build/native-perf-run/guest-code-diagnostic-20261015/report/guest-250a0-6eacbeec00.o:	file format elf32-i386

Disassembly of section .text:

000250a0 <trace>:
   250a0:      	pushl	%esi
   250a1:      	pushl	%edi
   250a2:      	movl	0x10(%esp), %esi
   250a6:      	movl	0xc(%esp), %edx
   250aa:      	movl	0x14(%esp), %edi
   250ae:      	flds	(%esi)
   250b0:      	flds	0x4(%esi)
   250b3:      	flds	0x8(%esi)
   250b6:      	fxch	%st(2)
   250b8:      	fsubs	(%edx)
   250ba:      	fxch	%st(1)
   250bc:      	fsubs	0x4(%edx)
   250bf:      	fxch	%st(2)
   250c1:      	fsubs	0x8(%edx)
   250c4:      	fxch	%st(1)
   250c6:      	fld	%st(0)
   250c8:      	fmuls	0xc(%edx)
   250cb:      	fld	%st(1)
   250cd:      	fmuls	0x18(%edx)
   250d0:      	fxch	%st(2)
   250d2:      	fmuls	0x24(%edx)
   250d5:      	fxch	%st(4)
   250d7:      	fld	%st(0)
   250d9:      	fmuls	0x10(%edx)
   250dc:      	fld	%st(1)
   250de:      	fmuls	0x1c(%edx)
   250e1:      	fxch	%st(2)
   250e3:      	fmuls	0x28(%edx)
   250e6:      	fxch	%st(1)
   250e8:      	faddp	%st, %st(3)
   250ea:      	faddp	%st, %st(5)
   250ec:      	faddp	%st, %st(2)
   250ee:      	fxch	%st(2)
   250f0:      	fld	%st(0)
   250f2:      	fmuls	0x14(%edx)
   250f5:      	fld	%st(1)
   250f7:      	fmuls	0x20(%edx)
   250fa:      	fxch	%st(2)
   250fc:      	fmuls	0x2c(%edx)
   250ff:      	fxch	%st(1)
   25101:      	faddp	%st, %st(4)
   25103:      	faddp	%st, %st(4)
   25105:      	faddp	%st, %st(1)
   25107:      	fxch	%st(1)
   25109:      	fstps	(%edi)
   2510b:      	fstps	0x4(%edi)
   2510e:      	fstps	0x8(%edi)
   25111:      	popl	%edi
   25112:      	popl	%esi
   25113:      	retl
