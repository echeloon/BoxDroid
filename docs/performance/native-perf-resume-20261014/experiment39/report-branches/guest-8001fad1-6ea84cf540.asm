
build/native-perf-run/guest-code-diagnostic-20261015/report-branches/guest-8001fad1-6ea84cf540.o:	file format elf32-i386

Disassembly of section .text:

8001fad1 <trace>:
8001fad1:      	movl	%eax, %ebx
8001fad3:      	shll	$0xc, %eax
8001fad6:      	leal	-0x7c010000(,%ebx,4), %edx
8001fadd:      	orl	$0x63, %eax
8001fae0:      	movl	%eax, (%edx)
8001fae2:      	nop
8001fae3:      	leal	-0x80000(%ebx), %esi
8001fae9:      	xorl	%eax, %eax
8001faeb:      	shll	$0xc, %esi
8001faee:      	movl	$0x400, %ecx            # imm = 0x400
8001faf3:      	movl	%esi, %edi
8001faf5:      	rep		stosl	%eax, %es:(%edi)
