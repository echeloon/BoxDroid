
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-18d0bf-6c515a53c0.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006c515a53c0 <trace>:
6c515a53c0:    	ldur	w20, [x19, #-0x10]  // guest 0x18d0bf, sampled 0
6c515a53c4:    	tbnz	w20, #0x1f, 0x6c515a63d8 <trace+0x1018>  // guest 0x18d0bf, sampled 0
6c515a53c8:    	sturb	wzr, [x19, #-0xc]  // guest 0x18d0bf, sampled 0
6c515a53cc:    	ldr	w20, [x19, #0x4]  // guest 0x18d0bf, sampled 0
6c515a53d0:    	add	w20, w20, #0x1  // guest 0x18d0bf, sampled 0
6c515a53d4:    	ldr	w3, [x19, #0x34]  // guest 0x18d0bf, sampled 0
6c515a53d8:    	ldr	w2, [x19, #0x30]  // guest 0x18d0bf, sampled 0
6c515a53dc:    	ldr	w1, [x19, #0x2c]  // guest 0x18d0bf, sampled 0
6c515a53e0:    	ldr	w0, [x19, #0x28]  // guest 0x18d0bf, sampled 0
6c515a53e4:    	adrp	x16, 0x6c97750000 <trace+0x461ab000>  // guest 0x18d0bf, sampled 0
6c515a53e8:    	add	x16, x16, #0xcf4  // guest 0x18d0bf, sampled 0
6c515a53ec:    	blr	x16  // guest 0x18d0bf, sampled 0
6c515a53f0:    	str	w20, [x19, #0x4]  // guest 0x18d0bf, sampled 0
6c515a53f4:    	str	w20, [x19, #0x28]  // guest 0x18d0bf, sampled 0
6c515a53f8:    	str	w0, [x19, #0x2c]  // guest 0x18d0bf, sampled 0
6c515a53fc:    	ldr	w21, [x19, #0x14]  // guest 0x18d0c0, sampled 0
6c515a5400:    	ldr	w22, [x19, #0x1c]  // guest 0x18d0c0, sampled 0
6c515a5404:    	add	w21, w21, w22  // guest 0x18d0c0, sampled 0
6c515a5408:    	mov	w23, #0x5245            // =21061  // guest 0x18d0c0, sampled 0
6c515a540c:    	add	w21, w21, w23  // guest 0x18d0c0, sampled 0
6c515a5410:    	str	w21, [x19, #0x14]  // guest 0x18d0c0, sampled 0
6c515a5414:    	lsl	w21, w21, #2  // guest 0x18d0c7, sampled 0
6c515a5418:    	ldr	w24, [x19, #0x18]  // guest 0x18d0c7, sampled 0
6c515a541c:    	add	w21, w21, w24  // guest 0x18d0c7, sampled 0
6c515a5420:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d0c7, sampled 0
6c515a5424:    	and	x16, x16, x21, lsr #7  // guest 0x18d0c7, sampled 0
6c515a5428:    	add	x17, x17, x16  // guest 0x18d0c7, sampled 0
6c515a542c:    	ldp	x16, x17, [x17]  // guest 0x18d0c7, sampled 0
6c515a5430:    	and	w30, w21, #0xfffff003  // guest 0x18d0c7, sampled 0
6c515a5434:    	cmp	w16, w30  // guest 0x18d0c7, sampled 0
6c515a5438:    	b.ne	0x6c515a63e0 <trace+0x1020>  // guest 0x18d0c7, sampled 0
6c515a543c:    	add	x30, x17, w21, uxtw  // guest 0x18d0c7, sampled 0
6c515a5440:    	ldapr	w21, [x30]  // guest 0x18d0c7, sampled 0
6c515a5444:    	str	w21, [x19, #0x14]  // guest 0x18d0c7, sampled 2
6c515a5448:    	lsl	w21, w21, #2  // guest 0x18d0ca, sampled 0
6c515a544c:    	add	w21, w21, w24  // guest 0x18d0ca, sampled 0
6c515a5450:    	mov	w25, #0xc508            // =50440  // guest 0x18d0ca, sampled 0
6c515a5454:    	add	w21, w21, w25  // guest 0x18d0ca, sampled 0
6c515a5458:    	mov	w26, w21  // guest 0x18d0ca, sampled 0
6c515a545c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d0ca, sampled 0
6c515a5460:    	and	x16, x16, x21, lsr #7  // guest 0x18d0ca, sampled 0
6c515a5464:    	add	x17, x17, x16  // guest 0x18d0ca, sampled 1
6c515a5468:    	ldp	x16, x17, [x17]  // guest 0x18d0ca, sampled 0
6c515a546c:    	and	w30, w21, #0xfffff003  // guest 0x18d0ca, sampled 2
6c515a5470:    	cmp	w16, w30  // guest 0x18d0ca, sampled 0
6c515a5474:    	b.ne	0x6c515a640c <trace+0x104c>  // guest 0x18d0ca, sampled 0
6c515a5478:    	add	x30, x17, w21, uxtw  // guest 0x18d0ca, sampled 0
6c515a547c:    	ldapr	w2, [x30]  // guest 0x18d0ca, sampled 0
6c515a5480:    	ldr	w21, [x19, #0x188]  // guest 0x18d0ca, sampled 0
6c515a5484:    	add	w27, w21, #0x7  // guest 0x18d0ca, sampled 0
6c515a5488:    	and	w27, w27, #0x7  // guest 0x18d0ca, sampled 0
6c515a548c:    	lsl	w27, w27, #4  // guest 0x18d0ca, sampled 0
6c515a5490:    	add	w27, w27, #0x1a0  // guest 0x18d0ca, sampled 0
6c515a5494:    	sxtw	x27, w27  // guest 0x18d0ca, sampled 0
6c515a5498:    	add	x1, x27, x19  // guest 0x18d0ca, sampled 0
6c515a549c:    	mov	x0, x19  // guest 0x18d0ca, sampled 0
6c515a54a0:    	adrp	x16, 0x6c97751000 <trace+0x461ac000>  // guest 0x18d0ca, sampled 0
6c515a54a4:    	add	x16, x16, #0x3b4  // guest 0x18d0ca, sampled 0
6c515a54a8:    	blr	x16  // guest 0x18d0ca, sampled 0
6c515a54ac:    	sub	w21, w21, #0x1  // guest 0x18d0ca, sampled 0
6c515a54b0:    	and	w21, w21, #0x7  // guest 0x18d0ca, sampled 0
6c515a54b4:    	str	w21, [x19, #0x188]  // guest 0x18d0ca, sampled 0
6c515a54b8:    	sxtw	x27, w21  // guest 0x18d0ca, sampled 0
6c515a54bc:    	add	x27, x27, x19  // guest 0x18d0ca, sampled 0
6c515a54c0:    	strb	wzr, [x27, #0x190]  // guest 0x18d0ca, sampled 0
6c515a54c4:    	ldr	w27, [x19, #0x74]  // guest 0x18d0ca, sampled 0
6c515a54c8:    	strh	w27, [x19, #0x224]  // guest 0x18d0ca, sampled 0
6c515a54cc:    	str	w26, [x19, #0x230]  // guest 0x18d0ca, sampled 0
6c515a54d0:    	ldr	w26, [x19, #0x54]  // guest 0x18d0ca, sampled 0
6c515a54d4:    	strh	w26, [x19, #0x222]  // guest 0x18d0ca, sampled 0
6c515a54d8:    	mov	w26, #0xd0ca            // =53450  // guest 0x18d0ca, sampled 0
6c515a54dc:    	movk	w26, #0x18, lsl #16  // guest 0x18d0ca, sampled 0
6c515a54e0:    	str	w26, [x19, #0x228]  // guest 0x18d0ca, sampled 0
6c515a54e4:    	ldr	w26, [x19, #0x8]  // guest 0x18d0d1, sampled 0
6c515a54e8:    	lsl	w26, w26, #6  // guest 0x18d0d1, sampled 0
6c515a54ec:    	ldr	w27, [x19]  // guest 0x18d0d4, sampled 0
6c515a54f0:    	add	w26, w26, w27  // guest 0x18d0d4, sampled 0
6c515a54f4:    	str	w26, [x19, #0x8]  // guest 0x18d0d4, sampled 0
6c515a54f8:    	str	w26, [x19, #0x28]  // guest 0x18d0d4, sampled 0
6c515a54fc:    	str	w27, [x19, #0x2c]  // guest 0x18d0d4, sampled 0
6c515a5500:    	lsl	w26, w26, #2  // guest 0x18d0d6, sampled 1
6c515a5504:    	add	w26, w26, w24  // guest 0x18d0d6, sampled 0
6c515a5508:    	mov	w28, #0x4914            // =18708  // guest 0x18d0d6, sampled 0
6c515a550c:    	movk	w28, #0x1, lsl #16  // guest 0x18d0d6, sampled 0
6c515a5510:    	add	w26, w26, w28  // guest 0x18d0d6, sampled 0
6c515a5514:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d0d6, sampled 0
6c515a5518:    	and	x16, x16, x26, lsr #7  // guest 0x18d0d6, sampled 0
6c515a551c:    	add	x17, x17, x16  // guest 0x18d0d6, sampled 0
6c515a5520:    	ldp	x16, x17, [x17]  // guest 0x18d0d6, sampled 0
6c515a5524:    	and	w30, w26, #0xfffff003  // guest 0x18d0d6, sampled 0
6c515a5528:    	cmp	w16, w30  // guest 0x18d0d6, sampled 0
6c515a552c:    	b.ne	0x6c515a6438 <trace+0x1078>  // guest 0x18d0d6, sampled 0
6c515a5530:    	add	x30, x17, w26, uxtw  // guest 0x18d0d6, sampled 0
6c515a5534:    	ldapr	w26, [x30]  // guest 0x18d0d6, sampled 0
6c515a5538:    	str	w26, [x19, #0x8]  // guest 0x18d0d6, sampled 0
6c515a553c:    	ldr	w8, [x19, #0xc]  // guest 0x18d0dd, sampled 0
6c515a5540:    	add	w8, w8, w22  // guest 0x18d0dd, sampled 0
6c515a5544:    	add	w8, w8, w23  // guest 0x18d0dd, sampled 0
6c515a5548:    	str	w8, [x19, #0xc]  // guest 0x18d0dd, sampled 0
6c515a554c:    	lsl	w8, w8, #2  // guest 0x18d0e4, sampled 0
6c515a5550:    	add	w8, w8, w24  // guest 0x18d0e4, sampled 0
6c515a5554:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d0e4, sampled 0
6c515a5558:    	and	x16, x16, x8, lsr #7  // guest 0x18d0e4, sampled 0
6c515a555c:    	add	x17, x17, x16  // guest 0x18d0e4, sampled 0
6c515a5560:    	ldp	x16, x17, [x17]  // guest 0x18d0e4, sampled 0
6c515a5564:    	and	w30, w8, #0xfffff003  // guest 0x18d0e4, sampled 0
6c515a5568:    	cmp	w16, w30  // guest 0x18d0e4, sampled 0
6c515a556c:    	b.ne	0x6c515a6464 <trace+0x10a4>  // guest 0x18d0e4, sampled 0
6c515a5570:    	add	x30, x17, w8, uxtw  // guest 0x18d0e4, sampled 0
6c515a5574:    	ldapr	w8, [x30]  // guest 0x18d0e4, sampled 0
6c515a5578:    	str	w8, [x19, #0xc]  // guest 0x18d0e4, sampled 0
6c515a557c:    	lsl	w8, w8, #2  // guest 0x18d0e7, sampled 0
6c515a5580:    	add	w8, w8, w24  // guest 0x18d0e7, sampled 0
6c515a5584:    	add	w8, w8, w25  // guest 0x18d0e7, sampled 0
6c515a5588:    	mov	w9, w8  // guest 0x18d0e7, sampled 0
6c515a558c:    	str	w9, [sp, #0x80]  // guest 0x18d0e7, sampled 0
6c515a5590:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d0e7, sampled 0
6c515a5594:    	and	x16, x16, x8, lsr #7  // guest 0x18d0e7, sampled 0
6c515a5598:    	add	x17, x17, x16  // guest 0x18d0e7, sampled 0
6c515a559c:    	ldp	x16, x17, [x17]  // guest 0x18d0e7, sampled 0
6c515a55a0:    	and	w30, w8, #0xfffff003  // guest 0x18d0e7, sampled 0
6c515a55a4:    	cmp	w16, w30  // guest 0x18d0e7, sampled 0
6c515a55a8:    	b.ne	0x6c515a6490 <trace+0x10d0>  // guest 0x18d0e7, sampled 0
6c515a55ac:    	add	x30, x17, w8, uxtw  // guest 0x18d0e7, sampled 0
6c515a55b0:    	ldapr	w2, [x30]  // guest 0x18d0e7, sampled 0
6c515a55b4:    	add	x1, x19, #0x258  // guest 0x18d0e7, sampled 0
6c515a55b8:    	mov	x0, x19  // guest 0x18d0e7, sampled 0
6c515a55bc:    	adrp	x16, 0x6c97751000 <trace+0x461ac000>  // guest 0x18d0e7, sampled 0
6c515a55c0:    	add	x16, x16, #0x3b4  // guest 0x18d0e7, sampled 0
6c515a55c4:    	blr	x16  // guest 0x18d0e7, sampled 0
6c515a55c8:    	lsl	w8, w21, #4  // guest 0x18d0e7, sampled 0
6c515a55cc:    	add	w8, w8, #0x1a0  // guest 0x18d0e7, sampled 0
6c515a55d0:    	sxtw	x8, w8  // guest 0x18d0e7, sampled 0
6c515a55d4:    	add	x1, x8, x19  // guest 0x18d0e7, sampled 0
6c515a55d8:    	add	x2, x19, #0x258  // guest 0x18d0e7, sampled 0
6c515a55dc:    	mov	x0, x19  // guest 0x18d0e7, sampled 0
6c515a55e0:    	adrp	x16, 0x6c97752000 <trace+0x461ad000>  // guest 0x18d0e7, sampled 0
6c515a55e4:    	add	x16, x16, #0xb50  // guest 0x18d0e7, sampled 0
6c515a55e8:    	blr	x16  // guest 0x18d0e7, sampled 0
6c515a55ec:    	ldr	w8, [x19, #0x74]  // guest 0x18d0e7, sampled 0
6c515a55f0:    	strh	w8, [x19, #0x224]  // guest 0x18d0e7, sampled 0
6c515a55f4:    	ldr	w8, [sp, #0x80]  // guest 0x18d0e7, sampled 0
6c515a55f8:    	str	w8, [x19, #0x230]  // guest 0x18d0e7, sampled 0
6c515a55fc:    	ldr	w8, [x19, #0x54]  // guest 0x18d0e7, sampled 0
6c515a5600:    	strh	w8, [x19, #0x222]  // guest 0x18d0e7, sampled 0
6c515a5604:    	mov	w8, #0xd0e7             // =53479  // guest 0x18d0e7, sampled 0
6c515a5608:    	movk	w8, #0x18, lsl #16  // guest 0x18d0e7, sampled 0
6c515a560c:    	str	w8, [x19, #0x228]  // guest 0x18d0e7, sampled 0
6c515a5610:    	lsl	w20, w20, #6  // guest 0x18d0ee, sampled 0
6c515a5614:    	add	w20, w20, w27  // guest 0x18d0f1, sampled 0
6c515a5618:    	str	w20, [x19, #0x4]  // guest 0x18d0f1, sampled 0
6c515a561c:    	str	w20, [x19, #0x28]  // guest 0x18d0f1, sampled 0
6c515a5620:    	str	w27, [x19, #0x2c]  // guest 0x18d0f1, sampled 0
6c515a5624:    	lsl	w20, w20, #2  // guest 0x18d0f3, sampled 0
6c515a5628:    	add	w20, w20, w24  // guest 0x18d0f3, sampled 1
6c515a562c:    	add	w20, w20, w28  // guest 0x18d0f3, sampled 0
6c515a5630:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d0f3, sampled 0
6c515a5634:    	and	x16, x16, x20, lsr #7  // guest 0x18d0f3, sampled 0
6c515a5638:    	add	x17, x17, x16  // guest 0x18d0f3, sampled 0
6c515a563c:    	ldp	x16, x17, [x17]  // guest 0x18d0f3, sampled 0
6c515a5640:    	and	w30, w20, #0xfffff003  // guest 0x18d0f3, sampled 0
6c515a5644:    	cmp	w16, w30  // guest 0x18d0f3, sampled 0
6c515a5648:    	b.ne	0x6c515a64bc <trace+0x10fc>  // guest 0x18d0f3, sampled 0
6c515a564c:    	add	x30, x17, w20, uxtw  // guest 0x18d0f3, sampled 0
6c515a5650:    	ldapr	w20, [x30]  // guest 0x18d0f3, sampled 0
6c515a5654:    	str	w20, [x19, #0x4]  // guest 0x18d0f3, sampled 1
6c515a5658:    	add	x28, x19, #0x258  // guest 0x18d0fa, sampled 0
6c515a565c:    	add	w8, w21, #0x3  // guest 0x18d0fa, sampled 0
6c515a5660:    	and	w8, w8, #0x7  // guest 0x18d0fa, sampled 0
6c515a5664:    	lsl	w8, w8, #4  // guest 0x18d0fa, sampled 0
6c515a5668:    	add	w8, w8, #0x1a0  // guest 0x18d0fa, sampled 0
6c515a566c:    	sxtw	x8, w8  // guest 0x18d0fa, sampled 0
6c515a5670:    	add	x8, x8, x19  // guest 0x18d0fa, sampled 0
6c515a5674:    	ldr	x9, [x8]  // guest 0x18d0fa, sampled 0
6c515a5678:    	ldrh	w8, [x8, #0x8]  // guest 0x18d0fa, sampled 0
6c515a567c:    	str	x9, [x28]  // guest 0x18d0fa, sampled 0
6c515a5680:    	strh	w8, [x28, #0x8]  // guest 0x18d0fa, sampled 0
6c515a5684:    	lsl	w28, w21, #4  // guest 0x18d0fa, sampled 0
6c515a5688:    	add	w28, w28, #0x1a0  // guest 0x18d0fa, sampled 0
6c515a568c:    	sxtw	x28, w28  // guest 0x18d0fa, sampled 0
6c515a5690:    	add	x1, x28, x19  // guest 0x18d0fa, sampled 0
6c515a5694:    	add	x2, x19, #0x258  // guest 0x18d0fa, sampled 0
6c515a5698:    	mov	x0, x19  // guest 0x18d0fa, sampled 0
6c515a569c:    	adrp	x16, 0x6c97752000 <trace+0x461ad000>  // guest 0x18d0fa, sampled 0
6c515a56a0:    	add	x16, x16, #0xa7c  // guest 0x18d0fa, sampled 0
6c515a56a4:    	blr	x16  // guest 0x18d0fa, sampled 0
6c515a56a8:    	ldr	w28, [x19, #0x54]  // guest 0x18d0fa, sampled 0
6c515a56ac:    	strh	w28, [x19, #0x222]  // guest 0x18d0fa, sampled 0
6c515a56b0:    	mov	w28, #0xd0fa            // =53498  // guest 0x18d0fa, sampled 0
6c515a56b4:    	movk	w28, #0x18, lsl #16  // guest 0x18d0fa, sampled 0
6c515a56b8:    	str	w28, [x19, #0x228]  // guest 0x18d0fa, sampled 0
6c515a56bc:    	lsl	w26, w26, #2  // guest 0x18d0fc, sampled 0
6c515a56c0:    	add	w26, w26, w24  // guest 0x18d0fc, sampled 0
6c515a56c4:    	add	w26, w26, w25  // guest 0x18d0fc, sampled 0
6c515a56c8:    	mov	w28, w26  // guest 0x18d0fc, sampled 0
6c515a56cc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d0fc, sampled 0
6c515a56d0:    	and	x16, x16, x26, lsr #7  // guest 0x18d0fc, sampled 0
6c515a56d4:    	add	x17, x17, x16  // guest 0x18d0fc, sampled 0
6c515a56d8:    	ldp	x16, x17, [x17]  // guest 0x18d0fc, sampled 0
6c515a56dc:    	and	w30, w26, #0xfffff003  // guest 0x18d0fc, sampled 1
6c515a56e0:    	cmp	w16, w30  // guest 0x18d0fc, sampled 0
6c515a56e4:    	b.ne	0x6c515a64e8 <trace+0x1128>  // guest 0x18d0fc, sampled 0
6c515a56e8:    	add	x30, x17, w26, uxtw  // guest 0x18d0fc, sampled 0
6c515a56ec:    	ldapr	w2, [x30]  // guest 0x18d0fc, sampled 0
6c515a56f0:    	add	w26, w21, #0x7  // guest 0x18d0fc, sampled 0
6c515a56f4:    	and	w26, w26, #0x7  // guest 0x18d0fc, sampled 0
6c515a56f8:    	lsl	w26, w26, #4  // guest 0x18d0fc, sampled 0
6c515a56fc:    	add	w26, w26, #0x1a0  // guest 0x18d0fc, sampled 0
6c515a5700:    	sxtw	x26, w26  // guest 0x18d0fc, sampled 0
6c515a5704:    	add	x1, x26, x19  // guest 0x18d0fc, sampled 0
6c515a5708:    	mov	x0, x19  // guest 0x18d0fc, sampled 0
6c515a570c:    	adrp	x16, 0x6c97751000 <trace+0x461ac000>  // guest 0x18d0fc, sampled 0
6c515a5710:    	add	x16, x16, #0x3b4  // guest 0x18d0fc, sampled 0
6c515a5714:    	blr	x16  // guest 0x18d0fc, sampled 0
6c515a5718:    	sub	w21, w21, #0x1  // guest 0x18d0fc, sampled 0
6c515a571c:    	and	w21, w21, #0x7  // guest 0x18d0fc, sampled 0
6c515a5720:    	str	w21, [x19, #0x188]  // guest 0x18d0fc, sampled 0
6c515a5724:    	sxtw	x26, w21  // guest 0x18d0fc, sampled 0
6c515a5728:    	add	x26, x26, x19  // guest 0x18d0fc, sampled 0
6c515a572c:    	strb	wzr, [x26, #0x190]  // guest 0x18d0fc, sampled 0
6c515a5730:    	ldr	w26, [x19, #0x74]  // guest 0x18d0fc, sampled 0
6c515a5734:    	strh	w26, [x19, #0x224]  // guest 0x18d0fc, sampled 0
6c515a5738:    	str	w28, [x19, #0x230]  // guest 0x18d0fc, sampled 0
6c515a573c:    	ldr	w26, [x19, #0x54]  // guest 0x18d0fc, sampled 0
6c515a5740:    	strh	w26, [x19, #0x222]  // guest 0x18d0fc, sampled 0
6c515a5744:    	mov	w26, #0xd0fc            // =53500  // guest 0x18d0fc, sampled 0
6c515a5748:    	movk	w26, #0x18, lsl #16  // guest 0x18d0fc, sampled 0
6c515a574c:    	str	w26, [x19, #0x228]  // guest 0x18d0fc, sampled 0
6c515a5750:    	ldr	w26, [x19, #0x10]  // guest 0x18d103, sampled 0
6c515a5754:    	add	w26, w26, #0x20  // guest 0x18d103, sampled 0
6c515a5758:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d103, sampled 0
6c515a575c:    	and	x16, x16, x26, lsr #7  // guest 0x18d103, sampled 0
6c515a5760:    	add	x17, x17, x16  // guest 0x18d103, sampled 0
6c515a5764:    	ldp	x16, x17, [x17]  // guest 0x18d103, sampled 0
6c515a5768:    	and	w30, w26, #0xfffff003  // guest 0x18d103, sampled 0
6c515a576c:    	cmp	w16, w30  // guest 0x18d103, sampled 0
6c515a5770:    	b.ne	0x6c515a6514 <trace+0x1154>  // guest 0x18d103, sampled 0
6c515a5774:    	add	x30, x17, w26, uxtw  // guest 0x18d103, sampled 0
6c515a5778:    	ldapr	w26, [x30]  // guest 0x18d103, sampled 0
6c515a577c:    	str	w26, [x19, #0xc]  // guest 0x18d103, sampled 0
6c515a5780:    	lsl	w20, w20, #2  // guest 0x18d107, sampled 0
6c515a5784:    	add	w20, w20, w24  // guest 0x18d107, sampled 0
6c515a5788:    	add	w20, w20, w25  // guest 0x18d107, sampled 0
6c515a578c:    	mov	w24, w20  // guest 0x18d107, sampled 0
6c515a5790:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d107, sampled 0
6c515a5794:    	and	x16, x16, x20, lsr #7  // guest 0x18d107, sampled 0
6c515a5798:    	add	x17, x17, x16  // guest 0x18d107, sampled 0
6c515a579c:    	ldp	x16, x17, [x17]  // guest 0x18d107, sampled 1
6c515a57a0:    	and	w30, w20, #0xfffff003  // guest 0x18d107, sampled 0
6c515a57a4:    	cmp	w16, w30  // guest 0x18d107, sampled 0
6c515a57a8:    	b.ne	0x6c515a6540 <trace+0x1180>  // guest 0x18d107, sampled 0
6c515a57ac:    	add	x30, x17, w20, uxtw  // guest 0x18d107, sampled 0
6c515a57b0:    	ldapr	w2, [x30]  // guest 0x18d107, sampled 0
6c515a57b4:    	add	x1, x19, #0x258  // guest 0x18d107, sampled 0
6c515a57b8:    	mov	x0, x19  // guest 0x18d107, sampled 0
6c515a57bc:    	adrp	x16, 0x6c97751000 <trace+0x461ac000>  // guest 0x18d107, sampled 0
6c515a57c0:    	add	x16, x16, #0x3b4  // guest 0x18d107, sampled 0
6c515a57c4:    	blr	x16  // guest 0x18d107, sampled 0
6c515a57c8:    	lsl	w20, w21, #4  // guest 0x18d107, sampled 0
6c515a57cc:    	add	w20, w20, #0x1a0  // guest 0x18d107, sampled 0
6c515a57d0:    	sxtw	x20, w20  // guest 0x18d107, sampled 0
6c515a57d4:    	add	x1, x20, x19  // guest 0x18d107, sampled 0
6c515a57d8:    	add	x2, x19, #0x258  // guest 0x18d107, sampled 0
6c515a57dc:    	mov	x0, x19  // guest 0x18d107, sampled 0
6c515a57e0:    	adrp	x16, 0x6c97752000 <trace+0x461ad000>  // guest 0x18d107, sampled 0
6c515a57e4:    	add	x16, x16, #0xb50  // guest 0x18d107, sampled 0
6c515a57e8:    	blr	x16  // guest 0x18d107, sampled 0
6c515a57ec:    	ldr	w20, [x19, #0x74]  // guest 0x18d107, sampled 0
6c515a57f0:    	strh	w20, [x19, #0x224]  // guest 0x18d107, sampled 0
6c515a57f4:    	str	w24, [x19, #0x230]  // guest 0x18d107, sampled 0
6c515a57f8:    	ldr	w20, [x19, #0x54]  // guest 0x18d107, sampled 0
6c515a57fc:    	strh	w20, [x19, #0x222]  // guest 0x18d107, sampled 0
6c515a5800:    	mov	w20, #0xd107            // =53511  // guest 0x18d107, sampled 0
6c515a5804:    	movk	w20, #0x18, lsl #16  // guest 0x18d107, sampled 0
6c515a5808:    	str	w20, [x19, #0x228]  // guest 0x18d107, sampled 0
6c515a580c:    	add	w20, w27, w22  // guest 0x18d10e, sampled 0
6c515a5810:    	lsl	w22, w20, #3  // guest 0x18d111, sampled 0
6c515a5814:    	add	w20, w22, w20  // guest 0x18d111, sampled 0
6c515a5818:    	lsl	w20, w20, #2  // guest 0x18d114, sampled 0
6c515a581c:    	add	w20, w20, w26  // guest 0x18d114, sampled 0
6c515a5820:    	str	w20, [x19, #0x4]  // guest 0x18d114, sampled 0
6c515a5824:    	add	x22, x19, #0x258  // guest 0x18d117, sampled 0
6c515a5828:    	add	w24, w21, #0x5  // guest 0x18d117, sampled 0
6c515a582c:    	and	w24, w24, #0x7  // guest 0x18d117, sampled 0
6c515a5830:    	lsl	w24, w24, #4  // guest 0x18d117, sampled 0
6c515a5834:    	add	w24, w24, #0x1a0  // guest 0x18d117, sampled 0
6c515a5838:    	sxtw	x24, w24  // guest 0x18d117, sampled 0
6c515a583c:    	add	x24, x24, x19  // guest 0x18d117, sampled 0
6c515a5840:    	ldr	x26, [x24]  // guest 0x18d117, sampled 0
6c515a5844:    	ldrh	w24, [x24, #0x8]  // guest 0x18d117, sampled 1
6c515a5848:    	str	x26, [x22]  // guest 0x18d117, sampled 0
6c515a584c:    	strh	w24, [x22, #0x8]  // guest 0x18d117, sampled 0
6c515a5850:    	lsl	w22, w21, #4  // guest 0x18d117, sampled 0
6c515a5854:    	add	w22, w22, #0x1a0  // guest 0x18d117, sampled 0
6c515a5858:    	sxtw	x22, w22  // guest 0x18d117, sampled 0
6c515a585c:    	add	x1, x22, x19  // guest 0x18d117, sampled 0
6c515a5860:    	add	x2, x19, #0x258  // guest 0x18d117, sampled 0
6c515a5864:    	mov	x0, x19  // guest 0x18d117, sampled 0
6c515a5868:    	adrp	x16, 0x6c97752000 <trace+0x461ad000>  // guest 0x18d117, sampled 0
6c515a586c:    	add	x16, x16, #0xa7c  // guest 0x18d117, sampled 0
6c515a5870:    	blr	x16  // guest 0x18d117, sampled 0
6c515a5874:    	ldr	w22, [x19, #0x54]  // guest 0x18d117, sampled 0
6c515a5878:    	strh	w22, [x19, #0x222]  // guest 0x18d117, sampled 0
6c515a587c:    	mov	w22, #0xd117            // =53527  // guest 0x18d117, sampled 0
6c515a5880:    	movk	w22, #0x18, lsl #16  // guest 0x18d117, sampled 0
6c515a5884:    	str	w22, [x19, #0x228]  // guest 0x18d117, sampled 0
6c515a5888:    	add	w20, w20, #0x10  // guest 0x18d119, sampled 0
6c515a588c:    	str	w20, [x19, #0x8]  // guest 0x18d119, sampled 0
6c515a5890:    	sub	w20, w21, #0x1  // guest 0x18d11c, sampled 0
6c515a5894:    	and	w20, w20, #0x7  // guest 0x18d11c, sampled 0
6c515a5898:    	sxtw	x21, w20  // guest 0x18d11c, sampled 0
6c515a589c:    	add	x21, x21, x19  // guest 0x18d11c, sampled 0
6c515a58a0:    	strb	wzr, [x21, #0x190]  // guest 0x18d11c, sampled 0
6c515a58a4:    	lsl	w21, w20, #4  // guest 0x18d11c, sampled 0
6c515a58a8:    	add	w21, w21, #0x1a0  // guest 0x18d11c, sampled 0
6c515a58ac:    	sxtw	x21, w21  // guest 0x18d11c, sampled 0
6c515a58b0:    	add	x21, x21, x19  // guest 0x18d11c, sampled 0
6c515a58b4:    	add	w22, w20, #0x1  // guest 0x18d11c, sampled 0
6c515a58b8:    	and	w22, w22, #0x7  // guest 0x18d11c, sampled 0
6c515a58bc:    	lsl	w22, w22, #4  // guest 0x18d11c, sampled 0
6c515a58c0:    	add	w22, w22, #0x1a0  // guest 0x18d11c, sampled 0
6c515a58c4:    	sxtw	x22, w22  // guest 0x18d11c, sampled 0
6c515a58c8:    	add	x22, x22, x19  // guest 0x18d11c, sampled 0
6c515a58cc:    	ldr	x24, [x22]  // guest 0x18d11c, sampled 0
6c515a58d0:    	ldrh	w22, [x22, #0x8]  // guest 0x18d11c, sampled 1
6c515a58d4:    	str	x24, [x21]  // guest 0x18d11c, sampled 0
6c515a58d8:    	strh	w22, [x21, #0x8]  // guest 0x18d11c, sampled 0
6c515a58dc:    	ldr	w21, [x19, #0x54]  // guest 0x18d11c, sampled 0
6c515a58e0:    	strh	w21, [x19, #0x222]  // guest 0x18d11c, sampled 0
6c515a58e4:    	mov	w21, #0xd11c            // =53532  // guest 0x18d11c, sampled 0
6c515a58e8:    	movk	w21, #0x18, lsl #16  // guest 0x18d11c, sampled 0
6c515a58ec:    	str	w21, [x19, #0x228]  // guest 0x18d11c, sampled 0
6c515a58f0:    	add	x21, x19, #0x258  // guest 0x18d11e, sampled 0
6c515a58f4:    	add	w22, w20, #0x1  // guest 0x18d11e, sampled 0
6c515a58f8:    	and	w22, w22, #0x7  // guest 0x18d11e, sampled 0
6c515a58fc:    	lsl	w22, w22, #4  // guest 0x18d11e, sampled 0
6c515a5900:    	add	w22, w22, #0x1a0  // guest 0x18d11e, sampled 0
6c515a5904:    	sxtw	x22, w22  // guest 0x18d11e, sampled 0
6c515a5908:    	add	x22, x22, x19  // guest 0x18d11e, sampled 0
6c515a590c:    	ldr	x24, [x22]  // guest 0x18d11e, sampled 0
6c515a5910:    	ldrh	w22, [x22, #0x8]  // guest 0x18d11e, sampled 0
6c515a5914:    	str	x24, [x21]  // guest 0x18d11e, sampled 0
6c515a5918:    	strh	w22, [x21, #0x8]  // guest 0x18d11e, sampled 0
6c515a591c:    	lsl	w21, w20, #4  // guest 0x18d11e, sampled 0
6c515a5920:    	add	w21, w21, #0x1a0  // guest 0x18d11e, sampled 0
6c515a5924:    	sxtw	x21, w21  // guest 0x18d11e, sampled 0
6c515a5928:    	add	x1, x21, x19  // guest 0x18d11e, sampled 0
6c515a592c:    	add	x2, x19, #0x258  // guest 0x18d11e, sampled 0
6c515a5930:    	mov	x0, x19  // guest 0x18d11e, sampled 0
6c515a5934:    	adrp	x16, 0x6c97752000 <trace+0x461ad000>  // guest 0x18d11e, sampled 0
6c515a5938:    	add	x16, x16, #0xa7c  // guest 0x18d11e, sampled 0
6c515a593c:    	blr	x16  // guest 0x18d11e, sampled 0
6c515a5940:    	ldr	w21, [x19, #0x54]  // guest 0x18d11e, sampled 0
6c515a5944:    	strh	w21, [x19, #0x222]  // guest 0x18d11e, sampled 1
6c515a5948:    	mov	w21, #0xd11e            // =53534  // guest 0x18d11e, sampled 0
6c515a594c:    	movk	w21, #0x18, lsl #16  // guest 0x18d11e, sampled 0
6c515a5950:    	str	w21, [x19, #0x228]  // guest 0x18d11e, sampled 0
6c515a5954:    	sub	w20, w20, #0x1  // guest 0x18d120, sampled 0
6c515a5958:    	and	w20, w20, #0x7  // guest 0x18d120, sampled 0
6c515a595c:    	sxtw	x21, w20  // guest 0x18d120, sampled 0
6c515a5960:    	add	x21, x21, x19  // guest 0x18d120, sampled 0
6c515a5964:    	strb	wzr, [x21, #0x190]  // guest 0x18d120, sampled 2
6c515a5968:    	lsl	w21, w20, #4  // guest 0x18d120, sampled 0
6c515a596c:    	add	w21, w21, #0x1a0  // guest 0x18d120, sampled 0
6c515a5970:    	sxtw	x21, w21  // guest 0x18d120, sampled 0
6c515a5974:    	add	x21, x21, x19  // guest 0x18d120, sampled 0
6c515a5978:    	add	w22, w20, #0x3  // guest 0x18d120, sampled 0
6c515a597c:    	and	w22, w22, #0x7  // guest 0x18d120, sampled 0
6c515a5980:    	lsl	w22, w22, #4  // guest 0x18d120, sampled 0
6c515a5984:    	add	w22, w22, #0x1a0  // guest 0x18d120, sampled 0
6c515a5988:    	sxtw	x22, w22  // guest 0x18d120, sampled 0
6c515a598c:    	add	x22, x22, x19  // guest 0x18d120, sampled 0
6c515a5990:    	ldr	x24, [x22]  // guest 0x18d120, sampled 0
6c515a5994:    	ldrh	w22, [x22, #0x8]  // guest 0x18d120, sampled 0
6c515a5998:    	str	x24, [x21]  // guest 0x18d120, sampled 0
6c515a599c:    	strh	w22, [x21, #0x8]  // guest 0x18d120, sampled 0
6c515a59a0:    	ldr	w21, [x19, #0x54]  // guest 0x18d120, sampled 0
6c515a59a4:    	strh	w21, [x19, #0x222]  // guest 0x18d120, sampled 0
6c515a59a8:    	mov	w21, #0xd120            // =53536  // guest 0x18d120, sampled 0
6c515a59ac:    	movk	w21, #0x18, lsl #16  // guest 0x18d120, sampled 0
6c515a59b0:    	str	w21, [x19, #0x228]  // guest 0x18d120, sampled 0
6c515a59b4:    	add	x21, x19, #0x258  // guest 0x18d122, sampled 0
6c515a59b8:    	add	w22, w20, #0x3  // guest 0x18d122, sampled 0
6c515a59bc:    	and	w22, w22, #0x7  // guest 0x18d122, sampled 0
6c515a59c0:    	lsl	w22, w22, #4  // guest 0x18d122, sampled 0
6c515a59c4:    	add	w22, w22, #0x1a0  // guest 0x18d122, sampled 0
6c515a59c8:    	sxtw	x22, w22  // guest 0x18d122, sampled 0
6c515a59cc:    	add	x22, x22, x19  // guest 0x18d122, sampled 0
6c515a59d0:    	ldr	x24, [x22]  // guest 0x18d122, sampled 0
6c515a59d4:    	ldrh	w22, [x22, #0x8]  // guest 0x18d122, sampled 0
6c515a59d8:    	str	x24, [x21]  // guest 0x18d122, sampled 0
6c515a59dc:    	strh	w22, [x21, #0x8]  // guest 0x18d122, sampled 0
6c515a59e0:    	lsl	w21, w20, #4  // guest 0x18d122, sampled 0
6c515a59e4:    	add	w21, w21, #0x1a0  // guest 0x18d122, sampled 0
6c515a59e8:    	sxtw	x21, w21  // guest 0x18d122, sampled 0
6c515a59ec:    	add	x1, x21, x19  // guest 0x18d122, sampled 0
6c515a59f0:    	add	x2, x19, #0x258  // guest 0x18d122, sampled 0
6c515a59f4:    	mov	x0, x19  // guest 0x18d122, sampled 0
6c515a59f8:    	adrp	x16, 0x6c97752000 <trace+0x461ad000>  // guest 0x18d122, sampled 0
6c515a59fc:    	add	x16, x16, #0xa7c  // guest 0x18d122, sampled 0
6c515a5a00:    	blr	x16  // guest 0x18d122, sampled 0
6c515a5a04:    	ldr	w21, [x19, #0x54]  // guest 0x18d122, sampled 0
6c515a5a08:    	strh	w21, [x19, #0x222]  // guest 0x18d122, sampled 0
6c515a5a0c:    	mov	w21, #0xd122            // =53538  // guest 0x18d122, sampled 0
6c515a5a10:    	movk	w21, #0x18, lsl #16  // guest 0x18d122, sampled 0
6c515a5a14:    	str	w21, [x19, #0x228]  // guest 0x18d122, sampled 0
6c515a5a18:    	add	w21, w20, #0x1  // guest 0x18d124, sampled 0
6c515a5a1c:    	and	w21, w21, #0x7  // guest 0x18d124, sampled 0
6c515a5a20:    	lsl	w21, w21, #4  // guest 0x18d124, sampled 0
6c515a5a24:    	add	w21, w21, #0x1a0  // guest 0x18d124, sampled 0
6c515a5a28:    	sxtw	x21, w21  // guest 0x18d124, sampled 0
6c515a5a2c:    	add	x1, x21, x19  // guest 0x18d124, sampled 0
6c515a5a30:    	lsl	w21, w20, #4  // guest 0x18d124, sampled 0
6c515a5a34:    	add	w21, w21, #0x1a0  // guest 0x18d124, sampled 0
6c515a5a38:    	sxtw	x21, w21  // guest 0x18d124, sampled 0
6c515a5a3c:    	add	x2, x21, x19  // guest 0x18d124, sampled 0
6c515a5a40:    	mov	x0, x19  // guest 0x18d124, sampled 0
6c515a5a44:    	adrp	x16, 0x6c97752000 <trace+0x461ad000>  // guest 0x18d124, sampled 0
6c515a5a48:    	add	x16, x16, #0x9a8  // guest 0x18d124, sampled 0
6c515a5a4c:    	blr	x16  // guest 0x18d124, sampled 0
6c515a5a50:    	sxtw	x21, w20  // guest 0x18d124, sampled 0
6c515a5a54:    	add	x21, x21, x19  // guest 0x18d124, sampled 0
6c515a5a58:    	mov	w22, #0x1               // =1  // guest 0x18d124, sampled 0
6c515a5a5c:    	strb	w22, [x21, #0x190]  // guest 0x18d124, sampled 0
6c515a5a60:    	add	w20, w20, w22  // guest 0x18d124, sampled 0
6c515a5a64:    	and	w20, w20, #0x7  // guest 0x18d124, sampled 0
6c515a5a68:    	str	w20, [x19, #0x188]  // guest 0x18d124, sampled 0
6c515a5a6c:    	ldr	w21, [x19, #0x54]  // guest 0x18d124, sampled 0
6c515a5a70:    	strh	w21, [x19, #0x222]  // guest 0x18d124, sampled 0
6c515a5a74:    	mov	w21, #0xd124            // =53540  // guest 0x18d124, sampled 0
6c515a5a78:    	movk	w21, #0x18, lsl #16  // guest 0x18d124, sampled 0
6c515a5a7c:    	str	w21, [x19, #0x228]  // guest 0x18d124, sampled 0
6c515a5a80:    	add	x21, x19, #0x258  // guest 0x18d126, sampled 0
6c515a5a84:    	add	w24, w20, #0x3  // guest 0x18d126, sampled 0
6c515a5a88:    	and	w24, w24, #0x7  // guest 0x18d126, sampled 0
6c515a5a8c:    	lsl	w24, w24, #4  // guest 0x18d126, sampled 0
6c515a5a90:    	add	w24, w24, #0x1a0  // guest 0x18d126, sampled 0
6c515a5a94:    	sxtw	x24, w24  // guest 0x18d126, sampled 0
6c515a5a98:    	add	x24, x24, x19  // guest 0x18d126, sampled 0
6c515a5a9c:    	ldr	x26, [x24]  // guest 0x18d126, sampled 0
6c515a5aa0:    	ldrh	w24, [x24, #0x8]  // guest 0x18d126, sampled 1
6c515a5aa4:    	str	x26, [x21]  // guest 0x18d126, sampled 1
6c515a5aa8:    	strh	w24, [x21, #0x8]  // guest 0x18d126, sampled 0
6c515a5aac:    	lsl	w20, w20, #4  // guest 0x18d126, sampled 0
6c515a5ab0:    	add	w20, w20, #0x1a0  // guest 0x18d126, sampled 0
6c515a5ab4:    	sxtw	x20, w20  // guest 0x18d126, sampled 0
6c515a5ab8:    	add	x1, x20, x19  // guest 0x18d126, sampled 0
6c515a5abc:    	add	x2, x19, #0x258  // guest 0x18d126, sampled 0
6c515a5ac0:    	mov	x0, x19  // guest 0x18d126, sampled 0
6c515a5ac4:    	adrp	x16, 0x6c97752000 <trace+0x461ad000>  // guest 0x18d126, sampled 0
6c515a5ac8:    	add	x16, x16, #0x9a8  // guest 0x18d126, sampled 0
6c515a5acc:    	blr	x16  // guest 0x18d126, sampled 0
6c515a5ad0:    	ldr	w20, [x19, #0x54]  // guest 0x18d126, sampled 0
6c515a5ad4:    	strh	w20, [x19, #0x222]  // guest 0x18d126, sampled 0
6c515a5ad8:    	mov	w20, #0xd126            // =53542  // guest 0x18d126, sampled 0
6c515a5adc:    	movk	w20, #0x18, lsl #16  // guest 0x18d126, sampled 0
6c515a5ae0:    	str	w20, [x19, #0x228]  // guest 0x18d126, sampled 0
6c515a5ae4:    	mov	x0, x19  // guest 0x18d128, sampled 0
6c515a5ae8:    	adrp	x16, 0x6c97757000 <trace+0x461b2000>  // guest 0x18d128, sampled 0
6c515a5aec:    	add	x16, x16, #0x418  // guest 0x18d128, sampled 0
6c515a5af0:    	blr	x16  // guest 0x18d128, sampled 0
6c515a5af4:    	ldr	w20, [x19, #0x54]  // guest 0x18d128, sampled 0
6c515a5af8:    	strh	w20, [x19, #0x222]  // guest 0x18d128, sampled 0
6c515a5afc:    	mov	w20, #0xd128            // =53544  // guest 0x18d128, sampled 0
6c515a5b00:    	movk	w20, #0x18, lsl #16  // guest 0x18d128, sampled 0
6c515a5b04:    	str	w20, [x19, #0x228]  // guest 0x18d128, sampled 0
6c515a5b08:    	mov	w20, #0x17cc            // =6092  // guest 0x18d12a, sampled 0
6c515a5b0c:    	movk	w20, #0x3b, lsl #16  // guest 0x18d12a, sampled 0
6c515a5b10:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d12a, sampled 0
6c515a5b14:    	and	x16, x16, x20, lsr #7  // guest 0x18d12a, sampled 0
6c515a5b18:    	add	x17, x17, x16  // guest 0x18d12a, sampled 0
6c515a5b1c:    	ldp	x16, x17, [x17]  // guest 0x18d12a, sampled 0
6c515a5b20:    	and	w30, w20, #0xfffff003  // guest 0x18d12a, sampled 0
6c515a5b24:    	cmp	w16, w30  // guest 0x18d12a, sampled 0
6c515a5b28:    	b.ne	0x6c515a656c <trace+0x11ac>  // guest 0x18d12a, sampled 0
6c515a5b2c:    	add	x30, x17, w20, uxtw  // guest 0x18d12a, sampled 0
6c515a5b30:    	ldapr	w2, [x30]  // guest 0x18d12a, sampled 0
6c515a5b34:    	add	x1, x19, #0x258  // guest 0x18d12a, sampled 1
6c515a5b38:    	mov	x0, x19  // guest 0x18d12a, sampled 0
6c515a5b3c:    	adrp	x16, 0x6c97751000 <trace+0x461ac000>  // guest 0x18d12a, sampled 0
6c515a5b40:    	add	x16, x16, #0x3b4  // guest 0x18d12a, sampled 0
6c515a5b44:    	blr	x16  // guest 0x18d12a, sampled 0
6c515a5b48:    	ldr	w21, [x19, #0x188]  // guest 0x18d12a, sampled 0
6c515a5b4c:    	lsl	w24, w21, #4  // guest 0x18d12a, sampled 0
6c515a5b50:    	add	w24, w24, #0x1a0  // guest 0x18d12a, sampled 0
6c515a5b54:    	sxtw	x24, w24  // guest 0x18d12a, sampled 0
6c515a5b58:    	add	x1, x24, x19  // guest 0x18d12a, sampled 0
6c515a5b5c:    	add	x2, x19, #0x258  // guest 0x18d12a, sampled 0
6c515a5b60:    	mov	x0, x19  // guest 0x18d12a, sampled 0
6c515a5b64:    	adrp	x16, 0x6c97752000 <trace+0x461ad000>  // guest 0x18d12a, sampled 0
6c515a5b68:    	add	x16, x16, #0xdc8  // guest 0x18d12a, sampled 0
6c515a5b6c:    	blr	x16  // guest 0x18d12a, sampled 0
6c515a5b70:    	ldr	w24, [x19, #0x74]  // guest 0x18d12a, sampled 0
6c515a5b74:    	strh	w24, [x19, #0x224]  // guest 0x18d12a, sampled 0
6c515a5b78:    	str	w20, [x19, #0x230]  // guest 0x18d12a, sampled 0
6c515a5b7c:    	ldr	w20, [x19, #0x54]  // guest 0x18d12a, sampled 0
6c515a5b80:    	strh	w20, [x19, #0x222]  // guest 0x18d12a, sampled 0
6c515a5b84:    	mov	w20, #0xd12a            // =53546  // guest 0x18d12a, sampled 0
6c515a5b88:    	movk	w20, #0x18, lsl #16  // guest 0x18d12a, sampled 0
6c515a5b8c:    	str	w20, [x19, #0x228]  // guest 0x18d12a, sampled 0
6c515a5b90:    	ldr	w20, [x19, #0x10]  // guest 0x18d130, sampled 0
6c515a5b94:    	add	w24, w20, #0x18  // guest 0x18d130, sampled 0
6c515a5b98:    	mov	w26, w24  // guest 0x18d130, sampled 0
6c515a5b9c:    	lsl	w27, w21, #4  // guest 0x18d130, sampled 0
6c515a5ba0:    	add	w27, w27, #0x1a0  // guest 0x18d130, sampled 0
6c515a5ba4:    	sxtw	x27, w27  // guest 0x18d130, sampled 0
6c515a5ba8:    	add	x1, x27, x19  // guest 0x18d130, sampled 0
6c515a5bac:    	mov	x0, x19  // guest 0x18d130, sampled 0
6c515a5bb0:    	adrp	x16, 0x6c97751000 <trace+0x461ac000>  // guest 0x18d130, sampled 0
6c515a5bb4:    	add	x16, x16, #0x4f0  // guest 0x18d130, sampled 0
6c515a5bb8:    	blr	x16  // guest 0x18d130, sampled 0
6c515a5bbc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d130, sampled 0
6c515a5bc0:    	and	x16, x16, x24, lsr #7  // guest 0x18d130, sampled 0
6c515a5bc4:    	add	x17, x17, x16  // guest 0x18d130, sampled 0
6c515a5bc8:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18d130, sampled 0
6c515a5bcc:    	and	w30, w24, #0xfffff003  // guest 0x18d130, sampled 0
6c515a5bd0:    	cmp	w16, w30  // guest 0x18d130, sampled 0
6c515a5bd4:    	b.ne	0x6c515a6598 <trace+0x11d8>  // guest 0x18d130, sampled 0
6c515a5bd8:    	add	x30, x17, w24, uxtw  // guest 0x18d130, sampled 0
6c515a5bdc:    	stlr	w0, [x30]  // guest 0x18d130, sampled 0
6c515a5be0:    	ldr	w24, [x19, #0x64]  // guest 0x18d130, sampled 0
6c515a5be4:    	strh	w24, [x19, #0x224]  // guest 0x18d130, sampled 0
6c515a5be8:    	str	w26, [x19, #0x230]  // guest 0x18d130, sampled 0
6c515a5bec:    	ldr	w24, [x19, #0x54]  // guest 0x18d130, sampled 0
6c515a5bf0:    	strh	w24, [x19, #0x222]  // guest 0x18d130, sampled 0
6c515a5bf4:    	mov	w24, #0xd130            // =53552  // guest 0x18d130, sampled 0
6c515a5bf8:    	movk	w24, #0x18, lsl #16  // guest 0x18d130, sampled 0
6c515a5bfc:    	str	w24, [x19, #0x228]  // guest 0x18d130, sampled 0
6c515a5c00:    	add	x24, x19, #0x258  // guest 0x18d134, sampled 0
6c515a5c04:    	add	w26, w21, #0x2  // guest 0x18d134, sampled 0
6c515a5c08:    	and	w26, w26, #0x7  // guest 0x18d134, sampled 0
6c515a5c0c:    	lsl	w26, w26, #4  // guest 0x18d134, sampled 0
6c515a5c10:    	add	w26, w26, #0x1a0  // guest 0x18d134, sampled 0
6c515a5c14:    	sxtw	x26, w26  // guest 0x18d134, sampled 0
6c515a5c18:    	add	x26, x26, x19  // guest 0x18d134, sampled 0
6c515a5c1c:    	ldr	x27, [x26]  // guest 0x18d134, sampled 0
6c515a5c20:    	ldrh	w26, [x26, #0x8]  // guest 0x18d134, sampled 0
6c515a5c24:    	str	x27, [x24]  // guest 0x18d134, sampled 0
6c515a5c28:    	strh	w26, [x24, #0x8]  // guest 0x18d134, sampled 0
6c515a5c2c:    	lsl	w24, w21, #4  // guest 0x18d134, sampled 0
6c515a5c30:    	add	w24, w24, #0x1a0  // guest 0x18d134, sampled 0
6c515a5c34:    	sxtw	x24, w24  // guest 0x18d134, sampled 0
6c515a5c38:    	add	x1, x24, x19  // guest 0x18d134, sampled 0
6c515a5c3c:    	add	x2, x19, #0x258  // guest 0x18d134, sampled 0
6c515a5c40:    	mov	x0, x19  // guest 0x18d134, sampled 0
6c515a5c44:    	adrp	x16, 0x6c97752000 <trace+0x461ad000>  // guest 0x18d134, sampled 0
6c515a5c48:    	add	x16, x16, #0xa7c  // guest 0x18d134, sampled 0
6c515a5c4c:    	blr	x16  // guest 0x18d134, sampled 0
6c515a5c50:    	ldr	w24, [x19, #0x54]  // guest 0x18d134, sampled 0
6c515a5c54:    	strh	w24, [x19, #0x222]  // guest 0x18d134, sampled 0
6c515a5c58:    	mov	w24, #0xd134            // =53556  // guest 0x18d134, sampled 0
6c515a5c5c:    	movk	w24, #0x18, lsl #16  // guest 0x18d134, sampled 0
6c515a5c60:    	str	w24, [x19, #0x228]  // guest 0x18d134, sampled 0
6c515a5c64:    	add	w24, w20, #0x24  // guest 0x18d136, sampled 0
6c515a5c68:    	mov	w26, w24  // guest 0x18d136, sampled 0
6c515a5c6c:    	lsl	w27, w21, #4  // guest 0x18d136, sampled 0
6c515a5c70:    	add	w27, w27, #0x1a0  // guest 0x18d136, sampled 0
6c515a5c74:    	sxtw	x27, w27  // guest 0x18d136, sampled 0
6c515a5c78:    	add	x1, x27, x19  // guest 0x18d136, sampled 0
6c515a5c7c:    	mov	x0, x19  // guest 0x18d136, sampled 0
6c515a5c80:    	adrp	x16, 0x6c97751000 <trace+0x461ac000>  // guest 0x18d136, sampled 0
6c515a5c84:    	add	x16, x16, #0x4f0  // guest 0x18d136, sampled 0
6c515a5c88:    	blr	x16  // guest 0x18d136, sampled 0
6c515a5c8c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d136, sampled 0
6c515a5c90:    	and	x16, x16, x24, lsr #7  // guest 0x18d136, sampled 0
6c515a5c94:    	add	x17, x17, x16  // guest 0x18d136, sampled 0
6c515a5c98:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18d136, sampled 0
6c515a5c9c:    	and	w30, w24, #0xfffff003  // guest 0x18d136, sampled 0
6c515a5ca0:    	cmp	w16, w30  // guest 0x18d136, sampled 0
6c515a5ca4:    	b.ne	0x6c515a65c4 <trace+0x1204>  // guest 0x18d136, sampled 0
6c515a5ca8:    	add	x30, x17, w24, uxtw  // guest 0x18d136, sampled 0
6c515a5cac:    	stlr	w0, [x30]  // guest 0x18d136, sampled 0
6c515a5cb0:    	sxtw	x24, w21  // guest 0x18d136, sampled 1
6c515a5cb4:    	add	x24, x24, x19  // guest 0x18d136, sampled 0
6c515a5cb8:    	strb	w22, [x24, #0x190]  // guest 0x18d136, sampled 0
6c515a5cbc:    	add	w21, w21, w22  // guest 0x18d136, sampled 0
6c515a5cc0:    	and	w21, w21, #0x7  // guest 0x18d136, sampled 0
6c515a5cc4:    	str	w21, [x19, #0x188]  // guest 0x18d136, sampled 0
6c515a5cc8:    	ldr	w24, [x19, #0x64]  // guest 0x18d136, sampled 0
6c515a5ccc:    	strh	w24, [x19, #0x224]  // guest 0x18d136, sampled 0
6c515a5cd0:    	str	w26, [x19, #0x230]  // guest 0x18d136, sampled 0
6c515a5cd4:    	ldr	w24, [x19, #0x54]  // guest 0x18d136, sampled 0
6c515a5cd8:    	strh	w24, [x19, #0x222]  // guest 0x18d136, sampled 0
6c515a5cdc:    	mov	w24, #0xd136            // =53558  // guest 0x18d136, sampled 0
6c515a5ce0:    	movk	w24, #0x18, lsl #16  // guest 0x18d136, sampled 0
6c515a5ce4:    	str	w24, [x19, #0x228]  // guest 0x18d136, sampled 0
6c515a5ce8:    	add	w24, w20, #0x24  // guest 0x18d13a, sampled 0
6c515a5cec:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d13a, sampled 0
6c515a5cf0:    	and	x16, x16, x24, lsr #7  // guest 0x18d13a, sampled 0
6c515a5cf4:    	add	x17, x17, x16  // guest 0x18d13a, sampled 0
6c515a5cf8:    	ldp	x16, x17, [x17]  // guest 0x18d13a, sampled 0
6c515a5cfc:    	and	w30, w24, #0xfffff003  // guest 0x18d13a, sampled 0
6c515a5d00:    	cmp	w16, w30  // guest 0x18d13a, sampled 0
6c515a5d04:    	b.ne	0x6c515a65f0 <trace+0x1230>  // guest 0x18d13a, sampled 0
6c515a5d08:    	add	x30, x17, w24, uxtw  // guest 0x18d13a, sampled 0
6c515a5d0c:    	ldapr	w24, [x30]  // guest 0x18d13a, sampled 0
6c515a5d10:    	str	w24, [x19, #0x14]  // guest 0x18d13a, sampled 2
6c515a5d14:    	add	w26, w20, #0x18  // guest 0x18d13e, sampled 0
6c515a5d18:    	mov	w27, w26  // guest 0x18d13e, sampled 0
6c515a5d1c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d13e, sampled 0
6c515a5d20:    	and	x16, x16, x26, lsr #7  // guest 0x18d13e, sampled 0
6c515a5d24:    	add	x17, x17, x16  // guest 0x18d13e, sampled 0
6c515a5d28:    	ldp	x16, x17, [x17]  // guest 0x18d13e, sampled 0
6c515a5d2c:    	and	w30, w26, #0xfffff003  // guest 0x18d13e, sampled 0
6c515a5d30:    	cmp	w16, w30  // guest 0x18d13e, sampled 0
6c515a5d34:    	b.ne	0x6c515a661c <trace+0x125c>  // guest 0x18d13e, sampled 0
6c515a5d38:    	add	x30, x17, w26, uxtw  // guest 0x18d13e, sampled 0
6c515a5d3c:    	ldapr	w2, [x30]  // guest 0x18d13e, sampled 0
6c515a5d40:    	add	w26, w21, #0x7  // guest 0x18d13e, sampled 0
6c515a5d44:    	and	w26, w26, #0x7  // guest 0x18d13e, sampled 0
6c515a5d48:    	lsl	w26, w26, #4  // guest 0x18d13e, sampled 0
6c515a5d4c:    	add	w26, w26, #0x1a0  // guest 0x18d13e, sampled 0
6c515a5d50:    	sxtw	x26, w26  // guest 0x18d13e, sampled 0
6c515a5d54:    	add	x1, x26, x19  // guest 0x18d13e, sampled 0
6c515a5d58:    	mov	x0, x19  // guest 0x18d13e, sampled 0
6c515a5d5c:    	adrp	x16, 0x6c97751000 <trace+0x461ac000>  // guest 0x18d13e, sampled 0
6c515a5d60:    	add	x16, x16, #0x3b4  // guest 0x18d13e, sampled 0
6c515a5d64:    	blr	x16  // guest 0x18d13e, sampled 0
6c515a5d68:    	sub	w21, w21, #0x1  // guest 0x18d13e, sampled 0
6c515a5d6c:    	and	w21, w21, #0x7  // guest 0x18d13e, sampled 0
6c515a5d70:    	str	w21, [x19, #0x188]  // guest 0x18d13e, sampled 0
6c515a5d74:    	sxtw	x26, w21  // guest 0x18d13e, sampled 0
6c515a5d78:    	add	x26, x26, x19  // guest 0x18d13e, sampled 0
6c515a5d7c:    	strb	wzr, [x26, #0x190]  // guest 0x18d13e, sampled 0
6c515a5d80:    	ldr	w26, [x19, #0x64]  // guest 0x18d13e, sampled 0
6c515a5d84:    	strh	w26, [x19, #0x224]  // guest 0x18d13e, sampled 0
6c515a5d88:    	str	w27, [x19, #0x230]  // guest 0x18d13e, sampled 0
6c515a5d8c:    	ldr	w26, [x19, #0x54]  // guest 0x18d13e, sampled 0
6c515a5d90:    	strh	w26, [x19, #0x222]  // guest 0x18d13e, sampled 0
6c515a5d94:    	mov	w26, #0xd13e            // =53566  // guest 0x18d13e, sampled 0
6c515a5d98:    	movk	w26, #0x18, lsl #16  // guest 0x18d13e, sampled 0
6c515a5d9c:    	str	w26, [x19, #0x228]  // guest 0x18d13e, sampled 0
6c515a5da0:    	ldr	w26, [x19, #0x8]  // guest 0x18d142, sampled 0
6c515a5da4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d142, sampled 0
6c515a5da8:    	and	x16, x16, x26, lsr #7  // guest 0x18d142, sampled 0
6c515a5dac:    	add	x17, x17, x16  // guest 0x18d142, sampled 0
6c515a5db0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18d142, sampled 0
6c515a5db4:    	and	w30, w26, #0xfffff003  // guest 0x18d142, sampled 1
6c515a5db8:    	cmp	w16, w30  // guest 0x18d142, sampled 0
6c515a5dbc:    	b.ne	0x6c515a6648 <trace+0x1288>  // guest 0x18d142, sampled 0
6c515a5dc0:    	add	x30, x17, w26, uxtw  // guest 0x18d142, sampled 0
6c515a5dc4:    	stlr	w24, [x30]  // guest 0x18d142, sampled 0
6c515a5dc8:    	add	x24, x19, #0x258  // guest 0x18d144, sampled 0
6c515a5dcc:    	add	w27, w21, w22  // guest 0x18d144, sampled 0
6c515a5dd0:    	and	w27, w27, #0x7  // guest 0x18d144, sampled 0
6c515a5dd4:    	lsl	w27, w27, #4  // guest 0x18d144, sampled 0
6c515a5dd8:    	add	w27, w27, #0x1a0  // guest 0x18d144, sampled 0
6c515a5ddc:    	sxtw	x27, w27  // guest 0x18d144, sampled 0
6c515a5de0:    	add	x27, x27, x19  // guest 0x18d144, sampled 0
6c515a5de4:    	ldr	x28, [x27]  // guest 0x18d144, sampled 0
6c515a5de8:    	ldrh	w27, [x27, #0x8]  // guest 0x18d144, sampled 0
6c515a5dec:    	str	x28, [x24]  // guest 0x18d144, sampled 0
6c515a5df0:    	strh	w27, [x24, #0x8]  // guest 0x18d144, sampled 0
6c515a5df4:    	lsl	w24, w21, #4  // guest 0x18d144, sampled 0
6c515a5df8:    	add	w24, w24, #0x1a0  // guest 0x18d144, sampled 0
6c515a5dfc:    	sxtw	x24, w24  // guest 0x18d144, sampled 0
6c515a5e00:    	add	x1, x24, x19  // guest 0x18d144, sampled 0
6c515a5e04:    	add	x2, x19, #0x258  // guest 0x18d144, sampled 0
6c515a5e08:    	mov	x0, x19  // guest 0x18d144, sampled 0
6c515a5e0c:    	adrp	x16, 0x6c97752000 <trace+0x461ad000>  // guest 0x18d144, sampled 0
6c515a5e10:    	add	x16, x16, #0xa7c  // guest 0x18d144, sampled 0
6c515a5e14:    	blr	x16  // guest 0x18d144, sampled 0
6c515a5e18:    	ldr	w24, [x19, #0x54]  // guest 0x18d144, sampled 0
6c515a5e1c:    	strh	w24, [x19, #0x222]  // guest 0x18d144, sampled 0
6c515a5e20:    	mov	w24, #0xd144            // =53572  // guest 0x18d144, sampled 0
6c515a5e24:    	movk	w24, #0x18, lsl #16  // guest 0x18d144, sampled 0
6c515a5e28:    	str	w24, [x19, #0x228]  // guest 0x18d144, sampled 0
6c515a5e2c:    	add	w24, w20, #0x28  // guest 0x18d146, sampled 0
6c515a5e30:    	mov	w27, w24  // guest 0x18d146, sampled 0
6c515a5e34:    	lsl	w28, w21, #4  // guest 0x18d146, sampled 0
6c515a5e38:    	add	w28, w28, #0x1a0  // guest 0x18d146, sampled 0
6c515a5e3c:    	sxtw	x28, w28  // guest 0x18d146, sampled 0
6c515a5e40:    	add	x1, x28, x19  // guest 0x18d146, sampled 0
6c515a5e44:    	mov	x0, x19  // guest 0x18d146, sampled 0
6c515a5e48:    	adrp	x16, 0x6c97751000 <trace+0x461ac000>  // guest 0x18d146, sampled 0
6c515a5e4c:    	add	x16, x16, #0x4f0  // guest 0x18d146, sampled 0
6c515a5e50:    	blr	x16  // guest 0x18d146, sampled 0
6c515a5e54:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d146, sampled 1
6c515a5e58:    	and	x16, x16, x24, lsr #7  // guest 0x18d146, sampled 0
6c515a5e5c:    	add	x17, x17, x16  // guest 0x18d146, sampled 0
6c515a5e60:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18d146, sampled 0
6c515a5e64:    	and	w30, w24, #0xfffff003  // guest 0x18d146, sampled 0
6c515a5e68:    	cmp	w16, w30  // guest 0x18d146, sampled 0
6c515a5e6c:    	b.ne	0x6c515a6674 <trace+0x12b4>  // guest 0x18d146, sampled 0
6c515a5e70:    	add	x30, x17, w24, uxtw  // guest 0x18d146, sampled 0
6c515a5e74:    	stlr	w0, [x30]  // guest 0x18d146, sampled 0
6c515a5e78:    	sxtw	x24, w21  // guest 0x18d146, sampled 1
6c515a5e7c:    	add	x24, x24, x19  // guest 0x18d146, sampled 0
6c515a5e80:    	strb	w22, [x24, #0x190]  // guest 0x18d146, sampled 0
6c515a5e84:    	add	w21, w21, w22  // guest 0x18d146, sampled 0
6c515a5e88:    	and	w21, w21, #0x7  // guest 0x18d146, sampled 0
6c515a5e8c:    	str	w21, [x19, #0x188]  // guest 0x18d146, sampled 0
6c515a5e90:    	ldr	w24, [x19, #0x64]  // guest 0x18d146, sampled 0
6c515a5e94:    	strh	w24, [x19, #0x224]  // guest 0x18d146, sampled 0
6c515a5e98:    	str	w27, [x19, #0x230]  // guest 0x18d146, sampled 0
6c515a5e9c:    	ldr	w24, [x19, #0x54]  // guest 0x18d146, sampled 0
6c515a5ea0:    	strh	w24, [x19, #0x222]  // guest 0x18d146, sampled 0
6c515a5ea4:    	mov	w24, #0xd146            // =53574  // guest 0x18d146, sampled 0
6c515a5ea8:    	movk	w24, #0x18, lsl #16  // guest 0x18d146, sampled 0
6c515a5eac:    	str	w24, [x19, #0x228]  // guest 0x18d146, sampled 0
6c515a5eb0:    	add	w24, w20, #0x28  // guest 0x18d14a, sampled 0
6c515a5eb4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d14a, sampled 0
6c515a5eb8:    	and	x16, x16, x24, lsr #7  // guest 0x18d14a, sampled 0
6c515a5ebc:    	add	x17, x17, x16  // guest 0x18d14a, sampled 0
6c515a5ec0:    	ldp	x16, x17, [x17]  // guest 0x18d14a, sampled 0
6c515a5ec4:    	and	w30, w24, #0xfffff003  // guest 0x18d14a, sampled 1
6c515a5ec8:    	cmp	w16, w30  // guest 0x18d14a, sampled 0
6c515a5ecc:    	b.ne	0x6c515a66a0 <trace+0x12e0>  // guest 0x18d14a, sampled 0
6c515a5ed0:    	add	x30, x17, w24, uxtw  // guest 0x18d14a, sampled 0
6c515a5ed4:    	ldapr	w24, [x30]  // guest 0x18d14a, sampled 0
6c515a5ed8:    	str	w24, [x19, #0x14]  // guest 0x18d14a, sampled 2
6c515a5edc:    	add	w27, w26, #0x4  // guest 0x18d14e, sampled 0
6c515a5ee0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d14e, sampled 0
6c515a5ee4:    	and	x16, x16, x27, lsr #7  // guest 0x18d14e, sampled 0
6c515a5ee8:    	add	x17, x17, x16  // guest 0x18d14e, sampled 0
6c515a5eec:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18d14e, sampled 0
6c515a5ef0:    	and	w30, w27, #0xfffff003  // guest 0x18d14e, sampled 1
6c515a5ef4:    	cmp	w16, w30  // guest 0x18d14e, sampled 0
6c515a5ef8:    	b.ne	0x6c515a66cc <trace+0x130c>  // guest 0x18d14e, sampled 0
6c515a5efc:    	add	x30, x17, w27, uxtw  // guest 0x18d14e, sampled 0
6c515a5f00:    	stlr	w24, [x30]  // guest 0x18d14e, sampled 0
6c515a5f04:    	lsl	w24, w21, #4  // guest 0x18d151, sampled 0
6c515a5f08:    	add	w24, w24, #0x1a0  // guest 0x18d151, sampled 0
6c515a5f0c:    	sxtw	x24, w24  // guest 0x18d151, sampled 0
6c515a5f10:    	add	x24, x24, x19  // guest 0x18d151, sampled 0
6c515a5f14:    	lsl	w27, w21, #4  // guest 0x18d151, sampled 0
6c515a5f18:    	add	w27, w27, #0x1a0  // guest 0x18d151, sampled 0
6c515a5f1c:    	sxtw	x27, w27  // guest 0x18d151, sampled 0
6c515a5f20:    	add	x27, x27, x19  // guest 0x18d151, sampled 0
6c515a5f24:    	ldr	x28, [x27]  // guest 0x18d151, sampled 0
6c515a5f28:    	ldrh	w27, [x27, #0x8]  // guest 0x18d151, sampled 0
6c515a5f2c:    	str	x28, [x24]  // guest 0x18d151, sampled 0
6c515a5f30:    	strh	w27, [x24, #0x8]  // guest 0x18d151, sampled 0
6c515a5f34:    	sxtw	x24, w21  // guest 0x18d151, sampled 0
6c515a5f38:    	add	x24, x24, x19  // guest 0x18d151, sampled 0
6c515a5f3c:    	strb	w22, [x24, #0x190]  // guest 0x18d151, sampled 0
6c515a5f40:    	add	w21, w21, w22  // guest 0x18d151, sampled 0
6c515a5f44:    	and	w21, w21, #0x7  // guest 0x18d151, sampled 0
6c515a5f48:    	ldr	w24, [x19, #0x54]  // guest 0x18d151, sampled 0
6c515a5f4c:    	strh	w24, [x19, #0x222]  // guest 0x18d151, sampled 0
6c515a5f50:    	mov	w24, #0xd151            // =53585  // guest 0x18d151, sampled 0
6c515a5f54:    	movk	w24, #0x18, lsl #16  // guest 0x18d151, sampled 0
6c515a5f58:    	str	w24, [x19, #0x228]  // guest 0x18d151, sampled 0
6c515a5f5c:    	lsl	w24, w21, #4  // guest 0x18d153, sampled 0
6c515a5f60:    	add	w24, w24, #0x1a0  // guest 0x18d153, sampled 0
6c515a5f64:    	sxtw	x24, w24  // guest 0x18d153, sampled 0
6c515a5f68:    	add	x24, x24, x19  // guest 0x18d153, sampled 0
6c515a5f6c:    	lsl	w27, w21, #4  // guest 0x18d153, sampled 0
6c515a5f70:    	add	w27, w27, #0x1a0  // guest 0x18d153, sampled 0
6c515a5f74:    	sxtw	x27, w27  // guest 0x18d153, sampled 0
6c515a5f78:    	add	x27, x27, x19  // guest 0x18d153, sampled 0
6c515a5f7c:    	ldr	x28, [x27]  // guest 0x18d153, sampled 0
6c515a5f80:    	ldrh	w27, [x27, #0x8]  // guest 0x18d153, sampled 0
6c515a5f84:    	str	x28, [x24]  // guest 0x18d153, sampled 0
6c515a5f88:    	strh	w27, [x24, #0x8]  // guest 0x18d153, sampled 0
6c515a5f8c:    	sxtw	x24, w21  // guest 0x18d153, sampled 0
6c515a5f90:    	add	x24, x24, x19  // guest 0x18d153, sampled 0
6c515a5f94:    	strb	w22, [x24, #0x190]  // guest 0x18d153, sampled 0
6c515a5f98:    	add	w21, w21, w22  // guest 0x18d153, sampled 0
6c515a5f9c:    	and	w21, w21, #0x7  // guest 0x18d153, sampled 0
6c515a5fa0:    	str	w21, [x19, #0x188]  // guest 0x18d153, sampled 0
6c515a5fa4:    	ldr	w24, [x19, #0x54]  // guest 0x18d153, sampled 0
6c515a5fa8:    	strh	w24, [x19, #0x222]  // guest 0x18d153, sampled 0
6c515a5fac:    	mov	w24, #0xd153            // =53587  // guest 0x18d153, sampled 0
6c515a5fb0:    	movk	w24, #0x18, lsl #16  // guest 0x18d153, sampled 0
6c515a5fb4:    	str	w24, [x19, #0x228]  // guest 0x18d153, sampled 0
6c515a5fb8:    	add	w24, w20, #0x18  // guest 0x18d155, sampled 0
6c515a5fbc:    	mov	w27, w24  // guest 0x18d155, sampled 0
6c515a5fc0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d155, sampled 0
6c515a5fc4:    	and	x16, x16, x24, lsr #7  // guest 0x18d155, sampled 0
6c515a5fc8:    	add	x17, x17, x16  // guest 0x18d155, sampled 0
6c515a5fcc:    	ldp	x16, x17, [x17]  // guest 0x18d155, sampled 0
6c515a5fd0:    	and	w30, w24, #0xfffff003  // guest 0x18d155, sampled 0
6c515a5fd4:    	cmp	w16, w30  // guest 0x18d155, sampled 0
6c515a5fd8:    	b.ne	0x6c515a66f8 <trace+0x1338>  // guest 0x18d155, sampled 0
6c515a5fdc:    	add	x30, x17, w24, uxtw  // guest 0x18d155, sampled 0
6c515a5fe0:    	ldapr	w2, [x30]  // guest 0x18d155, sampled 0
6c515a5fe4:    	add	w24, w21, #0x7  // guest 0x18d155, sampled 0
6c515a5fe8:    	and	w24, w24, #0x7  // guest 0x18d155, sampled 0
6c515a5fec:    	lsl	w24, w24, #4  // guest 0x18d155, sampled 0
6c515a5ff0:    	add	w24, w24, #0x1a0  // guest 0x18d155, sampled 0
6c515a5ff4:    	sxtw	x24, w24  // guest 0x18d155, sampled 0
6c515a5ff8:    	add	x1, x24, x19  // guest 0x18d155, sampled 0
6c515a5ffc:    	mov	x0, x19  // guest 0x18d155, sampled 0
6c515a6000:    	adrp	x16, 0x6c97751000 <trace+0x461ab000>  // guest 0x18d155, sampled 0
6c515a6004:    	add	x16, x16, #0x3b4  // guest 0x18d155, sampled 0
6c515a6008:    	blr	x16  // guest 0x18d155, sampled 0
6c515a600c:    	sub	w21, w21, #0x1  // guest 0x18d155, sampled 0
6c515a6010:    	and	w21, w21, #0x7  // guest 0x18d155, sampled 0
6c515a6014:    	str	w21, [x19, #0x188]  // guest 0x18d155, sampled 0
6c515a6018:    	sxtw	x24, w21  // guest 0x18d155, sampled 0
6c515a601c:    	add	x24, x24, x19  // guest 0x18d155, sampled 0
6c515a6020:    	strb	wzr, [x24, #0x190]  // guest 0x18d155, sampled 0
6c515a6024:    	ldr	w24, [x19, #0x64]  // guest 0x18d155, sampled 0
6c515a6028:    	strh	w24, [x19, #0x224]  // guest 0x18d155, sampled 0
6c515a602c:    	str	w27, [x19, #0x230]  // guest 0x18d155, sampled 0
6c515a6030:    	ldr	w24, [x19, #0x54]  // guest 0x18d155, sampled 0
6c515a6034:    	strh	w24, [x19, #0x222]  // guest 0x18d155, sampled 0
6c515a6038:    	mov	w24, #0xd155            // =53589  // guest 0x18d155, sampled 0
6c515a603c:    	movk	w24, #0x18, lsl #16  // guest 0x18d155, sampled 0
6c515a6040:    	str	w24, [x19, #0x228]  // guest 0x18d155, sampled 0
6c515a6044:    	add	x24, x19, #0x258  // guest 0x18d159, sampled 0
6c515a6048:    	add	w27, w21, #0x2  // guest 0x18d159, sampled 0
6c515a604c:    	and	w27, w27, #0x7  // guest 0x18d159, sampled 0
6c515a6050:    	lsl	w27, w27, #4  // guest 0x18d159, sampled 0
6c515a6054:    	add	w27, w27, #0x1a0  // guest 0x18d159, sampled 0
6c515a6058:    	sxtw	x27, w27  // guest 0x18d159, sampled 0
6c515a605c:    	add	x27, x27, x19  // guest 0x18d159, sampled 0
6c515a6060:    	ldr	x28, [x27]  // guest 0x18d159, sampled 0
6c515a6064:    	ldrh	w27, [x27, #0x8]  // guest 0x18d159, sampled 0
6c515a6068:    	str	x28, [x24]  // guest 0x18d159, sampled 0
6c515a606c:    	strh	w27, [x24, #0x8]  // guest 0x18d159, sampled 0
6c515a6070:    	lsl	w24, w21, #4  // guest 0x18d159, sampled 0
6c515a6074:    	add	w24, w24, #0x1a0  // guest 0x18d159, sampled 0
6c515a6078:    	sxtw	x24, w24  // guest 0x18d159, sampled 0
6c515a607c:    	add	x1, x24, x19  // guest 0x18d159, sampled 0
6c515a6080:    	add	x2, x19, #0x258  // guest 0x18d159, sampled 0
6c515a6084:    	mov	x0, x19  // guest 0x18d159, sampled 0
6c515a6088:    	adrp	x16, 0x6c97752000 <trace+0x461ac000>  // guest 0x18d159, sampled 0
6c515a608c:    	add	x16, x16, #0xa7c  // guest 0x18d159, sampled 0
6c515a6090:    	blr	x16  // guest 0x18d159, sampled 0
6c515a6094:    	ldr	w24, [x19, #0x54]  // guest 0x18d159, sampled 0
6c515a6098:    	strh	w24, [x19, #0x222]  // guest 0x18d159, sampled 0
6c515a609c:    	mov	w24, #0xd159            // =53593  // guest 0x18d159, sampled 0
6c515a60a0:    	movk	w24, #0x18, lsl #16  // guest 0x18d159, sampled 0
6c515a60a4:    	str	w24, [x19, #0x228]  // guest 0x18d159, sampled 0
6c515a60a8:    	add	w24, w20, #0x2c  // guest 0x18d15b, sampled 0
6c515a60ac:    	mov	w27, w24  // guest 0x18d15b, sampled 0
6c515a60b0:    	lsl	w28, w21, #4  // guest 0x18d15b, sampled 0
6c515a60b4:    	add	w28, w28, #0x1a0  // guest 0x18d15b, sampled 0
6c515a60b8:    	sxtw	x28, w28  // guest 0x18d15b, sampled 0
6c515a60bc:    	add	x1, x28, x19  // guest 0x18d15b, sampled 0
6c515a60c0:    	mov	x0, x19  // guest 0x18d15b, sampled 0
6c515a60c4:    	adrp	x16, 0x6c97751000 <trace+0x461ab000>  // guest 0x18d15b, sampled 0
6c515a60c8:    	add	x16, x16, #0x4f0  // guest 0x18d15b, sampled 0
6c515a60cc:    	blr	x16  // guest 0x18d15b, sampled 0
6c515a60d0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d15b, sampled 0
6c515a60d4:    	and	x16, x16, x24, lsr #7  // guest 0x18d15b, sampled 0
6c515a60d8:    	add	x17, x17, x16  // guest 0x18d15b, sampled 0
6c515a60dc:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18d15b, sampled 0
6c515a60e0:    	and	w30, w24, #0xfffff003  // guest 0x18d15b, sampled 0
6c515a60e4:    	cmp	w16, w30  // guest 0x18d15b, sampled 0
6c515a60e8:    	b.ne	0x6c515a6724 <trace+0x1364>  // guest 0x18d15b, sampled 0
6c515a60ec:    	add	x30, x17, w24, uxtw  // guest 0x18d15b, sampled 0
6c515a60f0:    	stlr	w0, [x30]  // guest 0x18d15b, sampled 0
6c515a60f4:    	sxtw	x24, w21  // guest 0x18d15b, sampled 0
6c515a60f8:    	add	x24, x24, x19  // guest 0x18d15b, sampled 0
6c515a60fc:    	strb	w22, [x24, #0x190]  // guest 0x18d15b, sampled 0
6c515a6100:    	add	w21, w21, w22  // guest 0x18d15b, sampled 0
6c515a6104:    	and	w21, w21, #0x7  // guest 0x18d15b, sampled 0
6c515a6108:    	str	w21, [x19, #0x188]  // guest 0x18d15b, sampled 0
6c515a610c:    	ldr	w21, [x19, #0x64]  // guest 0x18d15b, sampled 0
6c515a6110:    	strh	w21, [x19, #0x224]  // guest 0x18d15b, sampled 0
6c515a6114:    	str	w27, [x19, #0x230]  // guest 0x18d15b, sampled 0
6c515a6118:    	ldr	w21, [x19, #0x54]  // guest 0x18d15b, sampled 0
6c515a611c:    	strh	w21, [x19, #0x222]  // guest 0x18d15b, sampled 0
6c515a6120:    	mov	w21, #0xd15b            // =53595  // guest 0x18d15b, sampled 0
6c515a6124:    	movk	w21, #0x18, lsl #16  // guest 0x18d15b, sampled 0
6c515a6128:    	str	w21, [x19, #0x228]  // guest 0x18d15b, sampled 0
6c515a612c:    	add	w21, w20, #0x2c  // guest 0x18d15f, sampled 0
6c515a6130:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d15f, sampled 0
6c515a6134:    	and	x16, x16, x21, lsr #7  // guest 0x18d15f, sampled 0
6c515a6138:    	add	x17, x17, x16  // guest 0x18d15f, sampled 0
6c515a613c:    	ldp	x16, x17, [x17]  // guest 0x18d15f, sampled 0
6c515a6140:    	and	w30, w21, #0xfffff003  // guest 0x18d15f, sampled 0
6c515a6144:    	cmp	w16, w30  // guest 0x18d15f, sampled 0
6c515a6148:    	b.ne	0x6c515a6750 <trace+0x1390>  // guest 0x18d15f, sampled 0
6c515a614c:    	add	x30, x17, w21, uxtw  // guest 0x18d15f, sampled 0
6c515a6150:    	ldapr	w21, [x30]  // guest 0x18d15f, sampled 0
6c515a6154:    	str	w21, [x19, #0x14]  // guest 0x18d15f, sampled 1
6c515a6158:    	add	w24, w26, #0x8  // guest 0x18d163, sampled 0
6c515a615c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d163, sampled 0
6c515a6160:    	and	x16, x16, x24, lsr #7  // guest 0x18d163, sampled 0
6c515a6164:    	add	x17, x17, x16  // guest 0x18d163, sampled 0
6c515a6168:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18d163, sampled 0
6c515a616c:    	and	w30, w24, #0xfffff003  // guest 0x18d163, sampled 0
6c515a6170:    	cmp	w16, w30  // guest 0x18d163, sampled 0
6c515a6174:    	b.ne	0x6c515a677c <trace+0x13bc>  // guest 0x18d163, sampled 0
6c515a6178:    	add	x30, x17, w24, uxtw  // guest 0x18d163, sampled 0
6c515a617c:    	stlr	w21, [x30]  // guest 0x18d163, sampled 0
6c515a6180:    	ldr	w21, [x19]  // guest 0x18d166, sampled 0
6c515a6184:    	ldr	w24, [x19, #0x1c]  // guest 0x18d166, sampled 0
6c515a6188:    	add	w24, w21, w24  // guest 0x18d166, sampled 0
6c515a618c:    	add	w23, w24, w23  // guest 0x18d166, sampled 0
6c515a6190:    	str	w23, [x19, #0x8]  // guest 0x18d166, sampled 0
6c515a6194:    	lsl	w24, w23, #2  // guest 0x18d16d, sampled 0
6c515a6198:    	ldr	w26, [x19, #0x18]  // guest 0x18d16d, sampled 0
6c515a619c:    	add	w24, w24, w26  // guest 0x18d16d, sampled 0
6c515a61a0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d16d, sampled 0
6c515a61a4:    	and	x16, x16, x24, lsr #7  // guest 0x18d16d, sampled 0
6c515a61a8:    	add	x17, x17, x16  // guest 0x18d16d, sampled 0
6c515a61ac:    	ldp	x16, x17, [x17]  // guest 0x18d16d, sampled 0
6c515a61b0:    	and	w30, w24, #0xfffff003  // guest 0x18d16d, sampled 0
6c515a61b4:    	cmp	w16, w30  // guest 0x18d16d, sampled 0
6c515a61b8:    	b.ne	0x6c515a67a8 <trace+0x13e8>  // guest 0x18d16d, sampled 0
6c515a61bc:    	add	x30, x17, w24, uxtw  // guest 0x18d16d, sampled 0
6c515a61c0:    	ldapr	w24, [x30]  // guest 0x18d16d, sampled 0
6c515a61c4:    	str	w24, [x19, #0x14]  // guest 0x18d16d, sampled 1
6c515a61c8:    	lsl	w24, w24, #2  // guest 0x18d170, sampled 0
6c515a61cc:    	add	w24, w24, w26  // guest 0x18d170, sampled 0
6c515a61d0:    	mov	w27, #0x8914            // =35092  // guest 0x18d170, sampled 0
6c515a61d4:    	movk	w27, #0x1, lsl #16  // guest 0x18d170, sampled 0
6c515a61d8:    	add	w24, w24, w27  // guest 0x18d170, sampled 0
6c515a61dc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d170, sampled 0
6c515a61e0:    	and	x16, x16, x24, lsr #7  // guest 0x18d170, sampled 0
6c515a61e4:    	add	x17, x17, x16  // guest 0x18d170, sampled 0
6c515a61e8:    	ldp	x16, x17, [x17]  // guest 0x18d170, sampled 0
6c515a61ec:    	and	w30, w24, #0xfffff003  // guest 0x18d170, sampled 3
6c515a61f0:    	cmp	w16, w30  // guest 0x18d170, sampled 0
6c515a61f4:    	b.ne	0x6c515a67d4 <trace+0x1414>  // guest 0x18d170, sampled 0
6c515a61f8:    	add	x30, x17, w24, uxtw  // guest 0x18d170, sampled 0
6c515a61fc:    	ldapr	w24, [x30]  // guest 0x18d170, sampled 0
6c515a6200:    	str	w24, [x19, #0x14]  // guest 0x18d170, sampled 1
6c515a6204:    	lsl	w23, w23, #2  // guest 0x18d177, sampled 0
6c515a6208:    	add	w23, w23, w26  // guest 0x18d177, sampled 0
6c515a620c:    	str	w23, [x19, #0x8]  // guest 0x18d177, sampled 0
6c515a6210:    	ldr	w27, [x19, #0x4]  // guest 0x18d17a, sampled 0
6c515a6214:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d17a, sampled 0
6c515a6218:    	and	x16, x16, x27, lsr #7  // guest 0x18d17a, sampled 0
6c515a621c:    	add	x17, x17, x16  // guest 0x18d17a, sampled 0
6c515a6220:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18d17a, sampled 1
6c515a6224:    	and	w30, w27, #0xfffff003  // guest 0x18d17a, sampled 0
6c515a6228:    	cmp	w16, w30  // guest 0x18d17a, sampled 0
6c515a622c:    	b.ne	0x6c515a6800 <trace+0x1440>  // guest 0x18d17a, sampled 0
6c515a6230:    	add	x30, x17, w27, uxtw  // guest 0x18d17a, sampled 0
6c515a6234:    	stlr	w24, [x30]  // guest 0x18d17a, sampled 0
6c515a6238:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d17c, sampled 0
6c515a623c:    	and	x16, x16, x23, lsr #7  // guest 0x18d17c, sampled 0
6c515a6240:    	add	x17, x17, x16  // guest 0x18d17c, sampled 0
6c515a6244:    	ldp	x16, x17, [x17]  // guest 0x18d17c, sampled 0
6c515a6248:    	and	w30, w23, #0xfffff003  // guest 0x18d17c, sampled 0
6c515a624c:    	cmp	w16, w30  // guest 0x18d17c, sampled 0
6c515a6250:    	b.ne	0x6c515a682c <trace+0x146c>  // guest 0x18d17c, sampled 0
6c515a6254:    	add	x30, x17, w23, uxtw  // guest 0x18d17c, sampled 0
6c515a6258:    	ldapr	w24, [x30]  // guest 0x18d17c, sampled 0
6c515a625c:    	str	w24, [x19, #0x14]  // guest 0x18d17c, sampled 0
6c515a6260:    	lsl	w24, w24, #2  // guest 0x18d17e, sampled 0
6c515a6264:    	add	w24, w24, w26  // guest 0x18d17e, sampled 0
6c515a6268:    	mov	w28, #0xcb14            // =51988  // guest 0x18d17e, sampled 0
6c515a626c:    	movk	w28, #0x1, lsl #16  // guest 0x18d17e, sampled 0
6c515a6270:    	add	w24, w24, w28  // guest 0x18d17e, sampled 0
6c515a6274:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d17e, sampled 0
6c515a6278:    	and	x16, x16, x24, lsr #7  // guest 0x18d17e, sampled 0
6c515a627c:    	add	x17, x17, x16  // guest 0x18d17e, sampled 0
6c515a6280:    	ldp	x16, x17, [x17]  // guest 0x18d17e, sampled 0
6c515a6284:    	and	w30, w24, #0xfffff003  // guest 0x18d17e, sampled 1
6c515a6288:    	cmp	w16, w30  // guest 0x18d17e, sampled 0
6c515a628c:    	b.ne	0x6c515a6858 <trace+0x1498>  // guest 0x18d17e, sampled 0
6c515a6290:    	add	x30, x17, w24, uxtw  // guest 0x18d17e, sampled 0
6c515a6294:    	ldapr	w24, [x30]  // guest 0x18d17e, sampled 0
6c515a6298:    	str	w24, [x19, #0x14]  // guest 0x18d17e, sampled 0
6c515a629c:    	add	w28, w27, #0x4  // guest 0x18d185, sampled 0
6c515a62a0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d185, sampled 0
6c515a62a4:    	and	x16, x16, x28, lsr #7  // guest 0x18d185, sampled 0
6c515a62a8:    	add	x17, x17, x16  // guest 0x18d185, sampled 0
6c515a62ac:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18d185, sampled 0
6c515a62b0:    	and	w30, w28, #0xfffff003  // guest 0x18d185, sampled 0
6c515a62b4:    	cmp	w16, w30  // guest 0x18d185, sampled 0
6c515a62b8:    	b.ne	0x6c515a6884 <trace+0x14c4>  // guest 0x18d185, sampled 0
6c515a62bc:    	add	x30, x17, w28, uxtw  // guest 0x18d185, sampled 0
6c515a62c0:    	stlr	w24, [x30]  // guest 0x18d185, sampled 0
6c515a62c4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d188, sampled 0
6c515a62c8:    	and	x16, x16, x23, lsr #7  // guest 0x18d188, sampled 0
6c515a62cc:    	add	x17, x17, x16  // guest 0x18d188, sampled 0
6c515a62d0:    	ldp	x16, x17, [x17]  // guest 0x18d188, sampled 0
6c515a62d4:    	and	w30, w23, #0xfffff003  // guest 0x18d188, sampled 0
6c515a62d8:    	cmp	w16, w30  // guest 0x18d188, sampled 0
6c515a62dc:    	b.ne	0x6c515a68b0 <trace+0x14f0>  // guest 0x18d188, sampled 0
6c515a62e0:    	add	x30, x17, w23, uxtw  // guest 0x18d188, sampled 0
6c515a62e4:    	ldapr	w23, [x30]  // guest 0x18d188, sampled 0
6c515a62e8:    	str	w23, [x19, #0x8]  // guest 0x18d188, sampled 0
6c515a62ec:    	lsl	w23, w23, #2  // guest 0x18d18a, sampled 0
6c515a62f0:    	add	w23, w23, w26  // guest 0x18d18a, sampled 0
6c515a62f4:    	add	w23, w23, w25  // guest 0x18d18a, sampled 0
6c515a62f8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d18a, sampled 0
6c515a62fc:    	and	x16, x16, x23, lsr #7  // guest 0x18d18a, sampled 0
6c515a6300:    	add	x17, x17, x16  // guest 0x18d18a, sampled 0
6c515a6304:    	ldp	x16, x17, [x17]  // guest 0x18d18a, sampled 0
6c515a6308:    	and	w30, w23, #0xfffff003  // guest 0x18d18a, sampled 0
6c515a630c:    	cmp	w16, w30  // guest 0x18d18a, sampled 0
6c515a6310:    	b.ne	0x6c515a68dc <trace+0x151c>  // guest 0x18d18a, sampled 0
6c515a6314:    	add	x30, x17, w23, uxtw  // guest 0x18d18a, sampled 0
6c515a6318:    	ldapr	w23, [x30]  // guest 0x18d18a, sampled 0
6c515a631c:    	str	w23, [x19, #0x8]  // guest 0x18d18a, sampled 0
6c515a6320:    	add	w21, w21, w22  // guest 0x18d191, sampled 0
6c515a6324:    	str	w21, [x19]  // guest 0x18d191, sampled 0
6c515a6328:    	sub	w24, w21, #0x3f  // guest 0x18d192, sampled 0
6c515a632c:    	str	w24, [x19, #0x28]  // guest 0x18d192, sampled 0
6c515a6330:    	mov	w24, #0x3f              // =63  // guest 0x18d192, sampled 0
6c515a6334:    	str	w24, [x19, #0x2c]  // guest 0x18d192, sampled 0
6c515a6338:    	add	w24, w27, #0x8  // guest 0x18d195, sampled 0
6c515a633c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d195, sampled 0
6c515a6340:    	and	x16, x16, x24, lsr #7  // guest 0x18d195, sampled 0
6c515a6344:    	add	x17, x17, x16  // guest 0x18d195, sampled 0
6c515a6348:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18d195, sampled 0
6c515a634c:    	and	w30, w24, #0xfffff003  // guest 0x18d195, sampled 0
6c515a6350:    	cmp	w16, w30  // guest 0x18d195, sampled 0
6c515a6354:    	b.ne	0x6c515a6908 <trace+0x1548>  // guest 0x18d195, sampled 0
6c515a6358:    	add	x30, x17, w24, uxtw  // guest 0x18d195, sampled 0
6c515a635c:    	stlr	w23, [x30]  // guest 0x18d195, sampled 0
6c515a6360:    	add	w20, w20, #0x10  // guest 0x18d198, sampled 0
6c515a6364:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d198, sampled 0
6c515a6368:    	and	x16, x16, x20, lsr #7  // guest 0x18d198, sampled 0
6c515a636c:    	add	x17, x17, x16  // guest 0x18d198, sampled 0
6c515a6370:    	ldp	x16, x17, [x17]  // guest 0x18d198, sampled 0
6c515a6374:    	and	w30, w20, #0xfffff003  // guest 0x18d198, sampled 0
6c515a6378:    	cmp	w16, w30  // guest 0x18d198, sampled 0
6c515a637c:    	b.ne	0x6c515a6934 <trace+0x1574>  // guest 0x18d198, sampled 0
6c515a6380:    	add	x30, x17, w20, uxtw  // guest 0x18d198, sampled 0
6c515a6384:    	ldapr	w20, [x30]  // guest 0x18d198, sampled 0
6c515a6388:    	str	w20, [x19, #0x4]  // guest 0x18d198, sampled 0
6c515a638c:    	sturb	w22, [x19, #-0xc]  // guest 0x18d198, sampled 0
6c515a6390:    	mov	w20, #0x12              // =18  // guest 0x18d19c, sampled 0
6c515a6394:    	str	w20, [x19, #0x34]  // guest 0x18d19c, sampled 0
6c515a6398:    	cmp	w21, #0x3f  // guest 0x18d19c, sampled 0
6c515a639c:    	b.le	0x6c515a63bc <trace+0xffc>  // guest 0x18d19c, sampled 1
6c515a63a0:    	b	0x6c515a63a0 <trace+0xfe0>  // guest 0x18d19c, sampled 0
6c515a63a4:    	br	x16  // guest 0x18d19c, sampled 0
6c515a63a8:    	mov	w20, #0xd1a2            // =53666  // guest 0x18d19c, sampled 0
6c515a63ac:    	movk	w20, #0x18, lsl #16  // guest 0x18d19c, sampled 0
6c515a63b0:    	str	w20, [x19, #0x20]  // guest 0x18d19c, sampled 0
6c515a63b4:    	adr	x0, 0x6c515a5301 <trace+0xffffffffffffff41>  // guest 0x18d19c, sampled 0
6c515a63b8:    	b	0x6c4ae5d02c <trace+0xfffffffff98b7c6c>  // guest 0x18d19c, sampled 0
6c515a63bc:    	b	0x6c515a63bc <trace+0xffc>  // guest 0x18d19c, sampled 0
6c515a63c0:    	br	x16  // guest 0x18d19c, sampled 0
6c515a63c4:    	mov	w20, #0xd097            // =53399  // guest 0x18d19c, sampled 0
6c515a63c8:    	movk	w20, #0x18, lsl #16  // guest 0x18d19c, sampled 0
6c515a63cc:    	str	w20, [x19, #0x20]  // guest 0x18d19c, sampled 0
6c515a63d0:    	adr	x0, 0x6c515a5300 <trace+0xffffffffffffff40>  // guest 0x18d19c, sampled 0
6c515a63d4:    	b	0x6c4ae5d02c <trace+0xfffffffff98b7c6c>  // guest 0x18d19c, sampled 0
6c515a63d8:    	adr	x0, 0x6c515a5303 <trace+0xffffffffffffff43>  // guest 0x18d19c, sampled 0
6c515a63dc:    	b	0x6c4ae5d02c <trace+0xfffffffff98b7c6c>  // guest 0x18d19c, sampled 0
6c515a63e0:    	mov	w1, w21
6c515a63e4:    	mov	x0, x19
6c515a63e8:    	mov	w2, #0x4045             // =16453
6c515a63ec:    	movk	w2, #0x1, lsl #16
6c515a63f0:    	adr	x3, 0x6c515a5444 <trace+0x84>
6c515a63f4:    	adrp	x16, 0x6c97723000 <trace+0x4617e000>
6c515a63f8:    	add	x16, x16, #0xf88
6c515a63fc:    	blr	x16
6c515a6400:    	mov	w21, w0
6c515a6404:    	dmb	ishld
6c515a6408:    	b	0x6c515a5444 <trace+0x84>
6c515a640c:    	mov	w1, w21
6c515a6410:    	mov	x0, x19
6c515a6414:    	mov	w2, #0x4045             // =16453
6c515a6418:    	movk	w2, #0x1, lsl #16
6c515a641c:    	adr	x3, 0x6c515a5480 <trace+0xc0>
6c515a6420:    	adrp	x16, 0x6c97723000 <trace+0x4617e000>
6c515a6424:    	add	x16, x16, #0xf88
6c515a6428:    	blr	x16
6c515a642c:    	mov	w2, w0
6c515a6430:    	dmb	ishld
6c515a6434:    	b	0x6c515a5480 <trace+0xc0>
6c515a6438:    	mov	w1, w26
6c515a643c:    	mov	x0, x19
6c515a6440:    	mov	w2, #0x4045             // =16453
6c515a6444:    	movk	w2, #0x1, lsl #16
6c515a6448:    	adr	x3, 0x6c515a5538 <trace+0x178>
6c515a644c:    	adrp	x16, 0x6c97723000 <trace+0x4617e000>
6c515a6450:    	add	x16, x16, #0xf88
6c515a6454:    	blr	x16
6c515a6458:    	mov	w26, w0
6c515a645c:    	dmb	ishld
6c515a6460:    	b	0x6c515a5538 <trace+0x178>
6c515a6464:    	mov	w1, w8
6c515a6468:    	mov	x0, x19
6c515a646c:    	mov	w2, #0x4045             // =16453
6c515a6470:    	movk	w2, #0x1, lsl #16
6c515a6474:    	adr	x3, 0x6c515a5578 <trace+0x1b8>
6c515a6478:    	adrp	x16, 0x6c97723000 <trace+0x4617e000>
6c515a647c:    	add	x16, x16, #0xf88
6c515a6480:    	blr	x16
6c515a6484:    	mov	w8, w0
6c515a6488:    	dmb	ishld
6c515a648c:    	b	0x6c515a5578 <trace+0x1b8>
6c515a6490:    	mov	w1, w8
6c515a6494:    	mov	x0, x19
6c515a6498:    	mov	w2, #0x4045             // =16453
6c515a649c:    	movk	w2, #0x1, lsl #16
6c515a64a0:    	adr	x3, 0x6c515a55b4 <trace+0x1f4>
6c515a64a4:    	adrp	x16, 0x6c97723000 <trace+0x4617e000>
6c515a64a8:    	add	x16, x16, #0xf88
6c515a64ac:    	blr	x16
6c515a64b0:    	mov	w2, w0
6c515a64b4:    	dmb	ishld
6c515a64b8:    	b	0x6c515a55b4 <trace+0x1f4>
6c515a64bc:    	mov	w1, w20
6c515a64c0:    	mov	x0, x19
6c515a64c4:    	mov	w2, #0x4045             // =16453
6c515a64c8:    	movk	w2, #0x1, lsl #16
6c515a64cc:    	adr	x3, 0x6c515a5654 <trace+0x294>
6c515a64d0:    	adrp	x16, 0x6c97723000 <trace+0x4617e000>
6c515a64d4:    	add	x16, x16, #0xf88
6c515a64d8:    	blr	x16
6c515a64dc:    	mov	w20, w0
6c515a64e0:    	dmb	ishld
6c515a64e4:    	b	0x6c515a5654 <trace+0x294>
6c515a64e8:    	mov	w1, w26
6c515a64ec:    	mov	x0, x19
6c515a64f0:    	mov	w2, #0x4045             // =16453
6c515a64f4:    	movk	w2, #0x1, lsl #16
6c515a64f8:    	adr	x3, 0x6c515a56f0 <trace+0x330>
6c515a64fc:    	adrp	x16, 0x6c97723000 <trace+0x4617e000>
6c515a6500:    	add	x16, x16, #0xf88
6c515a6504:    	blr	x16
6c515a6508:    	mov	w2, w0
6c515a650c:    	dmb	ishld
6c515a6510:    	b	0x6c515a56f0 <trace+0x330>
6c515a6514:    	mov	w1, w26
6c515a6518:    	mov	x0, x19
6c515a651c:    	mov	w2, #0x4045             // =16453
6c515a6520:    	movk	w2, #0x1, lsl #16
6c515a6524:    	adr	x3, 0x6c515a577c <trace+0x3bc>
6c515a6528:    	adrp	x16, 0x6c97723000 <trace+0x4617e000>
6c515a652c:    	add	x16, x16, #0xf88
6c515a6530:    	blr	x16
6c515a6534:    	mov	w26, w0
6c515a6538:    	dmb	ishld
6c515a653c:    	b	0x6c515a577c <trace+0x3bc>
6c515a6540:    	mov	w1, w20
6c515a6544:    	mov	x0, x19
6c515a6548:    	mov	w2, #0x4045             // =16453
6c515a654c:    	movk	w2, #0x1, lsl #16
6c515a6550:    	adr	x3, 0x6c515a57b4 <trace+0x3f4>
6c515a6554:    	adrp	x16, 0x6c97723000 <trace+0x4617e000>
6c515a6558:    	add	x16, x16, #0xf88
6c515a655c:    	blr	x16
6c515a6560:    	mov	w2, w0
6c515a6564:    	dmb	ishld
6c515a6568:    	b	0x6c515a57b4 <trace+0x3f4>
6c515a656c:    	mov	w1, w20
6c515a6570:    	mov	x0, x19
6c515a6574:    	mov	w2, #0x4045             // =16453
6c515a6578:    	movk	w2, #0x1, lsl #16
6c515a657c:    	adr	x3, 0x6c515a5b34 <trace+0x774>
6c515a6580:    	adrp	x16, 0x6c97723000 <trace+0x4617e000>
6c515a6584:    	add	x16, x16, #0xf88
6c515a6588:    	blr	x16
6c515a658c:    	mov	w2, w0
6c515a6590:    	dmb	ishld
6c515a6594:    	b	0x6c515a5b34 <trace+0x774>
6c515a6598:    	mov	w1, w24
6c515a659c:    	mov	w2, w0
6c515a65a0:    	mov	x0, x19
6c515a65a4:    	mov	w3, #0x4045             // =16453
6c515a65a8:    	movk	w3, #0x1, lsl #16
6c515a65ac:    	adr	x4, 0x6c515a5be0 <trace+0x820>
6c515a65b0:    	adrp	x16, 0x6c97724000 <trace+0x4617f000>
6c515a65b4:    	add	x16, x16, #0xb68
6c515a65b8:    	blr	x16
6c515a65bc:    	dmb	ishld
6c515a65c0:    	b	0x6c515a5be0 <trace+0x820>
6c515a65c4:    	mov	w1, w24
6c515a65c8:    	mov	w2, w0
6c515a65cc:    	mov	x0, x19
6c515a65d0:    	mov	w3, #0x4045             // =16453
6c515a65d4:    	movk	w3, #0x1, lsl #16
6c515a65d8:    	adr	x4, 0x6c515a5cb0 <trace+0x8f0>
6c515a65dc:    	adrp	x16, 0x6c97724000 <trace+0x4617f000>
6c515a65e0:    	add	x16, x16, #0xb68
6c515a65e4:    	blr	x16
6c515a65e8:    	dmb	ishld
6c515a65ec:    	b	0x6c515a5cb0 <trace+0x8f0>
6c515a65f0:    	mov	w1, w24
6c515a65f4:    	mov	x0, x19
6c515a65f8:    	mov	w2, #0x4045             // =16453
6c515a65fc:    	movk	w2, #0x1, lsl #16
6c515a6600:    	adr	x3, 0x6c515a5d10 <trace+0x950>
6c515a6604:    	adrp	x16, 0x6c97723000 <trace+0x4617e000>
6c515a6608:    	add	x16, x16, #0xf88
6c515a660c:    	blr	x16
6c515a6610:    	mov	w24, w0
6c515a6614:    	dmb	ishld
6c515a6618:    	b	0x6c515a5d10 <trace+0x950>
6c515a661c:    	mov	w1, w26
6c515a6620:    	mov	x0, x19
6c515a6624:    	mov	w2, #0x4045             // =16453
6c515a6628:    	movk	w2, #0x1, lsl #16
6c515a662c:    	adr	x3, 0x6c515a5d40 <trace+0x980>
6c515a6630:    	adrp	x16, 0x6c97723000 <trace+0x4617e000>
6c515a6634:    	add	x16, x16, #0xf88
6c515a6638:    	blr	x16
6c515a663c:    	mov	w2, w0
6c515a6640:    	dmb	ishld
6c515a6644:    	b	0x6c515a5d40 <trace+0x980>
6c515a6648:    	mov	w1, w26
6c515a664c:    	mov	w2, w24
6c515a6650:    	mov	x0, x19
6c515a6654:    	mov	w3, #0x4045             // =16453
6c515a6658:    	movk	w3, #0x1, lsl #16
6c515a665c:    	adr	x4, 0x6c515a5dc8 <trace+0xa08>
6c515a6660:    	adrp	x16, 0x6c97724000 <trace+0x4617f000>
6c515a6664:    	add	x16, x16, #0xb68
6c515a6668:    	blr	x16
6c515a666c:    	dmb	ishld
6c515a6670:    	b	0x6c515a5dc8 <trace+0xa08>
6c515a6674:    	mov	w1, w24
6c515a6678:    	mov	w2, w0
6c515a667c:    	mov	x0, x19
6c515a6680:    	mov	w3, #0x4045             // =16453
6c515a6684:    	movk	w3, #0x1, lsl #16
6c515a6688:    	adr	x4, 0x6c515a5e78 <trace+0xab8>
6c515a668c:    	adrp	x16, 0x6c97724000 <trace+0x4617f000>
6c515a6690:    	add	x16, x16, #0xb68
6c515a6694:    	blr	x16
6c515a6698:    	dmb	ishld
6c515a669c:    	b	0x6c515a5e78 <trace+0xab8>
6c515a66a0:    	mov	w1, w24
6c515a66a4:    	mov	x0, x19
6c515a66a8:    	mov	w2, #0x4045             // =16453
6c515a66ac:    	movk	w2, #0x1, lsl #16
6c515a66b0:    	adr	x3, 0x6c515a5ed8 <trace+0xb18>
6c515a66b4:    	adrp	x16, 0x6c97723000 <trace+0x4617e000>
6c515a66b8:    	add	x16, x16, #0xf88
6c515a66bc:    	blr	x16
6c515a66c0:    	mov	w24, w0
6c515a66c4:    	dmb	ishld
6c515a66c8:    	b	0x6c515a5ed8 <trace+0xb18>
6c515a66cc:    	mov	w1, w27
6c515a66d0:    	mov	w2, w24
6c515a66d4:    	mov	x0, x19
6c515a66d8:    	mov	w3, #0x4045             // =16453
6c515a66dc:    	movk	w3, #0x1, lsl #16
6c515a66e0:    	adr	x4, 0x6c515a5f04 <trace+0xb44>
6c515a66e4:    	adrp	x16, 0x6c97724000 <trace+0x4617f000>
6c515a66e8:    	add	x16, x16, #0xb68
6c515a66ec:    	blr	x16
6c515a66f0:    	dmb	ishld
6c515a66f4:    	b	0x6c515a5f04 <trace+0xb44>
6c515a66f8:    	mov	w1, w24
6c515a66fc:    	mov	x0, x19
6c515a6700:    	mov	w2, #0x4045             // =16453
6c515a6704:    	movk	w2, #0x1, lsl #16
6c515a6708:    	adr	x3, 0x6c515a5fe4 <trace+0xc24>
6c515a670c:    	adrp	x16, 0x6c97723000 <trace+0x4617e000>
6c515a6710:    	add	x16, x16, #0xf88
6c515a6714:    	blr	x16
6c515a6718:    	mov	w2, w0
6c515a671c:    	dmb	ishld
6c515a6720:    	b	0x6c515a5fe4 <trace+0xc24>
6c515a6724:    	mov	w1, w24
6c515a6728:    	mov	w2, w0
6c515a672c:    	mov	x0, x19
6c515a6730:    	mov	w3, #0x4045             // =16453
6c515a6734:    	movk	w3, #0x1, lsl #16
6c515a6738:    	adr	x4, 0x6c515a60f4 <trace+0xd34>
6c515a673c:    	adrp	x16, 0x6c97724000 <trace+0x4617f000>
6c515a6740:    	add	x16, x16, #0xb68
6c515a6744:    	blr	x16
6c515a6748:    	dmb	ishld
6c515a674c:    	b	0x6c515a60f4 <trace+0xd34>
6c515a6750:    	mov	w1, w21
6c515a6754:    	mov	x0, x19
6c515a6758:    	mov	w2, #0x4045             // =16453
6c515a675c:    	movk	w2, #0x1, lsl #16
6c515a6760:    	adr	x3, 0x6c515a6154 <trace+0xd94>
6c515a6764:    	adrp	x16, 0x6c97723000 <trace+0x4617e000>
6c515a6768:    	add	x16, x16, #0xf88
6c515a676c:    	blr	x16
6c515a6770:    	mov	w21, w0
6c515a6774:    	dmb	ishld
6c515a6778:    	b	0x6c515a6154 <trace+0xd94>
6c515a677c:    	mov	w1, w24
6c515a6780:    	mov	w2, w21
6c515a6784:    	mov	x0, x19
6c515a6788:    	mov	w3, #0x4045             // =16453
6c515a678c:    	movk	w3, #0x1, lsl #16
6c515a6790:    	adr	x4, 0x6c515a6180 <trace+0xdc0>
6c515a6794:    	adrp	x16, 0x6c97724000 <trace+0x4617f000>
6c515a6798:    	add	x16, x16, #0xb68
6c515a679c:    	blr	x16
6c515a67a0:    	dmb	ishld
6c515a67a4:    	b	0x6c515a6180 <trace+0xdc0>
6c515a67a8:    	mov	w1, w24
6c515a67ac:    	mov	x0, x19
6c515a67b0:    	mov	w2, #0x4045             // =16453
6c515a67b4:    	movk	w2, #0x1, lsl #16
6c515a67b8:    	adr	x3, 0x6c515a61c4 <trace+0xe04>
6c515a67bc:    	adrp	x16, 0x6c97723000 <trace+0x4617e000>
6c515a67c0:    	add	x16, x16, #0xf88
6c515a67c4:    	blr	x16
6c515a67c8:    	mov	w24, w0
6c515a67cc:    	dmb	ishld
6c515a67d0:    	b	0x6c515a61c4 <trace+0xe04>
6c515a67d4:    	mov	w1, w24
6c515a67d8:    	mov	x0, x19
6c515a67dc:    	mov	w2, #0x4045             // =16453
6c515a67e0:    	movk	w2, #0x1, lsl #16
6c515a67e4:    	adr	x3, 0x6c515a6200 <trace+0xe40>
6c515a67e8:    	adrp	x16, 0x6c97723000 <trace+0x4617e000>
6c515a67ec:    	add	x16, x16, #0xf88
6c515a67f0:    	blr	x16
6c515a67f4:    	mov	w24, w0
6c515a67f8:    	dmb	ishld
6c515a67fc:    	b	0x6c515a6200 <trace+0xe40>
6c515a6800:    	mov	w1, w27
6c515a6804:    	mov	w2, w24
6c515a6808:    	mov	x0, x19
6c515a680c:    	mov	w3, #0x4045             // =16453
6c515a6810:    	movk	w3, #0x1, lsl #16
6c515a6814:    	adr	x4, 0x6c515a6238 <trace+0xe78>
6c515a6818:    	adrp	x16, 0x6c97724000 <trace+0x4617f000>
6c515a681c:    	add	x16, x16, #0xb68
6c515a6820:    	blr	x16
6c515a6824:    	dmb	ishld
6c515a6828:    	b	0x6c515a6238 <trace+0xe78>
6c515a682c:    	mov	w1, w23
6c515a6830:    	mov	x0, x19
6c515a6834:    	mov	w2, #0x4045             // =16453
6c515a6838:    	movk	w2, #0x1, lsl #16
6c515a683c:    	adr	x3, 0x6c515a625c <trace+0xe9c>
6c515a6840:    	adrp	x16, 0x6c97723000 <trace+0x4617e000>
6c515a6844:    	add	x16, x16, #0xf88
6c515a6848:    	blr	x16
6c515a684c:    	mov	w24, w0
6c515a6850:    	dmb	ishld
6c515a6854:    	b	0x6c515a625c <trace+0xe9c>
6c515a6858:    	mov	w1, w24
6c515a685c:    	mov	x0, x19
6c515a6860:    	mov	w2, #0x4045             // =16453
6c515a6864:    	movk	w2, #0x1, lsl #16
6c515a6868:    	adr	x3, 0x6c515a6298 <trace+0xed8>
6c515a686c:    	adrp	x16, 0x6c97723000 <trace+0x4617e000>
6c515a6870:    	add	x16, x16, #0xf88
6c515a6874:    	blr	x16
6c515a6878:    	mov	w24, w0
6c515a687c:    	dmb	ishld
6c515a6880:    	b	0x6c515a6298 <trace+0xed8>
6c515a6884:    	mov	w1, w28
6c515a6888:    	mov	w2, w24
6c515a688c:    	mov	x0, x19
6c515a6890:    	mov	w3, #0x4045             // =16453
6c515a6894:    	movk	w3, #0x1, lsl #16
6c515a6898:    	adr	x4, 0x6c515a62c4 <trace+0xf04>
6c515a689c:    	adrp	x16, 0x6c97724000 <trace+0x4617f000>
6c515a68a0:    	add	x16, x16, #0xb68
6c515a68a4:    	blr	x16
6c515a68a8:    	dmb	ishld
6c515a68ac:    	b	0x6c515a62c4 <trace+0xf04>
6c515a68b0:    	mov	w1, w23
6c515a68b4:    	mov	x0, x19
6c515a68b8:    	mov	w2, #0x4045             // =16453
6c515a68bc:    	movk	w2, #0x1, lsl #16
6c515a68c0:    	adr	x3, 0x6c515a62e8 <trace+0xf28>
6c515a68c4:    	adrp	x16, 0x6c97723000 <trace+0x4617e000>
6c515a68c8:    	add	x16, x16, #0xf88
6c515a68cc:    	blr	x16
6c515a68d0:    	mov	w23, w0
6c515a68d4:    	dmb	ishld
6c515a68d8:    	b	0x6c515a62e8 <trace+0xf28>
6c515a68dc:    	mov	w1, w23
6c515a68e0:    	mov	x0, x19
6c515a68e4:    	mov	w2, #0x4045             // =16453
6c515a68e8:    	movk	w2, #0x1, lsl #16
6c515a68ec:    	adr	x3, 0x6c515a631c <trace+0xf5c>
6c515a68f0:    	adrp	x16, 0x6c97723000 <trace+0x4617e000>
6c515a68f4:    	add	x16, x16, #0xf88
6c515a68f8:    	blr	x16
6c515a68fc:    	mov	w23, w0
6c515a6900:    	dmb	ishld
6c515a6904:    	b	0x6c515a631c <trace+0xf5c>
6c515a6908:    	mov	w1, w24
6c515a690c:    	mov	w2, w23
6c515a6910:    	mov	x0, x19
6c515a6914:    	mov	w3, #0x4045             // =16453
6c515a6918:    	movk	w3, #0x1, lsl #16
6c515a691c:    	adr	x4, 0x6c515a6360 <trace+0xfa0>
6c515a6920:    	adrp	x16, 0x6c97724000 <trace+0x4617f000>
6c515a6924:    	add	x16, x16, #0xb68
6c515a6928:    	blr	x16
6c515a692c:    	dmb	ishld
6c515a6930:    	b	0x6c515a6360 <trace+0xfa0>
6c515a6934:    	mov	w1, w20
6c515a6938:    	mov	x0, x19
6c515a693c:    	mov	w2, #0x4045             // =16453
6c515a6940:    	movk	w2, #0x1, lsl #16
6c515a6944:    	adr	x3, 0x6c515a6388 <trace+0xfc8>
6c515a6948:    	adrp	x16, 0x6c97723000 <trace+0x4617e000>
6c515a694c:    	add	x16, x16, #0xf88
6c515a6950:    	blr	x16
6c515a6954:    	mov	w20, w0
6c515a6958:    	dmb	ishld
6c515a695c:    	b	0x6c515a6388 <trace+0xfc8>