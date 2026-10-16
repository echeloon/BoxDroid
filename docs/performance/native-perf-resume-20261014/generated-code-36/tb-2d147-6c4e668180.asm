
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-2d147-6c4e668180.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006c4e668180 <trace>:
6c4e668180:    	ldur	w20, [x19, #-0x10]  // guest 0x2d147, sampled 1
6c4e668184:    	tbnz	w20, #0x1f, 0x6c4e668224 <trace+0xa4>  // guest 0x2d147, sampled 0
6c4e668188:    	sturb	wzr, [x19, #-0xc]  // guest 0x2d147, sampled 0
6c4e66818c:    	ldr	w20, [x19]  // guest 0x2d147, sampled 0
6c4e668190:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2d147, sampled 0
6c4e668194:    	and	x16, x16, x20, lsr #7  // guest 0x2d147, sampled 0
6c4e668198:    	add	x17, x17, x16  // guest 0x2d147, sampled 0
6c4e66819c:    	ldp	x16, x17, [x17]  // guest 0x2d147, sampled 2
6c4e6681a0:    	and	w30, w20, #0xfffff000  // guest 0x2d147, sampled 0
6c4e6681a4:    	cmp	w16, w30  // guest 0x2d147, sampled 0
6c4e6681a8:    	b.ne	0x6c4e66822c <trace+0xac>  // guest 0x2d147, sampled 0
6c4e6681ac:    	add	x30, x17, w20, uxtw  // guest 0x2d147, sampled 0
6c4e6681b0:    	ldaprb	w21, [x30]  // guest 0x2d147, sampled 0
6c4e6681b4:    	ldr	w22, [x19, #0x4]  // guest 0x2d147, sampled 5
6c4e6681b8:    	mov	w16, w21  // guest 0x2d147, sampled 0
6c4e6681bc:    	mov	w21, w22  // guest 0x2d147, sampled 0
6c4e6681c0:    	bfxil	w21, w16, #0, #8  // guest 0x2d147, sampled 0
6c4e6681c4:    	str	w21, [x19, #0x4]  // guest 0x2d147, sampled 0
6c4e6681c8:    	add	w20, w20, #0x1  // guest 0x2d149, sampled 0
6c4e6681cc:    	str	w20, [x19]  // guest 0x2d149, sampled 0
6c4e6681d0:    	str	w21, [x19, #0x28]  // guest 0x2d14a, sampled 0
6c4e6681d4:    	mov	w20, #0x1               // =1  // guest 0x2d14a, sampled 2
6c4e6681d8:    	sturb	w20, [x19, #-0xc]  // guest 0x2d14a, sampled 1
6c4e6681dc:    	mov	w20, #0x18              // =24  // guest 0x2d14c, sampled 0
6c4e6681e0:    	str	w20, [x19, #0x34]  // guest 0x2d14c, sampled 0
6c4e6681e4:    	tst	w21, #0xff  // guest 0x2d14c, sampled 0
6c4e6681e8:    	b.ne	0x6c4e668208 <trace+0x88>  // guest 0x2d14c, sampled 0
6c4e6681ec:    	b	0x6c4e6681ec <trace+0x6c>  // guest 0x2d14c, sampled 0
6c4e6681f0:    	br	x16  // guest 0x2d14c, sampled 0
6c4e6681f4:    	mov	w20, #0xd14e            // =53582  // guest 0x2d14c, sampled 0
6c4e6681f8:    	movk	w20, #0x2, lsl #16  // guest 0x2d14c, sampled 0
6c4e6681fc:    	str	w20, [x19, #0x20]  // guest 0x2d14c, sampled 0
6c4e668200:    	adr	x0, 0x6c4e6680c1 <trace+0xffffffffffffff41>  // guest 0x2d14c, sampled 0
6c4e668204:    	b	0x6c4ae5d02c <trace+0xfffffffffc7f4eac>  // guest 0x2d14c, sampled 0
6c4e668208:    	b	0x6c4e668208 <trace+0x88>  // guest 0x2d14c, sampled 3
6c4e66820c:    	br	x16  // guest 0x2d14c, sampled 0
6c4e668210:    	mov	w20, #0xd147            // =53575  // guest 0x2d14c, sampled 0
6c4e668214:    	movk	w20, #0x2, lsl #16  // guest 0x2d14c, sampled 0
6c4e668218:    	str	w20, [x19, #0x20]  // guest 0x2d14c, sampled 0
6c4e66821c:    	adr	x0, 0x6c4e6680c0 <trace+0xffffffffffffff40>  // guest 0x2d14c, sampled 0
6c4e668220:    	b	0x6c4ae5d02c <trace+0xfffffffffc7f4eac>  // guest 0x2d14c, sampled 0
6c4e668224:    	adr	x0, 0x6c4e6680c3 <trace+0xffffffffffffff43>  // guest 0x2d14c, sampled 0
6c4e668228:    	b	0x6c4ae5d02c <trace+0xfffffffffc7f4eac>  // guest 0x2d14c, sampled 0
6c4e66822c:    	mov	w1, w20
6c4e668230:    	mov	x0, x19
6c4e668234:    	mov	w2, #0x5c05             // =23557
6c4e668238:    	movk	w2, #0x1, lsl #16
6c4e66823c:    	adr	x3, 0x6c4e6681b4 <trace+0x34>
6c4e668240:    	adrp	x16, 0x6c97723000 <trace+0x490bb000>
6c4e668244:    	add	x16, x16, #0xc1c
6c4e668248:    	blr	x16
6c4e66824c:    	mov	w21, w0
6c4e668250:    	dmb	ishld
6c4e668254:    	b	0x6c4e6681b4 <trace+0x34>