
build/native-perf-run/guest-code-diagnostic-20261015/report/guest-608f0-6eac490a40.o:	file format elf32-i386

Disassembly of section .text:

000608f0 <trace>:
   608f0:      	subl	$0x44, %esp
   608f3:      	pushl	%esi
   608f4:      	pushl	%edi
   608f5:      	movl	%ecx, 0x8(%esp)
   608f9:      	movl	0x54(%esp), %eax
   608fd:      	movl	0x8(%esp), %ecx
   60901:      	movups	(%eax), %xmm4
   60904:      	movups	0x10(%eax), %xmm5
   60908:      	movups	0x20(%eax), %xmm6
   6090c:      	movups	0x30(%eax), %xmm7
   60910:      	leal	0xc(%esp), %eax
   60914:      	movss	(%ecx), %xmm0
   60918:      	shufps	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
   6091c:      	mulps	%xmm4, %xmm0
   6091f:      	movss	0x4(%ecx), %xmm1
   60924:      	shufps	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0]
   60928:      	mulps	%xmm5, %xmm1
   6092b:      	movss	0x8(%ecx), %xmm2
   60930:      	shufps	$0x0, %xmm2, %xmm2      # xmm2 = xmm2[0,0,0,0]
   60934:      	mulps	%xmm6, %xmm2
   60937:      	addps	%xmm0, %xmm1
   6093a:      	movss	0xc(%ecx), %xmm3
   6093f:      	shufps	$0x0, %xmm3, %xmm3      # xmm3 = xmm3[0,0,0,0]
   60943:      	mulps	%xmm7, %xmm3
   60946:      	movss	0x10(%ecx), %xmm0
   6094b:      	shufps	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
   6094f:      	mulps	%xmm4, %xmm0
   60952:      	addps	%xmm2, %xmm3
   60955:      	movss	0x14(%ecx), %xmm2
   6095a:      	shufps	$0x0, %xmm2, %xmm2      # xmm2 = xmm2[0,0,0,0]
   6095e:      	mulps	%xmm5, %xmm2
   60961:      	addps	%xmm1, %xmm3
   60964:      	movss	0x18(%ecx), %xmm1
   60969:      	shufps	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0]
   6096d:      	mulps	%xmm6, %xmm1
   60970:      	movups	%xmm3, (%eax)
   60973:      	addps	%xmm0, %xmm2
   60976:      	movss	0x1c(%ecx), %xmm3
   6097b:      	shufps	$0x0, %xmm3, %xmm3      # xmm3 = xmm3[0,0,0,0]
   6097f:      	mulps	%xmm7, %xmm3
   60982:      	movss	0x20(%ecx), %xmm0
   60987:      	shufps	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
   6098b:      	mulps	%xmm4, %xmm0
   6098e:      	addps	%xmm1, %xmm3
   60991:      	movss	0x24(%ecx), %xmm1
   60996:      	shufps	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0]
   6099a:      	mulps	%xmm5, %xmm1
   6099d:      	addps	%xmm2, %xmm3
   609a0:      	movss	0x28(%ecx), %xmm2
   609a5:      	shufps	$0x0, %xmm2, %xmm2      # xmm2 = xmm2[0,0,0,0]
   609a9:      	mulps	%xmm6, %xmm2
   609ac:      	movups	%xmm3, 0x10(%eax)
   609b0:      	addps	%xmm0, %xmm1
   609b3:      	movss	0x2c(%ecx), %xmm3
   609b8:      	shufps	$0x0, %xmm3, %xmm3      # xmm3 = xmm3[0,0,0,0]
   609bc:      	mulps	%xmm7, %xmm3
   609bf:      	movss	0x30(%ecx), %xmm0
   609c4:      	shufps	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
   609c8:      	mulps	%xmm4, %xmm0
   609cb:      	addps	%xmm2, %xmm3
   609ce:      	movss	0x34(%ecx), %xmm2
   609d3:      	shufps	$0x0, %xmm2, %xmm2      # xmm2 = xmm2[0,0,0,0]
   609d7:      	mulps	%xmm5, %xmm2
   609da:      	addps	%xmm1, %xmm3
   609dd:      	movss	0x38(%ecx), %xmm1
   609e2:      	shufps	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0]
   609e6:      	mulps	%xmm6, %xmm1
   609e9:      	movups	%xmm3, 0x20(%eax)
   609ed:      	addps	%xmm0, %xmm2
   609f0:      	movss	0x3c(%ecx), %xmm3
   609f5:      	shufps	$0x0, %xmm3, %xmm3      # xmm3 = xmm3[0,0,0,0]
   609f9:      	mulps	%xmm7, %xmm3
   609fc:      	addps	%xmm1, %xmm3
   609ff:      	addps	%xmm2, %xmm3
   60a02:      	movups	%xmm3, 0x30(%eax)
   60a06:      	movl	0x50(%esp), %eax
   60a0a:      	movl	$0x10, %ecx
   60a0f:      	leal	0xc(%esp), %esi
   60a13:      	movl	%eax, %edi
   60a15:      	rep		movsl	(%esi), %es:(%edi)
