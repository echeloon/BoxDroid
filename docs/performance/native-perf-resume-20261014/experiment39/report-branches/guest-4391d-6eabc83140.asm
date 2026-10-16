
build/native-perf-run/guest-code-diagnostic-20261015/report-branches/guest-4391d-6eabc83140.o:	file format elf32-i386

Disassembly of section .text:

0004391d <trace>:
   4391d:      	movl	-0x4(%ebp), %ecx
   43920:      	addl	$0x1, %ecx
   43923:      	movl	%ecx, -0x4(%ebp)
   43926:      	movl	0xc(%ebp), %edx
   43929:      	addl	-0x4(%ebp), %edx
   4392c:      	movsbl	(%edx), %eax
   4392f:      	testl	%eax, %eax
   43931:      	je	0x43950 <trace+0x33>
