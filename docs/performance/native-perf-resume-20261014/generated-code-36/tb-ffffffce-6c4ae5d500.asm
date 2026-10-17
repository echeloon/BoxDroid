
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-ffffffce-6c4ae5d500.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006c4ae5d500 <trace>:
6c4ae5d500:    	ldur	w20, [x19, #-0x10]  // guest 0xffffffce, sampled 0
6c4ae5d504:    	tbnz	w20, #0x1f, 0x6c4ae5d6b0 <trace+0x1b0>  // guest 0xffffffce, sampled 0
6c4ae5d508:    	mov	w20, #0x1               // =1  // guest 0xffffffce, sampled 0
6c4ae5d50c:    	sturb	w20, [x19, #-0xc]  // guest 0xffffffce, sampled 0
6c4ae5d510:    	mov	w3, #0xffd6             // =65494  // guest 0xffffffce, sampled 0
6c4ae5d514:    	mov	w2, #-0x200             // =-512  // guest 0xffffffce, sampled 0
6c4ae5d518:    	mov	w1, #0x8                // =8  // guest 0xffffffce, sampled 0
6c4ae5d51c:    	mov	x0, x19  // guest 0xffffffce, sampled 0
6c4ae5d520:    	dmb	ish  // guest 0xffffffce, sampled 0
6c4ae5d524:    	adrp	x16, 0x6c9778b000 <trace+0x4c92e000>  // guest 0xffffffce, sampled 0
6c4ae5d528:    	add	x16, x16, #0xb94  // guest 0xffffffce, sampled 0
6c4ae5d52c:    	blr	x16  // guest 0xffffffce, sampled 0
6c4ae5d530:    	dmb	ishld  // guest 0xffffffce, sampled 0
6c4ae5d534:    	mov	x0, x19  // guest 0xffffffce, sampled 0
6c4ae5d538:    	b	0x6c4ae5d6a8 <trace+0x1a8>  // guest 0xffffffce, sampled 0
6c4ae5d53c:    	mov	x7, #-0x3b50            // =-15184  // guest 0xffffffce, sampled 1
6c4ae5d540:    	add	x1, x0, x7  // guest 0xffffffce, sampled 5
6c4ae5d544:    	mov	w7, #0x1                // =1  // guest 0xffffffce, sampled 1
6c4ae5d548:    	mov	w16, #0x3b44            // =15172  // guest 0xffffffce, sampled 3
6c4ae5d54c:    	strb	w7, [x1, x16]  // guest 0xffffffce, sampled 1
6c4ae5d550:    	ldr	w7, [x1, #0xd4]  // guest 0xffffffce, sampled 9
6c4ae5d554:    	cbnz	w7, 0x6c4ae5d688 <trace+0x188>  // guest 0xffffffce, sampled 5
6c4ae5d558:    	ldr	x7, [x1, #0x280]  // guest 0xffffffce, sampled 1
6c4ae5d55c:    	cbnz	x7, 0x6c4ae5d688 <trace+0x188>  // guest 0xffffffce, sampled 1
6c4ae5d560:    	adrp	x7, 0x6c97ecb000 <trace+0x4d06e000>  // guest 0xffffffce, sampled 9
6c4ae5d564:    	add	x7, x7, #0xe0  // guest 0xffffffce, sampled 0
6c4ae5d568:    	ldrb	w7, [x7]  // guest 0xffffffce, sampled 0
6c4ae5d56c:    	cbnz	w7, 0x6c4ae5d688 <trace+0x188>  // guest 0xffffffce, sampled 1
6c4ae5d570:    	adrp	x7, 0x6c97f45000 <trace+0x4d0e8000>  // guest 0xffffffce, sampled 5
6c4ae5d574:    	add	x7, x7, #0xd28  // guest 0xffffffce, sampled 0
6c4ae5d578:    	ldr	w7, [x7]  // guest 0xffffffce, sampled 0
6c4ae5d57c:    	mov	w8, #0x2120             // =8480  // guest 0xffffffce, sampled 3
6c4ae5d580:    	and	w7, w7, w8  // guest 0xffffffce, sampled 1
6c4ae5d584:    	cbnz	w7, 0x6c4ae5d688 <trace+0x188>  // guest 0xffffffce, sampled 1
6c4ae5d588:    	adrp	x7, 0x6c97ecb000 <trace+0x4d06e000>  // guest 0xffffffce, sampled 5
6c4ae5d58c:    	add	x7, x7, #0x9a8  // guest 0xffffffce, sampled 0
6c4ae5d590:    	ldrb	w7, [x7]  // guest 0xffffffce, sampled 2
6c4ae5d594:    	cbnz	w7, 0x6c4ae5d688 <trace+0x188>  // guest 0xffffffce, sampled 0
6c4ae5d598:    	ldr	w5, [x0, #0x3c]  // guest 0xffffffce, sampled 2
6c4ae5d59c:    	mov	w7, #0x8090             // =32912  // guest 0xffffffce, sampled 0
6c4ae5d5a0:    	and	w7, w5, w7  // guest 0xffffffce, sampled 1
6c4ae5d5a4:    	mov	w8, #0x90               // =144  // guest 0xffffffce, sampled 1
6c4ae5d5a8:    	cmp	w7, w8  // guest 0xffffffce, sampled 0
6c4ae5d5ac:    	b.ne	0x6c4ae5d688 <trace+0x188>  // guest 0xffffffce, sampled 0
6c4ae5d5b0:    	ldr	w7, [x0, #0x58]  // guest 0xffffffce, sampled 3
6c4ae5d5b4:    	cbnz	w7, 0x6c4ae5d688 <trace+0x188>  // guest 0xffffffce, sampled 2
6c4ae5d5b8:    	ldr	w7, [x0, #0x24]  // guest 0xffffffce, sampled 0
6c4ae5d5bc:    	mov	w8, #0x3100             // =12544  // guest 0xffffffce, sampled 2
6c4ae5d5c0:    	movk	w8, #0x7, lsl #16  // guest 0xffffffce, sampled 1
6c4ae5d5c4:    	and	w7, w7, w8  // guest 0xffffffce, sampled 3
6c4ae5d5c8:    	orr	w5, w5, w7  // guest 0xffffffce, sampled 0
6c4ae5d5cc:    	ldr	w4, [x0, #0x20]  // guest 0xffffffce, sampled 1
6c4ae5d5d0:    	ldr	w6, [x1, #0x334]  // guest 0xffffffce, sampled 6
6c4ae5d5d4:    	lsr	w7, w4, #5  // guest 0xffffffce, sampled 2
6c4ae5d5d8:    	eor	w7, w7, w4  // guest 0xffffffce, sampled 0
6c4ae5d5dc:    	lsr	w8, w7, #5  // guest 0xffffffce, sampled 1
6c4ae5d5e0:    	and	w8, w8, #0x3f80  // guest 0xffffffce, sampled 1
6c4ae5d5e4:    	and	w7, w7, #0x7f  // guest 0xffffffce, sampled 1
6c4ae5d5e8:    	orr	w7, w7, w8  // guest 0xffffffce, sampled 1
6c4ae5d5ec:    	ldr	x3, [x1, #0x258]  // guest 0xffffffce, sampled 3
6c4ae5d5f0:    	mov	w16, #0x10              // =16  // guest 0xffffffce, sampled 5
6c4ae5d5f4:    	movk	w16, #0x8, lsl #16  // guest 0xffffffce, sampled 1
6c4ae5d5f8:    	ldr	w8, [x3, x16]  // guest 0xffffffce, sampled 1
6c4ae5d5fc:    	add	x4, x4, x8, lsl #32  // guest 0xffffffce, sampled 4
6c4ae5d600:    	add	x3, x3, x7, lsl #4  // guest 0xffffffce, sampled 0
6c4ae5d604:    	add	x3, x3, #0x10  // guest 0xffffffce, sampled 4
6c4ae5d608:    	ldr	x2, [x3]  // guest 0xffffffce, sampled 1
6c4ae5d60c:    	cbz	x2, 0x6c4ae5d644 <trace+0x144>  // guest 0xffffffce, sampled 166
6c4ae5d610:    	ldr	x7, [x3, #0x8]  // guest 0xffffffce, sampled 10
6c4ae5d614:    	cmp	x7, x4  // guest 0xffffffce, sampled 1
6c4ae5d618:    	b.ne	0x6c4ae5d644 <trace+0x144>  // guest 0xffffffce, sampled 0
6c4ae5d61c:    	ldr	x7, [x2, #0x8]  // guest 0xffffffce, sampled 2
6c4ae5d620:    	cbnz	x7, 0x6c4ae5d644 <trace+0x144>  // guest 0xffffffce, sampled 141
6c4ae5d624:    	ldr	w7, [x2, #0x10]  // guest 0xffffffce, sampled 15
6c4ae5d628:    	cmp	w7, w5  // guest 0xffffffce, sampled 7
6c4ae5d62c:    	b.ne	0x6c4ae5d644 <trace+0x144>  // guest 0xffffffce, sampled 0
6c4ae5d630:    	ldr	w7, [x2, #0x14]  // guest 0xffffffce, sampled 9
6c4ae5d634:    	cmp	w7, w6  // guest 0xffffffce, sampled 6
6c4ae5d638:    	b.ne	0x6c4ae5d644 <trace+0x144>  // guest 0xffffffce, sampled 0
6c4ae5d63c:    	ldr	x0, [x2, #0x28]  // guest 0xffffffce, sampled 12
6c4ae5d640:    	b	0x6c4ae5d6a4 <trace+0x1a4>  // guest 0xffffffce, sampled 0
6c4ae5d644:    	orr	w7, wzr, #0x40000  // guest 0xffffffce, sampled 1
6c4ae5d648:    	add	x3, x3, x7  // guest 0xffffffce, sampled 1
6c4ae5d64c:    	ldr	x2, [x3]  // guest 0xffffffce, sampled 0
6c4ae5d650:    	cbz	x2, 0x6c4ae5d688 <trace+0x188>  // guest 0xffffffce, sampled 50
6c4ae5d654:    	ldr	x7, [x3, #0x8]  // guest 0xffffffce, sampled 2
6c4ae5d658:    	cmp	x7, x4  // guest 0xffffffce, sampled 1
6c4ae5d65c:    	b.ne	0x6c4ae5d688 <trace+0x188>  // guest 0xffffffce, sampled 0
6c4ae5d660:    	ldr	x7, [x2, #0x8]  // guest 0xffffffce, sampled 0
6c4ae5d664:    	cbnz	x7, 0x6c4ae5d688 <trace+0x188>  // guest 0xffffffce, sampled 14
6c4ae5d668:    	ldr	w7, [x2, #0x10]  // guest 0xffffffce, sampled 5
6c4ae5d66c:    	cmp	w7, w5  // guest 0xffffffce, sampled 0
6c4ae5d670:    	b.ne	0x6c4ae5d688 <trace+0x188>  // guest 0xffffffce, sampled 0
6c4ae5d674:    	ldr	w7, [x2, #0x14]  // guest 0xffffffce, sampled 1
6c4ae5d678:    	cmp	w7, w6  // guest 0xffffffce, sampled 1
6c4ae5d67c:    	b.ne	0x6c4ae5d688 <trace+0x188>  // guest 0xffffffce, sampled 0
6c4ae5d680:    	ldr	x0, [x2, #0x28]  // guest 0xffffffce, sampled 3
6c4ae5d684:    	b	0x6c4ae5d6a4 <trace+0x1a4>  // guest 0xffffffce, sampled 0
6c4ae5d688:    	dmb	ish  // guest 0xffffffce, sampled 0
6c4ae5d68c:    	stp	xzr, x30, [sp, #-0x10]!  // guest 0xffffffce, sampled 3
6c4ae5d690:    	adrp	x16, 0x6c97710000 <trace+0x4c8b3000>  // guest 0xffffffce, sampled 0
6c4ae5d694:    	add	x16, x16, #0xf84  // guest 0xffffffce, sampled 0
6c4ae5d698:    	blr	x16  // guest 0xffffffce, sampled 0
6c4ae5d69c:    	dmb	ishld  // guest 0xffffffce, sampled 0
6c4ae5d6a0:    	ldp	xzr, x30, [sp], #0x10  // guest 0xffffffce, sampled 6
6c4ae5d6a4:    	ret  // guest 0xffffffce, sampled 1
6c4ae5d6a8:    	bl	0x6c4ae5d53c <trace+0x3c>  // guest 0xffffffce, sampled 0
6c4ae5d6ac:    	br	x0  // guest 0xffffffce, sampled 0
6c4ae5d6b0:    	adr	x0, 0x6c4ae5d443 <trace+0xffffffffffffff43>  // guest 0xffffffce, sampled 0
6c4ae5d6b4:    	b	0x6c4ae5d02c <trace+0xfffffffffffffb2c>  // guest 0xffffffce, sampled 0