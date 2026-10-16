
build/native-perf-run/guest-code-diagnostic-20261015/report/guest-2d140-6eabc818c0.o:	file format elf32-i386

Disassembly of section .text:

0002d140 <trace>:
   2d140:      	movl	0x4(%esp), %eax
   2d144:      	leal	0x1(%eax), %edx
   2d147:      	movb	(%eax), %cl
   2d149:      	incl	%eax
   2d14a:      	testb	%cl, %cl
   2d14c:      	jne	0x2d147 <trace+0x7>
