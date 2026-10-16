
build/native-perf-run/guest-code-diagnostic-20261015/report/guest-e3060-6eae55ef00.o:	file format elf32-i386

Disassembly of section .text:

000e3060 <trace>:
   e3060:      	movl	0x4(%esp), %edx
   e3064:      	flds	0xc(%edx)
   e3067:      	fchs
   e3069:      	fstps	0x4(%esp)
   e306d:      	flds	0x64(%ecx)
   e3070:      	fmuls	0x4(%edx)
   e3073:      	flds	0x68(%ecx)
   e3076:      	fmuls	0x8(%edx)
   e3079:      	faddp	%st, %st(1)
   e307b:      	flds	0x60(%ecx)
   e307e:      	fmuls	(%edx)
   e3080:      	faddp	%st, %st(1)
   e3082:      	fsubs	0x6c(%ecx)
   e3085:      	fcomps	0x4(%esp)
   e3089:      	fnstsw	%ax
   e308b:      	testb	$0x41, %ah
   e308e:      	jnp	0xe315f <trace+0xff>
