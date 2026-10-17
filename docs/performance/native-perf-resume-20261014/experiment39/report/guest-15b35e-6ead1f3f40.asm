
build/native-perf-run/guest-code-diagnostic-20261015/report/guest-15b35e-6ead1f3f40.o:	file format elf32-i386

Disassembly of section .text:

0015b35e <trace>:
  15b35e:      	movl	0x88(%esi), %ecx
  15b364:      	movl	%ecx, 0x88(%ebx)
  15b36a:      	movl	0x8c(%esi), %edx
  15b370:      	movl	%edx, 0x8c(%ebx)
  15b376:      	movb	0x90(%esi), %al
  15b37c:      	movb	%al, 0x90(%ebx)
  15b382:      	movl	0x94(%esi), %ecx
  15b388:      	movl	%ecx, 0x94(%ebx)
  15b38e:      	movl	0x98(%esi), %edx
  15b394:      	movl	%edx, 0x98(%ebx)
  15b39a:      	movl	0x9c(%esi), %eax
  15b3a0:      	movl	%eax, 0x9c(%ebx)
  15b3a6:      	movl	0xa0(%esi), %ecx
  15b3ac:      	movl	%ecx, 0xa0(%ebx)
  15b3b2:      	movl	0xa4(%esi), %edx
  15b3b8:      	movl	%edx, 0xa4(%ebx)
  15b3be:      	movl	0xa8(%esi), %eax
  15b3c4:      	movl	%eax, 0xa8(%ebx)
  15b3ca:      	movl	0xac(%esi), %ecx
  15b3d0:      	movl	%ecx, 0xac(%ebx)
  15b3d6:      	movl	0xb0(%esi), %edx
  15b3dc:      	movl	%edx, 0xb0(%ebx)
  15b3e2:      	movl	0xb4(%esi), %eax
  15b3e8:      	movl	%eax, 0xb4(%ebx)
  15b3ee:      	movl	0xb8(%esi), %ecx
  15b3f4:      	movl	%ecx, 0xb8(%ebx)
  15b3fa:      	movl	0xbc(%esi), %edx
  15b400:      	movl	%edx, 0xbc(%ebx)
  15b406:      	movl	0xc0(%esi), %eax
  15b40c:      	movl	%eax, 0xc0(%ebx)
  15b412:      	addl	$0xd0, %esi
  15b418:      	leal	0xd0(%ebx), %edi
  15b41e:      	movl	$0xb0, %ecx
  15b423:      	rep		movsl	(%esi), %es:(%edi)
