
build/native-perf-run/guest-code-diagnostic-20261015/report/guest-605f0-6eac94a740.o:	file format elf32-i386

Disassembly of section .text:

000605f0 <trace>:
   605f0:      	pushl	$-0x1
   605f2:      	pushl	$0x30a584               # imm = 0x30A584
   605f7:      	movl	%fs:0x0, %eax
   605fd:      	pushl	%eax
   605fe:      	movl	%esp, %fs:0x0
   60605:      	subl	$0x144, %esp            # imm = 0x144
   6060b:      	movl	0x158(%esp), %eax
   60612:      	pushl	%esi
   60613:      	movl	%ecx, %esi
   60615:      	leal	0x4000(%eax), %ecx
   6061b:      	sarl	$0x2, %ecx
   6061e:      	sarl	$0x2, %eax
   60621:      	andl	$0x3fff, %ecx           # imm = 0x3FFF
   60627:      	flds	0x453204(,%ecx,4)
   6062e:      	andl	$0x3fff, %eax           # imm = 0x3FFF
   60633:      	flds	0x453204(,%eax,4)
   6063a:      	leal	0x453204(,%ecx,4), %ecx
   60641:      	leal	0x453204(,%eax,4), %eax
   60648:      	fchs
   6064a:      	flds	(%eax)
   6064c:      	movl	(%ecx), %eax
   6064e:      	fstps	0x8c(%esp)
   60655:      	movl	%eax, 0x88(%esp)
   6065c:      	movl	$0x0, 0x90(%esp)
   60667:      	fstps	0x98(%esp)
   6066e:      	movl	$0x0, 0x94(%esp)
   60679:      	movl	$0x0, 0xa0(%esp)
   60684:      	fstps	0x9c(%esp)
   6068b:      	movl	$0x0, 0xa4(%esp)
   60696:      	movl	$0x0, 0xa8(%esp)
   606a1:      	movl	$0x0, 0xac(%esp)
   606ac:      	movl	$0x3f800000, 0xb0(%esp) # imm = 0x3F800000
   606b7:      	movl	$0x0, 0xb4(%esp)
   606c2:      	movl	$0x0, 0xb8(%esp)
   606cd:      	movl	$0x0, 0xbc(%esp)
   606d8:      	movl	$0x0, 0xc0(%esp)
   606e3:      	movl	$0x3f800000, 0xc4(%esp) # imm = 0x3F800000
   606ee:      	movl	0x158(%esp), %eax
   606f5:      	leal	0x88(%esp), %ecx
   606fc:      	pushl	%ecx
   606fd:      	leal	0x4000(%eax), %ecx
   60703:      	sarl	$0x2, %ecx
   60706:      	sarl	$0x2, %eax
   60709:      	andl	$0x3fff, %ecx           # imm = 0x3FFF
   6070f:      	flds	0x453204(,%ecx,4)
   60716:      	movl	0x453204(,%ecx,4), %edx
   6071d:      	leal	0x453204(,%ecx,4), %ecx
   60724:      	andl	$0x3fff, %eax           # imm = 0x3FFF
   60729:      	flds	0x453204(,%eax,4)
   60730:      	leal	0x453204(,%eax,4), %eax
   60737:      	fchs
   60739:      	movl	$0x0, 0x154(%esp)
   60744:      	flds	(%eax)
   60746:      	pushl	%esi
   60747:      	fstps	0x18(%esp)
   6074b:      	movl	%edx, 0x10(%esp)
   6074f:      	movl	$0x0, 0x14(%esp)
   60757:      	fstps	0x30(%esp)
   6075b:      	movl	$0x0, 0x1c(%esp)
   60763:      	movl	$0x0, 0x20(%esp)
   6076b:      	fstps	0x38(%esp)
   6076f:      	movl	$0x3f800000, 0x24(%esp) # imm = 0x3F800000
   60777:      	movl	$0x0, 0x28(%esp)
   6077f:      	movl	$0x0, 0x2c(%esp)
   60787:      	movl	$0x0, 0x34(%esp)
   6078f:      	movl	$0x0, 0x3c(%esp)
   60797:      	movl	$0x0, 0x40(%esp)
   6079f:      	movl	$0x0, 0x44(%esp)
   607a7:      	movl	$0x0, 0x48(%esp)
   607af:      	movl	$0x3f800000, 0x4c(%esp) # imm = 0x3F800000
   607b7:      	leal	0x10(%esp), %eax
   607bb:      	pushl	%eax
   607bc:      	movl	0x16c(%esp), %eax
   607c3:      	leal	0xd4(%esp), %ecx
   607ca:      	pushl	%ecx
   607cb:      	leal	0x4000(%eax), %ecx
   607d1:      	sarl	$0x2, %ecx
   607d4:      	sarl	$0x2, %eax
   607d7:      	andl	$0x3fff, %ecx           # imm = 0x3FFF
   607dd:      	flds	0x453204(,%ecx,4)
   607e4:      	andl	$0x3fff, %eax           # imm = 0x3FFF
   607e9:      	flds	0x453204(,%eax,4)
   607f0:      	movl	0x453204(,%eax,4), %edx
   607f7:      	leal	0x453204(,%ecx,4), %ecx
   607fe:      	leal	0x453204(,%eax,4), %eax
   60805:      	flds	(%ecx)
   60807:      	movl	%edx, 0x14(%esp)
   6080b:      	flds	0x14(%esp)
   6080f:      	movl	$0x3f800000, 0x58(%esp) # imm = 0x3F800000
   60817:      	fchs
   60819:      	movl	$0x0, 0x5c(%esp)
   60821:      	fxch	%st(1)
   60823:      	movl	$0x0, 0x60(%esp)
   6082b:      	fstps	0x6c(%esp)
   6082f:      	movl	$0x0, 0x64(%esp)
   60837:      	movl	$0x0, 0x68(%esp)
   6083f:      	fstps	0x70(%esp)
   60843:      	movl	$0x0, 0x74(%esp)
   6084b:      	movl	$0x0, 0x78(%esp)
   60853:      	fstps	0x7c(%esp)
   60857:      	movl	$0x0, 0x84(%esp)
   60862:      	movl	$0x0, 0x88(%esp)
   6086d:      	fstps	0x80(%esp)
   60874:      	movl	$0x0, 0x8c(%esp)
   6087f:      	movl	$0x0, 0x90(%esp)
   6088a:      	movl	$0x3f800000, 0x94(%esp) # imm = 0x3F800000
   60895:      	leal	0x58(%esp), %eax
   60899:      	pushl	%eax
   6089a:      	leal	0x11c(%esp), %ecx
   608a1:      	pushl	%ecx
   608a2:      	movl	$0x42cb48, %ecx         # imm = 0x42CB48
   608a7:      	movb	$0x2, 0x168(%esp)
   608af:      	calll	0x608f0 <trace+0x300>
