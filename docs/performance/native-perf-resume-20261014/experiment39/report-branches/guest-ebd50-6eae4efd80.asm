
build/native-perf-run/guest-code-diagnostic-20261015/report-branches/guest-ebd50-6eae4efd80.o:	file format elf32-i386

Disassembly of section .text:

000ebd50 <trace>:
   ebd50:      	movl	0xd8(%ebp), %eax
   ebd56:      	movl	(%eax,%ebx,4), %ecx
   ebd59:      	movl	0xc64(%esp), %edx
   ebd60:      	movl	0x18(%edx), %eax
   ebd63:      	movl	0x4e9a7c, %edx
   ebd69:      	leal	(%eax,%ecx,4), %esi
   ebd6c:      	movl	0x4e9a78, %eax
   ebd71:      	addl	$0x7, %eax
   ebd74:      	andl	$-0x8, %eax
   ebd77:      	leal	0x8(%eax), %ecx
   ebd7a:      	cmpl	%edx, %ecx
   ebd7c:      	movl	%ecx, 0x4e9a78
   ebd82:      	jbe	0xebda4 <trace+0x54>
