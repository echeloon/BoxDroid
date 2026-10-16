
build/native-perf-run/guest-code-diagnostic-20261015/report-branches/guest-2fa4e8-6eabf7fe00.o:	file format elf32-i386

Disassembly of section .text:

002fa4e8 <trace>:
  2fa4e8:      	pushl	%ebp
  2fa4e9:      	movl	%esp, %ebp
  2fa4eb:      	subl	$0x20, %esp
  2fa4ee:      	andl	$-0x10, %esp
  2fa4f1:      	fld	%st(0)
  2fa4f3:      	fsts	0x18(%esp)
  2fa4f7:      	fistpll	0x10(%esp)
  2fa4fb:      	fildll	0x10(%esp)
  2fa4ff:      	movl	0x18(%esp), %edx
  2fa503:      	movl	0x10(%esp), %eax
  2fa507:      	testl	%eax, %eax
  2fa509:      	je	0x2fa547 <trace+0x5f>
