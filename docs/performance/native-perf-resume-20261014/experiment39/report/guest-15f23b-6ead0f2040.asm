
build/native-perf-run/guest-code-diagnostic-20261015/report/guest-15f23b-6ead0f2040.o:	file format elf32-i386

Disassembly of section .text:

0015f23b <trace>:
  15f23b:      	movl	(%ebx), %ecx
  15f23d:      	imull	$0xf30, %edi, %edi      # imm = 0xF30
  15f243:      	addl	%ecx, %edi
  15f245:      	leal	0x30(%ebp), %esi
  15f248:      	movl	$0x3cc, %ecx            # imm = 0x3CC
  15f24d:      	rep		movsl	(%esi), %es:(%edi)
