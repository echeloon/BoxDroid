
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-2b1368-6eaead72c0.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006eaead72c0 <trace>:
6eaead72c0:    	ldur	w20, [x19, #-0x10]  // guest 0x2b1368, sampled 0
6eaead72c4:    	tbnz	w20, #0x1f, 0x6eaead8174 <trace+0xeb4>  // guest 0x2b1368, sampled 0
6eaead72c8:    	sturb	wzr, [x19, #-0xc]  // guest 0x2b1368, sampled 0
6eaead72cc:    	ldr	w20, [x19]  // guest 0x2b1368, sampled 0
6eaead72d0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b1368, sampled 0
6eaead72d4:    	and	x16, x16, x20, lsr #7  // guest 0x2b1368, sampled 0
6eaead72d8:    	add	x17, x17, x16  // guest 0x2b1368, sampled 0
6eaead72dc:    	ldp	x16, x17, [x17]  // guest 0x2b1368, sampled 0
6eaead72e0:    	and	w30, w20, #0xfffff003  // guest 0x2b1368, sampled 0
6eaead72e4:    	cmp	w16, w30  // guest 0x2b1368, sampled 0
6eaead72e8:    	b.ne	0x6eaead817c <trace+0xebc>  // guest 0x2b1368, sampled 0
6eaead72ec:    	add	x30, x17, w20, uxtw  // guest 0x2b1368, sampled 0
6eaead72f0:    	ldapr	w2, [x30]  // guest 0x2b1368, sampled 1
6eaead72f4:    	ldr	w21, [x19, #0x188]  // guest 0x2b1368, sampled 0
6eaead72f8:    	add	w22, w21, #0x7  // guest 0x2b1368, sampled 0
6eaead72fc:    	and	w22, w22, #0x7  // guest 0x2b1368, sampled 0
6eaead7300:    	lsl	w22, w22, #4  // guest 0x2b1368, sampled 0
6eaead7304:    	add	w22, w22, #0x1a0  // guest 0x2b1368, sampled 0
6eaead7308:    	sxtw	x22, w22  // guest 0x2b1368, sampled 0
6eaead730c:    	add	x1, x22, x19  // guest 0x2b1368, sampled 0
6eaead7310:    	mov	x0, x19  // guest 0x2b1368, sampled 0
6eaead7314:    	adrp	x16, 0x6efc8aa000 <trace+0x4ddd3000>  // guest 0x2b1368, sampled 0
6eaead7318:    	add	x16, x16, #0x484  // guest 0x2b1368, sampled 0
6eaead731c:    	blr	x16  // guest 0x2b1368, sampled 0
6eaead7320:    	sub	w21, w21, #0x1  // guest 0x2b1368, sampled 0
6eaead7324:    	and	w21, w21, #0x7  // guest 0x2b1368, sampled 0
6eaead7328:    	str	w21, [x19, #0x188]  // guest 0x2b1368, sampled 0
6eaead732c:    	sxtw	x22, w21  // guest 0x2b1368, sampled 0
6eaead7330:    	add	x22, x22, x19  // guest 0x2b1368, sampled 0
6eaead7334:    	strb	wzr, [x22, #0x190]  // guest 0x2b1368, sampled 0
6eaead7338:    	ldr	w22, [x19, #0x74]  // guest 0x2b1368, sampled 0
6eaead733c:    	strh	w22, [x19, #0x224]  // guest 0x2b1368, sampled 0
6eaead7340:    	str	w20, [x19, #0x230]  // guest 0x2b1368, sampled 0
6eaead7344:    	ldr	w22, [x19, #0x54]  // guest 0x2b1368, sampled 0
6eaead7348:    	strh	w22, [x19, #0x222]  // guest 0x2b1368, sampled 0
6eaead734c:    	mov	w22, #0x1368            // =4968  // guest 0x2b1368, sampled 0
6eaead7350:    	movk	w22, #0x2b, lsl #16  // guest 0x2b1368, sampled 0
6eaead7354:    	str	w22, [x19, #0x228]  // guest 0x2b1368, sampled 0
6eaead7358:    	ldr	w22, [x19, #0x8]  // guest 0x2b136a, sampled 0
6eaead735c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b136a, sampled 0
6eaead7360:    	and	x16, x16, x22, lsr #7  // guest 0x2b136a, sampled 0
6eaead7364:    	add	x17, x17, x16  // guest 0x2b136a, sampled 0
6eaead7368:    	ldp	x16, x17, [x17]  // guest 0x2b136a, sampled 0
6eaead736c:    	and	w30, w22, #0xfffff003  // guest 0x2b136a, sampled 1
6eaead7370:    	cmp	w16, w30  // guest 0x2b136a, sampled 0
6eaead7374:    	b.ne	0x6eaead81a8 <trace+0xee8>  // guest 0x2b136a, sampled 0
6eaead7378:    	add	x30, x17, w22, uxtw  // guest 0x2b136a, sampled 0
6eaead737c:    	ldapr	w22, [x30]  // guest 0x2b136a, sampled 0
6eaead7380:    	str	w22, [x19, #0x14]  // guest 0x2b136a, sampled 1
6eaead7384:    	ldr	w23, [x19, #0x18]  // guest 0x2b136c, sampled 0
6eaead7388:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b136c, sampled 0
6eaead738c:    	and	x16, x16, x23, lsr #7  // guest 0x2b136c, sampled 0
6eaead7390:    	add	x17, x17, x16  // guest 0x2b136c, sampled 0
6eaead7394:    	ldp	x16, x17, [x17]  // guest 0x2b136c, sampled 0
6eaead7398:    	and	w30, w23, #0xfffff003  // guest 0x2b136c, sampled 0
6eaead739c:    	cmp	w16, w30  // guest 0x2b136c, sampled 0
6eaead73a0:    	b.ne	0x6eaead81d4 <trace+0xf14>  // guest 0x2b136c, sampled 0
6eaead73a4:    	add	x30, x17, w23, uxtw  // guest 0x2b136c, sampled 0
6eaead73a8:    	ldapr	w2, [x30]  // guest 0x2b136c, sampled 0
6eaead73ac:    	add	w24, w21, #0x7  // guest 0x2b136c, sampled 0
6eaead73b0:    	and	w24, w24, #0x7  // guest 0x2b136c, sampled 0
6eaead73b4:    	lsl	w24, w24, #4  // guest 0x2b136c, sampled 0
6eaead73b8:    	add	w24, w24, #0x1a0  // guest 0x2b136c, sampled 0
6eaead73bc:    	sxtw	x24, w24  // guest 0x2b136c, sampled 0
6eaead73c0:    	add	x1, x24, x19  // guest 0x2b136c, sampled 0
6eaead73c4:    	mov	x0, x19  // guest 0x2b136c, sampled 0
6eaead73c8:    	adrp	x16, 0x6efc8aa000 <trace+0x4ddd3000>  // guest 0x2b136c, sampled 0
6eaead73cc:    	add	x16, x16, #0x484  // guest 0x2b136c, sampled 0
6eaead73d0:    	blr	x16  // guest 0x2b136c, sampled 0
6eaead73d4:    	sub	w21, w21, #0x1  // guest 0x2b136c, sampled 0
6eaead73d8:    	and	w21, w21, #0x7  // guest 0x2b136c, sampled 0
6eaead73dc:    	str	w21, [x19, #0x188]  // guest 0x2b136c, sampled 0
6eaead73e0:    	sxtw	x24, w21  // guest 0x2b136c, sampled 0
6eaead73e4:    	add	x24, x24, x19  // guest 0x2b136c, sampled 0
6eaead73e8:    	strb	wzr, [x24, #0x190]  // guest 0x2b136c, sampled 0
6eaead73ec:    	ldr	w24, [x19, #0x74]  // guest 0x2b136c, sampled 0
6eaead73f0:    	strh	w24, [x19, #0x224]  // guest 0x2b136c, sampled 0
6eaead73f4:    	str	w23, [x19, #0x230]  // guest 0x2b136c, sampled 0
6eaead73f8:    	ldr	w24, [x19, #0x54]  // guest 0x2b136c, sampled 0
6eaead73fc:    	strh	w24, [x19, #0x222]  // guest 0x2b136c, sampled 0
6eaead7400:    	mov	w24, #0x136c            // =4972  // guest 0x2b136c, sampled 0
6eaead7404:    	movk	w24, #0x2b, lsl #16  // guest 0x2b136c, sampled 0
6eaead7408:    	str	w24, [x19, #0x228]  // guest 0x2b136c, sampled 0
6eaead740c:    	ldr	w24, [x19, #0x10]  // guest 0x2b136e, sampled 0
6eaead7410:    	add	w25, w24, #0x20  // guest 0x2b136e, sampled 0
6eaead7414:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b136e, sampled 0
6eaead7418:    	and	x16, x16, x25, lsr #7  // guest 0x2b136e, sampled 0
6eaead741c:    	add	x17, x17, x16  // guest 0x2b136e, sampled 0
6eaead7420:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2b136e, sampled 0
6eaead7424:    	and	w30, w25, #0xfffff003  // guest 0x2b136e, sampled 0
6eaead7428:    	cmp	w16, w30  // guest 0x2b136e, sampled 0
6eaead742c:    	b.ne	0x6eaead8200 <trace+0xf40>  // guest 0x2b136e, sampled 0
6eaead7430:    	add	x30, x17, w25, uxtw  // guest 0x2b136e, sampled 0
6eaead7434:    	stlr	w22, [x30]  // guest 0x2b136e, sampled 0
6eaead7438:    	sub	w21, w21, #0x1  // guest 0x2b1372, sampled 0
6eaead743c:    	and	w21, w21, #0x7  // guest 0x2b1372, sampled 0
6eaead7440:    	str	w21, [x19, #0x188]  // guest 0x2b1372, sampled 0
6eaead7444:    	sxtw	x22, w21  // guest 0x2b1372, sampled 0
6eaead7448:    	add	x22, x22, x19  // guest 0x2b1372, sampled 0
6eaead744c:    	strb	wzr, [x22, #0x190]  // guest 0x2b1372, sampled 0
6eaead7450:    	lsl	w22, w21, #4  // guest 0x2b1372, sampled 0
6eaead7454:    	add	w22, w22, #0x1a0  // guest 0x2b1372, sampled 0
6eaead7458:    	sxtw	x22, w22  // guest 0x2b1372, sampled 0
6eaead745c:    	add	x22, x22, x19  // guest 0x2b1372, sampled 0
6eaead7460:    	add	w25, w21, #0x2  // guest 0x2b1372, sampled 0
6eaead7464:    	and	w25, w25, #0x7  // guest 0x2b1372, sampled 0
6eaead7468:    	lsl	w25, w25, #4  // guest 0x2b1372, sampled 0
6eaead746c:    	add	w25, w25, #0x1a0  // guest 0x2b1372, sampled 0
6eaead7470:    	sxtw	x25, w25  // guest 0x2b1372, sampled 0
6eaead7474:    	add	x25, x25, x19  // guest 0x2b1372, sampled 0
6eaead7478:    	ldr	x26, [x25]  // guest 0x2b1372, sampled 0
6eaead747c:    	ldrh	w25, [x25, #0x8]  // guest 0x2b1372, sampled 0
6eaead7480:    	str	x26, [x22]  // guest 0x2b1372, sampled 0
6eaead7484:    	strh	w25, [x22, #0x8]  // guest 0x2b1372, sampled 0
6eaead7488:    	ldr	w22, [x19, #0x54]  // guest 0x2b1372, sampled 0
6eaead748c:    	strh	w22, [x19, #0x222]  // guest 0x2b1372, sampled 0
6eaead7490:    	mov	w22, #0x1372            // =4978  // guest 0x2b1372, sampled 0
6eaead7494:    	movk	w22, #0x2b, lsl #16  // guest 0x2b1372, sampled 0
6eaead7498:    	str	w22, [x19, #0x228]  // guest 0x2b1372, sampled 0
6eaead749c:    	add	w22, w24, #0x14  // guest 0x2b1374, sampled 0
6eaead74a0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b1374, sampled 0
6eaead74a4:    	and	x16, x16, x22, lsr #7  // guest 0x2b1374, sampled 0
6eaead74a8:    	add	x17, x17, x16  // guest 0x2b1374, sampled 0
6eaead74ac:    	ldp	x16, x17, [x17]  // guest 0x2b1374, sampled 0
6eaead74b0:    	and	w30, w22, #0xfffff003  // guest 0x2b1374, sampled 0
6eaead74b4:    	cmp	w16, w30  // guest 0x2b1374, sampled 0
6eaead74b8:    	b.ne	0x6eaead822c <trace+0xf6c>  // guest 0x2b1374, sampled 0
6eaead74bc:    	add	x30, x17, w22, uxtw  // guest 0x2b1374, sampled 1
6eaead74c0:    	ldapr	w22, [x30]  // guest 0x2b1374, sampled 0
6eaead74c4:    	str	w22, [x19, #0x14]  // guest 0x2b1374, sampled 0
6eaead74c8:    	add	x22, x19, #0x258  // guest 0x2b1378, sampled 0
6eaead74cc:    	add	w25, w21, #0x1  // guest 0x2b1378, sampled 0
6eaead74d0:    	and	w25, w25, #0x7  // guest 0x2b1378, sampled 0
6eaead74d4:    	lsl	w25, w25, #4  // guest 0x2b1378, sampled 0
6eaead74d8:    	add	w25, w25, #0x1a0  // guest 0x2b1378, sampled 0
6eaead74dc:    	sxtw	x25, w25  // guest 0x2b1378, sampled 0
6eaead74e0:    	add	x25, x25, x19  // guest 0x2b1378, sampled 0
6eaead74e4:    	ldr	x26, [x25]  // guest 0x2b1378, sampled 0
6eaead74e8:    	ldrh	w25, [x25, #0x8]  // guest 0x2b1378, sampled 0
6eaead74ec:    	str	x26, [x22]  // guest 0x2b1378, sampled 0
6eaead74f0:    	strh	w25, [x22, #0x8]  // guest 0x2b1378, sampled 0
6eaead74f4:    	lsl	w22, w21, #4  // guest 0x2b1378, sampled 0
6eaead74f8:    	add	w22, w22, #0x1a0  // guest 0x2b1378, sampled 0
6eaead74fc:    	sxtw	x22, w22  // guest 0x2b1378, sampled 0
6eaead7500:    	add	x1, x22, x19  // guest 0x2b1378, sampled 0
6eaead7504:    	add	x2, x19, #0x258  // guest 0x2b1378, sampled 0
6eaead7508:    	mov	x0, x19  // guest 0x2b1378, sampled 0
6eaead750c:    	adrp	x16, 0x6efc8ab000 <trace+0x4ddd4000>  // guest 0x2b1378, sampled 0
6eaead7510:    	add	x16, x16, #0xc20  // guest 0x2b1378, sampled 0
6eaead7514:    	blr	x16  // guest 0x2b1378, sampled 0
6eaead7518:    	ldr	w22, [x19, #0x54]  // guest 0x2b1378, sampled 0
6eaead751c:    	strh	w22, [x19, #0x222]  // guest 0x2b1378, sampled 0
6eaead7520:    	mov	w22, #0x1378            // =4984  // guest 0x2b1378, sampled 0
6eaead7524:    	movk	w22, #0x2b, lsl #16  // guest 0x2b1378, sampled 0
6eaead7528:    	str	w22, [x19, #0x228]  // guest 0x2b1378, sampled 0
6eaead752c:    	ldr	w22, [x19, #0xc]  // guest 0x2b137a, sampled 0
6eaead7530:    	add	w22, w22, #0x8  // guest 0x2b137a, sampled 0
6eaead7534:    	str	w22, [x19, #0xc]  // guest 0x2b137a, sampled 0
6eaead7538:    	str	w22, [x19, #0x28]  // guest 0x2b137a, sampled 0
6eaead753c:    	mov	w25, #0x8               // =8  // guest 0x2b137a, sampled 0
6eaead7540:    	str	w25, [x19, #0x2c]  // guest 0x2b137a, sampled 0
6eaead7544:    	add	w25, w24, #0x10  // guest 0x2b137d, sampled 0
6eaead7548:    	mov	w26, w25  // guest 0x2b137d, sampled 0
6eaead754c:    	lsl	w27, w21, #4  // guest 0x2b137d, sampled 0
6eaead7550:    	add	w27, w27, #0x1a0  // guest 0x2b137d, sampled 0
6eaead7554:    	sxtw	x27, w27  // guest 0x2b137d, sampled 0
6eaead7558:    	add	x1, x27, x19  // guest 0x2b137d, sampled 0
6eaead755c:    	mov	x0, x19  // guest 0x2b137d, sampled 0
6eaead7560:    	adrp	x16, 0x6efc8aa000 <trace+0x4ddd3000>  // guest 0x2b137d, sampled 0
6eaead7564:    	add	x16, x16, #0x5c0  // guest 0x2b137d, sampled 0
6eaead7568:    	blr	x16  // guest 0x2b137d, sampled 0
6eaead756c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b137d, sampled 0
6eaead7570:    	and	x16, x16, x25, lsr #7  // guest 0x2b137d, sampled 0
6eaead7574:    	add	x17, x17, x16  // guest 0x2b137d, sampled 0
6eaead7578:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2b137d, sampled 0
6eaead757c:    	and	w30, w25, #0xfffff003  // guest 0x2b137d, sampled 0
6eaead7580:    	cmp	w16, w30  // guest 0x2b137d, sampled 0
6eaead7584:    	b.ne	0x6eaead8258 <trace+0xf98>  // guest 0x2b137d, sampled 0
6eaead7588:    	add	x30, x17, w25, uxtw  // guest 0x2b137d, sampled 0
6eaead758c:    	stlr	w0, [x30]  // guest 0x2b137d, sampled 0
6eaead7590:    	sxtw	x25, w21  // guest 0x2b137d, sampled 0
6eaead7594:    	add	x25, x25, x19  // guest 0x2b137d, sampled 0
6eaead7598:    	mov	w27, #0x1               // =1  // guest 0x2b137d, sampled 0
6eaead759c:    	strb	w27, [x25, #0x190]  // guest 0x2b137d, sampled 0
6eaead75a0:    	add	w21, w21, w27  // guest 0x2b137d, sampled 0
6eaead75a4:    	and	w21, w21, #0x7  // guest 0x2b137d, sampled 0
6eaead75a8:    	str	w21, [x19, #0x188]  // guest 0x2b137d, sampled 0
6eaead75ac:    	ldr	w25, [x19, #0x64]  // guest 0x2b137d, sampled 0
6eaead75b0:    	strh	w25, [x19, #0x224]  // guest 0x2b137d, sampled 0
6eaead75b4:    	str	w26, [x19, #0x230]  // guest 0x2b137d, sampled 0
6eaead75b8:    	ldr	w25, [x19, #0x54]  // guest 0x2b137d, sampled 0
6eaead75bc:    	strh	w25, [x19, #0x222]  // guest 0x2b137d, sampled 0
6eaead75c0:    	mov	w25, #0x137d            // =4989  // guest 0x2b137d, sampled 0
6eaead75c4:    	movk	w25, #0x2b, lsl #16  // guest 0x2b137d, sampled 0
6eaead75c8:    	str	w25, [x19, #0x228]  // guest 0x2b137d, sampled 0
6eaead75cc:    	ldr	w25, [x19, #0x4]  // guest 0x2b1381, sampled 0
6eaead75d0:    	add	w26, w20, w25  // guest 0x2b1381, sampled 0
6eaead75d4:    	mov	w28, w26  // guest 0x2b1381, sampled 0
6eaead75d8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b1381, sampled 0
6eaead75dc:    	and	x16, x16, x26, lsr #7  // guest 0x2b1381, sampled 0
6eaead75e0:    	add	x17, x17, x16  // guest 0x2b1381, sampled 0
6eaead75e4:    	ldp	x16, x17, [x17]  // guest 0x2b1381, sampled 0
6eaead75e8:    	and	w30, w26, #0xfffff003  // guest 0x2b1381, sampled 0
6eaead75ec:    	cmp	w16, w30  // guest 0x2b1381, sampled 0
6eaead75f0:    	b.ne	0x6eaead8284 <trace+0xfc4>  // guest 0x2b1381, sampled 0
6eaead75f4:    	add	x30, x17, w26, uxtw  // guest 0x2b1381, sampled 0
6eaead75f8:    	ldapr	w2, [x30]  // guest 0x2b1381, sampled 0
6eaead75fc:    	add	w26, w21, #0x7  // guest 0x2b1381, sampled 0
6eaead7600:    	and	w26, w26, #0x7  // guest 0x2b1381, sampled 0
6eaead7604:    	lsl	w26, w26, #4  // guest 0x2b1381, sampled 0
6eaead7608:    	add	w26, w26, #0x1a0  // guest 0x2b1381, sampled 0
6eaead760c:    	sxtw	x26, w26  // guest 0x2b1381, sampled 0
6eaead7610:    	add	x1, x26, x19  // guest 0x2b1381, sampled 0
6eaead7614:    	mov	x0, x19  // guest 0x2b1381, sampled 0
6eaead7618:    	adrp	x16, 0x6efc8aa000 <trace+0x4ddd3000>  // guest 0x2b1381, sampled 0
6eaead761c:    	add	x16, x16, #0x484  // guest 0x2b1381, sampled 0
6eaead7620:    	blr	x16  // guest 0x2b1381, sampled 0
6eaead7624:    	sub	w21, w21, #0x1  // guest 0x2b1381, sampled 0
6eaead7628:    	and	w21, w21, #0x7  // guest 0x2b1381, sampled 0
6eaead762c:    	str	w21, [x19, #0x188]  // guest 0x2b1381, sampled 0
6eaead7630:    	sxtw	x26, w21  // guest 0x2b1381, sampled 0
6eaead7634:    	add	x26, x26, x19  // guest 0x2b1381, sampled 0
6eaead7638:    	strb	wzr, [x26, #0x190]  // guest 0x2b1381, sampled 0
6eaead763c:    	ldr	w26, [x19, #0x74]  // guest 0x2b1381, sampled 0
6eaead7640:    	strh	w26, [x19, #0x224]  // guest 0x2b1381, sampled 0
6eaead7644:    	str	w28, [x19, #0x230]  // guest 0x2b1381, sampled 0
6eaead7648:    	ldr	w26, [x19, #0x54]  // guest 0x2b1381, sampled 0
6eaead764c:    	strh	w26, [x19, #0x222]  // guest 0x2b1381, sampled 0
6eaead7650:    	mov	w26, #0x1381            // =4993  // guest 0x2b1381, sampled 0
6eaead7654:    	movk	w26, #0x2b, lsl #16  // guest 0x2b1381, sampled 0
6eaead7658:    	str	w26, [x19, #0x228]  // guest 0x2b1381, sampled 0
6eaead765c:    	add	w26, w24, #0x28  // guest 0x2b1384, sampled 0
6eaead7660:    	mov	w28, w26  // guest 0x2b1384, sampled 0
6eaead7664:    	lsl	w8, w21, #4  // guest 0x2b1384, sampled 0
6eaead7668:    	add	w8, w8, #0x1a0  // guest 0x2b1384, sampled 0
6eaead766c:    	sxtw	x8, w8  // guest 0x2b1384, sampled 0
6eaead7670:    	add	x1, x8, x19  // guest 0x2b1384, sampled 0
6eaead7674:    	mov	x0, x19  // guest 0x2b1384, sampled 0
6eaead7678:    	adrp	x16, 0x6efc8aa000 <trace+0x4ddd3000>  // guest 0x2b1384, sampled 0
6eaead767c:    	add	x16, x16, #0x5c0  // guest 0x2b1384, sampled 0
6eaead7680:    	blr	x16  // guest 0x2b1384, sampled 0
6eaead7684:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b1384, sampled 0
6eaead7688:    	and	x16, x16, x26, lsr #7  // guest 0x2b1384, sampled 0
6eaead768c:    	add	x17, x17, x16  // guest 0x2b1384, sampled 0
6eaead7690:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2b1384, sampled 0
6eaead7694:    	and	w30, w26, #0xfffff003  // guest 0x2b1384, sampled 0
6eaead7698:    	cmp	w16, w30  // guest 0x2b1384, sampled 0
6eaead769c:    	b.ne	0x6eaead82b0 <trace+0xff0>  // guest 0x2b1384, sampled 0
6eaead76a0:    	add	x30, x17, w26, uxtw  // guest 0x2b1384, sampled 0
6eaead76a4:    	stlr	w0, [x30]  // guest 0x2b1384, sampled 0
6eaead76a8:    	ldr	w26, [x19, #0x64]  // guest 0x2b1384, sampled 0
6eaead76ac:    	strh	w26, [x19, #0x224]  // guest 0x2b1384, sampled 0
6eaead76b0:    	str	w28, [x19, #0x230]  // guest 0x2b1384, sampled 0
6eaead76b4:    	ldr	w26, [x19, #0x54]  // guest 0x2b1384, sampled 0
6eaead76b8:    	strh	w26, [x19, #0x222]  // guest 0x2b1384, sampled 0
6eaead76bc:    	mov	w26, #0x1384            // =4996  // guest 0x2b1384, sampled 0
6eaead76c0:    	movk	w26, #0x2b, lsl #16  // guest 0x2b1384, sampled 0
6eaead76c4:    	str	w26, [x19, #0x228]  // guest 0x2b1384, sampled 0
6eaead76c8:    	add	w26, w24, #0x20  // guest 0x2b1388, sampled 0
6eaead76cc:    	mov	w28, w26  // guest 0x2b1388, sampled 0
6eaead76d0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b1388, sampled 0
6eaead76d4:    	and	x16, x16, x26, lsr #7  // guest 0x2b1388, sampled 0
6eaead76d8:    	add	x17, x17, x16  // guest 0x2b1388, sampled 0
6eaead76dc:    	ldp	x16, x17, [x17]  // guest 0x2b1388, sampled 0
6eaead76e0:    	and	w30, w26, #0xfffff003  // guest 0x2b1388, sampled 0
6eaead76e4:    	cmp	w16, w30  // guest 0x2b1388, sampled 0
6eaead76e8:    	b.ne	0x6eaead82dc <trace+0x101c>  // guest 0x2b1388, sampled 0
6eaead76ec:    	add	x30, x17, w26, uxtw  // guest 0x2b1388, sampled 0
6eaead76f0:    	ldapr	w2, [x30]  // guest 0x2b1388, sampled 0
6eaead76f4:    	add	x1, x19, #0x258  // guest 0x2b1388, sampled 1
6eaead76f8:    	mov	x0, x19  // guest 0x2b1388, sampled 0
6eaead76fc:    	adrp	x16, 0x6efc8aa000 <trace+0x4ddd3000>  // guest 0x2b1388, sampled 0
6eaead7700:    	add	x16, x16, #0x484  // guest 0x2b1388, sampled 0
6eaead7704:    	blr	x16  // guest 0x2b1388, sampled 0
6eaead7708:    	lsl	w26, w21, #4  // guest 0x2b1388, sampled 0
6eaead770c:    	add	w26, w26, #0x1a0  // guest 0x2b1388, sampled 0
6eaead7710:    	sxtw	x26, w26  // guest 0x2b1388, sampled 0
6eaead7714:    	add	x1, x26, x19  // guest 0x2b1388, sampled 0
6eaead7718:    	add	x2, x19, #0x258  // guest 0x2b1388, sampled 0
6eaead771c:    	mov	x0, x19  // guest 0x2b1388, sampled 0
6eaead7720:    	adrp	x16, 0x6efc8ab000 <trace+0x4ddd4000>  // guest 0x2b1388, sampled 0
6eaead7724:    	add	x16, x16, #0xa78  // guest 0x2b1388, sampled 0
6eaead7728:    	blr	x16  // guest 0x2b1388, sampled 0
6eaead772c:    	ldr	w26, [x19, #0x64]  // guest 0x2b1388, sampled 0
6eaead7730:    	strh	w26, [x19, #0x224]  // guest 0x2b1388, sampled 0
6eaead7734:    	str	w28, [x19, #0x230]  // guest 0x2b1388, sampled 0
6eaead7738:    	ldr	w26, [x19, #0x54]  // guest 0x2b1388, sampled 0
6eaead773c:    	strh	w26, [x19, #0x222]  // guest 0x2b1388, sampled 0
6eaead7740:    	mov	w26, #0x1388            // =5000  // guest 0x2b1388, sampled 0
6eaead7744:    	movk	w26, #0x2b, lsl #16  // guest 0x2b1388, sampled 0
6eaead7748:    	str	w26, [x19, #0x228]  // guest 0x2b1388, sampled 0
6eaead774c:    	add	w26, w24, #0x30  // guest 0x2b138c, sampled 0
6eaead7750:    	mov	w28, w26  // guest 0x2b138c, sampled 0
6eaead7754:    	lsl	w8, w21, #4  // guest 0x2b138c, sampled 0
6eaead7758:    	add	w8, w8, #0x1a0  // guest 0x2b138c, sampled 0
6eaead775c:    	sxtw	x8, w8  // guest 0x2b138c, sampled 0
6eaead7760:    	add	x1, x8, x19  // guest 0x2b138c, sampled 0
6eaead7764:    	mov	x0, x19  // guest 0x2b138c, sampled 0
6eaead7768:    	adrp	x16, 0x6efc8aa000 <trace+0x4ddd3000>  // guest 0x2b138c, sampled 0
6eaead776c:    	add	x16, x16, #0x5c0  // guest 0x2b138c, sampled 0
6eaead7770:    	blr	x16  // guest 0x2b138c, sampled 0
6eaead7774:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b138c, sampled 0
6eaead7778:    	and	x16, x16, x26, lsr #7  // guest 0x2b138c, sampled 0
6eaead777c:    	add	x17, x17, x16  // guest 0x2b138c, sampled 0
6eaead7780:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2b138c, sampled 0
6eaead7784:    	and	w30, w26, #0xfffff003  // guest 0x2b138c, sampled 0
6eaead7788:    	cmp	w16, w30  // guest 0x2b138c, sampled 0
6eaead778c:    	b.ne	0x6eaead8308 <trace+0x1048>  // guest 0x2b138c, sampled 0
6eaead7790:    	add	x30, x17, w26, uxtw  // guest 0x2b138c, sampled 1
6eaead7794:    	stlr	w0, [x30]  // guest 0x2b138c, sampled 0
6eaead7798:    	sxtw	x26, w21  // guest 0x2b138c, sampled 0
6eaead779c:    	add	x26, x26, x19  // guest 0x2b138c, sampled 0
6eaead77a0:    	strb	w27, [x26, #0x190]  // guest 0x2b138c, sampled 0
6eaead77a4:    	add	w21, w21, w27  // guest 0x2b138c, sampled 0
6eaead77a8:    	and	w21, w21, #0x7  // guest 0x2b138c, sampled 0
6eaead77ac:    	str	w21, [x19, #0x188]  // guest 0x2b138c, sampled 0
6eaead77b0:    	ldr	w26, [x19, #0x64]  // guest 0x2b138c, sampled 0
6eaead77b4:    	strh	w26, [x19, #0x224]  // guest 0x2b138c, sampled 0
6eaead77b8:    	str	w28, [x19, #0x230]  // guest 0x2b138c, sampled 0
6eaead77bc:    	ldr	w26, [x19, #0x54]  // guest 0x2b138c, sampled 0
6eaead77c0:    	strh	w26, [x19, #0x222]  // guest 0x2b138c, sampled 0
6eaead77c4:    	mov	w26, #0x138c            // =5004  // guest 0x2b138c, sampled 0
6eaead77c8:    	movk	w26, #0x2b, lsl #16  // guest 0x2b138c, sampled 0
6eaead77cc:    	str	w26, [x19, #0x228]  // guest 0x2b138c, sampled 0
6eaead77d0:    	add	x26, x19, #0x258  // guest 0x2b1390, sampled 0
6eaead77d4:    	add	w28, w21, w27  // guest 0x2b1390, sampled 0
6eaead77d8:    	and	w28, w28, #0x7  // guest 0x2b1390, sampled 0
6eaead77dc:    	lsl	w28, w28, #4  // guest 0x2b1390, sampled 0
6eaead77e0:    	add	w28, w28, #0x1a0  // guest 0x2b1390, sampled 0
6eaead77e4:    	sxtw	x28, w28  // guest 0x2b1390, sampled 0
6eaead77e8:    	add	x28, x28, x19  // guest 0x2b1390, sampled 0
6eaead77ec:    	ldr	x8, [x28]  // guest 0x2b1390, sampled 0
6eaead77f0:    	ldrh	w28, [x28, #0x8]  // guest 0x2b1390, sampled 0
6eaead77f4:    	str	x8, [x26]  // guest 0x2b1390, sampled 0
6eaead77f8:    	strh	w28, [x26, #0x8]  // guest 0x2b1390, sampled 0
6eaead77fc:    	lsl	w26, w21, #4  // guest 0x2b1390, sampled 0
6eaead7800:    	add	w26, w26, #0x1a0  // guest 0x2b1390, sampled 0
6eaead7804:    	sxtw	x26, w26  // guest 0x2b1390, sampled 0
6eaead7808:    	add	x1, x26, x19  // guest 0x2b1390, sampled 0
6eaead780c:    	add	x2, x19, #0x258  // guest 0x2b1390, sampled 0
6eaead7810:    	mov	x0, x19  // guest 0x2b1390, sampled 0
6eaead7814:    	adrp	x16, 0x6efc8ab000 <trace+0x4ddd4000>  // guest 0x2b1390, sampled 0
6eaead7818:    	add	x16, x16, #0xa78  // guest 0x2b1390, sampled 0
6eaead781c:    	blr	x16  // guest 0x2b1390, sampled 0
6eaead7820:    	ldr	w26, [x19, #0x54]  // guest 0x2b1390, sampled 0
6eaead7824:    	strh	w26, [x19, #0x222]  // guest 0x2b1390, sampled 0
6eaead7828:    	mov	w26, #0x1390            // =5008  // guest 0x2b1390, sampled 0
6eaead782c:    	movk	w26, #0x2b, lsl #16  // guest 0x2b1390, sampled 0
6eaead7830:    	str	w26, [x19, #0x228]  // guest 0x2b1390, sampled 0
6eaead7834:    	lsl	w26, w21, #4  // guest 0x2b1392, sampled 0
6eaead7838:    	add	w26, w26, #0x1a0  // guest 0x2b1392, sampled 0
6eaead783c:    	sxtw	x26, w26  // guest 0x2b1392, sampled 0
6eaead7840:    	add	x1, x26, x19  // guest 0x2b1392, sampled 0
6eaead7844:    	mov	x0, x19  // guest 0x2b1392, sampled 0
6eaead7848:    	adrp	x16, 0x6efc8aa000 <trace+0x4ddd3000>  // guest 0x2b1392, sampled 0
6eaead784c:    	add	x16, x16, #0x5c0  // guest 0x2b1392, sampled 0
6eaead7850:    	blr	x16  // guest 0x2b1392, sampled 0
6eaead7854:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b1392, sampled 0
6eaead7858:    	and	x16, x16, x20, lsr #7  // guest 0x2b1392, sampled 0
6eaead785c:    	add	x17, x17, x16  // guest 0x2b1392, sampled 0
6eaead7860:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2b1392, sampled 1
6eaead7864:    	and	w30, w20, #0xfffff003  // guest 0x2b1392, sampled 1
6eaead7868:    	cmp	w16, w30  // guest 0x2b1392, sampled 0
6eaead786c:    	b.ne	0x6eaead8334 <trace+0x1074>  // guest 0x2b1392, sampled 0
6eaead7870:    	add	x30, x17, w20, uxtw  // guest 0x2b1392, sampled 0
6eaead7874:    	stlr	w0, [x30]  // guest 0x2b1392, sampled 0
6eaead7878:    	sxtw	x26, w21  // guest 0x2b1392, sampled 0
6eaead787c:    	add	x26, x26, x19  // guest 0x2b1392, sampled 0
6eaead7880:    	strb	w27, [x26, #0x190]  // guest 0x2b1392, sampled 0
6eaead7884:    	add	w21, w21, w27  // guest 0x2b1392, sampled 0
6eaead7888:    	and	w21, w21, #0x7  // guest 0x2b1392, sampled 0
6eaead788c:    	ldr	w26, [x19, #0x74]  // guest 0x2b1392, sampled 0
6eaead7890:    	strh	w26, [x19, #0x224]  // guest 0x2b1392, sampled 0
6eaead7894:    	str	w20, [x19, #0x230]  // guest 0x2b1392, sampled 0
6eaead7898:    	ldr	w26, [x19, #0x54]  // guest 0x2b1392, sampled 0
6eaead789c:    	strh	w26, [x19, #0x222]  // guest 0x2b1392, sampled 0
6eaead78a0:    	mov	w26, #0x1392            // =5010  // guest 0x2b1392, sampled 0
6eaead78a4:    	movk	w26, #0x2b, lsl #16  // guest 0x2b1392, sampled 0
6eaead78a8:    	str	w26, [x19, #0x228]  // guest 0x2b1392, sampled 0
6eaead78ac:    	lsl	w26, w21, #4  // guest 0x2b1394, sampled 0
6eaead78b0:    	add	w26, w26, #0x1a0  // guest 0x2b1394, sampled 0
6eaead78b4:    	sxtw	x26, w26  // guest 0x2b1394, sampled 0
6eaead78b8:    	add	x26, x26, x19  // guest 0x2b1394, sampled 0
6eaead78bc:    	lsl	w28, w21, #4  // guest 0x2b1394, sampled 0
6eaead78c0:    	add	w28, w28, #0x1a0  // guest 0x2b1394, sampled 0
6eaead78c4:    	sxtw	x28, w28  // guest 0x2b1394, sampled 0
6eaead78c8:    	add	x28, x28, x19  // guest 0x2b1394, sampled 0
6eaead78cc:    	ldr	x8, [x28]  // guest 0x2b1394, sampled 0
6eaead78d0:    	ldrh	w28, [x28, #0x8]  // guest 0x2b1394, sampled 0
6eaead78d4:    	str	x8, [x26]  // guest 0x2b1394, sampled 0
6eaead78d8:    	strh	w28, [x26, #0x8]  // guest 0x2b1394, sampled 0
6eaead78dc:    	sxtw	x26, w21  // guest 0x2b1394, sampled 0
6eaead78e0:    	add	x26, x26, x19  // guest 0x2b1394, sampled 0
6eaead78e4:    	strb	w27, [x26, #0x190]  // guest 0x2b1394, sampled 0
6eaead78e8:    	add	w21, w21, w27  // guest 0x2b1394, sampled 0
6eaead78ec:    	and	w21, w21, #0x7  // guest 0x2b1394, sampled 0
6eaead78f0:    	str	w21, [x19, #0x188]  // guest 0x2b1394, sampled 0
6eaead78f4:    	ldr	w26, [x19, #0x54]  // guest 0x2b1394, sampled 0
6eaead78f8:    	strh	w26, [x19, #0x222]  // guest 0x2b1394, sampled 0
6eaead78fc:    	mov	w26, #0x1394            // =5012  // guest 0x2b1394, sampled 0
6eaead7900:    	movk	w26, #0x2b, lsl #16  // guest 0x2b1394, sampled 0
6eaead7904:    	str	w26, [x19, #0x228]  // guest 0x2b1394, sampled 0
6eaead7908:    	add	w26, w24, #0x20  // guest 0x2b1396, sampled 0
6eaead790c:    	mov	w28, w26  // guest 0x2b1396, sampled 0
6eaead7910:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b1396, sampled 0
6eaead7914:    	and	x16, x16, x26, lsr #7  // guest 0x2b1396, sampled 0
6eaead7918:    	add	x17, x17, x16  // guest 0x2b1396, sampled 0
6eaead791c:    	ldp	x16, x17, [x17]  // guest 0x2b1396, sampled 0
6eaead7920:    	and	w30, w26, #0xfffff003  // guest 0x2b1396, sampled 0
6eaead7924:    	cmp	w16, w30  // guest 0x2b1396, sampled 0
6eaead7928:    	b.ne	0x6eaead8360 <trace+0x10a0>  // guest 0x2b1396, sampled 0
6eaead792c:    	add	x30, x17, w26, uxtw  // guest 0x2b1396, sampled 0
6eaead7930:    	ldapr	w2, [x30]  // guest 0x2b1396, sampled 0
6eaead7934:    	add	w26, w21, #0x7  // guest 0x2b1396, sampled 0
6eaead7938:    	and	w26, w26, #0x7  // guest 0x2b1396, sampled 0
6eaead793c:    	lsl	w26, w26, #4  // guest 0x2b1396, sampled 0
6eaead7940:    	add	w26, w26, #0x1a0  // guest 0x2b1396, sampled 0
6eaead7944:    	sxtw	x26, w26  // guest 0x2b1396, sampled 0
6eaead7948:    	add	x1, x26, x19  // guest 0x2b1396, sampled 0
6eaead794c:    	mov	x0, x19  // guest 0x2b1396, sampled 0
6eaead7950:    	adrp	x16, 0x6efc8aa000 <trace+0x4ddd3000>  // guest 0x2b1396, sampled 0
6eaead7954:    	add	x16, x16, #0x484  // guest 0x2b1396, sampled 0
6eaead7958:    	blr	x16  // guest 0x2b1396, sampled 0
6eaead795c:    	sub	w21, w21, #0x1  // guest 0x2b1396, sampled 0
6eaead7960:    	and	w21, w21, #0x7  // guest 0x2b1396, sampled 0
6eaead7964:    	str	w21, [x19, #0x188]  // guest 0x2b1396, sampled 0
6eaead7968:    	sxtw	x26, w21  // guest 0x2b1396, sampled 0
6eaead796c:    	add	x26, x26, x19  // guest 0x2b1396, sampled 0
6eaead7970:    	strb	wzr, [x26, #0x190]  // guest 0x2b1396, sampled 0
6eaead7974:    	ldr	w26, [x19, #0x64]  // guest 0x2b1396, sampled 0
6eaead7978:    	strh	w26, [x19, #0x224]  // guest 0x2b1396, sampled 0
6eaead797c:    	str	w28, [x19, #0x230]  // guest 0x2b1396, sampled 0
6eaead7980:    	ldr	w26, [x19, #0x54]  // guest 0x2b1396, sampled 0
6eaead7984:    	strh	w26, [x19, #0x222]  // guest 0x2b1396, sampled 0
6eaead7988:    	mov	w26, #0x1396            // =5014  // guest 0x2b1396, sampled 0
6eaead798c:    	movk	w26, #0x2b, lsl #16  // guest 0x2b1396, sampled 0
6eaead7990:    	str	w26, [x19, #0x228]  // guest 0x2b1396, sampled 1
6eaead7994:    	add	w26, w24, #0x28  // guest 0x2b139a, sampled 0
6eaead7998:    	mov	w28, w26  // guest 0x2b139a, sampled 0
6eaead799c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b139a, sampled 0
6eaead79a0:    	and	x16, x16, x26, lsr #7  // guest 0x2b139a, sampled 0
6eaead79a4:    	add	x17, x17, x16  // guest 0x2b139a, sampled 0
6eaead79a8:    	ldp	x16, x17, [x17]  // guest 0x2b139a, sampled 0
6eaead79ac:    	and	w30, w26, #0xfffff003  // guest 0x2b139a, sampled 0
6eaead79b0:    	cmp	w16, w30  // guest 0x2b139a, sampled 0
6eaead79b4:    	b.ne	0x6eaead838c <trace+0x10cc>  // guest 0x2b139a, sampled 0
6eaead79b8:    	add	x30, x17, w26, uxtw  // guest 0x2b139a, sampled 0
6eaead79bc:    	ldapr	w2, [x30]  // guest 0x2b139a, sampled 0
6eaead79c0:    	add	x1, x19, #0x258  // guest 0x2b139a, sampled 1
6eaead79c4:    	mov	x0, x19  // guest 0x2b139a, sampled 0
6eaead79c8:    	adrp	x16, 0x6efc8aa000 <trace+0x4ddd3000>  // guest 0x2b139a, sampled 0
6eaead79cc:    	add	x16, x16, #0x484  // guest 0x2b139a, sampled 0
6eaead79d0:    	blr	x16  // guest 0x2b139a, sampled 0
6eaead79d4:    	lsl	w26, w21, #4  // guest 0x2b139a, sampled 0
6eaead79d8:    	add	w26, w26, #0x1a0  // guest 0x2b139a, sampled 0
6eaead79dc:    	sxtw	x26, w26  // guest 0x2b139a, sampled 0
6eaead79e0:    	add	x1, x26, x19  // guest 0x2b139a, sampled 0
6eaead79e4:    	add	x2, x19, #0x258  // guest 0x2b139a, sampled 0
6eaead79e8:    	mov	x0, x19  // guest 0x2b139a, sampled 0
6eaead79ec:    	adrp	x16, 0x6efc8ab000 <trace+0x4ddd4000>  // guest 0x2b139a, sampled 0
6eaead79f0:    	add	x16, x16, #0xc20  // guest 0x2b139a, sampled 0
6eaead79f4:    	blr	x16  // guest 0x2b139a, sampled 0
6eaead79f8:    	ldr	w26, [x19, #0x64]  // guest 0x2b139a, sampled 0
6eaead79fc:    	strh	w26, [x19, #0x224]  // guest 0x2b139a, sampled 0
6eaead7a00:    	str	w28, [x19, #0x230]  // guest 0x2b139a, sampled 0
6eaead7a04:    	ldr	w26, [x19, #0x54]  // guest 0x2b139a, sampled 0
6eaead7a08:    	strh	w26, [x19, #0x222]  // guest 0x2b139a, sampled 0
6eaead7a0c:    	mov	w26, #0x139a            // =5018  // guest 0x2b139a, sampled 0
6eaead7a10:    	movk	w26, #0x2b, lsl #16  // guest 0x2b139a, sampled 0
6eaead7a14:    	str	w26, [x19, #0x228]  // guest 0x2b139a, sampled 0
6eaead7a18:    	lsl	w26, w21, #4  // guest 0x2b139e, sampled 0
6eaead7a1c:    	add	w26, w26, #0x1a0  // guest 0x2b139e, sampled 1
6eaead7a20:    	sxtw	x26, w26  // guest 0x2b139e, sampled 0
6eaead7a24:    	add	x1, x26, x19  // guest 0x2b139e, sampled 0
6eaead7a28:    	mov	x0, x19  // guest 0x2b139e, sampled 0
6eaead7a2c:    	adrp	x16, 0x6efc8aa000 <trace+0x4ddd3000>  // guest 0x2b139e, sampled 0
6eaead7a30:    	add	x16, x16, #0x5c0  // guest 0x2b139e, sampled 0
6eaead7a34:    	blr	x16  // guest 0x2b139e, sampled 0
6eaead7a38:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b139e, sampled 0
6eaead7a3c:    	and	x16, x16, x23, lsr #7  // guest 0x2b139e, sampled 0
6eaead7a40:    	add	x17, x17, x16  // guest 0x2b139e, sampled 0
6eaead7a44:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2b139e, sampled 0
6eaead7a48:    	and	w30, w23, #0xfffff003  // guest 0x2b139e, sampled 1
6eaead7a4c:    	cmp	w16, w30  // guest 0x2b139e, sampled 0
6eaead7a50:    	b.ne	0x6eaead83b8 <trace+0x10f8>  // guest 0x2b139e, sampled 0
6eaead7a54:    	add	x30, x17, w23, uxtw  // guest 0x2b139e, sampled 0
6eaead7a58:    	stlr	w0, [x30]  // guest 0x2b139e, sampled 0
6eaead7a5c:    	sxtw	x26, w21  // guest 0x2b139e, sampled 0
6eaead7a60:    	add	x26, x26, x19  // guest 0x2b139e, sampled 0
6eaead7a64:    	strb	w27, [x26, #0x190]  // guest 0x2b139e, sampled 0
6eaead7a68:    	add	w21, w21, w27  // guest 0x2b139e, sampled 0
6eaead7a6c:    	and	w21, w21, #0x7  // guest 0x2b139e, sampled 0
6eaead7a70:    	str	w21, [x19, #0x188]  // guest 0x2b139e, sampled 0
6eaead7a74:    	ldr	w26, [x19, #0x74]  // guest 0x2b139e, sampled 0
6eaead7a78:    	strh	w26, [x19, #0x224]  // guest 0x2b139e, sampled 0
6eaead7a7c:    	str	w23, [x19, #0x230]  // guest 0x2b139e, sampled 0
6eaead7a80:    	ldr	w26, [x19, #0x54]  // guest 0x2b139e, sampled 0
6eaead7a84:    	strh	w26, [x19, #0x222]  // guest 0x2b139e, sampled 0
6eaead7a88:    	mov	w26, #0x139e            // =5022  // guest 0x2b139e, sampled 0
6eaead7a8c:    	movk	w26, #0x2b, lsl #16  // guest 0x2b139e, sampled 0
6eaead7a90:    	str	w26, [x19, #0x228]  // guest 0x2b139e, sampled 0
6eaead7a94:    	ldr	w26, [x19, #0x1c]  // guest 0x2b13a0, sampled 0
6eaead7a98:    	sub	w23, w23, w26  // guest 0x2b13a0, sampled 0
6eaead7a9c:    	str	w23, [x19, #0x18]  // guest 0x2b13a0, sampled 0
6eaead7aa0:    	str	w23, [x19, #0x28]  // guest 0x2b13a0, sampled 0
6eaead7aa4:    	str	w26, [x19, #0x2c]  // guest 0x2b13a0, sampled 0
6eaead7aa8:    	sub	w23, w22, #0x8  // guest 0x2b13a2, sampled 0
6eaead7aac:    	mov	w28, w23  // guest 0x2b13a2, sampled 0
6eaead7ab0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b13a2, sampled 0
6eaead7ab4:    	and	x16, x16, x23, lsr #7  // guest 0x2b13a2, sampled 0
6eaead7ab8:    	add	x17, x17, x16  // guest 0x2b13a2, sampled 0
6eaead7abc:    	ldp	x16, x17, [x17]  // guest 0x2b13a2, sampled 0
6eaead7ac0:    	and	w30, w23, #0xfffff003  // guest 0x2b13a2, sampled 0
6eaead7ac4:    	cmp	w16, w30  // guest 0x2b13a2, sampled 0
6eaead7ac8:    	b.ne	0x6eaead83e4 <trace+0x1124>  // guest 0x2b13a2, sampled 0
6eaead7acc:    	add	x30, x17, w23, uxtw  // guest 0x2b13a2, sampled 1
6eaead7ad0:    	ldapr	w2, [x30]  // guest 0x2b13a2, sampled 0
6eaead7ad4:    	add	w23, w21, #0x7  // guest 0x2b13a2, sampled 1
6eaead7ad8:    	and	w23, w23, #0x7  // guest 0x2b13a2, sampled 0
6eaead7adc:    	lsl	w23, w23, #4  // guest 0x2b13a2, sampled 0
6eaead7ae0:    	add	w23, w23, #0x1a0  // guest 0x2b13a2, sampled 0
6eaead7ae4:    	sxtw	x23, w23  // guest 0x2b13a2, sampled 0
6eaead7ae8:    	add	x1, x23, x19  // guest 0x2b13a2, sampled 0
6eaead7aec:    	mov	x0, x19  // guest 0x2b13a2, sampled 0
6eaead7af0:    	adrp	x16, 0x6efc8aa000 <trace+0x4ddd3000>  // guest 0x2b13a2, sampled 0
6eaead7af4:    	add	x16, x16, #0x484  // guest 0x2b13a2, sampled 0
6eaead7af8:    	blr	x16  // guest 0x2b13a2, sampled 0
6eaead7afc:    	sub	w21, w21, #0x1  // guest 0x2b13a2, sampled 0
6eaead7b00:    	and	w21, w21, #0x7  // guest 0x2b13a2, sampled 0
6eaead7b04:    	str	w21, [x19, #0x188]  // guest 0x2b13a2, sampled 0
6eaead7b08:    	sxtw	x23, w21  // guest 0x2b13a2, sampled 0
6eaead7b0c:    	add	x23, x23, x19  // guest 0x2b13a2, sampled 0
6eaead7b10:    	strb	wzr, [x23, #0x190]  // guest 0x2b13a2, sampled 0
6eaead7b14:    	ldr	w23, [x19, #0x74]  // guest 0x2b13a2, sampled 0
6eaead7b18:    	strh	w23, [x19, #0x224]  // guest 0x2b13a2, sampled 0
6eaead7b1c:    	str	w28, [x19, #0x230]  // guest 0x2b13a2, sampled 0
6eaead7b20:    	ldr	w23, [x19, #0x54]  // guest 0x2b13a2, sampled 0
6eaead7b24:    	strh	w23, [x19, #0x222]  // guest 0x2b13a2, sampled 0
6eaead7b28:    	mov	w23, #0x13a2            // =5026  // guest 0x2b13a2, sampled 0
6eaead7b2c:    	movk	w23, #0x2b, lsl #16  // guest 0x2b13a2, sampled 0
6eaead7b30:    	str	w23, [x19, #0x228]  // guest 0x2b13a2, sampled 0
6eaead7b34:    	sub	w22, w22, #0x4  // guest 0x2b13a5, sampled 0
6eaead7b38:    	mov	w23, w22  // guest 0x2b13a5, sampled 0
6eaead7b3c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b13a5, sampled 0
6eaead7b40:    	and	x16, x16, x22, lsr #7  // guest 0x2b13a5, sampled 0
6eaead7b44:    	add	x17, x17, x16  // guest 0x2b13a5, sampled 0
6eaead7b48:    	ldp	x16, x17, [x17]  // guest 0x2b13a5, sampled 0
6eaead7b4c:    	and	w30, w22, #0xfffff003  // guest 0x2b13a5, sampled 1
6eaead7b50:    	cmp	w16, w30  // guest 0x2b13a5, sampled 0
6eaead7b54:    	b.ne	0x6eaead8410 <trace+0x1150>  // guest 0x2b13a5, sampled 0
6eaead7b58:    	add	x30, x17, w22, uxtw  // guest 0x2b13a5, sampled 0
6eaead7b5c:    	ldapr	w2, [x30]  // guest 0x2b13a5, sampled 0
6eaead7b60:    	add	w22, w21, #0x7  // guest 0x2b13a5, sampled 0
6eaead7b64:    	and	w22, w22, #0x7  // guest 0x2b13a5, sampled 0
6eaead7b68:    	lsl	w22, w22, #4  // guest 0x2b13a5, sampled 0
6eaead7b6c:    	add	w22, w22, #0x1a0  // guest 0x2b13a5, sampled 0
6eaead7b70:    	sxtw	x22, w22  // guest 0x2b13a5, sampled 0
6eaead7b74:    	add	x1, x22, x19  // guest 0x2b13a5, sampled 0
6eaead7b78:    	mov	x0, x19  // guest 0x2b13a5, sampled 0
6eaead7b7c:    	adrp	x16, 0x6efc8aa000 <trace+0x4ddd3000>  // guest 0x2b13a5, sampled 0
6eaead7b80:    	add	x16, x16, #0x484  // guest 0x2b13a5, sampled 0
6eaead7b84:    	blr	x16  // guest 0x2b13a5, sampled 0
6eaead7b88:    	sub	w21, w21, #0x1  // guest 0x2b13a5, sampled 0
6eaead7b8c:    	and	w21, w21, #0x7  // guest 0x2b13a5, sampled 0
6eaead7b90:    	str	w21, [x19, #0x188]  // guest 0x2b13a5, sampled 0
6eaead7b94:    	sxtw	x22, w21  // guest 0x2b13a5, sampled 0
6eaead7b98:    	add	x22, x22, x19  // guest 0x2b13a5, sampled 0
6eaead7b9c:    	strb	wzr, [x22, #0x190]  // guest 0x2b13a5, sampled 0
6eaead7ba0:    	ldr	w22, [x19, #0x74]  // guest 0x2b13a5, sampled 0
6eaead7ba4:    	strh	w22, [x19, #0x224]  // guest 0x2b13a5, sampled 0
6eaead7ba8:    	str	w23, [x19, #0x230]  // guest 0x2b13a5, sampled 0
6eaead7bac:    	ldr	w22, [x19, #0x54]  // guest 0x2b13a5, sampled 0
6eaead7bb0:    	strh	w22, [x19, #0x222]  // guest 0x2b13a5, sampled 0
6eaead7bb4:    	mov	w22, #0x13a5            // =5029  // guest 0x2b13a5, sampled 0
6eaead7bb8:    	movk	w22, #0x2b, lsl #16  // guest 0x2b13a5, sampled 0
6eaead7bbc:    	str	w22, [x19, #0x228]  // guest 0x2b13a5, sampled 0
6eaead7bc0:    	add	w22, w24, #0x30  // guest 0x2b13a8, sampled 0
6eaead7bc4:    	mov	w23, w22  // guest 0x2b13a8, sampled 0
6eaead7bc8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b13a8, sampled 0
6eaead7bcc:    	and	x16, x16, x22, lsr #7  // guest 0x2b13a8, sampled 0
6eaead7bd0:    	add	x17, x17, x16  // guest 0x2b13a8, sampled 0
6eaead7bd4:    	ldp	x16, x17, [x17]  // guest 0x2b13a8, sampled 0
6eaead7bd8:    	and	w30, w22, #0xfffff003  // guest 0x2b13a8, sampled 0
6eaead7bdc:    	cmp	w16, w30  // guest 0x2b13a8, sampled 0
6eaead7be0:    	b.ne	0x6eaead843c <trace+0x117c>  // guest 0x2b13a8, sampled 0
6eaead7be4:    	add	x30, x17, w22, uxtw  // guest 0x2b13a8, sampled 0
6eaead7be8:    	ldapr	w2, [x30]  // guest 0x2b13a8, sampled 0
6eaead7bec:    	add	w22, w21, #0x7  // guest 0x2b13a8, sampled 0
6eaead7bf0:    	and	w22, w22, #0x7  // guest 0x2b13a8, sampled 0
6eaead7bf4:    	lsl	w22, w22, #4  // guest 0x2b13a8, sampled 0
6eaead7bf8:    	add	w22, w22, #0x1a0  // guest 0x2b13a8, sampled 0
6eaead7bfc:    	sxtw	x22, w22  // guest 0x2b13a8, sampled 0
6eaead7c00:    	add	x1, x22, x19  // guest 0x2b13a8, sampled 0
6eaead7c04:    	mov	x0, x19  // guest 0x2b13a8, sampled 0
6eaead7c08:    	adrp	x16, 0x6efc8aa000 <trace+0x4ddd3000>  // guest 0x2b13a8, sampled 0
6eaead7c0c:    	add	x16, x16, #0x484  // guest 0x2b13a8, sampled 0
6eaead7c10:    	blr	x16  // guest 0x2b13a8, sampled 0
6eaead7c14:    	sub	w21, w21, #0x1  // guest 0x2b13a8, sampled 0
6eaead7c18:    	and	w21, w21, #0x7  // guest 0x2b13a8, sampled 0
6eaead7c1c:    	sxtw	x22, w21  // guest 0x2b13a8, sampled 0
6eaead7c20:    	add	x22, x22, x19  // guest 0x2b13a8, sampled 0
6eaead7c24:    	strb	wzr, [x22, #0x190]  // guest 0x2b13a8, sampled 0
6eaead7c28:    	ldr	w22, [x19, #0x64]  // guest 0x2b13a8, sampled 0
6eaead7c2c:    	strh	w22, [x19, #0x224]  // guest 0x2b13a8, sampled 0
6eaead7c30:    	str	w23, [x19, #0x230]  // guest 0x2b13a8, sampled 0
6eaead7c34:    	ldr	w22, [x19, #0x54]  // guest 0x2b13a8, sampled 0
6eaead7c38:    	strh	w22, [x19, #0x222]  // guest 0x2b13a8, sampled 0
6eaead7c3c:    	mov	w22, #0x13a8            // =5032  // guest 0x2b13a8, sampled 0
6eaead7c40:    	movk	w22, #0x2b, lsl #16  // guest 0x2b13a8, sampled 0
6eaead7c44:    	str	w22, [x19, #0x228]  // guest 0x2b13a8, sampled 0
6eaead7c48:    	add	x22, x19, #0x258  // guest 0x2b13ac, sampled 0
6eaead7c4c:    	add	w23, w21, w27  // guest 0x2b13ac, sampled 0
6eaead7c50:    	and	w23, w23, #0x7  // guest 0x2b13ac, sampled 0
6eaead7c54:    	lsl	w23, w23, #4  // guest 0x2b13ac, sampled 0
6eaead7c58:    	add	w23, w23, #0x1a0  // guest 0x2b13ac, sampled 0
6eaead7c5c:    	sxtw	x23, w23  // guest 0x2b13ac, sampled 0
6eaead7c60:    	add	x23, x23, x19  // guest 0x2b13ac, sampled 0
6eaead7c64:    	ldr	x28, [x23]  // guest 0x2b13ac, sampled 0
6eaead7c68:    	ldrh	w23, [x23, #0x8]  // guest 0x2b13ac, sampled 0
6eaead7c6c:    	str	x28, [x22]  // guest 0x2b13ac, sampled 0
6eaead7c70:    	strh	w23, [x22, #0x8]  // guest 0x2b13ac, sampled 0
6eaead7c74:    	lsl	w22, w21, #4  // guest 0x2b13ac, sampled 0
6eaead7c78:    	add	w22, w22, #0x1a0  // guest 0x2b13ac, sampled 0
6eaead7c7c:    	sxtw	x22, w22  // guest 0x2b13ac, sampled 0
6eaead7c80:    	add	x1, x22, x19  // guest 0x2b13ac, sampled 0
6eaead7c84:    	add	x2, x19, #0x258  // guest 0x2b13ac, sampled 0
6eaead7c88:    	mov	x0, x19  // guest 0x2b13ac, sampled 0
6eaead7c8c:    	adrp	x16, 0x6efc8ab000 <trace+0x4ddd4000>  // guest 0x2b13ac, sampled 0
6eaead7c90:    	add	x16, x16, #0xb4c  // guest 0x2b13ac, sampled 0
6eaead7c94:    	blr	x16  // guest 0x2b13ac, sampled 0
6eaead7c98:    	ldr	w22, [x19, #0x54]  // guest 0x2b13ac, sampled 0
6eaead7c9c:    	strh	w22, [x19, #0x222]  // guest 0x2b13ac, sampled 0
6eaead7ca0:    	mov	w22, #0x13ac            // =5036  // guest 0x2b13ac, sampled 0
6eaead7ca4:    	movk	w22, #0x2b, lsl #16  // guest 0x2b13ac, sampled 0
6eaead7ca8:    	str	w22, [x19, #0x228]  // guest 0x2b13ac, sampled 0
6eaead7cac:    	sub	w21, w21, #0x1  // guest 0x2b13ae, sampled 0
6eaead7cb0:    	and	w21, w21, #0x7  // guest 0x2b13ae, sampled 0
6eaead7cb4:    	str	w21, [x19, #0x188]  // guest 0x2b13ae, sampled 0
6eaead7cb8:    	sxtw	x22, w21  // guest 0x2b13ae, sampled 0
6eaead7cbc:    	add	x22, x22, x19  // guest 0x2b13ae, sampled 0
6eaead7cc0:    	strb	wzr, [x22, #0x190]  // guest 0x2b13ae, sampled 0
6eaead7cc4:    	lsl	w22, w21, #4  // guest 0x2b13ae, sampled 0
6eaead7cc8:    	add	w22, w22, #0x1a0  // guest 0x2b13ae, sampled 0
6eaead7ccc:    	sxtw	x22, w22  // guest 0x2b13ae, sampled 0
6eaead7cd0:    	add	x22, x22, x19  // guest 0x2b13ae, sampled 0
6eaead7cd4:    	add	w23, w21, #0x3  // guest 0x2b13ae, sampled 0
6eaead7cd8:    	and	w23, w23, #0x7  // guest 0x2b13ae, sampled 0
6eaead7cdc:    	lsl	w23, w23, #4  // guest 0x2b13ae, sampled 0
6eaead7ce0:    	add	w23, w23, #0x1a0  // guest 0x2b13ae, sampled 0
6eaead7ce4:    	sxtw	x23, w23  // guest 0x2b13ae, sampled 0
6eaead7ce8:    	add	x23, x23, x19  // guest 0x2b13ae, sampled 0
6eaead7cec:    	ldr	x28, [x23]  // guest 0x2b13ae, sampled 0
6eaead7cf0:    	ldrh	w23, [x23, #0x8]  // guest 0x2b13ae, sampled 0
6eaead7cf4:    	str	x28, [x22]  // guest 0x2b13ae, sampled 0
6eaead7cf8:    	strh	w23, [x22, #0x8]  // guest 0x2b13ae, sampled 0
6eaead7cfc:    	ldr	w22, [x19, #0x54]  // guest 0x2b13ae, sampled 0
6eaead7d00:    	strh	w22, [x19, #0x222]  // guest 0x2b13ae, sampled 0
6eaead7d04:    	mov	w22, #0x13ae            // =5038  // guest 0x2b13ae, sampled 0
6eaead7d08:    	movk	w22, #0x2b, lsl #16  // guest 0x2b13ae, sampled 0
6eaead7d0c:    	str	w22, [x19, #0x228]  // guest 0x2b13ae, sampled 0
6eaead7d10:    	add	w22, w24, #0x10  // guest 0x2b13b0, sampled 1
6eaead7d14:    	mov	w23, w22  // guest 0x2b13b0, sampled 0
6eaead7d18:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b13b0, sampled 0
6eaead7d1c:    	and	x16, x16, x22, lsr #7  // guest 0x2b13b0, sampled 0
6eaead7d20:    	add	x17, x17, x16  // guest 0x2b13b0, sampled 0
6eaead7d24:    	ldp	x16, x17, [x17]  // guest 0x2b13b0, sampled 0
6eaead7d28:    	and	w30, w22, #0xfffff003  // guest 0x2b13b0, sampled 0
6eaead7d2c:    	cmp	w16, w30  // guest 0x2b13b0, sampled 0
6eaead7d30:    	b.ne	0x6eaead8468 <trace+0x11a8>  // guest 0x2b13b0, sampled 0
6eaead7d34:    	add	x30, x17, w22, uxtw  // guest 0x2b13b0, sampled 0
6eaead7d38:    	ldapr	w2, [x30]  // guest 0x2b13b0, sampled 0
6eaead7d3c:    	add	x1, x19, #0x258  // guest 0x2b13b0, sampled 0
6eaead7d40:    	mov	x0, x19  // guest 0x2b13b0, sampled 0
6eaead7d44:    	adrp	x16, 0x6efc8aa000 <trace+0x4ddd3000>  // guest 0x2b13b0, sampled 0
6eaead7d48:    	add	x16, x16, #0x484  // guest 0x2b13b0, sampled 0
6eaead7d4c:    	blr	x16  // guest 0x2b13b0, sampled 0
6eaead7d50:    	lsl	w22, w21, #4  // guest 0x2b13b0, sampled 0
6eaead7d54:    	add	w22, w22, #0x1a0  // guest 0x2b13b0, sampled 0
6eaead7d58:    	sxtw	x22, w22  // guest 0x2b13b0, sampled 0
6eaead7d5c:    	add	x1, x22, x19  // guest 0x2b13b0, sampled 0
6eaead7d60:    	add	x2, x19, #0x258  // guest 0x2b13b0, sampled 0
6eaead7d64:    	mov	x0, x19  // guest 0x2b13b0, sampled 0
6eaead7d68:    	adrp	x16, 0x6efc8ab000 <trace+0x4ddd4000>  // guest 0x2b13b0, sampled 0
6eaead7d6c:    	add	x16, x16, #0xb4c  // guest 0x2b13b0, sampled 0
6eaead7d70:    	blr	x16  // guest 0x2b13b0, sampled 0
6eaead7d74:    	ldr	w22, [x19, #0x64]  // guest 0x2b13b0, sampled 0
6eaead7d78:    	strh	w22, [x19, #0x224]  // guest 0x2b13b0, sampled 0
6eaead7d7c:    	str	w23, [x19, #0x230]  // guest 0x2b13b0, sampled 0
6eaead7d80:    	ldr	w22, [x19, #0x54]  // guest 0x2b13b0, sampled 0
6eaead7d84:    	strh	w22, [x19, #0x222]  // guest 0x2b13b0, sampled 0
6eaead7d88:    	mov	w22, #0x13b0            // =5040  // guest 0x2b13b0, sampled 0
6eaead7d8c:    	movk	w22, #0x2b, lsl #16  // guest 0x2b13b0, sampled 0
6eaead7d90:    	str	w22, [x19, #0x228]  // guest 0x2b13b0, sampled 0
6eaead7d94:    	add	w22, w21, w27  // guest 0x2b13b4, sampled 0
6eaead7d98:    	and	w22, w22, #0x7  // guest 0x2b13b4, sampled 0
6eaead7d9c:    	lsl	w22, w22, #4  // guest 0x2b13b4, sampled 0
6eaead7da0:    	add	w22, w22, #0x1a0  // guest 0x2b13b4, sampled 0
6eaead7da4:    	sxtw	x22, w22  // guest 0x2b13b4, sampled 0
6eaead7da8:    	add	x1, x22, x19  // guest 0x2b13b4, sampled 0
6eaead7dac:    	lsl	w22, w21, #4  // guest 0x2b13b4, sampled 0
6eaead7db0:    	add	w22, w22, #0x1a0  // guest 0x2b13b4, sampled 0
6eaead7db4:    	sxtw	x22, w22  // guest 0x2b13b4, sampled 0
6eaead7db8:    	add	x2, x22, x19  // guest 0x2b13b4, sampled 0
6eaead7dbc:    	mov	x0, x19  // guest 0x2b13b4, sampled 0
6eaead7dc0:    	adrp	x16, 0x6efc8ab000 <trace+0x4ddd4000>  // guest 0x2b13b4, sampled 0
6eaead7dc4:    	add	x16, x16, #0xa78  // guest 0x2b13b4, sampled 0
6eaead7dc8:    	blr	x16  // guest 0x2b13b4, sampled 0
6eaead7dcc:    	sxtw	x22, w21  // guest 0x2b13b4, sampled 0
6eaead7dd0:    	add	x22, x22, x19  // guest 0x2b13b4, sampled 0
6eaead7dd4:    	strb	w27, [x22, #0x190]  // guest 0x2b13b4, sampled 0
6eaead7dd8:    	add	w21, w21, w27  // guest 0x2b13b4, sampled 0
6eaead7ddc:    	and	w21, w21, #0x7  // guest 0x2b13b4, sampled 0
6eaead7de0:    	str	w21, [x19, #0x188]  // guest 0x2b13b4, sampled 0
6eaead7de4:    	ldr	w22, [x19, #0x54]  // guest 0x2b13b4, sampled 0
6eaead7de8:    	strh	w22, [x19, #0x222]  // guest 0x2b13b4, sampled 0
6eaead7dec:    	mov	w22, #0x13b4            // =5044  // guest 0x2b13b4, sampled 0
6eaead7df0:    	movk	w22, #0x2b, lsl #16  // guest 0x2b13b4, sampled 0
6eaead7df4:    	str	w22, [x19, #0x228]  // guest 0x2b13b4, sampled 0
6eaead7df8:    	add	w22, w20, w25  // guest 0x2b13b6, sampled 0
6eaead7dfc:    	mov	w23, w22  // guest 0x2b13b6, sampled 0
6eaead7e00:    	lsl	w24, w21, #4  // guest 0x2b13b6, sampled 0
6eaead7e04:    	add	w24, w24, #0x1a0  // guest 0x2b13b6, sampled 0
6eaead7e08:    	sxtw	x24, w24  // guest 0x2b13b6, sampled 0
6eaead7e0c:    	add	x1, x24, x19  // guest 0x2b13b6, sampled 0
6eaead7e10:    	mov	x0, x19  // guest 0x2b13b6, sampled 0
6eaead7e14:    	adrp	x16, 0x6efc8aa000 <trace+0x4ddd3000>  // guest 0x2b13b6, sampled 0
6eaead7e18:    	add	x16, x16, #0x5c0  // guest 0x2b13b6, sampled 0
6eaead7e1c:    	blr	x16  // guest 0x2b13b6, sampled 0
6eaead7e20:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b13b6, sampled 0
6eaead7e24:    	and	x16, x16, x22, lsr #7  // guest 0x2b13b6, sampled 0
6eaead7e28:    	add	x17, x17, x16  // guest 0x2b13b6, sampled 0
6eaead7e2c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2b13b6, sampled 0
6eaead7e30:    	and	w30, w22, #0xfffff003  // guest 0x2b13b6, sampled 4
6eaead7e34:    	cmp	w16, w30  // guest 0x2b13b6, sampled 0
6eaead7e38:    	b.ne	0x6eaead8494 <trace+0x11d4>  // guest 0x2b13b6, sampled 0
6eaead7e3c:    	add	x30, x17, w22, uxtw  // guest 0x2b13b6, sampled 0
6eaead7e40:    	stlr	w0, [x30]  // guest 0x2b13b6, sampled 0
6eaead7e44:    	sxtw	x22, w21  // guest 0x2b13b6, sampled 1
6eaead7e48:    	add	x22, x22, x19  // guest 0x2b13b6, sampled 0
6eaead7e4c:    	strb	w27, [x22, #0x190]  // guest 0x2b13b6, sampled 0
6eaead7e50:    	add	w21, w21, w27  // guest 0x2b13b6, sampled 0
6eaead7e54:    	and	w21, w21, #0x7  // guest 0x2b13b6, sampled 0
6eaead7e58:    	str	w21, [x19, #0x188]  // guest 0x2b13b6, sampled 0
6eaead7e5c:    	ldr	w21, [x19, #0x74]  // guest 0x2b13b6, sampled 0
6eaead7e60:    	strh	w21, [x19, #0x224]  // guest 0x2b13b6, sampled 0
6eaead7e64:    	str	w23, [x19, #0x230]  // guest 0x2b13b6, sampled 0
6eaead7e68:    	ldr	w21, [x19, #0x54]  // guest 0x2b13b6, sampled 0
6eaead7e6c:    	strh	w21, [x19, #0x222]  // guest 0x2b13b6, sampled 0
6eaead7e70:    	mov	w21, #0x13b6            // =5046  // guest 0x2b13b6, sampled 0
6eaead7e74:    	movk	w21, #0x2b, lsl #16  // guest 0x2b13b6, sampled 0
6eaead7e78:    	str	w21, [x19, #0x228]  // guest 0x2b13b6, sampled 0
6eaead7e7c:    	add	w20, w20, w26  // guest 0x2b13b9, sampled 0
6eaead7e80:    	str	w20, [x19]  // guest 0x2b13b9, sampled 0
6eaead7e84:    	str	w20, [x19, #0x28]  // guest 0x2b13b9, sampled 0
6eaead7e88:    	mov	w1, w27  // guest 0x2b13bb, sampled 0
6eaead7e8c:    	mov	x0, x19  // guest 0x2b13bb, sampled 0
6eaead7e90:    	adrp	x16, 0x6efc8ab000 <trace+0x4ddd4000>  // guest 0x2b13bb, sampled 0
6eaead7e94:    	add	x16, x16, #0x5a0  // guest 0x2b13bb, sampled 0
6eaead7e98:    	blr	x16  // guest 0x2b13bb, sampled 0
6eaead7e9c:    	ldr	w20, [x19, #0x54]  // guest 0x2b13bb, sampled 0
6eaead7ea0:    	strh	w20, [x19, #0x222]  // guest 0x2b13bb, sampled 0
6eaead7ea4:    	mov	w20, #0x13bb            // =5051  // guest 0x2b13bb, sampled 0
6eaead7ea8:    	movk	w20, #0x2b, lsl #16  // guest 0x2b13bb, sampled 0
6eaead7eac:    	str	w20, [x19, #0x228]  // guest 0x2b13bb, sampled 0
6eaead7eb0:    	ldr	w20, [x19, #0x10]  // guest 0x2b13bd, sampled 0
6eaead7eb4:    	add	w20, w20, #0x30  // guest 0x2b13bd, sampled 0
6eaead7eb8:    	mov	w21, w20  // guest 0x2b13bd, sampled 0
6eaead7ebc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b13bd, sampled 0
6eaead7ec0:    	and	x16, x16, x20, lsr #7  // guest 0x2b13bd, sampled 0
6eaead7ec4:    	add	x17, x17, x16  // guest 0x2b13bd, sampled 0
6eaead7ec8:    	ldp	x16, x17, [x17]  // guest 0x2b13bd, sampled 0
6eaead7ecc:    	and	w30, w20, #0xfffff003  // guest 0x2b13bd, sampled 0
6eaead7ed0:    	cmp	w16, w30  // guest 0x2b13bd, sampled 0
6eaead7ed4:    	b.ne	0x6eaead84c0 <trace+0x1200>  // guest 0x2b13bd, sampled 0
6eaead7ed8:    	add	x30, x17, w20, uxtw  // guest 0x2b13bd, sampled 0
6eaead7edc:    	ldapr	w2, [x30]  // guest 0x2b13bd, sampled 0
6eaead7ee0:    	add	x1, x19, #0x258  // guest 0x2b13bd, sampled 1
6eaead7ee4:    	mov	x0, x19  // guest 0x2b13bd, sampled 0
6eaead7ee8:    	adrp	x16, 0x6efc8aa000 <trace+0x4ddd3000>  // guest 0x2b13bd, sampled 0
6eaead7eec:    	add	x16, x16, #0x484  // guest 0x2b13bd, sampled 0
6eaead7ef0:    	blr	x16  // guest 0x2b13bd, sampled 0
6eaead7ef4:    	ldr	w20, [x19, #0x188]  // guest 0x2b13bd, sampled 0
6eaead7ef8:    	lsl	w20, w20, #4  // guest 0x2b13bd, sampled 0
6eaead7efc:    	add	w20, w20, #0x1a0  // guest 0x2b13bd, sampled 0
6eaead7f00:    	sxtw	x20, w20  // guest 0x2b13bd, sampled 0
6eaead7f04:    	add	x1, x20, x19  // guest 0x2b13bd, sampled 0
6eaead7f08:    	add	x2, x19, #0x258  // guest 0x2b13bd, sampled 0
6eaead7f0c:    	mov	x0, x19  // guest 0x2b13bd, sampled 0
6eaead7f10:    	adrp	x16, 0x6efc8ab000 <trace+0x4ddd4000>  // guest 0x2b13bd, sampled 0
6eaead7f14:    	add	x16, x16, #0xb4c  // guest 0x2b13bd, sampled 0
6eaead7f18:    	blr	x16  // guest 0x2b13bd, sampled 0
6eaead7f1c:    	ldr	w20, [x19, #0x64]  // guest 0x2b13bd, sampled 0
6eaead7f20:    	strh	w20, [x19, #0x224]  // guest 0x2b13bd, sampled 0
6eaead7f24:    	str	w21, [x19, #0x230]  // guest 0x2b13bd, sampled 0
6eaead7f28:    	ldr	w20, [x19, #0x54]  // guest 0x2b13bd, sampled 0
6eaead7f2c:    	strh	w20, [x19, #0x222]  // guest 0x2b13bd, sampled 0
6eaead7f30:    	mov	w20, #0x13bd            // =5053  // guest 0x2b13bd, sampled 0
6eaead7f34:    	movk	w20, #0x2b, lsl #16  // guest 0x2b13bd, sampled 0
6eaead7f38:    	str	w20, [x19, #0x228]  // guest 0x2b13bd, sampled 0
6eaead7f3c:    	mov	w1, w27  // guest 0x2b13c1, sampled 0
6eaead7f40:    	mov	x0, x19  // guest 0x2b13c1, sampled 0
6eaead7f44:    	adrp	x16, 0x6efc8ab000 <trace+0x4ddd4000>  // guest 0x2b13c1, sampled 0
6eaead7f48:    	add	x16, x16, #0x5a0  // guest 0x2b13c1, sampled 0
6eaead7f4c:    	blr	x16  // guest 0x2b13c1, sampled 0
6eaead7f50:    	ldr	w20, [x19, #0x54]  // guest 0x2b13c1, sampled 0
6eaead7f54:    	strh	w20, [x19, #0x222]  // guest 0x2b13c1, sampled 0
6eaead7f58:    	mov	w20, #0x13c1            // =5057  // guest 0x2b13c1, sampled 0
6eaead7f5c:    	movk	w20, #0x2b, lsl #16  // guest 0x2b13c1, sampled 0
6eaead7f60:    	str	w20, [x19, #0x228]  // guest 0x2b13c1, sampled 0
6eaead7f64:    	ldr	w20, [x19, #0x10]  // guest 0x2b13c3, sampled 0
6eaead7f68:    	add	w21, w20, #0x10  // guest 0x2b13c3, sampled 0
6eaead7f6c:    	mov	w22, w21  // guest 0x2b13c3, sampled 0
6eaead7f70:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b13c3, sampled 0
6eaead7f74:    	and	x16, x16, x21, lsr #7  // guest 0x2b13c3, sampled 0
6eaead7f78:    	add	x17, x17, x16  // guest 0x2b13c3, sampled 0
6eaead7f7c:    	ldp	x16, x17, [x17]  // guest 0x2b13c3, sampled 0
6eaead7f80:    	and	w30, w21, #0xfffff003  // guest 0x2b13c3, sampled 0
6eaead7f84:    	cmp	w16, w30  // guest 0x2b13c3, sampled 0
6eaead7f88:    	b.ne	0x6eaead84ec <trace+0x122c>  // guest 0x2b13c3, sampled 0
6eaead7f8c:    	add	x30, x17, w21, uxtw  // guest 0x2b13c3, sampled 0
6eaead7f90:    	ldapr	w2, [x30]  // guest 0x2b13c3, sampled 0
6eaead7f94:    	add	x1, x19, #0x258  // guest 0x2b13c3, sampled 0
6eaead7f98:    	mov	x0, x19  // guest 0x2b13c3, sampled 0
6eaead7f9c:    	adrp	x16, 0x6efc8aa000 <trace+0x4ddd3000>  // guest 0x2b13c3, sampled 0
6eaead7fa0:    	add	x16, x16, #0x484  // guest 0x2b13c3, sampled 0
6eaead7fa4:    	blr	x16  // guest 0x2b13c3, sampled 0
6eaead7fa8:    	ldr	w21, [x19, #0x188]  // guest 0x2b13c3, sampled 0
6eaead7fac:    	lsl	w23, w21, #4  // guest 0x2b13c3, sampled 0
6eaead7fb0:    	add	w23, w23, #0x1a0  // guest 0x2b13c3, sampled 0
6eaead7fb4:    	sxtw	x23, w23  // guest 0x2b13c3, sampled 0
6eaead7fb8:    	add	x1, x23, x19  // guest 0x2b13c3, sampled 0
6eaead7fbc:    	add	x2, x19, #0x258  // guest 0x2b13c3, sampled 0
6eaead7fc0:    	mov	x0, x19  // guest 0x2b13c3, sampled 0
6eaead7fc4:    	adrp	x16, 0x6efc8ab000 <trace+0x4ddd4000>  // guest 0x2b13c3, sampled 0
6eaead7fc8:    	add	x16, x16, #0xb4c  // guest 0x2b13c3, sampled 0
6eaead7fcc:    	blr	x16  // guest 0x2b13c3, sampled 0
6eaead7fd0:    	ldr	w23, [x19, #0x64]  // guest 0x2b13c3, sampled 0
6eaead7fd4:    	strh	w23, [x19, #0x224]  // guest 0x2b13c3, sampled 0
6eaead7fd8:    	str	w22, [x19, #0x230]  // guest 0x2b13c3, sampled 0
6eaead7fdc:    	ldr	w22, [x19, #0x54]  // guest 0x2b13c3, sampled 0
6eaead7fe0:    	strh	w22, [x19, #0x222]  // guest 0x2b13c3, sampled 0
6eaead7fe4:    	mov	w22, #0x13c3            // =5059  // guest 0x2b13c3, sampled 0
6eaead7fe8:    	movk	w22, #0x2b, lsl #16  // guest 0x2b13c3, sampled 0
6eaead7fec:    	str	w22, [x19, #0x228]  // guest 0x2b13c3, sampled 0
6eaead7ff0:    	add	w22, w21, w27  // guest 0x2b13c7, sampled 0
6eaead7ff4:    	and	w22, w22, #0x7  // guest 0x2b13c7, sampled 0
6eaead7ff8:    	lsl	w22, w22, #4  // guest 0x2b13c7, sampled 0
6eaead7ffc:    	add	w22, w22, #0x1a0  // guest 0x2b13c7, sampled 0
6eaead8000:    	sxtw	x22, w22  // guest 0x2b13c7, sampled 0
6eaead8004:    	add	x1, x22, x19  // guest 0x2b13c7, sampled 0
6eaead8008:    	lsl	w22, w21, #4  // guest 0x2b13c7, sampled 0
6eaead800c:    	add	w22, w22, #0x1a0  // guest 0x2b13c7, sampled 0
6eaead8010:    	sxtw	x22, w22  // guest 0x2b13c7, sampled 0
6eaead8014:    	add	x2, x22, x19  // guest 0x2b13c7, sampled 0
6eaead8018:    	mov	x0, x19  // guest 0x2b13c7, sampled 0
6eaead801c:    	adrp	x16, 0x6efc8ab000 <trace+0x4ddd3000>  // guest 0x2b13c7, sampled 0
6eaead8020:    	add	x16, x16, #0xc20  // guest 0x2b13c7, sampled 0
6eaead8024:    	blr	x16  // guest 0x2b13c7, sampled 0
6eaead8028:    	sxtw	x22, w21  // guest 0x2b13c7, sampled 0
6eaead802c:    	add	x22, x22, x19  // guest 0x2b13c7, sampled 0
6eaead8030:    	strb	w27, [x22, #0x190]  // guest 0x2b13c7, sampled 0
6eaead8034:    	add	w21, w21, w27  // guest 0x2b13c7, sampled 0
6eaead8038:    	and	w21, w21, #0x7  // guest 0x2b13c7, sampled 0
6eaead803c:    	str	w21, [x19, #0x188]  // guest 0x2b13c7, sampled 0
6eaead8040:    	ldr	w22, [x19, #0x54]  // guest 0x2b13c7, sampled 0
6eaead8044:    	strh	w22, [x19, #0x222]  // guest 0x2b13c7, sampled 0
6eaead8048:    	mov	w22, #0x13c7            // =5063  // guest 0x2b13c7, sampled 0
6eaead804c:    	movk	w22, #0x2b, lsl #16  // guest 0x2b13c7, sampled 1
6eaead8050:    	str	w22, [x19, #0x228]  // guest 0x2b13c7, sampled 0
6eaead8054:    	lsl	w22, w21, #4  // guest 0x2b13c9, sampled 0
6eaead8058:    	add	w22, w22, #0x1a0  // guest 0x2b13c9, sampled 0
6eaead805c:    	sxtw	x22, w22  // guest 0x2b13c9, sampled 0
6eaead8060:    	add	x1, x22, x19  // guest 0x2b13c9, sampled 0
6eaead8064:    	mov	x0, x19  // guest 0x2b13c9, sampled 0
6eaead8068:    	adrp	x16, 0x6efc8aa000 <trace+0x4ddd2000>  // guest 0x2b13c9, sampled 0
6eaead806c:    	add	x16, x16, #0x5c0  // guest 0x2b13c9, sampled 0
6eaead8070:    	blr	x16  // guest 0x2b13c9, sampled 0
6eaead8074:    	ldr	w22, [x19, #0x8]  // guest 0x2b13c9, sampled 0
6eaead8078:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b13c9, sampled 0
6eaead807c:    	and	x16, x16, x22, lsr #7  // guest 0x2b13c9, sampled 0
6eaead8080:    	add	x17, x17, x16  // guest 0x2b13c9, sampled 0
6eaead8084:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2b13c9, sampled 0
6eaead8088:    	and	w30, w22, #0xfffff003  // guest 0x2b13c9, sampled 1
6eaead808c:    	cmp	w16, w30  // guest 0x2b13c9, sampled 0
6eaead8090:    	b.ne	0x6eaead8518 <trace+0x1258>  // guest 0x2b13c9, sampled 0
6eaead8094:    	add	x30, x17, w22, uxtw  // guest 0x2b13c9, sampled 0
6eaead8098:    	stlr	w0, [x30]  // guest 0x2b13c9, sampled 0
6eaead809c:    	sxtw	x23, w21  // guest 0x2b13c9, sampled 0
6eaead80a0:    	add	x23, x23, x19  // guest 0x2b13c9, sampled 0
6eaead80a4:    	strb	w27, [x23, #0x190]  // guest 0x2b13c9, sampled 0
6eaead80a8:    	add	w21, w21, w27  // guest 0x2b13c9, sampled 0
6eaead80ac:    	and	w21, w21, #0x7  // guest 0x2b13c9, sampled 0
6eaead80b0:    	str	w21, [x19, #0x188]  // guest 0x2b13c9, sampled 0
6eaead80b4:    	ldr	w21, [x19, #0x74]  // guest 0x2b13c9, sampled 0
6eaead80b8:    	strh	w21, [x19, #0x224]  // guest 0x2b13c9, sampled 0
6eaead80bc:    	str	w22, [x19, #0x230]  // guest 0x2b13c9, sampled 0
6eaead80c0:    	ldr	w21, [x19, #0x54]  // guest 0x2b13c9, sampled 0
6eaead80c4:    	strh	w21, [x19, #0x222]  // guest 0x2b13c9, sampled 0
6eaead80c8:    	mov	w21, #0x13c9            // =5065  // guest 0x2b13c9, sampled 0
6eaead80cc:    	movk	w21, #0x2b, lsl #16  // guest 0x2b13c9, sampled 0
6eaead80d0:    	str	w21, [x19, #0x228]  // guest 0x2b13c9, sampled 0
6eaead80d4:    	mov	w21, w22  // guest 0x2b13cb, sampled 0
6eaead80d8:    	ldr	w23, [x19, #0x1c]  // guest 0x2b13cb, sampled 0
6eaead80dc:    	sub	w22, w22, w23  // guest 0x2b13cb, sampled 1
6eaead80e0:    	str	w22, [x19, #0x8]  // guest 0x2b13cb, sampled 0
6eaead80e4:    	ldr	w22, [x19, #0x14]  // guest 0x2b13cd, sampled 0
6eaead80e8:    	sub	w22, w22, #0x1  // guest 0x2b13cd, sampled 0
6eaead80ec:    	cmp	w21, w23  // guest 0x2b13cd, sampled 0
6eaead80f0:    	cset	w21, lo  // guest 0x2b13cd, sampled 0
6eaead80f4:    	str	w22, [x19, #0x14]  // guest 0x2b13cd, sampled 0
6eaead80f8:    	mov	w23, w22  // guest 0x2b13cd, sampled 0
6eaead80fc:    	str	w23, [x19, #0x28]  // guest 0x2b13cd, sampled 0
6eaead8100:    	str	w21, [x19, #0x2c]  // guest 0x2b13cd, sampled 0
6eaead8104:    	add	w20, w20, #0x14  // guest 0x2b13ce, sampled 0
6eaead8108:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b13ce, sampled 0
6eaead810c:    	and	x16, x16, x20, lsr #7  // guest 0x2b13ce, sampled 0
6eaead8110:    	add	x17, x17, x16  // guest 0x2b13ce, sampled 0
6eaead8114:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2b13ce, sampled 0
6eaead8118:    	and	w30, w20, #0xfffff003  // guest 0x2b13ce, sampled 0
6eaead811c:    	cmp	w16, w30  // guest 0x2b13ce, sampled 0
6eaead8120:    	b.ne	0x6eaead8544 <trace+0x1284>  // guest 0x2b13ce, sampled 0
6eaead8124:    	add	x30, x17, w20, uxtw  // guest 0x2b13ce, sampled 0
6eaead8128:    	stlr	w22, [x30]  // guest 0x2b13ce, sampled 0
6eaead812c:    	sturb	w27, [x19, #-0xc]  // guest 0x2b13ce, sampled 0
6eaead8130:    	mov	w20, #0x22              // =34  // guest 0x2b13d2, sampled 0
6eaead8134:    	str	w20, [x19, #0x34]  // guest 0x2b13d2, sampled 0
6eaead8138:    	cbnz	w23, 0x6eaead8158 <trace+0xe98>  // guest 0x2b13d2, sampled 0
6eaead813c:    	b	0x6eaead813c <trace+0xe7c>  // guest 0x2b13d2, sampled 0
6eaead8140:    	br	x16  // guest 0x2b13d2, sampled 0
6eaead8144:    	mov	w20, #0x13d4            // =5076  // guest 0x2b13d2, sampled 0
6eaead8148:    	movk	w20, #0x2b, lsl #16  // guest 0x2b13d2, sampled 0
6eaead814c:    	str	w20, [x19, #0x20]  // guest 0x2b13d2, sampled 0
6eaead8150:    	adr	x0, 0x6eaead7201 <trace+0xffffffffffffff41>  // guest 0x2b13d2, sampled 0
6eaead8154:    	b	0x6ea842202c <trace+0xfffffffff994ad6c>  // guest 0x2b13d2, sampled 0
6eaead8158:    	b	0x6eaead8158 <trace+0xe98>  // guest 0x2b13d2, sampled 0
6eaead815c:    	br	x16  // guest 0x2b13d2, sampled 0
6eaead8160:    	mov	w20, #0x1368            // =4968  // guest 0x2b13d2, sampled 0
6eaead8164:    	movk	w20, #0x2b, lsl #16  // guest 0x2b13d2, sampled 0
6eaead8168:    	str	w20, [x19, #0x20]  // guest 0x2b13d2, sampled 0
6eaead816c:    	adr	x0, 0x6eaead7200 <trace+0xffffffffffffff40>  // guest 0x2b13d2, sampled 0
6eaead8170:    	b	0x6ea842202c <trace+0xfffffffff994ad6c>  // guest 0x2b13d2, sampled 0
6eaead8174:    	adr	x0, 0x6eaead7203 <trace+0xffffffffffffff43>  // guest 0x2b13d2, sampled 0
6eaead8178:    	b	0x6ea842202c <trace+0xfffffffff994ad6c>  // guest 0x2b13d2, sampled 0
6eaead817c:    	mov	w1, w20
6eaead8180:    	mov	x0, x19
6eaead8184:    	mov	w2, #0x4045             // =16453
6eaead8188:    	movk	w2, #0x1, lsl #16
6eaead818c:    	adr	x3, 0x6eaead72f4 <trace+0x34>
6eaead8190:    	adrp	x16, 0x6efc87d000 <trace+0x4dda5000>
6eaead8194:    	add	x16, x16, #0x58
6eaead8198:    	blr	x16
6eaead819c:    	mov	w2, w0
6eaead81a0:    	dmb	ishld
6eaead81a4:    	b	0x6eaead72f4 <trace+0x34>
6eaead81a8:    	mov	w1, w22
6eaead81ac:    	mov	x0, x19
6eaead81b0:    	mov	w2, #0x4045             // =16453
6eaead81b4:    	movk	w2, #0x1, lsl #16
6eaead81b8:    	adr	x3, 0x6eaead7380 <trace+0xc0>
6eaead81bc:    	adrp	x16, 0x6efc87d000 <trace+0x4dda5000>
6eaead81c0:    	add	x16, x16, #0x58
6eaead81c4:    	blr	x16
6eaead81c8:    	mov	w22, w0
6eaead81cc:    	dmb	ishld
6eaead81d0:    	b	0x6eaead7380 <trace+0xc0>
6eaead81d4:    	mov	w1, w23
6eaead81d8:    	mov	x0, x19
6eaead81dc:    	mov	w2, #0x4045             // =16453
6eaead81e0:    	movk	w2, #0x1, lsl #16
6eaead81e4:    	adr	x3, 0x6eaead73ac <trace+0xec>
6eaead81e8:    	adrp	x16, 0x6efc87d000 <trace+0x4dda5000>
6eaead81ec:    	add	x16, x16, #0x58
6eaead81f0:    	blr	x16
6eaead81f4:    	mov	w2, w0
6eaead81f8:    	dmb	ishld
6eaead81fc:    	b	0x6eaead73ac <trace+0xec>
6eaead8200:    	mov	w1, w25
6eaead8204:    	mov	w2, w22
6eaead8208:    	mov	x0, x19
6eaead820c:    	mov	w3, #0x4045             // =16453
6eaead8210:    	movk	w3, #0x1, lsl #16
6eaead8214:    	adr	x4, 0x6eaead7438 <trace+0x178>
6eaead8218:    	adrp	x16, 0x6efc87d000 <trace+0x4dda5000>
6eaead821c:    	add	x16, x16, #0xc38
6eaead8220:    	blr	x16
6eaead8224:    	dmb	ishld
6eaead8228:    	b	0x6eaead7438 <trace+0x178>
6eaead822c:    	mov	w1, w22
6eaead8230:    	mov	x0, x19
6eaead8234:    	mov	w2, #0x4045             // =16453
6eaead8238:    	movk	w2, #0x1, lsl #16
6eaead823c:    	adr	x3, 0x6eaead74c4 <trace+0x204>
6eaead8240:    	adrp	x16, 0x6efc87d000 <trace+0x4dda5000>
6eaead8244:    	add	x16, x16, #0x58
6eaead8248:    	blr	x16
6eaead824c:    	mov	w22, w0
6eaead8250:    	dmb	ishld
6eaead8254:    	b	0x6eaead74c4 <trace+0x204>
6eaead8258:    	mov	w1, w25
6eaead825c:    	mov	w2, w0
6eaead8260:    	mov	x0, x19
6eaead8264:    	mov	w3, #0x4045             // =16453
6eaead8268:    	movk	w3, #0x1, lsl #16
6eaead826c:    	adr	x4, 0x6eaead7590 <trace+0x2d0>
6eaead8270:    	adrp	x16, 0x6efc87d000 <trace+0x4dda5000>
6eaead8274:    	add	x16, x16, #0xc38
6eaead8278:    	blr	x16
6eaead827c:    	dmb	ishld
6eaead8280:    	b	0x6eaead7590 <trace+0x2d0>
6eaead8284:    	mov	w1, w26
6eaead8288:    	mov	x0, x19
6eaead828c:    	mov	w2, #0x4045             // =16453
6eaead8290:    	movk	w2, #0x1, lsl #16
6eaead8294:    	adr	x3, 0x6eaead75fc <trace+0x33c>
6eaead8298:    	adrp	x16, 0x6efc87d000 <trace+0x4dda5000>
6eaead829c:    	add	x16, x16, #0x58
6eaead82a0:    	blr	x16
6eaead82a4:    	mov	w2, w0
6eaead82a8:    	dmb	ishld
6eaead82ac:    	b	0x6eaead75fc <trace+0x33c>
6eaead82b0:    	mov	w1, w26
6eaead82b4:    	mov	w2, w0
6eaead82b8:    	mov	x0, x19
6eaead82bc:    	mov	w3, #0x4045             // =16453
6eaead82c0:    	movk	w3, #0x1, lsl #16
6eaead82c4:    	adr	x4, 0x6eaead76a8 <trace+0x3e8>
6eaead82c8:    	adrp	x16, 0x6efc87d000 <trace+0x4dda6000>
6eaead82cc:    	add	x16, x16, #0xc38
6eaead82d0:    	blr	x16
6eaead82d4:    	dmb	ishld
6eaead82d8:    	b	0x6eaead76a8 <trace+0x3e8>
6eaead82dc:    	mov	w1, w26
6eaead82e0:    	mov	x0, x19
6eaead82e4:    	mov	w2, #0x4045             // =16453
6eaead82e8:    	movk	w2, #0x1, lsl #16
6eaead82ec:    	adr	x3, 0x6eaead76f4 <trace+0x434>
6eaead82f0:    	adrp	x16, 0x6efc87d000 <trace+0x4dda6000>
6eaead82f4:    	add	x16, x16, #0x58
6eaead82f8:    	blr	x16
6eaead82fc:    	mov	w2, w0
6eaead8300:    	dmb	ishld
6eaead8304:    	b	0x6eaead76f4 <trace+0x434>
6eaead8308:    	mov	w1, w26
6eaead830c:    	mov	w2, w0
6eaead8310:    	mov	x0, x19
6eaead8314:    	mov	w3, #0x4045             // =16453
6eaead8318:    	movk	w3, #0x1, lsl #16
6eaead831c:    	adr	x4, 0x6eaead7798 <trace+0x4d8>
6eaead8320:    	adrp	x16, 0x6efc87d000 <trace+0x4dda6000>
6eaead8324:    	add	x16, x16, #0xc38
6eaead8328:    	blr	x16
6eaead832c:    	dmb	ishld
6eaead8330:    	b	0x6eaead7798 <trace+0x4d8>
6eaead8334:    	mov	w1, w20
6eaead8338:    	mov	w2, w0
6eaead833c:    	mov	x0, x19
6eaead8340:    	mov	w3, #0x4045             // =16453
6eaead8344:    	movk	w3, #0x1, lsl #16
6eaead8348:    	adr	x4, 0x6eaead7878 <trace+0x5b8>
6eaead834c:    	adrp	x16, 0x6efc87d000 <trace+0x4dda6000>
6eaead8350:    	add	x16, x16, #0xc38
6eaead8354:    	blr	x16
6eaead8358:    	dmb	ishld
6eaead835c:    	b	0x6eaead7878 <trace+0x5b8>
6eaead8360:    	mov	w1, w26
6eaead8364:    	mov	x0, x19
6eaead8368:    	mov	w2, #0x4045             // =16453
6eaead836c:    	movk	w2, #0x1, lsl #16
6eaead8370:    	adr	x3, 0x6eaead7934 <trace+0x674>
6eaead8374:    	adrp	x16, 0x6efc87d000 <trace+0x4dda6000>
6eaead8378:    	add	x16, x16, #0x58
6eaead837c:    	blr	x16
6eaead8380:    	mov	w2, w0
6eaead8384:    	dmb	ishld
6eaead8388:    	b	0x6eaead7934 <trace+0x674>
6eaead838c:    	mov	w1, w26
6eaead8390:    	mov	x0, x19
6eaead8394:    	mov	w2, #0x4045             // =16453
6eaead8398:    	movk	w2, #0x1, lsl #16
6eaead839c:    	adr	x3, 0x6eaead79c0 <trace+0x700>
6eaead83a0:    	adrp	x16, 0x6efc87d000 <trace+0x4dda6000>
6eaead83a4:    	add	x16, x16, #0x58
6eaead83a8:    	blr	x16
6eaead83ac:    	mov	w2, w0
6eaead83b0:    	dmb	ishld
6eaead83b4:    	b	0x6eaead79c0 <trace+0x700>
6eaead83b8:    	mov	w1, w23
6eaead83bc:    	mov	w2, w0
6eaead83c0:    	mov	x0, x19
6eaead83c4:    	mov	w3, #0x4045             // =16453
6eaead83c8:    	movk	w3, #0x1, lsl #16
6eaead83cc:    	adr	x4, 0x6eaead7a5c <trace+0x79c>
6eaead83d0:    	adrp	x16, 0x6efc87d000 <trace+0x4dda6000>
6eaead83d4:    	add	x16, x16, #0xc38
6eaead83d8:    	blr	x16
6eaead83dc:    	dmb	ishld
6eaead83e0:    	b	0x6eaead7a5c <trace+0x79c>
6eaead83e4:    	mov	w1, w23
6eaead83e8:    	mov	x0, x19
6eaead83ec:    	mov	w2, #0x4045             // =16453
6eaead83f0:    	movk	w2, #0x1, lsl #16
6eaead83f4:    	adr	x3, 0x6eaead7ad4 <trace+0x814>
6eaead83f8:    	adrp	x16, 0x6efc87d000 <trace+0x4dda6000>
6eaead83fc:    	add	x16, x16, #0x58
6eaead8400:    	blr	x16
6eaead8404:    	mov	w2, w0
6eaead8408:    	dmb	ishld
6eaead840c:    	b	0x6eaead7ad4 <trace+0x814>
6eaead8410:    	mov	w1, w22
6eaead8414:    	mov	x0, x19
6eaead8418:    	mov	w2, #0x4045             // =16453
6eaead841c:    	movk	w2, #0x1, lsl #16
6eaead8420:    	adr	x3, 0x6eaead7b60 <trace+0x8a0>
6eaead8424:    	adrp	x16, 0x6efc87d000 <trace+0x4dda6000>
6eaead8428:    	add	x16, x16, #0x58
6eaead842c:    	blr	x16
6eaead8430:    	mov	w2, w0
6eaead8434:    	dmb	ishld
6eaead8438:    	b	0x6eaead7b60 <trace+0x8a0>
6eaead843c:    	mov	w1, w22
6eaead8440:    	mov	x0, x19
6eaead8444:    	mov	w2, #0x4045             // =16453
6eaead8448:    	movk	w2, #0x1, lsl #16
6eaead844c:    	adr	x3, 0x6eaead7bec <trace+0x92c>
6eaead8450:    	adrp	x16, 0x6efc87d000 <trace+0x4dda6000>
6eaead8454:    	add	x16, x16, #0x58
6eaead8458:    	blr	x16
6eaead845c:    	mov	w2, w0
6eaead8460:    	dmb	ishld
6eaead8464:    	b	0x6eaead7bec <trace+0x92c>
6eaead8468:    	mov	w1, w22
6eaead846c:    	mov	x0, x19
6eaead8470:    	mov	w2, #0x4045             // =16453
6eaead8474:    	movk	w2, #0x1, lsl #16
6eaead8478:    	adr	x3, 0x6eaead7d3c <trace+0xa7c>
6eaead847c:    	adrp	x16, 0x6efc87d000 <trace+0x4dda6000>
6eaead8480:    	add	x16, x16, #0x58
6eaead8484:    	blr	x16
6eaead8488:    	mov	w2, w0
6eaead848c:    	dmb	ishld
6eaead8490:    	b	0x6eaead7d3c <trace+0xa7c>
6eaead8494:    	mov	w1, w22
6eaead8498:    	mov	w2, w0
6eaead849c:    	mov	x0, x19
6eaead84a0:    	mov	w3, #0x4045             // =16453
6eaead84a4:    	movk	w3, #0x1, lsl #16
6eaead84a8:    	adr	x4, 0x6eaead7e44 <trace+0xb84>
6eaead84ac:    	adrp	x16, 0x6efc87d000 <trace+0x4dda6000>
6eaead84b0:    	add	x16, x16, #0xc38
6eaead84b4:    	blr	x16
6eaead84b8:    	dmb	ishld
6eaead84bc:    	b	0x6eaead7e44 <trace+0xb84>
6eaead84c0:    	mov	w1, w20
6eaead84c4:    	mov	x0, x19
6eaead84c8:    	mov	w2, #0x4045             // =16453
6eaead84cc:    	movk	w2, #0x1, lsl #16
6eaead84d0:    	adr	x3, 0x6eaead7ee0 <trace+0xc20>
6eaead84d4:    	adrp	x16, 0x6efc87d000 <trace+0x4dda6000>
6eaead84d8:    	add	x16, x16, #0x58
6eaead84dc:    	blr	x16
6eaead84e0:    	mov	w2, w0
6eaead84e4:    	dmb	ishld
6eaead84e8:    	b	0x6eaead7ee0 <trace+0xc20>
6eaead84ec:    	mov	w1, w21
6eaead84f0:    	mov	x0, x19
6eaead84f4:    	mov	w2, #0x4045             // =16453
6eaead84f8:    	movk	w2, #0x1, lsl #16
6eaead84fc:    	adr	x3, 0x6eaead7f94 <trace+0xcd4>
6eaead8500:    	adrp	x16, 0x6efc87d000 <trace+0x4dda6000>
6eaead8504:    	add	x16, x16, #0x58
6eaead8508:    	blr	x16
6eaead850c:    	mov	w2, w0
6eaead8510:    	dmb	ishld
6eaead8514:    	b	0x6eaead7f94 <trace+0xcd4>
6eaead8518:    	mov	w1, w22
6eaead851c:    	mov	w2, w0
6eaead8520:    	mov	x0, x19
6eaead8524:    	mov	w3, #0x4045             // =16453
6eaead8528:    	movk	w3, #0x1, lsl #16
6eaead852c:    	adr	x4, 0x6eaead809c <trace+0xddc>
6eaead8530:    	adrp	x16, 0x6efc87d000 <trace+0x4dda6000>
6eaead8534:    	add	x16, x16, #0xc38
6eaead8538:    	blr	x16
6eaead853c:    	dmb	ishld
6eaead8540:    	b	0x6eaead809c <trace+0xddc>
6eaead8544:    	mov	w1, w20
6eaead8548:    	mov	w2, w22
6eaead854c:    	mov	x0, x19
6eaead8550:    	mov	w3, #0x4045             // =16453
6eaead8554:    	movk	w3, #0x1, lsl #16
6eaead8558:    	adr	x4, 0x6eaead812c <trace+0xe6c>
6eaead855c:    	adrp	x16, 0x6efc87d000 <trace+0x4dda6000>
6eaead8560:    	add	x16, x16, #0xc38
6eaead8564:    	blr	x16
6eaead8568:    	dmb	ishld
6eaead856c:    	b	0x6eaead812c <trace+0xe6c>