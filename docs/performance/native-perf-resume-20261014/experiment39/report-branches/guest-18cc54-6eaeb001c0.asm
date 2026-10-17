
build/native-perf-run/guest-code-diagnostic-20261015/report-branches/guest-18cc54-6eaeb001c0.o:	file format elf32-i386

Disassembly of section .text:

0018cc54 <trace>:
  18cc54:      	leal	-0x20(%edx), %ebp
  18cc57:      	movl	%ebp, 0x48(%esp)
  18cc5b:      	fildl	0x48(%esp)
  18cc5f:      	incl	%edx
  18cc60:      	addl	$0x8, %edi
  18cc63:      	addl	$0x8, %ecx
  18cc66:      	fld	%st(0)
  18cc68:      	addl	$0x108, %eax            # imm = 0x108
  18cc6d:      	cmpl	$0x40, %edx
  18cc70:      	fmul	%st(1), %st
  18cc72:      	fadd	%st(2), %st
  18cc74:      	fsqrt
  18cc76:      	fdivrs	0x3b17cc
  18cc7c:      	fld	%st(0)
  18cc7e:      	fmuls	-0x8(%edi)
  18cc81:      	fmul	%st(4), %st
  18cc83:      	fstps	-0x10c(%eax)
  18cc89:      	fld	%st(0)
  18cc8b:      	fmuls	-0x8(%ecx)
  18cc8e:      	fmul	%st(4), %st
  18cc90:      	fchs
  18cc92:      	fstps	-0x108(%eax)
  18cc98:      	fld	%st(0)
  18cc9a:      	fmuls	-0x8(%edi)
  18cc9d:      	fmul	%st(2), %st
  18cc9f:      	fstps	0x40f4(%eax)
  18cca5:      	fmuls	-0x8(%ecx)
  18cca8:      	fmul	%st(1), %st
  18ccaa:      	fchs
  18ccac:      	fstps	0x40f8(%eax)
  18ccb2:      	fstp	%st(0)
  18ccb4:      	jl	0x18cc54 <trace>
