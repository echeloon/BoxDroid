
build/native-perf-run/guest-code-diagnostic-20261015/report/guest-10b236-6eae8e0480.o:	file format elf32-i386

Disassembly of section .text:

0010b236 <trace>:
  10b236:      	movl	0x4f62a8, %edx
  10b23c:      	leal	(%eax,%eax,2), %ecx
  10b23f:      	shll	$0x4, %ecx
  10b242:      	leal	(%ecx,%edx), %eax
  10b245:      	movl	0x10c(%ebx), %ecx
  10b24b:      	flds	0x10(%eax)
  10b24e:      	leal	(%esi,%esi,2), %edx
  10b251:      	shll	$0x2, %edx
  10b254:      	fmuls	0x4(%ecx,%edx)
  10b258:      	addl	%edx, %ecx
  10b25a:      	flds	0x14(%eax)
  10b25d:      	fmuls	0x8(%ecx)
  10b260:      	faddp	%st, %st(1)
  10b262:      	flds	0xc(%eax)
  10b265:      	fmuls	(%ecx)
  10b267:      	faddp	%st, %st(1)
  10b269:      	flds	0x1c(%eax)
  10b26c:      	fmuls	0x4(%ecx)
  10b26f:      	flds	0x20(%eax)
  10b272:      	fmuls	0x8(%ecx)
  10b275:      	faddp	%st, %st(1)
  10b277:      	flds	(%ecx)
  10b279:      	fmuls	0x18(%eax)
  10b27c:      	faddp	%st, %st(1)
  10b27e:      	flds	0x28(%eax)
  10b281:      	fmuls	0x4(%ecx)
  10b284:      	flds	0x2c(%eax)
  10b287:      	fmuls	0x8(%ecx)
  10b28a:      	faddp	%st, %st(1)
  10b28c:      	flds	(%ecx)
  10b28e:      	movl	0x118(%ebx), %ecx
  10b294:      	fmuls	0x24(%eax)
  10b297:      	addl	%edx, %ecx
  10b299:      	faddp	%st, %st(1)
  10b29b:      	fstps	0xdc(%esp)
  10b2a2:      	fxch	%st(1)
  10b2a4:      	fadds	(%eax)
  10b2a6:      	fstps	0x44(%esp)
  10b2aa:      	fadds	0x4(%eax)
  10b2ad:      	fstps	0x48(%esp)
  10b2b1:      	flds	0xdc(%esp)
  10b2b8:      	fadds	0x8(%eax)
  10b2bb:      	fstps	0x4c(%esp)
  10b2bf:      	flds	0x14(%eax)
  10b2c2:      	fmuls	0x8(%ecx)
  10b2c5:      	flds	0x10(%eax)
  10b2c8:      	fmuls	0x4(%ecx)
  10b2cb:      	faddp	%st, %st(1)
  10b2cd:      	flds	0xc(%eax)
  10b2d0:      	fmuls	(%ecx)
  10b2d2:      	faddp	%st, %st(1)
  10b2d4:      	fstps	0x5c(%esp)
  10b2d8:      	flds	0x20(%eax)
  10b2db:      	fmuls	0x8(%ecx)
  10b2de:      	flds	0x1c(%eax)
  10b2e1:      	fmuls	0x4(%ecx)
  10b2e4:      	faddp	%st, %st(1)
  10b2e6:      	flds	0x18(%eax)
  10b2e9:      	fmuls	(%ecx)
  10b2eb:      	faddp	%st, %st(1)
  10b2ed:      	fstps	0x60(%esp)
  10b2f1:      	flds	0x2c(%eax)
  10b2f4:      	fmuls	0x8(%ecx)
  10b2f7:      	flds	0x28(%eax)
  10b2fa:      	fmuls	0x4(%ecx)
  10b2fd:      	faddp	%st, %st(1)
  10b2ff:      	flds	0x24(%eax)
  10b302:      	leal	(%esi,%esi,2), %eax
  10b305:      	fmuls	(%ecx)
  10b307:      	movl	0x4f629c, %ecx
  10b30d:      	shll	$0x3, %eax
  10b310:      	leal	(%eax,%ecx), %edx
  10b313:      	movl	0x44(%esp), %ecx
  10b317:      	faddp	%st, %st(1)
  10b319:      	movl	%ecx, (%edx)
  10b31b:      	movl	0x48(%esp), %ecx
  10b31f:      	movl	%ecx, 0x4(%edx)
  10b322:      	fstps	0x64(%esp)
  10b326:      	movl	0x4c(%esp), %ecx
  10b32a:      	movl	%ecx, 0x8(%edx)
  10b32d:      	movl	0x4f629c, %edx
  10b333:      	movl	0x5c(%esp), %ecx
  10b337:      	leal	0xc(%eax,%edx), %eax
  10b33b:      	movl	0x60(%esp), %edx
  10b33f:      	movl	%ecx, (%eax)
  10b341:      	movl	0x64(%esp), %ecx
  10b345:      	movl	%edx, 0x4(%eax)
  10b348:      	addl	$0x4, %ebp
  10b34b:      	movl	%ecx, 0x8(%eax)
  10b34e:      	movl	0x10(%esp), %eax
  10b352:      	incl	%edi
  10b353:      	cmpl	%eax, %edi
  10b355:      	jl	0x10b211 <trace+0xffffffffffffffdb>
