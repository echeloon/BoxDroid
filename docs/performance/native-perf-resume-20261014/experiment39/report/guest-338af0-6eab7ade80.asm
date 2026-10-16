
build/native-perf-run/guest-code-diagnostic-20261015/report/guest-338af0-6eab7ade80.o:	file format elf32-i386

Disassembly of section .text:

00338af0 <trace>:
  338af0:      	movl	0x4(%esp), %eax
  338af4:      	movl	0x8(%esp), %edx
  338af8:      	pushl	%ebx
  338af9:      	movl	0x348ed8, %ebx
  338aff:      	pushl	%esi
  338b00:      	movl	%eax, %ecx
  338b02:      	shll	$0x6, %ecx
  338b05:      	pushl	%edi
  338b06:      	leal	0xc60(%ecx,%ebx), %edi
  338b0d:      	movl	$0x10, %ecx
  338b12:      	movl	%edx, %esi
  338b14:      	rep		movsl	(%esi), %es:(%edi)
