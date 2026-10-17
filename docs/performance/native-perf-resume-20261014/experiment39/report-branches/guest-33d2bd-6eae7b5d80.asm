
build/native-perf-run/guest-code-diagnostic-20261015/report-branches/guest-33d2bd-6eae7b5d80.o:	file format elf32-i386

Disassembly of section .text:

0033d2bd <trace>:
  33d2bd:      	movl	0x18(%esp), %ecx
  33d2c1:      	movl	$0x41e9c, (%eax)        # imm = 0x41E9C
  33d2c7:      	movl	%ecx, 0x4(%eax)
  33d2ca:      	movl	%esi, %ecx
  33d2cc:      	leal	0x114(%edi), %esi
  33d2d2:      	leal	0x8(%eax), %edi
  33d2d5:      	rep		movsl	(%esi), %es:(%edi)
