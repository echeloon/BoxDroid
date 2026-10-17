
build/native-perf-run/guest-code-diagnostic-20261015/report/guest-2bbcb0-6eaeaf3f80.o:	file format elf32-i386

Disassembly of section .text:

002bbcb0 <trace>:
  2bbcb0:      	fld	%st(1)
  2bbcb2:      	imull	$0x54, %edx, %edx
  2bbcb5:      	fsub	%st(1), %st
  2bbcb7:      	fmuls	0x3f9848
  2bbcbd:      	fstps	0x2c(%esp)
  2bbcc1:      	faddp	%st, %st(1)
  2bbcc3:      	fmuls	0x3f9848
  2bbcc9:      	flds	0x44(%esp)
  2bbccd:      	fsubs	0x2c(%esp)
  2bbcd1:      	fstps	(%edx,%ecx)
  2bbcd4:      	leal	(%eax,%eax,4), %edx
  2bbcd7:      	flds	0x2c(%esp)
  2bbcdb:      	fadds	0x44(%esp)
  2bbcdf:      	fstps	(%ecx,%edx,4)
  2bbce2:      	movl	%eax, %edx
  2bbce4:      	imull	$0x34, %edx, %edx
  2bbce7:      	fld	%st(1)
  2bbce9:      	fsub	%st(1), %st
  2bbceb:      	fstps	(%edx,%ecx)
  2bbcee:      	movl	%eax, %edx
  2bbcf0:      	imull	$0x74, %edx, %edx
  2bbcf3:      	fadd	%st(1), %st
  2bbcf5:      	fstps	(%edx,%ecx)
  2bbcf8:      	movl	%eax, %edx
  2bbcfa:      	imull	$0x2c, %edx, %edx
  2bbcfd:      	fstp	%st(0)
  2bbcff:      	flds	0x80(%esp)
  2bbd06:      	fsubs	0x4c(%esp)
  2bbd0a:      	fadd	%st, %st(0)
  2bbd0c:      	flds	0x70(%esp)
  2bbd10:      	fsubs	0x78(%esp)
  2bbd14:      	fadd	%st, %st(0)
  2bbd16:      	flds	0x74(%esp)
  2bbd1a:      	fsub	%st(3), %st
  2bbd1c:      	flds	0x58(%esp)
  2bbd20:      	fmuls	0x3f9830
  2bbd26:      	flds	0x60(%esp)
  2bbd2a:      	fmuls	0x3f9834
  2bbd30:      	fsubrp	%st, %st(1)
  2bbd32:      	fld	%st(1)
  2bbd34:      	fsub	%st(1), %st
  2bbd36:      	fstps	0x2c(%esp)
  2bbd3a:      	faddp	%st, %st(1)
