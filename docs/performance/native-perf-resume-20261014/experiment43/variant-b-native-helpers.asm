
build/native-perf-run/guarded-x87-top-operands-standard-20261015/libboxdroid.so:	file format elf64-littleaarch64

Disassembly of section .text:

000000000108e2cc <helper_boxdroid_fxchg_top>:
 108e2cc:      	sub	sp, sp, #0x10
 108e2d0:      	ldr	q0, [x0]
 108e2d4:      	ldr	q1, [x1]
 108e2d8:      	str	q0, [x1]
 108e2dc:      	str	q1, [x0]
 108e2e0:      	add	sp, sp, #0x10
 108e2e4:      	mov	x0, #0x0                // =0
 108e2e8:      	mov	x1, #0x0                // =0
 108e2ec:      	ret

000000000108e2f0 <helper_boxdroid_fchs_top>:
 108e2f0:      	ldr	x8, [x0, #0x8]
 108e2f4:      	eor	x8, x8, #0x8000
 108e2f8:      	str	x8, [x0, #0x8]
 108e2fc:      	mov	x0, #0x0                // =0
 108e300:      	mov	x8, #0x0                // =0
 108e304:      	ret

000000000108e308 <helper_boxdroid_fabs_top>:
 108e308:      	ldr	x8, [x0, #0x8]
 108e30c:      	and	x8, x8, #0xffffffffffff7fff
 108e310:      	str	x8, [x0, #0x8]
 108e314:      	mov	x0, #0x0                // =0
 108e318:      	mov	x8, #0x0                // =0
 108e31c:      	ret

000000000108e320 <helper_boxdroid_fsqrt_top>:
 108e320:      	stp	x29, x30, [sp, #-0x30]!
 108e324:      	str	x21, [sp, #0x10]
 108e328:      	stp	x20, x19, [sp, #0x20]
 108e32c:      	mov	x29, sp
 108e330:      	ldrh	w21, [x0, #0x238]
 108e334:      	mov	x20, x1
 108e338:      	mov	x19, x0
 108e33c:      	strh	wzr, [x0, #0x238]
 108e340:      	tbz	w21, #0x4, 0x108e35c <helper_boxdroid_fsqrt_top+0x3c>
 108e344:      	ldrh	w8, [x19, #0x18c]
 108e348:      	tbz	w8, #0x5, 0x108e35c <helper_boxdroid_fsqrt_top+0x3c>
 108e34c:      	ldrh	w8, [x19, #0x18e]
 108e350:      	tbz	w8, #0x5, 0x108e35c <helper_boxdroid_fsqrt_top+0x3c>
 108e354:      	mov	w8, #0x10               // =16
 108e358:      	strh	w8, [x19, #0x238]
 108e35c:      	ldr	x1, [x20, #0x8]
 108e360:      	tbz	w1, #0xf, 0x108e37c <helper_boxdroid_fsqrt_top+0x5c>
 108e364:      	ldrh	w8, [x19, #0x18c]
 108e368:      	mov	w9, #0xb8ff             // =47359
 108e36c:      	and	w8, w8, w9
 108e370:      	orr	w8, w8, #0x400
 108e374:      	strh	w8, [x19, #0x18c]
 108e378:      	ldr	x1, [x20, #0x8]
 108e37c:      	ldr	x0, [x20]
 108e380:      	add	x2, x19, #0x238
 108e384:      	bl	0xea49d8 <floatx80_sqrt>
 108e388:      	stp	x0, x1, [x20]
 108e38c:      	ldrh	w9, [x19, #0x238]
 108e390:      	ldrh	w12, [x19, #0x18c]
 108e394:      	lsr	w8, w9, #1
 108e398:      	lsr	w10, w9, #13
 108e39c:      	and	w11, w9, #0x1
 108e3a0:      	orr	w9, w9, w21
 108e3a4:      	bfi	w11, w8, #2, #4
 108e3a8:      	and	w8, w10, #0x2
 108e3ac:      	ldrh	w10, [x19, #0x18e]
 108e3b0:      	orr	w8, w8, w12
 108e3b4:      	strh	w9, [x19, #0x238]
 108e3b8:      	orr	w8, w11, w8
 108e3bc:      	bic	w10, w8, w10
 108e3c0:      	strh	w8, [x19, #0x18c]
 108e3c4:      	tst	w10, #0x3f
 108e3c8:      	b.eq	0x108e3d4 <helper_boxdroid_fsqrt_top+0xb4>
 108e3cc:      	orr	w8, w8, #0x80808080
 108e3d0:      	strh	w8, [x19, #0x18c]
 108e3d4:      	ldp	x20, x19, [sp, #0x20]
 108e3d8:      	ldr	x21, [sp, #0x10]
 108e3dc:      	ldp	x29, x30, [sp], #0x30
 108e3e0:      	mov	x0, #0x0                // =0
 108e3e4:      	mov	x1, #0x0                // =0
 108e3e8:      	mov	x2, #0x0                // =0
 108e3ec:      	mov	x8, #0x0                // =0
 108e3f0:      	mov	x9, #0x0                // =0
 108e3f4:      	mov	x10, #0x0               // =0
 108e3f8:      	mov	x11, #0x0               // =0
 108e3fc:      	mov	x12, #0x0               // =0
 108e400:      	ret

000000000108e404 <helper_boxdroid_fsin_top>:
 108e404:      	stp	x29, x30, [sp, #-0x20]!
 108e408:      	stp	x20, x19, [sp, #0x10]
 108e40c:      	mov	x29, sp
 108e410:      	mov	x20, x1
 108e414:      	ldp	x8, x1, [x1]
 108e418:      	mov	x19, x0
 108e41c:      	add	x2, x0, #0x238
 108e420:      	mov	x0, x8
 108e424:      	bl	0xea2328 <floatx80_to_float64>
 108e428:      	fmov	d0, x0
 108e42c:      	mov	x8, #0x43e0000000000000 // =4890909195324358656
 108e430:      	fmov	d2, x8
 108e434:      	fabs	d1, d0
 108e438:      	fcmp	d1, d2
 108e43c:      	b.le	0x108e44c <helper_boxdroid_fsin_top+0x48>
 108e440:      	ldrh	w8, [x19, #0x18c]
 108e444:      	orr	w8, w8, #0x400
 108e448:      	b	0x108e468 <helper_boxdroid_fsin_top+0x64>
 108e44c:      	bl	0x15d1b20 <sin@plt>
 108e450:      	fmov	x0, d0
 108e454:      	add	x1, x19, #0x238
 108e458:      	bl	0xea2724 <float64_to_floatx80>
 108e45c:      	stp	x0, x1, [x20]
 108e460:      	ldrh	w8, [x19, #0x18c]
 108e464:      	and	w8, w8, #0xfffffbff
 108e468:      	strh	w8, [x19, #0x18c]
 108e46c:      	ldp	x20, x19, [sp, #0x10]
 108e470:      	ldp	x29, x30, [sp], #0x20
 108e474:      	mov	x0, #0x0                // =0
 108e478:      	mov	x1, #0x0                // =0
 108e47c:      	mov	x2, #0x0                // =0
 108e480:      	mov	x8, #0x0                // =0
 108e484:      	ret

000000000108e488 <helper_boxdroid_fcos_top>:
 108e488:      	stp	x29, x30, [sp, #-0x20]!
 108e48c:      	stp	x20, x19, [sp, #0x10]
 108e490:      	mov	x29, sp
 108e494:      	mov	x20, x1
 108e498:      	ldp	x8, x1, [x1]
 108e49c:      	mov	x19, x0
 108e4a0:      	add	x2, x0, #0x238
 108e4a4:      	mov	x0, x8
 108e4a8:      	bl	0xea2328 <floatx80_to_float64>
 108e4ac:      	fmov	d0, x0
 108e4b0:      	mov	x8, #0x43e0000000000000 // =4890909195324358656
 108e4b4:      	fmov	d2, x8
 108e4b8:      	fabs	d1, d0
 108e4bc:      	fcmp	d1, d2
 108e4c0:      	b.le	0x108e4d0 <helper_boxdroid_fcos_top+0x48>
 108e4c4:      	ldrh	w8, [x19, #0x18c]
 108e4c8:      	orr	w8, w8, #0x400
 108e4cc:      	b	0x108e4ec <helper_boxdroid_fcos_top+0x64>
 108e4d0:      	bl	0x15d1a80 <cos@plt>
 108e4d4:      	fmov	x0, d0
 108e4d8:      	add	x1, x19, #0x238
 108e4dc:      	bl	0xea2724 <float64_to_floatx80>
 108e4e0:      	stp	x0, x1, [x20]
 108e4e4:      	ldrh	w8, [x19, #0x18c]
 108e4e8:      	and	w8, w8, #0xfffffbff
 108e4ec:      	strh	w8, [x19, #0x18c]
 108e4f0:      	ldp	x20, x19, [sp, #0x10]
 108e4f4:      	ldp	x29, x30, [sp], #0x20
 108e4f8:      	mov	x0, #0x0                // =0
 108e4fc:      	mov	x1, #0x0                // =0
 108e500:      	mov	x2, #0x0                // =0
 108e504:      	mov	x8, #0x0                // =0
 108e508:      	ret
