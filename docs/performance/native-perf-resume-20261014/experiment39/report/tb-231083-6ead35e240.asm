
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-231083-6ead35e240.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006ead35e240 <trace>:
6ead35e240:    	ldur	w20, [x19, #-0x10]  // guest 0x231083, sampled 0
6ead35e244:    	tbnz	w20, #0x1f, 0x6ead35e370 <trace+0x130>  // guest 0x231083, sampled 0
6ead35e248:    	sturb	wzr, [x19, #-0xc]  // guest 0x231083, sampled 0
6ead35e24c:    	ldr	w20, [x19, #0x10]  // guest 0x231083, sampled 1
6ead35e250:    	add	w21, w20, #0x14  // guest 0x231083, sampled 0
6ead35e254:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x231083, sampled 0
6ead35e258:    	and	x16, x16, x21, lsr #7  // guest 0x231083, sampled 0
6ead35e25c:    	add	x17, x17, x16  // guest 0x231083, sampled 0
6ead35e260:    	ldp	x16, x17, [x17]  // guest 0x231083, sampled 0
6ead35e264:    	and	w30, w21, #0xfffff003  // guest 0x231083, sampled 0
6ead35e268:    	cmp	w16, w30  // guest 0x231083, sampled 0
6ead35e26c:    	b.ne	0x6ead35e378 <trace+0x138>  // guest 0x231083, sampled 0
6ead35e270:    	add	x30, x17, w21, uxtw  // guest 0x231083, sampled 0
6ead35e274:    	ldapr	w21, [x30]  // guest 0x231083, sampled 0
6ead35e278:    	str	w21, [x19, #0x4]  // guest 0x231083, sampled 2
6ead35e27c:    	add	w21, w20, #0x28  // guest 0x231087, sampled 0
6ead35e280:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x231087, sampled 0
6ead35e284:    	and	x16, x16, x21, lsr #7  // guest 0x231087, sampled 0
6ead35e288:    	add	x17, x17, x16  // guest 0x231087, sampled 0
6ead35e28c:    	ldp	x16, x17, [x17]  // guest 0x231087, sampled 0
6ead35e290:    	and	w30, w21, #0xfffff003  // guest 0x231087, sampled 0
6ead35e294:    	cmp	w16, w30  // guest 0x231087, sampled 0
6ead35e298:    	b.ne	0x6ead35e3a4 <trace+0x164>  // guest 0x231087, sampled 0
6ead35e29c:    	add	x30, x17, w21, uxtw  // guest 0x231087, sampled 1
6ead35e2a0:    	ldapr	w21, [x30]  // guest 0x231087, sampled 0
6ead35e2a4:    	str	w21, [x19, #0x1c]  // guest 0x231087, sampled 1
6ead35e2a8:    	add	w20, w20, #0x1c  // guest 0x23108b, sampled 0
6ead35e2ac:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x23108b, sampled 0
6ead35e2b0:    	and	x16, x16, x20, lsr #7  // guest 0x23108b, sampled 0
6ead35e2b4:    	add	x17, x17, x16  // guest 0x23108b, sampled 0
6ead35e2b8:    	ldp	x16, x17, [x17]  // guest 0x23108b, sampled 0
6ead35e2bc:    	and	w30, w20, #0xfffff003  // guest 0x23108b, sampled 1
6ead35e2c0:    	cmp	w16, w30  // guest 0x23108b, sampled 0
6ead35e2c4:    	b.ne	0x6ead35e3d0 <trace+0x190>  // guest 0x23108b, sampled 0
6ead35e2c8:    	add	x30, x17, w20, uxtw  // guest 0x23108b, sampled 0
6ead35e2cc:    	ldapr	w20, [x30]  // guest 0x23108b, sampled 0
6ead35e2d0:    	and	w20, w20, #0xf  // guest 0x23108f, sampled 0
6ead35e2d4:    	str	w20, [x19]  // guest 0x23108f, sampled 0
6ead35e2d8:    	str	w20, [x19, #0x28]  // guest 0x23108f, sampled 0
6ead35e2dc:    	lsl	w20, w20, #2  // guest 0x231092, sampled 0
6ead35e2e0:    	mov	w21, #0x88a8            // =34984  // guest 0x231092, sampled 0
6ead35e2e4:    	movk	w21, #0x44, lsl #16  // guest 0x231092, sampled 0
6ead35e2e8:    	add	w20, w20, w21  // guest 0x231092, sampled 0
6ead35e2ec:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x231092, sampled 0
6ead35e2f0:    	and	x16, x16, x20, lsr #7  // guest 0x231092, sampled 1
6ead35e2f4:    	add	x17, x17, x16  // guest 0x231092, sampled 0
6ead35e2f8:    	ldp	x16, x17, [x17]  // guest 0x231092, sampled 0
6ead35e2fc:    	and	w30, w20, #0xfffff003  // guest 0x231092, sampled 4
6ead35e300:    	cmp	w16, w30  // guest 0x231092, sampled 0
6ead35e304:    	b.ne	0x6ead35e3fc <trace+0x1bc>  // guest 0x231092, sampled 0
6ead35e308:    	add	x30, x17, w20, uxtw  // guest 0x231092, sampled 0
6ead35e30c:    	ldapr	w20, [x30]  // guest 0x231092, sampled 0
6ead35e310:    	ldr	w21, [x19, #0x8]  // guest 0x231092, sampled 8
6ead35e314:    	add	w21, w21, w20  // guest 0x231092, sampled 0
6ead35e318:    	str	w21, [x19, #0x8]  // guest 0x231092, sampled 0
6ead35e31c:    	str	w21, [x19, #0x28]  // guest 0x231092, sampled 0
6ead35e320:    	str	w20, [x19, #0x2c]  // guest 0x231092, sampled 0
6ead35e324:    	mov	w20, #0x1               // =1  // guest 0x231092, sampled 0
6ead35e328:    	sturb	w20, [x19, #-0xc]  // guest 0x231092, sampled 0
6ead35e32c:    	mov	w20, #0xa               // =10  // guest 0x231099, sampled 0
6ead35e330:    	str	w20, [x19, #0x34]  // guest 0x231099, sampled 1
6ead35e334:    	tbz	w21, #0x1f, 0x6ead35e354 <trace+0x114>  // guest 0x231099, sampled 0
6ead35e338:    	b	0x6ead35e338 <trace+0xf8>  // guest 0x231099, sampled 0
6ead35e33c:    	br	x16  // guest 0x231099, sampled 0
6ead35e340:    	mov	w20, #0x109b            // =4251  // guest 0x231099, sampled 0
6ead35e344:    	movk	w20, #0x23, lsl #16  // guest 0x231099, sampled 0
6ead35e348:    	str	w20, [x19, #0x20]  // guest 0x231099, sampled 0
6ead35e34c:    	adr	x0, 0x6ead35e181 <trace+0xffffffffffffff41>  // guest 0x231099, sampled 0
6ead35e350:    	b	0x6ea842202c <trace+0xfffffffffb0c3dec>  // guest 0x231099, sampled 0
6ead35e354:    	b	0x6ead35e354 <trace+0x114>  // guest 0x231099, sampled 0
6ead35e358:    	br	x16  // guest 0x231099, sampled 0
6ead35e35c:    	mov	w20, #0x109f            // =4255  // guest 0x231099, sampled 0
6ead35e360:    	movk	w20, #0x23, lsl #16  // guest 0x231099, sampled 0
6ead35e364:    	str	w20, [x19, #0x20]  // guest 0x231099, sampled 0
6ead35e368:    	adr	x0, 0x6ead35e180 <trace+0xffffffffffffff40>  // guest 0x231099, sampled 0
6ead35e36c:    	b	0x6ea842202c <trace+0xfffffffffb0c3dec>  // guest 0x231099, sampled 0
6ead35e370:    	adr	x0, 0x6ead35e183 <trace+0xffffffffffffff43>  // guest 0x231099, sampled 0
6ead35e374:    	b	0x6ea842202c <trace+0xfffffffffb0c3dec>  // guest 0x231099, sampled 0
6ead35e378:    	mov	w1, w21
6ead35e37c:    	mov	x0, x19
6ead35e380:    	mov	w2, #0x4045             // =16453
6ead35e384:    	movk	w2, #0x1, lsl #16
6ead35e388:    	adr	x3, 0x6ead35e278 <trace+0x38>
6ead35e38c:    	adrp	x16, 0x6efc87d000 <trace+0x4f51f000>
6ead35e390:    	add	x16, x16, #0x58
6ead35e394:    	blr	x16
6ead35e398:    	mov	w21, w0
6ead35e39c:    	dmb	ishld
6ead35e3a0:    	b	0x6ead35e278 <trace+0x38>
6ead35e3a4:    	mov	w1, w21
6ead35e3a8:    	mov	x0, x19
6ead35e3ac:    	mov	w2, #0x4045             // =16453
6ead35e3b0:    	movk	w2, #0x1, lsl #16
6ead35e3b4:    	adr	x3, 0x6ead35e2a4 <trace+0x64>
6ead35e3b8:    	adrp	x16, 0x6efc87d000 <trace+0x4f51f000>
6ead35e3bc:    	add	x16, x16, #0x58
6ead35e3c0:    	blr	x16
6ead35e3c4:    	mov	w21, w0
6ead35e3c8:    	dmb	ishld
6ead35e3cc:    	b	0x6ead35e2a4 <trace+0x64>
6ead35e3d0:    	mov	w1, w20
6ead35e3d4:    	mov	x0, x19
6ead35e3d8:    	mov	w2, #0x4045             // =16453
6ead35e3dc:    	movk	w2, #0x1, lsl #16
6ead35e3e0:    	adr	x3, 0x6ead35e2d0 <trace+0x90>
6ead35e3e4:    	adrp	x16, 0x6efc87d000 <trace+0x4f51f000>
6ead35e3e8:    	add	x16, x16, #0x58
6ead35e3ec:    	blr	x16
6ead35e3f0:    	mov	w20, w0
6ead35e3f4:    	dmb	ishld
6ead35e3f8:    	b	0x6ead35e2d0 <trace+0x90>
6ead35e3fc:    	mov	w1, w20
6ead35e400:    	mov	x0, x19
6ead35e404:    	mov	w2, #0x4045             // =16453
6ead35e408:    	movk	w2, #0x1, lsl #16
6ead35e40c:    	adr	x3, 0x6ead35e310 <trace+0xd0>
6ead35e410:    	adrp	x16, 0x6efc87d000 <trace+0x4f51f000>
6ead35e414:    	add	x16, x16, #0x58
6ead35e418:    	blr	x16
6ead35e41c:    	mov	w20, w0
6ead35e420:    	dmb	ishld
6ead35e424:    	b	0x6ead35e310 <trace+0xd0>