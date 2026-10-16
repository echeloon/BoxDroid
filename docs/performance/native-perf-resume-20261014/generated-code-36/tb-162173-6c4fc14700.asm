
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-162173-6c4fc14700.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006c4fc14700 <trace>:
6c4fc14700:    	ldur	w20, [x19, #-0x10]  // guest 0x162173, sampled 0
6c4fc14704:    	tbnz	w20, #0x1f, 0x6c4fc14a1c <trace+0x31c>  // guest 0x162173, sampled 0
6c4fc14708:    	sturb	wzr, [x19, #-0xc]  // guest 0x162173, sampled 0
6c4fc1470c:    	ldr	w20, [x19, #0x10]  // guest 0x162173, sampled 0
6c4fc14710:    	add	w21, w20, #0x500  // guest 0x162173, sampled 0
6c4fc14714:    	str	w21, [x19, #0x4]  // guest 0x162173, sampled 0
6c4fc14718:    	ldr	w22, [x19, #0x18]  // guest 0x16217a, sampled 0
6c4fc1471c:    	add	w22, w22, #0x4a0  // guest 0x16217a, sampled 0
6c4fc14720:    	str	w22, [x19, #0x18]  // guest 0x16217a, sampled 0
6c4fc14724:    	str	w22, [x19, #0x28]  // guest 0x16217a, sampled 0
6c4fc14728:    	mov	w23, #0x4a0             // =1184  // guest 0x16217a, sampled 0
6c4fc1472c:    	str	w23, [x19, #0x2c]  // guest 0x16217a, sampled 0
6c4fc14730:    	add	w23, w20, #0x1c  // guest 0x162180, sampled 0
6c4fc14734:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x162180, sampled 0
6c4fc14738:    	and	x16, x16, x23, lsr #7  // guest 0x162180, sampled 0
6c4fc1473c:    	add	x17, x17, x16  // guest 0x162180, sampled 0
6c4fc14740:    	ldp	x17, x16, [x17, #0x8]  // guest 0x162180, sampled 0
6c4fc14744:    	and	w30, w23, #0xfffff003  // guest 0x162180, sampled 0
6c4fc14748:    	cmp	w16, w30  // guest 0x162180, sampled 0
6c4fc1474c:    	b.ne	0x6c4fc14a24 <trace+0x324>  // guest 0x162180, sampled 0
6c4fc14750:    	add	x30, x17, w23, uxtw  // guest 0x162180, sampled 0
6c4fc14754:    	stlr	w21, [x30]  // guest 0x162180, sampled 0
6c4fc14758:    	add	w23, w20, #0x18  // guest 0x162184, sampled 0
6c4fc1475c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x162184, sampled 0
6c4fc14760:    	and	x16, x16, x23, lsr #7  // guest 0x162184, sampled 0
6c4fc14764:    	add	x17, x17, x16  // guest 0x162184, sampled 0
6c4fc14768:    	ldp	x17, x16, [x17, #0x8]  // guest 0x162184, sampled 0
6c4fc1476c:    	and	w30, w23, #0xfffff003  // guest 0x162184, sampled 0
6c4fc14770:    	cmp	w16, w30  // guest 0x162184, sampled 0
6c4fc14774:    	b.ne	0x6c4fc14a50 <trace+0x350>  // guest 0x162184, sampled 0
6c4fc14778:    	add	x30, x17, w23, uxtw  // guest 0x162184, sampled 0
6c4fc1477c:    	stlr	w22, [x30]  // guest 0x162184, sampled 0
6c4fc14780:    	sub	w20, w20, #0x4  // guest 0x162188, sampled 0
6c4fc14784:    	mov	w23, w20  // guest 0x162188, sampled 0
6c4fc14788:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x162188, sampled 0
6c4fc1478c:    	and	x16, x16, x23, lsr #7  // guest 0x162188, sampled 0
6c4fc14790:    	add	x17, x17, x16  // guest 0x162188, sampled 0
6c4fc14794:    	ldp	x17, x16, [x17, #0x8]  // guest 0x162188, sampled 0
6c4fc14798:    	and	w30, w23, #0xfffff003  // guest 0x162188, sampled 0
6c4fc1479c:    	cmp	w16, w30  // guest 0x162188, sampled 0
6c4fc147a0:    	b.ne	0x6c4fc14a7c <trace+0x37c>  // guest 0x162188, sampled 0
6c4fc147a4:    	add	x30, x17, w23, uxtw  // guest 0x162188, sampled 0
6c4fc147a8:    	stlr	w21, [x30]  // guest 0x162188, sampled 0
6c4fc147ac:    	str	w20, [x19, #0x10]  // guest 0x162188, sampled 0
6c4fc147b0:    	sub	w20, w20, #0x4  // guest 0x162189, sampled 0
6c4fc147b4:    	mov	w21, w20  // guest 0x162189, sampled 0
6c4fc147b8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x162189, sampled 0
6c4fc147bc:    	and	x16, x16, x21, lsr #7  // guest 0x162189, sampled 0
6c4fc147c0:    	add	x17, x17, x16  // guest 0x162189, sampled 0
6c4fc147c4:    	ldp	x17, x16, [x17, #0x8]  // guest 0x162189, sampled 0
6c4fc147c8:    	and	w30, w21, #0xfffff003  // guest 0x162189, sampled 0
6c4fc147cc:    	cmp	w16, w30  // guest 0x162189, sampled 0
6c4fc147d0:    	b.ne	0x6c4fc14aa8 <trace+0x3a8>  // guest 0x162189, sampled 0
6c4fc147d4:    	add	x30, x17, w21, uxtw  // guest 0x162189, sampled 0
6c4fc147d8:    	stlr	w22, [x30]  // guest 0x162189, sampled 0
6c4fc147dc:    	str	w20, [x19, #0x10]  // guest 0x162189, sampled 0
6c4fc147e0:    	sub	w20, w20, #0x4  // guest 0x16218a, sampled 0
6c4fc147e4:    	mov	w21, w20  // guest 0x16218a, sampled 0
6c4fc147e8:    	ldr	w22, [x19, #0x1c]  // guest 0x16218a, sampled 0
6c4fc147ec:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x16218a, sampled 0
6c4fc147f0:    	and	x16, x16, x21, lsr #7  // guest 0x16218a, sampled 0
6c4fc147f4:    	add	x17, x17, x16  // guest 0x16218a, sampled 0
6c4fc147f8:    	ldp	x17, x16, [x17, #0x8]  // guest 0x16218a, sampled 0
6c4fc147fc:    	and	w30, w21, #0xfffff003  // guest 0x16218a, sampled 0
6c4fc14800:    	cmp	w16, w30  // guest 0x16218a, sampled 0
6c4fc14804:    	b.ne	0x6c4fc14ad4 <trace+0x3d4>  // guest 0x16218a, sampled 0
6c4fc14808:    	add	x30, x17, w21, uxtw  // guest 0x16218a, sampled 0
6c4fc1480c:    	stlr	w22, [x30]  // guest 0x16218a, sampled 0
6c4fc14810:    	str	w20, [x19, #0x10]  // guest 0x16218a, sampled 0
6c4fc14814:    	sub	w20, w20, #0x4  // guest 0x16218b, sampled 0
6c4fc14818:    	mov	w21, w20  // guest 0x16218b, sampled 0
6c4fc1481c:    	ldr	w22, [x19, #0xc]  // guest 0x16218b, sampled 0
6c4fc14820:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x16218b, sampled 0
6c4fc14824:    	and	x16, x16, x21, lsr #7  // guest 0x16218b, sampled 0
6c4fc14828:    	add	x17, x17, x16  // guest 0x16218b, sampled 0
6c4fc1482c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x16218b, sampled 0
6c4fc14830:    	and	w30, w21, #0xfffff003  // guest 0x16218b, sampled 0
6c4fc14834:    	cmp	w16, w30  // guest 0x16218b, sampled 0
6c4fc14838:    	b.ne	0x6c4fc14b00 <trace+0x400>  // guest 0x16218b, sampled 0
6c4fc1483c:    	add	x30, x17, w21, uxtw  // guest 0x16218b, sampled 0
6c4fc14840:    	stlr	w22, [x30]  // guest 0x16218b, sampled 0
6c4fc14844:    	str	w20, [x19, #0x10]  // guest 0x16218b, sampled 0
6c4fc14848:    	mov	w21, #0xab0             // =2736  // guest 0x16218c, sampled 0
6c4fc1484c:    	str	w21, [x19, #0x4]  // guest 0x16218c, sampled 0
6c4fc14850:    	add	w21, w20, #0x2c  // guest 0x162191, sampled 0
6c4fc14854:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x162191, sampled 0
6c4fc14858:    	and	x16, x16, x21, lsr #7  // guest 0x162191, sampled 0
6c4fc1485c:    	add	x17, x17, x16  // guest 0x162191, sampled 0
6c4fc14860:    	ldp	x16, x17, [x17]  // guest 0x162191, sampled 0
6c4fc14864:    	and	w30, w21, #0xfffff003  // guest 0x162191, sampled 0
6c4fc14868:    	cmp	w16, w30  // guest 0x162191, sampled 0
6c4fc1486c:    	b.ne	0x6c4fc14b2c <trace+0x42c>  // guest 0x162191, sampled 0
6c4fc14870:    	add	x30, x17, w21, uxtw  // guest 0x162191, sampled 0
6c4fc14874:    	ldapr	w21, [x30]  // guest 0x162191, sampled 0
6c4fc14878:    	str	w21, [x19, #0x18]  // guest 0x162191, sampled 0
6c4fc1487c:    	add	w20, w20, #0x28  // guest 0x162195, sampled 0
6c4fc14880:    	str	w20, [sp, #0x80]  // guest 0x162195, sampled 0
6c4fc14884:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x162195, sampled 0
6c4fc14888:    	and	x16, x16, x20, lsr #7  // guest 0x162195, sampled 0
6c4fc1488c:    	add	x17, x17, x16  // guest 0x162195, sampled 0
6c4fc14890:    	ldp	x16, x17, [x17]  // guest 0x162195, sampled 0
6c4fc14894:    	and	w30, w20, #0xfffff003  // guest 0x162195, sampled 0
6c4fc14898:    	cmp	w16, w30  // guest 0x162195, sampled 0
6c4fc1489c:    	b.ne	0x6c4fc14b58 <trace+0x458>  // guest 0x162195, sampled 0
6c4fc148a0:    	add	x30, x17, w20, uxtw  // guest 0x162195, sampled 0
6c4fc148a4:    	ldapr	w20, [x30]  // guest 0x162195, sampled 0
6c4fc148a8:    	str	w20, [x19, #0x1c]  // guest 0x162195, sampled 1
6c4fc148ac:    	mov	w20, #0x2ac             // =684  // guest 0x16219b, sampled 0
6c4fc148b0:    	str	w20, [x19, #0x4]  // guest 0x16219b, sampled 0
6c4fc148b4:    	str	wzr, [sp, #0x84]  // guest 0x16219e, sampled 0
6c4fc148b8:    	str	wzr, [x19, #0xc]  // guest 0x16219e, sampled 0
6c4fc148bc:    	str	wzr, [x19, #0x28]  // guest 0x16219e, sampled 0
6c4fc148c0:    	mov	w20, #0x1               // =1  // guest 0x16219e, sampled 0
6c4fc148c4:    	sturb	w20, [x19, #-0xc]  // guest 0x16219e, sampled 0
6c4fc148c8:    	ldr	w20, [x19, #0x38]  // guest 0x1621a1, sampled 0
6c4fc148cc:    	lsl	w20, w20, #2  // guest 0x1621a1, sampled 0
6c4fc148d0:    	str	w20, [sp, #0x88]  // guest 0x1621a1, sampled 0
6c4fc148d4:    	mov	w20, #0x1a              // =26  // guest 0x1621a1, sampled 0
6c4fc148d8:    	str	w20, [x19, #0x34]  // guest 0x1621a1, sampled 0
6c4fc148dc:    	mov	w20, #0x2ab             // =683  // guest 0x1621a1, sampled 0
6c4fc148e0:    	str	w20, [sp, #0x8c]  // guest 0x1621a1, sampled 0
6c4fc148e4:    	ldr	w20, [x19, #0x18]  // guest 0x1621a1, sampled 2
6c4fc148e8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x1621a1, sampled 1
6c4fc148ec:    	and	x16, x16, x20, lsr #7  // guest 0x1621a1, sampled 0
6c4fc148f0:    	add	x17, x17, x16  // guest 0x1621a1, sampled 2
6c4fc148f4:    	ldp	x16, x17, [x17]  // guest 0x1621a1, sampled 0
6c4fc148f8:    	and	w30, w20, #0xfffff003  // guest 0x1621a1, sampled 10
6c4fc148fc:    	cmp	w16, w30  // guest 0x1621a1, sampled 0
6c4fc14900:    	b.ne	0x6c4fc14b84 <trace+0x484>  // guest 0x1621a1, sampled 0
6c4fc14904:    	add	x30, x17, w20, uxtw  // guest 0x1621a1, sampled 3
6c4fc14908:    	ldapr	w21, [x30]  // guest 0x1621a1, sampled 0
6c4fc1490c:    	str	w21, [sp, #0x84]  // guest 0x1621a1, sampled 9
6c4fc14910:    	ldr	w22, [x19, #0x1c]  // guest 0x1621a1, sampled 0
6c4fc14914:    	str	w22, [sp, #0x80]  // guest 0x1621a1, sampled 0
6c4fc14918:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x1621a1, sampled 0
6c4fc1491c:    	and	x16, x16, x22, lsr #7  // guest 0x1621a1, sampled 0
6c4fc14920:    	add	x17, x17, x16  // guest 0x1621a1, sampled 0
6c4fc14924:    	ldp	x17, x16, [x17, #0x8]  // guest 0x1621a1, sampled 0
6c4fc14928:    	and	w30, w22, #0xfffff003  // guest 0x1621a1, sampled 0
6c4fc1492c:    	cmp	w16, w30  // guest 0x1621a1, sampled 0
6c4fc14930:    	b.ne	0x6c4fc14bb0 <trace+0x4b0>  // guest 0x1621a1, sampled 0
6c4fc14934:    	add	x30, x17, w22, uxtw  // guest 0x1621a1, sampled 0
6c4fc14938:    	stlr	w21, [x30]  // guest 0x1621a1, sampled 0
6c4fc1493c:    	ldr	w21, [sp, #0x88]  // guest 0x1621a1, sampled 1
6c4fc14940:    	add	w20, w20, w21  // guest 0x1621a1, sampled 0
6c4fc14944:    	str	w20, [x19, #0x18]  // guest 0x1621a1, sampled 0
6c4fc14948:    	add	w20, w22, w21  // guest 0x1621a1, sampled 0
6c4fc1494c:    	str	w20, [x19, #0x1c]  // guest 0x1621a1, sampled 0
6c4fc14950:    	ldr	w20, [sp, #0x8c]  // guest 0x1621a1, sampled 0
6c4fc14954:    	str	w20, [x19, #0x4]  // guest 0x1621a1, sampled 1
6c4fc14958:    	sub	w20, w20, #0x1  // guest 0x1621a1, sampled 0
6c4fc1495c:    	str	w20, [sp, #0x8c]  // guest 0x1621a1, sampled 0
6c4fc14960:    	tst	w20, #0xffff  // guest 0x1621a1, sampled 0
6c4fc14964:    	b.ne	0x6c4fc148e4 <trace+0x1e4>  // guest 0x1621a1, sampled 0
6c4fc14968:    	cbz	w20, 0x6c4fc14994 <trace+0x294>  // guest 0x1621a1, sampled 0
6c4fc1496c:    	ldr	w20, [x19, #0x24]  // guest 0x1621a1, sampled 0
6c4fc14970:    	orr	w20, w20, #0x10000  // guest 0x1621a1, sampled 0
6c4fc14974:    	str	w20, [x19, #0x24]  // guest 0x1621a1, sampled 0
6c4fc14978:    	b	0x6c4fc14978 <trace+0x278>  // guest 0x1621a1, sampled 0
6c4fc1497c:    	br	x16  // guest 0x1621a1, sampled 0
6c4fc14980:    	mov	w20, #0x21a1            // =8609  // guest 0x1621a1, sampled 0
6c4fc14984:    	movk	w20, #0x16, lsl #16  // guest 0x1621a1, sampled 0
6c4fc14988:    	str	w20, [x19, #0x20]  // guest 0x1621a1, sampled 0
6c4fc1498c:    	adr	x0, 0x6c4fc14640 <trace+0xffffffffffffff40>  // guest 0x1621a1, sampled 0
6c4fc14990:    	b	0x6c4ae5d02c <trace+0xfffffffffb24892c>  // guest 0x1621a1, sampled 0
6c4fc14994:    	ldr	w20, [x19, #0x18]  // guest 0x1621a1, sampled 0
6c4fc14998:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x1621a1, sampled 1
6c4fc1499c:    	and	x16, x16, x20, lsr #7  // guest 0x1621a1, sampled 0
6c4fc149a0:    	add	x17, x17, x16  // guest 0x1621a1, sampled 0
6c4fc149a4:    	ldp	x16, x17, [x17]  // guest 0x1621a1, sampled 0
6c4fc149a8:    	and	w30, w20, #0xfffff003  // guest 0x1621a1, sampled 0
6c4fc149ac:    	cmp	w16, w30  // guest 0x1621a1, sampled 0
6c4fc149b0:    	b.ne	0x6c4fc14bdc <trace+0x4dc>  // guest 0x1621a1, sampled 0
6c4fc149b4:    	add	x30, x17, w20, uxtw  // guest 0x1621a1, sampled 0
6c4fc149b8:    	ldapr	w21, [x30]  // guest 0x1621a1, sampled 0
6c4fc149bc:    	ldr	w22, [x19, #0x1c]  // guest 0x1621a1, sampled 0
6c4fc149c0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x1621a1, sampled 0
6c4fc149c4:    	and	x16, x16, x22, lsr #7  // guest 0x1621a1, sampled 0
6c4fc149c8:    	add	x17, x17, x16  // guest 0x1621a1, sampled 0
6c4fc149cc:    	ldp	x17, x16, [x17, #0x8]  // guest 0x1621a1, sampled 0
6c4fc149d0:    	and	w30, w22, #0xfffff003  // guest 0x1621a1, sampled 0
6c4fc149d4:    	cmp	w16, w30  // guest 0x1621a1, sampled 0
6c4fc149d8:    	b.ne	0x6c4fc14c08 <trace+0x508>  // guest 0x1621a1, sampled 0
6c4fc149dc:    	add	x30, x17, w22, uxtw  // guest 0x1621a1, sampled 0
6c4fc149e0:    	stlr	w21, [x30]  // guest 0x1621a1, sampled 0
6c4fc149e4:    	ldr	w21, [sp, #0x88]  // guest 0x1621a1, sampled 0
6c4fc149e8:    	add	w20, w20, w21  // guest 0x1621a1, sampled 0
6c4fc149ec:    	str	w20, [x19, #0x18]  // guest 0x1621a1, sampled 0
6c4fc149f0:    	add	w20, w22, w21  // guest 0x1621a1, sampled 0
6c4fc149f4:    	str	w20, [x19, #0x1c]  // guest 0x1621a1, sampled 0
6c4fc149f8:    	ldr	w20, [sp, #0x8c]  // guest 0x1621a1, sampled 0
6c4fc149fc:    	str	w20, [x19, #0x4]  // guest 0x1621a1, sampled 0
6c4fc14a00:    	b	0x6c4fc14a00 <trace+0x300>  // guest 0x1621a1, sampled 0
6c4fc14a04:    	br	x16  // guest 0x1621a1, sampled 0
6c4fc14a08:    	mov	w20, #0x21a3            // =8611  // guest 0x1621a1, sampled 0
6c4fc14a0c:    	movk	w20, #0x16, lsl #16  // guest 0x1621a1, sampled 0
6c4fc14a10:    	str	w20, [x19, #0x20]  // guest 0x1621a1, sampled 0
6c4fc14a14:    	adr	x0, 0x6c4fc14641 <trace+0xffffffffffffff41>  // guest 0x1621a1, sampled 0
6c4fc14a18:    	b	0x6c4ae5d02c <trace+0xfffffffffb24892c>  // guest 0x1621a1, sampled 0
6c4fc14a1c:    	adr	x0, 0x6c4fc14643 <trace+0xffffffffffffff43>  // guest 0x1621a1, sampled 0
6c4fc14a20:    	b	0x6c4ae5d02c <trace+0xfffffffffb24892c>  // guest 0x1621a1, sampled 0
6c4fc14a24:    	mov	w1, w23
6c4fc14a28:    	mov	w2, w21
6c4fc14a2c:    	mov	x0, x19
6c4fc14a30:    	mov	w3, #0x4045             // =16453
6c4fc14a34:    	movk	w3, #0x1, lsl #16
6c4fc14a38:    	adr	x4, 0x6c4fc14758 <trace+0x58>
6c4fc14a3c:    	adrp	x16, 0x6c97724000 <trace+0x47b10000>
6c4fc14a40:    	add	x16, x16, #0xb68
6c4fc14a44:    	blr	x16
6c4fc14a48:    	dmb	ishld
6c4fc14a4c:    	b	0x6c4fc14758 <trace+0x58>
6c4fc14a50:    	mov	w1, w23
6c4fc14a54:    	mov	w2, w22
6c4fc14a58:    	mov	x0, x19
6c4fc14a5c:    	mov	w3, #0x4045             // =16453
6c4fc14a60:    	movk	w3, #0x1, lsl #16
6c4fc14a64:    	adr	x4, 0x6c4fc14780 <trace+0x80>
6c4fc14a68:    	adrp	x16, 0x6c97724000 <trace+0x47b10000>
6c4fc14a6c:    	add	x16, x16, #0xb68
6c4fc14a70:    	blr	x16
6c4fc14a74:    	dmb	ishld
6c4fc14a78:    	b	0x6c4fc14780 <trace+0x80>
6c4fc14a7c:    	mov	w1, w23
6c4fc14a80:    	mov	w2, w21
6c4fc14a84:    	mov	x0, x19
6c4fc14a88:    	mov	w3, #0x4045             // =16453
6c4fc14a8c:    	movk	w3, #0x1, lsl #16
6c4fc14a90:    	adr	x4, 0x6c4fc147ac <trace+0xac>
6c4fc14a94:    	adrp	x16, 0x6c97724000 <trace+0x47b10000>
6c4fc14a98:    	add	x16, x16, #0xb68
6c4fc14a9c:    	blr	x16
6c4fc14aa0:    	dmb	ishld
6c4fc14aa4:    	b	0x6c4fc147ac <trace+0xac>
6c4fc14aa8:    	mov	w1, w21
6c4fc14aac:    	mov	w2, w22
6c4fc14ab0:    	mov	x0, x19
6c4fc14ab4:    	mov	w3, #0x4045             // =16453
6c4fc14ab8:    	movk	w3, #0x1, lsl #16
6c4fc14abc:    	adr	x4, 0x6c4fc147dc <trace+0xdc>
6c4fc14ac0:    	adrp	x16, 0x6c97724000 <trace+0x47b10000>
6c4fc14ac4:    	add	x16, x16, #0xb68
6c4fc14ac8:    	blr	x16
6c4fc14acc:    	dmb	ishld
6c4fc14ad0:    	b	0x6c4fc147dc <trace+0xdc>
6c4fc14ad4:    	mov	w1, w21
6c4fc14ad8:    	mov	w2, w22
6c4fc14adc:    	mov	x0, x19
6c4fc14ae0:    	mov	w3, #0x4045             // =16453
6c4fc14ae4:    	movk	w3, #0x1, lsl #16
6c4fc14ae8:    	adr	x4, 0x6c4fc14810 <trace+0x110>
6c4fc14aec:    	adrp	x16, 0x6c97724000 <trace+0x47b10000>
6c4fc14af0:    	add	x16, x16, #0xb68
6c4fc14af4:    	blr	x16
6c4fc14af8:    	dmb	ishld
6c4fc14afc:    	b	0x6c4fc14810 <trace+0x110>
6c4fc14b00:    	mov	w1, w21
6c4fc14b04:    	mov	w2, w22
6c4fc14b08:    	mov	x0, x19
6c4fc14b0c:    	mov	w3, #0x4045             // =16453
6c4fc14b10:    	movk	w3, #0x1, lsl #16
6c4fc14b14:    	adr	x4, 0x6c4fc14844 <trace+0x144>
6c4fc14b18:    	adrp	x16, 0x6c97724000 <trace+0x47b10000>
6c4fc14b1c:    	add	x16, x16, #0xb68
6c4fc14b20:    	blr	x16
6c4fc14b24:    	dmb	ishld
6c4fc14b28:    	b	0x6c4fc14844 <trace+0x144>
6c4fc14b2c:    	mov	w1, w21
6c4fc14b30:    	mov	x0, x19
6c4fc14b34:    	mov	w2, #0x4045             // =16453
6c4fc14b38:    	movk	w2, #0x1, lsl #16
6c4fc14b3c:    	adr	x3, 0x6c4fc14878 <trace+0x178>
6c4fc14b40:    	adrp	x16, 0x6c97723000 <trace+0x47b0f000>
6c4fc14b44:    	add	x16, x16, #0xf88
6c4fc14b48:    	blr	x16
6c4fc14b4c:    	mov	w21, w0
6c4fc14b50:    	dmb	ishld
6c4fc14b54:    	b	0x6c4fc14878 <trace+0x178>
6c4fc14b58:    	mov	w1, w20
6c4fc14b5c:    	mov	x0, x19
6c4fc14b60:    	mov	w2, #0x4045             // =16453
6c4fc14b64:    	movk	w2, #0x1, lsl #16
6c4fc14b68:    	adr	x3, 0x6c4fc148a8 <trace+0x1a8>
6c4fc14b6c:    	adrp	x16, 0x6c97723000 <trace+0x47b0f000>
6c4fc14b70:    	add	x16, x16, #0xf88
6c4fc14b74:    	blr	x16
6c4fc14b78:    	mov	w20, w0
6c4fc14b7c:    	dmb	ishld
6c4fc14b80:    	b	0x6c4fc148a8 <trace+0x1a8>
6c4fc14b84:    	mov	w1, w20
6c4fc14b88:    	mov	x0, x19
6c4fc14b8c:    	mov	w2, #0x4045             // =16453
6c4fc14b90:    	movk	w2, #0x1, lsl #16
6c4fc14b94:    	adr	x3, 0x6c4fc1490c <trace+0x20c>
6c4fc14b98:    	adrp	x16, 0x6c97723000 <trace+0x47b0f000>
6c4fc14b9c:    	add	x16, x16, #0xf88
6c4fc14ba0:    	blr	x16
6c4fc14ba4:    	mov	w21, w0
6c4fc14ba8:    	dmb	ishld
6c4fc14bac:    	b	0x6c4fc1490c <trace+0x20c>
6c4fc14bb0:    	mov	w1, w22
6c4fc14bb4:    	mov	w2, w21
6c4fc14bb8:    	mov	x0, x19
6c4fc14bbc:    	mov	w3, #0x4045             // =16453
6c4fc14bc0:    	movk	w3, #0x1, lsl #16
6c4fc14bc4:    	adr	x4, 0x6c4fc1493c <trace+0x23c>
6c4fc14bc8:    	adrp	x16, 0x6c97724000 <trace+0x47b10000>
6c4fc14bcc:    	add	x16, x16, #0xb68
6c4fc14bd0:    	blr	x16
6c4fc14bd4:    	dmb	ishld
6c4fc14bd8:    	b	0x6c4fc1493c <trace+0x23c>
6c4fc14bdc:    	mov	w1, w20
6c4fc14be0:    	mov	x0, x19
6c4fc14be4:    	mov	w2, #0x4045             // =16453
6c4fc14be8:    	movk	w2, #0x1, lsl #16
6c4fc14bec:    	adr	x3, 0x6c4fc149bc <trace+0x2bc>
6c4fc14bf0:    	adrp	x16, 0x6c97723000 <trace+0x47b0f000>
6c4fc14bf4:    	add	x16, x16, #0xf88
6c4fc14bf8:    	blr	x16
6c4fc14bfc:    	mov	w21, w0
6c4fc14c00:    	dmb	ishld
6c4fc14c04:    	b	0x6c4fc149bc <trace+0x2bc>
6c4fc14c08:    	mov	w1, w22
6c4fc14c0c:    	mov	w2, w21
6c4fc14c10:    	mov	x0, x19
6c4fc14c14:    	mov	w3, #0x4045             // =16453
6c4fc14c18:    	movk	w3, #0x1, lsl #16
6c4fc14c1c:    	adr	x4, 0x6c4fc149e4 <trace+0x2e4>
6c4fc14c20:    	adrp	x16, 0x6c97724000 <trace+0x47b10000>
6c4fc14c24:    	add	x16, x16, #0xb68
6c4fc14c28:    	blr	x16
6c4fc14c2c:    	dmb	ishld
6c4fc14c30:    	b	0x6c4fc149e4 <trace+0x2e4>