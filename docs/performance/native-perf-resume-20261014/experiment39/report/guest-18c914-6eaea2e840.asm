
build/native-perf-run/guest-code-diagnostic-20261015/report/guest-18c914-6eaea2e840.o:	file format elf32-i386

Disassembly of section .text:

0018c914 <trace>:
  18c914:      	fld	%st(0)
  18c916:      	addl	$0x4, %edx
  18c919:      	fmuls	-0x4(%edx)
  18c91c:      	addl	$0x8, %eax
  18c91f:      	subl	$0x8, %ecx
  18c922:      	decl	%edi
  18c923:      	fld	%st(0)
  18c925:      	fcos
  18c927:      	fxch	%st(1)
  18c929:      	fsin
  18c92b:      	fld	%st(1)
  18c92d:      	fmuls	-0xc(%eax)
  18c930:      	fld	%st(1)
  18c932:      	fmuls	-0x8(%eax)
  18c935:      	fsubrp	%st, %st(1)
  18c937:      	fstps	0x48(%esp)
  18c93b:      	fld	%st(0)
  18c93d:      	fmuls	-0xc(%eax)
  18c940:      	fld	%st(2)
  18c942:      	fmuls	-0x8(%eax)
  18c945:      	faddp	%st, %st(1)
  18c947:      	fstps	0x4c(%esp)
  18c94b:      	fld	%st(1)
  18c94d:      	fmuls	0x8(%ecx)
  18c950:      	fld	%st(1)
  18c952:      	fmuls	0xc(%ecx)
  18c955:      	fsubrp	%st, %st(1)
  18c957:      	fstps	0x3c(%esp)
  18c95b:      	fmuls	0x8(%ecx)
  18c95e:      	fchs
  18c960:      	fxch	%st(1)
  18c962:      	fmuls	0xc(%ecx)
  18c965:      	fsubrp	%st, %st(1)
  18c967:      	flds	0x3c(%esp)
  18c96b:      	fadds	0x48(%esp)
  18c96f:      	fstps	0x83fc(%eax)
  18c975:      	fadds	0x4c(%esp)
  18c979:      	fstps	0x8400(%eax)
  18c97f:      	jne	0x18c914 <trace>
