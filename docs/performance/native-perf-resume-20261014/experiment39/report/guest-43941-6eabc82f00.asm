
build/native-perf-run/guest-code-diagnostic-20261015/report/guest-43941-6eabc82f00.o:	file format elf32-i386

Disassembly of section .text:

00043941 <trace>:
   43941:      	addl	$0x4, %esp
   43944:      	movl	-0x4(%ebp), %ecx
   43947:      	movl	0x8(%ebp), %edx
   4394a:      	movw	%ax, (%edx,%ecx,2)
   4394e:      	jmp	0x4391d <trace+0xffffffffffffffdc>
