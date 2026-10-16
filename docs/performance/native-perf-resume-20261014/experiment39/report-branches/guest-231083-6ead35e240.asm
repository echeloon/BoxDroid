
build/native-perf-run/guest-code-diagnostic-20261015/report-branches/guest-231083-6ead35e240.o:	file format elf32-i386

Disassembly of section .text:

00231083 <trace>:
  231083:      	movl	0x14(%esp), %ecx
  231087:      	movl	0x28(%esp), %edi
  23108b:      	movl	0x1c(%esp), %eax
  23108f:      	andl	$0xf, %eax
  231092:      	addl	0x4488a8(,%eax,4), %edx
  231099:      	jns	0x23109f <trace+0x1c>
