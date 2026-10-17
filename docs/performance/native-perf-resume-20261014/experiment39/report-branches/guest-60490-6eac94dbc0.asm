
build/native-perf-run/guest-code-diagnostic-20261015/report-branches/guest-60490-6eac94dbc0.o:	file format elf32-i386

Disassembly of section .text:

00060490 <trace>:
   60490:      	pushl	%ecx
   60491:      	movl	%ecx, (%esp)
   60494:      	movl	0x8(%esp), %eax
   60498:      	movl	(%esp), %ecx
   6049b:      	movups	(%eax), %xmm4
   6049e:      	movups	0x10(%eax), %xmm5
   604a2:      	movups	0x20(%eax), %xmm6
   604a6:      	movups	0x30(%eax), %xmm7
   604aa:      	movss	(%ecx), %xmm0
   604ae:      	shufps	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
   604b2:      	mulps	%xmm4, %xmm0
   604b5:      	movss	0x4(%ecx), %xmm1
   604ba:      	shufps	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0]
   604be:      	mulps	%xmm5, %xmm1
   604c1:      	movss	0x8(%ecx), %xmm2
   604c6:      	shufps	$0x0, %xmm2, %xmm2      # xmm2 = xmm2[0,0,0,0]
   604ca:      	mulps	%xmm6, %xmm2
   604cd:      	addps	%xmm0, %xmm1
   604d0:      	movss	0xc(%ecx), %xmm3
   604d5:      	shufps	$0x0, %xmm3, %xmm3      # xmm3 = xmm3[0,0,0,0]
   604d9:      	mulps	%xmm7, %xmm3
   604dc:      	movss	0x10(%ecx), %xmm0
   604e1:      	shufps	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
   604e5:      	mulps	%xmm4, %xmm0
   604e8:      	addps	%xmm2, %xmm3
   604eb:      	movss	0x14(%ecx), %xmm2
   604f0:      	shufps	$0x0, %xmm2, %xmm2      # xmm2 = xmm2[0,0,0,0]
   604f4:      	mulps	%xmm5, %xmm2
   604f7:      	addps	%xmm1, %xmm3
   604fa:      	movss	0x18(%ecx), %xmm1
   604ff:      	shufps	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0]
   60503:      	mulps	%xmm6, %xmm1
   60506:      	movups	%xmm3, (%ecx)
   60509:      	addps	%xmm0, %xmm2
   6050c:      	movss	0x1c(%ecx), %xmm3
   60511:      	shufps	$0x0, %xmm3, %xmm3      # xmm3 = xmm3[0,0,0,0]
   60515:      	mulps	%xmm7, %xmm3
   60518:      	movss	0x20(%ecx), %xmm0
   6051d:      	shufps	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
   60521:      	mulps	%xmm4, %xmm0
   60524:      	addps	%xmm1, %xmm3
   60527:      	movss	0x24(%ecx), %xmm1
   6052c:      	shufps	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0]
   60530:      	mulps	%xmm5, %xmm1
   60533:      	addps	%xmm2, %xmm3
   60536:      	movss	0x28(%ecx), %xmm2
   6053b:      	shufps	$0x0, %xmm2, %xmm2      # xmm2 = xmm2[0,0,0,0]
   6053f:      	mulps	%xmm6, %xmm2
   60542:      	movups	%xmm3, 0x10(%ecx)
   60546:      	addps	%xmm0, %xmm1
   60549:      	movss	0x2c(%ecx), %xmm3
   6054e:      	shufps	$0x0, %xmm3, %xmm3      # xmm3 = xmm3[0,0,0,0]
   60552:      	mulps	%xmm7, %xmm3
   60555:      	movss	0x30(%ecx), %xmm0
   6055a:      	shufps	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
   6055e:      	mulps	%xmm4, %xmm0
   60561:      	addps	%xmm2, %xmm3
   60564:      	movss	0x34(%ecx), %xmm2
   60569:      	shufps	$0x0, %xmm2, %xmm2      # xmm2 = xmm2[0,0,0,0]
   6056d:      	mulps	%xmm5, %xmm2
   60570:      	addps	%xmm1, %xmm3
   60573:      	movss	0x38(%ecx), %xmm1
   60578:      	shufps	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0]
   6057c:      	mulps	%xmm6, %xmm1
   6057f:      	movups	%xmm3, 0x20(%ecx)
   60583:      	addps	%xmm0, %xmm2
   60586:      	movss	0x3c(%ecx), %xmm3
   6058b:      	shufps	$0x0, %xmm3, %xmm3      # xmm3 = xmm3[0,0,0,0]
   6058f:      	mulps	%xmm7, %xmm3
   60592:      	addps	%xmm1, %xmm3
   60595:      	addps	%xmm2, %xmm3
   60598:      	movups	%xmm3, 0x30(%ecx)
   6059c:      	popl	%ecx
   6059d:      	retl	$0x4
