
build/native-perf-run/guest-code-diagnostic-20261015/report/guest-231064-6ead35cd40.o:	file format elf32-i386

Disassembly of section .text:

00231064 <trace>:
  231064:      	movl	0x18(%esp), %esi
  231068:      	movsbl	(%esi), %eax
  23106b:      	movl	0x10(%esp), %ecx
  23106f:      	movl	0x24(%esp), %edi
  231073:      	incl	%esi
  231074:      	movl	%eax, 0x1c(%esp)
  231078:      	movl	%ebx, %edx
  23107a:      	movl	%esi, 0x18(%esp)
  23107e:      	sarl	$0x4, %eax
  231081:      	jmp	0x23108f <trace+0x2b>
