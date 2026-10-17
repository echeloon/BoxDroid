
build/native-perf-run/guest-code-diagnostic-20261015/report-branches/guest-231116-6ead35de80.o:	file format elf32-i386

Disassembly of section .text:

00231116 <trace>:
  231116:      	movl	0x2c(%esp), %eax
  23111a:      	movl	0x3c(%esp), %edx
  23111e:      	decl	%eax
  23111f:      	movl	%eax, 0x2c(%esp)
  231123:      	jne	0x231060 <trace+0xffffffffffffff4a>
