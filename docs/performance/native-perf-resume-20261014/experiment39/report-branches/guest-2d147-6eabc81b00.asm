
build/native-perf-run/guest-code-diagnostic-20261015/report-branches/guest-2d147-6eabc81b00.o:	file format elf32-i386

Disassembly of section .text:

0002d147 <trace>:
   2d147:      	movb	(%eax), %cl
   2d149:      	incl	%eax
   2d14a:      	testb	%cl, %cl
   2d14c:      	jne	0x2d147 <trace>
