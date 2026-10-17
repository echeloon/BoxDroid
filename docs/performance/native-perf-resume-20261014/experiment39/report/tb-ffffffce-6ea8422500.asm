
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-ffffffce-6ea8422500.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006ea8422500 <trace>:
6ea8422500:    	ldur	w20, [x19, #-0x10]  // guest 0xffffffce, sampled 0
6ea8422504:    	tbnz	w20, #0x1f, 0x6ea84226b0 <trace+0x1b0>  // guest 0xffffffce, sampled 0
6ea8422508:    	mov	w20, #0x1               // =1  // guest 0xffffffce, sampled 0
6ea842250c:    	sturb	w20, [x19, #-0xc]  // guest 0xffffffce, sampled 0
6ea8422510:    	mov	w3, #0xffd6             // =65494  // guest 0xffffffce, sampled 0
6ea8422514:    	mov	w2, #-0x200             // =-512  // guest 0xffffffce, sampled 0
6ea8422518:    	mov	w1, #0x8                // =8  // guest 0xffffffce, sampled 0
6ea842251c:    	mov	x0, x19  // guest 0xffffffce, sampled 0
6ea8422520:    	dmb	ish  // guest 0xffffffce, sampled 0
6ea8422524:    	adrp	x16, 0x6efc8e4000 <trace+0x544c2000>  // guest 0xffffffce, sampled 0
6ea8422528:    	add	x16, x16, #0xc64  // guest 0xffffffce, sampled 0
6ea842252c:    	blr	x16  // guest 0xffffffce, sampled 0
6ea8422530:    	dmb	ishld  // guest 0xffffffce, sampled 0
6ea8422534:    	mov	x0, x19  // guest 0xffffffce, sampled 0
6ea8422538:    	b	0x6ea84226a8 <trace+0x1a8>  // guest 0xffffffce, sampled 0
6ea842253c:    	mov	x7, #-0x3b50            // =-15184  // guest 0xffffffce, sampled 0
6ea8422540:    	add	x1, x0, x7  // guest 0xffffffce, sampled 5
6ea8422544:    	mov	w7, #0x1                // =1  // guest 0xffffffce, sampled 3
6ea8422548:    	mov	w16, #0x3b44            // =15172  // guest 0xffffffce, sampled 6
6ea842254c:    	strb	w7, [x1, x16]  // guest 0xffffffce, sampled 1
6ea8422550:    	ldr	w7, [x1, #0xd4]  // guest 0xffffffce, sampled 2
6ea8422554:    	cbnz	w7, 0x6ea8422688 <trace+0x188>  // guest 0xffffffce, sampled 4
6ea8422558:    	ldr	x7, [x1, #0x280]  // guest 0xffffffce, sampled 6
6ea842255c:    	cbnz	x7, 0x6ea8422688 <trace+0x188>  // guest 0xffffffce, sampled 1
6ea8422560:    	adrp	x7, 0x6efd024000 <trace+0x54c02000>  // guest 0xffffffce, sampled 4
6ea8422564:    	add	x7, x7, #0x1c0  // guest 0xffffffce, sampled 1
6ea8422568:    	ldrb	w7, [x7]  // guest 0xffffffce, sampled 5
6ea842256c:    	cbnz	w7, 0x6ea8422688 <trace+0x188>  // guest 0xffffffce, sampled 0
6ea8422570:    	adrp	x7, 0x6efd09e000 <trace+0x54c7c000>  // guest 0xffffffce, sampled 2
6ea8422574:    	add	x7, x7, #0xe08  // guest 0xffffffce, sampled 1
6ea8422578:    	ldr	w7, [x7]  // guest 0xffffffce, sampled 1
6ea842257c:    	mov	w8, #0x2120             // =8480  // guest 0xffffffce, sampled 1
6ea8422580:    	and	w7, w7, w8  // guest 0xffffffce, sampled 6
6ea8422584:    	cbnz	w7, 0x6ea8422688 <trace+0x188>  // guest 0xffffffce, sampled 2
6ea8422588:    	adrp	x7, 0x6efd024000 <trace+0x54c02000>  // guest 0xffffffce, sampled 4
6ea842258c:    	add	x7, x7, #0xa90  // guest 0xffffffce, sampled 0
6ea8422590:    	ldrb	w7, [x7]  // guest 0xffffffce, sampled 1
6ea8422594:    	cbnz	w7, 0x6ea8422688 <trace+0x188>  // guest 0xffffffce, sampled 0
6ea8422598:    	ldr	w5, [x0, #0x3c]  // guest 0xffffffce, sampled 1
6ea842259c:    	mov	w7, #0x8090             // =32912  // guest 0xffffffce, sampled 3
6ea84225a0:    	and	w7, w5, w7  // guest 0xffffffce, sampled 0
6ea84225a4:    	mov	w8, #0x90               // =144  // guest 0xffffffce, sampled 0
6ea84225a8:    	cmp	w7, w8  // guest 0xffffffce, sampled 4
6ea84225ac:    	b.ne	0x6ea8422688 <trace+0x188>  // guest 0xffffffce, sampled 0
6ea84225b0:    	ldr	w7, [x0, #0x58]  // guest 0xffffffce, sampled 2
6ea84225b4:    	cbnz	w7, 0x6ea8422688 <trace+0x188>  // guest 0xffffffce, sampled 1
6ea84225b8:    	ldr	w7, [x0, #0x24]  // guest 0xffffffce, sampled 2
6ea84225bc:    	mov	w8, #0x3100             // =12544  // guest 0xffffffce, sampled 4
6ea84225c0:    	movk	w8, #0x7, lsl #16  // guest 0xffffffce, sampled 5
6ea84225c4:    	and	w7, w7, w8  // guest 0xffffffce, sampled 6
6ea84225c8:    	orr	w5, w5, w7  // guest 0xffffffce, sampled 3
6ea84225cc:    	ldr	w4, [x0, #0x20]  // guest 0xffffffce, sampled 2
6ea84225d0:    	ldr	w6, [x1, #0x334]  // guest 0xffffffce, sampled 7
6ea84225d4:    	lsr	w7, w4, #5  // guest 0xffffffce, sampled 3
6ea84225d8:    	eor	w7, w7, w4  // guest 0xffffffce, sampled 1
6ea84225dc:    	lsr	w8, w7, #5  // guest 0xffffffce, sampled 1
6ea84225e0:    	and	w8, w8, #0x3f80  // guest 0xffffffce, sampled 0
6ea84225e4:    	and	w7, w7, #0x7f  // guest 0xffffffce, sampled 4
6ea84225e8:    	orr	w7, w7, w8  // guest 0xffffffce, sampled 2
6ea84225ec:    	ldr	x3, [x1, #0x258]  // guest 0xffffffce, sampled 6
6ea84225f0:    	mov	w16, #0x10              // =16  // guest 0xffffffce, sampled 2
6ea84225f4:    	movk	w16, #0x8, lsl #16  // guest 0xffffffce, sampled 1
6ea84225f8:    	ldr	w8, [x3, x16]  // guest 0xffffffce, sampled 2
6ea84225fc:    	add	x4, x4, x8, lsl #32  // guest 0xffffffce, sampled 9
6ea8422600:    	add	x3, x3, x7, lsl #4  // guest 0xffffffce, sampled 0
6ea8422604:    	add	x3, x3, #0x10  // guest 0xffffffce, sampled 7
6ea8422608:    	ldr	x2, [x3]  // guest 0xffffffce, sampled 2
6ea842260c:    	cbz	x2, 0x6ea8422644 <trace+0x144>  // guest 0xffffffce, sampled 224
6ea8422610:    	ldr	x7, [x3, #0x8]  // guest 0xffffffce, sampled 20
6ea8422614:    	cmp	x7, x4  // guest 0xffffffce, sampled 2
6ea8422618:    	b.ne	0x6ea8422644 <trace+0x144>  // guest 0xffffffce, sampled 0
6ea842261c:    	ldr	x7, [x2, #0x8]  // guest 0xffffffce, sampled 8
6ea8422620:    	cbnz	x7, 0x6ea8422644 <trace+0x144>  // guest 0xffffffce, sampled 173
6ea8422624:    	ldr	w7, [x2, #0x10]  // guest 0xffffffce, sampled 20
6ea8422628:    	cmp	w7, w5  // guest 0xffffffce, sampled 19
6ea842262c:    	b.ne	0x6ea8422644 <trace+0x144>  // guest 0xffffffce, sampled 0
6ea8422630:    	ldr	w7, [x2, #0x14]  // guest 0xffffffce, sampled 6
6ea8422634:    	cmp	w7, w6  // guest 0xffffffce, sampled 6
6ea8422638:    	b.ne	0x6ea8422644 <trace+0x144>  // guest 0xffffffce, sampled 0
6ea842263c:    	ldr	x0, [x2, #0x28]  // guest 0xffffffce, sampled 4
6ea8422640:    	b	0x6ea84226a4 <trace+0x1a4>  // guest 0xffffffce, sampled 0
6ea8422644:    	orr	w7, wzr, #0x40000  // guest 0xffffffce, sampled 5
6ea8422648:    	add	x3, x3, x7  // guest 0xffffffce, sampled 3
6ea842264c:    	ldr	x2, [x3]  // guest 0xffffffce, sampled 0
6ea8422650:    	cbz	x2, 0x6ea8422688 <trace+0x188>  // guest 0xffffffce, sampled 62
6ea8422654:    	ldr	x7, [x3, #0x8]  // guest 0xffffffce, sampled 0
6ea8422658:    	cmp	x7, x4  // guest 0xffffffce, sampled 1
6ea842265c:    	b.ne	0x6ea8422688 <trace+0x188>  // guest 0xffffffce, sampled 0
6ea8422660:    	ldr	x7, [x2, #0x8]  // guest 0xffffffce, sampled 1
6ea8422664:    	cbnz	x7, 0x6ea8422688 <trace+0x188>  // guest 0xffffffce, sampled 14
6ea8422668:    	ldr	w7, [x2, #0x10]  // guest 0xffffffce, sampled 2
6ea842266c:    	cmp	w7, w5  // guest 0xffffffce, sampled 0
6ea8422670:    	b.ne	0x6ea8422688 <trace+0x188>  // guest 0xffffffce, sampled 0
6ea8422674:    	ldr	w7, [x2, #0x14]  // guest 0xffffffce, sampled 2
6ea8422678:    	cmp	w7, w6  // guest 0xffffffce, sampled 2
6ea842267c:    	b.ne	0x6ea8422688 <trace+0x188>  // guest 0xffffffce, sampled 0
6ea8422680:    	ldr	x0, [x2, #0x28]  // guest 0xffffffce, sampled 2
6ea8422684:    	b	0x6ea84226a4 <trace+0x1a4>  // guest 0xffffffce, sampled 0
6ea8422688:    	dmb	ish  // guest 0xffffffce, sampled 0
6ea842268c:    	stp	xzr, x30, [sp, #-0x10]!  // guest 0xffffffce, sampled 5
6ea8422690:    	adrp	x16, 0x6efc869000 <trace+0x54447000>  // guest 0xffffffce, sampled 0
6ea8422694:    	add	x16, x16, #0xf84  // guest 0xffffffce, sampled 0
6ea8422698:    	blr	x16  // guest 0xffffffce, sampled 0
6ea842269c:    	dmb	ishld  // guest 0xffffffce, sampled 0
6ea84226a0:    	ldp	xzr, x30, [sp], #0x10  // guest 0xffffffce, sampled 0
6ea84226a4:    	ret  // guest 0xffffffce, sampled 3
6ea84226a8:    	bl	0x6ea842253c <trace+0x3c>  // guest 0xffffffce, sampled 0
6ea84226ac:    	br	x0  // guest 0xffffffce, sampled 0
6ea84226b0:    	adr	x0, 0x6ea8422443 <trace+0xffffffffffffff43>  // guest 0xffffffce, sampled 0
6ea84226b4:    	b	0x6ea842202c <trace+0xfffffffffffffb2c>  // guest 0xffffffce, sampled 0