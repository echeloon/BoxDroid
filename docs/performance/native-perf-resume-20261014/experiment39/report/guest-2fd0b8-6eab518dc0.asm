
build/native-perf-run/guest-code-diagnostic-20261015/report/guest-2fd0b8-6eab518dc0.o:	file format elf32-i386

Disassembly of section .text:

002fd0b8 <trace>:
  2fd0b8:      	pushl	$0x2fd10c               # imm = 0x2FD10C
  2fd0bd:      	movl	%fs:0x0, %eax
  2fd0c3:      	pushl	%eax
  2fd0c4:      	movl	0x10(%esp), %eax
  2fd0c8:      	movl	%ebp, 0x10(%esp)
  2fd0cc:      	leal	0x10(%esp), %ebp
  2fd0d0:      	subl	%eax, %esp
  2fd0d2:      	pushl	%ebx
  2fd0d3:      	pushl	%esi
  2fd0d4:      	pushl	%edi
  2fd0d5:      	movl	-0x8(%ebp), %eax
  2fd0d8:      	movl	%esp, -0x18(%ebp)
  2fd0db:      	pushl	%eax
  2fd0dc:      	movl	-0x4(%ebp), %eax
  2fd0df:      	movl	$0xffffffff, -0x4(%ebp) # imm = 0xFFFFFFFF
  2fd0e6:      	movl	%eax, -0x8(%ebp)
  2fd0e9:      	leal	-0x10(%ebp), %eax
  2fd0ec:      	movl	%eax, %fs:0x0
  2fd0f2:      	retl
