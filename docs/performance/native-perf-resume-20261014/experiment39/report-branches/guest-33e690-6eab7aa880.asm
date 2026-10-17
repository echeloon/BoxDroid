
build/native-perf-run/guest-code-diagnostic-20261015/report-branches/guest-33e690-6eab7aa880.o:	file format elf32-i386

Disassembly of section .text:

0033e690 <trace>:
  33e690:      	movl	0x8(%esp), %eax
  33e694:      	movl	0xc(%esp), %ecx
  33e698:      	movaps	(%eax), %xmm2
  33e69b:      	shufps	$0x0, %xmm2, %xmm2      # xmm2 = xmm2[0,0,0,0]
  33e69f:      	mulps	(%ecx), %xmm2
  33e6a2:      	movaps	(%eax), %xmm1
  33e6a5:      	shufps	$0x55, %xmm1, %xmm1     # xmm1 = xmm1[1,1,1,1]
  33e6a9:      	mulps	0x10(%ecx), %xmm1
  33e6ad:      	movaps	(%eax), %xmm0
  33e6b0:      	shufps	$0xaa, %xmm0, %xmm0     # xmm0 = xmm0[2,2,2,2]
  33e6b4:      	mulps	0x20(%ecx), %xmm0
  33e6b8:      	addps	%xmm1, %xmm2
  33e6bb:      	movaps	(%eax), %xmm1
  33e6be:      	shufps	$0xff, %xmm1, %xmm1     # xmm1 = xmm1[3,3,3,3]
  33e6c2:      	mulps	0x30(%ecx), %xmm1
  33e6c6:      	addps	%xmm0, %xmm2
  33e6c9:      	movaps	0x10(%eax), %xmm3
  33e6cd:      	shufps	$0x0, %xmm3, %xmm3      # xmm3 = xmm3[0,0,0,0]
  33e6d1:      	addps	%xmm1, %xmm2
  33e6d4:      	mulps	(%ecx), %xmm3
  33e6d7:      	movaps	0x10(%eax), %xmm1
  33e6db:      	shufps	$0x55, %xmm1, %xmm1     # xmm1 = xmm1[1,1,1,1]
  33e6df:      	mulps	0x10(%ecx), %xmm1
  33e6e3:      	movaps	0x10(%eax), %xmm0
  33e6e7:      	shufps	$0xaa, %xmm0, %xmm0     # xmm0 = xmm0[2,2,2,2]
  33e6eb:      	mulps	0x20(%ecx), %xmm0
  33e6ef:      	addps	%xmm1, %xmm3
  33e6f2:      	movaps	0x10(%eax), %xmm1
  33e6f6:      	shufps	$0xff, %xmm1, %xmm1     # xmm1 = xmm1[3,3,3,3]
  33e6fa:      	mulps	0x30(%ecx), %xmm1
  33e6fe:      	addps	%xmm0, %xmm3
  33e701:      	movaps	0x20(%eax), %xmm4
  33e705:      	shufps	$0x0, %xmm4, %xmm4      # xmm4 = xmm4[0,0,0,0]
  33e709:      	addps	%xmm1, %xmm3
  33e70c:      	mulps	(%ecx), %xmm4
  33e70f:      	movaps	0x20(%eax), %xmm1
  33e713:      	shufps	$0x55, %xmm1, %xmm1     # xmm1 = xmm1[1,1,1,1]
  33e717:      	mulps	0x10(%ecx), %xmm1
  33e71b:      	movaps	0x20(%eax), %xmm0
  33e71f:      	shufps	$0xaa, %xmm0, %xmm0     # xmm0 = xmm0[2,2,2,2]
  33e723:      	mulps	0x20(%ecx), %xmm0
  33e727:      	addps	%xmm1, %xmm4
  33e72a:      	movaps	0x20(%eax), %xmm1
  33e72e:      	shufps	$0xff, %xmm1, %xmm1     # xmm1 = xmm1[3,3,3,3]
  33e732:      	mulps	0x30(%ecx), %xmm1
  33e736:      	addps	%xmm0, %xmm4
  33e739:      	movaps	0x30(%eax), %xmm5
  33e73d:      	shufps	$0x0, %xmm5, %xmm5      # xmm5 = xmm5[0,0,0,0]
  33e741:      	addps	%xmm1, %xmm4
  33e744:      	mulps	(%ecx), %xmm5
  33e747:      	movaps	0x30(%eax), %xmm1
  33e74b:      	shufps	$0x55, %xmm1, %xmm1     # xmm1 = xmm1[1,1,1,1]
  33e74f:      	mulps	0x10(%ecx), %xmm1
  33e753:      	movaps	0x30(%eax), %xmm0
  33e757:      	shufps	$0xaa, %xmm0, %xmm0     # xmm0 = xmm0[2,2,2,2]
  33e75b:      	mulps	0x20(%ecx), %xmm0
  33e75f:      	addps	%xmm1, %xmm5
  33e762:      	movaps	0x30(%eax), %xmm1
  33e766:      	shufps	$0xff, %xmm1, %xmm1     # xmm1 = xmm1[3,3,3,3]
  33e76a:      	mulps	0x30(%ecx), %xmm1
  33e76e:      	movl	0x4(%esp), %ecx
  33e772:      	addps	%xmm0, %xmm5
  33e775:      	addps	%xmm1, %xmm5
  33e778:      	movaps	%xmm2, (%ecx)
  33e77b:      	movaps	%xmm3, 0x10(%ecx)
  33e77f:      	movaps	%xmm4, 0x20(%ecx)
  33e783:      	movaps	%xmm5, 0x30(%ecx)
  33e787:      	retl	$0xc
