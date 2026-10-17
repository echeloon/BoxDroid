
build/native-perf-run/guest-code-diagnostic-20261015/report-branches/guest-2bbd3c-6eaeaf6dc0.o:	file format elf32-i386

Disassembly of section .text:

002bbd3c <trace>:
  2bbd3c:      	flds	0x2c(%esp)
  2bbd40:      	fsub	%st(3), %st
  2bbd42:      	fstps	(%edx,%ecx)
  2bbd45:      	movl	%eax, %edx
  2bbd47:      	flds	0x2c(%esp)
  2bbd4b:      	imull	$0x6c, %edx, %edx
  2bbd4e:      	fadd	%st(3), %st
  2bbd50:      	fstps	(%edx,%ecx)
  2bbd53:      	movl	%eax, %edx
  2bbd55:      	imull	$0x4c, %edx, %edx
  2bbd58:      	fld	%st(0)
  2bbd5a:      	fsub	%st(2), %st
  2bbd5c:      	fstps	(%edx,%ecx)
  2bbd5f:      	leal	(%eax,%eax,2), %edx
  2bbd62:      	fadd	%st(1), %st
  2bbd64:      	fstps	(%ecx,%edx,4)
  2bbd67:      	fstp	%st(0)
  2bbd69:      	fstp	%st(0)
  2bbd6b:      	flds	0x74(%esp)
  2bbd6f:      	fadd	%st(1), %st
  2bbd71:      	fstp	%st(2)
  2bbd73:      	fstp	%st(0)
  2bbd75:      	flds	0x60(%esp)
  2bbd79:      	fmuls	0x3f9830
  2bbd7f:      	flds	0x58(%esp)
  2bbd83:      	fmuls	0x3f9834
  2bbd89:      	faddp	%st, %st(1)
  2bbd8b:      	fld	%st(1)
  2bbd8d:      	fsub	%st(1), %st
  2bbd8f:      	movl	%eax, %edx
  2bbd91:      	imull	$0x5c, %edx, %edx
  2bbd94:      	fstps	0x58(%esp)
  2bbd98:      	faddp	%st, %st(1)
  2bbd9a:      	flds	0x70(%esp)
  2bbd9e:      	fadds	0x78(%esp)
  2bbda2:      	flds	0x80(%esp)
  2bbda9:      	fadds	0x4c(%esp)
  2bbdad:      	popl	%edi
  2bbdae:      	fld	%st(1)
  2bbdb0:      	popl	%esi
  2bbdb1:      	fsub	%st(1), %st
  2bbdb3:      	fmuls	0x3f9848
  2bbdb9:      	fstps	0x44(%esp)
  2bbdbd:      	faddp	%st, %st(1)
  2bbdbf:      	fmuls	0x3f9848
  2bbdc5:      	flds	0x50(%esp)
  2bbdc9:      	fsubs	0x44(%esp)
  2bbdcd:      	fstps	(%edx,%ecx)
  2bbdd0:      	movl	%eax, %edx
  2bbdd2:      	flds	0x44(%esp)
  2bbdd6:      	imull	$0x1c, %edx, %edx
  2bbdd9:      	fadds	0x50(%esp)
  2bbddd:      	fstps	(%edx,%ecx)
  2bbde0:      	movl	%eax, %edx
  2bbde2:      	imull	$0x3c, %edx, %edx
  2bbde5:      	fld	%st(1)
  2bbde7:      	imull	$0x7c, %eax, %eax
  2bbdea:      	fsub	%st(1), %st
  2bbdec:      	fstps	(%edx,%ecx)
  2bbdef:      	fadd	%st(1), %st
  2bbdf1:      	fstps	(%eax,%ecx)
  2bbdf4:      	fstp	%st(0)
  2bbdf6:      	addl	$0x84, %esp
  2bbdfc:      	retl
