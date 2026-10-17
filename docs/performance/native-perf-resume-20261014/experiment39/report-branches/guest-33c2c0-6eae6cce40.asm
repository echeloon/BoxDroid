
build/native-perf-run/guest-code-diagnostic-20261015/report-branches/guest-33c2c0-6eae6cce40.o:	file format elf32-i386

Disassembly of section .text:

0033c2c0 <trace>:
  33c2c0:      	prefetchnta	0x40(%esi)
  33c2c4:      	prefetchnta	0x60(%esi)
  33c2c8:      	movq	(%esi), %mm0
  33c2cb:      	movq	0x8(%esi), %mm1
  33c2cf:      	movq	0x10(%esi), %mm2
  33c2d3:      	movq	0x18(%esi), %mm3
  33c2d7:      	movq	0x20(%esi), %mm4
  33c2db:      	movq	0x28(%esi), %mm5
  33c2df:      	movq	0x30(%esi), %mm6
  33c2e3:      	movq	0x38(%esi), %mm7
  33c2e7:      	nop
  33c2e8:      	nop
  33c2e9:      	movntq	%mm0, (%edi)
  33c2ec:      	movntq	%mm1, 0x8(%edi)
  33c2f0:      	movntq	%mm2, 0x10(%edi)
  33c2f4:      	movntq	%mm3, 0x18(%edi)
  33c2f8:      	movntq	%mm4, 0x20(%edi)
  33c2fc:      	movntq	%mm5, 0x28(%edi)
  33c300:      	movntq	%mm6, 0x30(%edi)
  33c304:      	movntq	%mm7, 0x38(%edi)
  33c308:      	addl	$0x40, %esi
  33c30b:      	addl	$0x40, %edi
  33c30e:      	decl	%ecx
  33c30f:      	jne	0x33c2c0 <trace>
