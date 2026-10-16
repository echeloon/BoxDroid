
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-4391d-6eabc83140.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006eabc83140 <trace>:
6eabc83140:    	ldur	w20, [x19, #-0x10]  // guest 0x4391d, sampled 0
6eabc83144:    	tbnz	w20, #0x1f, 0x6eabc83294 <trace+0x154>  // guest 0x4391d, sampled 0
6eabc83148:    	sturb	wzr, [x19, #-0xc]  // guest 0x4391d, sampled 0
6eabc8314c:    	ldr	w20, [x19, #0x14]  // guest 0x4391d, sampled 3
6eabc83150:    	sub	w21, w20, #0x4  // guest 0x4391d, sampled 0
6eabc83154:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x4391d, sampled 0
6eabc83158:    	and	x16, x16, x21, lsr #7  // guest 0x4391d, sampled 0
6eabc8315c:    	add	x17, x17, x16  // guest 0x4391d, sampled 0
6eabc83160:    	ldp	x16, x17, [x17]  // guest 0x4391d, sampled 0
6eabc83164:    	and	w30, w21, #0xfffff003  // guest 0x4391d, sampled 0
6eabc83168:    	cmp	w16, w30  // guest 0x4391d, sampled 0
6eabc8316c:    	b.ne	0x6eabc8329c <trace+0x15c>  // guest 0x4391d, sampled 2
6eabc83170:    	add	x30, x17, w21, uxtw  // guest 0x4391d, sampled 0
6eabc83174:    	ldapr	w21, [x30]  // guest 0x4391d, sampled 0
6eabc83178:    	add	w21, w21, #0x1  // guest 0x43920, sampled 0
6eabc8317c:    	str	w21, [x19, #0x4]  // guest 0x43920, sampled 0
6eabc83180:    	str	w21, [x19, #0x28]  // guest 0x43920, sampled 0
6eabc83184:    	mov	w22, #0x1               // =1  // guest 0x43920, sampled 0
6eabc83188:    	str	w22, [x19, #0x2c]  // guest 0x43920, sampled 0
6eabc8318c:    	sub	w22, w20, #0x4  // guest 0x43923, sampled 0
6eabc83190:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x43923, sampled 1
6eabc83194:    	and	x16, x16, x22, lsr #7  // guest 0x43923, sampled 0
6eabc83198:    	add	x17, x17, x16  // guest 0x43923, sampled 0
6eabc8319c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x43923, sampled 0
6eabc831a0:    	and	w30, w22, #0xfffff003  // guest 0x43923, sampled 0
6eabc831a4:    	cmp	w16, w30  // guest 0x43923, sampled 0
6eabc831a8:    	b.ne	0x6eabc832c8 <trace+0x188>  // guest 0x43923, sampled 0
6eabc831ac:    	add	x30, x17, w22, uxtw  // guest 0x43923, sampled 0
6eabc831b0:    	stlr	w21, [x30]  // guest 0x43923, sampled 0
6eabc831b4:    	add	w21, w20, #0xc  // guest 0x43926, sampled 1
6eabc831b8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x43926, sampled 0
6eabc831bc:    	and	x16, x16, x21, lsr #7  // guest 0x43926, sampled 0
6eabc831c0:    	add	x17, x17, x16  // guest 0x43926, sampled 0
6eabc831c4:    	ldp	x16, x17, [x17]  // guest 0x43926, sampled 0
6eabc831c8:    	and	w30, w21, #0xfffff003  // guest 0x43926, sampled 0
6eabc831cc:    	cmp	w16, w30  // guest 0x43926, sampled 0
6eabc831d0:    	b.ne	0x6eabc832f4 <trace+0x1b4>  // guest 0x43926, sampled 0
6eabc831d4:    	add	x30, x17, w21, uxtw  // guest 0x43926, sampled 0
6eabc831d8:    	ldapr	w21, [x30]  // guest 0x43926, sampled 0
6eabc831dc:    	str	w21, [x19, #0x8]  // guest 0x43926, sampled 0
6eabc831e0:    	sub	w20, w20, #0x4  // guest 0x43929, sampled 0
6eabc831e4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x43929, sampled 0
6eabc831e8:    	and	x16, x16, x20, lsr #7  // guest 0x43929, sampled 0
6eabc831ec:    	add	x17, x17, x16  // guest 0x43929, sampled 0
6eabc831f0:    	ldp	x16, x17, [x17]  // guest 0x43929, sampled 0
6eabc831f4:    	and	w30, w20, #0xfffff003  // guest 0x43929, sampled 0
6eabc831f8:    	cmp	w16, w30  // guest 0x43929, sampled 0
6eabc831fc:    	b.ne	0x6eabc83320 <trace+0x1e0>  // guest 0x43929, sampled 0
6eabc83200:    	add	x30, x17, w20, uxtw  // guest 0x43929, sampled 0
6eabc83204:    	ldapr	w20, [x30]  // guest 0x43929, sampled 0
6eabc83208:    	add	w21, w21, w20  // guest 0x43929, sampled 0
6eabc8320c:    	str	w21, [x19, #0x8]  // guest 0x43929, sampled 0
6eabc83210:    	str	w21, [x19, #0x28]  // guest 0x43929, sampled 0
6eabc83214:    	str	w20, [x19, #0x2c]  // guest 0x43929, sampled 0
6eabc83218:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x4392c, sampled 0
6eabc8321c:    	and	x16, x16, x21, lsr #7  // guest 0x4392c, sampled 0
6eabc83220:    	add	x17, x17, x16  // guest 0x4392c, sampled 0
6eabc83224:    	ldp	x16, x17, [x17]  // guest 0x4392c, sampled 0
6eabc83228:    	and	w30, w21, #0xfffff000  // guest 0x4392c, sampled 8
6eabc8322c:    	cmp	w16, w30  // guest 0x4392c, sampled 0
6eabc83230:    	b.ne	0x6eabc8334c <trace+0x20c>  // guest 0x4392c, sampled 0
6eabc83234:    	add	x30, x17, w21, uxtw  // guest 0x4392c, sampled 0
6eabc83238:    	ldaprb	w20, [x30]  // guest 0x4392c, sampled 0
6eabc8323c:    	sxtb	w20, w20  // guest 0x4392c, sampled 8
6eabc83240:    	str	w20, [x19]  // guest 0x4392c, sampled 0
6eabc83244:    	str	w20, [x19, #0x28]  // guest 0x4392f, sampled 0
6eabc83248:    	mov	w21, #0x1               // =1  // guest 0x4392f, sampled 0
6eabc8324c:    	sturb	w21, [x19, #-0xc]  // guest 0x4392f, sampled 0
6eabc83250:    	mov	w21, #0x1a              // =26  // guest 0x43931, sampled 0
6eabc83254:    	str	w21, [x19, #0x34]  // guest 0x43931, sampled 0
6eabc83258:    	cbz	w20, 0x6eabc83278 <trace+0x138>  // guest 0x43931, sampled 0
6eabc8325c:    	b	0x6eabc8325c <trace+0x11c>  // guest 0x43931, sampled 4
6eabc83260:    	br	x16  // guest 0x43931, sampled 0
6eabc83264:    	mov	w20, #0x3933            // =14643  // guest 0x43931, sampled 0
6eabc83268:    	movk	w20, #0x4, lsl #16  // guest 0x43931, sampled 0
6eabc8326c:    	str	w20, [x19, #0x20]  // guest 0x43931, sampled 0
6eabc83270:    	adr	x0, 0x6eabc83081 <trace+0xffffffffffffff41>  // guest 0x43931, sampled 0
6eabc83274:    	b	0x6ea842202c <trace+0xfffffffffc79eeec>  // guest 0x43931, sampled 0
6eabc83278:    	b	0x6eabc83278 <trace+0x138>  // guest 0x43931, sampled 0
6eabc8327c:    	br	x16  // guest 0x43931, sampled 0
6eabc83280:    	mov	w20, #0x3950            // =14672  // guest 0x43931, sampled 0
6eabc83284:    	movk	w20, #0x4, lsl #16  // guest 0x43931, sampled 0
6eabc83288:    	str	w20, [x19, #0x20]  // guest 0x43931, sampled 0
6eabc8328c:    	adr	x0, 0x6eabc83080 <trace+0xffffffffffffff40>  // guest 0x43931, sampled 0
6eabc83290:    	b	0x6ea842202c <trace+0xfffffffffc79eeec>  // guest 0x43931, sampled 0
6eabc83294:    	adr	x0, 0x6eabc83083 <trace+0xffffffffffffff43>  // guest 0x43931, sampled 0
6eabc83298:    	b	0x6ea842202c <trace+0xfffffffffc79eeec>  // guest 0x43931, sampled 0
6eabc8329c:    	mov	w1, w21
6eabc832a0:    	mov	x0, x19
6eabc832a4:    	mov	w2, #0x4045             // =16453
6eabc832a8:    	movk	w2, #0x1, lsl #16
6eabc832ac:    	adr	x3, 0x6eabc83178 <trace+0x38>
6eabc832b0:    	adrp	x16, 0x6efc87d000 <trace+0x50bfa000>
6eabc832b4:    	add	x16, x16, #0x58
6eabc832b8:    	blr	x16
6eabc832bc:    	mov	w21, w0
6eabc832c0:    	dmb	ishld
6eabc832c4:    	b	0x6eabc83178 <trace+0x38>
6eabc832c8:    	mov	w1, w22
6eabc832cc:    	mov	w2, w21
6eabc832d0:    	mov	x0, x19
6eabc832d4:    	mov	w3, #0x4045             // =16453
6eabc832d8:    	movk	w3, #0x1, lsl #16
6eabc832dc:    	adr	x4, 0x6eabc831b4 <trace+0x74>
6eabc832e0:    	adrp	x16, 0x6efc87d000 <trace+0x50bfa000>
6eabc832e4:    	add	x16, x16, #0xc38
6eabc832e8:    	blr	x16
6eabc832ec:    	dmb	ishld
6eabc832f0:    	b	0x6eabc831b4 <trace+0x74>
6eabc832f4:    	mov	w1, w21
6eabc832f8:    	mov	x0, x19
6eabc832fc:    	mov	w2, #0x4045             // =16453
6eabc83300:    	movk	w2, #0x1, lsl #16
6eabc83304:    	adr	x3, 0x6eabc831dc <trace+0x9c>
6eabc83308:    	adrp	x16, 0x6efc87d000 <trace+0x50bfa000>
6eabc8330c:    	add	x16, x16, #0x58
6eabc83310:    	blr	x16
6eabc83314:    	mov	w21, w0
6eabc83318:    	dmb	ishld
6eabc8331c:    	b	0x6eabc831dc <trace+0x9c>
6eabc83320:    	mov	w1, w20
6eabc83324:    	mov	x0, x19
6eabc83328:    	mov	w2, #0x4045             // =16453
6eabc8332c:    	movk	w2, #0x1, lsl #16
6eabc83330:    	adr	x3, 0x6eabc83208 <trace+0xc8>
6eabc83334:    	adrp	x16, 0x6efc87d000 <trace+0x50bfa000>
6eabc83338:    	add	x16, x16, #0x58
6eabc8333c:    	blr	x16
6eabc83340:    	mov	w20, w0
6eabc83344:    	dmb	ishld
6eabc83348:    	b	0x6eabc83208 <trace+0xc8>
6eabc8334c:    	mov	w1, w21
6eabc83350:    	mov	x0, x19
6eabc83354:    	mov	w2, #0x5d05             // =23813
6eabc83358:    	movk	w2, #0x1, lsl #16
6eabc8335c:    	adr	x3, 0x6eabc83240 <trace+0x100>
6eabc83360:    	adrp	x16, 0x6efc87c000 <trace+0x50bf9000>
6eabc83364:    	add	x16, x16, #0xcec
6eabc83368:    	blr	x16
6eabc8336c:    	sxtb	w20, w0
6eabc83370:    	dmb	ishld
6eabc83374:    	b	0x6eabc83240 <trace+0x100>