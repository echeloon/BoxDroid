
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-2310de-6c4fd96300.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006c4fd96300 <trace>:
6c4fd96300:    	ldur	w20, [x19, #-0x10]  // guest 0x2310de, sampled 0
6c4fd96304:    	tbnz	w20, #0x1f, 0x6c4fd96424 <trace+0x124>  // guest 0x2310de, sampled 0
6c4fd96308:    	sturb	wzr, [x19, #-0xc]  // guest 0x2310de, sampled 0
6c4fd9630c:    	ldr	w20, [x19, #0x10]  // guest 0x2310de, sampled 0
6c4fd96310:    	add	w21, w20, #0x20  // guest 0x2310de, sampled 0
6c4fd96314:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2310de, sampled 1
6c4fd96318:    	and	x16, x16, x21, lsr #7  // guest 0x2310de, sampled 0
6c4fd9631c:    	add	x17, x17, x16  // guest 0x2310de, sampled 1
6c4fd96320:    	ldp	x16, x17, [x17]  // guest 0x2310de, sampled 0
6c4fd96324:    	and	w30, w21, #0xfffff003  // guest 0x2310de, sampled 2
6c4fd96328:    	cmp	w16, w30  // guest 0x2310de, sampled 0
6c4fd9632c:    	b.ne	0x6c4fd9642c <trace+0x12c>  // guest 0x2310de, sampled 0
6c4fd96330:    	add	x30, x17, w21, uxtw  // guest 0x2310de, sampled 1
6c4fd96334:    	ldapr	w21, [x30]  // guest 0x2310de, sampled 0
6c4fd96338:    	str	w21, [x19, #0x18]  // guest 0x2310de, sampled 5
6c4fd9633c:    	ldr	w22, [x19, #0x8]  // guest 0x2310e2, sampled 0
6c4fd96340:    	lsl	w22, w22, #2  // guest 0x2310e2, sampled 0
6c4fd96344:    	mov	w23, #0x88e8            // =35048  // guest 0x2310e2, sampled 0
6c4fd96348:    	movk	w23, #0x44, lsl #16  // guest 0x2310e2, sampled 0
6c4fd9634c:    	add	w22, w22, w23  // guest 0x2310e2, sampled 0
6c4fd96350:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2310e2, sampled 0
6c4fd96354:    	and	x16, x16, x22, lsr #7  // guest 0x2310e2, sampled 0
6c4fd96358:    	add	x17, x17, x16  // guest 0x2310e2, sampled 1
6c4fd9635c:    	ldp	x16, x17, [x17]  // guest 0x2310e2, sampled 0
6c4fd96360:    	and	w30, w22, #0xfffff003  // guest 0x2310e2, sampled 0
6c4fd96364:    	cmp	w16, w30  // guest 0x2310e2, sampled 0
6c4fd96368:    	b.ne	0x6c4fd96458 <trace+0x158>  // guest 0x2310e2, sampled 0
6c4fd9636c:    	add	x30, x17, w22, uxtw  // guest 0x2310e2, sampled 0
6c4fd96370:    	ldapr	w22, [x30]  // guest 0x2310e2, sampled 0
6c4fd96374:    	str	w22, [x19]  // guest 0x2310e2, sampled 1
6c4fd96378:    	ldr	w22, [x19, #0x4]  // guest 0x2310e9, sampled 0
6c4fd9637c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2310e9, sampled 0
6c4fd96380:    	and	x16, x16, x21, lsr #7  // guest 0x2310e9, sampled 0
6c4fd96384:    	add	x17, x17, x16  // guest 0x2310e9, sampled 0
6c4fd96388:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2310e9, sampled 0
6c4fd9638c:    	and	w30, w21, #0xfffff001  // guest 0x2310e9, sampled 0
6c4fd96390:    	cmp	w16, w30  // guest 0x2310e9, sampled 0
6c4fd96394:    	b.ne	0x6c4fd96484 <trace+0x184>  // guest 0x2310e9, sampled 0
6c4fd96398:    	add	x30, x17, w21, uxtw  // guest 0x2310e9, sampled 1
6c4fd9639c:    	stlrh	w22, [x30]  // guest 0x2310e9, sampled 0
6c4fd963a0:    	add	w21, w21, #0x2  // guest 0x2310ec, sampled 2
6c4fd963a4:    	str	w21, [x19, #0x18]  // guest 0x2310ec, sampled 0
6c4fd963a8:    	ldr	w22, [x19, #0x14]  // guest 0x2310ef, sampled 0
6c4fd963ac:    	str	w22, [x19, #0x28]  // guest 0x2310ef, sampled 0
6c4fd963b0:    	add	w20, w20, #0x20  // guest 0x2310f1, sampled 0
6c4fd963b4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2310f1, sampled 0
6c4fd963b8:    	and	x16, x16, x20, lsr #7  // guest 0x2310f1, sampled 0
6c4fd963bc:    	add	x17, x17, x16  // guest 0x2310f1, sampled 0
6c4fd963c0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2310f1, sampled 0
6c4fd963c4:    	and	w30, w20, #0xfffff003  // guest 0x2310f1, sampled 0
6c4fd963c8:    	cmp	w16, w30  // guest 0x2310f1, sampled 0
6c4fd963cc:    	b.ne	0x6c4fd964b0 <trace+0x1b0>  // guest 0x2310f1, sampled 0
6c4fd963d0:    	add	x30, x17, w20, uxtw  // guest 0x2310f1, sampled 0
6c4fd963d4:    	stlr	w21, [x30]  // guest 0x2310f1, sampled 0
6c4fd963d8:    	mov	w20, #0x1               // =1  // guest 0x2310f1, sampled 0
6c4fd963dc:    	sturb	w20, [x19, #-0xc]  // guest 0x2310f1, sampled 0
6c4fd963e0:    	mov	w20, #0x1a              // =26  // guest 0x2310f5, sampled 0
6c4fd963e4:    	str	w20, [x19, #0x34]  // guest 0x2310f5, sampled 0
6c4fd963e8:    	cbz	w22, 0x6c4fd96408 <trace+0x108>  // guest 0x2310f5, sampled 0
6c4fd963ec:    	b	0x6c4fd963ec <trace+0xec>  // guest 0x2310f5, sampled 0
6c4fd963f0:    	br	x16  // guest 0x2310f5, sampled 0
6c4fd963f4:    	mov	w20, #0x10f7            // =4343  // guest 0x2310f5, sampled 0
6c4fd963f8:    	movk	w20, #0x23, lsl #16  // guest 0x2310f5, sampled 0
6c4fd963fc:    	str	w20, [x19, #0x20]  // guest 0x2310f5, sampled 0
6c4fd96400:    	adr	x0, 0x6c4fd96241 <trace+0xffffffffffffff41>  // guest 0x2310f5, sampled 0
6c4fd96404:    	b	0x6c4ae5d02c <trace+0xfffffffffb0c6d2c>  // guest 0x2310f5, sampled 0
6c4fd96408:    	b	0x6c4fd96408 <trace+0x108>  // guest 0x2310f5, sampled 0
6c4fd9640c:    	br	x16  // guest 0x2310f5, sampled 0
6c4fd96410:    	mov	w20, #0x1105            // =4357  // guest 0x2310f5, sampled 0
6c4fd96414:    	movk	w20, #0x23, lsl #16  // guest 0x2310f5, sampled 0
6c4fd96418:    	str	w20, [x19, #0x20]  // guest 0x2310f5, sampled 0
6c4fd9641c:    	adr	x0, 0x6c4fd96240 <trace+0xffffffffffffff40>  // guest 0x2310f5, sampled 0
6c4fd96420:    	b	0x6c4ae5d02c <trace+0xfffffffffb0c6d2c>  // guest 0x2310f5, sampled 0
6c4fd96424:    	adr	x0, 0x6c4fd96243 <trace+0xffffffffffffff43>  // guest 0x2310f5, sampled 0
6c4fd96428:    	b	0x6c4ae5d02c <trace+0xfffffffffb0c6d2c>  // guest 0x2310f5, sampled 0
6c4fd9642c:    	mov	w1, w21
6c4fd96430:    	mov	x0, x19
6c4fd96434:    	mov	w2, #0x4045             // =16453
6c4fd96438:    	movk	w2, #0x1, lsl #16
6c4fd9643c:    	adr	x3, 0x6c4fd96338 <trace+0x38>
6c4fd96440:    	adrp	x16, 0x6c97723000 <trace+0x4798d000>
6c4fd96444:    	add	x16, x16, #0xf88
6c4fd96448:    	blr	x16
6c4fd9644c:    	mov	w21, w0
6c4fd96450:    	dmb	ishld
6c4fd96454:    	b	0x6c4fd96338 <trace+0x38>
6c4fd96458:    	mov	w1, w22
6c4fd9645c:    	mov	x0, x19
6c4fd96460:    	mov	w2, #0x4045             // =16453
6c4fd96464:    	movk	w2, #0x1, lsl #16
6c4fd96468:    	adr	x3, 0x6c4fd96374 <trace+0x74>
6c4fd9646c:    	adrp	x16, 0x6c97723000 <trace+0x4798d000>
6c4fd96470:    	add	x16, x16, #0xf88
6c4fd96474:    	blr	x16
6c4fd96478:    	mov	w22, w0
6c4fd9647c:    	dmb	ishld
6c4fd96480:    	b	0x6c4fd96374 <trace+0x74>
6c4fd96484:    	mov	w1, w21
6c4fd96488:    	mov	w2, w22
6c4fd9648c:    	mov	x0, x19
6c4fd96490:    	mov	w3, #0x4025             // =16421
6c4fd96494:    	movk	w3, #0x1, lsl #16
6c4fd96498:    	adr	x4, 0x6c4fd963a0 <trace+0xa0>
6c4fd9649c:    	adrp	x16, 0x6c97724000 <trace+0x4798e000>
6c4fd964a0:    	add	x16, x16, #0x8f8
6c4fd964a4:    	blr	x16
6c4fd964a8:    	dmb	ishld
6c4fd964ac:    	b	0x6c4fd963a0 <trace+0xa0>
6c4fd964b0:    	mov	w1, w20
6c4fd964b4:    	mov	w2, w21
6c4fd964b8:    	mov	x0, x19
6c4fd964bc:    	mov	w3, #0x4045             // =16453
6c4fd964c0:    	movk	w3, #0x1, lsl #16
6c4fd964c4:    	adr	x4, 0x6c4fd963d8 <trace+0xd8>
6c4fd964c8:    	adrp	x16, 0x6c97724000 <trace+0x4798e000>
6c4fd964cc:    	add	x16, x16, #0xb68
6c4fd964d0:    	blr	x16
6c4fd964d4:    	dmb	ishld
6c4fd964d8:    	b	0x6c4fd963d8 <trace+0xd8>