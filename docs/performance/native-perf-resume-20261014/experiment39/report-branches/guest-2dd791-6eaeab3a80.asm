
build/native-perf-run/guest-code-diagnostic-20261015/report-branches/guest-2dd791-6eaeab3a80.o:	file format elf32-i386

Disassembly of section .text:

002dd791 <trace>:
  2dd791:      	fsubrp	%st, %st(1)
  2dd793:      	flds	0x124(%esp)
  2dd79a:      	fadds	0xec(%esp)
  2dd7a1:      	flds	0xf0(%esp)
  2dd7a8:      	fadds	0xdc(%esp)
  2dd7af:      	fld	%st(1)
  2dd7b1:      	fsub	%st(1), %st
  2dd7b3:      	fstps	0xdc(%esp)
  2dd7ba:      	faddp	%st, %st(1)
  2dd7bc:      	flds	0x2c(%esp)
  2dd7c0:      	fadds	0x100(%esp)
  2dd7c7:      	flds	0x24(%esp)
  2dd7cb:      	fadds	0xe4(%esp)
  2dd7d2:      	flds	0x3fa5fc
  2dd7d8:      	fmul	%st(1), %st
  2dd7da:      	fld	%st(2)
  2dd7dc:      	fmuls	0x3fa5f8
  2dd7e2:      	faddp	%st, %st(1)
  2dd7e4:      	fstps	0xe4(%esp)
  2dd7eb:      	fmuls	0x3fa5f8
  2dd7f1:      	fxch	%st(1)
  2dd7f3:      	movl	%eax, %edx
  2dd7f5:      	fmuls	0x3fa5fc
  2dd7fb:      	imull	$0x98, %edx, %edx
  2dd801:      	addl	%ecx, %edx
  2dd803:      	fsubrp	%st, %st(1)
  2dd805:      	leal	(%eax,%eax,2), %esi
  2dd808:      	flds	0x110(%esp)
  2dd80f:      	movl	%eax, %edi
  2dd811:      	imull	$0x58, %eax, %eax
  2dd814:      	fadds	0x118(%esp)
  2dd81b:      	flds	0x120(%esp)
  2dd822:      	fadds	0xc8(%esp)
  2dd829:      	fld	%st(1)
  2dd82b:      	fmuls	0x3fa5f8
  2dd831:      	fld	%st(1)
  2dd833:      	fmuls	0x3fa5fc
  2dd839:      	imull	$0xd8, %edi, %edi
  2dd83f:      	leal	(%ecx,%esi,8), %esi
  2dd842:      	fsubrp	%st, %st(1)
  2dd844:      	addl	%ecx, %edi
  2dd846:      	addl	%ecx, %eax
  2dd848:      	fstps	0xc8(%esp)
  2dd84f:      	fmuls	0x3fa5f8
  2dd855:      	fxch	%st(1)
  2dd857:      	fmuls	0x3fa5fc
  2dd85d:      	faddp	%st, %st(1)
  2dd85f:      	flds	0xc8(%esp)
  2dd866:      	fadds	0xe4(%esp)
  2dd86d:      	flds	0xd4(%esp)
  2dd874:      	fsub	%st(1), %st
  2dd876:      	fstps	0x4(%edx)
  2dd879:      	fadds	0xd4(%esp)
  2dd880:      	fstps	0x4(%esi)
  2dd883:      	flds	0xc8(%esp)
  2dd88a:      	fsubs	0xe4(%esp)
  2dd891:      	flds	0xdc(%esp)
  2dd898:      	fsub	%st(1), %st
  2dd89a:      	fstps	(%edi)
  2dd89c:      	fadds	0xdc(%esp)
  2dd8a3:      	fstps	(%eax)
  2dd8a5:      	fld	%st(1)
  2dd8a7:      	fsub	%st(1), %st
  2dd8a9:      	fld	%st(4)
  2dd8ab:      	fsub	%st(1), %st
  2dd8ad:      	fstps	0x4(%edi)
  2dd8b0:      	popl	%edi
  2dd8b1:      	fadd	%st(4), %st
  2dd8b3:      	fstps	0x4(%eax)
  2dd8b6:      	faddp	%st, %st(1)
  2dd8b8:      	fld	%st(1)
  2dd8ba:      	fsub	%st(1), %st
  2dd8bc:      	fstps	(%edx)
  2dd8be:      	fadd	%st(1), %st
  2dd8c0:      	fstps	(%esi)
  2dd8c2:      	popl	%esi
  2dd8c3:      	popl	%ebx
  2dd8c4:      	fstp	%st(0)
  2dd8c6:      	fstp	%st(0)
  2dd8c8:      	addl	$0x120, %esp            # imm = 0x120
  2dd8ce:      	retl
