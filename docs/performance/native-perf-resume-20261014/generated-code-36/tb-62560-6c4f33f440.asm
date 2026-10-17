
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-62560-6c4f33f440.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006c4f33f440 <trace>:
6c4f33f440:    	ldur	w20, [x19, #-0x10]  // guest 0x62560, sampled 0
6c4f33f444:    	tbnz	w20, #0x1f, 0x6c4f33f9a8 <trace+0x568>  // guest 0x62560, sampled 0
6c4f33f448:    	sturb	wzr, [x19, #-0xc]  // guest 0x62560, sampled 0
6c4f33f44c:    	ldr	w20, [x19, #0x10]  // guest 0x62560, sampled 0
6c4f33f450:    	sub	w20, w20, #0x14  // guest 0x62560, sampled 0
6c4f33f454:    	str	w20, [x19, #0x10]  // guest 0x62560, sampled 0
6c4f33f458:    	mov	w21, w20  // guest 0x62560, sampled 0
6c4f33f45c:    	str	w21, [x19, #0x28]  // guest 0x62560, sampled 0
6c4f33f460:    	mov	w22, #0x14              // =20  // guest 0x62560, sampled 0
6c4f33f464:    	str	w22, [x19, #0x2c]  // guest 0x62560, sampled 0
6c4f33f468:    	ldr	w22, [x19, #0x4]  // guest 0x62563, sampled 0
6c4f33f46c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x62563, sampled 0
6c4f33f470:    	and	x16, x16, x21, lsr #7  // guest 0x62563, sampled 0
6c4f33f474:    	add	x17, x17, x16  // guest 0x62563, sampled 0
6c4f33f478:    	ldp	x17, x16, [x17, #0x8]  // guest 0x62563, sampled 0
6c4f33f47c:    	and	w30, w21, #0xfffff003  // guest 0x62563, sampled 0
6c4f33f480:    	cmp	w16, w30  // guest 0x62563, sampled 0
6c4f33f484:    	b.ne	0x6c4f33f9b0 <trace+0x570>  // guest 0x62563, sampled 0
6c4f33f488:    	add	x30, x17, w21, uxtw  // guest 0x62563, sampled 0
6c4f33f48c:    	stlr	w22, [x30]  // guest 0x62563, sampled 0
6c4f33f490:    	add	w22, w20, #0x1c  // guest 0x62566, sampled 0
6c4f33f494:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x62566, sampled 0
6c4f33f498:    	and	x16, x16, x22, lsr #7  // guest 0x62566, sampled 0
6c4f33f49c:    	add	x17, x17, x16  // guest 0x62566, sampled 0
6c4f33f4a0:    	ldp	x16, x17, [x17]  // guest 0x62566, sampled 0
6c4f33f4a4:    	and	w30, w22, #0xfffff003  // guest 0x62566, sampled 0
6c4f33f4a8:    	cmp	w16, w30  // guest 0x62566, sampled 0
6c4f33f4ac:    	b.ne	0x6c4f33f9dc <trace+0x59c>  // guest 0x62566, sampled 0
6c4f33f4b0:    	add	x30, x17, w22, uxtw  // guest 0x62566, sampled 0
6c4f33f4b4:    	ldapr	w22, [x30]  // guest 0x62566, sampled 0
6c4f33f4b8:    	str	w22, [x19]  // guest 0x62566, sampled 0
6c4f33f4bc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x6256a, sampled 0
6c4f33f4c0:    	and	x16, x16, x21, lsr #7  // guest 0x6256a, sampled 0
6c4f33f4c4:    	add	x17, x17, x16  // guest 0x6256a, sampled 0
6c4f33f4c8:    	ldp	x16, x17, [x17]  // guest 0x6256a, sampled 0
6c4f33f4cc:    	and	w30, w21, #0xfffff003  // guest 0x6256a, sampled 0
6c4f33f4d0:    	cmp	w16, w30  // guest 0x6256a, sampled 0
6c4f33f4d4:    	b.ne	0x6c4f33fa08 <trace+0x5c8>  // guest 0x6256a, sampled 0
6c4f33f4d8:    	add	x30, x17, w21, uxtw  // guest 0x6256a, sampled 0
6c4f33f4dc:    	ldapr	w23, [x30]  // guest 0x6256a, sampled 0
6c4f33f4e0:    	str	w23, [x19, #0x4]  // guest 0x6256a, sampled 1
6c4f33f4e4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x6256d, sampled 0
6c4f33f4e8:    	and	x16, x16, x23, lsr #7  // guest 0x6256d, sampled 0
6c4f33f4ec:    	add	x17, x17, x16  // guest 0x6256d, sampled 0
6c4f33f4f0:    	ldp	x16, x17, [x17]  // guest 0x6256d, sampled 0
6c4f33f4f4:    	add	w30, w23, #0xf  // guest 0x6256d, sampled 0
6c4f33f4f8:    	and	w30, w30, #0xfffff000  // guest 0x6256d, sampled 0
6c4f33f4fc:    	cmp	w16, w30  // guest 0x6256d, sampled 0
6c4f33f500:    	b.ne	0x6c4f33fa34 <trace+0x5f4>  // guest 0x6256d, sampled 0
6c4f33f504:    	add	x30, x17, w23, uxtw  // guest 0x6256d, sampled 0
6c4f33f508:    	ldp	x24, x25, [x30]  // guest 0x6256d, sampled 0
6c4f33f50c:    	dmb	ishld  // guest 0x6256d, sampled 1
6c4f33f510:    	str	x24, [x19, #0x3b0]  // guest 0x6256d, sampled 2
6c4f33f514:    	str	x25, [x19, #0x3b8]  // guest 0x6256d, sampled 0
6c4f33f518:    	add	w24, w23, #0x10  // guest 0x62570, sampled 0
6c4f33f51c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x62570, sampled 0
6c4f33f520:    	and	x16, x16, x24, lsr #7  // guest 0x62570, sampled 0
6c4f33f524:    	add	x17, x17, x16  // guest 0x62570, sampled 0
6c4f33f528:    	ldp	x16, x17, [x17]  // guest 0x62570, sampled 0
6c4f33f52c:    	add	w30, w24, #0xf  // guest 0x62570, sampled 0
6c4f33f530:    	and	w30, w30, #0xfffff000  // guest 0x62570, sampled 0
6c4f33f534:    	cmp	w16, w30  // guest 0x62570, sampled 0
6c4f33f538:    	b.ne	0x6c4f33fa60 <trace+0x620>  // guest 0x62570, sampled 0
6c4f33f53c:    	add	x30, x17, w24, uxtw  // guest 0x62570, sampled 0
6c4f33f540:    	ldp	x24, x25, [x30]  // guest 0x62570, sampled 0
6c4f33f544:    	dmb	ishld  // guest 0x62570, sampled 0
6c4f33f548:    	str	x24, [x19, #0x3f0]  // guest 0x62570, sampled 1
6c4f33f54c:    	str	x25, [x19, #0x3f8]  // guest 0x62570, sampled 0
6c4f33f550:    	add	w24, w23, #0x20  // guest 0x62574, sampled 0
6c4f33f554:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x62574, sampled 0
6c4f33f558:    	and	x16, x16, x24, lsr #7  // guest 0x62574, sampled 0
6c4f33f55c:    	add	x17, x17, x16  // guest 0x62574, sampled 0
6c4f33f560:    	ldp	x16, x17, [x17]  // guest 0x62574, sampled 0
6c4f33f564:    	add	w30, w24, #0xf  // guest 0x62574, sampled 0
6c4f33f568:    	and	w30, w30, #0xfffff000  // guest 0x62574, sampled 0
6c4f33f56c:    	cmp	w16, w30  // guest 0x62574, sampled 0
6c4f33f570:    	b.ne	0x6c4f33fa8c <trace+0x64c>  // guest 0x62574, sampled 0
6c4f33f574:    	add	x30, x17, w24, uxtw  // guest 0x62574, sampled 0
6c4f33f578:    	ldp	x24, x25, [x30]  // guest 0x62574, sampled 0
6c4f33f57c:    	dmb	ishld  // guest 0x62574, sampled 0
6c4f33f580:    	str	x24, [x19, #0x430]  // guest 0x62574, sampled 0
6c4f33f584:    	str	x25, [x19, #0x438]  // guest 0x62574, sampled 0
6c4f33f588:    	add	w23, w23, #0x30  // guest 0x62578, sampled 0
6c4f33f58c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x62578, sampled 0
6c4f33f590:    	and	x16, x16, x23, lsr #7  // guest 0x62578, sampled 0
6c4f33f594:    	add	x17, x17, x16  // guest 0x62578, sampled 0
6c4f33f598:    	ldp	x16, x17, [x17]  // guest 0x62578, sampled 0
6c4f33f59c:    	add	w30, w23, #0xf  // guest 0x62578, sampled 0
6c4f33f5a0:    	and	w30, w30, #0xfffff000  // guest 0x62578, sampled 0
6c4f33f5a4:    	cmp	w16, w30  // guest 0x62578, sampled 0
6c4f33f5a8:    	b.ne	0x6c4f33fab8 <trace+0x678>  // guest 0x62578, sampled 0
6c4f33f5ac:    	add	x30, x17, w23, uxtw  // guest 0x62578, sampled 0
6c4f33f5b0:    	ldp	x23, x24, [x30]  // guest 0x62578, sampled 0
6c4f33f5b4:    	dmb	ishld  // guest 0x62578, sampled 0
6c4f33f5b8:    	str	x23, [x19, #0x470]  // guest 0x62578, sampled 0
6c4f33f5bc:    	str	x24, [x19, #0x478]  // guest 0x62578, sampled 0
6c4f33f5c0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x6257c, sampled 0
6c4f33f5c4:    	and	x16, x16, x22, lsr #7  // guest 0x6257c, sampled 0
6c4f33f5c8:    	add	x17, x17, x16  // guest 0x6257c, sampled 0
6c4f33f5cc:    	ldp	x16, x17, [x17]  // guest 0x6257c, sampled 0
6c4f33f5d0:    	and	w30, w22, #0xfffff003  // guest 0x6257c, sampled 0
6c4f33f5d4:    	cmp	w16, w30  // guest 0x6257c, sampled 0
6c4f33f5d8:    	b.ne	0x6c4f33fae4 <trace+0x6a4>  // guest 0x6257c, sampled 0
6c4f33f5dc:    	add	x30, x17, w22, uxtw  // guest 0x6257c, sampled 0
6c4f33f5e0:    	ldapr	w23, [x30]  // guest 0x6257c, sampled 0
6c4f33f5e4:    	movi	v0.16b, #0x0  // guest 0x6257c, sampled 0
6c4f33f5e8:    	str	q0, [x19, #0x2b0]  // guest 0x6257c, sampled 0
6c4f33f5ec:    	add	x24, x19, #0x2b0  // guest 0x6257c, sampled 0
6c4f33f5f0:    	str	w23, [x24]  // guest 0x6257c, sampled 0
6c4f33f5f4:    	add	x16, x19, #0x2b0  // guest 0x62580, sampled 0
6c4f33f5f8:    	ld1r	{ v1.4s }, [x16]  // guest 0x62580, sampled 0
6c4f33f5fc:    	str	q1, [x19, #0x2b0]  // guest 0x62580, sampled 0
6c4f33f600:    	add	x1, x19, #0x2b0  // guest 0x62584, sampled 0
6c4f33f604:    	add	x2, x19, #0x2b0  // guest 0x62584, sampled 0
6c4f33f608:    	add	x3, x19, #0x3b0  // guest 0x62584, sampled 0
6c4f33f60c:    	mov	x0, x19  // guest 0x62584, sampled 0
6c4f33f610:    	adrp	x16, 0x6c9775e000 <trace+0x4841f000>  // guest 0x62584, sampled 0
6c4f33f614:    	add	x16, x16, #0xfb8  // guest 0x62584, sampled 0
6c4f33f618:    	blr	x16  // guest 0x62584, sampled 0
6c4f33f61c:    	add	w23, w22, #0x4  // guest 0x62587, sampled 0
6c4f33f620:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x62587, sampled 0
6c4f33f624:    	and	x16, x16, x23, lsr #7  // guest 0x62587, sampled 0
6c4f33f628:    	add	x17, x17, x16  // guest 0x62587, sampled 0
6c4f33f62c:    	ldp	x16, x17, [x17]  // guest 0x62587, sampled 0
6c4f33f630:    	and	w30, w23, #0xfffff003  // guest 0x62587, sampled 0
6c4f33f634:    	cmp	w16, w30  // guest 0x62587, sampled 0
6c4f33f638:    	b.ne	0x6c4f33fb10 <trace+0x6d0>  // guest 0x62587, sampled 0
6c4f33f63c:    	add	x30, x17, w23, uxtw  // guest 0x62587, sampled 0
6c4f33f640:    	ldapr	w23, [x30]  // guest 0x62587, sampled 1
6c4f33f644:    	movi	v0.16b, #0x0  // guest 0x62587, sampled 0
6c4f33f648:    	str	q0, [x19, #0x2f0]  // guest 0x62587, sampled 0
6c4f33f64c:    	add	x24, x19, #0x2f0  // guest 0x62587, sampled 0
6c4f33f650:    	str	w23, [x24]  // guest 0x62587, sampled 0
6c4f33f654:    	add	x16, x19, #0x2f0  // guest 0x6258c, sampled 0
6c4f33f658:    	ld1r	{ v1.4s }, [x16]  // guest 0x6258c, sampled 0
6c4f33f65c:    	str	q1, [x19, #0x2f0]  // guest 0x6258c, sampled 0
6c4f33f660:    	add	x1, x19, #0x2f0  // guest 0x62590, sampled 0
6c4f33f664:    	add	x2, x19, #0x2f0  // guest 0x62590, sampled 0
6c4f33f668:    	add	x3, x19, #0x3f0  // guest 0x62590, sampled 0
6c4f33f66c:    	mov	x0, x19  // guest 0x62590, sampled 0
6c4f33f670:    	adrp	x16, 0x6c9775e000 <trace+0x4841f000>  // guest 0x62590, sampled 0
6c4f33f674:    	add	x16, x16, #0xfb8  // guest 0x62590, sampled 0
6c4f33f678:    	blr	x16  // guest 0x62590, sampled 0
6c4f33f67c:    	add	w23, w22, #0x8  // guest 0x62593, sampled 0
6c4f33f680:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x62593, sampled 0
6c4f33f684:    	and	x16, x16, x23, lsr #7  // guest 0x62593, sampled 1
6c4f33f688:    	add	x17, x17, x16  // guest 0x62593, sampled 0
6c4f33f68c:    	ldp	x16, x17, [x17]  // guest 0x62593, sampled 0
6c4f33f690:    	and	w30, w23, #0xfffff003  // guest 0x62593, sampled 0
6c4f33f694:    	cmp	w16, w30  // guest 0x62593, sampled 0
6c4f33f698:    	b.ne	0x6c4f33fb3c <trace+0x6fc>  // guest 0x62593, sampled 0
6c4f33f69c:    	add	x30, x17, w23, uxtw  // guest 0x62593, sampled 0
6c4f33f6a0:    	ldapr	w23, [x30]  // guest 0x62593, sampled 0
6c4f33f6a4:    	movi	v0.16b, #0x0  // guest 0x62593, sampled 0
6c4f33f6a8:    	str	q0, [x19, #0x330]  // guest 0x62593, sampled 0
6c4f33f6ac:    	add	x24, x19, #0x330  // guest 0x62593, sampled 0
6c4f33f6b0:    	str	w23, [x24]  // guest 0x62593, sampled 0
6c4f33f6b4:    	add	x16, x19, #0x330  // guest 0x62598, sampled 0
6c4f33f6b8:    	ld1r	{ v1.4s }, [x16]  // guest 0x62598, sampled 0
6c4f33f6bc:    	str	q1, [x19, #0x330]  // guest 0x62598, sampled 0
6c4f33f6c0:    	add	x1, x19, #0x330  // guest 0x6259c, sampled 0
6c4f33f6c4:    	add	x2, x19, #0x330  // guest 0x6259c, sampled 0
6c4f33f6c8:    	add	x3, x19, #0x430  // guest 0x6259c, sampled 0
6c4f33f6cc:    	mov	x0, x19  // guest 0x6259c, sampled 0
6c4f33f6d0:    	adrp	x16, 0x6c9775e000 <trace+0x4841f000>  // guest 0x6259c, sampled 0
6c4f33f6d4:    	add	x16, x16, #0xfb8  // guest 0x6259c, sampled 0
6c4f33f6d8:    	blr	x16  // guest 0x6259c, sampled 0
6c4f33f6dc:    	add	x1, x19, #0x2b0  // guest 0x6259f, sampled 0
6c4f33f6e0:    	add	x2, x19, #0x2b0  // guest 0x6259f, sampled 0
6c4f33f6e4:    	add	x3, x19, #0x2f0  // guest 0x6259f, sampled 0
6c4f33f6e8:    	mov	x0, x19  // guest 0x6259f, sampled 0
6c4f33f6ec:    	adrp	x16, 0x6c9775e000 <trace+0x4841f000>  // guest 0x6259f, sampled 0
6c4f33f6f0:    	add	x16, x16, #0xc38  // guest 0x6259f, sampled 0
6c4f33f6f4:    	blr	x16  // guest 0x6259f, sampled 0
6c4f33f6f8:    	add	w22, w22, #0xc  // guest 0x625a2, sampled 1
6c4f33f6fc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x625a2, sampled 0
6c4f33f700:    	and	x16, x16, x22, lsr #7  // guest 0x625a2, sampled 0
6c4f33f704:    	add	x17, x17, x16  // guest 0x625a2, sampled 0
6c4f33f708:    	ldp	x16, x17, [x17]  // guest 0x625a2, sampled 0
6c4f33f70c:    	and	w30, w22, #0xfffff003  // guest 0x625a2, sampled 0
6c4f33f710:    	cmp	w16, w30  // guest 0x625a2, sampled 0
6c4f33f714:    	b.ne	0x6c4f33fb68 <trace+0x728>  // guest 0x625a2, sampled 0
6c4f33f718:    	add	x30, x17, w22, uxtw  // guest 0x625a2, sampled 2
6c4f33f71c:    	ldapr	w22, [x30]  // guest 0x625a2, sampled 0
6c4f33f720:    	movi	v0.16b, #0x0  // guest 0x625a2, sampled 0
6c4f33f724:    	str	q0, [x19, #0x370]  // guest 0x625a2, sampled 0
6c4f33f728:    	add	x23, x19, #0x370  // guest 0x625a2, sampled 0
6c4f33f72c:    	str	w22, [x23]  // guest 0x625a2, sampled 0
6c4f33f730:    	add	x16, x19, #0x370  // guest 0x625a7, sampled 0
6c4f33f734:    	ld1r	{ v0.4s }, [x16]  // guest 0x625a7, sampled 0
6c4f33f738:    	str	q0, [x19, #0x370]  // guest 0x625a7, sampled 0
6c4f33f73c:    	add	x1, x19, #0x370  // guest 0x625ab, sampled 0
6c4f33f740:    	add	x2, x19, #0x370  // guest 0x625ab, sampled 0
6c4f33f744:    	add	x3, x19, #0x470  // guest 0x625ab, sampled 0
6c4f33f748:    	mov	x0, x19  // guest 0x625ab, sampled 0
6c4f33f74c:    	adrp	x16, 0x6c9775e000 <trace+0x4841f000>  // guest 0x625ab, sampled 0
6c4f33f750:    	add	x16, x16, #0xfb8  // guest 0x625ab, sampled 0
6c4f33f754:    	blr	x16  // guest 0x625ab, sampled 0
6c4f33f758:    	add	w22, w20, #0x4  // guest 0x625ae, sampled 0
6c4f33f75c:    	str	w22, [x19]  // guest 0x625ae, sampled 0
6c4f33f760:    	add	x1, x19, #0x330  // guest 0x625b2, sampled 0
6c4f33f764:    	add	x2, x19, #0x330  // guest 0x625b2, sampled 0
6c4f33f768:    	add	x3, x19, #0x370  // guest 0x625b2, sampled 0
6c4f33f76c:    	mov	x0, x19  // guest 0x625b2, sampled 0
6c4f33f770:    	adrp	x16, 0x6c9775e000 <trace+0x4841f000>  // guest 0x625b2, sampled 0
6c4f33f774:    	add	x16, x16, #0xc38  // guest 0x625b2, sampled 0
6c4f33f778:    	blr	x16  // guest 0x625b2, sampled 0
6c4f33f77c:    	add	x1, x19, #0x2b0  // guest 0x625b5, sampled 0
6c4f33f780:    	add	x2, x19, #0x2b0  // guest 0x625b5, sampled 0
6c4f33f784:    	add	x3, x19, #0x330  // guest 0x625b5, sampled 0
6c4f33f788:    	mov	x0, x19  // guest 0x625b5, sampled 0
6c4f33f78c:    	adrp	x16, 0x6c9775e000 <trace+0x4841f000>  // guest 0x625b5, sampled 0
6c4f33f790:    	add	x16, x16, #0xc38  // guest 0x625b5, sampled 0
6c4f33f794:    	blr	x16  // guest 0x625b5, sampled 0
6c4f33f798:    	ldr	x23, [x19, #0x2b0]  // guest 0x625b8, sampled 0
6c4f33f79c:    	ldr	x24, [x19, #0x2b8]  // guest 0x625b8, sampled 0
6c4f33f7a0:    	dmb	ishst  // guest 0x625b8, sampled 0
6c4f33f7a4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x625b8, sampled 0
6c4f33f7a8:    	and	x16, x16, x22, lsr #7  // guest 0x625b8, sampled 0
6c4f33f7ac:    	add	x17, x17, x16  // guest 0x625b8, sampled 0
6c4f33f7b0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x625b8, sampled 0
6c4f33f7b4:    	add	w30, w22, #0xf  // guest 0x625b8, sampled 0
6c4f33f7b8:    	and	w30, w30, #0xfffff000  // guest 0x625b8, sampled 0
6c4f33f7bc:    	cmp	w16, w30  // guest 0x625b8, sampled 0
6c4f33f7c0:    	b.ne	0x6c4f33fb94 <trace+0x754>  // guest 0x625b8, sampled 0
6c4f33f7c4:    	add	x30, x17, w22, uxtw  // guest 0x625b8, sampled 0
6c4f33f7c8:    	stp	x23, x24, [x30]  // guest 0x625b8, sampled 0
6c4f33f7cc:    	add	w22, w20, #0x18  // guest 0x625bb, sampled 0
6c4f33f7d0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x625bb, sampled 0
6c4f33f7d4:    	and	x16, x16, x22, lsr #7  // guest 0x625bb, sampled 0
6c4f33f7d8:    	add	x17, x17, x16  // guest 0x625bb, sampled 0
6c4f33f7dc:    	ldp	x16, x17, [x17]  // guest 0x625bb, sampled 0
6c4f33f7e0:    	and	w30, w22, #0xfffff003  // guest 0x625bb, sampled 0
6c4f33f7e4:    	cmp	w16, w30  // guest 0x625bb, sampled 0
6c4f33f7e8:    	b.ne	0x6c4f33fbc4 <trace+0x784>  // guest 0x625bb, sampled 0
6c4f33f7ec:    	add	x30, x17, w22, uxtw  // guest 0x625bb, sampled 0
6c4f33f7f0:    	ldapr	w22, [x30]  // guest 0x625bb, sampled 0
6c4f33f7f4:    	str	w22, [x19]  // guest 0x625bb, sampled 1
6c4f33f7f8:    	add	w23, w20, #0x4  // guest 0x625bf, sampled 0
6c4f33f7fc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x625bf, sampled 0
6c4f33f800:    	and	x16, x16, x23, lsr #7  // guest 0x625bf, sampled 0
6c4f33f804:    	add	x17, x17, x16  // guest 0x625bf, sampled 0
6c4f33f808:    	ldp	x16, x17, [x17]  // guest 0x625bf, sampled 0
6c4f33f80c:    	and	w30, w23, #0xfffff003  // guest 0x625bf, sampled 0
6c4f33f810:    	cmp	w16, w30  // guest 0x625bf, sampled 0
6c4f33f814:    	b.ne	0x6c4f33fbf0 <trace+0x7b0>  // guest 0x625bf, sampled 0
6c4f33f818:    	add	x30, x17, w23, uxtw  // guest 0x625bf, sampled 0
6c4f33f81c:    	ldapr	w23, [x30]  // guest 0x625bf, sampled 0
6c4f33f820:    	str	w23, [x19, #0x8]  // guest 0x625bf, sampled 0
6c4f33f824:    	mov	w24, w22  // guest 0x625c3, sampled 0
6c4f33f828:    	str	w24, [x19, #0x4]  // guest 0x625c3, sampled 0
6c4f33f82c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x625c5, sampled 0
6c4f33f830:    	and	x16, x16, x22, lsr #7  // guest 0x625c5, sampled 0
6c4f33f834:    	add	x17, x17, x16  // guest 0x625c5, sampled 0
6c4f33f838:    	ldp	x17, x16, [x17, #0x8]  // guest 0x625c5, sampled 0
6c4f33f83c:    	and	w30, w22, #0xfffff003  // guest 0x625c5, sampled 0
6c4f33f840:    	cmp	w16, w30  // guest 0x625c5, sampled 0
6c4f33f844:    	b.ne	0x6c4f33fc1c <trace+0x7dc>  // guest 0x625c5, sampled 0
6c4f33f848:    	add	x30, x17, w22, uxtw  // guest 0x625c5, sampled 0
6c4f33f84c:    	stlr	w23, [x30]  // guest 0x625c5, sampled 0
6c4f33f850:    	add	w23, w20, #0x8  // guest 0x625c7, sampled 0
6c4f33f854:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x625c7, sampled 0
6c4f33f858:    	and	x16, x16, x23, lsr #7  // guest 0x625c7, sampled 0
6c4f33f85c:    	add	x17, x17, x16  // guest 0x625c7, sampled 0
6c4f33f860:    	ldp	x16, x17, [x17]  // guest 0x625c7, sampled 0
6c4f33f864:    	and	w30, w23, #0xfffff003  // guest 0x625c7, sampled 0
6c4f33f868:    	cmp	w16, w30  // guest 0x625c7, sampled 0
6c4f33f86c:    	b.ne	0x6c4f33fc48 <trace+0x808>  // guest 0x625c7, sampled 0
6c4f33f870:    	add	x30, x17, w23, uxtw  // guest 0x625c7, sampled 0
6c4f33f874:    	ldapr	w23, [x30]  // guest 0x625c7, sampled 0
6c4f33f878:    	str	w23, [x19, #0x8]  // guest 0x625c7, sampled 0
6c4f33f87c:    	add	w25, w24, #0x4  // guest 0x625cb, sampled 0
6c4f33f880:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x625cb, sampled 0
6c4f33f884:    	and	x16, x16, x25, lsr #7  // guest 0x625cb, sampled 0
6c4f33f888:    	add	x17, x17, x16  // guest 0x625cb, sampled 0
6c4f33f88c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x625cb, sampled 0
6c4f33f890:    	and	w30, w25, #0xfffff003  // guest 0x625cb, sampled 0
6c4f33f894:    	cmp	w16, w30  // guest 0x625cb, sampled 0
6c4f33f898:    	b.ne	0x6c4f33fc74 <trace+0x834>  // guest 0x625cb, sampled 0
6c4f33f89c:    	add	x30, x17, w25, uxtw  // guest 0x625cb, sampled 0
6c4f33f8a0:    	stlr	w23, [x30]  // guest 0x625cb, sampled 0
6c4f33f8a4:    	add	w23, w20, #0xc  // guest 0x625ce, sampled 1
6c4f33f8a8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x625ce, sampled 0
6c4f33f8ac:    	and	x16, x16, x23, lsr #7  // guest 0x625ce, sampled 0
6c4f33f8b0:    	add	x17, x17, x16  // guest 0x625ce, sampled 0
6c4f33f8b4:    	ldp	x16, x17, [x17]  // guest 0x625ce, sampled 0
6c4f33f8b8:    	and	w30, w23, #0xfffff003  // guest 0x625ce, sampled 0
6c4f33f8bc:    	cmp	w16, w30  // guest 0x625ce, sampled 0
6c4f33f8c0:    	b.ne	0x6c4f33fca0 <trace+0x860>  // guest 0x625ce, sampled 0
6c4f33f8c4:    	add	x30, x17, w23, uxtw  // guest 0x625ce, sampled 0
6c4f33f8c8:    	ldapr	w23, [x30]  // guest 0x625ce, sampled 0
6c4f33f8cc:    	str	w23, [x19, #0x8]  // guest 0x625ce, sampled 0
6c4f33f8d0:    	add	w24, w24, #0x8  // guest 0x625d2, sampled 0
6c4f33f8d4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x625d2, sampled 0
6c4f33f8d8:    	and	x16, x16, x24, lsr #7  // guest 0x625d2, sampled 0
6c4f33f8dc:    	add	x17, x17, x16  // guest 0x625d2, sampled 0
6c4f33f8e0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x625d2, sampled 0
6c4f33f8e4:    	and	w30, w24, #0xfffff003  // guest 0x625d2, sampled 0
6c4f33f8e8:    	cmp	w16, w30  // guest 0x625d2, sampled 0
6c4f33f8ec:    	b.ne	0x6c4f33fccc <trace+0x88c>  // guest 0x625d2, sampled 0
6c4f33f8f0:    	add	x30, x17, w24, uxtw  // guest 0x625d2, sampled 0
6c4f33f8f4:    	stlr	w23, [x30]  // guest 0x625d2, sampled 0
6c4f33f8f8:    	add	w20, w20, #0x10  // guest 0x625d5, sampled 0
6c4f33f8fc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x625d5, sampled 0
6c4f33f900:    	and	x16, x16, x20, lsr #7  // guest 0x625d5, sampled 0
6c4f33f904:    	add	x17, x17, x16  // guest 0x625d5, sampled 0
6c4f33f908:    	ldp	x16, x17, [x17]  // guest 0x625d5, sampled 0
6c4f33f90c:    	and	w30, w20, #0xfffff003  // guest 0x625d5, sampled 0
6c4f33f910:    	cmp	w16, w30  // guest 0x625d5, sampled 0
6c4f33f914:    	b.ne	0x6c4f33fcf8 <trace+0x8b8>  // guest 0x625d5, sampled 0
6c4f33f918:    	add	x30, x17, w20, uxtw  // guest 0x625d5, sampled 0
6c4f33f91c:    	ldapr	w20, [x30]  // guest 0x625d5, sampled 0
6c4f33f920:    	str	w20, [x19, #0x4]  // guest 0x625d5, sampled 0
6c4f33f924:    	add	w22, w22, #0xc  // guest 0x625d9, sampled 1
6c4f33f928:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x625d9, sampled 0
6c4f33f92c:    	and	x16, x16, x22, lsr #7  // guest 0x625d9, sampled 0
6c4f33f930:    	add	x17, x17, x16  // guest 0x625d9, sampled 0
6c4f33f934:    	ldp	x17, x16, [x17, #0x8]  // guest 0x625d9, sampled 0
6c4f33f938:    	and	w30, w22, #0xfffff003  // guest 0x625d9, sampled 1
6c4f33f93c:    	cmp	w16, w30  // guest 0x625d9, sampled 0
6c4f33f940:    	b.ne	0x6c4f33fd24 <trace+0x8e4>  // guest 0x625d9, sampled 0
6c4f33f944:    	add	x30, x17, w22, uxtw  // guest 0x625d9, sampled 0
6c4f33f948:    	stlr	w20, [x30]  // guest 0x625d9, sampled 0
6c4f33f94c:    	add	w20, w21, #0x14  // guest 0x625dc, sampled 0
6c4f33f950:    	str	w20, [x19, #0x10]  // guest 0x625dc, sampled 0
6c4f33f954:    	mov	w21, w20  // guest 0x625dc, sampled 0
6c4f33f958:    	str	w21, [x19, #0x28]  // guest 0x625dc, sampled 0
6c4f33f95c:    	mov	w22, #0x1               // =1  // guest 0x625dc, sampled 0
6c4f33f960:    	sturb	w22, [x19, #-0xc]  // guest 0x625dc, sampled 0
6c4f33f964:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x625df, sampled 0
6c4f33f968:    	and	x16, x16, x21, lsr #7  // guest 0x625df, sampled 0
6c4f33f96c:    	add	x17, x17, x16  // guest 0x625df, sampled 0
6c4f33f970:    	ldp	x16, x17, [x17]  // guest 0x625df, sampled 0
6c4f33f974:    	and	w30, w21, #0xfffff003  // guest 0x625df, sampled 0
6c4f33f978:    	cmp	w16, w30  // guest 0x625df, sampled 0
6c4f33f97c:    	b.ne	0x6c4f33fd50 <trace+0x910>  // guest 0x625df, sampled 0
6c4f33f980:    	add	x30, x17, w21, uxtw  // guest 0x625df, sampled 0
6c4f33f984:    	ldapr	w21, [x30]  // guest 0x625df, sampled 0
6c4f33f988:    	add	w20, w20, #0xc  // guest 0x625df, sampled 1
6c4f33f98c:    	str	w20, [x19, #0x10]  // guest 0x625df, sampled 0
6c4f33f990:    	str	w21, [x19, #0x20]  // guest 0x625df, sampled 0
6c4f33f994:    	mov	w20, #0xa               // =10  // guest 0x625df, sampled 0
6c4f33f998:    	str	w20, [x19, #0x34]  // guest 0x625df, sampled 0
6c4f33f99c:    	mov	x0, x19  // guest 0x625df, sampled 0
6c4f33f9a0:    	bl	0x6c4ae5d53c <trace+0xfffffffffbb1e0fc>  // guest 0x625df, sampled 0
6c4f33f9a4:    	br	x0  // guest 0x625df, sampled 0
6c4f33f9a8:    	adr	x0, 0x6c4f33f383 <trace+0xffffffffffffff43>  // guest 0x625df, sampled 0
6c4f33f9ac:    	b	0x6c4ae5d02c <trace+0xfffffffffbb1dbec>  // guest 0x625df, sampled 0
6c4f33f9b0:    	mov	w1, w21
6c4f33f9b4:    	mov	w2, w22
6c4f33f9b8:    	mov	x0, x19
6c4f33f9bc:    	mov	w3, #0x4045             // =16453
6c4f33f9c0:    	movk	w3, #0x1, lsl #16
6c4f33f9c4:    	adr	x4, 0x6c4f33f490 <trace+0x50>
6c4f33f9c8:    	adrp	x16, 0x6c97724000 <trace+0x483e5000>
6c4f33f9cc:    	add	x16, x16, #0xb68
6c4f33f9d0:    	blr	x16
6c4f33f9d4:    	dmb	ishld
6c4f33f9d8:    	b	0x6c4f33f490 <trace+0x50>
6c4f33f9dc:    	mov	w1, w22
6c4f33f9e0:    	mov	x0, x19
6c4f33f9e4:    	mov	w2, #0x4045             // =16453
6c4f33f9e8:    	movk	w2, #0x1, lsl #16
6c4f33f9ec:    	adr	x3, 0x6c4f33f4b8 <trace+0x78>
6c4f33f9f0:    	adrp	x16, 0x6c97723000 <trace+0x483e4000>
6c4f33f9f4:    	add	x16, x16, #0xf88
6c4f33f9f8:    	blr	x16
6c4f33f9fc:    	mov	w22, w0
6c4f33fa00:    	dmb	ishld
6c4f33fa04:    	b	0x6c4f33f4b8 <trace+0x78>
6c4f33fa08:    	mov	w1, w21
6c4f33fa0c:    	mov	x0, x19
6c4f33fa10:    	mov	w2, #0x4045             // =16453
6c4f33fa14:    	movk	w2, #0x1, lsl #16
6c4f33fa18:    	adr	x3, 0x6c4f33f4e0 <trace+0xa0>
6c4f33fa1c:    	adrp	x16, 0x6c97723000 <trace+0x483e4000>
6c4f33fa20:    	add	x16, x16, #0xf88
6c4f33fa24:    	blr	x16
6c4f33fa28:    	mov	w23, w0
6c4f33fa2c:    	dmb	ishld
6c4f33fa30:    	b	0x6c4f33f4e0 <trace+0xa0>
6c4f33fa34:    	mov	w1, w23
6c4f33fa38:    	mov	x0, x19
6c4f33fa3c:    	mov	w2, #0x4085             // =16517
6c4f33fa40:    	movk	w2, #0x1, lsl #16
6c4f33fa44:    	adr	x3, 0x6c4f33f50c <trace+0xcc>
6c4f33fa48:    	adrp	x16, 0x6c97724000 <trace+0x483e5000>
6c4f33fa4c:    	add	x16, x16, #0x46c
6c4f33fa50:    	blr	x16
6c4f33fa54:    	mov	x24, x0
6c4f33fa58:    	mov	x25, x1
6c4f33fa5c:    	b	0x6c4f33f50c <trace+0xcc>
6c4f33fa60:    	mov	w1, w24
6c4f33fa64:    	mov	x0, x19
6c4f33fa68:    	mov	w2, #0x4085             // =16517
6c4f33fa6c:    	movk	w2, #0x1, lsl #16
6c4f33fa70:    	adr	x3, 0x6c4f33f544 <trace+0x104>
6c4f33fa74:    	adrp	x16, 0x6c97724000 <trace+0x483e5000>
6c4f33fa78:    	add	x16, x16, #0x46c
6c4f33fa7c:    	blr	x16
6c4f33fa80:    	mov	x24, x0
6c4f33fa84:    	mov	x25, x1
6c4f33fa88:    	b	0x6c4f33f544 <trace+0x104>
6c4f33fa8c:    	mov	w1, w24
6c4f33fa90:    	mov	x0, x19
6c4f33fa94:    	mov	w2, #0x4085             // =16517
6c4f33fa98:    	movk	w2, #0x1, lsl #16
6c4f33fa9c:    	adr	x3, 0x6c4f33f57c <trace+0x13c>
6c4f33faa0:    	adrp	x16, 0x6c97724000 <trace+0x483e5000>
6c4f33faa4:    	add	x16, x16, #0x46c
6c4f33faa8:    	blr	x16
6c4f33faac:    	mov	x24, x0
6c4f33fab0:    	mov	x25, x1
6c4f33fab4:    	b	0x6c4f33f57c <trace+0x13c>
6c4f33fab8:    	mov	w1, w23
6c4f33fabc:    	mov	x0, x19
6c4f33fac0:    	mov	w2, #0x4085             // =16517
6c4f33fac4:    	movk	w2, #0x1, lsl #16
6c4f33fac8:    	adr	x3, 0x6c4f33f5b4 <trace+0x174>
6c4f33facc:    	adrp	x16, 0x6c97724000 <trace+0x483e5000>
6c4f33fad0:    	add	x16, x16, #0x46c
6c4f33fad4:    	blr	x16
6c4f33fad8:    	mov	x23, x0
6c4f33fadc:    	mov	x24, x1
6c4f33fae0:    	b	0x6c4f33f5b4 <trace+0x174>
6c4f33fae4:    	mov	w1, w22
6c4f33fae8:    	mov	x0, x19
6c4f33faec:    	mov	w2, #0x4045             // =16453
6c4f33faf0:    	movk	w2, #0x1, lsl #16
6c4f33faf4:    	adr	x3, 0x6c4f33f5e4 <trace+0x1a4>
6c4f33faf8:    	adrp	x16, 0x6c97723000 <trace+0x483e4000>
6c4f33fafc:    	add	x16, x16, #0xf88
6c4f33fb00:    	blr	x16
6c4f33fb04:    	mov	w23, w0
6c4f33fb08:    	dmb	ishld
6c4f33fb0c:    	b	0x6c4f33f5e4 <trace+0x1a4>
6c4f33fb10:    	mov	w1, w23
6c4f33fb14:    	mov	x0, x19
6c4f33fb18:    	mov	w2, #0x4045             // =16453
6c4f33fb1c:    	movk	w2, #0x1, lsl #16
6c4f33fb20:    	adr	x3, 0x6c4f33f644 <trace+0x204>
6c4f33fb24:    	adrp	x16, 0x6c97723000 <trace+0x483e4000>
6c4f33fb28:    	add	x16, x16, #0xf88
6c4f33fb2c:    	blr	x16
6c4f33fb30:    	mov	w23, w0
6c4f33fb34:    	dmb	ishld
6c4f33fb38:    	b	0x6c4f33f644 <trace+0x204>
6c4f33fb3c:    	mov	w1, w23
6c4f33fb40:    	mov	x0, x19
6c4f33fb44:    	mov	w2, #0x4045             // =16453
6c4f33fb48:    	movk	w2, #0x1, lsl #16
6c4f33fb4c:    	adr	x3, 0x6c4f33f6a4 <trace+0x264>
6c4f33fb50:    	adrp	x16, 0x6c97723000 <trace+0x483e4000>
6c4f33fb54:    	add	x16, x16, #0xf88
6c4f33fb58:    	blr	x16
6c4f33fb5c:    	mov	w23, w0
6c4f33fb60:    	dmb	ishld
6c4f33fb64:    	b	0x6c4f33f6a4 <trace+0x264>
6c4f33fb68:    	mov	w1, w22
6c4f33fb6c:    	mov	x0, x19
6c4f33fb70:    	mov	w2, #0x4045             // =16453
6c4f33fb74:    	movk	w2, #0x1, lsl #16
6c4f33fb78:    	adr	x3, 0x6c4f33f720 <trace+0x2e0>
6c4f33fb7c:    	adrp	x16, 0x6c97723000 <trace+0x483e4000>
6c4f33fb80:    	add	x16, x16, #0xf88
6c4f33fb84:    	blr	x16
6c4f33fb88:    	mov	w22, w0
6c4f33fb8c:    	dmb	ishld
6c4f33fb90:    	b	0x6c4f33f720 <trace+0x2e0>
6c4f33fb94:    	mov	w1, w22
6c4f33fb98:    	mov	x2, x23
6c4f33fb9c:    	mov	x3, x24
6c4f33fba0:    	mov	x0, x19
6c4f33fba4:    	mov	w4, #0x4085             // =16517
6c4f33fba8:    	movk	w4, #0x1, lsl #16
6c4f33fbac:    	adr	x5, 0x6c4f33f7cc <trace+0x38c>
6c4f33fbb0:    	adrp	x16, 0x6c97724000 <trace+0x483e5000>
6c4f33fbb4:    	add	x16, x16, #0xfdc
6c4f33fbb8:    	blr	x16
6c4f33fbbc:    	dmb	ishld
6c4f33fbc0:    	b	0x6c4f33f7cc <trace+0x38c>
6c4f33fbc4:    	mov	w1, w22
6c4f33fbc8:    	mov	x0, x19
6c4f33fbcc:    	mov	w2, #0x4045             // =16453
6c4f33fbd0:    	movk	w2, #0x1, lsl #16
6c4f33fbd4:    	adr	x3, 0x6c4f33f7f4 <trace+0x3b4>
6c4f33fbd8:    	adrp	x16, 0x6c97723000 <trace+0x483e4000>
6c4f33fbdc:    	add	x16, x16, #0xf88
6c4f33fbe0:    	blr	x16
6c4f33fbe4:    	mov	w22, w0
6c4f33fbe8:    	dmb	ishld
6c4f33fbec:    	b	0x6c4f33f7f4 <trace+0x3b4>
6c4f33fbf0:    	mov	w1, w23
6c4f33fbf4:    	mov	x0, x19
6c4f33fbf8:    	mov	w2, #0x4045             // =16453
6c4f33fbfc:    	movk	w2, #0x1, lsl #16
6c4f33fc00:    	adr	x3, 0x6c4f33f820 <trace+0x3e0>
6c4f33fc04:    	adrp	x16, 0x6c97723000 <trace+0x483e4000>
6c4f33fc08:    	add	x16, x16, #0xf88
6c4f33fc0c:    	blr	x16
6c4f33fc10:    	mov	w23, w0
6c4f33fc14:    	dmb	ishld
6c4f33fc18:    	b	0x6c4f33f820 <trace+0x3e0>
6c4f33fc1c:    	mov	w1, w22
6c4f33fc20:    	mov	w2, w23
6c4f33fc24:    	mov	x0, x19
6c4f33fc28:    	mov	w3, #0x4045             // =16453
6c4f33fc2c:    	movk	w3, #0x1, lsl #16
6c4f33fc30:    	adr	x4, 0x6c4f33f850 <trace+0x410>
6c4f33fc34:    	adrp	x16, 0x6c97724000 <trace+0x483e5000>
6c4f33fc38:    	add	x16, x16, #0xb68
6c4f33fc3c:    	blr	x16
6c4f33fc40:    	dmb	ishld
6c4f33fc44:    	b	0x6c4f33f850 <trace+0x410>
6c4f33fc48:    	mov	w1, w23
6c4f33fc4c:    	mov	x0, x19
6c4f33fc50:    	mov	w2, #0x4045             // =16453
6c4f33fc54:    	movk	w2, #0x1, lsl #16
6c4f33fc58:    	adr	x3, 0x6c4f33f878 <trace+0x438>
6c4f33fc5c:    	adrp	x16, 0x6c97723000 <trace+0x483e4000>
6c4f33fc60:    	add	x16, x16, #0xf88
6c4f33fc64:    	blr	x16
6c4f33fc68:    	mov	w23, w0
6c4f33fc6c:    	dmb	ishld
6c4f33fc70:    	b	0x6c4f33f878 <trace+0x438>
6c4f33fc74:    	mov	w1, w25
6c4f33fc78:    	mov	w2, w23
6c4f33fc7c:    	mov	x0, x19
6c4f33fc80:    	mov	w3, #0x4045             // =16453
6c4f33fc84:    	movk	w3, #0x1, lsl #16
6c4f33fc88:    	adr	x4, 0x6c4f33f8a4 <trace+0x464>
6c4f33fc8c:    	adrp	x16, 0x6c97724000 <trace+0x483e5000>
6c4f33fc90:    	add	x16, x16, #0xb68
6c4f33fc94:    	blr	x16
6c4f33fc98:    	dmb	ishld
6c4f33fc9c:    	b	0x6c4f33f8a4 <trace+0x464>
6c4f33fca0:    	mov	w1, w23
6c4f33fca4:    	mov	x0, x19
6c4f33fca8:    	mov	w2, #0x4045             // =16453
6c4f33fcac:    	movk	w2, #0x1, lsl #16
6c4f33fcb0:    	adr	x3, 0x6c4f33f8cc <trace+0x48c>
6c4f33fcb4:    	adrp	x16, 0x6c97723000 <trace+0x483e4000>
6c4f33fcb8:    	add	x16, x16, #0xf88
6c4f33fcbc:    	blr	x16
6c4f33fcc0:    	mov	w23, w0
6c4f33fcc4:    	dmb	ishld
6c4f33fcc8:    	b	0x6c4f33f8cc <trace+0x48c>
6c4f33fccc:    	mov	w1, w24
6c4f33fcd0:    	mov	w2, w23
6c4f33fcd4:    	mov	x0, x19
6c4f33fcd8:    	mov	w3, #0x4045             // =16453
6c4f33fcdc:    	movk	w3, #0x1, lsl #16
6c4f33fce0:    	adr	x4, 0x6c4f33f8f8 <trace+0x4b8>
6c4f33fce4:    	adrp	x16, 0x6c97724000 <trace+0x483e5000>
6c4f33fce8:    	add	x16, x16, #0xb68
6c4f33fcec:    	blr	x16
6c4f33fcf0:    	dmb	ishld
6c4f33fcf4:    	b	0x6c4f33f8f8 <trace+0x4b8>
6c4f33fcf8:    	mov	w1, w20
6c4f33fcfc:    	mov	x0, x19
6c4f33fd00:    	mov	w2, #0x4045             // =16453
6c4f33fd04:    	movk	w2, #0x1, lsl #16
6c4f33fd08:    	adr	x3, 0x6c4f33f920 <trace+0x4e0>
6c4f33fd0c:    	adrp	x16, 0x6c97723000 <trace+0x483e4000>
6c4f33fd10:    	add	x16, x16, #0xf88
6c4f33fd14:    	blr	x16
6c4f33fd18:    	mov	w20, w0
6c4f33fd1c:    	dmb	ishld
6c4f33fd20:    	b	0x6c4f33f920 <trace+0x4e0>
6c4f33fd24:    	mov	w1, w22
6c4f33fd28:    	mov	w2, w20
6c4f33fd2c:    	mov	x0, x19
6c4f33fd30:    	mov	w3, #0x4045             // =16453
6c4f33fd34:    	movk	w3, #0x1, lsl #16
6c4f33fd38:    	adr	x4, 0x6c4f33f94c <trace+0x50c>
6c4f33fd3c:    	adrp	x16, 0x6c97724000 <trace+0x483e5000>
6c4f33fd40:    	add	x16, x16, #0xb68
6c4f33fd44:    	blr	x16
6c4f33fd48:    	dmb	ishld
6c4f33fd4c:    	b	0x6c4f33f94c <trace+0x50c>
6c4f33fd50:    	mov	w1, w21
6c4f33fd54:    	mov	x0, x19
6c4f33fd58:    	mov	w2, #0x4045             // =16453
6c4f33fd5c:    	movk	w2, #0x1, lsl #16
6c4f33fd60:    	adr	x3, 0x6c4f33f988 <trace+0x548>
6c4f33fd64:    	adrp	x16, 0x6c97723000 <trace+0x483e4000>
6c4f33fd68:    	add	x16, x16, #0xf88
6c4f33fd6c:    	blr	x16
6c4f33fd70:    	mov	w21, w0
6c4f33fd74:    	dmb	ishld
6c4f33fd78:    	b	0x6c4f33f988 <trace+0x548>