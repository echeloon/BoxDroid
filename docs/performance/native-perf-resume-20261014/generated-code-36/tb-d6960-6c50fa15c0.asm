
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-d6960-6c50fa15c0.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006c50fa15c0 <trace>:
6c50fa15c0:    	ldur	w20, [x19, #-0x10]  // guest 0xd6960, sampled 0
6c50fa15c4:    	tbnz	w20, #0x1f, 0x6c50fa16ec <trace+0x12c>  // guest 0xd6960, sampled 0
6c50fa15c8:    	sturb	wzr, [x19, #-0xc]  // guest 0xd6960, sampled 0
6c50fa15cc:    	ldr	w20, [x19, #0x10]  // guest 0xd6960, sampled 0
6c50fa15d0:    	sub	w20, w20, #0x4  // guest 0xd6960, sampled 0
6c50fa15d4:    	mov	w21, w20  // guest 0xd6960, sampled 0
6c50fa15d8:    	ldr	w22, [x19, #0xc]  // guest 0xd6960, sampled 0
6c50fa15dc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0xd6960, sampled 0
6c50fa15e0:    	and	x16, x16, x21, lsr #7  // guest 0xd6960, sampled 0
6c50fa15e4:    	add	x17, x17, x16  // guest 0xd6960, sampled 0
6c50fa15e8:    	ldp	x17, x16, [x17, #0x8]  // guest 0xd6960, sampled 0
6c50fa15ec:    	and	w30, w21, #0xfffff003  // guest 0xd6960, sampled 0
6c50fa15f0:    	cmp	w16, w30  // guest 0xd6960, sampled 0
6c50fa15f4:    	b.ne	0x6c50fa16f4 <trace+0x134>  // guest 0xd6960, sampled 0
6c50fa15f8:    	add	x30, x17, w21, uxtw  // guest 0xd6960, sampled 1
6c50fa15fc:    	stlr	w22, [x30]  // guest 0xd6960, sampled 0
6c50fa1600:    	str	w20, [x19, #0x10]  // guest 0xd6960, sampled 0
6c50fa1604:    	sub	w20, w20, #0x4  // guest 0xd6961, sampled 0
6c50fa1608:    	mov	w21, w20  // guest 0xd6961, sampled 0
6c50fa160c:    	ldr	w22, [x19, #0x18]  // guest 0xd6961, sampled 0
6c50fa1610:    	ldp	x16, x17, [x19, #-0x70]  // guest 0xd6961, sampled 0
6c50fa1614:    	and	x16, x16, x21, lsr #7  // guest 0xd6961, sampled 0
6c50fa1618:    	add	x17, x17, x16  // guest 0xd6961, sampled 0
6c50fa161c:    	ldp	x17, x16, [x17, #0x8]  // guest 0xd6961, sampled 0
6c50fa1620:    	and	w30, w21, #0xfffff003  // guest 0xd6961, sampled 0
6c50fa1624:    	cmp	w16, w30  // guest 0xd6961, sampled 0
6c50fa1628:    	b.ne	0x6c50fa1720 <trace+0x160>  // guest 0xd6961, sampled 0
6c50fa162c:    	add	x30, x17, w21, uxtw  // guest 0xd6961, sampled 0
6c50fa1630:    	stlr	w22, [x30]  // guest 0xd6961, sampled 0
6c50fa1634:    	str	w20, [x19, #0x10]  // guest 0xd6961, sampled 0
6c50fa1638:    	add	w20, w20, #0xc  // guest 0xd6962, sampled 0
6c50fa163c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0xd6962, sampled 0
6c50fa1640:    	and	x16, x16, x20, lsr #7  // guest 0xd6962, sampled 0
6c50fa1644:    	add	x17, x17, x16  // guest 0xd6962, sampled 0
6c50fa1648:    	ldp	x16, x17, [x17]  // guest 0xd6962, sampled 0
6c50fa164c:    	and	w30, w20, #0xfffff003  // guest 0xd6962, sampled 0
6c50fa1650:    	cmp	w16, w30  // guest 0xd6962, sampled 0
6c50fa1654:    	b.ne	0x6c50fa174c <trace+0x18c>  // guest 0xd6962, sampled 0
6c50fa1658:    	add	x30, x17, w20, uxtw  // guest 0xd6962, sampled 0
6c50fa165c:    	ldapr	w20, [x30]  // guest 0xd6962, sampled 0
6c50fa1660:    	str	w20, [x19, #0x18]  // guest 0xd6962, sampled 0
6c50fa1664:    	add	w20, w20, #0x60  // guest 0xd6966, sampled 0
6c50fa1668:    	ldp	x16, x17, [x19, #-0x70]  // guest 0xd6966, sampled 0
6c50fa166c:    	and	x16, x16, x20, lsr #7  // guest 0xd6966, sampled 0
6c50fa1670:    	add	x17, x17, x16  // guest 0xd6966, sampled 0
6c50fa1674:    	ldp	x16, x17, [x17]  // guest 0xd6966, sampled 0
6c50fa1678:    	and	w30, w20, #0xfffff003  // guest 0xd6966, sampled 0
6c50fa167c:    	cmp	w16, w30  // guest 0xd6966, sampled 0
6c50fa1680:    	b.ne	0x6c50fa1778 <trace+0x1b8>  // guest 0xd6966, sampled 0
6c50fa1684:    	add	x30, x17, w20, uxtw  // guest 0xd6966, sampled 0
6c50fa1688:    	ldapr	w20, [x30]  // guest 0xd6966, sampled 0
6c50fa168c:    	str	w20, [x19]  // guest 0xd6966, sampled 13
6c50fa1690:    	and	w20, w20, #0x4  // guest 0xd6969, sampled 0
6c50fa1694:    	str	w20, [x19, #0x28]  // guest 0xd6969, sampled 0
6c50fa1698:    	ldr	w21, [x19, #0x4]  // guest 0xd696b, sampled 0
6c50fa169c:    	str	w21, [x19, #0xc]  // guest 0xd696b, sampled 0
6c50fa16a0:    	mov	w21, #0x1               // =1  // guest 0xd696b, sampled 0
6c50fa16a4:    	sturb	w21, [x19, #-0xc]  // guest 0xd696b, sampled 0
6c50fa16a8:    	mov	w21, #0x18              // =24  // guest 0xd696d, sampled 0
6c50fa16ac:    	str	w21, [x19, #0x34]  // guest 0xd696d, sampled 0
6c50fa16b0:    	cbz	w20, 0x6c50fa16d0 <trace+0x110>  // guest 0xd696d, sampled 0
6c50fa16b4:    	b	0x6c50fa16b4 <trace+0xf4>  // guest 0xd696d, sampled 0
6c50fa16b8:    	br	x16  // guest 0xd696d, sampled 0
6c50fa16bc:    	mov	w20, #0x696f            // =26991  // guest 0xd696d, sampled 0
6c50fa16c0:    	movk	w20, #0xd, lsl #16  // guest 0xd696d, sampled 0
6c50fa16c4:    	str	w20, [x19, #0x20]  // guest 0xd696d, sampled 0
6c50fa16c8:    	adr	x0, 0x6c50fa1501 <trace+0xffffffffffffff41>  // guest 0xd696d, sampled 0
6c50fa16cc:    	b	0x6c4ae5d02c <trace+0xfffffffff9ebba6c>  // guest 0xd696d, sampled 0
6c50fa16d0:    	b	0x6c50fa16d0 <trace+0x110>  // guest 0xd696d, sampled 0
6c50fa16d4:    	br	x16  // guest 0xd696d, sampled 0
6c50fa16d8:    	mov	w20, #0x697d            // =27005  // guest 0xd696d, sampled 0
6c50fa16dc:    	movk	w20, #0xd, lsl #16  // guest 0xd696d, sampled 0
6c50fa16e0:    	str	w20, [x19, #0x20]  // guest 0xd696d, sampled 0
6c50fa16e4:    	adr	x0, 0x6c50fa1500 <trace+0xffffffffffffff40>  // guest 0xd696d, sampled 0
6c50fa16e8:    	b	0x6c4ae5d02c <trace+0xfffffffff9ebba6c>  // guest 0xd696d, sampled 0
6c50fa16ec:    	adr	x0, 0x6c50fa1503 <trace+0xffffffffffffff43>  // guest 0xd696d, sampled 0
6c50fa16f0:    	b	0x6c4ae5d02c <trace+0xfffffffff9ebba6c>  // guest 0xd696d, sampled 0
6c50fa16f4:    	mov	w1, w21
6c50fa16f8:    	mov	w2, w22
6c50fa16fc:    	mov	x0, x19
6c50fa1700:    	mov	w3, #0x4045             // =16453
6c50fa1704:    	movk	w3, #0x1, lsl #16
6c50fa1708:    	adr	x4, 0x6c50fa1600 <trace+0x40>
6c50fa170c:    	adrp	x16, 0x6c97724000 <trace+0x46783000>
6c50fa1710:    	add	x16, x16, #0xb68
6c50fa1714:    	blr	x16
6c50fa1718:    	dmb	ishld
6c50fa171c:    	b	0x6c50fa1600 <trace+0x40>
6c50fa1720:    	mov	w1, w21
6c50fa1724:    	mov	w2, w22
6c50fa1728:    	mov	x0, x19
6c50fa172c:    	mov	w3, #0x4045             // =16453
6c50fa1730:    	movk	w3, #0x1, lsl #16
6c50fa1734:    	adr	x4, 0x6c50fa1634 <trace+0x74>
6c50fa1738:    	adrp	x16, 0x6c97724000 <trace+0x46783000>
6c50fa173c:    	add	x16, x16, #0xb68
6c50fa1740:    	blr	x16
6c50fa1744:    	dmb	ishld
6c50fa1748:    	b	0x6c50fa1634 <trace+0x74>
6c50fa174c:    	mov	w1, w20
6c50fa1750:    	mov	x0, x19
6c50fa1754:    	mov	w2, #0x4045             // =16453
6c50fa1758:    	movk	w2, #0x1, lsl #16
6c50fa175c:    	adr	x3, 0x6c50fa1660 <trace+0xa0>
6c50fa1760:    	adrp	x16, 0x6c97723000 <trace+0x46782000>
6c50fa1764:    	add	x16, x16, #0xf88
6c50fa1768:    	blr	x16
6c50fa176c:    	mov	w20, w0
6c50fa1770:    	dmb	ishld
6c50fa1774:    	b	0x6c50fa1660 <trace+0xa0>
6c50fa1778:    	mov	w1, w20
6c50fa177c:    	mov	x0, x19
6c50fa1780:    	mov	w2, #0x4045             // =16453
6c50fa1784:    	movk	w2, #0x1, lsl #16
6c50fa1788:    	adr	x3, 0x6c50fa168c <trace+0xcc>
6c50fa178c:    	adrp	x16, 0x6c97723000 <trace+0x46782000>
6c50fa1790:    	add	x16, x16, #0xf88
6c50fa1794:    	blr	x16
6c50fa1798:    	mov	w20, w0
6c50fa179c:    	dmb	ishld
6c50fa17a0:    	b	0x6c50fa168c <trace+0xcc>