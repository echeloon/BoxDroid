
build/native-perf-run/guest-code-diagnostic-20261015/report/guest-62560-6eac9518c0.o:	file format elf32-i386

Disassembly of section .text:

00062560 <trace>:
   62560:      	subl	$0x14, %esp
   62563:      	movl	%ecx, (%esp)
   62566:      	movl	0x1c(%esp), %eax
   6256a:      	movl	(%esp), %ecx
   6256d:      	movups	(%ecx), %xmm4
   62570:      	movups	0x10(%ecx), %xmm5
   62574:      	movups	0x20(%ecx), %xmm6
   62578:      	movups	0x30(%ecx), %xmm7
   6257c:      	movss	(%eax), %xmm0
   62580:      	shufps	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
   62584:      	mulps	%xmm4, %xmm0
   62587:      	movss	0x4(%eax), %xmm1
   6258c:      	shufps	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0]
   62590:      	mulps	%xmm5, %xmm1
   62593:      	movss	0x8(%eax), %xmm2
   62598:      	shufps	$0x0, %xmm2, %xmm2      # xmm2 = xmm2[0,0,0,0]
   6259c:      	mulps	%xmm6, %xmm2
   6259f:      	addps	%xmm1, %xmm0
   625a2:      	movss	0xc(%eax), %xmm3
   625a7:      	shufps	$0x0, %xmm3, %xmm3      # xmm3 = xmm3[0,0,0,0]
   625ab:      	mulps	%xmm7, %xmm3
   625ae:      	leal	0x4(%esp), %eax
   625b2:      	addps	%xmm3, %xmm2
   625b5:      	addps	%xmm2, %xmm0
   625b8:      	movups	%xmm0, (%eax)
   625bb:      	movl	0x18(%esp), %eax
   625bf:      	movl	0x4(%esp), %edx
   625c3:      	movl	%eax, %ecx
   625c5:      	movl	%edx, (%ecx)
   625c7:      	movl	0x8(%esp), %edx
   625cb:      	movl	%edx, 0x4(%ecx)
   625ce:      	movl	0xc(%esp), %edx
   625d2:      	movl	%edx, 0x8(%ecx)
   625d5:      	movl	0x10(%esp), %ecx
   625d9:      	movl	%ecx, 0xc(%eax)
   625dc:      	addl	$0x14, %esp
   625df:      	retl	$0x8
