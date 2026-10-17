
build/native-perf-run/guest-code-diagnostic-20261015/report/guest-10ba3d-6eae8ffb00.o:	file format elf32-i386

Disassembly of section .text:

0010ba3d <trace>:
  10ba3d:      	movl	0x4f629c, %esi
  10ba43:      	prefetcht0	0x34(%ecx)
  10ba47:      	leal	(%eax,%eax,2), %eax
  10ba4a:      	shll	$0x3, %eax
  10ba4d:      	addl	%eax, %esi
  10ba4f:      	movl	(%esi), %ebp
  10ba51:      	movl	%edx, %edi
  10ba53:      	movl	%ebp, (%edi)
  10ba55:      	movl	0x4(%esi), %ebp
  10ba58:      	movl	%ebp, 0x4(%edi)
  10ba5b:      	movl	0x8(%esi), %esi
  10ba5e:      	movl	%esi, 0x8(%edi)
  10ba61:      	movl	0x4f629c, %esi
  10ba67:      	leal	0xc(%eax,%esi), %eax
  10ba6b:      	movl	(%eax), %edi
  10ba6d:      	movl	%ecx, %esi
  10ba6f:      	movl	%edi, (%esi)
  10ba71:      	movl	0x4(%eax), %edi
  10ba74:      	movl	%edi, 0x4(%esi)
  10ba77:      	movl	0x8(%eax), %eax
  10ba7a:      	movl	0x1c(%esp), %edi
  10ba7e:      	movl	%eax, 0x8(%esi)
  10ba81:      	movl	0x14(%esp), %eax
  10ba85:      	movl	0x140(%ebx), %esi
  10ba8b:      	movl	0x24(%esi,%edi), %ebp
  10ba8f:      	addl	$0xc, %eax
  10ba92:      	movl	%eax, 0x14(%esp)
  10ba96:      	movl	0x10(%esp), %eax
  10ba9a:      	addl	$0x20, %edx
  10ba9d:      	addl	$0x20, %ecx
  10baa0:      	incl	%eax
  10baa1:      	cmpl	%ebp, %eax
  10baa3:      	movl	%eax, 0x10(%esp)
  10baa7:      	jl	0x10ba30 <trace+0xfffffffffffffff3>
