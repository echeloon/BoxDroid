
build/native-perf-run/guest-code-diagnostic-20261015/report-branches/guest-162173-6ead213ec0.o:	file format elf32-i386

Disassembly of section .text:

00162173 <trace>:
  162173:      	leal	0x500(%esp), %ecx
  16217a:      	addl	$0x4a0, %esi            # imm = 0x4A0
  162180:      	movl	%ecx, 0x1c(%esp)
  162184:      	movl	%esi, 0x18(%esp)
  162188:      	pushl	%ecx
  162189:      	pushl	%esi
  16218a:      	pushl	%edi
  16218b:      	pushl	%ebx
  16218c:      	movl	$0xab0, %ecx            # imm = 0xAB0
  162191:      	movl	0x2c(%esp), %esi
  162195:      	movl	0x28(%esp), %edi
  162199:      	movl	%ecx, %ebx
  16219b:      	shrl	$0x2, %ecx
  16219e:      	andl	$0x3, %ebx
  1621a1:      	rep		movsl	(%esi), %es:(%edi)
