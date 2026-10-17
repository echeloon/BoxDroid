
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-10b236-6eae8e0480.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006eae8e0480 <trace>:
6eae8e0480:    	ldur	w20, [x19, #-0x10]  // guest 0x10b236, sampled 0
6eae8e0484:    	tbnz	w20, #0x1f, 0x6eae8e2640 <trace+0x21c0>  // guest 0x10b236, sampled 0
6eae8e0488:    	sturb	wzr, [x19, #-0xc]  // guest 0x10b236, sampled 0
6eae8e048c:    	mov	w20, #0x62a8            // =25256  // guest 0x10b236, sampled 0
6eae8e0490:    	movk	w20, #0x4f, lsl #16  // guest 0x10b236, sampled 0
6eae8e0494:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b236, sampled 0
6eae8e0498:    	and	x16, x16, x20, lsr #7  // guest 0x10b236, sampled 0
6eae8e049c:    	add	x17, x17, x16  // guest 0x10b236, sampled 0
6eae8e04a0:    	ldp	x16, x17, [x17]  // guest 0x10b236, sampled 0
6eae8e04a4:    	and	w30, w20, #0xfffff003  // guest 0x10b236, sampled 0
6eae8e04a8:    	cmp	w16, w30  // guest 0x10b236, sampled 0
6eae8e04ac:    	b.ne	0x6eae8e2648 <trace+0x21c8>  // guest 0x10b236, sampled 0
6eae8e04b0:    	add	x30, x17, w20, uxtw  // guest 0x10b236, sampled 0
6eae8e04b4:    	ldapr	w20, [x30]  // guest 0x10b236, sampled 0
6eae8e04b8:    	str	w20, [x19, #0x8]  // guest 0x10b236, sampled 0
6eae8e04bc:    	ldr	w21, [x19]  // guest 0x10b23c, sampled 0
6eae8e04c0:    	lsl	w22, w21, #1  // guest 0x10b23c, sampled 1
6eae8e04c4:    	add	w21, w22, w21  // guest 0x10b23c, sampled 0
6eae8e04c8:    	lsl	w22, w21, #3  // guest 0x10b23f, sampled 0
6eae8e04cc:    	lsl	w21, w21, #4  // guest 0x10b23f, sampled 0
6eae8e04d0:    	str	w21, [x19, #0x4]  // guest 0x10b23f, sampled 0
6eae8e04d4:    	str	w21, [x19, #0x28]  // guest 0x10b23f, sampled 0
6eae8e04d8:    	str	w22, [x19, #0x2c]  // guest 0x10b23f, sampled 0
6eae8e04dc:    	add	w20, w20, w21  // guest 0x10b242, sampled 0
6eae8e04e0:    	str	w20, [x19]  // guest 0x10b242, sampled 0
6eae8e04e4:    	ldr	w21, [x19, #0xc]  // guest 0x10b245, sampled 0
6eae8e04e8:    	add	w22, w21, #0x10c  // guest 0x10b245, sampled 0
6eae8e04ec:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b245, sampled 0
6eae8e04f0:    	and	x16, x16, x22, lsr #7  // guest 0x10b245, sampled 0
6eae8e04f4:    	add	x17, x17, x16  // guest 0x10b245, sampled 0
6eae8e04f8:    	ldp	x16, x17, [x17]  // guest 0x10b245, sampled 0
6eae8e04fc:    	and	w30, w22, #0xfffff003  // guest 0x10b245, sampled 0
6eae8e0500:    	cmp	w16, w30  // guest 0x10b245, sampled 0
6eae8e0504:    	b.ne	0x6eae8e2674 <trace+0x21f4>  // guest 0x10b245, sampled 0
6eae8e0508:    	add	x30, x17, w22, uxtw  // guest 0x10b245, sampled 0
6eae8e050c:    	ldapr	w22, [x30]  // guest 0x10b245, sampled 0
6eae8e0510:    	str	w22, [x19, #0x4]  // guest 0x10b245, sampled 0
6eae8e0514:    	add	w23, w20, #0x10  // guest 0x10b24b, sampled 1
6eae8e0518:    	mov	w24, w23  // guest 0x10b24b, sampled 0
6eae8e051c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b24b, sampled 0
6eae8e0520:    	and	x16, x16, x23, lsr #7  // guest 0x10b24b, sampled 0
6eae8e0524:    	add	x17, x17, x16  // guest 0x10b24b, sampled 0
6eae8e0528:    	ldp	x16, x17, [x17]  // guest 0x10b24b, sampled 0
6eae8e052c:    	and	w30, w23, #0xfffff003  // guest 0x10b24b, sampled 0
6eae8e0530:    	cmp	w16, w30  // guest 0x10b24b, sampled 0
6eae8e0534:    	b.ne	0x6eae8e26a0 <trace+0x2220>  // guest 0x10b24b, sampled 0
6eae8e0538:    	add	x30, x17, w23, uxtw  // guest 0x10b24b, sampled 0
6eae8e053c:    	ldapr	w2, [x30]  // guest 0x10b24b, sampled 0
6eae8e0540:    	ldr	w23, [x19, #0x188]  // guest 0x10b24b, sampled 0
6eae8e0544:    	add	w25, w23, #0x7  // guest 0x10b24b, sampled 0
6eae8e0548:    	and	w25, w25, #0x7  // guest 0x10b24b, sampled 0
6eae8e054c:    	lsl	w25, w25, #4  // guest 0x10b24b, sampled 0
6eae8e0550:    	add	w25, w25, #0x1a0  // guest 0x10b24b, sampled 0
6eae8e0554:    	sxtw	x25, w25  // guest 0x10b24b, sampled 0
6eae8e0558:    	add	x1, x25, x19  // guest 0x10b24b, sampled 0
6eae8e055c:    	mov	x0, x19  // guest 0x10b24b, sampled 0
6eae8e0560:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b24b, sampled 0
6eae8e0564:    	add	x16, x16, #0x484  // guest 0x10b24b, sampled 0
6eae8e0568:    	blr	x16  // guest 0x10b24b, sampled 0
6eae8e056c:    	sub	w23, w23, #0x1  // guest 0x10b24b, sampled 0
6eae8e0570:    	and	w23, w23, #0x7  // guest 0x10b24b, sampled 0
6eae8e0574:    	str	w23, [x19, #0x188]  // guest 0x10b24b, sampled 0
6eae8e0578:    	sxtw	x25, w23  // guest 0x10b24b, sampled 0
6eae8e057c:    	add	x25, x25, x19  // guest 0x10b24b, sampled 0
6eae8e0580:    	strb	wzr, [x25, #0x190]  // guest 0x10b24b, sampled 0
6eae8e0584:    	ldr	w25, [x19, #0x74]  // guest 0x10b24b, sampled 0
6eae8e0588:    	strh	w25, [x19, #0x224]  // guest 0x10b24b, sampled 0
6eae8e058c:    	str	w24, [x19, #0x230]  // guest 0x10b24b, sampled 0
6eae8e0590:    	ldr	w24, [x19, #0x54]  // guest 0x10b24b, sampled 0
6eae8e0594:    	strh	w24, [x19, #0x222]  // guest 0x10b24b, sampled 0
6eae8e0598:    	mov	w24, #0xb24b            // =45643  // guest 0x10b24b, sampled 0
6eae8e059c:    	movk	w24, #0x10, lsl #16  // guest 0x10b24b, sampled 0
6eae8e05a0:    	str	w24, [x19, #0x228]  // guest 0x10b24b, sampled 0
6eae8e05a4:    	ldr	w24, [x19, #0x18]  // guest 0x10b24e, sampled 0
6eae8e05a8:    	lsl	w25, w24, #1  // guest 0x10b24e, sampled 0
6eae8e05ac:    	add	w24, w25, w24  // guest 0x10b24e, sampled 0
6eae8e05b0:    	lsl	w25, w24, #1  // guest 0x10b251, sampled 0
6eae8e05b4:    	lsl	w24, w24, #2  // guest 0x10b251, sampled 0
6eae8e05b8:    	str	w24, [x19, #0x8]  // guest 0x10b251, sampled 0
6eae8e05bc:    	mov	w26, w24  // guest 0x10b251, sampled 0
6eae8e05c0:    	str	w26, [x19, #0x28]  // guest 0x10b251, sampled 0
6eae8e05c4:    	str	w25, [x19, #0x2c]  // guest 0x10b251, sampled 0
6eae8e05c8:    	add	w25, w24, w22  // guest 0x10b254, sampled 0
6eae8e05cc:    	add	w25, w25, #0x4  // guest 0x10b254, sampled 0
6eae8e05d0:    	mov	w27, w25  // guest 0x10b254, sampled 0
6eae8e05d4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b254, sampled 0
6eae8e05d8:    	and	x16, x16, x25, lsr #7  // guest 0x10b254, sampled 0
6eae8e05dc:    	add	x17, x17, x16  // guest 0x10b254, sampled 0
6eae8e05e0:    	ldp	x16, x17, [x17]  // guest 0x10b254, sampled 0
6eae8e05e4:    	and	w30, w25, #0xfffff003  // guest 0x10b254, sampled 0
6eae8e05e8:    	cmp	w16, w30  // guest 0x10b254, sampled 0
6eae8e05ec:    	b.ne	0x6eae8e26cc <trace+0x224c>  // guest 0x10b254, sampled 0
6eae8e05f0:    	add	x30, x17, w25, uxtw  // guest 0x10b254, sampled 0
6eae8e05f4:    	ldapr	w2, [x30]  // guest 0x10b254, sampled 0
6eae8e05f8:    	add	x1, x19, #0x258  // guest 0x10b254, sampled 0
6eae8e05fc:    	mov	x0, x19  // guest 0x10b254, sampled 0
6eae8e0600:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b254, sampled 0
6eae8e0604:    	add	x16, x16, #0x484  // guest 0x10b254, sampled 0
6eae8e0608:    	blr	x16  // guest 0x10b254, sampled 0
6eae8e060c:    	lsl	w25, w23, #4  // guest 0x10b254, sampled 0
6eae8e0610:    	add	w25, w25, #0x1a0  // guest 0x10b254, sampled 0
6eae8e0614:    	sxtw	x25, w25  // guest 0x10b254, sampled 0
6eae8e0618:    	add	x1, x25, x19  // guest 0x10b254, sampled 0
6eae8e061c:    	add	x2, x19, #0x258  // guest 0x10b254, sampled 0
6eae8e0620:    	mov	x0, x19  // guest 0x10b254, sampled 0
6eae8e0624:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b254, sampled 0
6eae8e0628:    	add	x16, x16, #0xb4c  // guest 0x10b254, sampled 0
6eae8e062c:    	blr	x16  // guest 0x10b254, sampled 0
6eae8e0630:    	ldr	w25, [x19, #0x74]  // guest 0x10b254, sampled 0
6eae8e0634:    	strh	w25, [x19, #0x224]  // guest 0x10b254, sampled 0
6eae8e0638:    	str	w27, [x19, #0x230]  // guest 0x10b254, sampled 0
6eae8e063c:    	ldr	w25, [x19, #0x54]  // guest 0x10b254, sampled 0
6eae8e0640:    	strh	w25, [x19, #0x222]  // guest 0x10b254, sampled 0
6eae8e0644:    	mov	w25, #0xb254            // =45652  // guest 0x10b254, sampled 0
6eae8e0648:    	movk	w25, #0x10, lsl #16  // guest 0x10b254, sampled 0
6eae8e064c:    	str	w25, [x19, #0x228]  // guest 0x10b254, sampled 0
6eae8e0650:    	add	w22, w22, w26  // guest 0x10b258, sampled 0
6eae8e0654:    	str	w22, [x19, #0x4]  // guest 0x10b258, sampled 0
6eae8e0658:    	mov	w25, w22  // guest 0x10b258, sampled 0
6eae8e065c:    	str	w25, [x19, #0x28]  // guest 0x10b258, sampled 0
6eae8e0660:    	str	w24, [x19, #0x2c]  // guest 0x10b258, sampled 0
6eae8e0664:    	add	w26, w20, #0x14  // guest 0x10b25a, sampled 0
6eae8e0668:    	mov	w27, w26  // guest 0x10b25a, sampled 0
6eae8e066c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b25a, sampled 0
6eae8e0670:    	and	x16, x16, x26, lsr #7  // guest 0x10b25a, sampled 0
6eae8e0674:    	add	x17, x17, x16  // guest 0x10b25a, sampled 0
6eae8e0678:    	ldp	x16, x17, [x17]  // guest 0x10b25a, sampled 0
6eae8e067c:    	and	w30, w26, #0xfffff003  // guest 0x10b25a, sampled 1
6eae8e0680:    	cmp	w16, w30  // guest 0x10b25a, sampled 0
6eae8e0684:    	b.ne	0x6eae8e26f8 <trace+0x2278>  // guest 0x10b25a, sampled 0
6eae8e0688:    	add	x30, x17, w26, uxtw  // guest 0x10b25a, sampled 1
6eae8e068c:    	ldapr	w2, [x30]  // guest 0x10b25a, sampled 0
6eae8e0690:    	add	w26, w23, #0x7  // guest 0x10b25a, sampled 0
6eae8e0694:    	and	w26, w26, #0x7  // guest 0x10b25a, sampled 0
6eae8e0698:    	lsl	w26, w26, #4  // guest 0x10b25a, sampled 0
6eae8e069c:    	add	w26, w26, #0x1a0  // guest 0x10b25a, sampled 0
6eae8e06a0:    	sxtw	x26, w26  // guest 0x10b25a, sampled 0
6eae8e06a4:    	add	x1, x26, x19  // guest 0x10b25a, sampled 0
6eae8e06a8:    	mov	x0, x19  // guest 0x10b25a, sampled 0
6eae8e06ac:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b25a, sampled 0
6eae8e06b0:    	add	x16, x16, #0x484  // guest 0x10b25a, sampled 0
6eae8e06b4:    	blr	x16  // guest 0x10b25a, sampled 0
6eae8e06b8:    	sub	w23, w23, #0x1  // guest 0x10b25a, sampled 0
6eae8e06bc:    	and	w23, w23, #0x7  // guest 0x10b25a, sampled 0
6eae8e06c0:    	str	w23, [x19, #0x188]  // guest 0x10b25a, sampled 0
6eae8e06c4:    	sxtw	x26, w23  // guest 0x10b25a, sampled 0
6eae8e06c8:    	add	x26, x26, x19  // guest 0x10b25a, sampled 0
6eae8e06cc:    	strb	wzr, [x26, #0x190]  // guest 0x10b25a, sampled 0
6eae8e06d0:    	ldr	w26, [x19, #0x74]  // guest 0x10b25a, sampled 0
6eae8e06d4:    	strh	w26, [x19, #0x224]  // guest 0x10b25a, sampled 0
6eae8e06d8:    	str	w27, [x19, #0x230]  // guest 0x10b25a, sampled 0
6eae8e06dc:    	ldr	w26, [x19, #0x54]  // guest 0x10b25a, sampled 0
6eae8e06e0:    	strh	w26, [x19, #0x222]  // guest 0x10b25a, sampled 0
6eae8e06e4:    	mov	w26, #0xb25a            // =45658  // guest 0x10b25a, sampled 0
6eae8e06e8:    	movk	w26, #0x10, lsl #16  // guest 0x10b25a, sampled 0
6eae8e06ec:    	str	w26, [x19, #0x228]  // guest 0x10b25a, sampled 0
6eae8e06f0:    	add	w26, w22, #0x8  // guest 0x10b25d, sampled 0
6eae8e06f4:    	mov	w27, w26  // guest 0x10b25d, sampled 0
6eae8e06f8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b25d, sampled 0
6eae8e06fc:    	and	x16, x16, x26, lsr #7  // guest 0x10b25d, sampled 0
6eae8e0700:    	add	x17, x17, x16  // guest 0x10b25d, sampled 0
6eae8e0704:    	ldp	x16, x17, [x17]  // guest 0x10b25d, sampled 0
6eae8e0708:    	and	w30, w26, #0xfffff003  // guest 0x10b25d, sampled 0
6eae8e070c:    	cmp	w16, w30  // guest 0x10b25d, sampled 0
6eae8e0710:    	b.ne	0x6eae8e2724 <trace+0x22a4>  // guest 0x10b25d, sampled 0
6eae8e0714:    	add	x30, x17, w26, uxtw  // guest 0x10b25d, sampled 0
6eae8e0718:    	ldapr	w2, [x30]  // guest 0x10b25d, sampled 0
6eae8e071c:    	add	x1, x19, #0x258  // guest 0x10b25d, sampled 0
6eae8e0720:    	mov	x0, x19  // guest 0x10b25d, sampled 0
6eae8e0724:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b25d, sampled 0
6eae8e0728:    	add	x16, x16, #0x484  // guest 0x10b25d, sampled 0
6eae8e072c:    	blr	x16  // guest 0x10b25d, sampled 0
6eae8e0730:    	lsl	w26, w23, #4  // guest 0x10b25d, sampled 0
6eae8e0734:    	add	w26, w26, #0x1a0  // guest 0x10b25d, sampled 0
6eae8e0738:    	sxtw	x26, w26  // guest 0x10b25d, sampled 0
6eae8e073c:    	add	x1, x26, x19  // guest 0x10b25d, sampled 0
6eae8e0740:    	add	x2, x19, #0x258  // guest 0x10b25d, sampled 0
6eae8e0744:    	mov	x0, x19  // guest 0x10b25d, sampled 0
6eae8e0748:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b25d, sampled 0
6eae8e074c:    	add	x16, x16, #0xb4c  // guest 0x10b25d, sampled 0
6eae8e0750:    	blr	x16  // guest 0x10b25d, sampled 0
6eae8e0754:    	ldr	w26, [x19, #0x74]  // guest 0x10b25d, sampled 0
6eae8e0758:    	strh	w26, [x19, #0x224]  // guest 0x10b25d, sampled 0
6eae8e075c:    	str	w27, [x19, #0x230]  // guest 0x10b25d, sampled 0
6eae8e0760:    	ldr	w26, [x19, #0x54]  // guest 0x10b25d, sampled 0
6eae8e0764:    	strh	w26, [x19, #0x222]  // guest 0x10b25d, sampled 0
6eae8e0768:    	mov	w26, #0xb25d            // =45661  // guest 0x10b25d, sampled 0
6eae8e076c:    	movk	w26, #0x10, lsl #16  // guest 0x10b25d, sampled 0
6eae8e0770:    	str	w26, [x19, #0x228]  // guest 0x10b25d, sampled 0
6eae8e0774:    	add	w26, w23, #0x1  // guest 0x10b260, sampled 0
6eae8e0778:    	and	w26, w26, #0x7  // guest 0x10b260, sampled 0
6eae8e077c:    	lsl	w26, w26, #4  // guest 0x10b260, sampled 0
6eae8e0780:    	add	w26, w26, #0x1a0  // guest 0x10b260, sampled 0
6eae8e0784:    	sxtw	x26, w26  // guest 0x10b260, sampled 0
6eae8e0788:    	add	x1, x26, x19  // guest 0x10b260, sampled 0
6eae8e078c:    	lsl	w26, w23, #4  // guest 0x10b260, sampled 0
6eae8e0790:    	add	w26, w26, #0x1a0  // guest 0x10b260, sampled 0
6eae8e0794:    	sxtw	x26, w26  // guest 0x10b260, sampled 0
6eae8e0798:    	add	x2, x26, x19  // guest 0x10b260, sampled 0
6eae8e079c:    	mov	x0, x19  // guest 0x10b260, sampled 0
6eae8e07a0:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b260, sampled 0
6eae8e07a4:    	add	x16, x16, #0xa78  // guest 0x10b260, sampled 0
6eae8e07a8:    	blr	x16  // guest 0x10b260, sampled 0
6eae8e07ac:    	sxtw	x26, w23  // guest 0x10b260, sampled 0
6eae8e07b0:    	add	x26, x26, x19  // guest 0x10b260, sampled 0
6eae8e07b4:    	mov	w27, #0x1               // =1  // guest 0x10b260, sampled 0
6eae8e07b8:    	strb	w27, [x26, #0x190]  // guest 0x10b260, sampled 0
6eae8e07bc:    	add	w23, w23, w27  // guest 0x10b260, sampled 0
6eae8e07c0:    	and	w23, w23, #0x7  // guest 0x10b260, sampled 0
6eae8e07c4:    	str	w23, [x19, #0x188]  // guest 0x10b260, sampled 0
6eae8e07c8:    	ldr	w26, [x19, #0x54]  // guest 0x10b260, sampled 0
6eae8e07cc:    	strh	w26, [x19, #0x222]  // guest 0x10b260, sampled 0
6eae8e07d0:    	mov	w26, #0xb260            // =45664  // guest 0x10b260, sampled 0
6eae8e07d4:    	movk	w26, #0x10, lsl #16  // guest 0x10b260, sampled 0
6eae8e07d8:    	str	w26, [x19, #0x228]  // guest 0x10b260, sampled 0
6eae8e07dc:    	add	w26, w20, #0xc  // guest 0x10b262, sampled 0
6eae8e07e0:    	mov	w28, w26  // guest 0x10b262, sampled 0
6eae8e07e4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b262, sampled 0
6eae8e07e8:    	and	x16, x16, x26, lsr #7  // guest 0x10b262, sampled 0
6eae8e07ec:    	add	x17, x17, x16  // guest 0x10b262, sampled 0
6eae8e07f0:    	ldp	x16, x17, [x17]  // guest 0x10b262, sampled 0
6eae8e07f4:    	and	w30, w26, #0xfffff003  // guest 0x10b262, sampled 0
6eae8e07f8:    	cmp	w16, w30  // guest 0x10b262, sampled 0
6eae8e07fc:    	b.ne	0x6eae8e2750 <trace+0x22d0>  // guest 0x10b262, sampled 0
6eae8e0800:    	add	x30, x17, w26, uxtw  // guest 0x10b262, sampled 0
6eae8e0804:    	ldapr	w2, [x30]  // guest 0x10b262, sampled 0
6eae8e0808:    	add	w26, w23, #0x7  // guest 0x10b262, sampled 0
6eae8e080c:    	and	w26, w26, #0x7  // guest 0x10b262, sampled 0
6eae8e0810:    	lsl	w26, w26, #4  // guest 0x10b262, sampled 0
6eae8e0814:    	add	w26, w26, #0x1a0  // guest 0x10b262, sampled 0
6eae8e0818:    	sxtw	x26, w26  // guest 0x10b262, sampled 0
6eae8e081c:    	add	x1, x26, x19  // guest 0x10b262, sampled 0
6eae8e0820:    	mov	x0, x19  // guest 0x10b262, sampled 0
6eae8e0824:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b262, sampled 0
6eae8e0828:    	add	x16, x16, #0x484  // guest 0x10b262, sampled 0
6eae8e082c:    	blr	x16  // guest 0x10b262, sampled 0
6eae8e0830:    	sub	w23, w23, #0x1  // guest 0x10b262, sampled 0
6eae8e0834:    	and	w23, w23, #0x7  // guest 0x10b262, sampled 0
6eae8e0838:    	str	w23, [x19, #0x188]  // guest 0x10b262, sampled 0
6eae8e083c:    	sxtw	x26, w23  // guest 0x10b262, sampled 0
6eae8e0840:    	add	x26, x26, x19  // guest 0x10b262, sampled 0
6eae8e0844:    	strb	wzr, [x26, #0x190]  // guest 0x10b262, sampled 0
6eae8e0848:    	ldr	w26, [x19, #0x74]  // guest 0x10b262, sampled 0
6eae8e084c:    	strh	w26, [x19, #0x224]  // guest 0x10b262, sampled 0
6eae8e0850:    	str	w28, [x19, #0x230]  // guest 0x10b262, sampled 0
6eae8e0854:    	ldr	w26, [x19, #0x54]  // guest 0x10b262, sampled 0
6eae8e0858:    	strh	w26, [x19, #0x222]  // guest 0x10b262, sampled 0
6eae8e085c:    	mov	w26, #0xb262            // =45666  // guest 0x10b262, sampled 0
6eae8e0860:    	movk	w26, #0x10, lsl #16  // guest 0x10b262, sampled 0
6eae8e0864:    	str	w26, [x19, #0x228]  // guest 0x10b262, sampled 0
6eae8e0868:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b265, sampled 0
6eae8e086c:    	and	x16, x16, x25, lsr #7  // guest 0x10b265, sampled 0
6eae8e0870:    	add	x17, x17, x16  // guest 0x10b265, sampled 0
6eae8e0874:    	ldp	x16, x17, [x17]  // guest 0x10b265, sampled 0
6eae8e0878:    	and	w30, w25, #0xfffff003  // guest 0x10b265, sampled 0
6eae8e087c:    	cmp	w16, w30  // guest 0x10b265, sampled 0
6eae8e0880:    	b.ne	0x6eae8e277c <trace+0x22fc>  // guest 0x10b265, sampled 0
6eae8e0884:    	add	x30, x17, w25, uxtw  // guest 0x10b265, sampled 0
6eae8e0888:    	ldapr	w2, [x30]  // guest 0x10b265, sampled 0
6eae8e088c:    	add	x1, x19, #0x258  // guest 0x10b265, sampled 0
6eae8e0890:    	mov	x0, x19  // guest 0x10b265, sampled 0
6eae8e0894:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b265, sampled 0
6eae8e0898:    	add	x16, x16, #0x484  // guest 0x10b265, sampled 0
6eae8e089c:    	blr	x16  // guest 0x10b265, sampled 0
6eae8e08a0:    	lsl	w26, w23, #4  // guest 0x10b265, sampled 0
6eae8e08a4:    	add	w26, w26, #0x1a0  // guest 0x10b265, sampled 0
6eae8e08a8:    	sxtw	x26, w26  // guest 0x10b265, sampled 0
6eae8e08ac:    	add	x1, x26, x19  // guest 0x10b265, sampled 0
6eae8e08b0:    	add	x2, x19, #0x258  // guest 0x10b265, sampled 0
6eae8e08b4:    	mov	x0, x19  // guest 0x10b265, sampled 0
6eae8e08b8:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b265, sampled 0
6eae8e08bc:    	add	x16, x16, #0xb4c  // guest 0x10b265, sampled 0
6eae8e08c0:    	blr	x16  // guest 0x10b265, sampled 0
6eae8e08c4:    	ldr	w26, [x19, #0x74]  // guest 0x10b265, sampled 0
6eae8e08c8:    	strh	w26, [x19, #0x224]  // guest 0x10b265, sampled 1
6eae8e08cc:    	str	w25, [x19, #0x230]  // guest 0x10b265, sampled 0
6eae8e08d0:    	ldr	w26, [x19, #0x54]  // guest 0x10b265, sampled 0
6eae8e08d4:    	strh	w26, [x19, #0x222]  // guest 0x10b265, sampled 0
6eae8e08d8:    	mov	w26, #0xb265            // =45669  // guest 0x10b265, sampled 0
6eae8e08dc:    	movk	w26, #0x10, lsl #16  // guest 0x10b265, sampled 0
6eae8e08e0:    	str	w26, [x19, #0x228]  // guest 0x10b265, sampled 0
6eae8e08e4:    	add	w26, w23, w27  // guest 0x10b267, sampled 0
6eae8e08e8:    	and	w26, w26, #0x7  // guest 0x10b267, sampled 0
6eae8e08ec:    	lsl	w26, w26, #4  // guest 0x10b267, sampled 0
6eae8e08f0:    	add	w26, w26, #0x1a0  // guest 0x10b267, sampled 0
6eae8e08f4:    	sxtw	x26, w26  // guest 0x10b267, sampled 0
6eae8e08f8:    	add	x1, x26, x19  // guest 0x10b267, sampled 0
6eae8e08fc:    	lsl	w26, w23, #4  // guest 0x10b267, sampled 0
6eae8e0900:    	add	w26, w26, #0x1a0  // guest 0x10b267, sampled 0
6eae8e0904:    	sxtw	x26, w26  // guest 0x10b267, sampled 0
6eae8e0908:    	add	x2, x26, x19  // guest 0x10b267, sampled 0
6eae8e090c:    	mov	x0, x19  // guest 0x10b267, sampled 0
6eae8e0910:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b267, sampled 0
6eae8e0914:    	add	x16, x16, #0xa78  // guest 0x10b267, sampled 0
6eae8e0918:    	blr	x16  // guest 0x10b267, sampled 0
6eae8e091c:    	sxtw	x26, w23  // guest 0x10b267, sampled 0
6eae8e0920:    	add	x26, x26, x19  // guest 0x10b267, sampled 0
6eae8e0924:    	strb	w27, [x26, #0x190]  // guest 0x10b267, sampled 0
6eae8e0928:    	add	w23, w23, w27  // guest 0x10b267, sampled 0
6eae8e092c:    	and	w23, w23, #0x7  // guest 0x10b267, sampled 0
6eae8e0930:    	str	w23, [x19, #0x188]  // guest 0x10b267, sampled 0
6eae8e0934:    	ldr	w26, [x19, #0x54]  // guest 0x10b267, sampled 0
6eae8e0938:    	strh	w26, [x19, #0x222]  // guest 0x10b267, sampled 0
6eae8e093c:    	mov	w26, #0xb267            // =45671  // guest 0x10b267, sampled 0
6eae8e0940:    	movk	w26, #0x10, lsl #16  // guest 0x10b267, sampled 0
6eae8e0944:    	str	w26, [x19, #0x228]  // guest 0x10b267, sampled 0
6eae8e0948:    	add	w26, w20, #0x1c  // guest 0x10b269, sampled 0
6eae8e094c:    	mov	w28, w26  // guest 0x10b269, sampled 0
6eae8e0950:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b269, sampled 0
6eae8e0954:    	and	x16, x16, x26, lsr #7  // guest 0x10b269, sampled 0
6eae8e0958:    	add	x17, x17, x16  // guest 0x10b269, sampled 0
6eae8e095c:    	ldp	x16, x17, [x17]  // guest 0x10b269, sampled 0
6eae8e0960:    	and	w30, w26, #0xfffff003  // guest 0x10b269, sampled 0
6eae8e0964:    	cmp	w16, w30  // guest 0x10b269, sampled 0
6eae8e0968:    	b.ne	0x6eae8e27a8 <trace+0x2328>  // guest 0x10b269, sampled 0
6eae8e096c:    	add	x30, x17, w26, uxtw  // guest 0x10b269, sampled 0
6eae8e0970:    	ldapr	w2, [x30]  // guest 0x10b269, sampled 0
6eae8e0974:    	add	w26, w23, #0x7  // guest 0x10b269, sampled 0
6eae8e0978:    	and	w26, w26, #0x7  // guest 0x10b269, sampled 0
6eae8e097c:    	lsl	w26, w26, #4  // guest 0x10b269, sampled 0
6eae8e0980:    	add	w26, w26, #0x1a0  // guest 0x10b269, sampled 0
6eae8e0984:    	sxtw	x26, w26  // guest 0x10b269, sampled 0
6eae8e0988:    	add	x1, x26, x19  // guest 0x10b269, sampled 0
6eae8e098c:    	mov	x0, x19  // guest 0x10b269, sampled 0
6eae8e0990:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b269, sampled 0
6eae8e0994:    	add	x16, x16, #0x484  // guest 0x10b269, sampled 0
6eae8e0998:    	blr	x16  // guest 0x10b269, sampled 0
6eae8e099c:    	sub	w23, w23, #0x1  // guest 0x10b269, sampled 0
6eae8e09a0:    	and	w23, w23, #0x7  // guest 0x10b269, sampled 0
6eae8e09a4:    	str	w23, [x19, #0x188]  // guest 0x10b269, sampled 0
6eae8e09a8:    	sxtw	x26, w23  // guest 0x10b269, sampled 0
6eae8e09ac:    	add	x26, x26, x19  // guest 0x10b269, sampled 0
6eae8e09b0:    	strb	wzr, [x26, #0x190]  // guest 0x10b269, sampled 0
6eae8e09b4:    	ldr	w26, [x19, #0x74]  // guest 0x10b269, sampled 0
6eae8e09b8:    	strh	w26, [x19, #0x224]  // guest 0x10b269, sampled 0
6eae8e09bc:    	str	w28, [x19, #0x230]  // guest 0x10b269, sampled 0
6eae8e09c0:    	ldr	w26, [x19, #0x54]  // guest 0x10b269, sampled 0
6eae8e09c4:    	strh	w26, [x19, #0x222]  // guest 0x10b269, sampled 0
6eae8e09c8:    	mov	w26, #0xb269            // =45673  // guest 0x10b269, sampled 0
6eae8e09cc:    	movk	w26, #0x10, lsl #16  // guest 0x10b269, sampled 0
6eae8e09d0:    	str	w26, [x19, #0x228]  // guest 0x10b269, sampled 0
6eae8e09d4:    	add	w26, w22, #0x4  // guest 0x10b26c, sampled 0
6eae8e09d8:    	mov	w28, w26  // guest 0x10b26c, sampled 0
6eae8e09dc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b26c, sampled 0
6eae8e09e0:    	and	x16, x16, x26, lsr #7  // guest 0x10b26c, sampled 0
6eae8e09e4:    	add	x17, x17, x16  // guest 0x10b26c, sampled 0
6eae8e09e8:    	ldp	x16, x17, [x17]  // guest 0x10b26c, sampled 0
6eae8e09ec:    	and	w30, w26, #0xfffff003  // guest 0x10b26c, sampled 0
6eae8e09f0:    	cmp	w16, w30  // guest 0x10b26c, sampled 0
6eae8e09f4:    	b.ne	0x6eae8e27d4 <trace+0x2354>  // guest 0x10b26c, sampled 0
6eae8e09f8:    	add	x30, x17, w26, uxtw  // guest 0x10b26c, sampled 0
6eae8e09fc:    	ldapr	w2, [x30]  // guest 0x10b26c, sampled 0
6eae8e0a00:    	add	x1, x19, #0x258  // guest 0x10b26c, sampled 1
6eae8e0a04:    	mov	x0, x19  // guest 0x10b26c, sampled 0
6eae8e0a08:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b26c, sampled 0
6eae8e0a0c:    	add	x16, x16, #0x484  // guest 0x10b26c, sampled 0
6eae8e0a10:    	blr	x16  // guest 0x10b26c, sampled 0
6eae8e0a14:    	lsl	w26, w23, #4  // guest 0x10b26c, sampled 0
6eae8e0a18:    	add	w26, w26, #0x1a0  // guest 0x10b26c, sampled 0
6eae8e0a1c:    	sxtw	x26, w26  // guest 0x10b26c, sampled 0
6eae8e0a20:    	add	x1, x26, x19  // guest 0x10b26c, sampled 0
6eae8e0a24:    	add	x2, x19, #0x258  // guest 0x10b26c, sampled 0
6eae8e0a28:    	mov	x0, x19  // guest 0x10b26c, sampled 0
6eae8e0a2c:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b26c, sampled 0
6eae8e0a30:    	add	x16, x16, #0xb4c  // guest 0x10b26c, sampled 0
6eae8e0a34:    	blr	x16  // guest 0x10b26c, sampled 1
6eae8e0a38:    	ldr	w26, [x19, #0x74]  // guest 0x10b26c, sampled 0
6eae8e0a3c:    	strh	w26, [x19, #0x224]  // guest 0x10b26c, sampled 0
6eae8e0a40:    	str	w28, [x19, #0x230]  // guest 0x10b26c, sampled 0
6eae8e0a44:    	ldr	w26, [x19, #0x54]  // guest 0x10b26c, sampled 0
6eae8e0a48:    	strh	w26, [x19, #0x222]  // guest 0x10b26c, sampled 0
6eae8e0a4c:    	mov	w26, #0xb26c            // =45676  // guest 0x10b26c, sampled 0
6eae8e0a50:    	movk	w26, #0x10, lsl #16  // guest 0x10b26c, sampled 0
6eae8e0a54:    	str	w26, [x19, #0x228]  // guest 0x10b26c, sampled 0
6eae8e0a58:    	add	w26, w20, #0x20  // guest 0x10b26f, sampled 0
6eae8e0a5c:    	mov	w28, w26  // guest 0x10b26f, sampled 1
6eae8e0a60:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b26f, sampled 0
6eae8e0a64:    	and	x16, x16, x26, lsr #7  // guest 0x10b26f, sampled 0
6eae8e0a68:    	add	x17, x17, x16  // guest 0x10b26f, sampled 0
6eae8e0a6c:    	ldp	x16, x17, [x17]  // guest 0x10b26f, sampled 0
6eae8e0a70:    	and	w30, w26, #0xfffff003  // guest 0x10b26f, sampled 0
6eae8e0a74:    	cmp	w16, w30  // guest 0x10b26f, sampled 0
6eae8e0a78:    	b.ne	0x6eae8e2800 <trace+0x2380>  // guest 0x10b26f, sampled 0
6eae8e0a7c:    	add	x30, x17, w26, uxtw  // guest 0x10b26f, sampled 0
6eae8e0a80:    	ldapr	w2, [x30]  // guest 0x10b26f, sampled 0
6eae8e0a84:    	add	w26, w23, #0x7  // guest 0x10b26f, sampled 0
6eae8e0a88:    	and	w26, w26, #0x7  // guest 0x10b26f, sampled 0
6eae8e0a8c:    	lsl	w26, w26, #4  // guest 0x10b26f, sampled 0
6eae8e0a90:    	add	w26, w26, #0x1a0  // guest 0x10b26f, sampled 0
6eae8e0a94:    	sxtw	x26, w26  // guest 0x10b26f, sampled 0
6eae8e0a98:    	add	x1, x26, x19  // guest 0x10b26f, sampled 0
6eae8e0a9c:    	mov	x0, x19  // guest 0x10b26f, sampled 0
6eae8e0aa0:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b26f, sampled 0
6eae8e0aa4:    	add	x16, x16, #0x484  // guest 0x10b26f, sampled 0
6eae8e0aa8:    	blr	x16  // guest 0x10b26f, sampled 0
6eae8e0aac:    	sub	w23, w23, #0x1  // guest 0x10b26f, sampled 0
6eae8e0ab0:    	and	w23, w23, #0x7  // guest 0x10b26f, sampled 0
6eae8e0ab4:    	str	w23, [x19, #0x188]  // guest 0x10b26f, sampled 0
6eae8e0ab8:    	sxtw	x26, w23  // guest 0x10b26f, sampled 0
6eae8e0abc:    	add	x26, x26, x19  // guest 0x10b26f, sampled 0
6eae8e0ac0:    	strb	wzr, [x26, #0x190]  // guest 0x10b26f, sampled 0
6eae8e0ac4:    	ldr	w26, [x19, #0x74]  // guest 0x10b26f, sampled 0
6eae8e0ac8:    	strh	w26, [x19, #0x224]  // guest 0x10b26f, sampled 0
6eae8e0acc:    	str	w28, [x19, #0x230]  // guest 0x10b26f, sampled 0
6eae8e0ad0:    	ldr	w26, [x19, #0x54]  // guest 0x10b26f, sampled 0
6eae8e0ad4:    	strh	w26, [x19, #0x222]  // guest 0x10b26f, sampled 0
6eae8e0ad8:    	mov	w26, #0xb26f            // =45679  // guest 0x10b26f, sampled 0
6eae8e0adc:    	movk	w26, #0x10, lsl #16  // guest 0x10b26f, sampled 0
6eae8e0ae0:    	str	w26, [x19, #0x228]  // guest 0x10b26f, sampled 0
6eae8e0ae4:    	add	w26, w22, #0x8  // guest 0x10b272, sampled 0
6eae8e0ae8:    	mov	w28, w26  // guest 0x10b272, sampled 0
6eae8e0aec:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b272, sampled 0
6eae8e0af0:    	and	x16, x16, x26, lsr #7  // guest 0x10b272, sampled 0
6eae8e0af4:    	add	x17, x17, x16  // guest 0x10b272, sampled 0
6eae8e0af8:    	ldp	x16, x17, [x17]  // guest 0x10b272, sampled 0
6eae8e0afc:    	and	w30, w26, #0xfffff003  // guest 0x10b272, sampled 0
6eae8e0b00:    	cmp	w16, w30  // guest 0x10b272, sampled 0
6eae8e0b04:    	b.ne	0x6eae8e282c <trace+0x23ac>  // guest 0x10b272, sampled 0
6eae8e0b08:    	add	x30, x17, w26, uxtw  // guest 0x10b272, sampled 0
6eae8e0b0c:    	ldapr	w2, [x30]  // guest 0x10b272, sampled 0
6eae8e0b10:    	add	x1, x19, #0x258  // guest 0x10b272, sampled 0
6eae8e0b14:    	mov	x0, x19  // guest 0x10b272, sampled 0
6eae8e0b18:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b272, sampled 0
6eae8e0b1c:    	add	x16, x16, #0x484  // guest 0x10b272, sampled 0
6eae8e0b20:    	blr	x16  // guest 0x10b272, sampled 0
6eae8e0b24:    	lsl	w26, w23, #4  // guest 0x10b272, sampled 0
6eae8e0b28:    	add	w26, w26, #0x1a0  // guest 0x10b272, sampled 0
6eae8e0b2c:    	sxtw	x26, w26  // guest 0x10b272, sampled 0
6eae8e0b30:    	add	x1, x26, x19  // guest 0x10b272, sampled 0
6eae8e0b34:    	add	x2, x19, #0x258  // guest 0x10b272, sampled 0
6eae8e0b38:    	mov	x0, x19  // guest 0x10b272, sampled 0
6eae8e0b3c:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b272, sampled 0
6eae8e0b40:    	add	x16, x16, #0xb4c  // guest 0x10b272, sampled 0
6eae8e0b44:    	blr	x16  // guest 0x10b272, sampled 0
6eae8e0b48:    	ldr	w26, [x19, #0x74]  // guest 0x10b272, sampled 0
6eae8e0b4c:    	strh	w26, [x19, #0x224]  // guest 0x10b272, sampled 0
6eae8e0b50:    	str	w28, [x19, #0x230]  // guest 0x10b272, sampled 0
6eae8e0b54:    	ldr	w26, [x19, #0x54]  // guest 0x10b272, sampled 0
6eae8e0b58:    	strh	w26, [x19, #0x222]  // guest 0x10b272, sampled 0
6eae8e0b5c:    	mov	w26, #0xb272            // =45682  // guest 0x10b272, sampled 0
6eae8e0b60:    	movk	w26, #0x10, lsl #16  // guest 0x10b272, sampled 0
6eae8e0b64:    	str	w26, [x19, #0x228]  // guest 0x10b272, sampled 0
6eae8e0b68:    	add	w26, w23, w27  // guest 0x10b275, sampled 0
6eae8e0b6c:    	and	w26, w26, #0x7  // guest 0x10b275, sampled 0
6eae8e0b70:    	lsl	w26, w26, #4  // guest 0x10b275, sampled 0
6eae8e0b74:    	add	w26, w26, #0x1a0  // guest 0x10b275, sampled 0
6eae8e0b78:    	sxtw	x26, w26  // guest 0x10b275, sampled 0
6eae8e0b7c:    	add	x1, x26, x19  // guest 0x10b275, sampled 0
6eae8e0b80:    	lsl	w26, w23, #4  // guest 0x10b275, sampled 0
6eae8e0b84:    	add	w26, w26, #0x1a0  // guest 0x10b275, sampled 0
6eae8e0b88:    	sxtw	x26, w26  // guest 0x10b275, sampled 0
6eae8e0b8c:    	add	x2, x26, x19  // guest 0x10b275, sampled 0
6eae8e0b90:    	mov	x0, x19  // guest 0x10b275, sampled 0
6eae8e0b94:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b275, sampled 0
6eae8e0b98:    	add	x16, x16, #0xa78  // guest 0x10b275, sampled 0
6eae8e0b9c:    	blr	x16  // guest 0x10b275, sampled 0
6eae8e0ba0:    	sxtw	x26, w23  // guest 0x10b275, sampled 0
6eae8e0ba4:    	add	x26, x26, x19  // guest 0x10b275, sampled 0
6eae8e0ba8:    	strb	w27, [x26, #0x190]  // guest 0x10b275, sampled 0
6eae8e0bac:    	add	w23, w23, w27  // guest 0x10b275, sampled 0
6eae8e0bb0:    	and	w23, w23, #0x7  // guest 0x10b275, sampled 0
6eae8e0bb4:    	str	w23, [x19, #0x188]  // guest 0x10b275, sampled 0
6eae8e0bb8:    	ldr	w26, [x19, #0x54]  // guest 0x10b275, sampled 0
6eae8e0bbc:    	strh	w26, [x19, #0x222]  // guest 0x10b275, sampled 0
6eae8e0bc0:    	mov	w26, #0xb275            // =45685  // guest 0x10b275, sampled 0
6eae8e0bc4:    	movk	w26, #0x10, lsl #16  // guest 0x10b275, sampled 0
6eae8e0bc8:    	str	w26, [x19, #0x228]  // guest 0x10b275, sampled 0
6eae8e0bcc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b277, sampled 0
6eae8e0bd0:    	and	x16, x16, x25, lsr #7  // guest 0x10b277, sampled 0
6eae8e0bd4:    	add	x17, x17, x16  // guest 0x10b277, sampled 0
6eae8e0bd8:    	ldp	x16, x17, [x17]  // guest 0x10b277, sampled 0
6eae8e0bdc:    	and	w30, w25, #0xfffff003  // guest 0x10b277, sampled 0
6eae8e0be0:    	cmp	w16, w30  // guest 0x10b277, sampled 0
6eae8e0be4:    	b.ne	0x6eae8e2858 <trace+0x23d8>  // guest 0x10b277, sampled 0
6eae8e0be8:    	add	x30, x17, w25, uxtw  // guest 0x10b277, sampled 0
6eae8e0bec:    	ldapr	w2, [x30]  // guest 0x10b277, sampled 0
6eae8e0bf0:    	add	w26, w23, #0x7  // guest 0x10b277, sampled 0
6eae8e0bf4:    	and	w26, w26, #0x7  // guest 0x10b277, sampled 0
6eae8e0bf8:    	lsl	w26, w26, #4  // guest 0x10b277, sampled 0
6eae8e0bfc:    	add	w26, w26, #0x1a0  // guest 0x10b277, sampled 0
6eae8e0c00:    	sxtw	x26, w26  // guest 0x10b277, sampled 0
6eae8e0c04:    	add	x1, x26, x19  // guest 0x10b277, sampled 0
6eae8e0c08:    	mov	x0, x19  // guest 0x10b277, sampled 0
6eae8e0c0c:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b277, sampled 0
6eae8e0c10:    	add	x16, x16, #0x484  // guest 0x10b277, sampled 0
6eae8e0c14:    	blr	x16  // guest 0x10b277, sampled 0
6eae8e0c18:    	sub	w23, w23, #0x1  // guest 0x10b277, sampled 0
6eae8e0c1c:    	and	w23, w23, #0x7  // guest 0x10b277, sampled 0
6eae8e0c20:    	str	w23, [x19, #0x188]  // guest 0x10b277, sampled 0
6eae8e0c24:    	sxtw	x26, w23  // guest 0x10b277, sampled 0
6eae8e0c28:    	add	x26, x26, x19  // guest 0x10b277, sampled 0
6eae8e0c2c:    	strb	wzr, [x26, #0x190]  // guest 0x10b277, sampled 0
6eae8e0c30:    	ldr	w26, [x19, #0x74]  // guest 0x10b277, sampled 0
6eae8e0c34:    	strh	w26, [x19, #0x224]  // guest 0x10b277, sampled 0
6eae8e0c38:    	str	w25, [x19, #0x230]  // guest 0x10b277, sampled 0
6eae8e0c3c:    	ldr	w26, [x19, #0x54]  // guest 0x10b277, sampled 0
6eae8e0c40:    	strh	w26, [x19, #0x222]  // guest 0x10b277, sampled 0
6eae8e0c44:    	mov	w26, #0xb277            // =45687  // guest 0x10b277, sampled 0
6eae8e0c48:    	movk	w26, #0x10, lsl #16  // guest 0x10b277, sampled 0
6eae8e0c4c:    	str	w26, [x19, #0x228]  // guest 0x10b277, sampled 0
6eae8e0c50:    	add	w26, w20, #0x18  // guest 0x10b279, sampled 0
6eae8e0c54:    	mov	w28, w26  // guest 0x10b279, sampled 0
6eae8e0c58:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b279, sampled 0
6eae8e0c5c:    	and	x16, x16, x26, lsr #7  // guest 0x10b279, sampled 0
6eae8e0c60:    	add	x17, x17, x16  // guest 0x10b279, sampled 0
6eae8e0c64:    	ldp	x16, x17, [x17]  // guest 0x10b279, sampled 0
6eae8e0c68:    	and	w30, w26, #0xfffff003  // guest 0x10b279, sampled 0
6eae8e0c6c:    	cmp	w16, w30  // guest 0x10b279, sampled 0
6eae8e0c70:    	b.ne	0x6eae8e2884 <trace+0x2404>  // guest 0x10b279, sampled 0
6eae8e0c74:    	add	x30, x17, w26, uxtw  // guest 0x10b279, sampled 0
6eae8e0c78:    	ldapr	w2, [x30]  // guest 0x10b279, sampled 0
6eae8e0c7c:    	add	x1, x19, #0x258  // guest 0x10b279, sampled 0
6eae8e0c80:    	mov	x0, x19  // guest 0x10b279, sampled 0
6eae8e0c84:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b279, sampled 0
6eae8e0c88:    	add	x16, x16, #0x484  // guest 0x10b279, sampled 0
6eae8e0c8c:    	blr	x16  // guest 0x10b279, sampled 0
6eae8e0c90:    	lsl	w26, w23, #4  // guest 0x10b279, sampled 0
6eae8e0c94:    	add	w26, w26, #0x1a0  // guest 0x10b279, sampled 0
6eae8e0c98:    	sxtw	x26, w26  // guest 0x10b279, sampled 0
6eae8e0c9c:    	add	x1, x26, x19  // guest 0x10b279, sampled 0
6eae8e0ca0:    	add	x2, x19, #0x258  // guest 0x10b279, sampled 0
6eae8e0ca4:    	mov	x0, x19  // guest 0x10b279, sampled 0
6eae8e0ca8:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b279, sampled 0
6eae8e0cac:    	add	x16, x16, #0xb4c  // guest 0x10b279, sampled 0
6eae8e0cb0:    	blr	x16  // guest 0x10b279, sampled 0
6eae8e0cb4:    	ldr	w26, [x19, #0x74]  // guest 0x10b279, sampled 0
6eae8e0cb8:    	strh	w26, [x19, #0x224]  // guest 0x10b279, sampled 0
6eae8e0cbc:    	str	w28, [x19, #0x230]  // guest 0x10b279, sampled 0
6eae8e0cc0:    	ldr	w26, [x19, #0x54]  // guest 0x10b279, sampled 0
6eae8e0cc4:    	strh	w26, [x19, #0x222]  // guest 0x10b279, sampled 0
6eae8e0cc8:    	mov	w26, #0xb279            // =45689  // guest 0x10b279, sampled 0
6eae8e0ccc:    	movk	w26, #0x10, lsl #16  // guest 0x10b279, sampled 0
6eae8e0cd0:    	str	w26, [x19, #0x228]  // guest 0x10b279, sampled 0
6eae8e0cd4:    	add	w26, w23, w27  // guest 0x10b27c, sampled 0
6eae8e0cd8:    	and	w26, w26, #0x7  // guest 0x10b27c, sampled 1
6eae8e0cdc:    	lsl	w26, w26, #4  // guest 0x10b27c, sampled 0
6eae8e0ce0:    	add	w26, w26, #0x1a0  // guest 0x10b27c, sampled 0
6eae8e0ce4:    	sxtw	x26, w26  // guest 0x10b27c, sampled 0
6eae8e0ce8:    	add	x1, x26, x19  // guest 0x10b27c, sampled 0
6eae8e0cec:    	lsl	w26, w23, #4  // guest 0x10b27c, sampled 0
6eae8e0cf0:    	add	w26, w26, #0x1a0  // guest 0x10b27c, sampled 0
6eae8e0cf4:    	sxtw	x26, w26  // guest 0x10b27c, sampled 0
6eae8e0cf8:    	add	x2, x26, x19  // guest 0x10b27c, sampled 0
6eae8e0cfc:    	mov	x0, x19  // guest 0x10b27c, sampled 0
6eae8e0d00:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b27c, sampled 0
6eae8e0d04:    	add	x16, x16, #0xa78  // guest 0x10b27c, sampled 0
6eae8e0d08:    	blr	x16  // guest 0x10b27c, sampled 0
6eae8e0d0c:    	sxtw	x26, w23  // guest 0x10b27c, sampled 0
6eae8e0d10:    	add	x26, x26, x19  // guest 0x10b27c, sampled 0
6eae8e0d14:    	strb	w27, [x26, #0x190]  // guest 0x10b27c, sampled 0
6eae8e0d18:    	add	w23, w23, w27  // guest 0x10b27c, sampled 0
6eae8e0d1c:    	and	w23, w23, #0x7  // guest 0x10b27c, sampled 0
6eae8e0d20:    	str	w23, [x19, #0x188]  // guest 0x10b27c, sampled 0
6eae8e0d24:    	ldr	w26, [x19, #0x54]  // guest 0x10b27c, sampled 0
6eae8e0d28:    	strh	w26, [x19, #0x222]  // guest 0x10b27c, sampled 0
6eae8e0d2c:    	mov	w26, #0xb27c            // =45692  // guest 0x10b27c, sampled 0
6eae8e0d30:    	movk	w26, #0x10, lsl #16  // guest 0x10b27c, sampled 0
6eae8e0d34:    	str	w26, [x19, #0x228]  // guest 0x10b27c, sampled 0
6eae8e0d38:    	add	w26, w20, #0x28  // guest 0x10b27e, sampled 0
6eae8e0d3c:    	mov	w28, w26  // guest 0x10b27e, sampled 0
6eae8e0d40:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b27e, sampled 0
6eae8e0d44:    	and	x16, x16, x26, lsr #7  // guest 0x10b27e, sampled 0
6eae8e0d48:    	add	x17, x17, x16  // guest 0x10b27e, sampled 0
6eae8e0d4c:    	ldp	x16, x17, [x17]  // guest 0x10b27e, sampled 0
6eae8e0d50:    	and	w30, w26, #0xfffff003  // guest 0x10b27e, sampled 0
6eae8e0d54:    	cmp	w16, w30  // guest 0x10b27e, sampled 0
6eae8e0d58:    	b.ne	0x6eae8e28b0 <trace+0x2430>  // guest 0x10b27e, sampled 0
6eae8e0d5c:    	add	x30, x17, w26, uxtw  // guest 0x10b27e, sampled 0
6eae8e0d60:    	ldapr	w2, [x30]  // guest 0x10b27e, sampled 0
6eae8e0d64:    	add	w26, w23, #0x7  // guest 0x10b27e, sampled 0
6eae8e0d68:    	and	w26, w26, #0x7  // guest 0x10b27e, sampled 0
6eae8e0d6c:    	lsl	w26, w26, #4  // guest 0x10b27e, sampled 0
6eae8e0d70:    	add	w26, w26, #0x1a0  // guest 0x10b27e, sampled 0
6eae8e0d74:    	sxtw	x26, w26  // guest 0x10b27e, sampled 0
6eae8e0d78:    	add	x1, x26, x19  // guest 0x10b27e, sampled 0
6eae8e0d7c:    	mov	x0, x19  // guest 0x10b27e, sampled 0
6eae8e0d80:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b27e, sampled 0
6eae8e0d84:    	add	x16, x16, #0x484  // guest 0x10b27e, sampled 0
6eae8e0d88:    	blr	x16  // guest 0x10b27e, sampled 0
6eae8e0d8c:    	sub	w23, w23, #0x1  // guest 0x10b27e, sampled 0
6eae8e0d90:    	and	w23, w23, #0x7  // guest 0x10b27e, sampled 0
6eae8e0d94:    	str	w23, [x19, #0x188]  // guest 0x10b27e, sampled 0
6eae8e0d98:    	sxtw	x26, w23  // guest 0x10b27e, sampled 0
6eae8e0d9c:    	add	x26, x26, x19  // guest 0x10b27e, sampled 0
6eae8e0da0:    	strb	wzr, [x26, #0x190]  // guest 0x10b27e, sampled 0
6eae8e0da4:    	ldr	w26, [x19, #0x74]  // guest 0x10b27e, sampled 0
6eae8e0da8:    	strh	w26, [x19, #0x224]  // guest 0x10b27e, sampled 0
6eae8e0dac:    	str	w28, [x19, #0x230]  // guest 0x10b27e, sampled 0
6eae8e0db0:    	ldr	w26, [x19, #0x54]  // guest 0x10b27e, sampled 0
6eae8e0db4:    	strh	w26, [x19, #0x222]  // guest 0x10b27e, sampled 0
6eae8e0db8:    	mov	w26, #0xb27e            // =45694  // guest 0x10b27e, sampled 0
6eae8e0dbc:    	movk	w26, #0x10, lsl #16  // guest 0x10b27e, sampled 0
6eae8e0dc0:    	str	w26, [x19, #0x228]  // guest 0x10b27e, sampled 0
6eae8e0dc4:    	add	w26, w22, #0x4  // guest 0x10b281, sampled 0
6eae8e0dc8:    	mov	w28, w26  // guest 0x10b281, sampled 0
6eae8e0dcc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b281, sampled 0
6eae8e0dd0:    	and	x16, x16, x26, lsr #7  // guest 0x10b281, sampled 0
6eae8e0dd4:    	add	x17, x17, x16  // guest 0x10b281, sampled 0
6eae8e0dd8:    	ldp	x16, x17, [x17]  // guest 0x10b281, sampled 0
6eae8e0ddc:    	and	w30, w26, #0xfffff003  // guest 0x10b281, sampled 0
6eae8e0de0:    	cmp	w16, w30  // guest 0x10b281, sampled 0
6eae8e0de4:    	b.ne	0x6eae8e28dc <trace+0x245c>  // guest 0x10b281, sampled 0
6eae8e0de8:    	add	x30, x17, w26, uxtw  // guest 0x10b281, sampled 0
6eae8e0dec:    	ldapr	w2, [x30]  // guest 0x10b281, sampled 0
6eae8e0df0:    	add	x1, x19, #0x258  // guest 0x10b281, sampled 0
6eae8e0df4:    	mov	x0, x19  // guest 0x10b281, sampled 0
6eae8e0df8:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b281, sampled 0
6eae8e0dfc:    	add	x16, x16, #0x484  // guest 0x10b281, sampled 0
6eae8e0e00:    	blr	x16  // guest 0x10b281, sampled 0
6eae8e0e04:    	lsl	w26, w23, #4  // guest 0x10b281, sampled 0
6eae8e0e08:    	add	w26, w26, #0x1a0  // guest 0x10b281, sampled 0
6eae8e0e0c:    	sxtw	x26, w26  // guest 0x10b281, sampled 0
6eae8e0e10:    	add	x1, x26, x19  // guest 0x10b281, sampled 0
6eae8e0e14:    	add	x2, x19, #0x258  // guest 0x10b281, sampled 0
6eae8e0e18:    	mov	x0, x19  // guest 0x10b281, sampled 0
6eae8e0e1c:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b281, sampled 0
6eae8e0e20:    	add	x16, x16, #0xb4c  // guest 0x10b281, sampled 0
6eae8e0e24:    	blr	x16  // guest 0x10b281, sampled 0
6eae8e0e28:    	ldr	w26, [x19, #0x74]  // guest 0x10b281, sampled 0
6eae8e0e2c:    	strh	w26, [x19, #0x224]  // guest 0x10b281, sampled 0
6eae8e0e30:    	str	w28, [x19, #0x230]  // guest 0x10b281, sampled 0
6eae8e0e34:    	ldr	w26, [x19, #0x54]  // guest 0x10b281, sampled 0
6eae8e0e38:    	strh	w26, [x19, #0x222]  // guest 0x10b281, sampled 0
6eae8e0e3c:    	mov	w26, #0xb281            // =45697  // guest 0x10b281, sampled 0
6eae8e0e40:    	movk	w26, #0x10, lsl #16  // guest 0x10b281, sampled 0
6eae8e0e44:    	str	w26, [x19, #0x228]  // guest 0x10b281, sampled 0
6eae8e0e48:    	add	w26, w20, #0x2c  // guest 0x10b284, sampled 0
6eae8e0e4c:    	mov	w28, w26  // guest 0x10b284, sampled 0
6eae8e0e50:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b284, sampled 0
6eae8e0e54:    	and	x16, x16, x26, lsr #7  // guest 0x10b284, sampled 0
6eae8e0e58:    	add	x17, x17, x16  // guest 0x10b284, sampled 0
6eae8e0e5c:    	ldp	x16, x17, [x17]  // guest 0x10b284, sampled 0
6eae8e0e60:    	and	w30, w26, #0xfffff003  // guest 0x10b284, sampled 0
6eae8e0e64:    	cmp	w16, w30  // guest 0x10b284, sampled 0
6eae8e0e68:    	b.ne	0x6eae8e2908 <trace+0x2488>  // guest 0x10b284, sampled 0
6eae8e0e6c:    	add	x30, x17, w26, uxtw  // guest 0x10b284, sampled 0
6eae8e0e70:    	ldapr	w2, [x30]  // guest 0x10b284, sampled 0
6eae8e0e74:    	add	w26, w23, #0x7  // guest 0x10b284, sampled 0
6eae8e0e78:    	and	w26, w26, #0x7  // guest 0x10b284, sampled 0
6eae8e0e7c:    	lsl	w26, w26, #4  // guest 0x10b284, sampled 0
6eae8e0e80:    	add	w26, w26, #0x1a0  // guest 0x10b284, sampled 0
6eae8e0e84:    	sxtw	x26, w26  // guest 0x10b284, sampled 0
6eae8e0e88:    	add	x1, x26, x19  // guest 0x10b284, sampled 0
6eae8e0e8c:    	mov	x0, x19  // guest 0x10b284, sampled 0
6eae8e0e90:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b284, sampled 0
6eae8e0e94:    	add	x16, x16, #0x484  // guest 0x10b284, sampled 0
6eae8e0e98:    	blr	x16  // guest 0x10b284, sampled 0
6eae8e0e9c:    	sub	w23, w23, #0x1  // guest 0x10b284, sampled 0
6eae8e0ea0:    	and	w23, w23, #0x7  // guest 0x10b284, sampled 0
6eae8e0ea4:    	str	w23, [x19, #0x188]  // guest 0x10b284, sampled 0
6eae8e0ea8:    	sxtw	x26, w23  // guest 0x10b284, sampled 0
6eae8e0eac:    	add	x26, x26, x19  // guest 0x10b284, sampled 0
6eae8e0eb0:    	strb	wzr, [x26, #0x190]  // guest 0x10b284, sampled 0
6eae8e0eb4:    	ldr	w26, [x19, #0x74]  // guest 0x10b284, sampled 0
6eae8e0eb8:    	strh	w26, [x19, #0x224]  // guest 0x10b284, sampled 0
6eae8e0ebc:    	str	w28, [x19, #0x230]  // guest 0x10b284, sampled 0
6eae8e0ec0:    	ldr	w26, [x19, #0x54]  // guest 0x10b284, sampled 0
6eae8e0ec4:    	strh	w26, [x19, #0x222]  // guest 0x10b284, sampled 0
6eae8e0ec8:    	mov	w26, #0xb284            // =45700  // guest 0x10b284, sampled 0
6eae8e0ecc:    	movk	w26, #0x10, lsl #16  // guest 0x10b284, sampled 0
6eae8e0ed0:    	str	w26, [x19, #0x228]  // guest 0x10b284, sampled 0
6eae8e0ed4:    	add	w22, w22, #0x8  // guest 0x10b287, sampled 0
6eae8e0ed8:    	mov	w26, w22  // guest 0x10b287, sampled 0
6eae8e0edc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b287, sampled 0
6eae8e0ee0:    	and	x16, x16, x22, lsr #7  // guest 0x10b287, sampled 0
6eae8e0ee4:    	add	x17, x17, x16  // guest 0x10b287, sampled 0
6eae8e0ee8:    	ldp	x16, x17, [x17]  // guest 0x10b287, sampled 0
6eae8e0eec:    	and	w30, w22, #0xfffff003  // guest 0x10b287, sampled 0
6eae8e0ef0:    	cmp	w16, w30  // guest 0x10b287, sampled 1
6eae8e0ef4:    	b.ne	0x6eae8e2934 <trace+0x24b4>  // guest 0x10b287, sampled 0
6eae8e0ef8:    	add	x30, x17, w22, uxtw  // guest 0x10b287, sampled 0
6eae8e0efc:    	ldapr	w2, [x30]  // guest 0x10b287, sampled 0
6eae8e0f00:    	add	x1, x19, #0x258  // guest 0x10b287, sampled 0
6eae8e0f04:    	mov	x0, x19  // guest 0x10b287, sampled 0
6eae8e0f08:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b287, sampled 0
6eae8e0f0c:    	add	x16, x16, #0x484  // guest 0x10b287, sampled 0
6eae8e0f10:    	blr	x16  // guest 0x10b287, sampled 0
6eae8e0f14:    	lsl	w22, w23, #4  // guest 0x10b287, sampled 0
6eae8e0f18:    	add	w22, w22, #0x1a0  // guest 0x10b287, sampled 0
6eae8e0f1c:    	sxtw	x22, w22  // guest 0x10b287, sampled 0
6eae8e0f20:    	add	x1, x22, x19  // guest 0x10b287, sampled 0
6eae8e0f24:    	add	x2, x19, #0x258  // guest 0x10b287, sampled 0
6eae8e0f28:    	mov	x0, x19  // guest 0x10b287, sampled 0
6eae8e0f2c:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b287, sampled 0
6eae8e0f30:    	add	x16, x16, #0xb4c  // guest 0x10b287, sampled 0
6eae8e0f34:    	blr	x16  // guest 0x10b287, sampled 0
6eae8e0f38:    	ldr	w22, [x19, #0x74]  // guest 0x10b287, sampled 0
6eae8e0f3c:    	strh	w22, [x19, #0x224]  // guest 0x10b287, sampled 0
6eae8e0f40:    	str	w26, [x19, #0x230]  // guest 0x10b287, sampled 0
6eae8e0f44:    	ldr	w22, [x19, #0x54]  // guest 0x10b287, sampled 0
6eae8e0f48:    	strh	w22, [x19, #0x222]  // guest 0x10b287, sampled 0
6eae8e0f4c:    	mov	w22, #0xb287            // =45703  // guest 0x10b287, sampled 0
6eae8e0f50:    	movk	w22, #0x10, lsl #16  // guest 0x10b287, sampled 0
6eae8e0f54:    	str	w22, [x19, #0x228]  // guest 0x10b287, sampled 0
6eae8e0f58:    	add	w22, w23, w27  // guest 0x10b28a, sampled 0
6eae8e0f5c:    	and	w22, w22, #0x7  // guest 0x10b28a, sampled 0
6eae8e0f60:    	lsl	w22, w22, #4  // guest 0x10b28a, sampled 0
6eae8e0f64:    	add	w22, w22, #0x1a0  // guest 0x10b28a, sampled 0
6eae8e0f68:    	sxtw	x22, w22  // guest 0x10b28a, sampled 0
6eae8e0f6c:    	add	x1, x22, x19  // guest 0x10b28a, sampled 0
6eae8e0f70:    	lsl	w22, w23, #4  // guest 0x10b28a, sampled 0
6eae8e0f74:    	add	w22, w22, #0x1a0  // guest 0x10b28a, sampled 0
6eae8e0f78:    	sxtw	x22, w22  // guest 0x10b28a, sampled 0
6eae8e0f7c:    	add	x2, x22, x19  // guest 0x10b28a, sampled 0
6eae8e0f80:    	mov	x0, x19  // guest 0x10b28a, sampled 0
6eae8e0f84:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b28a, sampled 0
6eae8e0f88:    	add	x16, x16, #0xa78  // guest 0x10b28a, sampled 0
6eae8e0f8c:    	blr	x16  // guest 0x10b28a, sampled 0
6eae8e0f90:    	sxtw	x22, w23  // guest 0x10b28a, sampled 0
6eae8e0f94:    	add	x22, x22, x19  // guest 0x10b28a, sampled 0
6eae8e0f98:    	strb	w27, [x22, #0x190]  // guest 0x10b28a, sampled 0
6eae8e0f9c:    	add	w22, w23, w27  // guest 0x10b28a, sampled 0
6eae8e0fa0:    	and	w22, w22, #0x7  // guest 0x10b28a, sampled 0
6eae8e0fa4:    	str	w22, [x19, #0x188]  // guest 0x10b28a, sampled 0
6eae8e0fa8:    	ldr	w23, [x19, #0x54]  // guest 0x10b28a, sampled 0
6eae8e0fac:    	strh	w23, [x19, #0x222]  // guest 0x10b28a, sampled 0
6eae8e0fb0:    	mov	w23, #0xb28a            // =45706  // guest 0x10b28a, sampled 0
6eae8e0fb4:    	movk	w23, #0x10, lsl #16  // guest 0x10b28a, sampled 0
6eae8e0fb8:    	str	w23, [x19, #0x228]  // guest 0x10b28a, sampled 0
6eae8e0fbc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b28c, sampled 0
6eae8e0fc0:    	and	x16, x16, x25, lsr #7  // guest 0x10b28c, sampled 0
6eae8e0fc4:    	add	x17, x17, x16  // guest 0x10b28c, sampled 0
6eae8e0fc8:    	ldp	x16, x17, [x17]  // guest 0x10b28c, sampled 0
6eae8e0fcc:    	and	w30, w25, #0xfffff003  // guest 0x10b28c, sampled 0
6eae8e0fd0:    	cmp	w16, w30  // guest 0x10b28c, sampled 0
6eae8e0fd4:    	b.ne	0x6eae8e2960 <trace+0x24e0>  // guest 0x10b28c, sampled 0
6eae8e0fd8:    	add	x30, x17, w25, uxtw  // guest 0x10b28c, sampled 1
6eae8e0fdc:    	ldapr	w2, [x30]  // guest 0x10b28c, sampled 0
6eae8e0fe0:    	add	w23, w22, #0x7  // guest 0x10b28c, sampled 0
6eae8e0fe4:    	and	w23, w23, #0x7  // guest 0x10b28c, sampled 0
6eae8e0fe8:    	lsl	w23, w23, #4  // guest 0x10b28c, sampled 0
6eae8e0fec:    	add	w23, w23, #0x1a0  // guest 0x10b28c, sampled 0
6eae8e0ff0:    	sxtw	x23, w23  // guest 0x10b28c, sampled 0
6eae8e0ff4:    	add	x1, x23, x19  // guest 0x10b28c, sampled 0
6eae8e0ff8:    	mov	x0, x19  // guest 0x10b28c, sampled 0
6eae8e0ffc:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b28c, sampled 0
6eae8e1000:    	add	x16, x16, #0x484  // guest 0x10b28c, sampled 0
6eae8e1004:    	blr	x16  // guest 0x10b28c, sampled 0
6eae8e1008:    	sub	w22, w22, #0x1  // guest 0x10b28c, sampled 0
6eae8e100c:    	and	w22, w22, #0x7  // guest 0x10b28c, sampled 0
6eae8e1010:    	str	w22, [x19, #0x188]  // guest 0x10b28c, sampled 0
6eae8e1014:    	sxtw	x23, w22  // guest 0x10b28c, sampled 0
6eae8e1018:    	add	x23, x23, x19  // guest 0x10b28c, sampled 0
6eae8e101c:    	strb	wzr, [x23, #0x190]  // guest 0x10b28c, sampled 0
6eae8e1020:    	ldr	w23, [x19, #0x74]  // guest 0x10b28c, sampled 0
6eae8e1024:    	strh	w23, [x19, #0x224]  // guest 0x10b28c, sampled 0
6eae8e1028:    	str	w25, [x19, #0x230]  // guest 0x10b28c, sampled 0
6eae8e102c:    	ldr	w23, [x19, #0x54]  // guest 0x10b28c, sampled 0
6eae8e1030:    	strh	w23, [x19, #0x222]  // guest 0x10b28c, sampled 0
6eae8e1034:    	mov	w23, #0xb28c            // =45708  // guest 0x10b28c, sampled 0
6eae8e1038:    	movk	w23, #0x10, lsl #16  // guest 0x10b28c, sampled 0
6eae8e103c:    	str	w23, [x19, #0x228]  // guest 0x10b28c, sampled 0
6eae8e1040:    	add	w21, w21, #0x118  // guest 0x10b28e, sampled 0
6eae8e1044:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b28e, sampled 0
6eae8e1048:    	and	x16, x16, x21, lsr #7  // guest 0x10b28e, sampled 0
6eae8e104c:    	add	x17, x17, x16  // guest 0x10b28e, sampled 0
6eae8e1050:    	ldp	x16, x17, [x17]  // guest 0x10b28e, sampled 0
6eae8e1054:    	and	w30, w21, #0xfffff003  // guest 0x10b28e, sampled 0
6eae8e1058:    	cmp	w16, w30  // guest 0x10b28e, sampled 0
6eae8e105c:    	b.ne	0x6eae8e298c <trace+0x250c>  // guest 0x10b28e, sampled 0
6eae8e1060:    	add	x30, x17, w21, uxtw  // guest 0x10b28e, sampled 0
6eae8e1064:    	ldapr	w21, [x30]  // guest 0x10b28e, sampled 0
6eae8e1068:    	str	w21, [x19, #0x4]  // guest 0x10b28e, sampled 0
6eae8e106c:    	add	w20, w20, #0x24  // guest 0x10b294, sampled 0
6eae8e1070:    	mov	w23, w20  // guest 0x10b294, sampled 0
6eae8e1074:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b294, sampled 0
6eae8e1078:    	and	x16, x16, x20, lsr #7  // guest 0x10b294, sampled 0
6eae8e107c:    	add	x17, x17, x16  // guest 0x10b294, sampled 0
6eae8e1080:    	ldp	x16, x17, [x17]  // guest 0x10b294, sampled 0
6eae8e1084:    	and	w30, w20, #0xfffff003  // guest 0x10b294, sampled 0
6eae8e1088:    	cmp	w16, w30  // guest 0x10b294, sampled 0
6eae8e108c:    	b.ne	0x6eae8e29b8 <trace+0x2538>  // guest 0x10b294, sampled 0
6eae8e1090:    	add	x30, x17, w20, uxtw  // guest 0x10b294, sampled 0
6eae8e1094:    	ldapr	w2, [x30]  // guest 0x10b294, sampled 0
6eae8e1098:    	add	x1, x19, #0x258  // guest 0x10b294, sampled 0
6eae8e109c:    	mov	x0, x19  // guest 0x10b294, sampled 0
6eae8e10a0:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfc9000>  // guest 0x10b294, sampled 0
6eae8e10a4:    	add	x16, x16, #0x484  // guest 0x10b294, sampled 0
6eae8e10a8:    	blr	x16  // guest 0x10b294, sampled 0
6eae8e10ac:    	lsl	w20, w22, #4  // guest 0x10b294, sampled 0
6eae8e10b0:    	add	w20, w20, #0x1a0  // guest 0x10b294, sampled 0
6eae8e10b4:    	sxtw	x20, w20  // guest 0x10b294, sampled 0
6eae8e10b8:    	add	x1, x20, x19  // guest 0x10b294, sampled 0
6eae8e10bc:    	add	x2, x19, #0x258  // guest 0x10b294, sampled 0
6eae8e10c0:    	mov	x0, x19  // guest 0x10b294, sampled 0
6eae8e10c4:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfca000>  // guest 0x10b294, sampled 0
6eae8e10c8:    	add	x16, x16, #0xb4c  // guest 0x10b294, sampled 0
6eae8e10cc:    	blr	x16  // guest 0x10b294, sampled 0
6eae8e10d0:    	ldr	w20, [x19, #0x74]  // guest 0x10b294, sampled 0
6eae8e10d4:    	strh	w20, [x19, #0x224]  // guest 0x10b294, sampled 0
6eae8e10d8:    	str	w23, [x19, #0x230]  // guest 0x10b294, sampled 0
6eae8e10dc:    	ldr	w20, [x19, #0x54]  // guest 0x10b294, sampled 0
6eae8e10e0:    	strh	w20, [x19, #0x222]  // guest 0x10b294, sampled 0
6eae8e10e4:    	mov	w20, #0xb294            // =45716  // guest 0x10b294, sampled 0
6eae8e10e8:    	movk	w20, #0x10, lsl #16  // guest 0x10b294, sampled 0
6eae8e10ec:    	str	w20, [x19, #0x228]  // guest 0x10b294, sampled 0
6eae8e10f0:    	add	w20, w21, w24  // guest 0x10b297, sampled 0
6eae8e10f4:    	str	w20, [x19, #0x4]  // guest 0x10b297, sampled 0
6eae8e10f8:    	str	w20, [x19, #0x28]  // guest 0x10b297, sampled 0
6eae8e10fc:    	add	w20, w22, w27  // guest 0x10b299, sampled 0
6eae8e1100:    	and	w20, w20, #0x7  // guest 0x10b299, sampled 0
6eae8e1104:    	lsl	w20, w20, #4  // guest 0x10b299, sampled 0
6eae8e1108:    	add	w20, w20, #0x1a0  // guest 0x10b299, sampled 0
6eae8e110c:    	sxtw	x20, w20  // guest 0x10b299, sampled 0
6eae8e1110:    	add	x1, x20, x19  // guest 0x10b299, sampled 0
6eae8e1114:    	lsl	w20, w22, #4  // guest 0x10b299, sampled 0
6eae8e1118:    	add	w20, w20, #0x1a0  // guest 0x10b299, sampled 0
6eae8e111c:    	sxtw	x20, w20  // guest 0x10b299, sampled 0
6eae8e1120:    	add	x2, x20, x19  // guest 0x10b299, sampled 0
6eae8e1124:    	mov	x0, x19  // guest 0x10b299, sampled 0
6eae8e1128:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfca000>  // guest 0x10b299, sampled 0
6eae8e112c:    	add	x16, x16, #0xa78  // guest 0x10b299, sampled 0
6eae8e1130:    	blr	x16  // guest 0x10b299, sampled 0
6eae8e1134:    	sxtw	x20, w22  // guest 0x10b299, sampled 0
6eae8e1138:    	add	x20, x20, x19  // guest 0x10b299, sampled 0
6eae8e113c:    	strb	w27, [x20, #0x190]  // guest 0x10b299, sampled 0
6eae8e1140:    	add	w20, w22, w27  // guest 0x10b299, sampled 0
6eae8e1144:    	and	w20, w20, #0x7  // guest 0x10b299, sampled 0
6eae8e1148:    	str	w20, [x19, #0x188]  // guest 0x10b299, sampled 0
6eae8e114c:    	ldr	w21, [x19, #0x54]  // guest 0x10b299, sampled 0
6eae8e1150:    	strh	w21, [x19, #0x222]  // guest 0x10b299, sampled 0
6eae8e1154:    	mov	w21, #0xb299            // =45721  // guest 0x10b299, sampled 0
6eae8e1158:    	movk	w21, #0x10, lsl #16  // guest 0x10b299, sampled 0
6eae8e115c:    	str	w21, [x19, #0x228]  // guest 0x10b299, sampled 0
6eae8e1160:    	ldr	w21, [x19, #0x10]  // guest 0x10b29b, sampled 0
6eae8e1164:    	add	w21, w21, #0xdc  // guest 0x10b29b, sampled 0
6eae8e1168:    	mov	w22, w21  // guest 0x10b29b, sampled 0
6eae8e116c:    	lsl	w23, w20, #4  // guest 0x10b29b, sampled 0
6eae8e1170:    	add	w23, w23, #0x1a0  // guest 0x10b29b, sampled 0
6eae8e1174:    	sxtw	x23, w23  // guest 0x10b29b, sampled 0
6eae8e1178:    	add	x1, x23, x19  // guest 0x10b29b, sampled 0
6eae8e117c:    	mov	x0, x19  // guest 0x10b29b, sampled 0
6eae8e1180:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfc9000>  // guest 0x10b29b, sampled 0
6eae8e1184:    	add	x16, x16, #0x5c0  // guest 0x10b29b, sampled 0
6eae8e1188:    	blr	x16  // guest 0x10b29b, sampled 0
6eae8e118c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b29b, sampled 0
6eae8e1190:    	and	x16, x16, x21, lsr #7  // guest 0x10b29b, sampled 0
6eae8e1194:    	add	x17, x17, x16  // guest 0x10b29b, sampled 0
6eae8e1198:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b29b, sampled 0
6eae8e119c:    	and	w30, w21, #0xfffff003  // guest 0x10b29b, sampled 0
6eae8e11a0:    	cmp	w16, w30  // guest 0x10b29b, sampled 0
6eae8e11a4:    	b.ne	0x6eae8e29e4 <trace+0x2564>  // guest 0x10b29b, sampled 0
6eae8e11a8:    	add	x30, x17, w21, uxtw  // guest 0x10b29b, sampled 1
6eae8e11ac:    	stlr	w0, [x30]  // guest 0x10b29b, sampled 0
6eae8e11b0:    	sxtw	x21, w20  // guest 0x10b29b, sampled 0
6eae8e11b4:    	add	x21, x21, x19  // guest 0x10b29b, sampled 0
6eae8e11b8:    	strb	w27, [x21, #0x190]  // guest 0x10b29b, sampled 0
6eae8e11bc:    	add	w20, w20, w27  // guest 0x10b29b, sampled 0
6eae8e11c0:    	and	w20, w20, #0x7  // guest 0x10b29b, sampled 0
6eae8e11c4:    	str	w20, [x19, #0x188]  // guest 0x10b29b, sampled 0
6eae8e11c8:    	ldr	w20, [x19, #0x64]  // guest 0x10b29b, sampled 0
6eae8e11cc:    	strh	w20, [x19, #0x224]  // guest 0x10b29b, sampled 0
6eae8e11d0:    	str	w22, [x19, #0x230]  // guest 0x10b29b, sampled 0
6eae8e11d4:    	ldr	w20, [x19, #0x54]  // guest 0x10b29b, sampled 0
6eae8e11d8:    	strh	w20, [x19, #0x222]  // guest 0x10b29b, sampled 0
6eae8e11dc:    	mov	w20, #0xb29b            // =45723  // guest 0x10b29b, sampled 0
6eae8e11e0:    	movk	w20, #0x10, lsl #16  // guest 0x10b29b, sampled 0
6eae8e11e4:    	str	w20, [x19, #0x228]  // guest 0x10b29b, sampled 0
6eae8e11e8:    	mov	w1, w27  // guest 0x10b2a2, sampled 0
6eae8e11ec:    	mov	x0, x19  // guest 0x10b2a2, sampled 0
6eae8e11f0:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfca000>  // guest 0x10b2a2, sampled 0
6eae8e11f4:    	add	x16, x16, #0x5a0  // guest 0x10b2a2, sampled 0
6eae8e11f8:    	blr	x16  // guest 0x10b2a2, sampled 0
6eae8e11fc:    	ldr	w20, [x19, #0x54]  // guest 0x10b2a2, sampled 0
6eae8e1200:    	strh	w20, [x19, #0x222]  // guest 0x10b2a2, sampled 0
6eae8e1204:    	mov	w20, #0xb2a2            // =45730  // guest 0x10b2a2, sampled 0
6eae8e1208:    	movk	w20, #0x10, lsl #16  // guest 0x10b2a2, sampled 0
6eae8e120c:    	str	w20, [x19, #0x228]  // guest 0x10b2a2, sampled 0
6eae8e1210:    	ldr	w20, [x19]  // guest 0x10b2a4, sampled 0
6eae8e1214:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2a4, sampled 0
6eae8e1218:    	and	x16, x16, x20, lsr #7  // guest 0x10b2a4, sampled 0
6eae8e121c:    	add	x17, x17, x16  // guest 0x10b2a4, sampled 0
6eae8e1220:    	ldp	x16, x17, [x17]  // guest 0x10b2a4, sampled 0
6eae8e1224:    	and	w30, w20, #0xfffff003  // guest 0x10b2a4, sampled 0
6eae8e1228:    	cmp	w16, w30  // guest 0x10b2a4, sampled 0
6eae8e122c:    	b.ne	0x6eae8e2a10 <trace+0x2590>  // guest 0x10b2a4, sampled 0
6eae8e1230:    	add	x30, x17, w20, uxtw  // guest 0x10b2a4, sampled 0
6eae8e1234:    	ldapr	w2, [x30]  // guest 0x10b2a4, sampled 0
6eae8e1238:    	add	x1, x19, #0x258  // guest 0x10b2a4, sampled 0
6eae8e123c:    	mov	x0, x19  // guest 0x10b2a4, sampled 0
6eae8e1240:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfc9000>  // guest 0x10b2a4, sampled 0
6eae8e1244:    	add	x16, x16, #0x484  // guest 0x10b2a4, sampled 0
6eae8e1248:    	blr	x16  // guest 0x10b2a4, sampled 0
6eae8e124c:    	ldr	w21, [x19, #0x188]  // guest 0x10b2a4, sampled 0
6eae8e1250:    	lsl	w22, w21, #4  // guest 0x10b2a4, sampled 0
6eae8e1254:    	add	w22, w22, #0x1a0  // guest 0x10b2a4, sampled 0
6eae8e1258:    	sxtw	x22, w22  // guest 0x10b2a4, sampled 0
6eae8e125c:    	add	x1, x22, x19  // guest 0x10b2a4, sampled 0
6eae8e1260:    	add	x2, x19, #0x258  // guest 0x10b2a4, sampled 0
6eae8e1264:    	mov	x0, x19  // guest 0x10b2a4, sampled 0
6eae8e1268:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfca000>  // guest 0x10b2a4, sampled 0
6eae8e126c:    	add	x16, x16, #0xa78  // guest 0x10b2a4, sampled 0
6eae8e1270:    	blr	x16  // guest 0x10b2a4, sampled 0
6eae8e1274:    	ldr	w22, [x19, #0x74]  // guest 0x10b2a4, sampled 0
6eae8e1278:    	strh	w22, [x19, #0x224]  // guest 0x10b2a4, sampled 0
6eae8e127c:    	str	w20, [x19, #0x230]  // guest 0x10b2a4, sampled 0
6eae8e1280:    	ldr	w22, [x19, #0x54]  // guest 0x10b2a4, sampled 0
6eae8e1284:    	strh	w22, [x19, #0x222]  // guest 0x10b2a4, sampled 0
6eae8e1288:    	mov	w22, #0xb2a4            // =45732  // guest 0x10b2a4, sampled 0
6eae8e128c:    	movk	w22, #0x10, lsl #16  // guest 0x10b2a4, sampled 0
6eae8e1290:    	str	w22, [x19, #0x228]  // guest 0x10b2a4, sampled 0
6eae8e1294:    	ldr	w22, [x19, #0x10]  // guest 0x10b2a6, sampled 0
6eae8e1298:    	add	w23, w22, #0x44  // guest 0x10b2a6, sampled 0
6eae8e129c:    	mov	w24, w23  // guest 0x10b2a6, sampled 0
6eae8e12a0:    	lsl	w25, w21, #4  // guest 0x10b2a6, sampled 0
6eae8e12a4:    	add	w25, w25, #0x1a0  // guest 0x10b2a6, sampled 0
6eae8e12a8:    	sxtw	x25, w25  // guest 0x10b2a6, sampled 0
6eae8e12ac:    	add	x1, x25, x19  // guest 0x10b2a6, sampled 0
6eae8e12b0:    	mov	x0, x19  // guest 0x10b2a6, sampled 0
6eae8e12b4:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfc9000>  // guest 0x10b2a6, sampled 0
6eae8e12b8:    	add	x16, x16, #0x5c0  // guest 0x10b2a6, sampled 0
6eae8e12bc:    	blr	x16  // guest 0x10b2a6, sampled 0
6eae8e12c0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2a6, sampled 0
6eae8e12c4:    	and	x16, x16, x23, lsr #7  // guest 0x10b2a6, sampled 0
6eae8e12c8:    	add	x17, x17, x16  // guest 0x10b2a6, sampled 0
6eae8e12cc:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b2a6, sampled 0
6eae8e12d0:    	and	w30, w23, #0xfffff003  // guest 0x10b2a6, sampled 0
6eae8e12d4:    	cmp	w16, w30  // guest 0x10b2a6, sampled 0
6eae8e12d8:    	b.ne	0x6eae8e2a3c <trace+0x25bc>  // guest 0x10b2a6, sampled 0
6eae8e12dc:    	add	x30, x17, w23, uxtw  // guest 0x10b2a6, sampled 0
6eae8e12e0:    	stlr	w0, [x30]  // guest 0x10b2a6, sampled 0
6eae8e12e4:    	sxtw	x23, w21  // guest 0x10b2a6, sampled 0
6eae8e12e8:    	add	x23, x23, x19  // guest 0x10b2a6, sampled 0
6eae8e12ec:    	strb	w27, [x23, #0x190]  // guest 0x10b2a6, sampled 0
6eae8e12f0:    	add	w21, w21, w27  // guest 0x10b2a6, sampled 0
6eae8e12f4:    	and	w21, w21, #0x7  // guest 0x10b2a6, sampled 0
6eae8e12f8:    	str	w21, [x19, #0x188]  // guest 0x10b2a6, sampled 0
6eae8e12fc:    	ldr	w23, [x19, #0x64]  // guest 0x10b2a6, sampled 0
6eae8e1300:    	strh	w23, [x19, #0x224]  // guest 0x10b2a6, sampled 0
6eae8e1304:    	str	w24, [x19, #0x230]  // guest 0x10b2a6, sampled 0
6eae8e1308:    	ldr	w23, [x19, #0x54]  // guest 0x10b2a6, sampled 0
6eae8e130c:    	strh	w23, [x19, #0x222]  // guest 0x10b2a6, sampled 0
6eae8e1310:    	mov	w23, #0xb2a6            // =45734  // guest 0x10b2a6, sampled 0
6eae8e1314:    	movk	w23, #0x10, lsl #16  // guest 0x10b2a6, sampled 1
6eae8e1318:    	str	w23, [x19, #0x228]  // guest 0x10b2a6, sampled 0
6eae8e131c:    	add	w23, w20, #0x4  // guest 0x10b2aa, sampled 0
6eae8e1320:    	mov	w24, w23  // guest 0x10b2aa, sampled 0
6eae8e1324:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2aa, sampled 0
6eae8e1328:    	and	x16, x16, x23, lsr #7  // guest 0x10b2aa, sampled 0
6eae8e132c:    	add	x17, x17, x16  // guest 0x10b2aa, sampled 0
6eae8e1330:    	ldp	x16, x17, [x17]  // guest 0x10b2aa, sampled 0
6eae8e1334:    	and	w30, w23, #0xfffff003  // guest 0x10b2aa, sampled 0
6eae8e1338:    	cmp	w16, w30  // guest 0x10b2aa, sampled 0
6eae8e133c:    	b.ne	0x6eae8e2a68 <trace+0x25e8>  // guest 0x10b2aa, sampled 0
6eae8e1340:    	add	x30, x17, w23, uxtw  // guest 0x10b2aa, sampled 0
6eae8e1344:    	ldapr	w2, [x30]  // guest 0x10b2aa, sampled 0
6eae8e1348:    	add	x1, x19, #0x258  // guest 0x10b2aa, sampled 0
6eae8e134c:    	mov	x0, x19  // guest 0x10b2aa, sampled 0
6eae8e1350:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfc9000>  // guest 0x10b2aa, sampled 0
6eae8e1354:    	add	x16, x16, #0x484  // guest 0x10b2aa, sampled 0
6eae8e1358:    	blr	x16  // guest 0x10b2aa, sampled 0
6eae8e135c:    	lsl	w23, w21, #4  // guest 0x10b2aa, sampled 0
6eae8e1360:    	add	w23, w23, #0x1a0  // guest 0x10b2aa, sampled 0
6eae8e1364:    	sxtw	x23, w23  // guest 0x10b2aa, sampled 0
6eae8e1368:    	add	x1, x23, x19  // guest 0x10b2aa, sampled 0
6eae8e136c:    	add	x2, x19, #0x258  // guest 0x10b2aa, sampled 0
6eae8e1370:    	mov	x0, x19  // guest 0x10b2aa, sampled 0
6eae8e1374:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfca000>  // guest 0x10b2aa, sampled 0
6eae8e1378:    	add	x16, x16, #0xa78  // guest 0x10b2aa, sampled 0
6eae8e137c:    	blr	x16  // guest 0x10b2aa, sampled 0
6eae8e1380:    	ldr	w23, [x19, #0x74]  // guest 0x10b2aa, sampled 0
6eae8e1384:    	strh	w23, [x19, #0x224]  // guest 0x10b2aa, sampled 0
6eae8e1388:    	str	w24, [x19, #0x230]  // guest 0x10b2aa, sampled 0
6eae8e138c:    	ldr	w23, [x19, #0x54]  // guest 0x10b2aa, sampled 0
6eae8e1390:    	strh	w23, [x19, #0x222]  // guest 0x10b2aa, sampled 0
6eae8e1394:    	mov	w23, #0xb2aa            // =45738  // guest 0x10b2aa, sampled 0
6eae8e1398:    	movk	w23, #0x10, lsl #16  // guest 0x10b2aa, sampled 0
6eae8e139c:    	str	w23, [x19, #0x228]  // guest 0x10b2aa, sampled 0
6eae8e13a0:    	add	w23, w22, #0x48  // guest 0x10b2ad, sampled 0
6eae8e13a4:    	mov	w24, w23  // guest 0x10b2ad, sampled 0
6eae8e13a8:    	lsl	w25, w21, #4  // guest 0x10b2ad, sampled 0
6eae8e13ac:    	add	w25, w25, #0x1a0  // guest 0x10b2ad, sampled 0
6eae8e13b0:    	sxtw	x25, w25  // guest 0x10b2ad, sampled 0
6eae8e13b4:    	add	x1, x25, x19  // guest 0x10b2ad, sampled 0
6eae8e13b8:    	mov	x0, x19  // guest 0x10b2ad, sampled 0
6eae8e13bc:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfc9000>  // guest 0x10b2ad, sampled 0
6eae8e13c0:    	add	x16, x16, #0x5c0  // guest 0x10b2ad, sampled 0
6eae8e13c4:    	blr	x16  // guest 0x10b2ad, sampled 0
6eae8e13c8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2ad, sampled 0
6eae8e13cc:    	and	x16, x16, x23, lsr #7  // guest 0x10b2ad, sampled 0
6eae8e13d0:    	add	x17, x17, x16  // guest 0x10b2ad, sampled 0
6eae8e13d4:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b2ad, sampled 0
6eae8e13d8:    	and	w30, w23, #0xfffff003  // guest 0x10b2ad, sampled 1
6eae8e13dc:    	cmp	w16, w30  // guest 0x10b2ad, sampled 0
6eae8e13e0:    	b.ne	0x6eae8e2a94 <trace+0x2614>  // guest 0x10b2ad, sampled 0
6eae8e13e4:    	add	x30, x17, w23, uxtw  // guest 0x10b2ad, sampled 0
6eae8e13e8:    	stlr	w0, [x30]  // guest 0x10b2ad, sampled 0
6eae8e13ec:    	sxtw	x23, w21  // guest 0x10b2ad, sampled 1
6eae8e13f0:    	add	x23, x23, x19  // guest 0x10b2ad, sampled 0
6eae8e13f4:    	strb	w27, [x23, #0x190]  // guest 0x10b2ad, sampled 0
6eae8e13f8:    	add	w21, w21, w27  // guest 0x10b2ad, sampled 0
6eae8e13fc:    	and	w21, w21, #0x7  // guest 0x10b2ad, sampled 0
6eae8e1400:    	str	w21, [x19, #0x188]  // guest 0x10b2ad, sampled 0
6eae8e1404:    	ldr	w23, [x19, #0x64]  // guest 0x10b2ad, sampled 0
6eae8e1408:    	strh	w23, [x19, #0x224]  // guest 0x10b2ad, sampled 0
6eae8e140c:    	str	w24, [x19, #0x230]  // guest 0x10b2ad, sampled 0
6eae8e1410:    	ldr	w23, [x19, #0x54]  // guest 0x10b2ad, sampled 0
6eae8e1414:    	strh	w23, [x19, #0x222]  // guest 0x10b2ad, sampled 0
6eae8e1418:    	mov	w23, #0xb2ad            // =45741  // guest 0x10b2ad, sampled 0
6eae8e141c:    	movk	w23, #0x10, lsl #16  // guest 0x10b2ad, sampled 0
6eae8e1420:    	str	w23, [x19, #0x228]  // guest 0x10b2ad, sampled 0
6eae8e1424:    	add	w23, w22, #0xdc  // guest 0x10b2b1, sampled 0
6eae8e1428:    	mov	w24, w23  // guest 0x10b2b1, sampled 0
6eae8e142c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2b1, sampled 0
6eae8e1430:    	and	x16, x16, x23, lsr #7  // guest 0x10b2b1, sampled 0
6eae8e1434:    	add	x17, x17, x16  // guest 0x10b2b1, sampled 0
6eae8e1438:    	ldp	x16, x17, [x17]  // guest 0x10b2b1, sampled 0
6eae8e143c:    	and	w30, w23, #0xfffff003  // guest 0x10b2b1, sampled 0
6eae8e1440:    	cmp	w16, w30  // guest 0x10b2b1, sampled 0
6eae8e1444:    	b.ne	0x6eae8e2ac0 <trace+0x2640>  // guest 0x10b2b1, sampled 0
6eae8e1448:    	add	x30, x17, w23, uxtw  // guest 0x10b2b1, sampled 0
6eae8e144c:    	ldapr	w2, [x30]  // guest 0x10b2b1, sampled 0
6eae8e1450:    	add	w23, w21, #0x7  // guest 0x10b2b1, sampled 1
6eae8e1454:    	and	w23, w23, #0x7  // guest 0x10b2b1, sampled 0
6eae8e1458:    	lsl	w23, w23, #4  // guest 0x10b2b1, sampled 0
6eae8e145c:    	add	w23, w23, #0x1a0  // guest 0x10b2b1, sampled 0
6eae8e1460:    	sxtw	x23, w23  // guest 0x10b2b1, sampled 0
6eae8e1464:    	add	x1, x23, x19  // guest 0x10b2b1, sampled 0
6eae8e1468:    	mov	x0, x19  // guest 0x10b2b1, sampled 0
6eae8e146c:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfc9000>  // guest 0x10b2b1, sampled 0
6eae8e1470:    	add	x16, x16, #0x484  // guest 0x10b2b1, sampled 0
6eae8e1474:    	blr	x16  // guest 0x10b2b1, sampled 0
6eae8e1478:    	sub	w21, w21, #0x1  // guest 0x10b2b1, sampled 0
6eae8e147c:    	and	w21, w21, #0x7  // guest 0x10b2b1, sampled 0
6eae8e1480:    	str	w21, [x19, #0x188]  // guest 0x10b2b1, sampled 0
6eae8e1484:    	sxtw	x23, w21  // guest 0x10b2b1, sampled 0
6eae8e1488:    	add	x23, x23, x19  // guest 0x10b2b1, sampled 0
6eae8e148c:    	strb	wzr, [x23, #0x190]  // guest 0x10b2b1, sampled 0
6eae8e1490:    	ldr	w23, [x19, #0x64]  // guest 0x10b2b1, sampled 0
6eae8e1494:    	strh	w23, [x19, #0x224]  // guest 0x10b2b1, sampled 0
6eae8e1498:    	str	w24, [x19, #0x230]  // guest 0x10b2b1, sampled 0
6eae8e149c:    	ldr	w23, [x19, #0x54]  // guest 0x10b2b1, sampled 0
6eae8e14a0:    	strh	w23, [x19, #0x222]  // guest 0x10b2b1, sampled 0
6eae8e14a4:    	mov	w23, #0xb2b1            // =45745  // guest 0x10b2b1, sampled 0
6eae8e14a8:    	movk	w23, #0x10, lsl #16  // guest 0x10b2b1, sampled 0
6eae8e14ac:    	str	w23, [x19, #0x228]  // guest 0x10b2b1, sampled 0
6eae8e14b0:    	add	w23, w20, #0x8  // guest 0x10b2b8, sampled 0
6eae8e14b4:    	mov	w24, w23  // guest 0x10b2b8, sampled 0
6eae8e14b8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2b8, sampled 0
6eae8e14bc:    	and	x16, x16, x23, lsr #7  // guest 0x10b2b8, sampled 0
6eae8e14c0:    	add	x17, x17, x16  // guest 0x10b2b8, sampled 0
6eae8e14c4:    	ldp	x16, x17, [x17]  // guest 0x10b2b8, sampled 0
6eae8e14c8:    	and	w30, w23, #0xfffff003  // guest 0x10b2b8, sampled 0
6eae8e14cc:    	cmp	w16, w30  // guest 0x10b2b8, sampled 0
6eae8e14d0:    	b.ne	0x6eae8e2aec <trace+0x266c>  // guest 0x10b2b8, sampled 0
6eae8e14d4:    	add	x30, x17, w23, uxtw  // guest 0x10b2b8, sampled 0
6eae8e14d8:    	ldapr	w2, [x30]  // guest 0x10b2b8, sampled 0
6eae8e14dc:    	add	x1, x19, #0x258  // guest 0x10b2b8, sampled 0
6eae8e14e0:    	mov	x0, x19  // guest 0x10b2b8, sampled 0
6eae8e14e4:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b2b8, sampled 0
6eae8e14e8:    	add	x16, x16, #0x484  // guest 0x10b2b8, sampled 0
6eae8e14ec:    	blr	x16  // guest 0x10b2b8, sampled 0
6eae8e14f0:    	lsl	w23, w21, #4  // guest 0x10b2b8, sampled 0
6eae8e14f4:    	add	w23, w23, #0x1a0  // guest 0x10b2b8, sampled 0
6eae8e14f8:    	sxtw	x23, w23  // guest 0x10b2b8, sampled 0
6eae8e14fc:    	add	x1, x23, x19  // guest 0x10b2b8, sampled 0
6eae8e1500:    	add	x2, x19, #0x258  // guest 0x10b2b8, sampled 0
6eae8e1504:    	mov	x0, x19  // guest 0x10b2b8, sampled 0
6eae8e1508:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b2b8, sampled 0
6eae8e150c:    	add	x16, x16, #0xa78  // guest 0x10b2b8, sampled 0
6eae8e1510:    	blr	x16  // guest 0x10b2b8, sampled 0
6eae8e1514:    	ldr	w23, [x19, #0x74]  // guest 0x10b2b8, sampled 0
6eae8e1518:    	strh	w23, [x19, #0x224]  // guest 0x10b2b8, sampled 0
6eae8e151c:    	str	w24, [x19, #0x230]  // guest 0x10b2b8, sampled 0
6eae8e1520:    	ldr	w23, [x19, #0x54]  // guest 0x10b2b8, sampled 0
6eae8e1524:    	strh	w23, [x19, #0x222]  // guest 0x10b2b8, sampled 0
6eae8e1528:    	mov	w23, #0xb2b8            // =45752  // guest 0x10b2b8, sampled 0
6eae8e152c:    	movk	w23, #0x10, lsl #16  // guest 0x10b2b8, sampled 0
6eae8e1530:    	str	w23, [x19, #0x228]  // guest 0x10b2b8, sampled 0
6eae8e1534:    	add	w23, w22, #0x4c  // guest 0x10b2bb, sampled 0
6eae8e1538:    	mov	w24, w23  // guest 0x10b2bb, sampled 0
6eae8e153c:    	lsl	w25, w21, #4  // guest 0x10b2bb, sampled 0
6eae8e1540:    	add	w25, w25, #0x1a0  // guest 0x10b2bb, sampled 0
6eae8e1544:    	sxtw	x25, w25  // guest 0x10b2bb, sampled 0
6eae8e1548:    	add	x1, x25, x19  // guest 0x10b2bb, sampled 0
6eae8e154c:    	mov	x0, x19  // guest 0x10b2bb, sampled 0
6eae8e1550:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b2bb, sampled 0
6eae8e1554:    	add	x16, x16, #0x5c0  // guest 0x10b2bb, sampled 0
6eae8e1558:    	blr	x16  // guest 0x10b2bb, sampled 1
6eae8e155c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2bb, sampled 0
6eae8e1560:    	and	x16, x16, x23, lsr #7  // guest 0x10b2bb, sampled 0
6eae8e1564:    	add	x17, x17, x16  // guest 0x10b2bb, sampled 0
6eae8e1568:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b2bb, sampled 0
6eae8e156c:    	and	w30, w23, #0xfffff003  // guest 0x10b2bb, sampled 0
6eae8e1570:    	cmp	w16, w30  // guest 0x10b2bb, sampled 0
6eae8e1574:    	b.ne	0x6eae8e2b18 <trace+0x2698>  // guest 0x10b2bb, sampled 0
6eae8e1578:    	add	x30, x17, w23, uxtw  // guest 0x10b2bb, sampled 0
6eae8e157c:    	stlr	w0, [x30]  // guest 0x10b2bb, sampled 0
6eae8e1580:    	sxtw	x23, w21  // guest 0x10b2bb, sampled 0
6eae8e1584:    	add	x23, x23, x19  // guest 0x10b2bb, sampled 0
6eae8e1588:    	strb	w27, [x23, #0x190]  // guest 0x10b2bb, sampled 0
6eae8e158c:    	add	w21, w21, w27  // guest 0x10b2bb, sampled 0
6eae8e1590:    	and	w21, w21, #0x7  // guest 0x10b2bb, sampled 0
6eae8e1594:    	str	w21, [x19, #0x188]  // guest 0x10b2bb, sampled 0
6eae8e1598:    	ldr	w23, [x19, #0x64]  // guest 0x10b2bb, sampled 0
6eae8e159c:    	strh	w23, [x19, #0x224]  // guest 0x10b2bb, sampled 0
6eae8e15a0:    	str	w24, [x19, #0x230]  // guest 0x10b2bb, sampled 0
6eae8e15a4:    	ldr	w23, [x19, #0x54]  // guest 0x10b2bb, sampled 0
6eae8e15a8:    	strh	w23, [x19, #0x222]  // guest 0x10b2bb, sampled 0
6eae8e15ac:    	mov	w23, #0xb2bb            // =45755  // guest 0x10b2bb, sampled 0
6eae8e15b0:    	movk	w23, #0x10, lsl #16  // guest 0x10b2bb, sampled 0
6eae8e15b4:    	str	w23, [x19, #0x228]  // guest 0x10b2bb, sampled 0
6eae8e15b8:    	add	w23, w20, #0x14  // guest 0x10b2bf, sampled 0
6eae8e15bc:    	mov	w24, w23  // guest 0x10b2bf, sampled 0
6eae8e15c0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2bf, sampled 0
6eae8e15c4:    	and	x16, x16, x23, lsr #7  // guest 0x10b2bf, sampled 0
6eae8e15c8:    	add	x17, x17, x16  // guest 0x10b2bf, sampled 0
6eae8e15cc:    	ldp	x16, x17, [x17]  // guest 0x10b2bf, sampled 0
6eae8e15d0:    	and	w30, w23, #0xfffff003  // guest 0x10b2bf, sampled 0
6eae8e15d4:    	cmp	w16, w30  // guest 0x10b2bf, sampled 0
6eae8e15d8:    	b.ne	0x6eae8e2b44 <trace+0x26c4>  // guest 0x10b2bf, sampled 0
6eae8e15dc:    	add	x30, x17, w23, uxtw  // guest 0x10b2bf, sampled 0
6eae8e15e0:    	ldapr	w2, [x30]  // guest 0x10b2bf, sampled 0
6eae8e15e4:    	add	w23, w21, #0x7  // guest 0x10b2bf, sampled 0
6eae8e15e8:    	and	w23, w23, #0x7  // guest 0x10b2bf, sampled 0
6eae8e15ec:    	lsl	w23, w23, #4  // guest 0x10b2bf, sampled 0
6eae8e15f0:    	add	w23, w23, #0x1a0  // guest 0x10b2bf, sampled 0
6eae8e15f4:    	sxtw	x23, w23  // guest 0x10b2bf, sampled 0
6eae8e15f8:    	add	x1, x23, x19  // guest 0x10b2bf, sampled 0
6eae8e15fc:    	mov	x0, x19  // guest 0x10b2bf, sampled 0
6eae8e1600:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b2bf, sampled 0
6eae8e1604:    	add	x16, x16, #0x484  // guest 0x10b2bf, sampled 0
6eae8e1608:    	blr	x16  // guest 0x10b2bf, sampled 0
6eae8e160c:    	sub	w21, w21, #0x1  // guest 0x10b2bf, sampled 1
6eae8e1610:    	and	w21, w21, #0x7  // guest 0x10b2bf, sampled 0
6eae8e1614:    	str	w21, [x19, #0x188]  // guest 0x10b2bf, sampled 0
6eae8e1618:    	sxtw	x23, w21  // guest 0x10b2bf, sampled 0
6eae8e161c:    	add	x23, x23, x19  // guest 0x10b2bf, sampled 0
6eae8e1620:    	strb	wzr, [x23, #0x190]  // guest 0x10b2bf, sampled 0
6eae8e1624:    	ldr	w23, [x19, #0x74]  // guest 0x10b2bf, sampled 0
6eae8e1628:    	strh	w23, [x19, #0x224]  // guest 0x10b2bf, sampled 0
6eae8e162c:    	str	w24, [x19, #0x230]  // guest 0x10b2bf, sampled 0
6eae8e1630:    	ldr	w23, [x19, #0x54]  // guest 0x10b2bf, sampled 0
6eae8e1634:    	strh	w23, [x19, #0x222]  // guest 0x10b2bf, sampled 0
6eae8e1638:    	mov	w23, #0xb2bf            // =45759  // guest 0x10b2bf, sampled 0
6eae8e163c:    	movk	w23, #0x10, lsl #16  // guest 0x10b2bf, sampled 0
6eae8e1640:    	str	w23, [x19, #0x228]  // guest 0x10b2bf, sampled 0
6eae8e1644:    	ldr	w23, [x19, #0x4]  // guest 0x10b2c2, sampled 0
6eae8e1648:    	add	w24, w23, #0x8  // guest 0x10b2c2, sampled 0
6eae8e164c:    	mov	w25, w24  // guest 0x10b2c2, sampled 0
6eae8e1650:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2c2, sampled 0
6eae8e1654:    	and	x16, x16, x24, lsr #7  // guest 0x10b2c2, sampled 0
6eae8e1658:    	add	x17, x17, x16  // guest 0x10b2c2, sampled 0
6eae8e165c:    	ldp	x16, x17, [x17]  // guest 0x10b2c2, sampled 0
6eae8e1660:    	and	w30, w24, #0xfffff003  // guest 0x10b2c2, sampled 0
6eae8e1664:    	cmp	w16, w30  // guest 0x10b2c2, sampled 0
6eae8e1668:    	b.ne	0x6eae8e2b70 <trace+0x26f0>  // guest 0x10b2c2, sampled 0
6eae8e166c:    	add	x30, x17, w24, uxtw  // guest 0x10b2c2, sampled 0
6eae8e1670:    	ldapr	w2, [x30]  // guest 0x10b2c2, sampled 0
6eae8e1674:    	add	x1, x19, #0x258  // guest 0x10b2c2, sampled 0
6eae8e1678:    	mov	x0, x19  // guest 0x10b2c2, sampled 0
6eae8e167c:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b2c2, sampled 0
6eae8e1680:    	add	x16, x16, #0x484  // guest 0x10b2c2, sampled 0
6eae8e1684:    	blr	x16  // guest 0x10b2c2, sampled 0
6eae8e1688:    	lsl	w24, w21, #4  // guest 0x10b2c2, sampled 0
6eae8e168c:    	add	w24, w24, #0x1a0  // guest 0x10b2c2, sampled 0
6eae8e1690:    	sxtw	x24, w24  // guest 0x10b2c2, sampled 0
6eae8e1694:    	add	x1, x24, x19  // guest 0x10b2c2, sampled 0
6eae8e1698:    	add	x2, x19, #0x258  // guest 0x10b2c2, sampled 0
6eae8e169c:    	mov	x0, x19  // guest 0x10b2c2, sampled 0
6eae8e16a0:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b2c2, sampled 0
6eae8e16a4:    	add	x16, x16, #0xb4c  // guest 0x10b2c2, sampled 0
6eae8e16a8:    	blr	x16  // guest 0x10b2c2, sampled 0
6eae8e16ac:    	ldr	w24, [x19, #0x74]  // guest 0x10b2c2, sampled 0
6eae8e16b0:    	strh	w24, [x19, #0x224]  // guest 0x10b2c2, sampled 0
6eae8e16b4:    	str	w25, [x19, #0x230]  // guest 0x10b2c2, sampled 0
6eae8e16b8:    	ldr	w24, [x19, #0x54]  // guest 0x10b2c2, sampled 0
6eae8e16bc:    	strh	w24, [x19, #0x222]  // guest 0x10b2c2, sampled 0
6eae8e16c0:    	mov	w24, #0xb2c2            // =45762  // guest 0x10b2c2, sampled 0
6eae8e16c4:    	movk	w24, #0x10, lsl #16  // guest 0x10b2c2, sampled 0
6eae8e16c8:    	str	w24, [x19, #0x228]  // guest 0x10b2c2, sampled 0
6eae8e16cc:    	add	w24, w20, #0x10  // guest 0x10b2c5, sampled 0
6eae8e16d0:    	mov	w25, w24  // guest 0x10b2c5, sampled 0
6eae8e16d4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2c5, sampled 0
6eae8e16d8:    	and	x16, x16, x24, lsr #7  // guest 0x10b2c5, sampled 0
6eae8e16dc:    	add	x17, x17, x16  // guest 0x10b2c5, sampled 0
6eae8e16e0:    	ldp	x16, x17, [x17]  // guest 0x10b2c5, sampled 0
6eae8e16e4:    	and	w30, w24, #0xfffff003  // guest 0x10b2c5, sampled 0
6eae8e16e8:    	cmp	w16, w30  // guest 0x10b2c5, sampled 0
6eae8e16ec:    	b.ne	0x6eae8e2b9c <trace+0x271c>  // guest 0x10b2c5, sampled 0
6eae8e16f0:    	add	x30, x17, w24, uxtw  // guest 0x10b2c5, sampled 0
6eae8e16f4:    	ldapr	w2, [x30]  // guest 0x10b2c5, sampled 0
6eae8e16f8:    	add	w24, w21, #0x7  // guest 0x10b2c5, sampled 0
6eae8e16fc:    	and	w24, w24, #0x7  // guest 0x10b2c5, sampled 0
6eae8e1700:    	lsl	w24, w24, #4  // guest 0x10b2c5, sampled 0
6eae8e1704:    	add	w24, w24, #0x1a0  // guest 0x10b2c5, sampled 0
6eae8e1708:    	sxtw	x24, w24  // guest 0x10b2c5, sampled 0
6eae8e170c:    	add	x1, x24, x19  // guest 0x10b2c5, sampled 0
6eae8e1710:    	mov	x0, x19  // guest 0x10b2c5, sampled 0
6eae8e1714:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b2c5, sampled 0
6eae8e1718:    	add	x16, x16, #0x484  // guest 0x10b2c5, sampled 0
6eae8e171c:    	blr	x16  // guest 0x10b2c5, sampled 0
6eae8e1720:    	sub	w21, w21, #0x1  // guest 0x10b2c5, sampled 0
6eae8e1724:    	and	w21, w21, #0x7  // guest 0x10b2c5, sampled 0
6eae8e1728:    	str	w21, [x19, #0x188]  // guest 0x10b2c5, sampled 0
6eae8e172c:    	sxtw	x24, w21  // guest 0x10b2c5, sampled 0
6eae8e1730:    	add	x24, x24, x19  // guest 0x10b2c5, sampled 0
6eae8e1734:    	strb	wzr, [x24, #0x190]  // guest 0x10b2c5, sampled 0
6eae8e1738:    	ldr	w24, [x19, #0x74]  // guest 0x10b2c5, sampled 0
6eae8e173c:    	strh	w24, [x19, #0x224]  // guest 0x10b2c5, sampled 0
6eae8e1740:    	str	w25, [x19, #0x230]  // guest 0x10b2c5, sampled 0
6eae8e1744:    	ldr	w24, [x19, #0x54]  // guest 0x10b2c5, sampled 0
6eae8e1748:    	strh	w24, [x19, #0x222]  // guest 0x10b2c5, sampled 0
6eae8e174c:    	mov	w24, #0xb2c5            // =45765  // guest 0x10b2c5, sampled 0
6eae8e1750:    	movk	w24, #0x10, lsl #16  // guest 0x10b2c5, sampled 0
6eae8e1754:    	str	w24, [x19, #0x228]  // guest 0x10b2c5, sampled 0
6eae8e1758:    	add	w24, w23, #0x4  // guest 0x10b2c8, sampled 0
6eae8e175c:    	mov	w25, w24  // guest 0x10b2c8, sampled 0
6eae8e1760:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2c8, sampled 0
6eae8e1764:    	and	x16, x16, x24, lsr #7  // guest 0x10b2c8, sampled 0
6eae8e1768:    	add	x17, x17, x16  // guest 0x10b2c8, sampled 0
6eae8e176c:    	ldp	x16, x17, [x17]  // guest 0x10b2c8, sampled 0
6eae8e1770:    	and	w30, w24, #0xfffff003  // guest 0x10b2c8, sampled 0
6eae8e1774:    	cmp	w16, w30  // guest 0x10b2c8, sampled 0
6eae8e1778:    	b.ne	0x6eae8e2bc8 <trace+0x2748>  // guest 0x10b2c8, sampled 0
6eae8e177c:    	add	x30, x17, w24, uxtw  // guest 0x10b2c8, sampled 0
6eae8e1780:    	ldapr	w2, [x30]  // guest 0x10b2c8, sampled 0
6eae8e1784:    	add	x1, x19, #0x258  // guest 0x10b2c8, sampled 0
6eae8e1788:    	mov	x0, x19  // guest 0x10b2c8, sampled 0
6eae8e178c:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b2c8, sampled 0
6eae8e1790:    	add	x16, x16, #0x484  // guest 0x10b2c8, sampled 0
6eae8e1794:    	blr	x16  // guest 0x10b2c8, sampled 0
6eae8e1798:    	lsl	w24, w21, #4  // guest 0x10b2c8, sampled 0
6eae8e179c:    	add	w24, w24, #0x1a0  // guest 0x10b2c8, sampled 0
6eae8e17a0:    	sxtw	x24, w24  // guest 0x10b2c8, sampled 0
6eae8e17a4:    	add	x1, x24, x19  // guest 0x10b2c8, sampled 0
6eae8e17a8:    	add	x2, x19, #0x258  // guest 0x10b2c8, sampled 0
6eae8e17ac:    	mov	x0, x19  // guest 0x10b2c8, sampled 0
6eae8e17b0:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b2c8, sampled 0
6eae8e17b4:    	add	x16, x16, #0xb4c  // guest 0x10b2c8, sampled 0
6eae8e17b8:    	blr	x16  // guest 0x10b2c8, sampled 0
6eae8e17bc:    	ldr	w24, [x19, #0x74]  // guest 0x10b2c8, sampled 0
6eae8e17c0:    	strh	w24, [x19, #0x224]  // guest 0x10b2c8, sampled 0
6eae8e17c4:    	str	w25, [x19, #0x230]  // guest 0x10b2c8, sampled 0
6eae8e17c8:    	ldr	w24, [x19, #0x54]  // guest 0x10b2c8, sampled 0
6eae8e17cc:    	strh	w24, [x19, #0x222]  // guest 0x10b2c8, sampled 0
6eae8e17d0:    	mov	w24, #0xb2c8            // =45768  // guest 0x10b2c8, sampled 0
6eae8e17d4:    	movk	w24, #0x10, lsl #16  // guest 0x10b2c8, sampled 0
6eae8e17d8:    	str	w24, [x19, #0x228]  // guest 0x10b2c8, sampled 0
6eae8e17dc:    	add	w24, w21, w27  // guest 0x10b2cb, sampled 0
6eae8e17e0:    	and	w24, w24, #0x7  // guest 0x10b2cb, sampled 0
6eae8e17e4:    	lsl	w24, w24, #4  // guest 0x10b2cb, sampled 0
6eae8e17e8:    	add	w24, w24, #0x1a0  // guest 0x10b2cb, sampled 0
6eae8e17ec:    	sxtw	x24, w24  // guest 0x10b2cb, sampled 0
6eae8e17f0:    	add	x1, x24, x19  // guest 0x10b2cb, sampled 0
6eae8e17f4:    	lsl	w24, w21, #4  // guest 0x10b2cb, sampled 0
6eae8e17f8:    	add	w24, w24, #0x1a0  // guest 0x10b2cb, sampled 0
6eae8e17fc:    	sxtw	x24, w24  // guest 0x10b2cb, sampled 0
6eae8e1800:    	add	x2, x24, x19  // guest 0x10b2cb, sampled 0
6eae8e1804:    	mov	x0, x19  // guest 0x10b2cb, sampled 0
6eae8e1808:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b2cb, sampled 0
6eae8e180c:    	add	x16, x16, #0xa78  // guest 0x10b2cb, sampled 0
6eae8e1810:    	blr	x16  // guest 0x10b2cb, sampled 0
6eae8e1814:    	sxtw	x24, w21  // guest 0x10b2cb, sampled 0
6eae8e1818:    	add	x24, x24, x19  // guest 0x10b2cb, sampled 1
6eae8e181c:    	strb	w27, [x24, #0x190]  // guest 0x10b2cb, sampled 0
6eae8e1820:    	add	w21, w21, w27  // guest 0x10b2cb, sampled 0
6eae8e1824:    	and	w21, w21, #0x7  // guest 0x10b2cb, sampled 0
6eae8e1828:    	str	w21, [x19, #0x188]  // guest 0x10b2cb, sampled 0
6eae8e182c:    	ldr	w24, [x19, #0x54]  // guest 0x10b2cb, sampled 0
6eae8e1830:    	strh	w24, [x19, #0x222]  // guest 0x10b2cb, sampled 0
6eae8e1834:    	mov	w24, #0xb2cb            // =45771  // guest 0x10b2cb, sampled 0
6eae8e1838:    	movk	w24, #0x10, lsl #16  // guest 0x10b2cb, sampled 0
6eae8e183c:    	str	w24, [x19, #0x228]  // guest 0x10b2cb, sampled 0
6eae8e1840:    	add	w24, w20, #0xc  // guest 0x10b2cd, sampled 0
6eae8e1844:    	mov	w25, w24  // guest 0x10b2cd, sampled 0
6eae8e1848:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2cd, sampled 0
6eae8e184c:    	and	x16, x16, x24, lsr #7  // guest 0x10b2cd, sampled 0
6eae8e1850:    	add	x17, x17, x16  // guest 0x10b2cd, sampled 0
6eae8e1854:    	ldp	x16, x17, [x17]  // guest 0x10b2cd, sampled 0
6eae8e1858:    	and	w30, w24, #0xfffff003  // guest 0x10b2cd, sampled 0
6eae8e185c:    	cmp	w16, w30  // guest 0x10b2cd, sampled 0
6eae8e1860:    	b.ne	0x6eae8e2bf4 <trace+0x2774>  // guest 0x10b2cd, sampled 0
6eae8e1864:    	add	x30, x17, w24, uxtw  // guest 0x10b2cd, sampled 0
6eae8e1868:    	ldapr	w2, [x30]  // guest 0x10b2cd, sampled 0
6eae8e186c:    	add	w24, w21, #0x7  // guest 0x10b2cd, sampled 0
6eae8e1870:    	and	w24, w24, #0x7  // guest 0x10b2cd, sampled 0
6eae8e1874:    	lsl	w24, w24, #4  // guest 0x10b2cd, sampled 0
6eae8e1878:    	add	w24, w24, #0x1a0  // guest 0x10b2cd, sampled 0
6eae8e187c:    	sxtw	x24, w24  // guest 0x10b2cd, sampled 0
6eae8e1880:    	add	x1, x24, x19  // guest 0x10b2cd, sampled 0
6eae8e1884:    	mov	x0, x19  // guest 0x10b2cd, sampled 0
6eae8e1888:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b2cd, sampled 0
6eae8e188c:    	add	x16, x16, #0x484  // guest 0x10b2cd, sampled 0
6eae8e1890:    	blr	x16  // guest 0x10b2cd, sampled 0
6eae8e1894:    	sub	w21, w21, #0x1  // guest 0x10b2cd, sampled 0
6eae8e1898:    	and	w21, w21, #0x7  // guest 0x10b2cd, sampled 0
6eae8e189c:    	str	w21, [x19, #0x188]  // guest 0x10b2cd, sampled 0
6eae8e18a0:    	sxtw	x24, w21  // guest 0x10b2cd, sampled 0
6eae8e18a4:    	add	x24, x24, x19  // guest 0x10b2cd, sampled 0
6eae8e18a8:    	strb	wzr, [x24, #0x190]  // guest 0x10b2cd, sampled 0
6eae8e18ac:    	ldr	w24, [x19, #0x74]  // guest 0x10b2cd, sampled 0
6eae8e18b0:    	strh	w24, [x19, #0x224]  // guest 0x10b2cd, sampled 0
6eae8e18b4:    	str	w25, [x19, #0x230]  // guest 0x10b2cd, sampled 0
6eae8e18b8:    	ldr	w24, [x19, #0x54]  // guest 0x10b2cd, sampled 0
6eae8e18bc:    	strh	w24, [x19, #0x222]  // guest 0x10b2cd, sampled 0
6eae8e18c0:    	mov	w24, #0xb2cd            // =45773  // guest 0x10b2cd, sampled 0
6eae8e18c4:    	movk	w24, #0x10, lsl #16  // guest 0x10b2cd, sampled 0
6eae8e18c8:    	str	w24, [x19, #0x228]  // guest 0x10b2cd, sampled 0
6eae8e18cc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2d0, sampled 0
6eae8e18d0:    	and	x16, x16, x23, lsr #7  // guest 0x10b2d0, sampled 0
6eae8e18d4:    	add	x17, x17, x16  // guest 0x10b2d0, sampled 0
6eae8e18d8:    	ldp	x16, x17, [x17]  // guest 0x10b2d0, sampled 0
6eae8e18dc:    	and	w30, w23, #0xfffff003  // guest 0x10b2d0, sampled 0
6eae8e18e0:    	cmp	w16, w30  // guest 0x10b2d0, sampled 0
6eae8e18e4:    	b.ne	0x6eae8e2c20 <trace+0x27a0>  // guest 0x10b2d0, sampled 0
6eae8e18e8:    	add	x30, x17, w23, uxtw  // guest 0x10b2d0, sampled 0
6eae8e18ec:    	ldapr	w2, [x30]  // guest 0x10b2d0, sampled 0
6eae8e18f0:    	add	x1, x19, #0x258  // guest 0x10b2d0, sampled 0
6eae8e18f4:    	mov	x0, x19  // guest 0x10b2d0, sampled 0
6eae8e18f8:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b2d0, sampled 0
6eae8e18fc:    	add	x16, x16, #0x484  // guest 0x10b2d0, sampled 0
6eae8e1900:    	blr	x16  // guest 0x10b2d0, sampled 0
6eae8e1904:    	lsl	w24, w21, #4  // guest 0x10b2d0, sampled 0
6eae8e1908:    	add	w24, w24, #0x1a0  // guest 0x10b2d0, sampled 0
6eae8e190c:    	sxtw	x24, w24  // guest 0x10b2d0, sampled 0
6eae8e1910:    	add	x1, x24, x19  // guest 0x10b2d0, sampled 0
6eae8e1914:    	add	x2, x19, #0x258  // guest 0x10b2d0, sampled 0
6eae8e1918:    	mov	x0, x19  // guest 0x10b2d0, sampled 0
6eae8e191c:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b2d0, sampled 0
6eae8e1920:    	add	x16, x16, #0xb4c  // guest 0x10b2d0, sampled 0
6eae8e1924:    	blr	x16  // guest 0x10b2d0, sampled 0
6eae8e1928:    	ldr	w24, [x19, #0x74]  // guest 0x10b2d0, sampled 0
6eae8e192c:    	strh	w24, [x19, #0x224]  // guest 0x10b2d0, sampled 0
6eae8e1930:    	str	w23, [x19, #0x230]  // guest 0x10b2d0, sampled 0
6eae8e1934:    	ldr	w24, [x19, #0x54]  // guest 0x10b2d0, sampled 0
6eae8e1938:    	strh	w24, [x19, #0x222]  // guest 0x10b2d0, sampled 0
6eae8e193c:    	mov	w24, #0xb2d0            // =45776  // guest 0x10b2d0, sampled 0
6eae8e1940:    	movk	w24, #0x10, lsl #16  // guest 0x10b2d0, sampled 0
6eae8e1944:    	str	w24, [x19, #0x228]  // guest 0x10b2d0, sampled 0
6eae8e1948:    	add	w24, w21, w27  // guest 0x10b2d2, sampled 0
6eae8e194c:    	and	w24, w24, #0x7  // guest 0x10b2d2, sampled 0
6eae8e1950:    	lsl	w24, w24, #4  // guest 0x10b2d2, sampled 0
6eae8e1954:    	add	w24, w24, #0x1a0  // guest 0x10b2d2, sampled 0
6eae8e1958:    	sxtw	x24, w24  // guest 0x10b2d2, sampled 0
6eae8e195c:    	add	x1, x24, x19  // guest 0x10b2d2, sampled 0
6eae8e1960:    	lsl	w24, w21, #4  // guest 0x10b2d2, sampled 0
6eae8e1964:    	add	w24, w24, #0x1a0  // guest 0x10b2d2, sampled 0
6eae8e1968:    	sxtw	x24, w24  // guest 0x10b2d2, sampled 0
6eae8e196c:    	add	x2, x24, x19  // guest 0x10b2d2, sampled 0
6eae8e1970:    	mov	x0, x19  // guest 0x10b2d2, sampled 0
6eae8e1974:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b2d2, sampled 0
6eae8e1978:    	add	x16, x16, #0xa78  // guest 0x10b2d2, sampled 0
6eae8e197c:    	blr	x16  // guest 0x10b2d2, sampled 0
6eae8e1980:    	sxtw	x24, w21  // guest 0x10b2d2, sampled 0
6eae8e1984:    	add	x24, x24, x19  // guest 0x10b2d2, sampled 0
6eae8e1988:    	strb	w27, [x24, #0x190]  // guest 0x10b2d2, sampled 0
6eae8e198c:    	add	w21, w21, w27  // guest 0x10b2d2, sampled 0
6eae8e1990:    	and	w21, w21, #0x7  // guest 0x10b2d2, sampled 0
6eae8e1994:    	str	w21, [x19, #0x188]  // guest 0x10b2d2, sampled 0
6eae8e1998:    	ldr	w24, [x19, #0x54]  // guest 0x10b2d2, sampled 0
6eae8e199c:    	strh	w24, [x19, #0x222]  // guest 0x10b2d2, sampled 0
6eae8e19a0:    	mov	w24, #0xb2d2            // =45778  // guest 0x10b2d2, sampled 0
6eae8e19a4:    	movk	w24, #0x10, lsl #16  // guest 0x10b2d2, sampled 0
6eae8e19a8:    	str	w24, [x19, #0x228]  // guest 0x10b2d2, sampled 0
6eae8e19ac:    	add	w24, w22, #0x5c  // guest 0x10b2d4, sampled 0
6eae8e19b0:    	mov	w25, w24  // guest 0x10b2d4, sampled 0
6eae8e19b4:    	lsl	w26, w21, #4  // guest 0x10b2d4, sampled 0
6eae8e19b8:    	add	w26, w26, #0x1a0  // guest 0x10b2d4, sampled 0
6eae8e19bc:    	sxtw	x26, w26  // guest 0x10b2d4, sampled 0
6eae8e19c0:    	add	x1, x26, x19  // guest 0x10b2d4, sampled 0
6eae8e19c4:    	mov	x0, x19  // guest 0x10b2d4, sampled 0
6eae8e19c8:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b2d4, sampled 0
6eae8e19cc:    	add	x16, x16, #0x5c0  // guest 0x10b2d4, sampled 0
6eae8e19d0:    	blr	x16  // guest 0x10b2d4, sampled 0
6eae8e19d4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2d4, sampled 0
6eae8e19d8:    	and	x16, x16, x24, lsr #7  // guest 0x10b2d4, sampled 0
6eae8e19dc:    	add	x17, x17, x16  // guest 0x10b2d4, sampled 0
6eae8e19e0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b2d4, sampled 0
6eae8e19e4:    	and	w30, w24, #0xfffff003  // guest 0x10b2d4, sampled 0
6eae8e19e8:    	cmp	w16, w30  // guest 0x10b2d4, sampled 0
6eae8e19ec:    	b.ne	0x6eae8e2c4c <trace+0x27cc>  // guest 0x10b2d4, sampled 0
6eae8e19f0:    	add	x30, x17, w24, uxtw  // guest 0x10b2d4, sampled 0
6eae8e19f4:    	stlr	w0, [x30]  // guest 0x10b2d4, sampled 0
6eae8e19f8:    	sxtw	x24, w21  // guest 0x10b2d4, sampled 0
6eae8e19fc:    	add	x24, x24, x19  // guest 0x10b2d4, sampled 0
6eae8e1a00:    	strb	w27, [x24, #0x190]  // guest 0x10b2d4, sampled 0
6eae8e1a04:    	add	w21, w21, w27  // guest 0x10b2d4, sampled 0
6eae8e1a08:    	and	w21, w21, #0x7  // guest 0x10b2d4, sampled 0
6eae8e1a0c:    	str	w21, [x19, #0x188]  // guest 0x10b2d4, sampled 0
6eae8e1a10:    	ldr	w24, [x19, #0x64]  // guest 0x10b2d4, sampled 0
6eae8e1a14:    	strh	w24, [x19, #0x224]  // guest 0x10b2d4, sampled 0
6eae8e1a18:    	str	w25, [x19, #0x230]  // guest 0x10b2d4, sampled 0
6eae8e1a1c:    	ldr	w24, [x19, #0x54]  // guest 0x10b2d4, sampled 0
6eae8e1a20:    	strh	w24, [x19, #0x222]  // guest 0x10b2d4, sampled 0
6eae8e1a24:    	mov	w24, #0xb2d4            // =45780  // guest 0x10b2d4, sampled 0
6eae8e1a28:    	movk	w24, #0x10, lsl #16  // guest 0x10b2d4, sampled 0
6eae8e1a2c:    	str	w24, [x19, #0x228]  // guest 0x10b2d4, sampled 0
6eae8e1a30:    	add	w24, w20, #0x20  // guest 0x10b2d8, sampled 0
6eae8e1a34:    	mov	w25, w24  // guest 0x10b2d8, sampled 0
6eae8e1a38:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2d8, sampled 0
6eae8e1a3c:    	and	x16, x16, x24, lsr #7  // guest 0x10b2d8, sampled 0
6eae8e1a40:    	add	x17, x17, x16  // guest 0x10b2d8, sampled 0
6eae8e1a44:    	ldp	x16, x17, [x17]  // guest 0x10b2d8, sampled 0
6eae8e1a48:    	and	w30, w24, #0xfffff003  // guest 0x10b2d8, sampled 0
6eae8e1a4c:    	cmp	w16, w30  // guest 0x10b2d8, sampled 0
6eae8e1a50:    	b.ne	0x6eae8e2c78 <trace+0x27f8>  // guest 0x10b2d8, sampled 0
6eae8e1a54:    	add	x30, x17, w24, uxtw  // guest 0x10b2d8, sampled 0
6eae8e1a58:    	ldapr	w2, [x30]  // guest 0x10b2d8, sampled 0
6eae8e1a5c:    	add	w24, w21, #0x7  // guest 0x10b2d8, sampled 0
6eae8e1a60:    	and	w24, w24, #0x7  // guest 0x10b2d8, sampled 0
6eae8e1a64:    	lsl	w24, w24, #4  // guest 0x10b2d8, sampled 0
6eae8e1a68:    	add	w24, w24, #0x1a0  // guest 0x10b2d8, sampled 0
6eae8e1a6c:    	sxtw	x24, w24  // guest 0x10b2d8, sampled 0
6eae8e1a70:    	add	x1, x24, x19  // guest 0x10b2d8, sampled 0
6eae8e1a74:    	mov	x0, x19  // guest 0x10b2d8, sampled 0
6eae8e1a78:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b2d8, sampled 0
6eae8e1a7c:    	add	x16, x16, #0x484  // guest 0x10b2d8, sampled 0
6eae8e1a80:    	blr	x16  // guest 0x10b2d8, sampled 0
6eae8e1a84:    	sub	w21, w21, #0x1  // guest 0x10b2d8, sampled 0
6eae8e1a88:    	and	w21, w21, #0x7  // guest 0x10b2d8, sampled 0
6eae8e1a8c:    	str	w21, [x19, #0x188]  // guest 0x10b2d8, sampled 0
6eae8e1a90:    	sxtw	x24, w21  // guest 0x10b2d8, sampled 0
6eae8e1a94:    	add	x24, x24, x19  // guest 0x10b2d8, sampled 0
6eae8e1a98:    	strb	wzr, [x24, #0x190]  // guest 0x10b2d8, sampled 0
6eae8e1a9c:    	ldr	w24, [x19, #0x74]  // guest 0x10b2d8, sampled 0
6eae8e1aa0:    	strh	w24, [x19, #0x224]  // guest 0x10b2d8, sampled 0
6eae8e1aa4:    	str	w25, [x19, #0x230]  // guest 0x10b2d8, sampled 0
6eae8e1aa8:    	ldr	w24, [x19, #0x54]  // guest 0x10b2d8, sampled 0
6eae8e1aac:    	strh	w24, [x19, #0x222]  // guest 0x10b2d8, sampled 0
6eae8e1ab0:    	mov	w24, #0xb2d8            // =45784  // guest 0x10b2d8, sampled 0
6eae8e1ab4:    	movk	w24, #0x10, lsl #16  // guest 0x10b2d8, sampled 0
6eae8e1ab8:    	str	w24, [x19, #0x228]  // guest 0x10b2d8, sampled 0
6eae8e1abc:    	add	w24, w23, #0x8  // guest 0x10b2db, sampled 0
6eae8e1ac0:    	mov	w25, w24  // guest 0x10b2db, sampled 0
6eae8e1ac4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2db, sampled 0
6eae8e1ac8:    	and	x16, x16, x24, lsr #7  // guest 0x10b2db, sampled 0
6eae8e1acc:    	add	x17, x17, x16  // guest 0x10b2db, sampled 0
6eae8e1ad0:    	ldp	x16, x17, [x17]  // guest 0x10b2db, sampled 0
6eae8e1ad4:    	and	w30, w24, #0xfffff003  // guest 0x10b2db, sampled 0
6eae8e1ad8:    	cmp	w16, w30  // guest 0x10b2db, sampled 0
6eae8e1adc:    	b.ne	0x6eae8e2ca4 <trace+0x2824>  // guest 0x10b2db, sampled 0
6eae8e1ae0:    	add	x30, x17, w24, uxtw  // guest 0x10b2db, sampled 0
6eae8e1ae4:    	ldapr	w2, [x30]  // guest 0x10b2db, sampled 0
6eae8e1ae8:    	add	x1, x19, #0x258  // guest 0x10b2db, sampled 0
6eae8e1aec:    	mov	x0, x19  // guest 0x10b2db, sampled 0
6eae8e1af0:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b2db, sampled 0
6eae8e1af4:    	add	x16, x16, #0x484  // guest 0x10b2db, sampled 0
6eae8e1af8:    	blr	x16  // guest 0x10b2db, sampled 0
6eae8e1afc:    	lsl	w24, w21, #4  // guest 0x10b2db, sampled 0
6eae8e1b00:    	add	w24, w24, #0x1a0  // guest 0x10b2db, sampled 0
6eae8e1b04:    	sxtw	x24, w24  // guest 0x10b2db, sampled 0
6eae8e1b08:    	add	x1, x24, x19  // guest 0x10b2db, sampled 0
6eae8e1b0c:    	add	x2, x19, #0x258  // guest 0x10b2db, sampled 0
6eae8e1b10:    	mov	x0, x19  // guest 0x10b2db, sampled 0
6eae8e1b14:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b2db, sampled 0
6eae8e1b18:    	add	x16, x16, #0xb4c  // guest 0x10b2db, sampled 0
6eae8e1b1c:    	blr	x16  // guest 0x10b2db, sampled 0
6eae8e1b20:    	ldr	w24, [x19, #0x74]  // guest 0x10b2db, sampled 0
6eae8e1b24:    	strh	w24, [x19, #0x224]  // guest 0x10b2db, sampled 0
6eae8e1b28:    	str	w25, [x19, #0x230]  // guest 0x10b2db, sampled 0
6eae8e1b2c:    	ldr	w24, [x19, #0x54]  // guest 0x10b2db, sampled 0
6eae8e1b30:    	strh	w24, [x19, #0x222]  // guest 0x10b2db, sampled 0
6eae8e1b34:    	mov	w24, #0xb2db            // =45787  // guest 0x10b2db, sampled 0
6eae8e1b38:    	movk	w24, #0x10, lsl #16  // guest 0x10b2db, sampled 0
6eae8e1b3c:    	str	w24, [x19, #0x228]  // guest 0x10b2db, sampled 0
6eae8e1b40:    	add	w24, w20, #0x1c  // guest 0x10b2de, sampled 0
6eae8e1b44:    	mov	w25, w24  // guest 0x10b2de, sampled 0
6eae8e1b48:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2de, sampled 0
6eae8e1b4c:    	and	x16, x16, x24, lsr #7  // guest 0x10b2de, sampled 0
6eae8e1b50:    	add	x17, x17, x16  // guest 0x10b2de, sampled 0
6eae8e1b54:    	ldp	x16, x17, [x17]  // guest 0x10b2de, sampled 0
6eae8e1b58:    	and	w30, w24, #0xfffff003  // guest 0x10b2de, sampled 1
6eae8e1b5c:    	cmp	w16, w30  // guest 0x10b2de, sampled 0
6eae8e1b60:    	b.ne	0x6eae8e2cd0 <trace+0x2850>  // guest 0x10b2de, sampled 0
6eae8e1b64:    	add	x30, x17, w24, uxtw  // guest 0x10b2de, sampled 0
6eae8e1b68:    	ldapr	w2, [x30]  // guest 0x10b2de, sampled 0
6eae8e1b6c:    	add	w24, w21, #0x7  // guest 0x10b2de, sampled 0
6eae8e1b70:    	and	w24, w24, #0x7  // guest 0x10b2de, sampled 0
6eae8e1b74:    	lsl	w24, w24, #4  // guest 0x10b2de, sampled 0
6eae8e1b78:    	add	w24, w24, #0x1a0  // guest 0x10b2de, sampled 0
6eae8e1b7c:    	sxtw	x24, w24  // guest 0x10b2de, sampled 0
6eae8e1b80:    	add	x1, x24, x19  // guest 0x10b2de, sampled 0
6eae8e1b84:    	mov	x0, x19  // guest 0x10b2de, sampled 0
6eae8e1b88:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b2de, sampled 0
6eae8e1b8c:    	add	x16, x16, #0x484  // guest 0x10b2de, sampled 0
6eae8e1b90:    	blr	x16  // guest 0x10b2de, sampled 0
6eae8e1b94:    	sub	w21, w21, #0x1  // guest 0x10b2de, sampled 0
6eae8e1b98:    	and	w21, w21, #0x7  // guest 0x10b2de, sampled 0
6eae8e1b9c:    	str	w21, [x19, #0x188]  // guest 0x10b2de, sampled 0
6eae8e1ba0:    	sxtw	x24, w21  // guest 0x10b2de, sampled 0
6eae8e1ba4:    	add	x24, x24, x19  // guest 0x10b2de, sampled 0
6eae8e1ba8:    	strb	wzr, [x24, #0x190]  // guest 0x10b2de, sampled 0
6eae8e1bac:    	ldr	w24, [x19, #0x74]  // guest 0x10b2de, sampled 0
6eae8e1bb0:    	strh	w24, [x19, #0x224]  // guest 0x10b2de, sampled 0
6eae8e1bb4:    	str	w25, [x19, #0x230]  // guest 0x10b2de, sampled 0
6eae8e1bb8:    	ldr	w24, [x19, #0x54]  // guest 0x10b2de, sampled 0
6eae8e1bbc:    	strh	w24, [x19, #0x222]  // guest 0x10b2de, sampled 0
6eae8e1bc0:    	mov	w24, #0xb2de            // =45790  // guest 0x10b2de, sampled 0
6eae8e1bc4:    	movk	w24, #0x10, lsl #16  // guest 0x10b2de, sampled 0
6eae8e1bc8:    	str	w24, [x19, #0x228]  // guest 0x10b2de, sampled 0
6eae8e1bcc:    	add	w24, w23, #0x4  // guest 0x10b2e1, sampled 0
6eae8e1bd0:    	mov	w25, w24  // guest 0x10b2e1, sampled 0
6eae8e1bd4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2e1, sampled 0
6eae8e1bd8:    	and	x16, x16, x24, lsr #7  // guest 0x10b2e1, sampled 0
6eae8e1bdc:    	add	x17, x17, x16  // guest 0x10b2e1, sampled 0
6eae8e1be0:    	ldp	x16, x17, [x17]  // guest 0x10b2e1, sampled 0
6eae8e1be4:    	and	w30, w24, #0xfffff003  // guest 0x10b2e1, sampled 0
6eae8e1be8:    	cmp	w16, w30  // guest 0x10b2e1, sampled 0
6eae8e1bec:    	b.ne	0x6eae8e2cfc <trace+0x287c>  // guest 0x10b2e1, sampled 0
6eae8e1bf0:    	add	x30, x17, w24, uxtw  // guest 0x10b2e1, sampled 0
6eae8e1bf4:    	ldapr	w2, [x30]  // guest 0x10b2e1, sampled 0
6eae8e1bf8:    	add	x1, x19, #0x258  // guest 0x10b2e1, sampled 0
6eae8e1bfc:    	mov	x0, x19  // guest 0x10b2e1, sampled 0
6eae8e1c00:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b2e1, sampled 0
6eae8e1c04:    	add	x16, x16, #0x484  // guest 0x10b2e1, sampled 0
6eae8e1c08:    	blr	x16  // guest 0x10b2e1, sampled 0
6eae8e1c0c:    	lsl	w24, w21, #4  // guest 0x10b2e1, sampled 0
6eae8e1c10:    	add	w24, w24, #0x1a0  // guest 0x10b2e1, sampled 0
6eae8e1c14:    	sxtw	x24, w24  // guest 0x10b2e1, sampled 0
6eae8e1c18:    	add	x1, x24, x19  // guest 0x10b2e1, sampled 0
6eae8e1c1c:    	add	x2, x19, #0x258  // guest 0x10b2e1, sampled 0
6eae8e1c20:    	mov	x0, x19  // guest 0x10b2e1, sampled 0
6eae8e1c24:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b2e1, sampled 0
6eae8e1c28:    	add	x16, x16, #0xb4c  // guest 0x10b2e1, sampled 0
6eae8e1c2c:    	blr	x16  // guest 0x10b2e1, sampled 0
6eae8e1c30:    	ldr	w24, [x19, #0x74]  // guest 0x10b2e1, sampled 0
6eae8e1c34:    	strh	w24, [x19, #0x224]  // guest 0x10b2e1, sampled 0
6eae8e1c38:    	str	w25, [x19, #0x230]  // guest 0x10b2e1, sampled 0
6eae8e1c3c:    	ldr	w24, [x19, #0x54]  // guest 0x10b2e1, sampled 0
6eae8e1c40:    	strh	w24, [x19, #0x222]  // guest 0x10b2e1, sampled 0
6eae8e1c44:    	mov	w24, #0xb2e1            // =45793  // guest 0x10b2e1, sampled 0
6eae8e1c48:    	movk	w24, #0x10, lsl #16  // guest 0x10b2e1, sampled 0
6eae8e1c4c:    	str	w24, [x19, #0x228]  // guest 0x10b2e1, sampled 0
6eae8e1c50:    	add	w24, w21, w27  // guest 0x10b2e4, sampled 0
6eae8e1c54:    	and	w24, w24, #0x7  // guest 0x10b2e4, sampled 0
6eae8e1c58:    	lsl	w24, w24, #4  // guest 0x10b2e4, sampled 0
6eae8e1c5c:    	add	w24, w24, #0x1a0  // guest 0x10b2e4, sampled 0
6eae8e1c60:    	sxtw	x24, w24  // guest 0x10b2e4, sampled 0
6eae8e1c64:    	add	x1, x24, x19  // guest 0x10b2e4, sampled 0
6eae8e1c68:    	lsl	w24, w21, #4  // guest 0x10b2e4, sampled 0
6eae8e1c6c:    	add	w24, w24, #0x1a0  // guest 0x10b2e4, sampled 0
6eae8e1c70:    	sxtw	x24, w24  // guest 0x10b2e4, sampled 0
6eae8e1c74:    	add	x2, x24, x19  // guest 0x10b2e4, sampled 0
6eae8e1c78:    	mov	x0, x19  // guest 0x10b2e4, sampled 0
6eae8e1c7c:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b2e4, sampled 0
6eae8e1c80:    	add	x16, x16, #0xa78  // guest 0x10b2e4, sampled 0
6eae8e1c84:    	blr	x16  // guest 0x10b2e4, sampled 0
6eae8e1c88:    	sxtw	x24, w21  // guest 0x10b2e4, sampled 0
6eae8e1c8c:    	add	x24, x24, x19  // guest 0x10b2e4, sampled 0
6eae8e1c90:    	strb	w27, [x24, #0x190]  // guest 0x10b2e4, sampled 0
6eae8e1c94:    	add	w21, w21, w27  // guest 0x10b2e4, sampled 0
6eae8e1c98:    	and	w21, w21, #0x7  // guest 0x10b2e4, sampled 0
6eae8e1c9c:    	str	w21, [x19, #0x188]  // guest 0x10b2e4, sampled 0
6eae8e1ca0:    	ldr	w24, [x19, #0x54]  // guest 0x10b2e4, sampled 0
6eae8e1ca4:    	strh	w24, [x19, #0x222]  // guest 0x10b2e4, sampled 0
6eae8e1ca8:    	mov	w24, #0xb2e4            // =45796  // guest 0x10b2e4, sampled 0
6eae8e1cac:    	movk	w24, #0x10, lsl #16  // guest 0x10b2e4, sampled 1
6eae8e1cb0:    	str	w24, [x19, #0x228]  // guest 0x10b2e4, sampled 0
6eae8e1cb4:    	add	w24, w20, #0x18  // guest 0x10b2e6, sampled 0
6eae8e1cb8:    	mov	w25, w24  // guest 0x10b2e6, sampled 0
6eae8e1cbc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2e6, sampled 0
6eae8e1cc0:    	and	x16, x16, x24, lsr #7  // guest 0x10b2e6, sampled 0
6eae8e1cc4:    	add	x17, x17, x16  // guest 0x10b2e6, sampled 0
6eae8e1cc8:    	ldp	x16, x17, [x17]  // guest 0x10b2e6, sampled 0
6eae8e1ccc:    	and	w30, w24, #0xfffff003  // guest 0x10b2e6, sampled 0
6eae8e1cd0:    	cmp	w16, w30  // guest 0x10b2e6, sampled 0
6eae8e1cd4:    	b.ne	0x6eae8e2d28 <trace+0x28a8>  // guest 0x10b2e6, sampled 0
6eae8e1cd8:    	add	x30, x17, w24, uxtw  // guest 0x10b2e6, sampled 0
6eae8e1cdc:    	ldapr	w2, [x30]  // guest 0x10b2e6, sampled 0
6eae8e1ce0:    	add	w24, w21, #0x7  // guest 0x10b2e6, sampled 0
6eae8e1ce4:    	and	w24, w24, #0x7  // guest 0x10b2e6, sampled 0
6eae8e1ce8:    	lsl	w24, w24, #4  // guest 0x10b2e6, sampled 0
6eae8e1cec:    	add	w24, w24, #0x1a0  // guest 0x10b2e6, sampled 0
6eae8e1cf0:    	sxtw	x24, w24  // guest 0x10b2e6, sampled 0
6eae8e1cf4:    	add	x1, x24, x19  // guest 0x10b2e6, sampled 0
6eae8e1cf8:    	mov	x0, x19  // guest 0x10b2e6, sampled 0
6eae8e1cfc:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b2e6, sampled 0
6eae8e1d00:    	add	x16, x16, #0x484  // guest 0x10b2e6, sampled 0
6eae8e1d04:    	blr	x16  // guest 0x10b2e6, sampled 0
6eae8e1d08:    	sub	w21, w21, #0x1  // guest 0x10b2e6, sampled 0
6eae8e1d0c:    	and	w21, w21, #0x7  // guest 0x10b2e6, sampled 0
6eae8e1d10:    	str	w21, [x19, #0x188]  // guest 0x10b2e6, sampled 0
6eae8e1d14:    	sxtw	x24, w21  // guest 0x10b2e6, sampled 0
6eae8e1d18:    	add	x24, x24, x19  // guest 0x10b2e6, sampled 0
6eae8e1d1c:    	strb	wzr, [x24, #0x190]  // guest 0x10b2e6, sampled 0
6eae8e1d20:    	ldr	w24, [x19, #0x74]  // guest 0x10b2e6, sampled 0
6eae8e1d24:    	strh	w24, [x19, #0x224]  // guest 0x10b2e6, sampled 0
6eae8e1d28:    	str	w25, [x19, #0x230]  // guest 0x10b2e6, sampled 0
6eae8e1d2c:    	ldr	w24, [x19, #0x54]  // guest 0x10b2e6, sampled 0
6eae8e1d30:    	strh	w24, [x19, #0x222]  // guest 0x10b2e6, sampled 0
6eae8e1d34:    	mov	w24, #0xb2e6            // =45798  // guest 0x10b2e6, sampled 0
6eae8e1d38:    	movk	w24, #0x10, lsl #16  // guest 0x10b2e6, sampled 0
6eae8e1d3c:    	str	w24, [x19, #0x228]  // guest 0x10b2e6, sampled 0
6eae8e1d40:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2e9, sampled 0
6eae8e1d44:    	and	x16, x16, x23, lsr #7  // guest 0x10b2e9, sampled 0
6eae8e1d48:    	add	x17, x17, x16  // guest 0x10b2e9, sampled 0
6eae8e1d4c:    	ldp	x16, x17, [x17]  // guest 0x10b2e9, sampled 0
6eae8e1d50:    	and	w30, w23, #0xfffff003  // guest 0x10b2e9, sampled 0
6eae8e1d54:    	cmp	w16, w30  // guest 0x10b2e9, sampled 0
6eae8e1d58:    	b.ne	0x6eae8e2d54 <trace+0x28d4>  // guest 0x10b2e9, sampled 0
6eae8e1d5c:    	add	x30, x17, w23, uxtw  // guest 0x10b2e9, sampled 0
6eae8e1d60:    	ldapr	w2, [x30]  // guest 0x10b2e9, sampled 0
6eae8e1d64:    	add	x1, x19, #0x258  // guest 0x10b2e9, sampled 0
6eae8e1d68:    	mov	x0, x19  // guest 0x10b2e9, sampled 0
6eae8e1d6c:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b2e9, sampled 0
6eae8e1d70:    	add	x16, x16, #0x484  // guest 0x10b2e9, sampled 0
6eae8e1d74:    	blr	x16  // guest 0x10b2e9, sampled 0
6eae8e1d78:    	lsl	w24, w21, #4  // guest 0x10b2e9, sampled 0
6eae8e1d7c:    	add	w24, w24, #0x1a0  // guest 0x10b2e9, sampled 0
6eae8e1d80:    	sxtw	x24, w24  // guest 0x10b2e9, sampled 0
6eae8e1d84:    	add	x1, x24, x19  // guest 0x10b2e9, sampled 0
6eae8e1d88:    	add	x2, x19, #0x258  // guest 0x10b2e9, sampled 0
6eae8e1d8c:    	mov	x0, x19  // guest 0x10b2e9, sampled 0
6eae8e1d90:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b2e9, sampled 0
6eae8e1d94:    	add	x16, x16, #0xb4c  // guest 0x10b2e9, sampled 0
6eae8e1d98:    	blr	x16  // guest 0x10b2e9, sampled 0
6eae8e1d9c:    	ldr	w24, [x19, #0x74]  // guest 0x10b2e9, sampled 0
6eae8e1da0:    	strh	w24, [x19, #0x224]  // guest 0x10b2e9, sampled 0
6eae8e1da4:    	str	w23, [x19, #0x230]  // guest 0x10b2e9, sampled 0
6eae8e1da8:    	ldr	w24, [x19, #0x54]  // guest 0x10b2e9, sampled 0
6eae8e1dac:    	strh	w24, [x19, #0x222]  // guest 0x10b2e9, sampled 0
6eae8e1db0:    	mov	w24, #0xb2e9            // =45801  // guest 0x10b2e9, sampled 0
6eae8e1db4:    	movk	w24, #0x10, lsl #16  // guest 0x10b2e9, sampled 0
6eae8e1db8:    	str	w24, [x19, #0x228]  // guest 0x10b2e9, sampled 0
6eae8e1dbc:    	add	w24, w21, w27  // guest 0x10b2eb, sampled 0
6eae8e1dc0:    	and	w24, w24, #0x7  // guest 0x10b2eb, sampled 0
6eae8e1dc4:    	lsl	w24, w24, #4  // guest 0x10b2eb, sampled 0
6eae8e1dc8:    	add	w24, w24, #0x1a0  // guest 0x10b2eb, sampled 0
6eae8e1dcc:    	sxtw	x24, w24  // guest 0x10b2eb, sampled 0
6eae8e1dd0:    	add	x1, x24, x19  // guest 0x10b2eb, sampled 0
6eae8e1dd4:    	lsl	w24, w21, #4  // guest 0x10b2eb, sampled 0
6eae8e1dd8:    	add	w24, w24, #0x1a0  // guest 0x10b2eb, sampled 0
6eae8e1ddc:    	sxtw	x24, w24  // guest 0x10b2eb, sampled 0
6eae8e1de0:    	add	x2, x24, x19  // guest 0x10b2eb, sampled 0
6eae8e1de4:    	mov	x0, x19  // guest 0x10b2eb, sampled 0
6eae8e1de8:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b2eb, sampled 0
6eae8e1dec:    	add	x16, x16, #0xa78  // guest 0x10b2eb, sampled 0
6eae8e1df0:    	blr	x16  // guest 0x10b2eb, sampled 0
6eae8e1df4:    	sxtw	x24, w21  // guest 0x10b2eb, sampled 0
6eae8e1df8:    	add	x24, x24, x19  // guest 0x10b2eb, sampled 0
6eae8e1dfc:    	strb	w27, [x24, #0x190]  // guest 0x10b2eb, sampled 0
6eae8e1e00:    	add	w21, w21, w27  // guest 0x10b2eb, sampled 0
6eae8e1e04:    	and	w21, w21, #0x7  // guest 0x10b2eb, sampled 0
6eae8e1e08:    	str	w21, [x19, #0x188]  // guest 0x10b2eb, sampled 0
6eae8e1e0c:    	ldr	w24, [x19, #0x54]  // guest 0x10b2eb, sampled 0
6eae8e1e10:    	strh	w24, [x19, #0x222]  // guest 0x10b2eb, sampled 0
6eae8e1e14:    	mov	w24, #0xb2eb            // =45803  // guest 0x10b2eb, sampled 0
6eae8e1e18:    	movk	w24, #0x10, lsl #16  // guest 0x10b2eb, sampled 0
6eae8e1e1c:    	str	w24, [x19, #0x228]  // guest 0x10b2eb, sampled 0
6eae8e1e20:    	add	w24, w22, #0x60  // guest 0x10b2ed, sampled 0
6eae8e1e24:    	mov	w25, w24  // guest 0x10b2ed, sampled 0
6eae8e1e28:    	lsl	w26, w21, #4  // guest 0x10b2ed, sampled 0
6eae8e1e2c:    	add	w26, w26, #0x1a0  // guest 0x10b2ed, sampled 0
6eae8e1e30:    	sxtw	x26, w26  // guest 0x10b2ed, sampled 0
6eae8e1e34:    	add	x1, x26, x19  // guest 0x10b2ed, sampled 0
6eae8e1e38:    	mov	x0, x19  // guest 0x10b2ed, sampled 0
6eae8e1e3c:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b2ed, sampled 0
6eae8e1e40:    	add	x16, x16, #0x5c0  // guest 0x10b2ed, sampled 0
6eae8e1e44:    	blr	x16  // guest 0x10b2ed, sampled 0
6eae8e1e48:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2ed, sampled 0
6eae8e1e4c:    	and	x16, x16, x24, lsr #7  // guest 0x10b2ed, sampled 0
6eae8e1e50:    	add	x17, x17, x16  // guest 0x10b2ed, sampled 0
6eae8e1e54:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b2ed, sampled 0
6eae8e1e58:    	and	w30, w24, #0xfffff003  // guest 0x10b2ed, sampled 2
6eae8e1e5c:    	cmp	w16, w30  // guest 0x10b2ed, sampled 0
6eae8e1e60:    	b.ne	0x6eae8e2d80 <trace+0x2900>  // guest 0x10b2ed, sampled 0
6eae8e1e64:    	add	x30, x17, w24, uxtw  // guest 0x10b2ed, sampled 0
6eae8e1e68:    	stlr	w0, [x30]  // guest 0x10b2ed, sampled 0
6eae8e1e6c:    	sxtw	x24, w21  // guest 0x10b2ed, sampled 0
6eae8e1e70:    	add	x24, x24, x19  // guest 0x10b2ed, sampled 0
6eae8e1e74:    	strb	w27, [x24, #0x190]  // guest 0x10b2ed, sampled 0
6eae8e1e78:    	add	w21, w21, w27  // guest 0x10b2ed, sampled 0
6eae8e1e7c:    	and	w21, w21, #0x7  // guest 0x10b2ed, sampled 0
6eae8e1e80:    	str	w21, [x19, #0x188]  // guest 0x10b2ed, sampled 0
6eae8e1e84:    	ldr	w24, [x19, #0x64]  // guest 0x10b2ed, sampled 0
6eae8e1e88:    	strh	w24, [x19, #0x224]  // guest 0x10b2ed, sampled 0
6eae8e1e8c:    	str	w25, [x19, #0x230]  // guest 0x10b2ed, sampled 0
6eae8e1e90:    	ldr	w24, [x19, #0x54]  // guest 0x10b2ed, sampled 0
6eae8e1e94:    	strh	w24, [x19, #0x222]  // guest 0x10b2ed, sampled 0
6eae8e1e98:    	mov	w24, #0xb2ed            // =45805  // guest 0x10b2ed, sampled 0
6eae8e1e9c:    	movk	w24, #0x10, lsl #16  // guest 0x10b2ed, sampled 0
6eae8e1ea0:    	str	w24, [x19, #0x228]  // guest 0x10b2ed, sampled 0
6eae8e1ea4:    	add	w24, w20, #0x2c  // guest 0x10b2f1, sampled 0
6eae8e1ea8:    	mov	w25, w24  // guest 0x10b2f1, sampled 0
6eae8e1eac:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2f1, sampled 0
6eae8e1eb0:    	and	x16, x16, x24, lsr #7  // guest 0x10b2f1, sampled 0
6eae8e1eb4:    	add	x17, x17, x16  // guest 0x10b2f1, sampled 0
6eae8e1eb8:    	ldp	x16, x17, [x17]  // guest 0x10b2f1, sampled 0
6eae8e1ebc:    	and	w30, w24, #0xfffff003  // guest 0x10b2f1, sampled 0
6eae8e1ec0:    	cmp	w16, w30  // guest 0x10b2f1, sampled 0
6eae8e1ec4:    	b.ne	0x6eae8e2dac <trace+0x292c>  // guest 0x10b2f1, sampled 0
6eae8e1ec8:    	add	x30, x17, w24, uxtw  // guest 0x10b2f1, sampled 0
6eae8e1ecc:    	ldapr	w2, [x30]  // guest 0x10b2f1, sampled 0
6eae8e1ed0:    	add	w24, w21, #0x7  // guest 0x10b2f1, sampled 0
6eae8e1ed4:    	and	w24, w24, #0x7  // guest 0x10b2f1, sampled 0
6eae8e1ed8:    	lsl	w24, w24, #4  // guest 0x10b2f1, sampled 0
6eae8e1edc:    	add	w24, w24, #0x1a0  // guest 0x10b2f1, sampled 0
6eae8e1ee0:    	sxtw	x24, w24  // guest 0x10b2f1, sampled 0
6eae8e1ee4:    	add	x1, x24, x19  // guest 0x10b2f1, sampled 0
6eae8e1ee8:    	mov	x0, x19  // guest 0x10b2f1, sampled 0
6eae8e1eec:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b2f1, sampled 0
6eae8e1ef0:    	add	x16, x16, #0x484  // guest 0x10b2f1, sampled 0
6eae8e1ef4:    	blr	x16  // guest 0x10b2f1, sampled 0
6eae8e1ef8:    	sub	w21, w21, #0x1  // guest 0x10b2f1, sampled 0
6eae8e1efc:    	and	w21, w21, #0x7  // guest 0x10b2f1, sampled 0
6eae8e1f00:    	str	w21, [x19, #0x188]  // guest 0x10b2f1, sampled 0
6eae8e1f04:    	sxtw	x24, w21  // guest 0x10b2f1, sampled 0
6eae8e1f08:    	add	x24, x24, x19  // guest 0x10b2f1, sampled 0
6eae8e1f0c:    	strb	wzr, [x24, #0x190]  // guest 0x10b2f1, sampled 0
6eae8e1f10:    	ldr	w24, [x19, #0x74]  // guest 0x10b2f1, sampled 0
6eae8e1f14:    	strh	w24, [x19, #0x224]  // guest 0x10b2f1, sampled 0
6eae8e1f18:    	str	w25, [x19, #0x230]  // guest 0x10b2f1, sampled 0
6eae8e1f1c:    	ldr	w24, [x19, #0x54]  // guest 0x10b2f1, sampled 0
6eae8e1f20:    	strh	w24, [x19, #0x222]  // guest 0x10b2f1, sampled 0
6eae8e1f24:    	mov	w24, #0xb2f1            // =45809  // guest 0x10b2f1, sampled 0
6eae8e1f28:    	movk	w24, #0x10, lsl #16  // guest 0x10b2f1, sampled 0
6eae8e1f2c:    	str	w24, [x19, #0x228]  // guest 0x10b2f1, sampled 0
6eae8e1f30:    	add	w24, w23, #0x8  // guest 0x10b2f4, sampled 0
6eae8e1f34:    	mov	w25, w24  // guest 0x10b2f4, sampled 0
6eae8e1f38:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2f4, sampled 0
6eae8e1f3c:    	and	x16, x16, x24, lsr #7  // guest 0x10b2f4, sampled 0
6eae8e1f40:    	add	x17, x17, x16  // guest 0x10b2f4, sampled 0
6eae8e1f44:    	ldp	x16, x17, [x17]  // guest 0x10b2f4, sampled 0
6eae8e1f48:    	and	w30, w24, #0xfffff003  // guest 0x10b2f4, sampled 1
6eae8e1f4c:    	cmp	w16, w30  // guest 0x10b2f4, sampled 0
6eae8e1f50:    	b.ne	0x6eae8e2dd8 <trace+0x2958>  // guest 0x10b2f4, sampled 0
6eae8e1f54:    	add	x30, x17, w24, uxtw  // guest 0x10b2f4, sampled 0
6eae8e1f58:    	ldapr	w2, [x30]  // guest 0x10b2f4, sampled 0
6eae8e1f5c:    	add	x1, x19, #0x258  // guest 0x10b2f4, sampled 0
6eae8e1f60:    	mov	x0, x19  // guest 0x10b2f4, sampled 0
6eae8e1f64:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b2f4, sampled 0
6eae8e1f68:    	add	x16, x16, #0x484  // guest 0x10b2f4, sampled 0
6eae8e1f6c:    	blr	x16  // guest 0x10b2f4, sampled 0
6eae8e1f70:    	lsl	w24, w21, #4  // guest 0x10b2f4, sampled 0
6eae8e1f74:    	add	w24, w24, #0x1a0  // guest 0x10b2f4, sampled 0
6eae8e1f78:    	sxtw	x24, w24  // guest 0x10b2f4, sampled 0
6eae8e1f7c:    	add	x1, x24, x19  // guest 0x10b2f4, sampled 0
6eae8e1f80:    	add	x2, x19, #0x258  // guest 0x10b2f4, sampled 0
6eae8e1f84:    	mov	x0, x19  // guest 0x10b2f4, sampled 0
6eae8e1f88:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfcb000>  // guest 0x10b2f4, sampled 0
6eae8e1f8c:    	add	x16, x16, #0xb4c  // guest 0x10b2f4, sampled 0
6eae8e1f90:    	blr	x16  // guest 0x10b2f4, sampled 0
6eae8e1f94:    	ldr	w24, [x19, #0x74]  // guest 0x10b2f4, sampled 0
6eae8e1f98:    	strh	w24, [x19, #0x224]  // guest 0x10b2f4, sampled 0
6eae8e1f9c:    	str	w25, [x19, #0x230]  // guest 0x10b2f4, sampled 0
6eae8e1fa0:    	ldr	w24, [x19, #0x54]  // guest 0x10b2f4, sampled 0
6eae8e1fa4:    	strh	w24, [x19, #0x222]  // guest 0x10b2f4, sampled 0
6eae8e1fa8:    	mov	w24, #0xb2f4            // =45812  // guest 0x10b2f4, sampled 0
6eae8e1fac:    	movk	w24, #0x10, lsl #16  // guest 0x10b2f4, sampled 0
6eae8e1fb0:    	str	w24, [x19, #0x228]  // guest 0x10b2f4, sampled 0
6eae8e1fb4:    	add	w24, w20, #0x28  // guest 0x10b2f7, sampled 0
6eae8e1fb8:    	mov	w25, w24  // guest 0x10b2f7, sampled 0
6eae8e1fbc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2f7, sampled 0
6eae8e1fc0:    	and	x16, x16, x24, lsr #7  // guest 0x10b2f7, sampled 0
6eae8e1fc4:    	add	x17, x17, x16  // guest 0x10b2f7, sampled 0
6eae8e1fc8:    	ldp	x16, x17, [x17]  // guest 0x10b2f7, sampled 0
6eae8e1fcc:    	and	w30, w24, #0xfffff003  // guest 0x10b2f7, sampled 0
6eae8e1fd0:    	cmp	w16, w30  // guest 0x10b2f7, sampled 0
6eae8e1fd4:    	b.ne	0x6eae8e2e04 <trace+0x2984>  // guest 0x10b2f7, sampled 0
6eae8e1fd8:    	add	x30, x17, w24, uxtw  // guest 0x10b2f7, sampled 0
6eae8e1fdc:    	ldapr	w2, [x30]  // guest 0x10b2f7, sampled 0
6eae8e1fe0:    	add	w24, w21, #0x7  // guest 0x10b2f7, sampled 0
6eae8e1fe4:    	and	w24, w24, #0x7  // guest 0x10b2f7, sampled 0
6eae8e1fe8:    	lsl	w24, w24, #4  // guest 0x10b2f7, sampled 0
6eae8e1fec:    	add	w24, w24, #0x1a0  // guest 0x10b2f7, sampled 0
6eae8e1ff0:    	sxtw	x24, w24  // guest 0x10b2f7, sampled 0
6eae8e1ff4:    	add	x1, x24, x19  // guest 0x10b2f7, sampled 0
6eae8e1ff8:    	mov	x0, x19  // guest 0x10b2f7, sampled 0
6eae8e1ffc:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfca000>  // guest 0x10b2f7, sampled 0
6eae8e2000:    	add	x16, x16, #0x484  // guest 0x10b2f7, sampled 0
6eae8e2004:    	blr	x16  // guest 0x10b2f7, sampled 0
6eae8e2008:    	sub	w21, w21, #0x1  // guest 0x10b2f7, sampled 0
6eae8e200c:    	and	w21, w21, #0x7  // guest 0x10b2f7, sampled 0
6eae8e2010:    	str	w21, [x19, #0x188]  // guest 0x10b2f7, sampled 0
6eae8e2014:    	sxtw	x24, w21  // guest 0x10b2f7, sampled 0
6eae8e2018:    	add	x24, x24, x19  // guest 0x10b2f7, sampled 0
6eae8e201c:    	strb	wzr, [x24, #0x190]  // guest 0x10b2f7, sampled 0
6eae8e2020:    	ldr	w24, [x19, #0x74]  // guest 0x10b2f7, sampled 0
6eae8e2024:    	strh	w24, [x19, #0x224]  // guest 0x10b2f7, sampled 0
6eae8e2028:    	str	w25, [x19, #0x230]  // guest 0x10b2f7, sampled 0
6eae8e202c:    	ldr	w24, [x19, #0x54]  // guest 0x10b2f7, sampled 0
6eae8e2030:    	strh	w24, [x19, #0x222]  // guest 0x10b2f7, sampled 0
6eae8e2034:    	mov	w24, #0xb2f7            // =45815  // guest 0x10b2f7, sampled 0
6eae8e2038:    	movk	w24, #0x10, lsl #16  // guest 0x10b2f7, sampled 0
6eae8e203c:    	str	w24, [x19, #0x228]  // guest 0x10b2f7, sampled 0
6eae8e2040:    	add	w24, w23, #0x4  // guest 0x10b2fa, sampled 0
6eae8e2044:    	mov	w25, w24  // guest 0x10b2fa, sampled 0
6eae8e2048:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2fa, sampled 0
6eae8e204c:    	and	x16, x16, x24, lsr #7  // guest 0x10b2fa, sampled 0
6eae8e2050:    	add	x17, x17, x16  // guest 0x10b2fa, sampled 0
6eae8e2054:    	ldp	x16, x17, [x17]  // guest 0x10b2fa, sampled 0
6eae8e2058:    	and	w30, w24, #0xfffff003  // guest 0x10b2fa, sampled 0
6eae8e205c:    	cmp	w16, w30  // guest 0x10b2fa, sampled 0
6eae8e2060:    	b.ne	0x6eae8e2e30 <trace+0x29b0>  // guest 0x10b2fa, sampled 0
6eae8e2064:    	add	x30, x17, w24, uxtw  // guest 0x10b2fa, sampled 0
6eae8e2068:    	ldapr	w2, [x30]  // guest 0x10b2fa, sampled 0
6eae8e206c:    	add	x1, x19, #0x258  // guest 0x10b2fa, sampled 0
6eae8e2070:    	mov	x0, x19  // guest 0x10b2fa, sampled 0
6eae8e2074:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfc9000>  // guest 0x10b2fa, sampled 0
6eae8e2078:    	add	x16, x16, #0x484  // guest 0x10b2fa, sampled 0
6eae8e207c:    	blr	x16  // guest 0x10b2fa, sampled 0
6eae8e2080:    	lsl	w24, w21, #4  // guest 0x10b2fa, sampled 0
6eae8e2084:    	add	w24, w24, #0x1a0  // guest 0x10b2fa, sampled 0
6eae8e2088:    	sxtw	x24, w24  // guest 0x10b2fa, sampled 0
6eae8e208c:    	add	x1, x24, x19  // guest 0x10b2fa, sampled 0
6eae8e2090:    	add	x2, x19, #0x258  // guest 0x10b2fa, sampled 0
6eae8e2094:    	mov	x0, x19  // guest 0x10b2fa, sampled 0
6eae8e2098:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfca000>  // guest 0x10b2fa, sampled 0
6eae8e209c:    	add	x16, x16, #0xb4c  // guest 0x10b2fa, sampled 0
6eae8e20a0:    	blr	x16  // guest 0x10b2fa, sampled 0
6eae8e20a4:    	ldr	w24, [x19, #0x74]  // guest 0x10b2fa, sampled 0
6eae8e20a8:    	strh	w24, [x19, #0x224]  // guest 0x10b2fa, sampled 0
6eae8e20ac:    	str	w25, [x19, #0x230]  // guest 0x10b2fa, sampled 0
6eae8e20b0:    	ldr	w24, [x19, #0x54]  // guest 0x10b2fa, sampled 0
6eae8e20b4:    	strh	w24, [x19, #0x222]  // guest 0x10b2fa, sampled 0
6eae8e20b8:    	mov	w24, #0xb2fa            // =45818  // guest 0x10b2fa, sampled 0
6eae8e20bc:    	movk	w24, #0x10, lsl #16  // guest 0x10b2fa, sampled 0
6eae8e20c0:    	str	w24, [x19, #0x228]  // guest 0x10b2fa, sampled 0
6eae8e20c4:    	add	w24, w21, w27  // guest 0x10b2fd, sampled 0
6eae8e20c8:    	and	w24, w24, #0x7  // guest 0x10b2fd, sampled 0
6eae8e20cc:    	lsl	w24, w24, #4  // guest 0x10b2fd, sampled 0
6eae8e20d0:    	add	w24, w24, #0x1a0  // guest 0x10b2fd, sampled 0
6eae8e20d4:    	sxtw	x24, w24  // guest 0x10b2fd, sampled 0
6eae8e20d8:    	add	x1, x24, x19  // guest 0x10b2fd, sampled 0
6eae8e20dc:    	lsl	w24, w21, #4  // guest 0x10b2fd, sampled 0
6eae8e20e0:    	add	w24, w24, #0x1a0  // guest 0x10b2fd, sampled 0
6eae8e20e4:    	sxtw	x24, w24  // guest 0x10b2fd, sampled 0
6eae8e20e8:    	add	x2, x24, x19  // guest 0x10b2fd, sampled 0
6eae8e20ec:    	mov	x0, x19  // guest 0x10b2fd, sampled 0
6eae8e20f0:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfca000>  // guest 0x10b2fd, sampled 0
6eae8e20f4:    	add	x16, x16, #0xa78  // guest 0x10b2fd, sampled 0
6eae8e20f8:    	blr	x16  // guest 0x10b2fd, sampled 0
6eae8e20fc:    	sxtw	x24, w21  // guest 0x10b2fd, sampled 0
6eae8e2100:    	add	x24, x24, x19  // guest 0x10b2fd, sampled 0
6eae8e2104:    	strb	w27, [x24, #0x190]  // guest 0x10b2fd, sampled 0
6eae8e2108:    	add	w21, w21, w27  // guest 0x10b2fd, sampled 0
6eae8e210c:    	and	w21, w21, #0x7  // guest 0x10b2fd, sampled 0
6eae8e2110:    	str	w21, [x19, #0x188]  // guest 0x10b2fd, sampled 0
6eae8e2114:    	ldr	w24, [x19, #0x54]  // guest 0x10b2fd, sampled 0
6eae8e2118:    	strh	w24, [x19, #0x222]  // guest 0x10b2fd, sampled 0
6eae8e211c:    	mov	w24, #0xb2fd            // =45821  // guest 0x10b2fd, sampled 0
6eae8e2120:    	movk	w24, #0x10, lsl #16  // guest 0x10b2fd, sampled 0
6eae8e2124:    	str	w24, [x19, #0x228]  // guest 0x10b2fd, sampled 0
6eae8e2128:    	add	w20, w20, #0x24  // guest 0x10b2ff, sampled 0
6eae8e212c:    	mov	w24, w20  // guest 0x10b2ff, sampled 0
6eae8e2130:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2ff, sampled 0
6eae8e2134:    	and	x16, x16, x20, lsr #7  // guest 0x10b2ff, sampled 0
6eae8e2138:    	add	x17, x17, x16  // guest 0x10b2ff, sampled 0
6eae8e213c:    	ldp	x16, x17, [x17]  // guest 0x10b2ff, sampled 0
6eae8e2140:    	and	w30, w20, #0xfffff003  // guest 0x10b2ff, sampled 0
6eae8e2144:    	cmp	w16, w30  // guest 0x10b2ff, sampled 0
6eae8e2148:    	b.ne	0x6eae8e2e5c <trace+0x29dc>  // guest 0x10b2ff, sampled 0
6eae8e214c:    	add	x30, x17, w20, uxtw  // guest 0x10b2ff, sampled 0
6eae8e2150:    	ldapr	w2, [x30]  // guest 0x10b2ff, sampled 0
6eae8e2154:    	add	w20, w21, #0x7  // guest 0x10b2ff, sampled 0
6eae8e2158:    	and	w20, w20, #0x7  // guest 0x10b2ff, sampled 0
6eae8e215c:    	lsl	w20, w20, #4  // guest 0x10b2ff, sampled 0
6eae8e2160:    	add	w20, w20, #0x1a0  // guest 0x10b2ff, sampled 0
6eae8e2164:    	sxtw	x20, w20  // guest 0x10b2ff, sampled 0
6eae8e2168:    	add	x1, x20, x19  // guest 0x10b2ff, sampled 0
6eae8e216c:    	mov	x0, x19  // guest 0x10b2ff, sampled 0
6eae8e2170:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfc9000>  // guest 0x10b2ff, sampled 0
6eae8e2174:    	add	x16, x16, #0x484  // guest 0x10b2ff, sampled 0
6eae8e2178:    	blr	x16  // guest 0x10b2ff, sampled 0
6eae8e217c:    	sub	w20, w21, #0x1  // guest 0x10b2ff, sampled 0
6eae8e2180:    	and	w20, w20, #0x7  // guest 0x10b2ff, sampled 0
6eae8e2184:    	str	w20, [x19, #0x188]  // guest 0x10b2ff, sampled 0
6eae8e2188:    	sxtw	x21, w20  // guest 0x10b2ff, sampled 0
6eae8e218c:    	add	x21, x21, x19  // guest 0x10b2ff, sampled 0
6eae8e2190:    	strb	wzr, [x21, #0x190]  // guest 0x10b2ff, sampled 0
6eae8e2194:    	ldr	w21, [x19, #0x74]  // guest 0x10b2ff, sampled 0
6eae8e2198:    	strh	w21, [x19, #0x224]  // guest 0x10b2ff, sampled 0
6eae8e219c:    	str	w24, [x19, #0x230]  // guest 0x10b2ff, sampled 0
6eae8e21a0:    	ldr	w21, [x19, #0x54]  // guest 0x10b2ff, sampled 0
6eae8e21a4:    	strh	w21, [x19, #0x222]  // guest 0x10b2ff, sampled 0
6eae8e21a8:    	mov	w21, #0xb2ff            // =45823  // guest 0x10b2ff, sampled 0
6eae8e21ac:    	movk	w21, #0x10, lsl #16  // guest 0x10b2ff, sampled 0
6eae8e21b0:    	str	w21, [x19, #0x228]  // guest 0x10b2ff, sampled 0
6eae8e21b4:    	ldr	w21, [x19, #0x18]  // guest 0x10b302, sampled 0
6eae8e21b8:    	lsl	w24, w21, w27  // guest 0x10b302, sampled 0
6eae8e21bc:    	add	w21, w24, w21  // guest 0x10b302, sampled 0
6eae8e21c0:    	str	w21, [x19]  // guest 0x10b302, sampled 0
6eae8e21c4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b305, sampled 0
6eae8e21c8:    	and	x16, x16, x23, lsr #7  // guest 0x10b305, sampled 0
6eae8e21cc:    	add	x17, x17, x16  // guest 0x10b305, sampled 0
6eae8e21d0:    	ldp	x16, x17, [x17]  // guest 0x10b305, sampled 1
6eae8e21d4:    	and	w30, w23, #0xfffff003  // guest 0x10b305, sampled 0
6eae8e21d8:    	cmp	w16, w30  // guest 0x10b305, sampled 0
6eae8e21dc:    	b.ne	0x6eae8e2e88 <trace+0x2a08>  // guest 0x10b305, sampled 0
6eae8e21e0:    	add	x30, x17, w23, uxtw  // guest 0x10b305, sampled 0
6eae8e21e4:    	ldapr	w2, [x30]  // guest 0x10b305, sampled 0
6eae8e21e8:    	add	x1, x19, #0x258  // guest 0x10b305, sampled 0
6eae8e21ec:    	mov	x0, x19  // guest 0x10b305, sampled 0
6eae8e21f0:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfc9000>  // guest 0x10b305, sampled 0
6eae8e21f4:    	add	x16, x16, #0x484  // guest 0x10b305, sampled 0
6eae8e21f8:    	blr	x16  // guest 0x10b305, sampled 0
6eae8e21fc:    	lsl	w24, w20, #4  // guest 0x10b305, sampled 0
6eae8e2200:    	add	w24, w24, #0x1a0  // guest 0x10b305, sampled 0
6eae8e2204:    	sxtw	x24, w24  // guest 0x10b305, sampled 0
6eae8e2208:    	add	x1, x24, x19  // guest 0x10b305, sampled 0
6eae8e220c:    	add	x2, x19, #0x258  // guest 0x10b305, sampled 0
6eae8e2210:    	mov	x0, x19  // guest 0x10b305, sampled 0
6eae8e2214:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfca000>  // guest 0x10b305, sampled 0
6eae8e2218:    	add	x16, x16, #0xb4c  // guest 0x10b305, sampled 0
6eae8e221c:    	blr	x16  // guest 0x10b305, sampled 0
6eae8e2220:    	ldr	w24, [x19, #0x74]  // guest 0x10b305, sampled 0
6eae8e2224:    	strh	w24, [x19, #0x224]  // guest 0x10b305, sampled 0
6eae8e2228:    	str	w23, [x19, #0x230]  // guest 0x10b305, sampled 0
6eae8e222c:    	ldr	w23, [x19, #0x54]  // guest 0x10b305, sampled 0
6eae8e2230:    	strh	w23, [x19, #0x222]  // guest 0x10b305, sampled 0
6eae8e2234:    	mov	w23, #0xb305            // =45829  // guest 0x10b305, sampled 0
6eae8e2238:    	movk	w23, #0x10, lsl #16  // guest 0x10b305, sampled 0
6eae8e223c:    	str	w23, [x19, #0x228]  // guest 0x10b305, sampled 0
6eae8e2240:    	mov	w23, #0x629c            // =25244  // guest 0x10b307, sampled 0
6eae8e2244:    	movk	w23, #0x4f, lsl #16  // guest 0x10b307, sampled 0
6eae8e2248:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b307, sampled 0
6eae8e224c:    	and	x16, x16, x23, lsr #7  // guest 0x10b307, sampled 0
6eae8e2250:    	add	x17, x17, x16  // guest 0x10b307, sampled 0
6eae8e2254:    	ldp	x16, x17, [x17]  // guest 0x10b307, sampled 0
6eae8e2258:    	and	w30, w23, #0xfffff003  // guest 0x10b307, sampled 0
6eae8e225c:    	cmp	w16, w30  // guest 0x10b307, sampled 0
6eae8e2260:    	b.ne	0x6eae8e2eb4 <trace+0x2a34>  // guest 0x10b307, sampled 0
6eae8e2264:    	add	x30, x17, w23, uxtw  // guest 0x10b307, sampled 0
6eae8e2268:    	ldapr	w24, [x30]  // guest 0x10b307, sampled 0
6eae8e226c:    	str	w24, [x19, #0x4]  // guest 0x10b307, sampled 0
6eae8e2270:    	lsl	w25, w21, #2  // guest 0x10b30d, sampled 0
6eae8e2274:    	lsl	w21, w21, #3  // guest 0x10b30d, sampled 0
6eae8e2278:    	str	w21, [x19]  // guest 0x10b30d, sampled 0
6eae8e227c:    	str	w21, [x19, #0x28]  // guest 0x10b30d, sampled 0
6eae8e2280:    	str	w25, [x19, #0x2c]  // guest 0x10b30d, sampled 0
6eae8e2284:    	add	w24, w24, w21  // guest 0x10b310, sampled 0
6eae8e2288:    	str	w24, [x19, #0x8]  // guest 0x10b310, sampled 0
6eae8e228c:    	add	w25, w22, #0x44  // guest 0x10b313, sampled 0
6eae8e2290:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b313, sampled 0
6eae8e2294:    	and	x16, x16, x25, lsr #7  // guest 0x10b313, sampled 0
6eae8e2298:    	add	x17, x17, x16  // guest 0x10b313, sampled 0
6eae8e229c:    	ldp	x16, x17, [x17]  // guest 0x10b313, sampled 0
6eae8e22a0:    	and	w30, w25, #0xfffff003  // guest 0x10b313, sampled 0
6eae8e22a4:    	cmp	w16, w30  // guest 0x10b313, sampled 0
6eae8e22a8:    	b.ne	0x6eae8e2ee0 <trace+0x2a60>  // guest 0x10b313, sampled 0
6eae8e22ac:    	add	x30, x17, w25, uxtw  // guest 0x10b313, sampled 0
6eae8e22b0:    	ldapr	w25, [x30]  // guest 0x10b313, sampled 0
6eae8e22b4:    	str	w25, [x19, #0x4]  // guest 0x10b313, sampled 0
6eae8e22b8:    	add	w26, w20, w27  // guest 0x10b317, sampled 0
6eae8e22bc:    	and	w26, w26, #0x7  // guest 0x10b317, sampled 0
6eae8e22c0:    	lsl	w26, w26, #4  // guest 0x10b317, sampled 0
6eae8e22c4:    	add	w26, w26, #0x1a0  // guest 0x10b317, sampled 0
6eae8e22c8:    	sxtw	x26, w26  // guest 0x10b317, sampled 0
6eae8e22cc:    	add	x1, x26, x19  // guest 0x10b317, sampled 0
6eae8e22d0:    	lsl	w26, w20, #4  // guest 0x10b317, sampled 0
6eae8e22d4:    	add	w26, w26, #0x1a0  // guest 0x10b317, sampled 0
6eae8e22d8:    	sxtw	x26, w26  // guest 0x10b317, sampled 0
6eae8e22dc:    	add	x2, x26, x19  // guest 0x10b317, sampled 0
6eae8e22e0:    	mov	x0, x19  // guest 0x10b317, sampled 0
6eae8e22e4:    	adrp	x16, 0x6efc8ab000 <trace+0x4dfca000>  // guest 0x10b317, sampled 0
6eae8e22e8:    	add	x16, x16, #0xa78  // guest 0x10b317, sampled 0
6eae8e22ec:    	blr	x16  // guest 0x10b317, sampled 0
6eae8e22f0:    	sxtw	x26, w20  // guest 0x10b317, sampled 0
6eae8e22f4:    	add	x26, x26, x19  // guest 0x10b317, sampled 0
6eae8e22f8:    	strb	w27, [x26, #0x190]  // guest 0x10b317, sampled 0
6eae8e22fc:    	add	w20, w20, w27  // guest 0x10b317, sampled 0
6eae8e2300:    	and	w20, w20, #0x7  // guest 0x10b317, sampled 0
6eae8e2304:    	str	w20, [x19, #0x188]  // guest 0x10b317, sampled 0
6eae8e2308:    	ldr	w26, [x19, #0x54]  // guest 0x10b317, sampled 0
6eae8e230c:    	strh	w26, [x19, #0x222]  // guest 0x10b317, sampled 0
6eae8e2310:    	mov	w26, #0xb317            // =45847  // guest 0x10b317, sampled 0
6eae8e2314:    	movk	w26, #0x10, lsl #16  // guest 0x10b317, sampled 0
6eae8e2318:    	str	w26, [x19, #0x228]  // guest 0x10b317, sampled 0
6eae8e231c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b319, sampled 0
6eae8e2320:    	and	x16, x16, x24, lsr #7  // guest 0x10b319, sampled 0
6eae8e2324:    	add	x17, x17, x16  // guest 0x10b319, sampled 0
6eae8e2328:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b319, sampled 0
6eae8e232c:    	and	w30, w24, #0xfffff003  // guest 0x10b319, sampled 1
6eae8e2330:    	cmp	w16, w30  // guest 0x10b319, sampled 0
6eae8e2334:    	b.ne	0x6eae8e2f0c <trace+0x2a8c>  // guest 0x10b319, sampled 0
6eae8e2338:    	add	x30, x17, w24, uxtw  // guest 0x10b319, sampled 0
6eae8e233c:    	stlr	w25, [x30]  // guest 0x10b319, sampled 0
6eae8e2340:    	add	w25, w22, #0x48  // guest 0x10b31b, sampled 0
6eae8e2344:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b31b, sampled 0
6eae8e2348:    	and	x16, x16, x25, lsr #7  // guest 0x10b31b, sampled 0
6eae8e234c:    	add	x17, x17, x16  // guest 0x10b31b, sampled 0
6eae8e2350:    	ldp	x16, x17, [x17]  // guest 0x10b31b, sampled 0
6eae8e2354:    	and	w30, w25, #0xfffff003  // guest 0x10b31b, sampled 0
6eae8e2358:    	cmp	w16, w30  // guest 0x10b31b, sampled 0
6eae8e235c:    	b.ne	0x6eae8e2f38 <trace+0x2ab8>  // guest 0x10b31b, sampled 0
6eae8e2360:    	add	x30, x17, w25, uxtw  // guest 0x10b31b, sampled 0
6eae8e2364:    	ldapr	w25, [x30]  // guest 0x10b31b, sampled 0
6eae8e2368:    	str	w25, [x19, #0x4]  // guest 0x10b31b, sampled 0
6eae8e236c:    	add	w26, w24, #0x4  // guest 0x10b31f, sampled 0
6eae8e2370:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b31f, sampled 0
6eae8e2374:    	and	x16, x16, x26, lsr #7  // guest 0x10b31f, sampled 0
6eae8e2378:    	add	x17, x17, x16  // guest 0x10b31f, sampled 0
6eae8e237c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b31f, sampled 0
6eae8e2380:    	and	w30, w26, #0xfffff003  // guest 0x10b31f, sampled 0
6eae8e2384:    	cmp	w16, w30  // guest 0x10b31f, sampled 0
6eae8e2388:    	b.ne	0x6eae8e2f64 <trace+0x2ae4>  // guest 0x10b31f, sampled 0
6eae8e238c:    	add	x30, x17, w26, uxtw  // guest 0x10b31f, sampled 0
6eae8e2390:    	stlr	w25, [x30]  // guest 0x10b31f, sampled 0
6eae8e2394:    	add	w25, w22, #0x64  // guest 0x10b322, sampled 0
6eae8e2398:    	mov	w26, w25  // guest 0x10b322, sampled 0
6eae8e239c:    	lsl	w28, w20, #4  // guest 0x10b322, sampled 0
6eae8e23a0:    	add	w28, w28, #0x1a0  // guest 0x10b322, sampled 0
6eae8e23a4:    	sxtw	x28, w28  // guest 0x10b322, sampled 0
6eae8e23a8:    	add	x1, x28, x19  // guest 0x10b322, sampled 0
6eae8e23ac:    	mov	x0, x19  // guest 0x10b322, sampled 0
6eae8e23b0:    	adrp	x16, 0x6efc8aa000 <trace+0x4dfc9000>  // guest 0x10b322, sampled 0
6eae8e23b4:    	add	x16, x16, #0x5c0  // guest 0x10b322, sampled 0
6eae8e23b8:    	blr	x16  // guest 0x10b322, sampled 0
6eae8e23bc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b322, sampled 0
6eae8e23c0:    	and	x16, x16, x25, lsr #7  // guest 0x10b322, sampled 0
6eae8e23c4:    	add	x17, x17, x16  // guest 0x10b322, sampled 0
6eae8e23c8:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b322, sampled 0
6eae8e23cc:    	and	w30, w25, #0xfffff003  // guest 0x10b322, sampled 0
6eae8e23d0:    	cmp	w16, w30  // guest 0x10b322, sampled 0
6eae8e23d4:    	b.ne	0x6eae8e2f90 <trace+0x2b10>  // guest 0x10b322, sampled 0
6eae8e23d8:    	add	x30, x17, w25, uxtw  // guest 0x10b322, sampled 0
6eae8e23dc:    	stlr	w0, [x30]  // guest 0x10b322, sampled 0
6eae8e23e0:    	sxtw	x25, w20  // guest 0x10b322, sampled 0
6eae8e23e4:    	add	x25, x25, x19  // guest 0x10b322, sampled 0
6eae8e23e8:    	strb	w27, [x25, #0x190]  // guest 0x10b322, sampled 0
6eae8e23ec:    	add	w20, w20, w27  // guest 0x10b322, sampled 0
6eae8e23f0:    	and	w20, w20, #0x7  // guest 0x10b322, sampled 0
6eae8e23f4:    	str	w20, [x19, #0x188]  // guest 0x10b322, sampled 0
6eae8e23f8:    	ldr	w20, [x19, #0x64]  // guest 0x10b322, sampled 0
6eae8e23fc:    	strh	w20, [x19, #0x224]  // guest 0x10b322, sampled 0
6eae8e2400:    	str	w26, [x19, #0x230]  // guest 0x10b322, sampled 0
6eae8e2404:    	ldr	w20, [x19, #0x54]  // guest 0x10b322, sampled 0
6eae8e2408:    	strh	w20, [x19, #0x222]  // guest 0x10b322, sampled 0
6eae8e240c:    	mov	w20, #0xb322            // =45858  // guest 0x10b322, sampled 0
6eae8e2410:    	movk	w20, #0x10, lsl #16  // guest 0x10b322, sampled 0
6eae8e2414:    	str	w20, [x19, #0x228]  // guest 0x10b322, sampled 0
6eae8e2418:    	add	w20, w22, #0x4c  // guest 0x10b326, sampled 0
6eae8e241c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b326, sampled 0
6eae8e2420:    	and	x16, x16, x20, lsr #7  // guest 0x10b326, sampled 0
6eae8e2424:    	add	x17, x17, x16  // guest 0x10b326, sampled 0
6eae8e2428:    	ldp	x16, x17, [x17]  // guest 0x10b326, sampled 0
6eae8e242c:    	and	w30, w20, #0xfffff003  // guest 0x10b326, sampled 0
6eae8e2430:    	cmp	w16, w30  // guest 0x10b326, sampled 0
6eae8e2434:    	b.ne	0x6eae8e2fbc <trace+0x2b3c>  // guest 0x10b326, sampled 0
6eae8e2438:    	add	x30, x17, w20, uxtw  // guest 0x10b326, sampled 0
6eae8e243c:    	ldapr	w20, [x30]  // guest 0x10b326, sampled 0
6eae8e2440:    	str	w20, [x19, #0x4]  // guest 0x10b326, sampled 0
6eae8e2444:    	add	w24, w24, #0x8  // guest 0x10b32a, sampled 0
6eae8e2448:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b32a, sampled 0
6eae8e244c:    	and	x16, x16, x24, lsr #7  // guest 0x10b32a, sampled 0
6eae8e2450:    	add	x17, x17, x16  // guest 0x10b32a, sampled 0
6eae8e2454:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b32a, sampled 0
6eae8e2458:    	and	w30, w24, #0xfffff003  // guest 0x10b32a, sampled 0
6eae8e245c:    	cmp	w16, w30  // guest 0x10b32a, sampled 0
6eae8e2460:    	b.ne	0x6eae8e2fe8 <trace+0x2b68>  // guest 0x10b32a, sampled 0
6eae8e2464:    	add	x30, x17, w24, uxtw  // guest 0x10b32a, sampled 0
6eae8e2468:    	stlr	w20, [x30]  // guest 0x10b32a, sampled 0
6eae8e246c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b32d, sampled 0
6eae8e2470:    	and	x16, x16, x23, lsr #7  // guest 0x10b32d, sampled 0
6eae8e2474:    	add	x17, x17, x16  // guest 0x10b32d, sampled 0
6eae8e2478:    	ldp	x16, x17, [x17]  // guest 0x10b32d, sampled 0
6eae8e247c:    	and	w30, w23, #0xfffff003  // guest 0x10b32d, sampled 0
6eae8e2480:    	cmp	w16, w30  // guest 0x10b32d, sampled 0
6eae8e2484:    	b.ne	0x6eae8e3014 <trace+0x2b94>  // guest 0x10b32d, sampled 0
6eae8e2488:    	add	x30, x17, w23, uxtw  // guest 0x10b32d, sampled 0
6eae8e248c:    	ldapr	w20, [x30]  // guest 0x10b32d, sampled 0
6eae8e2490:    	str	w20, [x19, #0x8]  // guest 0x10b32d, sampled 0
6eae8e2494:    	add	w23, w22, #0x5c  // guest 0x10b333, sampled 0
6eae8e2498:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b333, sampled 0
6eae8e249c:    	and	x16, x16, x23, lsr #7  // guest 0x10b333, sampled 0
6eae8e24a0:    	add	x17, x17, x16  // guest 0x10b333, sampled 0
6eae8e24a4:    	ldp	x16, x17, [x17]  // guest 0x10b333, sampled 0
6eae8e24a8:    	and	w30, w23, #0xfffff003  // guest 0x10b333, sampled 0
6eae8e24ac:    	cmp	w16, w30  // guest 0x10b333, sampled 0
6eae8e24b0:    	b.ne	0x6eae8e3040 <trace+0x2bc0>  // guest 0x10b333, sampled 0
6eae8e24b4:    	add	x30, x17, w23, uxtw  // guest 0x10b333, sampled 0
6eae8e24b8:    	ldapr	w23, [x30]  // guest 0x10b333, sampled 0
6eae8e24bc:    	str	w23, [x19, #0x4]  // guest 0x10b333, sampled 0
6eae8e24c0:    	add	w20, w20, w21  // guest 0x10b337, sampled 0
6eae8e24c4:    	add	w20, w20, #0xc  // guest 0x10b337, sampled 0
6eae8e24c8:    	str	w20, [x19]  // guest 0x10b337, sampled 0
6eae8e24cc:    	add	w21, w22, #0x60  // guest 0x10b33b, sampled 0
6eae8e24d0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b33b, sampled 0
6eae8e24d4:    	and	x16, x16, x21, lsr #7  // guest 0x10b33b, sampled 0
6eae8e24d8:    	add	x17, x17, x16  // guest 0x10b33b, sampled 0
6eae8e24dc:    	ldp	x16, x17, [x17]  // guest 0x10b33b, sampled 0
6eae8e24e0:    	and	w30, w21, #0xfffff003  // guest 0x10b33b, sampled 0
6eae8e24e4:    	cmp	w16, w30  // guest 0x10b33b, sampled 0
6eae8e24e8:    	b.ne	0x6eae8e306c <trace+0x2bec>  // guest 0x10b33b, sampled 0
6eae8e24ec:    	add	x30, x17, w21, uxtw  // guest 0x10b33b, sampled 0
6eae8e24f0:    	ldapr	w21, [x30]  // guest 0x10b33b, sampled 0
6eae8e24f4:    	str	w21, [x19, #0x8]  // guest 0x10b33b, sampled 0
6eae8e24f8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b33f, sampled 0
6eae8e24fc:    	and	x16, x16, x20, lsr #7  // guest 0x10b33f, sampled 0
6eae8e2500:    	add	x17, x17, x16  // guest 0x10b33f, sampled 0
6eae8e2504:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b33f, sampled 0
6eae8e2508:    	and	w30, w20, #0xfffff003  // guest 0x10b33f, sampled 0
6eae8e250c:    	cmp	w16, w30  // guest 0x10b33f, sampled 0
6eae8e2510:    	b.ne	0x6eae8e3098 <trace+0x2c18>  // guest 0x10b33f, sampled 0
6eae8e2514:    	add	x30, x17, w20, uxtw  // guest 0x10b33f, sampled 0
6eae8e2518:    	stlr	w23, [x30]  // guest 0x10b33f, sampled 0
6eae8e251c:    	add	w23, w22, #0x64  // guest 0x10b341, sampled 0
6eae8e2520:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b341, sampled 0
6eae8e2524:    	and	x16, x16, x23, lsr #7  // guest 0x10b341, sampled 0
6eae8e2528:    	add	x17, x17, x16  // guest 0x10b341, sampled 0
6eae8e252c:    	ldp	x16, x17, [x17]  // guest 0x10b341, sampled 0
6eae8e2530:    	and	w30, w23, #0xfffff003  // guest 0x10b341, sampled 0
6eae8e2534:    	cmp	w16, w30  // guest 0x10b341, sampled 0
6eae8e2538:    	b.ne	0x6eae8e30c4 <trace+0x2c44>  // guest 0x10b341, sampled 0
6eae8e253c:    	add	x30, x17, w23, uxtw  // guest 0x10b341, sampled 0
6eae8e2540:    	ldapr	w23, [x30]  // guest 0x10b341, sampled 0
6eae8e2544:    	str	w23, [x19, #0x4]  // guest 0x10b341, sampled 0
6eae8e2548:    	add	w24, w20, #0x4  // guest 0x10b345, sampled 0
6eae8e254c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b345, sampled 0
6eae8e2550:    	and	x16, x16, x24, lsr #7  // guest 0x10b345, sampled 0
6eae8e2554:    	add	x17, x17, x16  // guest 0x10b345, sampled 0
6eae8e2558:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b345, sampled 0
6eae8e255c:    	and	w30, w24, #0xfffff003  // guest 0x10b345, sampled 0
6eae8e2560:    	cmp	w16, w30  // guest 0x10b345, sampled 0
6eae8e2564:    	b.ne	0x6eae8e30f0 <trace+0x2c70>  // guest 0x10b345, sampled 0
6eae8e2568:    	add	x30, x17, w24, uxtw  // guest 0x10b345, sampled 0
6eae8e256c:    	stlr	w21, [x30]  // guest 0x10b345, sampled 0
6eae8e2570:    	ldr	w21, [x19, #0x14]  // guest 0x10b348, sampled 0
6eae8e2574:    	add	w21, w21, #0x4  // guest 0x10b348, sampled 0
6eae8e2578:    	str	w21, [x19, #0x14]  // guest 0x10b348, sampled 0
6eae8e257c:    	str	w21, [x19, #0x28]  // guest 0x10b348, sampled 0
6eae8e2580:    	mov	w21, #0x4               // =4  // guest 0x10b348, sampled 0
6eae8e2584:    	str	w21, [x19, #0x2c]  // guest 0x10b348, sampled 0
6eae8e2588:    	add	w20, w20, #0x8  // guest 0x10b34b, sampled 0
6eae8e258c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b34b, sampled 0
6eae8e2590:    	and	x16, x16, x20, lsr #7  // guest 0x10b34b, sampled 0
6eae8e2594:    	add	x17, x17, x16  // guest 0x10b34b, sampled 0
6eae8e2598:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b34b, sampled 0
6eae8e259c:    	and	w30, w20, #0xfffff003  // guest 0x10b34b, sampled 0
6eae8e25a0:    	cmp	w16, w30  // guest 0x10b34b, sampled 0
6eae8e25a4:    	b.ne	0x6eae8e311c <trace+0x2c9c>  // guest 0x10b34b, sampled 0
6eae8e25a8:    	add	x30, x17, w20, uxtw  // guest 0x10b34b, sampled 0
6eae8e25ac:    	stlr	w23, [x30]  // guest 0x10b34b, sampled 0
6eae8e25b0:    	add	w20, w22, #0x10  // guest 0x10b34e, sampled 0
6eae8e25b4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b34e, sampled 0
6eae8e25b8:    	and	x16, x16, x20, lsr #7  // guest 0x10b34e, sampled 0
6eae8e25bc:    	add	x17, x17, x16  // guest 0x10b34e, sampled 0
6eae8e25c0:    	ldp	x16, x17, [x17]  // guest 0x10b34e, sampled 0
6eae8e25c4:    	and	w30, w20, #0xfffff003  // guest 0x10b34e, sampled 0
6eae8e25c8:    	cmp	w16, w30  // guest 0x10b34e, sampled 0
6eae8e25cc:    	b.ne	0x6eae8e3148 <trace+0x2cc8>  // guest 0x10b34e, sampled 0
6eae8e25d0:    	add	x30, x17, w20, uxtw  // guest 0x10b34e, sampled 0
6eae8e25d4:    	ldapr	w20, [x30]  // guest 0x10b34e, sampled 0
6eae8e25d8:    	str	w20, [x19]  // guest 0x10b34e, sampled 0
6eae8e25dc:    	ldr	w21, [x19, #0x1c]  // guest 0x10b352, sampled 0
6eae8e25e0:    	add	w21, w21, w27  // guest 0x10b352, sampled 0
6eae8e25e4:    	str	w21, [x19, #0x1c]  // guest 0x10b352, sampled 0
6eae8e25e8:    	sub	w22, w21, w20  // guest 0x10b353, sampled 0
6eae8e25ec:    	str	w22, [x19, #0x28]  // guest 0x10b353, sampled 0
6eae8e25f0:    	str	w20, [x19, #0x2c]  // guest 0x10b353, sampled 0
6eae8e25f4:    	sturb	w27, [x19, #-0xc]  // guest 0x10b353, sampled 0
6eae8e25f8:    	mov	w22, #0x12              // =18  // guest 0x10b355, sampled 0
6eae8e25fc:    	str	w22, [x19, #0x34]  // guest 0x10b355, sampled 0
6eae8e2600:    	cmp	w21, w20  // guest 0x10b355, sampled 0
6eae8e2604:    	b.lt	0x6eae8e2624 <trace+0x21a4>  // guest 0x10b355, sampled 0
6eae8e2608:    	b	0x6eae8e2608 <trace+0x2188>  // guest 0x10b355, sampled 0
6eae8e260c:    	br	x16  // guest 0x10b355, sampled 0
6eae8e2610:    	mov	w20, #0xb35b            // =45915  // guest 0x10b355, sampled 0
6eae8e2614:    	movk	w20, #0x10, lsl #16  // guest 0x10b355, sampled 0
6eae8e2618:    	str	w20, [x19, #0x20]  // guest 0x10b355, sampled 0
6eae8e261c:    	adr	x0, 0x6eae8e03c1 <trace+0xffffffffffffff41>  // guest 0x10b355, sampled 0
6eae8e2620:    	b	0x6ea842202c <trace+0xfffffffff9b41bac>  // guest 0x10b355, sampled 0
6eae8e2624:    	b	0x6eae8e2624 <trace+0x21a4>  // guest 0x10b355, sampled 0
6eae8e2628:    	br	x16  // guest 0x10b355, sampled 0
6eae8e262c:    	mov	w20, #0xb211            // =45585  // guest 0x10b355, sampled 0
6eae8e2630:    	movk	w20, #0x10, lsl #16  // guest 0x10b355, sampled 0
6eae8e2634:    	str	w20, [x19, #0x20]  // guest 0x10b355, sampled 0
6eae8e2638:    	adr	x0, 0x6eae8e03c0 <trace+0xffffffffffffff40>  // guest 0x10b355, sampled 0
6eae8e263c:    	b	0x6ea842202c <trace+0xfffffffff9b41bac>  // guest 0x10b355, sampled 0
6eae8e2640:    	adr	x0, 0x6eae8e03c3 <trace+0xffffffffffffff43>  // guest 0x10b355, sampled 0
6eae8e2644:    	b	0x6ea842202c <trace+0xfffffffff9b41bac>  // guest 0x10b355, sampled 0
6eae8e2648:    	mov	w1, w20
6eae8e264c:    	mov	x0, x19
6eae8e2650:    	mov	w2, #0x4045             // =16453
6eae8e2654:    	movk	w2, #0x1, lsl #16
6eae8e2658:    	adr	x3, 0x6eae8e04b8 <trace+0x38>
6eae8e265c:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2660:    	add	x16, x16, #0x58
6eae8e2664:    	blr	x16
6eae8e2668:    	mov	w20, w0
6eae8e266c:    	dmb	ishld
6eae8e2670:    	b	0x6eae8e04b8 <trace+0x38>
6eae8e2674:    	mov	w1, w22
6eae8e2678:    	mov	x0, x19
6eae8e267c:    	mov	w2, #0x4045             // =16453
6eae8e2680:    	movk	w2, #0x1, lsl #16
6eae8e2684:    	adr	x3, 0x6eae8e0510 <trace+0x90>
6eae8e2688:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e268c:    	add	x16, x16, #0x58
6eae8e2690:    	blr	x16
6eae8e2694:    	mov	w22, w0
6eae8e2698:    	dmb	ishld
6eae8e269c:    	b	0x6eae8e0510 <trace+0x90>
6eae8e26a0:    	mov	w1, w23
6eae8e26a4:    	mov	x0, x19
6eae8e26a8:    	mov	w2, #0x4045             // =16453
6eae8e26ac:    	movk	w2, #0x1, lsl #16
6eae8e26b0:    	adr	x3, 0x6eae8e0540 <trace+0xc0>
6eae8e26b4:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e26b8:    	add	x16, x16, #0x58
6eae8e26bc:    	blr	x16
6eae8e26c0:    	mov	w2, w0
6eae8e26c4:    	dmb	ishld
6eae8e26c8:    	b	0x6eae8e0540 <trace+0xc0>
6eae8e26cc:    	mov	w1, w25
6eae8e26d0:    	mov	x0, x19
6eae8e26d4:    	mov	w2, #0x4045             // =16453
6eae8e26d8:    	movk	w2, #0x1, lsl #16
6eae8e26dc:    	adr	x3, 0x6eae8e05f8 <trace+0x178>
6eae8e26e0:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e26e4:    	add	x16, x16, #0x58
6eae8e26e8:    	blr	x16
6eae8e26ec:    	mov	w2, w0
6eae8e26f0:    	dmb	ishld
6eae8e26f4:    	b	0x6eae8e05f8 <trace+0x178>
6eae8e26f8:    	mov	w1, w26
6eae8e26fc:    	mov	x0, x19
6eae8e2700:    	mov	w2, #0x4045             // =16453
6eae8e2704:    	movk	w2, #0x1, lsl #16
6eae8e2708:    	adr	x3, 0x6eae8e0690 <trace+0x210>
6eae8e270c:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2710:    	add	x16, x16, #0x58
6eae8e2714:    	blr	x16
6eae8e2718:    	mov	w2, w0
6eae8e271c:    	dmb	ishld
6eae8e2720:    	b	0x6eae8e0690 <trace+0x210>
6eae8e2724:    	mov	w1, w26
6eae8e2728:    	mov	x0, x19
6eae8e272c:    	mov	w2, #0x4045             // =16453
6eae8e2730:    	movk	w2, #0x1, lsl #16
6eae8e2734:    	adr	x3, 0x6eae8e071c <trace+0x29c>
6eae8e2738:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e273c:    	add	x16, x16, #0x58
6eae8e2740:    	blr	x16
6eae8e2744:    	mov	w2, w0
6eae8e2748:    	dmb	ishld
6eae8e274c:    	b	0x6eae8e071c <trace+0x29c>
6eae8e2750:    	mov	w1, w26
6eae8e2754:    	mov	x0, x19
6eae8e2758:    	mov	w2, #0x4045             // =16453
6eae8e275c:    	movk	w2, #0x1, lsl #16
6eae8e2760:    	adr	x3, 0x6eae8e0808 <trace+0x388>
6eae8e2764:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2768:    	add	x16, x16, #0x58
6eae8e276c:    	blr	x16
6eae8e2770:    	mov	w2, w0
6eae8e2774:    	dmb	ishld
6eae8e2778:    	b	0x6eae8e0808 <trace+0x388>
6eae8e277c:    	mov	w1, w25
6eae8e2780:    	mov	x0, x19
6eae8e2784:    	mov	w2, #0x4045             // =16453
6eae8e2788:    	movk	w2, #0x1, lsl #16
6eae8e278c:    	adr	x3, 0x6eae8e088c <trace+0x40c>
6eae8e2790:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2794:    	add	x16, x16, #0x58
6eae8e2798:    	blr	x16
6eae8e279c:    	mov	w2, w0
6eae8e27a0:    	dmb	ishld
6eae8e27a4:    	b	0x6eae8e088c <trace+0x40c>
6eae8e27a8:    	mov	w1, w26
6eae8e27ac:    	mov	x0, x19
6eae8e27b0:    	mov	w2, #0x4045             // =16453
6eae8e27b4:    	movk	w2, #0x1, lsl #16
6eae8e27b8:    	adr	x3, 0x6eae8e0974 <trace+0x4f4>
6eae8e27bc:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e27c0:    	add	x16, x16, #0x58
6eae8e27c4:    	blr	x16
6eae8e27c8:    	mov	w2, w0
6eae8e27cc:    	dmb	ishld
6eae8e27d0:    	b	0x6eae8e0974 <trace+0x4f4>
6eae8e27d4:    	mov	w1, w26
6eae8e27d8:    	mov	x0, x19
6eae8e27dc:    	mov	w2, #0x4045             // =16453
6eae8e27e0:    	movk	w2, #0x1, lsl #16
6eae8e27e4:    	adr	x3, 0x6eae8e0a00 <trace+0x580>
6eae8e27e8:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e27ec:    	add	x16, x16, #0x58
6eae8e27f0:    	blr	x16
6eae8e27f4:    	mov	w2, w0
6eae8e27f8:    	dmb	ishld
6eae8e27fc:    	b	0x6eae8e0a00 <trace+0x580>
6eae8e2800:    	mov	w1, w26
6eae8e2804:    	mov	x0, x19
6eae8e2808:    	mov	w2, #0x4045             // =16453
6eae8e280c:    	movk	w2, #0x1, lsl #16
6eae8e2810:    	adr	x3, 0x6eae8e0a84 <trace+0x604>
6eae8e2814:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2818:    	add	x16, x16, #0x58
6eae8e281c:    	blr	x16
6eae8e2820:    	mov	w2, w0
6eae8e2824:    	dmb	ishld
6eae8e2828:    	b	0x6eae8e0a84 <trace+0x604>
6eae8e282c:    	mov	w1, w26
6eae8e2830:    	mov	x0, x19
6eae8e2834:    	mov	w2, #0x4045             // =16453
6eae8e2838:    	movk	w2, #0x1, lsl #16
6eae8e283c:    	adr	x3, 0x6eae8e0b10 <trace+0x690>
6eae8e2840:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2844:    	add	x16, x16, #0x58
6eae8e2848:    	blr	x16
6eae8e284c:    	mov	w2, w0
6eae8e2850:    	dmb	ishld
6eae8e2854:    	b	0x6eae8e0b10 <trace+0x690>
6eae8e2858:    	mov	w1, w25
6eae8e285c:    	mov	x0, x19
6eae8e2860:    	mov	w2, #0x4045             // =16453
6eae8e2864:    	movk	w2, #0x1, lsl #16
6eae8e2868:    	adr	x3, 0x6eae8e0bf0 <trace+0x770>
6eae8e286c:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2870:    	add	x16, x16, #0x58
6eae8e2874:    	blr	x16
6eae8e2878:    	mov	w2, w0
6eae8e287c:    	dmb	ishld
6eae8e2880:    	b	0x6eae8e0bf0 <trace+0x770>
6eae8e2884:    	mov	w1, w26
6eae8e2888:    	mov	x0, x19
6eae8e288c:    	mov	w2, #0x4045             // =16453
6eae8e2890:    	movk	w2, #0x1, lsl #16
6eae8e2894:    	adr	x3, 0x6eae8e0c7c <trace+0x7fc>
6eae8e2898:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e289c:    	add	x16, x16, #0x58
6eae8e28a0:    	blr	x16
6eae8e28a4:    	mov	w2, w0
6eae8e28a8:    	dmb	ishld
6eae8e28ac:    	b	0x6eae8e0c7c <trace+0x7fc>
6eae8e28b0:    	mov	w1, w26
6eae8e28b4:    	mov	x0, x19
6eae8e28b8:    	mov	w2, #0x4045             // =16453
6eae8e28bc:    	movk	w2, #0x1, lsl #16
6eae8e28c0:    	adr	x3, 0x6eae8e0d64 <trace+0x8e4>
6eae8e28c4:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e28c8:    	add	x16, x16, #0x58
6eae8e28cc:    	blr	x16
6eae8e28d0:    	mov	w2, w0
6eae8e28d4:    	dmb	ishld
6eae8e28d8:    	b	0x6eae8e0d64 <trace+0x8e4>
6eae8e28dc:    	mov	w1, w26
6eae8e28e0:    	mov	x0, x19
6eae8e28e4:    	mov	w2, #0x4045             // =16453
6eae8e28e8:    	movk	w2, #0x1, lsl #16
6eae8e28ec:    	adr	x3, 0x6eae8e0df0 <trace+0x970>
6eae8e28f0:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e28f4:    	add	x16, x16, #0x58
6eae8e28f8:    	blr	x16
6eae8e28fc:    	mov	w2, w0
6eae8e2900:    	dmb	ishld
6eae8e2904:    	b	0x6eae8e0df0 <trace+0x970>
6eae8e2908:    	mov	w1, w26
6eae8e290c:    	mov	x0, x19
6eae8e2910:    	mov	w2, #0x4045             // =16453
6eae8e2914:    	movk	w2, #0x1, lsl #16
6eae8e2918:    	adr	x3, 0x6eae8e0e74 <trace+0x9f4>
6eae8e291c:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2920:    	add	x16, x16, #0x58
6eae8e2924:    	blr	x16
6eae8e2928:    	mov	w2, w0
6eae8e292c:    	dmb	ishld
6eae8e2930:    	b	0x6eae8e0e74 <trace+0x9f4>
6eae8e2934:    	mov	w1, w22
6eae8e2938:    	mov	x0, x19
6eae8e293c:    	mov	w2, #0x4045             // =16453
6eae8e2940:    	movk	w2, #0x1, lsl #16
6eae8e2944:    	adr	x3, 0x6eae8e0f00 <trace+0xa80>
6eae8e2948:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e294c:    	add	x16, x16, #0x58
6eae8e2950:    	blr	x16
6eae8e2954:    	mov	w2, w0
6eae8e2958:    	dmb	ishld
6eae8e295c:    	b	0x6eae8e0f00 <trace+0xa80>
6eae8e2960:    	mov	w1, w25
6eae8e2964:    	mov	x0, x19
6eae8e2968:    	mov	w2, #0x4045             // =16453
6eae8e296c:    	movk	w2, #0x1, lsl #16
6eae8e2970:    	adr	x3, 0x6eae8e0fe0 <trace+0xb60>
6eae8e2974:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2978:    	add	x16, x16, #0x58
6eae8e297c:    	blr	x16
6eae8e2980:    	mov	w2, w0
6eae8e2984:    	dmb	ishld
6eae8e2988:    	b	0x6eae8e0fe0 <trace+0xb60>
6eae8e298c:    	mov	w1, w21
6eae8e2990:    	mov	x0, x19
6eae8e2994:    	mov	w2, #0x4045             // =16453
6eae8e2998:    	movk	w2, #0x1, lsl #16
6eae8e299c:    	adr	x3, 0x6eae8e1068 <trace+0xbe8>
6eae8e29a0:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e29a4:    	add	x16, x16, #0x58
6eae8e29a8:    	blr	x16
6eae8e29ac:    	mov	w21, w0
6eae8e29b0:    	dmb	ishld
6eae8e29b4:    	b	0x6eae8e1068 <trace+0xbe8>
6eae8e29b8:    	mov	w1, w20
6eae8e29bc:    	mov	x0, x19
6eae8e29c0:    	mov	w2, #0x4045             // =16453
6eae8e29c4:    	movk	w2, #0x1, lsl #16
6eae8e29c8:    	adr	x3, 0x6eae8e1098 <trace+0xc18>
6eae8e29cc:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e29d0:    	add	x16, x16, #0x58
6eae8e29d4:    	blr	x16
6eae8e29d8:    	mov	w2, w0
6eae8e29dc:    	dmb	ishld
6eae8e29e0:    	b	0x6eae8e1098 <trace+0xc18>
6eae8e29e4:    	mov	w1, w21
6eae8e29e8:    	mov	w2, w0
6eae8e29ec:    	mov	x0, x19
6eae8e29f0:    	mov	w3, #0x4045             // =16453
6eae8e29f4:    	movk	w3, #0x1, lsl #16
6eae8e29f8:    	adr	x4, 0x6eae8e11b0 <trace+0xd30>
6eae8e29fc:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2a00:    	add	x16, x16, #0xc38
6eae8e2a04:    	blr	x16
6eae8e2a08:    	dmb	ishld
6eae8e2a0c:    	b	0x6eae8e11b0 <trace+0xd30>
6eae8e2a10:    	mov	w1, w20
6eae8e2a14:    	mov	x0, x19
6eae8e2a18:    	mov	w2, #0x4045             // =16453
6eae8e2a1c:    	movk	w2, #0x1, lsl #16
6eae8e2a20:    	adr	x3, 0x6eae8e1238 <trace+0xdb8>
6eae8e2a24:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2a28:    	add	x16, x16, #0x58
6eae8e2a2c:    	blr	x16
6eae8e2a30:    	mov	w2, w0
6eae8e2a34:    	dmb	ishld
6eae8e2a38:    	b	0x6eae8e1238 <trace+0xdb8>
6eae8e2a3c:    	mov	w1, w23
6eae8e2a40:    	mov	w2, w0
6eae8e2a44:    	mov	x0, x19
6eae8e2a48:    	mov	w3, #0x4045             // =16453
6eae8e2a4c:    	movk	w3, #0x1, lsl #16
6eae8e2a50:    	adr	x4, 0x6eae8e12e4 <trace+0xe64>
6eae8e2a54:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2a58:    	add	x16, x16, #0xc38
6eae8e2a5c:    	blr	x16
6eae8e2a60:    	dmb	ishld
6eae8e2a64:    	b	0x6eae8e12e4 <trace+0xe64>
6eae8e2a68:    	mov	w1, w23
6eae8e2a6c:    	mov	x0, x19
6eae8e2a70:    	mov	w2, #0x4045             // =16453
6eae8e2a74:    	movk	w2, #0x1, lsl #16
6eae8e2a78:    	adr	x3, 0x6eae8e1348 <trace+0xec8>
6eae8e2a7c:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2a80:    	add	x16, x16, #0x58
6eae8e2a84:    	blr	x16
6eae8e2a88:    	mov	w2, w0
6eae8e2a8c:    	dmb	ishld
6eae8e2a90:    	b	0x6eae8e1348 <trace+0xec8>
6eae8e2a94:    	mov	w1, w23
6eae8e2a98:    	mov	w2, w0
6eae8e2a9c:    	mov	x0, x19
6eae8e2aa0:    	mov	w3, #0x4045             // =16453
6eae8e2aa4:    	movk	w3, #0x1, lsl #16
6eae8e2aa8:    	adr	x4, 0x6eae8e13ec <trace+0xf6c>
6eae8e2aac:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2ab0:    	add	x16, x16, #0xc38
6eae8e2ab4:    	blr	x16
6eae8e2ab8:    	dmb	ishld
6eae8e2abc:    	b	0x6eae8e13ec <trace+0xf6c>
6eae8e2ac0:    	mov	w1, w23
6eae8e2ac4:    	mov	x0, x19
6eae8e2ac8:    	mov	w2, #0x4045             // =16453
6eae8e2acc:    	movk	w2, #0x1, lsl #16
6eae8e2ad0:    	adr	x3, 0x6eae8e1450 <trace+0xfd0>
6eae8e2ad4:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2ad8:    	add	x16, x16, #0x58
6eae8e2adc:    	blr	x16
6eae8e2ae0:    	mov	w2, w0
6eae8e2ae4:    	dmb	ishld
6eae8e2ae8:    	b	0x6eae8e1450 <trace+0xfd0>
6eae8e2aec:    	mov	w1, w23
6eae8e2af0:    	mov	x0, x19
6eae8e2af4:    	mov	w2, #0x4045             // =16453
6eae8e2af8:    	movk	w2, #0x1, lsl #16
6eae8e2afc:    	adr	x3, 0x6eae8e14dc <trace+0x105c>
6eae8e2b00:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2b04:    	add	x16, x16, #0x58
6eae8e2b08:    	blr	x16
6eae8e2b0c:    	mov	w2, w0
6eae8e2b10:    	dmb	ishld
6eae8e2b14:    	b	0x6eae8e14dc <trace+0x105c>
6eae8e2b18:    	mov	w1, w23
6eae8e2b1c:    	mov	w2, w0
6eae8e2b20:    	mov	x0, x19
6eae8e2b24:    	mov	w3, #0x4045             // =16453
6eae8e2b28:    	movk	w3, #0x1, lsl #16
6eae8e2b2c:    	adr	x4, 0x6eae8e1580 <trace+0x1100>
6eae8e2b30:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2b34:    	add	x16, x16, #0xc38
6eae8e2b38:    	blr	x16
6eae8e2b3c:    	dmb	ishld
6eae8e2b40:    	b	0x6eae8e1580 <trace+0x1100>
6eae8e2b44:    	mov	w1, w23
6eae8e2b48:    	mov	x0, x19
6eae8e2b4c:    	mov	w2, #0x4045             // =16453
6eae8e2b50:    	movk	w2, #0x1, lsl #16
6eae8e2b54:    	adr	x3, 0x6eae8e15e4 <trace+0x1164>
6eae8e2b58:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2b5c:    	add	x16, x16, #0x58
6eae8e2b60:    	blr	x16
6eae8e2b64:    	mov	w2, w0
6eae8e2b68:    	dmb	ishld
6eae8e2b6c:    	b	0x6eae8e15e4 <trace+0x1164>
6eae8e2b70:    	mov	w1, w24
6eae8e2b74:    	mov	x0, x19
6eae8e2b78:    	mov	w2, #0x4045             // =16453
6eae8e2b7c:    	movk	w2, #0x1, lsl #16
6eae8e2b80:    	adr	x3, 0x6eae8e1674 <trace+0x11f4>
6eae8e2b84:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2b88:    	add	x16, x16, #0x58
6eae8e2b8c:    	blr	x16
6eae8e2b90:    	mov	w2, w0
6eae8e2b94:    	dmb	ishld
6eae8e2b98:    	b	0x6eae8e1674 <trace+0x11f4>
6eae8e2b9c:    	mov	w1, w24
6eae8e2ba0:    	mov	x0, x19
6eae8e2ba4:    	mov	w2, #0x4045             // =16453
6eae8e2ba8:    	movk	w2, #0x1, lsl #16
6eae8e2bac:    	adr	x3, 0x6eae8e16f8 <trace+0x1278>
6eae8e2bb0:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2bb4:    	add	x16, x16, #0x58
6eae8e2bb8:    	blr	x16
6eae8e2bbc:    	mov	w2, w0
6eae8e2bc0:    	dmb	ishld
6eae8e2bc4:    	b	0x6eae8e16f8 <trace+0x1278>
6eae8e2bc8:    	mov	w1, w24
6eae8e2bcc:    	mov	x0, x19
6eae8e2bd0:    	mov	w2, #0x4045             // =16453
6eae8e2bd4:    	movk	w2, #0x1, lsl #16
6eae8e2bd8:    	adr	x3, 0x6eae8e1784 <trace+0x1304>
6eae8e2bdc:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2be0:    	add	x16, x16, #0x58
6eae8e2be4:    	blr	x16
6eae8e2be8:    	mov	w2, w0
6eae8e2bec:    	dmb	ishld
6eae8e2bf0:    	b	0x6eae8e1784 <trace+0x1304>
6eae8e2bf4:    	mov	w1, w24
6eae8e2bf8:    	mov	x0, x19
6eae8e2bfc:    	mov	w2, #0x4045             // =16453
6eae8e2c00:    	movk	w2, #0x1, lsl #16
6eae8e2c04:    	adr	x3, 0x6eae8e186c <trace+0x13ec>
6eae8e2c08:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2c0c:    	add	x16, x16, #0x58
6eae8e2c10:    	blr	x16
6eae8e2c14:    	mov	w2, w0
6eae8e2c18:    	dmb	ishld
6eae8e2c1c:    	b	0x6eae8e186c <trace+0x13ec>
6eae8e2c20:    	mov	w1, w23
6eae8e2c24:    	mov	x0, x19
6eae8e2c28:    	mov	w2, #0x4045             // =16453
6eae8e2c2c:    	movk	w2, #0x1, lsl #16
6eae8e2c30:    	adr	x3, 0x6eae8e18f0 <trace+0x1470>
6eae8e2c34:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2c38:    	add	x16, x16, #0x58
6eae8e2c3c:    	blr	x16
6eae8e2c40:    	mov	w2, w0
6eae8e2c44:    	dmb	ishld
6eae8e2c48:    	b	0x6eae8e18f0 <trace+0x1470>
6eae8e2c4c:    	mov	w1, w24
6eae8e2c50:    	mov	w2, w0
6eae8e2c54:    	mov	x0, x19
6eae8e2c58:    	mov	w3, #0x4045             // =16453
6eae8e2c5c:    	movk	w3, #0x1, lsl #16
6eae8e2c60:    	adr	x4, 0x6eae8e19f8 <trace+0x1578>
6eae8e2c64:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2c68:    	add	x16, x16, #0xc38
6eae8e2c6c:    	blr	x16
6eae8e2c70:    	dmb	ishld
6eae8e2c74:    	b	0x6eae8e19f8 <trace+0x1578>
6eae8e2c78:    	mov	w1, w24
6eae8e2c7c:    	mov	x0, x19
6eae8e2c80:    	mov	w2, #0x4045             // =16453
6eae8e2c84:    	movk	w2, #0x1, lsl #16
6eae8e2c88:    	adr	x3, 0x6eae8e1a5c <trace+0x15dc>
6eae8e2c8c:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2c90:    	add	x16, x16, #0x58
6eae8e2c94:    	blr	x16
6eae8e2c98:    	mov	w2, w0
6eae8e2c9c:    	dmb	ishld
6eae8e2ca0:    	b	0x6eae8e1a5c <trace+0x15dc>
6eae8e2ca4:    	mov	w1, w24
6eae8e2ca8:    	mov	x0, x19
6eae8e2cac:    	mov	w2, #0x4045             // =16453
6eae8e2cb0:    	movk	w2, #0x1, lsl #16
6eae8e2cb4:    	adr	x3, 0x6eae8e1ae8 <trace+0x1668>
6eae8e2cb8:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2cbc:    	add	x16, x16, #0x58
6eae8e2cc0:    	blr	x16
6eae8e2cc4:    	mov	w2, w0
6eae8e2cc8:    	dmb	ishld
6eae8e2ccc:    	b	0x6eae8e1ae8 <trace+0x1668>
6eae8e2cd0:    	mov	w1, w24
6eae8e2cd4:    	mov	x0, x19
6eae8e2cd8:    	mov	w2, #0x4045             // =16453
6eae8e2cdc:    	movk	w2, #0x1, lsl #16
6eae8e2ce0:    	adr	x3, 0x6eae8e1b6c <trace+0x16ec>
6eae8e2ce4:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2ce8:    	add	x16, x16, #0x58
6eae8e2cec:    	blr	x16
6eae8e2cf0:    	mov	w2, w0
6eae8e2cf4:    	dmb	ishld
6eae8e2cf8:    	b	0x6eae8e1b6c <trace+0x16ec>
6eae8e2cfc:    	mov	w1, w24
6eae8e2d00:    	mov	x0, x19
6eae8e2d04:    	mov	w2, #0x4045             // =16453
6eae8e2d08:    	movk	w2, #0x1, lsl #16
6eae8e2d0c:    	adr	x3, 0x6eae8e1bf8 <trace+0x1778>
6eae8e2d10:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2d14:    	add	x16, x16, #0x58
6eae8e2d18:    	blr	x16
6eae8e2d1c:    	mov	w2, w0
6eae8e2d20:    	dmb	ishld
6eae8e2d24:    	b	0x6eae8e1bf8 <trace+0x1778>
6eae8e2d28:    	mov	w1, w24
6eae8e2d2c:    	mov	x0, x19
6eae8e2d30:    	mov	w2, #0x4045             // =16453
6eae8e2d34:    	movk	w2, #0x1, lsl #16
6eae8e2d38:    	adr	x3, 0x6eae8e1ce0 <trace+0x1860>
6eae8e2d3c:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2d40:    	add	x16, x16, #0x58
6eae8e2d44:    	blr	x16
6eae8e2d48:    	mov	w2, w0
6eae8e2d4c:    	dmb	ishld
6eae8e2d50:    	b	0x6eae8e1ce0 <trace+0x1860>
6eae8e2d54:    	mov	w1, w23
6eae8e2d58:    	mov	x0, x19
6eae8e2d5c:    	mov	w2, #0x4045             // =16453
6eae8e2d60:    	movk	w2, #0x1, lsl #16
6eae8e2d64:    	adr	x3, 0x6eae8e1d64 <trace+0x18e4>
6eae8e2d68:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2d6c:    	add	x16, x16, #0x58
6eae8e2d70:    	blr	x16
6eae8e2d74:    	mov	w2, w0
6eae8e2d78:    	dmb	ishld
6eae8e2d7c:    	b	0x6eae8e1d64 <trace+0x18e4>
6eae8e2d80:    	mov	w1, w24
6eae8e2d84:    	mov	w2, w0
6eae8e2d88:    	mov	x0, x19
6eae8e2d8c:    	mov	w3, #0x4045             // =16453
6eae8e2d90:    	movk	w3, #0x1, lsl #16
6eae8e2d94:    	adr	x4, 0x6eae8e1e6c <trace+0x19ec>
6eae8e2d98:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2d9c:    	add	x16, x16, #0xc38
6eae8e2da0:    	blr	x16
6eae8e2da4:    	dmb	ishld
6eae8e2da8:    	b	0x6eae8e1e6c <trace+0x19ec>
6eae8e2dac:    	mov	w1, w24
6eae8e2db0:    	mov	x0, x19
6eae8e2db4:    	mov	w2, #0x4045             // =16453
6eae8e2db8:    	movk	w2, #0x1, lsl #16
6eae8e2dbc:    	adr	x3, 0x6eae8e1ed0 <trace+0x1a50>
6eae8e2dc0:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2dc4:    	add	x16, x16, #0x58
6eae8e2dc8:    	blr	x16
6eae8e2dcc:    	mov	w2, w0
6eae8e2dd0:    	dmb	ishld
6eae8e2dd4:    	b	0x6eae8e1ed0 <trace+0x1a50>
6eae8e2dd8:    	mov	w1, w24
6eae8e2ddc:    	mov	x0, x19
6eae8e2de0:    	mov	w2, #0x4045             // =16453
6eae8e2de4:    	movk	w2, #0x1, lsl #16
6eae8e2de8:    	adr	x3, 0x6eae8e1f5c <trace+0x1adc>
6eae8e2dec:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2df0:    	add	x16, x16, #0x58
6eae8e2df4:    	blr	x16
6eae8e2df8:    	mov	w2, w0
6eae8e2dfc:    	dmb	ishld
6eae8e2e00:    	b	0x6eae8e1f5c <trace+0x1adc>
6eae8e2e04:    	mov	w1, w24
6eae8e2e08:    	mov	x0, x19
6eae8e2e0c:    	mov	w2, #0x4045             // =16453
6eae8e2e10:    	movk	w2, #0x1, lsl #16
6eae8e2e14:    	adr	x3, 0x6eae8e1fe0 <trace+0x1b60>
6eae8e2e18:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2e1c:    	add	x16, x16, #0x58
6eae8e2e20:    	blr	x16
6eae8e2e24:    	mov	w2, w0
6eae8e2e28:    	dmb	ishld
6eae8e2e2c:    	b	0x6eae8e1fe0 <trace+0x1b60>
6eae8e2e30:    	mov	w1, w24
6eae8e2e34:    	mov	x0, x19
6eae8e2e38:    	mov	w2, #0x4045             // =16453
6eae8e2e3c:    	movk	w2, #0x1, lsl #16
6eae8e2e40:    	adr	x3, 0x6eae8e206c <trace+0x1bec>
6eae8e2e44:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2e48:    	add	x16, x16, #0x58
6eae8e2e4c:    	blr	x16
6eae8e2e50:    	mov	w2, w0
6eae8e2e54:    	dmb	ishld
6eae8e2e58:    	b	0x6eae8e206c <trace+0x1bec>
6eae8e2e5c:    	mov	w1, w20
6eae8e2e60:    	mov	x0, x19
6eae8e2e64:    	mov	w2, #0x4045             // =16453
6eae8e2e68:    	movk	w2, #0x1, lsl #16
6eae8e2e6c:    	adr	x3, 0x6eae8e2154 <trace+0x1cd4>
6eae8e2e70:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2e74:    	add	x16, x16, #0x58
6eae8e2e78:    	blr	x16
6eae8e2e7c:    	mov	w2, w0
6eae8e2e80:    	dmb	ishld
6eae8e2e84:    	b	0x6eae8e2154 <trace+0x1cd4>
6eae8e2e88:    	mov	w1, w23
6eae8e2e8c:    	mov	x0, x19
6eae8e2e90:    	mov	w2, #0x4045             // =16453
6eae8e2e94:    	movk	w2, #0x1, lsl #16
6eae8e2e98:    	adr	x3, 0x6eae8e21e8 <trace+0x1d68>
6eae8e2e9c:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2ea0:    	add	x16, x16, #0x58
6eae8e2ea4:    	blr	x16
6eae8e2ea8:    	mov	w2, w0
6eae8e2eac:    	dmb	ishld
6eae8e2eb0:    	b	0x6eae8e21e8 <trace+0x1d68>
6eae8e2eb4:    	mov	w1, w23
6eae8e2eb8:    	mov	x0, x19
6eae8e2ebc:    	mov	w2, #0x4045             // =16453
6eae8e2ec0:    	movk	w2, #0x1, lsl #16
6eae8e2ec4:    	adr	x3, 0x6eae8e226c <trace+0x1dec>
6eae8e2ec8:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2ecc:    	add	x16, x16, #0x58
6eae8e2ed0:    	blr	x16
6eae8e2ed4:    	mov	w24, w0
6eae8e2ed8:    	dmb	ishld
6eae8e2edc:    	b	0x6eae8e226c <trace+0x1dec>
6eae8e2ee0:    	mov	w1, w25
6eae8e2ee4:    	mov	x0, x19
6eae8e2ee8:    	mov	w2, #0x4045             // =16453
6eae8e2eec:    	movk	w2, #0x1, lsl #16
6eae8e2ef0:    	adr	x3, 0x6eae8e22b4 <trace+0x1e34>
6eae8e2ef4:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2ef8:    	add	x16, x16, #0x58
6eae8e2efc:    	blr	x16
6eae8e2f00:    	mov	w25, w0
6eae8e2f04:    	dmb	ishld
6eae8e2f08:    	b	0x6eae8e22b4 <trace+0x1e34>
6eae8e2f0c:    	mov	w1, w24
6eae8e2f10:    	mov	w2, w25
6eae8e2f14:    	mov	x0, x19
6eae8e2f18:    	mov	w3, #0x4045             // =16453
6eae8e2f1c:    	movk	w3, #0x1, lsl #16
6eae8e2f20:    	adr	x4, 0x6eae8e2340 <trace+0x1ec0>
6eae8e2f24:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2f28:    	add	x16, x16, #0xc38
6eae8e2f2c:    	blr	x16
6eae8e2f30:    	dmb	ishld
6eae8e2f34:    	b	0x6eae8e2340 <trace+0x1ec0>
6eae8e2f38:    	mov	w1, w25
6eae8e2f3c:    	mov	x0, x19
6eae8e2f40:    	mov	w2, #0x4045             // =16453
6eae8e2f44:    	movk	w2, #0x1, lsl #16
6eae8e2f48:    	adr	x3, 0x6eae8e2368 <trace+0x1ee8>
6eae8e2f4c:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2f50:    	add	x16, x16, #0x58
6eae8e2f54:    	blr	x16
6eae8e2f58:    	mov	w25, w0
6eae8e2f5c:    	dmb	ishld
6eae8e2f60:    	b	0x6eae8e2368 <trace+0x1ee8>
6eae8e2f64:    	mov	w1, w26
6eae8e2f68:    	mov	w2, w25
6eae8e2f6c:    	mov	x0, x19
6eae8e2f70:    	mov	w3, #0x4045             // =16453
6eae8e2f74:    	movk	w3, #0x1, lsl #16
6eae8e2f78:    	adr	x4, 0x6eae8e2394 <trace+0x1f14>
6eae8e2f7c:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2f80:    	add	x16, x16, #0xc38
6eae8e2f84:    	blr	x16
6eae8e2f88:    	dmb	ishld
6eae8e2f8c:    	b	0x6eae8e2394 <trace+0x1f14>
6eae8e2f90:    	mov	w1, w25
6eae8e2f94:    	mov	w2, w0
6eae8e2f98:    	mov	x0, x19
6eae8e2f9c:    	mov	w3, #0x4045             // =16453
6eae8e2fa0:    	movk	w3, #0x1, lsl #16
6eae8e2fa4:    	adr	x4, 0x6eae8e23e0 <trace+0x1f60>
6eae8e2fa8:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2fac:    	add	x16, x16, #0xc38
6eae8e2fb0:    	blr	x16
6eae8e2fb4:    	dmb	ishld
6eae8e2fb8:    	b	0x6eae8e23e0 <trace+0x1f60>
6eae8e2fbc:    	mov	w1, w20
6eae8e2fc0:    	mov	x0, x19
6eae8e2fc4:    	mov	w2, #0x4045             // =16453
6eae8e2fc8:    	movk	w2, #0x1, lsl #16
6eae8e2fcc:    	adr	x3, 0x6eae8e2440 <trace+0x1fc0>
6eae8e2fd0:    	adrp	x16, 0x6efc87d000 <trace+0x4df9d000>
6eae8e2fd4:    	add	x16, x16, #0x58
6eae8e2fd8:    	blr	x16
6eae8e2fdc:    	mov	w20, w0
6eae8e2fe0:    	dmb	ishld
6eae8e2fe4:    	b	0x6eae8e2440 <trace+0x1fc0>
6eae8e2fe8:    	mov	w1, w24
6eae8e2fec:    	mov	w2, w20
6eae8e2ff0:    	mov	x0, x19
6eae8e2ff4:    	mov	w3, #0x4045             // =16453
6eae8e2ff8:    	movk	w3, #0x1, lsl #16
6eae8e2ffc:    	adr	x4, 0x6eae8e246c <trace+0x1fec>
6eae8e3000:    	adrp	x16, 0x6efc87d000 <trace+0x4df9c000>
6eae8e3004:    	add	x16, x16, #0xc38
6eae8e3008:    	blr	x16
6eae8e300c:    	dmb	ishld
6eae8e3010:    	b	0x6eae8e246c <trace+0x1fec>
6eae8e3014:    	mov	w1, w23
6eae8e3018:    	mov	x0, x19
6eae8e301c:    	mov	w2, #0x4045             // =16453
6eae8e3020:    	movk	w2, #0x1, lsl #16
6eae8e3024:    	adr	x3, 0x6eae8e2490 <trace+0x2010>
6eae8e3028:    	adrp	x16, 0x6efc87d000 <trace+0x4df9c000>
6eae8e302c:    	add	x16, x16, #0x58
6eae8e3030:    	blr	x16
6eae8e3034:    	mov	w20, w0
6eae8e3038:    	dmb	ishld
6eae8e303c:    	b	0x6eae8e2490 <trace+0x2010>
6eae8e3040:    	mov	w1, w23
6eae8e3044:    	mov	x0, x19
6eae8e3048:    	mov	w2, #0x4045             // =16453
6eae8e304c:    	movk	w2, #0x1, lsl #16
6eae8e3050:    	adr	x3, 0x6eae8e24bc <trace+0x203c>
6eae8e3054:    	adrp	x16, 0x6efc87d000 <trace+0x4df9c000>
6eae8e3058:    	add	x16, x16, #0x58
6eae8e305c:    	blr	x16
6eae8e3060:    	mov	w23, w0
6eae8e3064:    	dmb	ishld
6eae8e3068:    	b	0x6eae8e24bc <trace+0x203c>
6eae8e306c:    	mov	w1, w21
6eae8e3070:    	mov	x0, x19
6eae8e3074:    	mov	w2, #0x4045             // =16453
6eae8e3078:    	movk	w2, #0x1, lsl #16
6eae8e307c:    	adr	x3, 0x6eae8e24f4 <trace+0x2074>
6eae8e3080:    	adrp	x16, 0x6efc87d000 <trace+0x4df9c000>
6eae8e3084:    	add	x16, x16, #0x58
6eae8e3088:    	blr	x16
6eae8e308c:    	mov	w21, w0
6eae8e3090:    	dmb	ishld
6eae8e3094:    	b	0x6eae8e24f4 <trace+0x2074>
6eae8e3098:    	mov	w1, w20
6eae8e309c:    	mov	w2, w23
6eae8e30a0:    	mov	x0, x19
6eae8e30a4:    	mov	w3, #0x4045             // =16453
6eae8e30a8:    	movk	w3, #0x1, lsl #16
6eae8e30ac:    	adr	x4, 0x6eae8e251c <trace+0x209c>
6eae8e30b0:    	adrp	x16, 0x6efc87d000 <trace+0x4df9c000>
6eae8e30b4:    	add	x16, x16, #0xc38
6eae8e30b8:    	blr	x16
6eae8e30bc:    	dmb	ishld
6eae8e30c0:    	b	0x6eae8e251c <trace+0x209c>
6eae8e30c4:    	mov	w1, w23
6eae8e30c8:    	mov	x0, x19
6eae8e30cc:    	mov	w2, #0x4045             // =16453
6eae8e30d0:    	movk	w2, #0x1, lsl #16
6eae8e30d4:    	adr	x3, 0x6eae8e2544 <trace+0x20c4>
6eae8e30d8:    	adrp	x16, 0x6efc87d000 <trace+0x4df9c000>
6eae8e30dc:    	add	x16, x16, #0x58
6eae8e30e0:    	blr	x16
6eae8e30e4:    	mov	w23, w0
6eae8e30e8:    	dmb	ishld
6eae8e30ec:    	b	0x6eae8e2544 <trace+0x20c4>
6eae8e30f0:    	mov	w1, w24
6eae8e30f4:    	mov	w2, w21
6eae8e30f8:    	mov	x0, x19
6eae8e30fc:    	mov	w3, #0x4045             // =16453
6eae8e3100:    	movk	w3, #0x1, lsl #16
6eae8e3104:    	adr	x4, 0x6eae8e2570 <trace+0x20f0>
6eae8e3108:    	adrp	x16, 0x6efc87d000 <trace+0x4df9c000>
6eae8e310c:    	add	x16, x16, #0xc38
6eae8e3110:    	blr	x16
6eae8e3114:    	dmb	ishld
6eae8e3118:    	b	0x6eae8e2570 <trace+0x20f0>
6eae8e311c:    	mov	w1, w20
6eae8e3120:    	mov	w2, w23
6eae8e3124:    	mov	x0, x19
6eae8e3128:    	mov	w3, #0x4045             // =16453
6eae8e312c:    	movk	w3, #0x1, lsl #16
6eae8e3130:    	adr	x4, 0x6eae8e25b0 <trace+0x2130>
6eae8e3134:    	adrp	x16, 0x6efc87d000 <trace+0x4df9c000>
6eae8e3138:    	add	x16, x16, #0xc38
6eae8e313c:    	blr	x16
6eae8e3140:    	dmb	ishld
6eae8e3144:    	b	0x6eae8e25b0 <trace+0x2130>
6eae8e3148:    	mov	w1, w20
6eae8e314c:    	mov	x0, x19
6eae8e3150:    	mov	w2, #0x4045             // =16453
6eae8e3154:    	movk	w2, #0x1, lsl #16
6eae8e3158:    	adr	x3, 0x6eae8e25d8 <trace+0x2158>
6eae8e315c:    	adrp	x16, 0x6efc87d000 <trace+0x4df9c000>
6eae8e3160:    	add	x16, x16, #0x58
6eae8e3164:    	blr	x16
6eae8e3168:    	mov	w20, w0
6eae8e316c:    	dmb	ishld
6eae8e3170:    	b	0x6eae8e25d8 <trace+0x2158>