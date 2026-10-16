
build/native-perf-run/guest-code-diagnostic-20261015/report-branches/guest-f03b1-6eae557c00.o:	file format elf32-i386

Disassembly of section .text:

000f03b1 <trace>:
   f03b1:      	movl	0x34(%esp), %eax
   f03b5:      	movl	(%eax), %edx
   f03b7:      	movl	(%edx), %ecx
   f03b9:      	movb	0x241(%ecx), %al
   f03bf:      	cmpb	$0x14, %al
   f03c1:      	movl	%edx, 0x14(%esp)
   f03c5:      	jne	0xf056c <trace+0x1bb>
