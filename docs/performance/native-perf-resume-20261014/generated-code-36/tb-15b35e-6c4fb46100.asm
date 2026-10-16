
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-15b35e-6c4fb46100.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006c4fb46100 <trace>:
6c4fb46100:    	ldur	w20, [x19, #-0x10]  // guest 0x15b35e, sampled 0
6c4fb46104:    	tbnz	w20, #0x1f, 0x6c4fb4679c <trace+0x69c>  // guest 0x15b35e, sampled 0
6c4fb46108:    	sturb	wzr, [x19, #-0xc]  // guest 0x15b35e, sampled 0
6c4fb4610c:    	ldr	w20, [x19, #0x18]  // guest 0x15b35e, sampled 0
6c4fb46110:    	add	w21, w20, #0x88  // guest 0x15b35e, sampled 0
6c4fb46114:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b35e, sampled 0
6c4fb46118:    	and	x16, x16, x21, lsr #7  // guest 0x15b35e, sampled 0
6c4fb4611c:    	add	x17, x17, x16  // guest 0x15b35e, sampled 0
6c4fb46120:    	ldp	x16, x17, [x17]  // guest 0x15b35e, sampled 0
6c4fb46124:    	and	w30, w21, #0xfffff003  // guest 0x15b35e, sampled 0
6c4fb46128:    	cmp	w16, w30  // guest 0x15b35e, sampled 0
6c4fb4612c:    	b.ne	0x6c4fb467a4 <trace+0x6a4>  // guest 0x15b35e, sampled 0
6c4fb46130:    	add	x30, x17, w21, uxtw  // guest 0x15b35e, sampled 0
6c4fb46134:    	ldapr	w21, [x30]  // guest 0x15b35e, sampled 0
6c4fb46138:    	str	w21, [x19, #0x4]  // guest 0x15b35e, sampled 0
6c4fb4613c:    	ldr	w22, [x19, #0xc]  // guest 0x15b364, sampled 0
6c4fb46140:    	add	w23, w22, #0x88  // guest 0x15b364, sampled 0
6c4fb46144:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b364, sampled 0
6c4fb46148:    	and	x16, x16, x23, lsr #7  // guest 0x15b364, sampled 0
6c4fb4614c:    	add	x17, x17, x16  // guest 0x15b364, sampled 0
6c4fb46150:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b364, sampled 0
6c4fb46154:    	and	w30, w23, #0xfffff003  // guest 0x15b364, sampled 0
6c4fb46158:    	cmp	w16, w30  // guest 0x15b364, sampled 0
6c4fb4615c:    	b.ne	0x6c4fb467d0 <trace+0x6d0>  // guest 0x15b364, sampled 0
6c4fb46160:    	add	x30, x17, w23, uxtw  // guest 0x15b364, sampled 0
6c4fb46164:    	stlr	w21, [x30]  // guest 0x15b364, sampled 0
6c4fb46168:    	add	w21, w20, #0x8c  // guest 0x15b36a, sampled 0
6c4fb4616c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b36a, sampled 0
6c4fb46170:    	and	x16, x16, x21, lsr #7  // guest 0x15b36a, sampled 0
6c4fb46174:    	add	x17, x17, x16  // guest 0x15b36a, sampled 0
6c4fb46178:    	ldp	x16, x17, [x17]  // guest 0x15b36a, sampled 0
6c4fb4617c:    	and	w30, w21, #0xfffff003  // guest 0x15b36a, sampled 0
6c4fb46180:    	cmp	w16, w30  // guest 0x15b36a, sampled 0
6c4fb46184:    	b.ne	0x6c4fb467fc <trace+0x6fc>  // guest 0x15b36a, sampled 0
6c4fb46188:    	add	x30, x17, w21, uxtw  // guest 0x15b36a, sampled 0
6c4fb4618c:    	ldapr	w21, [x30]  // guest 0x15b36a, sampled 0
6c4fb46190:    	str	w21, [x19, #0x8]  // guest 0x15b36a, sampled 0
6c4fb46194:    	add	w23, w22, #0x8c  // guest 0x15b370, sampled 0
6c4fb46198:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b370, sampled 0
6c4fb4619c:    	and	x16, x16, x23, lsr #7  // guest 0x15b370, sampled 0
6c4fb461a0:    	add	x17, x17, x16  // guest 0x15b370, sampled 0
6c4fb461a4:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b370, sampled 0
6c4fb461a8:    	and	w30, w23, #0xfffff003  // guest 0x15b370, sampled 0
6c4fb461ac:    	cmp	w16, w30  // guest 0x15b370, sampled 0
6c4fb461b0:    	b.ne	0x6c4fb46828 <trace+0x728>  // guest 0x15b370, sampled 0
6c4fb461b4:    	add	x30, x17, w23, uxtw  // guest 0x15b370, sampled 1
6c4fb461b8:    	stlr	w21, [x30]  // guest 0x15b370, sampled 0
6c4fb461bc:    	add	w21, w20, #0x90  // guest 0x15b376, sampled 0
6c4fb461c0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b376, sampled 0
6c4fb461c4:    	and	x16, x16, x21, lsr #7  // guest 0x15b376, sampled 0
6c4fb461c8:    	add	x17, x17, x16  // guest 0x15b376, sampled 0
6c4fb461cc:    	ldp	x16, x17, [x17]  // guest 0x15b376, sampled 0
6c4fb461d0:    	and	w30, w21, #0xfffff000  // guest 0x15b376, sampled 0
6c4fb461d4:    	cmp	w16, w30  // guest 0x15b376, sampled 0
6c4fb461d8:    	b.ne	0x6c4fb46854 <trace+0x754>  // guest 0x15b376, sampled 0
6c4fb461dc:    	add	x30, x17, w21, uxtw  // guest 0x15b376, sampled 0
6c4fb461e0:    	ldaprb	w21, [x30]  // guest 0x15b376, sampled 0
6c4fb461e4:    	ldr	w23, [x19]  // guest 0x15b376, sampled 0
6c4fb461e8:    	mov	w16, w21  // guest 0x15b376, sampled 0
6c4fb461ec:    	mov	w21, w23  // guest 0x15b376, sampled 0
6c4fb461f0:    	bfxil	w21, w16, #0, #8  // guest 0x15b376, sampled 0
6c4fb461f4:    	str	w21, [x19]  // guest 0x15b376, sampled 0
6c4fb461f8:    	add	w23, w22, #0x90  // guest 0x15b37c, sampled 0
6c4fb461fc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b37c, sampled 0
6c4fb46200:    	and	x16, x16, x23, lsr #7  // guest 0x15b37c, sampled 0
6c4fb46204:    	add	x17, x17, x16  // guest 0x15b37c, sampled 0
6c4fb46208:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b37c, sampled 0
6c4fb4620c:    	and	w30, w23, #0xfffff000  // guest 0x15b37c, sampled 0
6c4fb46210:    	cmp	w16, w30  // guest 0x15b37c, sampled 0
6c4fb46214:    	b.ne	0x6c4fb46880 <trace+0x780>  // guest 0x15b37c, sampled 0
6c4fb46218:    	add	x30, x17, w23, uxtw  // guest 0x15b37c, sampled 0
6c4fb4621c:    	stlrb	w21, [x30]  // guest 0x15b37c, sampled 0
6c4fb46220:    	add	w21, w20, #0x94  // guest 0x15b382, sampled 0
6c4fb46224:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b382, sampled 0
6c4fb46228:    	and	x16, x16, x21, lsr #7  // guest 0x15b382, sampled 0
6c4fb4622c:    	add	x17, x17, x16  // guest 0x15b382, sampled 0
6c4fb46230:    	ldp	x16, x17, [x17]  // guest 0x15b382, sampled 0
6c4fb46234:    	and	w30, w21, #0xfffff003  // guest 0x15b382, sampled 0
6c4fb46238:    	cmp	w16, w30  // guest 0x15b382, sampled 0
6c4fb4623c:    	b.ne	0x6c4fb468ac <trace+0x7ac>  // guest 0x15b382, sampled 0
6c4fb46240:    	add	x30, x17, w21, uxtw  // guest 0x15b382, sampled 0
6c4fb46244:    	ldapr	w21, [x30]  // guest 0x15b382, sampled 0
6c4fb46248:    	str	w21, [x19, #0x4]  // guest 0x15b382, sampled 0
6c4fb4624c:    	add	w23, w22, #0x94  // guest 0x15b388, sampled 0
6c4fb46250:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b388, sampled 0
6c4fb46254:    	and	x16, x16, x23, lsr #7  // guest 0x15b388, sampled 0
6c4fb46258:    	add	x17, x17, x16  // guest 0x15b388, sampled 0
6c4fb4625c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b388, sampled 0
6c4fb46260:    	and	w30, w23, #0xfffff003  // guest 0x15b388, sampled 0
6c4fb46264:    	cmp	w16, w30  // guest 0x15b388, sampled 0
6c4fb46268:    	b.ne	0x6c4fb468d8 <trace+0x7d8>  // guest 0x15b388, sampled 0
6c4fb4626c:    	add	x30, x17, w23, uxtw  // guest 0x15b388, sampled 0
6c4fb46270:    	stlr	w21, [x30]  // guest 0x15b388, sampled 0
6c4fb46274:    	add	w21, w20, #0x98  // guest 0x15b38e, sampled 0
6c4fb46278:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b38e, sampled 0
6c4fb4627c:    	and	x16, x16, x21, lsr #7  // guest 0x15b38e, sampled 0
6c4fb46280:    	add	x17, x17, x16  // guest 0x15b38e, sampled 0
6c4fb46284:    	ldp	x16, x17, [x17]  // guest 0x15b38e, sampled 0
6c4fb46288:    	and	w30, w21, #0xfffff003  // guest 0x15b38e, sampled 0
6c4fb4628c:    	cmp	w16, w30  // guest 0x15b38e, sampled 0
6c4fb46290:    	b.ne	0x6c4fb46904 <trace+0x804>  // guest 0x15b38e, sampled 0
6c4fb46294:    	add	x30, x17, w21, uxtw  // guest 0x15b38e, sampled 0
6c4fb46298:    	ldapr	w21, [x30]  // guest 0x15b38e, sampled 0
6c4fb4629c:    	str	w21, [x19, #0x8]  // guest 0x15b38e, sampled 0
6c4fb462a0:    	add	w23, w22, #0x98  // guest 0x15b394, sampled 0
6c4fb462a4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b394, sampled 0
6c4fb462a8:    	and	x16, x16, x23, lsr #7  // guest 0x15b394, sampled 0
6c4fb462ac:    	add	x17, x17, x16  // guest 0x15b394, sampled 0
6c4fb462b0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b394, sampled 0
6c4fb462b4:    	and	w30, w23, #0xfffff003  // guest 0x15b394, sampled 0
6c4fb462b8:    	cmp	w16, w30  // guest 0x15b394, sampled 0
6c4fb462bc:    	b.ne	0x6c4fb46930 <trace+0x830>  // guest 0x15b394, sampled 0
6c4fb462c0:    	add	x30, x17, w23, uxtw  // guest 0x15b394, sampled 0
6c4fb462c4:    	stlr	w21, [x30]  // guest 0x15b394, sampled 0
6c4fb462c8:    	add	w21, w20, #0x9c  // guest 0x15b39a, sampled 0
6c4fb462cc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b39a, sampled 0
6c4fb462d0:    	and	x16, x16, x21, lsr #7  // guest 0x15b39a, sampled 0
6c4fb462d4:    	add	x17, x17, x16  // guest 0x15b39a, sampled 0
6c4fb462d8:    	ldp	x16, x17, [x17]  // guest 0x15b39a, sampled 0
6c4fb462dc:    	and	w30, w21, #0xfffff003  // guest 0x15b39a, sampled 0
6c4fb462e0:    	cmp	w16, w30  // guest 0x15b39a, sampled 0
6c4fb462e4:    	b.ne	0x6c4fb4695c <trace+0x85c>  // guest 0x15b39a, sampled 0
6c4fb462e8:    	add	x30, x17, w21, uxtw  // guest 0x15b39a, sampled 0
6c4fb462ec:    	ldapr	w21, [x30]  // guest 0x15b39a, sampled 0
6c4fb462f0:    	str	w21, [x19]  // guest 0x15b39a, sampled 0
6c4fb462f4:    	add	w23, w22, #0x9c  // guest 0x15b3a0, sampled 0
6c4fb462f8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3a0, sampled 0
6c4fb462fc:    	and	x16, x16, x23, lsr #7  // guest 0x15b3a0, sampled 0
6c4fb46300:    	add	x17, x17, x16  // guest 0x15b3a0, sampled 0
6c4fb46304:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b3a0, sampled 0
6c4fb46308:    	and	w30, w23, #0xfffff003  // guest 0x15b3a0, sampled 0
6c4fb4630c:    	cmp	w16, w30  // guest 0x15b3a0, sampled 0
6c4fb46310:    	b.ne	0x6c4fb46988 <trace+0x888>  // guest 0x15b3a0, sampled 0
6c4fb46314:    	add	x30, x17, w23, uxtw  // guest 0x15b3a0, sampled 0
6c4fb46318:    	stlr	w21, [x30]  // guest 0x15b3a0, sampled 0
6c4fb4631c:    	add	w21, w20, #0xa0  // guest 0x15b3a6, sampled 0
6c4fb46320:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3a6, sampled 0
6c4fb46324:    	and	x16, x16, x21, lsr #7  // guest 0x15b3a6, sampled 0
6c4fb46328:    	add	x17, x17, x16  // guest 0x15b3a6, sampled 0
6c4fb4632c:    	ldp	x16, x17, [x17]  // guest 0x15b3a6, sampled 0
6c4fb46330:    	and	w30, w21, #0xfffff003  // guest 0x15b3a6, sampled 0
6c4fb46334:    	cmp	w16, w30  // guest 0x15b3a6, sampled 0
6c4fb46338:    	b.ne	0x6c4fb469b4 <trace+0x8b4>  // guest 0x15b3a6, sampled 0
6c4fb4633c:    	add	x30, x17, w21, uxtw  // guest 0x15b3a6, sampled 0
6c4fb46340:    	ldapr	w21, [x30]  // guest 0x15b3a6, sampled 0
6c4fb46344:    	str	w21, [x19, #0x4]  // guest 0x15b3a6, sampled 0
6c4fb46348:    	add	w23, w22, #0xa0  // guest 0x15b3ac, sampled 0
6c4fb4634c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3ac, sampled 0
6c4fb46350:    	and	x16, x16, x23, lsr #7  // guest 0x15b3ac, sampled 0
6c4fb46354:    	add	x17, x17, x16  // guest 0x15b3ac, sampled 0
6c4fb46358:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b3ac, sampled 0
6c4fb4635c:    	and	w30, w23, #0xfffff003  // guest 0x15b3ac, sampled 0
6c4fb46360:    	cmp	w16, w30  // guest 0x15b3ac, sampled 0
6c4fb46364:    	b.ne	0x6c4fb469e0 <trace+0x8e0>  // guest 0x15b3ac, sampled 0
6c4fb46368:    	add	x30, x17, w23, uxtw  // guest 0x15b3ac, sampled 0
6c4fb4636c:    	stlr	w21, [x30]  // guest 0x15b3ac, sampled 0
6c4fb46370:    	add	w21, w20, #0xa4  // guest 0x15b3b2, sampled 0
6c4fb46374:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3b2, sampled 0
6c4fb46378:    	and	x16, x16, x21, lsr #7  // guest 0x15b3b2, sampled 0
6c4fb4637c:    	add	x17, x17, x16  // guest 0x15b3b2, sampled 0
6c4fb46380:    	ldp	x16, x17, [x17]  // guest 0x15b3b2, sampled 0
6c4fb46384:    	and	w30, w21, #0xfffff003  // guest 0x15b3b2, sampled 0
6c4fb46388:    	cmp	w16, w30  // guest 0x15b3b2, sampled 0
6c4fb4638c:    	b.ne	0x6c4fb46a0c <trace+0x90c>  // guest 0x15b3b2, sampled 0
6c4fb46390:    	add	x30, x17, w21, uxtw  // guest 0x15b3b2, sampled 0
6c4fb46394:    	ldapr	w21, [x30]  // guest 0x15b3b2, sampled 0
6c4fb46398:    	str	w21, [x19, #0x8]  // guest 0x15b3b2, sampled 0
6c4fb4639c:    	add	w23, w22, #0xa4  // guest 0x15b3b8, sampled 0
6c4fb463a0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3b8, sampled 0
6c4fb463a4:    	and	x16, x16, x23, lsr #7  // guest 0x15b3b8, sampled 0
6c4fb463a8:    	add	x17, x17, x16  // guest 0x15b3b8, sampled 0
6c4fb463ac:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b3b8, sampled 0
6c4fb463b0:    	and	w30, w23, #0xfffff003  // guest 0x15b3b8, sampled 0
6c4fb463b4:    	cmp	w16, w30  // guest 0x15b3b8, sampled 0
6c4fb463b8:    	b.ne	0x6c4fb46a38 <trace+0x938>  // guest 0x15b3b8, sampled 0
6c4fb463bc:    	add	x30, x17, w23, uxtw  // guest 0x15b3b8, sampled 0
6c4fb463c0:    	stlr	w21, [x30]  // guest 0x15b3b8, sampled 0
6c4fb463c4:    	add	w21, w20, #0xa8  // guest 0x15b3be, sampled 0
6c4fb463c8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3be, sampled 0
6c4fb463cc:    	and	x16, x16, x21, lsr #7  // guest 0x15b3be, sampled 0
6c4fb463d0:    	add	x17, x17, x16  // guest 0x15b3be, sampled 0
6c4fb463d4:    	ldp	x16, x17, [x17]  // guest 0x15b3be, sampled 0
6c4fb463d8:    	and	w30, w21, #0xfffff003  // guest 0x15b3be, sampled 0
6c4fb463dc:    	cmp	w16, w30  // guest 0x15b3be, sampled 0
6c4fb463e0:    	b.ne	0x6c4fb46a64 <trace+0x964>  // guest 0x15b3be, sampled 0
6c4fb463e4:    	add	x30, x17, w21, uxtw  // guest 0x15b3be, sampled 0
6c4fb463e8:    	ldapr	w21, [x30]  // guest 0x15b3be, sampled 0
6c4fb463ec:    	str	w21, [x19]  // guest 0x15b3be, sampled 0
6c4fb463f0:    	add	w23, w22, #0xa8  // guest 0x15b3c4, sampled 0
6c4fb463f4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3c4, sampled 0
6c4fb463f8:    	and	x16, x16, x23, lsr #7  // guest 0x15b3c4, sampled 0
6c4fb463fc:    	add	x17, x17, x16  // guest 0x15b3c4, sampled 0
6c4fb46400:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b3c4, sampled 0
6c4fb46404:    	and	w30, w23, #0xfffff003  // guest 0x15b3c4, sampled 0
6c4fb46408:    	cmp	w16, w30  // guest 0x15b3c4, sampled 0
6c4fb4640c:    	b.ne	0x6c4fb46a90 <trace+0x990>  // guest 0x15b3c4, sampled 0
6c4fb46410:    	add	x30, x17, w23, uxtw  // guest 0x15b3c4, sampled 0
6c4fb46414:    	stlr	w21, [x30]  // guest 0x15b3c4, sampled 0
6c4fb46418:    	add	w21, w20, #0xac  // guest 0x15b3ca, sampled 0
6c4fb4641c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3ca, sampled 0
6c4fb46420:    	and	x16, x16, x21, lsr #7  // guest 0x15b3ca, sampled 0
6c4fb46424:    	add	x17, x17, x16  // guest 0x15b3ca, sampled 0
6c4fb46428:    	ldp	x16, x17, [x17]  // guest 0x15b3ca, sampled 0
6c4fb4642c:    	and	w30, w21, #0xfffff003  // guest 0x15b3ca, sampled 0
6c4fb46430:    	cmp	w16, w30  // guest 0x15b3ca, sampled 0
6c4fb46434:    	b.ne	0x6c4fb46abc <trace+0x9bc>  // guest 0x15b3ca, sampled 0
6c4fb46438:    	add	x30, x17, w21, uxtw  // guest 0x15b3ca, sampled 0
6c4fb4643c:    	ldapr	w21, [x30]  // guest 0x15b3ca, sampled 0
6c4fb46440:    	str	w21, [x19, #0x4]  // guest 0x15b3ca, sampled 0
6c4fb46444:    	add	w23, w22, #0xac  // guest 0x15b3d0, sampled 0
6c4fb46448:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3d0, sampled 0
6c4fb4644c:    	and	x16, x16, x23, lsr #7  // guest 0x15b3d0, sampled 0
6c4fb46450:    	add	x17, x17, x16  // guest 0x15b3d0, sampled 0
6c4fb46454:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b3d0, sampled 0
6c4fb46458:    	and	w30, w23, #0xfffff003  // guest 0x15b3d0, sampled 0
6c4fb4645c:    	cmp	w16, w30  // guest 0x15b3d0, sampled 0
6c4fb46460:    	b.ne	0x6c4fb46ae8 <trace+0x9e8>  // guest 0x15b3d0, sampled 0
6c4fb46464:    	add	x30, x17, w23, uxtw  // guest 0x15b3d0, sampled 0
6c4fb46468:    	stlr	w21, [x30]  // guest 0x15b3d0, sampled 0
6c4fb4646c:    	add	w21, w20, #0xb0  // guest 0x15b3d6, sampled 0
6c4fb46470:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3d6, sampled 0
6c4fb46474:    	and	x16, x16, x21, lsr #7  // guest 0x15b3d6, sampled 0
6c4fb46478:    	add	x17, x17, x16  // guest 0x15b3d6, sampled 0
6c4fb4647c:    	ldp	x16, x17, [x17]  // guest 0x15b3d6, sampled 0
6c4fb46480:    	and	w30, w21, #0xfffff003  // guest 0x15b3d6, sampled 0
6c4fb46484:    	cmp	w16, w30  // guest 0x15b3d6, sampled 0
6c4fb46488:    	b.ne	0x6c4fb46b14 <trace+0xa14>  // guest 0x15b3d6, sampled 0
6c4fb4648c:    	add	x30, x17, w21, uxtw  // guest 0x15b3d6, sampled 0
6c4fb46490:    	ldapr	w21, [x30]  // guest 0x15b3d6, sampled 0
6c4fb46494:    	str	w21, [x19, #0x8]  // guest 0x15b3d6, sampled 0
6c4fb46498:    	add	w23, w22, #0xb0  // guest 0x15b3dc, sampled 0
6c4fb4649c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3dc, sampled 0
6c4fb464a0:    	and	x16, x16, x23, lsr #7  // guest 0x15b3dc, sampled 0
6c4fb464a4:    	add	x17, x17, x16  // guest 0x15b3dc, sampled 0
6c4fb464a8:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b3dc, sampled 0
6c4fb464ac:    	and	w30, w23, #0xfffff003  // guest 0x15b3dc, sampled 0
6c4fb464b0:    	cmp	w16, w30  // guest 0x15b3dc, sampled 0
6c4fb464b4:    	b.ne	0x6c4fb46b40 <trace+0xa40>  // guest 0x15b3dc, sampled 1
6c4fb464b8:    	add	x30, x17, w23, uxtw  // guest 0x15b3dc, sampled 0
6c4fb464bc:    	stlr	w21, [x30]  // guest 0x15b3dc, sampled 0
6c4fb464c0:    	add	w21, w20, #0xb4  // guest 0x15b3e2, sampled 0
6c4fb464c4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3e2, sampled 0
6c4fb464c8:    	and	x16, x16, x21, lsr #7  // guest 0x15b3e2, sampled 0
6c4fb464cc:    	add	x17, x17, x16  // guest 0x15b3e2, sampled 0
6c4fb464d0:    	ldp	x16, x17, [x17]  // guest 0x15b3e2, sampled 0
6c4fb464d4:    	and	w30, w21, #0xfffff003  // guest 0x15b3e2, sampled 1
6c4fb464d8:    	cmp	w16, w30  // guest 0x15b3e2, sampled 0
6c4fb464dc:    	b.ne	0x6c4fb46b6c <trace+0xa6c>  // guest 0x15b3e2, sampled 0
6c4fb464e0:    	add	x30, x17, w21, uxtw  // guest 0x15b3e2, sampled 0
6c4fb464e4:    	ldapr	w21, [x30]  // guest 0x15b3e2, sampled 0
6c4fb464e8:    	str	w21, [x19]  // guest 0x15b3e2, sampled 0
6c4fb464ec:    	add	w23, w22, #0xb4  // guest 0x15b3e8, sampled 0
6c4fb464f0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3e8, sampled 0
6c4fb464f4:    	and	x16, x16, x23, lsr #7  // guest 0x15b3e8, sampled 0
6c4fb464f8:    	add	x17, x17, x16  // guest 0x15b3e8, sampled 0
6c4fb464fc:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b3e8, sampled 0
6c4fb46500:    	and	w30, w23, #0xfffff003  // guest 0x15b3e8, sampled 0
6c4fb46504:    	cmp	w16, w30  // guest 0x15b3e8, sampled 0
6c4fb46508:    	b.ne	0x6c4fb46b98 <trace+0xa98>  // guest 0x15b3e8, sampled 0
6c4fb4650c:    	add	x30, x17, w23, uxtw  // guest 0x15b3e8, sampled 0
6c4fb46510:    	stlr	w21, [x30]  // guest 0x15b3e8, sampled 0
6c4fb46514:    	add	w21, w20, #0xb8  // guest 0x15b3ee, sampled 0
6c4fb46518:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3ee, sampled 0
6c4fb4651c:    	and	x16, x16, x21, lsr #7  // guest 0x15b3ee, sampled 0
6c4fb46520:    	add	x17, x17, x16  // guest 0x15b3ee, sampled 0
6c4fb46524:    	ldp	x16, x17, [x17]  // guest 0x15b3ee, sampled 0
6c4fb46528:    	and	w30, w21, #0xfffff003  // guest 0x15b3ee, sampled 0
6c4fb4652c:    	cmp	w16, w30  // guest 0x15b3ee, sampled 0
6c4fb46530:    	b.ne	0x6c4fb46bc4 <trace+0xac4>  // guest 0x15b3ee, sampled 0
6c4fb46534:    	add	x30, x17, w21, uxtw  // guest 0x15b3ee, sampled 0
6c4fb46538:    	ldapr	w21, [x30]  // guest 0x15b3ee, sampled 0
6c4fb4653c:    	str	w21, [x19, #0x4]  // guest 0x15b3ee, sampled 0
6c4fb46540:    	add	w23, w22, #0xb8  // guest 0x15b3f4, sampled 0
6c4fb46544:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3f4, sampled 0
6c4fb46548:    	and	x16, x16, x23, lsr #7  // guest 0x15b3f4, sampled 0
6c4fb4654c:    	add	x17, x17, x16  // guest 0x15b3f4, sampled 0
6c4fb46550:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b3f4, sampled 0
6c4fb46554:    	and	w30, w23, #0xfffff003  // guest 0x15b3f4, sampled 0
6c4fb46558:    	cmp	w16, w30  // guest 0x15b3f4, sampled 0
6c4fb4655c:    	b.ne	0x6c4fb46bf0 <trace+0xaf0>  // guest 0x15b3f4, sampled 0
6c4fb46560:    	add	x30, x17, w23, uxtw  // guest 0x15b3f4, sampled 0
6c4fb46564:    	stlr	w21, [x30]  // guest 0x15b3f4, sampled 0
6c4fb46568:    	add	w21, w20, #0xbc  // guest 0x15b3fa, sampled 0
6c4fb4656c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3fa, sampled 0
6c4fb46570:    	and	x16, x16, x21, lsr #7  // guest 0x15b3fa, sampled 0
6c4fb46574:    	add	x17, x17, x16  // guest 0x15b3fa, sampled 0
6c4fb46578:    	ldp	x16, x17, [x17]  // guest 0x15b3fa, sampled 0
6c4fb4657c:    	and	w30, w21, #0xfffff003  // guest 0x15b3fa, sampled 0
6c4fb46580:    	cmp	w16, w30  // guest 0x15b3fa, sampled 0
6c4fb46584:    	b.ne	0x6c4fb46c1c <trace+0xb1c>  // guest 0x15b3fa, sampled 0
6c4fb46588:    	add	x30, x17, w21, uxtw  // guest 0x15b3fa, sampled 0
6c4fb4658c:    	ldapr	w21, [x30]  // guest 0x15b3fa, sampled 0
6c4fb46590:    	str	w21, [x19, #0x8]  // guest 0x15b3fa, sampled 0
6c4fb46594:    	add	w23, w22, #0xbc  // guest 0x15b400, sampled 0
6c4fb46598:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b400, sampled 0
6c4fb4659c:    	and	x16, x16, x23, lsr #7  // guest 0x15b400, sampled 0
6c4fb465a0:    	add	x17, x17, x16  // guest 0x15b400, sampled 0
6c4fb465a4:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b400, sampled 0
6c4fb465a8:    	and	w30, w23, #0xfffff003  // guest 0x15b400, sampled 0
6c4fb465ac:    	cmp	w16, w30  // guest 0x15b400, sampled 0
6c4fb465b0:    	b.ne	0x6c4fb46c48 <trace+0xb48>  // guest 0x15b400, sampled 0
6c4fb465b4:    	add	x30, x17, w23, uxtw  // guest 0x15b400, sampled 0
6c4fb465b8:    	stlr	w21, [x30]  // guest 0x15b400, sampled 0
6c4fb465bc:    	add	w21, w20, #0xc0  // guest 0x15b406, sampled 0
6c4fb465c0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b406, sampled 0
6c4fb465c4:    	and	x16, x16, x21, lsr #7  // guest 0x15b406, sampled 0
6c4fb465c8:    	add	x17, x17, x16  // guest 0x15b406, sampled 0
6c4fb465cc:    	ldp	x16, x17, [x17]  // guest 0x15b406, sampled 0
6c4fb465d0:    	and	w30, w21, #0xfffff003  // guest 0x15b406, sampled 0
6c4fb465d4:    	cmp	w16, w30  // guest 0x15b406, sampled 0
6c4fb465d8:    	b.ne	0x6c4fb46c74 <trace+0xb74>  // guest 0x15b406, sampled 0
6c4fb465dc:    	add	x30, x17, w21, uxtw  // guest 0x15b406, sampled 0
6c4fb465e0:    	ldapr	w21, [x30]  // guest 0x15b406, sampled 0
6c4fb465e4:    	str	w21, [x19]  // guest 0x15b406, sampled 0
6c4fb465e8:    	add	w23, w22, #0xc0  // guest 0x15b40c, sampled 0
6c4fb465ec:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b40c, sampled 0
6c4fb465f0:    	and	x16, x16, x23, lsr #7  // guest 0x15b40c, sampled 0
6c4fb465f4:    	add	x17, x17, x16  // guest 0x15b40c, sampled 0
6c4fb465f8:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b40c, sampled 0
6c4fb465fc:    	and	w30, w23, #0xfffff003  // guest 0x15b40c, sampled 0
6c4fb46600:    	cmp	w16, w30  // guest 0x15b40c, sampled 0
6c4fb46604:    	b.ne	0x6c4fb46ca0 <trace+0xba0>  // guest 0x15b40c, sampled 0
6c4fb46608:    	add	x30, x17, w23, uxtw  // guest 0x15b40c, sampled 0
6c4fb4660c:    	stlr	w21, [x30]  // guest 0x15b40c, sampled 0
6c4fb46610:    	add	w20, w20, #0xd0  // guest 0x15b412, sampled 0
6c4fb46614:    	str	w20, [x19, #0x18]  // guest 0x15b412, sampled 0
6c4fb46618:    	str	w20, [x19, #0x28]  // guest 0x15b412, sampled 0
6c4fb4661c:    	mov	w20, #0xd0              // =208  // guest 0x15b412, sampled 0
6c4fb46620:    	str	w20, [x19, #0x2c]  // guest 0x15b412, sampled 0
6c4fb46624:    	add	w20, w22, #0xd0  // guest 0x15b418, sampled 0
6c4fb46628:    	str	w20, [sp, #0x80]  // guest 0x15b418, sampled 0
6c4fb4662c:    	str	w20, [x19, #0x1c]  // guest 0x15b418, sampled 0
6c4fb46630:    	mov	w20, #0xb0              // =176  // guest 0x15b41e, sampled 0
6c4fb46634:    	str	w20, [sp, #0x84]  // guest 0x15b41e, sampled 0
6c4fb46638:    	mov	w20, #0xb0              // =176  // guest 0x15b41e, sampled 0
6c4fb4663c:    	str	w20, [x19, #0x4]  // guest 0x15b41e, sampled 0
6c4fb46640:    	mov	w20, #0x1               // =1  // guest 0x15b41e, sampled 0
6c4fb46644:    	sturb	w20, [x19, #-0xc]  // guest 0x15b41e, sampled 0
6c4fb46648:    	ldr	w20, [x19, #0x38]  // guest 0x15b423, sampled 0
6c4fb4664c:    	lsl	w20, w20, #2  // guest 0x15b423, sampled 0
6c4fb46650:    	str	w20, [sp, #0x88]  // guest 0x15b423, sampled 0
6c4fb46654:    	mov	w20, #0xa               // =10  // guest 0x15b423, sampled 0
6c4fb46658:    	str	w20, [x19, #0x34]  // guest 0x15b423, sampled 0
6c4fb4665c:    	mov	w20, #0xaf              // =175  // guest 0x15b423, sampled 0
6c4fb46660:    	str	w20, [sp, #0x8c]  // guest 0x15b423, sampled 0
6c4fb46664:    	ldr	w20, [x19, #0x18]  // guest 0x15b423, sampled 1
6c4fb46668:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b423, sampled 0
6c4fb4666c:    	and	x16, x16, x20, lsr #7  // guest 0x15b423, sampled 0
6c4fb46670:    	add	x17, x17, x16  // guest 0x15b423, sampled 1
6c4fb46674:    	ldp	x16, x17, [x17]  // guest 0x15b423, sampled 0
6c4fb46678:    	and	w30, w20, #0xfffff003  // guest 0x15b423, sampled 7
6c4fb4667c:    	cmp	w16, w30  // guest 0x15b423, sampled 0
6c4fb46680:    	b.ne	0x6c4fb46ccc <trace+0xbcc>  // guest 0x15b423, sampled 0
6c4fb46684:    	add	x30, x17, w20, uxtw  // guest 0x15b423, sampled 1
6c4fb46688:    	ldapr	w21, [x30]  // guest 0x15b423, sampled 0
6c4fb4668c:    	str	w21, [sp, #0x84]  // guest 0x15b423, sampled 6
6c4fb46690:    	ldr	w22, [x19, #0x1c]  // guest 0x15b423, sampled 0
6c4fb46694:    	str	w22, [sp, #0x80]  // guest 0x15b423, sampled 0
6c4fb46698:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b423, sampled 0
6c4fb4669c:    	and	x16, x16, x22, lsr #7  // guest 0x15b423, sampled 0
6c4fb466a0:    	add	x17, x17, x16  // guest 0x15b423, sampled 0
6c4fb466a4:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b423, sampled 0
6c4fb466a8:    	and	w30, w22, #0xfffff003  // guest 0x15b423, sampled 0
6c4fb466ac:    	cmp	w16, w30  // guest 0x15b423, sampled 1
6c4fb466b0:    	b.ne	0x6c4fb46cf8 <trace+0xbf8>  // guest 0x15b423, sampled 0
6c4fb466b4:    	add	x30, x17, w22, uxtw  // guest 0x15b423, sampled 1
6c4fb466b8:    	stlr	w21, [x30]  // guest 0x15b423, sampled 0
6c4fb466bc:    	ldr	w21, [sp, #0x88]  // guest 0x15b423, sampled 0
6c4fb466c0:    	add	w20, w20, w21  // guest 0x15b423, sampled 0
6c4fb466c4:    	str	w20, [x19, #0x18]  // guest 0x15b423, sampled 0
6c4fb466c8:    	add	w20, w22, w21  // guest 0x15b423, sampled 0
6c4fb466cc:    	str	w20, [x19, #0x1c]  // guest 0x15b423, sampled 0
6c4fb466d0:    	ldr	w20, [sp, #0x8c]  // guest 0x15b423, sampled 2
6c4fb466d4:    	str	w20, [x19, #0x4]  // guest 0x15b423, sampled 1
6c4fb466d8:    	sub	w20, w20, #0x1  // guest 0x15b423, sampled 0
6c4fb466dc:    	str	w20, [sp, #0x8c]  // guest 0x15b423, sampled 0
6c4fb466e0:    	tst	w20, #0xffff  // guest 0x15b423, sampled 0
6c4fb466e4:    	b.ne	0x6c4fb46664 <trace+0x564>  // guest 0x15b423, sampled 0
6c4fb466e8:    	cbz	w20, 0x6c4fb46714 <trace+0x614>  // guest 0x15b423, sampled 0
6c4fb466ec:    	ldr	w20, [x19, #0x24]  // guest 0x15b423, sampled 0
6c4fb466f0:    	orr	w20, w20, #0x10000  // guest 0x15b423, sampled 0
6c4fb466f4:    	str	w20, [x19, #0x24]  // guest 0x15b423, sampled 0
6c4fb466f8:    	b	0x6c4fb466f8 <trace+0x5f8>  // guest 0x15b423, sampled 0
6c4fb466fc:    	br	x16  // guest 0x15b423, sampled 0
6c4fb46700:    	mov	w20, #0xb423            // =46115  // guest 0x15b423, sampled 0
6c4fb46704:    	movk	w20, #0x15, lsl #16  // guest 0x15b423, sampled 0
6c4fb46708:    	str	w20, [x19, #0x20]  // guest 0x15b423, sampled 0
6c4fb4670c:    	adr	x0, 0x6c4fb46040 <trace+0xffffffffffffff40>  // guest 0x15b423, sampled 0
6c4fb46710:    	b	0x6c4ae5d02c <trace+0xfffffffffb316f2c>  // guest 0x15b423, sampled 0
6c4fb46714:    	ldr	w20, [x19, #0x18]  // guest 0x15b423, sampled 0
6c4fb46718:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b423, sampled 0
6c4fb4671c:    	and	x16, x16, x20, lsr #7  // guest 0x15b423, sampled 0
6c4fb46720:    	add	x17, x17, x16  // guest 0x15b423, sampled 0
6c4fb46724:    	ldp	x16, x17, [x17]  // guest 0x15b423, sampled 0
6c4fb46728:    	and	w30, w20, #0xfffff003  // guest 0x15b423, sampled 0
6c4fb4672c:    	cmp	w16, w30  // guest 0x15b423, sampled 0
6c4fb46730:    	b.ne	0x6c4fb46d24 <trace+0xc24>  // guest 0x15b423, sampled 0
6c4fb46734:    	add	x30, x17, w20, uxtw  // guest 0x15b423, sampled 0
6c4fb46738:    	ldapr	w21, [x30]  // guest 0x15b423, sampled 0
6c4fb4673c:    	ldr	w22, [x19, #0x1c]  // guest 0x15b423, sampled 0
6c4fb46740:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b423, sampled 0
6c4fb46744:    	and	x16, x16, x22, lsr #7  // guest 0x15b423, sampled 0
6c4fb46748:    	add	x17, x17, x16  // guest 0x15b423, sampled 0
6c4fb4674c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b423, sampled 0
6c4fb46750:    	and	w30, w22, #0xfffff003  // guest 0x15b423, sampled 0
6c4fb46754:    	cmp	w16, w30  // guest 0x15b423, sampled 0
6c4fb46758:    	b.ne	0x6c4fb46d50 <trace+0xc50>  // guest 0x15b423, sampled 0
6c4fb4675c:    	add	x30, x17, w22, uxtw  // guest 0x15b423, sampled 0
6c4fb46760:    	stlr	w21, [x30]  // guest 0x15b423, sampled 0
6c4fb46764:    	ldr	w21, [sp, #0x88]  // guest 0x15b423, sampled 0
6c4fb46768:    	add	w20, w20, w21  // guest 0x15b423, sampled 0
6c4fb4676c:    	str	w20, [x19, #0x18]  // guest 0x15b423, sampled 0
6c4fb46770:    	add	w20, w22, w21  // guest 0x15b423, sampled 0
6c4fb46774:    	str	w20, [x19, #0x1c]  // guest 0x15b423, sampled 0
6c4fb46778:    	ldr	w20, [sp, #0x8c]  // guest 0x15b423, sampled 0
6c4fb4677c:    	str	w20, [x19, #0x4]  // guest 0x15b423, sampled 0
6c4fb46780:    	b	0x6c4fb46780 <trace+0x680>  // guest 0x15b423, sampled 0
6c4fb46784:    	br	x16  // guest 0x15b423, sampled 0
6c4fb46788:    	mov	w20, #0xb425            // =46117  // guest 0x15b423, sampled 0
6c4fb4678c:    	movk	w20, #0x15, lsl #16  // guest 0x15b423, sampled 0
6c4fb46790:    	str	w20, [x19, #0x20]  // guest 0x15b423, sampled 0
6c4fb46794:    	adr	x0, 0x6c4fb46041 <trace+0xffffffffffffff41>  // guest 0x15b423, sampled 0
6c4fb46798:    	b	0x6c4ae5d02c <trace+0xfffffffffb316f2c>  // guest 0x15b423, sampled 0
6c4fb4679c:    	adr	x0, 0x6c4fb46043 <trace+0xffffffffffffff43>  // guest 0x15b423, sampled 0
6c4fb467a0:    	b	0x6c4ae5d02c <trace+0xfffffffffb316f2c>  // guest 0x15b423, sampled 0
6c4fb467a4:    	mov	w1, w21
6c4fb467a8:    	mov	x0, x19
6c4fb467ac:    	mov	w2, #0x4045             // =16453
6c4fb467b0:    	movk	w2, #0x1, lsl #16
6c4fb467b4:    	adr	x3, 0x6c4fb46138 <trace+0x38>
6c4fb467b8:    	adrp	x16, 0x6c97723000 <trace+0x47bdd000>
6c4fb467bc:    	add	x16, x16, #0xf88
6c4fb467c0:    	blr	x16
6c4fb467c4:    	mov	w21, w0
6c4fb467c8:    	dmb	ishld
6c4fb467cc:    	b	0x6c4fb46138 <trace+0x38>
6c4fb467d0:    	mov	w1, w23
6c4fb467d4:    	mov	w2, w21
6c4fb467d8:    	mov	x0, x19
6c4fb467dc:    	mov	w3, #0x4045             // =16453
6c4fb467e0:    	movk	w3, #0x1, lsl #16
6c4fb467e4:    	adr	x4, 0x6c4fb46168 <trace+0x68>
6c4fb467e8:    	adrp	x16, 0x6c97724000 <trace+0x47bde000>
6c4fb467ec:    	add	x16, x16, #0xb68
6c4fb467f0:    	blr	x16
6c4fb467f4:    	dmb	ishld
6c4fb467f8:    	b	0x6c4fb46168 <trace+0x68>
6c4fb467fc:    	mov	w1, w21
6c4fb46800:    	mov	x0, x19
6c4fb46804:    	mov	w2, #0x4045             // =16453
6c4fb46808:    	movk	w2, #0x1, lsl #16
6c4fb4680c:    	adr	x3, 0x6c4fb46190 <trace+0x90>
6c4fb46810:    	adrp	x16, 0x6c97723000 <trace+0x47bdd000>
6c4fb46814:    	add	x16, x16, #0xf88
6c4fb46818:    	blr	x16
6c4fb4681c:    	mov	w21, w0
6c4fb46820:    	dmb	ishld
6c4fb46824:    	b	0x6c4fb46190 <trace+0x90>
6c4fb46828:    	mov	w1, w23
6c4fb4682c:    	mov	w2, w21
6c4fb46830:    	mov	x0, x19
6c4fb46834:    	mov	w3, #0x4045             // =16453
6c4fb46838:    	movk	w3, #0x1, lsl #16
6c4fb4683c:    	adr	x4, 0x6c4fb461bc <trace+0xbc>
6c4fb46840:    	adrp	x16, 0x6c97724000 <trace+0x47bde000>
6c4fb46844:    	add	x16, x16, #0xb68
6c4fb46848:    	blr	x16
6c4fb4684c:    	dmb	ishld
6c4fb46850:    	b	0x6c4fb461bc <trace+0xbc>
6c4fb46854:    	mov	w1, w21
6c4fb46858:    	mov	x0, x19
6c4fb4685c:    	mov	w2, #0x5c05             // =23557
6c4fb46860:    	movk	w2, #0x1, lsl #16
6c4fb46864:    	adr	x3, 0x6c4fb461e4 <trace+0xe4>
6c4fb46868:    	adrp	x16, 0x6c97723000 <trace+0x47bdd000>
6c4fb4686c:    	add	x16, x16, #0xc1c
6c4fb46870:    	blr	x16
6c4fb46874:    	mov	w21, w0
6c4fb46878:    	dmb	ishld
6c4fb4687c:    	b	0x6c4fb461e4 <trace+0xe4>
6c4fb46880:    	mov	w1, w23
6c4fb46884:    	mov	w2, w21
6c4fb46888:    	mov	x0, x19
6c4fb4688c:    	mov	w3, #0x5c05             // =23557
6c4fb46890:    	movk	w3, #0x1, lsl #16
6c4fb46894:    	adr	x4, 0x6c4fb46220 <trace+0x120>
6c4fb46898:    	adrp	x16, 0x6c97724000 <trace+0x47bde000>
6c4fb4689c:    	add	x16, x16, #0x830
6c4fb468a0:    	blr	x16
6c4fb468a4:    	dmb	ishld
6c4fb468a8:    	b	0x6c4fb46220 <trace+0x120>
6c4fb468ac:    	mov	w1, w21
6c4fb468b0:    	mov	x0, x19
6c4fb468b4:    	mov	w2, #0x4045             // =16453
6c4fb468b8:    	movk	w2, #0x1, lsl #16
6c4fb468bc:    	adr	x3, 0x6c4fb46248 <trace+0x148>
6c4fb468c0:    	adrp	x16, 0x6c97723000 <trace+0x47bdd000>
6c4fb468c4:    	add	x16, x16, #0xf88
6c4fb468c8:    	blr	x16
6c4fb468cc:    	mov	w21, w0
6c4fb468d0:    	dmb	ishld
6c4fb468d4:    	b	0x6c4fb46248 <trace+0x148>
6c4fb468d8:    	mov	w1, w23
6c4fb468dc:    	mov	w2, w21
6c4fb468e0:    	mov	x0, x19
6c4fb468e4:    	mov	w3, #0x4045             // =16453
6c4fb468e8:    	movk	w3, #0x1, lsl #16
6c4fb468ec:    	adr	x4, 0x6c4fb46274 <trace+0x174>
6c4fb468f0:    	adrp	x16, 0x6c97724000 <trace+0x47bde000>
6c4fb468f4:    	add	x16, x16, #0xb68
6c4fb468f8:    	blr	x16
6c4fb468fc:    	dmb	ishld
6c4fb46900:    	b	0x6c4fb46274 <trace+0x174>
6c4fb46904:    	mov	w1, w21
6c4fb46908:    	mov	x0, x19
6c4fb4690c:    	mov	w2, #0x4045             // =16453
6c4fb46910:    	movk	w2, #0x1, lsl #16
6c4fb46914:    	adr	x3, 0x6c4fb4629c <trace+0x19c>
6c4fb46918:    	adrp	x16, 0x6c97723000 <trace+0x47bdd000>
6c4fb4691c:    	add	x16, x16, #0xf88
6c4fb46920:    	blr	x16
6c4fb46924:    	mov	w21, w0
6c4fb46928:    	dmb	ishld
6c4fb4692c:    	b	0x6c4fb4629c <trace+0x19c>
6c4fb46930:    	mov	w1, w23
6c4fb46934:    	mov	w2, w21
6c4fb46938:    	mov	x0, x19
6c4fb4693c:    	mov	w3, #0x4045             // =16453
6c4fb46940:    	movk	w3, #0x1, lsl #16
6c4fb46944:    	adr	x4, 0x6c4fb462c8 <trace+0x1c8>
6c4fb46948:    	adrp	x16, 0x6c97724000 <trace+0x47bde000>
6c4fb4694c:    	add	x16, x16, #0xb68
6c4fb46950:    	blr	x16
6c4fb46954:    	dmb	ishld
6c4fb46958:    	b	0x6c4fb462c8 <trace+0x1c8>
6c4fb4695c:    	mov	w1, w21
6c4fb46960:    	mov	x0, x19
6c4fb46964:    	mov	w2, #0x4045             // =16453
6c4fb46968:    	movk	w2, #0x1, lsl #16
6c4fb4696c:    	adr	x3, 0x6c4fb462f0 <trace+0x1f0>
6c4fb46970:    	adrp	x16, 0x6c97723000 <trace+0x47bdd000>
6c4fb46974:    	add	x16, x16, #0xf88
6c4fb46978:    	blr	x16
6c4fb4697c:    	mov	w21, w0
6c4fb46980:    	dmb	ishld
6c4fb46984:    	b	0x6c4fb462f0 <trace+0x1f0>
6c4fb46988:    	mov	w1, w23
6c4fb4698c:    	mov	w2, w21
6c4fb46990:    	mov	x0, x19
6c4fb46994:    	mov	w3, #0x4045             // =16453
6c4fb46998:    	movk	w3, #0x1, lsl #16
6c4fb4699c:    	adr	x4, 0x6c4fb4631c <trace+0x21c>
6c4fb469a0:    	adrp	x16, 0x6c97724000 <trace+0x47bde000>
6c4fb469a4:    	add	x16, x16, #0xb68
6c4fb469a8:    	blr	x16
6c4fb469ac:    	dmb	ishld
6c4fb469b0:    	b	0x6c4fb4631c <trace+0x21c>
6c4fb469b4:    	mov	w1, w21
6c4fb469b8:    	mov	x0, x19
6c4fb469bc:    	mov	w2, #0x4045             // =16453
6c4fb469c0:    	movk	w2, #0x1, lsl #16
6c4fb469c4:    	adr	x3, 0x6c4fb46344 <trace+0x244>
6c4fb469c8:    	adrp	x16, 0x6c97723000 <trace+0x47bdd000>
6c4fb469cc:    	add	x16, x16, #0xf88
6c4fb469d0:    	blr	x16
6c4fb469d4:    	mov	w21, w0
6c4fb469d8:    	dmb	ishld
6c4fb469dc:    	b	0x6c4fb46344 <trace+0x244>
6c4fb469e0:    	mov	w1, w23
6c4fb469e4:    	mov	w2, w21
6c4fb469e8:    	mov	x0, x19
6c4fb469ec:    	mov	w3, #0x4045             // =16453
6c4fb469f0:    	movk	w3, #0x1, lsl #16
6c4fb469f4:    	adr	x4, 0x6c4fb46370 <trace+0x270>
6c4fb469f8:    	adrp	x16, 0x6c97724000 <trace+0x47bde000>
6c4fb469fc:    	add	x16, x16, #0xb68
6c4fb46a00:    	blr	x16
6c4fb46a04:    	dmb	ishld
6c4fb46a08:    	b	0x6c4fb46370 <trace+0x270>
6c4fb46a0c:    	mov	w1, w21
6c4fb46a10:    	mov	x0, x19
6c4fb46a14:    	mov	w2, #0x4045             // =16453
6c4fb46a18:    	movk	w2, #0x1, lsl #16
6c4fb46a1c:    	adr	x3, 0x6c4fb46398 <trace+0x298>
6c4fb46a20:    	adrp	x16, 0x6c97723000 <trace+0x47bdd000>
6c4fb46a24:    	add	x16, x16, #0xf88
6c4fb46a28:    	blr	x16
6c4fb46a2c:    	mov	w21, w0
6c4fb46a30:    	dmb	ishld
6c4fb46a34:    	b	0x6c4fb46398 <trace+0x298>
6c4fb46a38:    	mov	w1, w23
6c4fb46a3c:    	mov	w2, w21
6c4fb46a40:    	mov	x0, x19
6c4fb46a44:    	mov	w3, #0x4045             // =16453
6c4fb46a48:    	movk	w3, #0x1, lsl #16
6c4fb46a4c:    	adr	x4, 0x6c4fb463c4 <trace+0x2c4>
6c4fb46a50:    	adrp	x16, 0x6c97724000 <trace+0x47bde000>
6c4fb46a54:    	add	x16, x16, #0xb68
6c4fb46a58:    	blr	x16
6c4fb46a5c:    	dmb	ishld
6c4fb46a60:    	b	0x6c4fb463c4 <trace+0x2c4>
6c4fb46a64:    	mov	w1, w21
6c4fb46a68:    	mov	x0, x19
6c4fb46a6c:    	mov	w2, #0x4045             // =16453
6c4fb46a70:    	movk	w2, #0x1, lsl #16
6c4fb46a74:    	adr	x3, 0x6c4fb463ec <trace+0x2ec>
6c4fb46a78:    	adrp	x16, 0x6c97723000 <trace+0x47bdd000>
6c4fb46a7c:    	add	x16, x16, #0xf88
6c4fb46a80:    	blr	x16
6c4fb46a84:    	mov	w21, w0
6c4fb46a88:    	dmb	ishld
6c4fb46a8c:    	b	0x6c4fb463ec <trace+0x2ec>
6c4fb46a90:    	mov	w1, w23
6c4fb46a94:    	mov	w2, w21
6c4fb46a98:    	mov	x0, x19
6c4fb46a9c:    	mov	w3, #0x4045             // =16453
6c4fb46aa0:    	movk	w3, #0x1, lsl #16
6c4fb46aa4:    	adr	x4, 0x6c4fb46418 <trace+0x318>
6c4fb46aa8:    	adrp	x16, 0x6c97724000 <trace+0x47bde000>
6c4fb46aac:    	add	x16, x16, #0xb68
6c4fb46ab0:    	blr	x16
6c4fb46ab4:    	dmb	ishld
6c4fb46ab8:    	b	0x6c4fb46418 <trace+0x318>
6c4fb46abc:    	mov	w1, w21
6c4fb46ac0:    	mov	x0, x19
6c4fb46ac4:    	mov	w2, #0x4045             // =16453
6c4fb46ac8:    	movk	w2, #0x1, lsl #16
6c4fb46acc:    	adr	x3, 0x6c4fb46440 <trace+0x340>
6c4fb46ad0:    	adrp	x16, 0x6c97723000 <trace+0x47bdd000>
6c4fb46ad4:    	add	x16, x16, #0xf88
6c4fb46ad8:    	blr	x16
6c4fb46adc:    	mov	w21, w0
6c4fb46ae0:    	dmb	ishld
6c4fb46ae4:    	b	0x6c4fb46440 <trace+0x340>
6c4fb46ae8:    	mov	w1, w23
6c4fb46aec:    	mov	w2, w21
6c4fb46af0:    	mov	x0, x19
6c4fb46af4:    	mov	w3, #0x4045             // =16453
6c4fb46af8:    	movk	w3, #0x1, lsl #16
6c4fb46afc:    	adr	x4, 0x6c4fb4646c <trace+0x36c>
6c4fb46b00:    	adrp	x16, 0x6c97724000 <trace+0x47bde000>
6c4fb46b04:    	add	x16, x16, #0xb68
6c4fb46b08:    	blr	x16
6c4fb46b0c:    	dmb	ishld
6c4fb46b10:    	b	0x6c4fb4646c <trace+0x36c>
6c4fb46b14:    	mov	w1, w21
6c4fb46b18:    	mov	x0, x19
6c4fb46b1c:    	mov	w2, #0x4045             // =16453
6c4fb46b20:    	movk	w2, #0x1, lsl #16
6c4fb46b24:    	adr	x3, 0x6c4fb46494 <trace+0x394>
6c4fb46b28:    	adrp	x16, 0x6c97723000 <trace+0x47bdd000>
6c4fb46b2c:    	add	x16, x16, #0xf88
6c4fb46b30:    	blr	x16
6c4fb46b34:    	mov	w21, w0
6c4fb46b38:    	dmb	ishld
6c4fb46b3c:    	b	0x6c4fb46494 <trace+0x394>
6c4fb46b40:    	mov	w1, w23
6c4fb46b44:    	mov	w2, w21
6c4fb46b48:    	mov	x0, x19
6c4fb46b4c:    	mov	w3, #0x4045             // =16453
6c4fb46b50:    	movk	w3, #0x1, lsl #16
6c4fb46b54:    	adr	x4, 0x6c4fb464c0 <trace+0x3c0>
6c4fb46b58:    	adrp	x16, 0x6c97724000 <trace+0x47bde000>
6c4fb46b5c:    	add	x16, x16, #0xb68
6c4fb46b60:    	blr	x16
6c4fb46b64:    	dmb	ishld
6c4fb46b68:    	b	0x6c4fb464c0 <trace+0x3c0>
6c4fb46b6c:    	mov	w1, w21
6c4fb46b70:    	mov	x0, x19
6c4fb46b74:    	mov	w2, #0x4045             // =16453
6c4fb46b78:    	movk	w2, #0x1, lsl #16
6c4fb46b7c:    	adr	x3, 0x6c4fb464e8 <trace+0x3e8>
6c4fb46b80:    	adrp	x16, 0x6c97723000 <trace+0x47bdd000>
6c4fb46b84:    	add	x16, x16, #0xf88
6c4fb46b88:    	blr	x16
6c4fb46b8c:    	mov	w21, w0
6c4fb46b90:    	dmb	ishld
6c4fb46b94:    	b	0x6c4fb464e8 <trace+0x3e8>
6c4fb46b98:    	mov	w1, w23
6c4fb46b9c:    	mov	w2, w21
6c4fb46ba0:    	mov	x0, x19
6c4fb46ba4:    	mov	w3, #0x4045             // =16453
6c4fb46ba8:    	movk	w3, #0x1, lsl #16
6c4fb46bac:    	adr	x4, 0x6c4fb46514 <trace+0x414>
6c4fb46bb0:    	adrp	x16, 0x6c97724000 <trace+0x47bde000>
6c4fb46bb4:    	add	x16, x16, #0xb68
6c4fb46bb8:    	blr	x16
6c4fb46bbc:    	dmb	ishld
6c4fb46bc0:    	b	0x6c4fb46514 <trace+0x414>
6c4fb46bc4:    	mov	w1, w21
6c4fb46bc8:    	mov	x0, x19
6c4fb46bcc:    	mov	w2, #0x4045             // =16453
6c4fb46bd0:    	movk	w2, #0x1, lsl #16
6c4fb46bd4:    	adr	x3, 0x6c4fb4653c <trace+0x43c>
6c4fb46bd8:    	adrp	x16, 0x6c97723000 <trace+0x47bdd000>
6c4fb46bdc:    	add	x16, x16, #0xf88
6c4fb46be0:    	blr	x16
6c4fb46be4:    	mov	w21, w0
6c4fb46be8:    	dmb	ishld
6c4fb46bec:    	b	0x6c4fb4653c <trace+0x43c>
6c4fb46bf0:    	mov	w1, w23
6c4fb46bf4:    	mov	w2, w21
6c4fb46bf8:    	mov	x0, x19
6c4fb46bfc:    	mov	w3, #0x4045             // =16453
6c4fb46c00:    	movk	w3, #0x1, lsl #16
6c4fb46c04:    	adr	x4, 0x6c4fb46568 <trace+0x468>
6c4fb46c08:    	adrp	x16, 0x6c97724000 <trace+0x47bde000>
6c4fb46c0c:    	add	x16, x16, #0xb68
6c4fb46c10:    	blr	x16
6c4fb46c14:    	dmb	ishld
6c4fb46c18:    	b	0x6c4fb46568 <trace+0x468>
6c4fb46c1c:    	mov	w1, w21
6c4fb46c20:    	mov	x0, x19
6c4fb46c24:    	mov	w2, #0x4045             // =16453
6c4fb46c28:    	movk	w2, #0x1, lsl #16
6c4fb46c2c:    	adr	x3, 0x6c4fb46590 <trace+0x490>
6c4fb46c30:    	adrp	x16, 0x6c97723000 <trace+0x47bdd000>
6c4fb46c34:    	add	x16, x16, #0xf88
6c4fb46c38:    	blr	x16
6c4fb46c3c:    	mov	w21, w0
6c4fb46c40:    	dmb	ishld
6c4fb46c44:    	b	0x6c4fb46590 <trace+0x490>
6c4fb46c48:    	mov	w1, w23
6c4fb46c4c:    	mov	w2, w21
6c4fb46c50:    	mov	x0, x19
6c4fb46c54:    	mov	w3, #0x4045             // =16453
6c4fb46c58:    	movk	w3, #0x1, lsl #16
6c4fb46c5c:    	adr	x4, 0x6c4fb465bc <trace+0x4bc>
6c4fb46c60:    	adrp	x16, 0x6c97724000 <trace+0x47bde000>
6c4fb46c64:    	add	x16, x16, #0xb68
6c4fb46c68:    	blr	x16
6c4fb46c6c:    	dmb	ishld
6c4fb46c70:    	b	0x6c4fb465bc <trace+0x4bc>
6c4fb46c74:    	mov	w1, w21
6c4fb46c78:    	mov	x0, x19
6c4fb46c7c:    	mov	w2, #0x4045             // =16453
6c4fb46c80:    	movk	w2, #0x1, lsl #16
6c4fb46c84:    	adr	x3, 0x6c4fb465e4 <trace+0x4e4>
6c4fb46c88:    	adrp	x16, 0x6c97723000 <trace+0x47bdd000>
6c4fb46c8c:    	add	x16, x16, #0xf88
6c4fb46c90:    	blr	x16
6c4fb46c94:    	mov	w21, w0
6c4fb46c98:    	dmb	ishld
6c4fb46c9c:    	b	0x6c4fb465e4 <trace+0x4e4>
6c4fb46ca0:    	mov	w1, w23
6c4fb46ca4:    	mov	w2, w21
6c4fb46ca8:    	mov	x0, x19
6c4fb46cac:    	mov	w3, #0x4045             // =16453
6c4fb46cb0:    	movk	w3, #0x1, lsl #16
6c4fb46cb4:    	adr	x4, 0x6c4fb46610 <trace+0x510>
6c4fb46cb8:    	adrp	x16, 0x6c97724000 <trace+0x47bde000>
6c4fb46cbc:    	add	x16, x16, #0xb68
6c4fb46cc0:    	blr	x16
6c4fb46cc4:    	dmb	ishld
6c4fb46cc8:    	b	0x6c4fb46610 <trace+0x510>
6c4fb46ccc:    	mov	w1, w20
6c4fb46cd0:    	mov	x0, x19
6c4fb46cd4:    	mov	w2, #0x4045             // =16453
6c4fb46cd8:    	movk	w2, #0x1, lsl #16
6c4fb46cdc:    	adr	x3, 0x6c4fb4668c <trace+0x58c>
6c4fb46ce0:    	adrp	x16, 0x6c97723000 <trace+0x47bdd000>
6c4fb46ce4:    	add	x16, x16, #0xf88
6c4fb46ce8:    	blr	x16
6c4fb46cec:    	mov	w21, w0
6c4fb46cf0:    	dmb	ishld
6c4fb46cf4:    	b	0x6c4fb4668c <trace+0x58c>
6c4fb46cf8:    	mov	w1, w22
6c4fb46cfc:    	mov	w2, w21
6c4fb46d00:    	mov	x0, x19
6c4fb46d04:    	mov	w3, #0x4045             // =16453
6c4fb46d08:    	movk	w3, #0x1, lsl #16
6c4fb46d0c:    	adr	x4, 0x6c4fb466bc <trace+0x5bc>
6c4fb46d10:    	adrp	x16, 0x6c97724000 <trace+0x47bde000>
6c4fb46d14:    	add	x16, x16, #0xb68
6c4fb46d18:    	blr	x16
6c4fb46d1c:    	dmb	ishld
6c4fb46d20:    	b	0x6c4fb466bc <trace+0x5bc>
6c4fb46d24:    	mov	w1, w20
6c4fb46d28:    	mov	x0, x19
6c4fb46d2c:    	mov	w2, #0x4045             // =16453
6c4fb46d30:    	movk	w2, #0x1, lsl #16
6c4fb46d34:    	adr	x3, 0x6c4fb4673c <trace+0x63c>
6c4fb46d38:    	adrp	x16, 0x6c97723000 <trace+0x47bdd000>
6c4fb46d3c:    	add	x16, x16, #0xf88
6c4fb46d40:    	blr	x16
6c4fb46d44:    	mov	w21, w0
6c4fb46d48:    	dmb	ishld
6c4fb46d4c:    	b	0x6c4fb4673c <trace+0x63c>
6c4fb46d50:    	mov	w1, w22
6c4fb46d54:    	mov	w2, w21
6c4fb46d58:    	mov	x0, x19
6c4fb46d5c:    	mov	w3, #0x4045             // =16453
6c4fb46d60:    	movk	w3, #0x1, lsl #16
6c4fb46d64:    	adr	x4, 0x6c4fb46764 <trace+0x664>
6c4fb46d68:    	adrp	x16, 0x6c97724000 <trace+0x47bde000>
6c4fb46d6c:    	add	x16, x16, #0xb68
6c4fb46d70:    	blr	x16
6c4fb46d74:    	dmb	ishld
6c4fb46d78:    	b	0x6c4fb46764 <trace+0x664>