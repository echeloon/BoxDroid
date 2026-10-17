
build/native-perf-run/guest-code-diagnostic-20261015/report-branches/guest-22cf71-6ead362640.o:	file format elf32-i386

Disassembly of section .text:

0022cf71 <trace>:
  22cf71:      	movq	(%esi), %mm2
  22cf74:      	nop
  22cf75:      	movq	0x8(%esi), %mm3
  22cf79:      	pmulhw	%mm0, %mm2
  22cf7c:      	movq	0x10(%esi), %mm4
  22cf80:      	pmulhw	%mm0, %mm3
  22cf83:      	movq	0x18(%esi), %mm5
  22cf87:      	pmulhw	%mm0, %mm4
  22cf8a:      	psllw	$0x2, %mm2
  22cf8e:      	pmulhw	%mm0, %mm5
  22cf91:      	psllw	$0x2, %mm3
  22cf95:      	addl	$0x20, %edi
  22cf98:      	psllw	$0x2, %mm4
  22cf9c:      	addl	$0x20, %esi
  22cf9f:      	movq	%mm2, -0x20(%edi)
  22cfa3:      	psllw	$0x2, %mm5
  22cfa7:      	movq	%mm3, -0x18(%edi)
  22cfab:      	nop
  22cfac:      	movq	%mm4, -0x10(%edi)
  22cfb0:      	nop
  22cfb1:      	movq	%mm5, -0x8(%edi)
  22cfb5:      	nop
  22cfb6:      	decl	%ecx
  22cfb7:      	jne	0x22cf71 <trace>
