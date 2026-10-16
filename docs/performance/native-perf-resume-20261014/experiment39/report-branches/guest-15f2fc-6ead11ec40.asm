
build/native-perf-run/guest-code-diagnostic-20261015/report-branches/guest-15f2fc-6ead11ec40.o:	file format elf32-i386

Disassembly of section .text:

0015f2fc <trace>:
  15f2fc:      	movl	0x160(%ebp), %edx
  15f302:      	movl	%edx, 0x160(%ebx)
  15f308:      	leal	0x164(%ebp), %eax
  15f30e:      	movl	(%eax), %edx
  15f310:      	leal	0x164(%ebx), %ecx
  15f316:      	movl	%edx, (%ecx)
  15f318:      	movl	0x4(%eax), %edx
  15f31b:      	movl	%edx, 0x4(%ecx)
  15f31e:      	movl	0x8(%eax), %eax
  15f321:      	movl	%eax, 0x8(%ecx)
  15f324:      	leal	0x170(%ebp), %ecx
  15f32a:      	movl	(%ecx), %eax
  15f32c:      	leal	0x170(%ebx), %edx
  15f332:      	movl	%eax, (%edx)
  15f334:      	movl	0x4(%ecx), %eax
  15f337:      	movl	%eax, 0x4(%edx)
  15f33a:      	movl	0x8(%ecx), %ecx
  15f33d:      	movl	%ecx, 0x8(%edx)
  15f340:      	movl	0x17c(%ebp), %edx
  15f346:      	movl	%edx, 0x17c(%ebx)
  15f34c:      	movl	0x180(%ebp), %eax
  15f352:      	movl	%eax, 0x180(%ebx)
  15f358:      	movl	0x184(%ebp), %ecx
  15f35e:      	movl	%ecx, 0x184(%ebx)
  15f364:      	movl	0x188(%ebp), %edx
  15f36a:      	movl	%edx, 0x188(%ebx)
  15f370:      	movl	0x18c(%ebp), %eax
  15f376:      	movl	%eax, 0x18c(%ebx)
  15f37c:      	movl	0x190(%ebp), %ecx
  15f382:      	movl	%ecx, 0x190(%ebx)
  15f388:      	movl	0x194(%ebp), %edx
  15f38e:      	movl	%edx, 0x194(%ebx)
  15f394:      	movl	0x198(%ebp), %eax
  15f39a:      	movl	%eax, 0x198(%ebx)
  15f3a0:      	movl	0x19c(%ebp), %ecx
  15f3a6:      	movl	%ecx, 0x19c(%ebx)
  15f3ac:      	movl	0x1a0(%ebp), %edx
  15f3b2:      	movl	%edx, 0x1a0(%ebx)
  15f3b8:      	movl	0x1a4(%ebp), %eax
  15f3be:      	movl	%eax, 0x1a4(%ebx)
  15f3c4:      	movl	0x1a8(%ebp), %ecx
  15f3ca:      	movl	%ecx, 0x1a8(%ebx)
  15f3d0:      	movl	0x1ac(%ebp), %edx
  15f3d6:      	movl	%edx, 0x1ac(%ebx)
  15f3dc:      	movl	0x1b0(%ebp), %eax
  15f3e2:      	movl	%eax, 0x1b0(%ebx)
  15f3e8:      	leal	0x1b4(%ebp), %esi
  15f3ee:      	leal	0x1b4(%ebx), %edi
  15f3f4:      	movl	$0x98, %ecx
  15f3f9:      	rep		movsl	(%esi), %es:(%edi)
