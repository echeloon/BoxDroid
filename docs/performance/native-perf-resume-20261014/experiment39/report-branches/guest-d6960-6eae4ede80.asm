
build/native-perf-run/guest-code-diagnostic-20261015/report-branches/guest-d6960-6eae4ede80.o:	file format elf32-i386

Disassembly of section .text:

000d6960 <trace>:
   d6960:      	pushl	%ebx
   d6961:      	pushl	%esi
   d6962:      	movl	0xc(%esp), %esi
   d6966:      	movl	0x60(%esi), %eax
   d6969:      	testb	$0x4, %al
   d696b:      	movl	%ecx, %ebx
   d696d:      	je	0xd697d <trace+0x1d>
