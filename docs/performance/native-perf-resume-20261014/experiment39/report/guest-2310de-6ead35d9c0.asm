
build/native-perf-run/guest-code-diagnostic-20261015/report/guest-2310de-6ead35d9c0.o:	file format elf32-i386

Disassembly of section .text:

002310de <trace>:
  2310de:      	movl	0x20(%esp), %esi
  2310e2:      	movl	0x4488e8(,%edx,4), %eax
  2310e9:      	movw	%cx, (%esi)
  2310ec:      	addl	$0x2, %esi
  2310ef:      	testl	%ebp, %ebp
  2310f1:      	movl	%esi, 0x20(%esp)
  2310f5:      	je	0x231105 <trace+0x27>
