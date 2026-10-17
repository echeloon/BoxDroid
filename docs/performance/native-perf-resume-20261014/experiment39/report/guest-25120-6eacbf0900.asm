
build/native-perf-run/guest-code-diagnostic-20261015/report/guest-25120-6eacbf0900.o:	file format elf32-i386

Disassembly of section .text:

00025120 <trace>:
   25120:      	pushl	%esi
   25121:      	pushl	%edi
   25122:      	movl	0x10(%esp), %esi
   25126:      	movl	0xc(%esp), %edx
   2512a:      	movl	0x14(%esp), %edi
   2512e:      	flds	(%esi)
   25130:      	flds	0x4(%esi)
   25133:      	fxch	%st(1)
   25135:      	flds	0x8(%esi)
   25138:      	fxch	%st(1)
   2513a:      	fld	%st(0)
   2513c:      	fmuls	0xc(%edx)
   2513f:      	fld	%st(1)
   25141:      	fmuls	0x18(%edx)
   25144:      	fxch	%st(2)
   25146:      	fmuls	0x24(%edx)
   25149:      	fxch	%st(4)
   2514b:      	fld	%st(0)
   2514d:      	fmuls	0x10(%edx)
   25150:      	fld	%st(1)
   25152:      	fmuls	0x1c(%edx)
   25155:      	fxch	%st(2)
   25157:      	fmuls	0x28(%edx)
   2515a:      	fxch	%st(1)
   2515c:      	faddp	%st, %st(3)
   2515e:      	faddp	%st, %st(5)
   25160:      	faddp	%st, %st(2)
   25162:      	fxch	%st(2)
   25164:      	fld	%st(0)
   25166:      	fmuls	0x14(%edx)
   25169:      	fld	%st(1)
   2516b:      	fmuls	0x20(%edx)
   2516e:      	fxch	%st(2)
   25170:      	fmuls	0x2c(%edx)
   25173:      	fxch	%st(1)
   25175:      	faddp	%st, %st(4)
   25177:      	faddp	%st, %st(4)
   25179:      	faddp	%st, %st(1)
   2517b:      	fxch	%st(1)
   2517d:      	fstps	(%edi)
   2517f:      	fstps	0x4(%edi)
   25182:      	fstps	0x8(%edi)
   25185:      	popl	%edi
   25186:      	popl	%esi
   25187:      	retl
