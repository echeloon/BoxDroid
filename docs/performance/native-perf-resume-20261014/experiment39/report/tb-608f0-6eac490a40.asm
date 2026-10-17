
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-608f0-6eac490a40.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006eac490a40 <trace>:
6eac490a40:    	ldur	w20, [x19, #-0x10]  // guest 0x608f0, sampled 0
6eac490a44:    	tbnz	w20, #0x1f, 0x6eac491600 <trace+0xbc0>  // guest 0x608f0, sampled 0
6eac490a48:    	sturb	wzr, [x19, #-0xc]  // guest 0x608f0, sampled 0
6eac490a4c:    	ldr	w20, [x19, #0x10]  // guest 0x608f0, sampled 0
6eac490a50:    	sub	w20, w20, #0x44  // guest 0x608f0, sampled 0
6eac490a54:    	str	w20, [x19, #0x10]  // guest 0x608f0, sampled 0
6eac490a58:    	str	w20, [x19, #0x28]  // guest 0x608f0, sampled 0
6eac490a5c:    	mov	w21, #0x44              // =68  // guest 0x608f0, sampled 0
6eac490a60:    	str	w21, [x19, #0x2c]  // guest 0x608f0, sampled 0
6eac490a64:    	sub	w20, w20, #0x4  // guest 0x608f3, sampled 0
6eac490a68:    	mov	w21, w20  // guest 0x608f3, sampled 0
6eac490a6c:    	ldr	w22, [x19, #0x18]  // guest 0x608f3, sampled 0
6eac490a70:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x608f3, sampled 0
6eac490a74:    	and	x16, x16, x21, lsr #7  // guest 0x608f3, sampled 0
6eac490a78:    	add	x17, x17, x16  // guest 0x608f3, sampled 0
6eac490a7c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x608f3, sampled 0
6eac490a80:    	and	w30, w21, #0xfffff003  // guest 0x608f3, sampled 0
6eac490a84:    	cmp	w16, w30  // guest 0x608f3, sampled 0
6eac490a88:    	b.ne	0x6eac491608 <trace+0xbc8>  // guest 0x608f3, sampled 0
6eac490a8c:    	add	x30, x17, w21, uxtw  // guest 0x608f3, sampled 0
6eac490a90:    	stlr	w22, [x30]  // guest 0x608f3, sampled 0
6eac490a94:    	str	w20, [x19, #0x10]  // guest 0x608f3, sampled 0
6eac490a98:    	sub	w20, w20, #0x4  // guest 0x608f4, sampled 0
6eac490a9c:    	mov	w21, w20  // guest 0x608f4, sampled 0
6eac490aa0:    	ldr	w22, [x19, #0x1c]  // guest 0x608f4, sampled 0
6eac490aa4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x608f4, sampled 0
6eac490aa8:    	and	x16, x16, x21, lsr #7  // guest 0x608f4, sampled 0
6eac490aac:    	add	x17, x17, x16  // guest 0x608f4, sampled 0
6eac490ab0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x608f4, sampled 0
6eac490ab4:    	and	w30, w21, #0xfffff003  // guest 0x608f4, sampled 2
6eac490ab8:    	cmp	w16, w30  // guest 0x608f4, sampled 0
6eac490abc:    	b.ne	0x6eac491634 <trace+0xbf4>  // guest 0x608f4, sampled 0
6eac490ac0:    	add	x30, x17, w21, uxtw  // guest 0x608f4, sampled 0
6eac490ac4:    	stlr	w22, [x30]  // guest 0x608f4, sampled 0
6eac490ac8:    	str	w20, [x19, #0x10]  // guest 0x608f4, sampled 0
6eac490acc:    	add	w21, w20, #0x8  // guest 0x608f5, sampled 0
6eac490ad0:    	ldr	w22, [x19, #0x4]  // guest 0x608f5, sampled 0
6eac490ad4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x608f5, sampled 0
6eac490ad8:    	and	x16, x16, x21, lsr #7  // guest 0x608f5, sampled 0
6eac490adc:    	add	x17, x17, x16  // guest 0x608f5, sampled 0
6eac490ae0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x608f5, sampled 0
6eac490ae4:    	and	w30, w21, #0xfffff003  // guest 0x608f5, sampled 0
6eac490ae8:    	cmp	w16, w30  // guest 0x608f5, sampled 0
6eac490aec:    	b.ne	0x6eac491660 <trace+0xc20>  // guest 0x608f5, sampled 0
6eac490af0:    	add	x30, x17, w21, uxtw  // guest 0x608f5, sampled 0
6eac490af4:    	stlr	w22, [x30]  // guest 0x608f5, sampled 0
6eac490af8:    	add	w21, w20, #0x54  // guest 0x608f9, sampled 0
6eac490afc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x608f9, sampled 0
6eac490b00:    	and	x16, x16, x21, lsr #7  // guest 0x608f9, sampled 0
6eac490b04:    	add	x17, x17, x16  // guest 0x608f9, sampled 0
6eac490b08:    	ldp	x16, x17, [x17]  // guest 0x608f9, sampled 0
6eac490b0c:    	and	w30, w21, #0xfffff003  // guest 0x608f9, sampled 0
6eac490b10:    	cmp	w16, w30  // guest 0x608f9, sampled 0
6eac490b14:    	b.ne	0x6eac49168c <trace+0xc4c>  // guest 0x608f9, sampled 0
6eac490b18:    	add	x30, x17, w21, uxtw  // guest 0x608f9, sampled 0
6eac490b1c:    	ldapr	w21, [x30]  // guest 0x608f9, sampled 0
6eac490b20:    	str	w21, [x19]  // guest 0x608f9, sampled 0
6eac490b24:    	add	w22, w20, #0x8  // guest 0x608fd, sampled 0
6eac490b28:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x608fd, sampled 0
6eac490b2c:    	and	x16, x16, x22, lsr #7  // guest 0x608fd, sampled 0
6eac490b30:    	add	x17, x17, x16  // guest 0x608fd, sampled 0
6eac490b34:    	ldp	x16, x17, [x17]  // guest 0x608fd, sampled 0
6eac490b38:    	and	w30, w22, #0xfffff003  // guest 0x608fd, sampled 0
6eac490b3c:    	cmp	w16, w30  // guest 0x608fd, sampled 0
6eac490b40:    	b.ne	0x6eac4916b8 <trace+0xc78>  // guest 0x608fd, sampled 1
6eac490b44:    	add	x30, x17, w22, uxtw  // guest 0x608fd, sampled 0
6eac490b48:    	ldapr	w22, [x30]  // guest 0x608fd, sampled 0
6eac490b4c:    	str	w22, [x19, #0x4]  // guest 0x608fd, sampled 0
6eac490b50:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60901, sampled 0
6eac490b54:    	and	x16, x16, x21, lsr #7  // guest 0x60901, sampled 0
6eac490b58:    	add	x17, x17, x16  // guest 0x60901, sampled 0
6eac490b5c:    	ldp	x16, x17, [x17]  // guest 0x60901, sampled 0
6eac490b60:    	add	w30, w21, #0xf  // guest 0x60901, sampled 0
6eac490b64:    	and	w30, w30, #0xfffff000  // guest 0x60901, sampled 0
6eac490b68:    	cmp	w16, w30  // guest 0x60901, sampled 0
6eac490b6c:    	b.ne	0x6eac4916e4 <trace+0xca4>  // guest 0x60901, sampled 0
6eac490b70:    	add	x30, x17, w21, uxtw  // guest 0x60901, sampled 0
6eac490b74:    	ldp	x23, x24, [x30]  // guest 0x60901, sampled 0
6eac490b78:    	dmb	ishld  // guest 0x60901, sampled 1
6eac490b7c:    	str	x23, [x19, #0x3b0]  // guest 0x60901, sampled 0
6eac490b80:    	str	x24, [x19, #0x3b8]  // guest 0x60901, sampled 0
6eac490b84:    	add	w23, w21, #0x10  // guest 0x60904, sampled 0
6eac490b88:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60904, sampled 0
6eac490b8c:    	and	x16, x16, x23, lsr #7  // guest 0x60904, sampled 0
6eac490b90:    	add	x17, x17, x16  // guest 0x60904, sampled 0
6eac490b94:    	ldp	x16, x17, [x17]  // guest 0x60904, sampled 0
6eac490b98:    	add	w30, w23, #0xf  // guest 0x60904, sampled 0
6eac490b9c:    	and	w30, w30, #0xfffff000  // guest 0x60904, sampled 0
6eac490ba0:    	cmp	w16, w30  // guest 0x60904, sampled 0
6eac490ba4:    	b.ne	0x6eac491710 <trace+0xcd0>  // guest 0x60904, sampled 0
6eac490ba8:    	add	x30, x17, w23, uxtw  // guest 0x60904, sampled 0
6eac490bac:    	ldp	x23, x24, [x30]  // guest 0x60904, sampled 0
6eac490bb0:    	dmb	ishld  // guest 0x60904, sampled 0
6eac490bb4:    	str	x23, [x19, #0x3f0]  // guest 0x60904, sampled 1
6eac490bb8:    	str	x24, [x19, #0x3f8]  // guest 0x60904, sampled 0
6eac490bbc:    	add	w23, w21, #0x20  // guest 0x60908, sampled 0
6eac490bc0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60908, sampled 0
6eac490bc4:    	and	x16, x16, x23, lsr #7  // guest 0x60908, sampled 0
6eac490bc8:    	add	x17, x17, x16  // guest 0x60908, sampled 0
6eac490bcc:    	ldp	x16, x17, [x17]  // guest 0x60908, sampled 0
6eac490bd0:    	add	w30, w23, #0xf  // guest 0x60908, sampled 0
6eac490bd4:    	and	w30, w30, #0xfffff000  // guest 0x60908, sampled 0
6eac490bd8:    	cmp	w16, w30  // guest 0x60908, sampled 0
6eac490bdc:    	b.ne	0x6eac49173c <trace+0xcfc>  // guest 0x60908, sampled 0
6eac490be0:    	add	x30, x17, w23, uxtw  // guest 0x60908, sampled 0
6eac490be4:    	ldp	x23, x24, [x30]  // guest 0x60908, sampled 0
6eac490be8:    	dmb	ishld  // guest 0x60908, sampled 0
6eac490bec:    	str	x23, [x19, #0x430]  // guest 0x60908, sampled 1
6eac490bf0:    	str	x24, [x19, #0x438]  // guest 0x60908, sampled 0
6eac490bf4:    	add	w21, w21, #0x30  // guest 0x6090c, sampled 0
6eac490bf8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x6090c, sampled 0
6eac490bfc:    	and	x16, x16, x21, lsr #7  // guest 0x6090c, sampled 0
6eac490c00:    	add	x17, x17, x16  // guest 0x6090c, sampled 0
6eac490c04:    	ldp	x16, x17, [x17]  // guest 0x6090c, sampled 0
6eac490c08:    	add	w30, w21, #0xf  // guest 0x6090c, sampled 0
6eac490c0c:    	and	w30, w30, #0xfffff000  // guest 0x6090c, sampled 0
6eac490c10:    	cmp	w16, w30  // guest 0x6090c, sampled 0
6eac490c14:    	b.ne	0x6eac491768 <trace+0xd28>  // guest 0x6090c, sampled 0
6eac490c18:    	add	x30, x17, w21, uxtw  // guest 0x6090c, sampled 0
6eac490c1c:    	ldp	x21, x23, [x30]  // guest 0x6090c, sampled 0
6eac490c20:    	dmb	ishld  // guest 0x6090c, sampled 0
6eac490c24:    	str	x21, [x19, #0x470]  // guest 0x6090c, sampled 0
6eac490c28:    	str	x23, [x19, #0x478]  // guest 0x6090c, sampled 0
6eac490c2c:    	add	w21, w20, #0xc  // guest 0x60910, sampled 0
6eac490c30:    	str	w21, [x19]  // guest 0x60910, sampled 0
6eac490c34:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60914, sampled 0
6eac490c38:    	and	x16, x16, x22, lsr #7  // guest 0x60914, sampled 0
6eac490c3c:    	add	x17, x17, x16  // guest 0x60914, sampled 0
6eac490c40:    	ldp	x16, x17, [x17]  // guest 0x60914, sampled 0
6eac490c44:    	and	w30, w22, #0xfffff003  // guest 0x60914, sampled 1
6eac490c48:    	cmp	w16, w30  // guest 0x60914, sampled 0
6eac490c4c:    	b.ne	0x6eac491794 <trace+0xd54>  // guest 0x60914, sampled 0
6eac490c50:    	add	x30, x17, w22, uxtw  // guest 0x60914, sampled 0
6eac490c54:    	ldapr	w23, [x30]  // guest 0x60914, sampled 0
6eac490c58:    	movi	v0.16b, #0x0  // guest 0x60914, sampled 0
6eac490c5c:    	str	q0, [x19, #0x2b0]  // guest 0x60914, sampled 0
6eac490c60:    	add	x24, x19, #0x2b0  // guest 0x60914, sampled 0
6eac490c64:    	str	w23, [x24]  // guest 0x60914, sampled 1
6eac490c68:    	add	x16, x19, #0x2b0  // guest 0x60918, sampled 0
6eac490c6c:    	ld1r	{ v1.4s }, [x16]  // guest 0x60918, sampled 0
6eac490c70:    	str	q1, [x19, #0x2b0]  // guest 0x60918, sampled 0
6eac490c74:    	add	x1, x19, #0x2b0  // guest 0x6091c, sampled 0
6eac490c78:    	add	x2, x19, #0x2b0  // guest 0x6091c, sampled 0
6eac490c7c:    	add	x3, x19, #0x3b0  // guest 0x6091c, sampled 0
6eac490c80:    	mov	x0, x19  // guest 0x6091c, sampled 0
6eac490c84:    	adrp	x16, 0x6efc8b8000 <trace+0x50428000>  // guest 0x6091c, sampled 0
6eac490c88:    	add	x16, x16, #0x88  // guest 0x6091c, sampled 0
6eac490c8c:    	blr	x16  // guest 0x6091c, sampled 0
6eac490c90:    	add	w23, w22, #0x4  // guest 0x6091f, sampled 0
6eac490c94:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x6091f, sampled 0
6eac490c98:    	and	x16, x16, x23, lsr #7  // guest 0x6091f, sampled 0
6eac490c9c:    	add	x17, x17, x16  // guest 0x6091f, sampled 0
6eac490ca0:    	ldp	x16, x17, [x17]  // guest 0x6091f, sampled 0
6eac490ca4:    	and	w30, w23, #0xfffff003  // guest 0x6091f, sampled 0
6eac490ca8:    	cmp	w16, w30  // guest 0x6091f, sampled 0
6eac490cac:    	b.ne	0x6eac4917c0 <trace+0xd80>  // guest 0x6091f, sampled 0
6eac490cb0:    	add	x30, x17, w23, uxtw  // guest 0x6091f, sampled 0
6eac490cb4:    	ldapr	w23, [x30]  // guest 0x6091f, sampled 0
6eac490cb8:    	movi	v0.16b, #0x0  // guest 0x6091f, sampled 0
6eac490cbc:    	str	q0, [x19, #0x2f0]  // guest 0x6091f, sampled 0
6eac490cc0:    	add	x24, x19, #0x2f0  // guest 0x6091f, sampled 0
6eac490cc4:    	str	w23, [x24]  // guest 0x6091f, sampled 0
6eac490cc8:    	add	x16, x19, #0x2f0  // guest 0x60924, sampled 0
6eac490ccc:    	ld1r	{ v1.4s }, [x16]  // guest 0x60924, sampled 0
6eac490cd0:    	str	q1, [x19, #0x2f0]  // guest 0x60924, sampled 0
6eac490cd4:    	add	x1, x19, #0x2f0  // guest 0x60928, sampled 0
6eac490cd8:    	add	x2, x19, #0x2f0  // guest 0x60928, sampled 0
6eac490cdc:    	add	x3, x19, #0x3f0  // guest 0x60928, sampled 0
6eac490ce0:    	mov	x0, x19  // guest 0x60928, sampled 0
6eac490ce4:    	adrp	x16, 0x6efc8b8000 <trace+0x50428000>  // guest 0x60928, sampled 0
6eac490ce8:    	add	x16, x16, #0x88  // guest 0x60928, sampled 0
6eac490cec:    	blr	x16  // guest 0x60928, sampled 0
6eac490cf0:    	add	w23, w22, #0x8  // guest 0x6092b, sampled 0
6eac490cf4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x6092b, sampled 0
6eac490cf8:    	and	x16, x16, x23, lsr #7  // guest 0x6092b, sampled 0
6eac490cfc:    	add	x17, x17, x16  // guest 0x6092b, sampled 0
6eac490d00:    	ldp	x16, x17, [x17]  // guest 0x6092b, sampled 0
6eac490d04:    	and	w30, w23, #0xfffff003  // guest 0x6092b, sampled 0
6eac490d08:    	cmp	w16, w30  // guest 0x6092b, sampled 0
6eac490d0c:    	b.ne	0x6eac4917ec <trace+0xdac>  // guest 0x6092b, sampled 0
6eac490d10:    	add	x30, x17, w23, uxtw  // guest 0x6092b, sampled 0
6eac490d14:    	ldapr	w23, [x30]  // guest 0x6092b, sampled 0
6eac490d18:    	movi	v0.16b, #0x0  // guest 0x6092b, sampled 0
6eac490d1c:    	str	q0, [x19, #0x330]  // guest 0x6092b, sampled 0
6eac490d20:    	add	x24, x19, #0x330  // guest 0x6092b, sampled 0
6eac490d24:    	str	w23, [x24]  // guest 0x6092b, sampled 0
6eac490d28:    	add	x16, x19, #0x330  // guest 0x60930, sampled 0
6eac490d2c:    	ld1r	{ v1.4s }, [x16]  // guest 0x60930, sampled 0
6eac490d30:    	str	q1, [x19, #0x330]  // guest 0x60930, sampled 0
6eac490d34:    	add	x1, x19, #0x330  // guest 0x60934, sampled 0
6eac490d38:    	add	x2, x19, #0x330  // guest 0x60934, sampled 0
6eac490d3c:    	add	x3, x19, #0x430  // guest 0x60934, sampled 0
6eac490d40:    	mov	x0, x19  // guest 0x60934, sampled 0
6eac490d44:    	adrp	x16, 0x6efc8b8000 <trace+0x50428000>  // guest 0x60934, sampled 0
6eac490d48:    	add	x16, x16, #0x88  // guest 0x60934, sampled 0
6eac490d4c:    	blr	x16  // guest 0x60934, sampled 0
6eac490d50:    	add	x1, x19, #0x2f0  // guest 0x60937, sampled 0
6eac490d54:    	add	x2, x19, #0x2f0  // guest 0x60937, sampled 0
6eac490d58:    	add	x3, x19, #0x2b0  // guest 0x60937, sampled 0
6eac490d5c:    	mov	x0, x19  // guest 0x60937, sampled 0
6eac490d60:    	adrp	x16, 0x6efc8b7000 <trace+0x50427000>  // guest 0x60937, sampled 0
6eac490d64:    	add	x16, x16, #0xd08  // guest 0x60937, sampled 0
6eac490d68:    	blr	x16  // guest 0x60937, sampled 0
6eac490d6c:    	add	w23, w22, #0xc  // guest 0x6093a, sampled 0
6eac490d70:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x6093a, sampled 0
6eac490d74:    	and	x16, x16, x23, lsr #7  // guest 0x6093a, sampled 0
6eac490d78:    	add	x17, x17, x16  // guest 0x6093a, sampled 0
6eac490d7c:    	ldp	x16, x17, [x17]  // guest 0x6093a, sampled 0
6eac490d80:    	and	w30, w23, #0xfffff003  // guest 0x6093a, sampled 0
6eac490d84:    	cmp	w16, w30  // guest 0x6093a, sampled 0
6eac490d88:    	b.ne	0x6eac491818 <trace+0xdd8>  // guest 0x6093a, sampled 0
6eac490d8c:    	add	x30, x17, w23, uxtw  // guest 0x6093a, sampled 0
6eac490d90:    	ldapr	w23, [x30]  // guest 0x6093a, sampled 0
6eac490d94:    	movi	v0.16b, #0x0  // guest 0x6093a, sampled 0
6eac490d98:    	str	q0, [x19, #0x370]  // guest 0x6093a, sampled 0
6eac490d9c:    	add	x24, x19, #0x370  // guest 0x6093a, sampled 0
6eac490da0:    	str	w23, [x24]  // guest 0x6093a, sampled 0
6eac490da4:    	add	x16, x19, #0x370  // guest 0x6093f, sampled 0
6eac490da8:    	ld1r	{ v1.4s }, [x16]  // guest 0x6093f, sampled 0
6eac490dac:    	str	q1, [x19, #0x370]  // guest 0x6093f, sampled 2
6eac490db0:    	add	x1, x19, #0x370  // guest 0x60943, sampled 0
6eac490db4:    	add	x2, x19, #0x370  // guest 0x60943, sampled 0
6eac490db8:    	add	x3, x19, #0x470  // guest 0x60943, sampled 0
6eac490dbc:    	mov	x0, x19  // guest 0x60943, sampled 0
6eac490dc0:    	adrp	x16, 0x6efc8b8000 <trace+0x50428000>  // guest 0x60943, sampled 0
6eac490dc4:    	add	x16, x16, #0x88  // guest 0x60943, sampled 0
6eac490dc8:    	blr	x16  // guest 0x60943, sampled 0
6eac490dcc:    	add	w23, w22, #0x10  // guest 0x60946, sampled 0
6eac490dd0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60946, sampled 0
6eac490dd4:    	and	x16, x16, x23, lsr #7  // guest 0x60946, sampled 0
6eac490dd8:    	add	x17, x17, x16  // guest 0x60946, sampled 0
6eac490ddc:    	ldp	x16, x17, [x17]  // guest 0x60946, sampled 0
6eac490de0:    	and	w30, w23, #0xfffff003  // guest 0x60946, sampled 0
6eac490de4:    	cmp	w16, w30  // guest 0x60946, sampled 0
6eac490de8:    	b.ne	0x6eac491844 <trace+0xe04>  // guest 0x60946, sampled 0
6eac490dec:    	add	x30, x17, w23, uxtw  // guest 0x60946, sampled 0
6eac490df0:    	ldapr	w23, [x30]  // guest 0x60946, sampled 0
6eac490df4:    	movi	v0.16b, #0x0  // guest 0x60946, sampled 0
6eac490df8:    	str	q0, [x19, #0x2b0]  // guest 0x60946, sampled 0
6eac490dfc:    	add	x24, x19, #0x2b0  // guest 0x60946, sampled 0
6eac490e00:    	str	w23, [x24]  // guest 0x60946, sampled 0
6eac490e04:    	add	x16, x19, #0x2b0  // guest 0x6094b, sampled 0
6eac490e08:    	ld1r	{ v1.4s }, [x16]  // guest 0x6094b, sampled 0
6eac490e0c:    	str	q1, [x19, #0x2b0]  // guest 0x6094b, sampled 0
6eac490e10:    	add	x1, x19, #0x2b0  // guest 0x6094f, sampled 0
6eac490e14:    	add	x2, x19, #0x2b0  // guest 0x6094f, sampled 0
6eac490e18:    	add	x3, x19, #0x3b0  // guest 0x6094f, sampled 0
6eac490e1c:    	mov	x0, x19  // guest 0x6094f, sampled 0
6eac490e20:    	adrp	x16, 0x6efc8b8000 <trace+0x50428000>  // guest 0x6094f, sampled 0
6eac490e24:    	add	x16, x16, #0x88  // guest 0x6094f, sampled 0
6eac490e28:    	blr	x16  // guest 0x6094f, sampled 0
6eac490e2c:    	add	x1, x19, #0x370  // guest 0x60952, sampled 0
6eac490e30:    	add	x2, x19, #0x370  // guest 0x60952, sampled 0
6eac490e34:    	add	x3, x19, #0x330  // guest 0x60952, sampled 0
6eac490e38:    	mov	x0, x19  // guest 0x60952, sampled 0
6eac490e3c:    	adrp	x16, 0x6efc8b7000 <trace+0x50427000>  // guest 0x60952, sampled 0
6eac490e40:    	add	x16, x16, #0xd08  // guest 0x60952, sampled 0
6eac490e44:    	blr	x16  // guest 0x60952, sampled 0
6eac490e48:    	add	w23, w22, #0x14  // guest 0x60955, sampled 0
6eac490e4c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60955, sampled 0
6eac490e50:    	and	x16, x16, x23, lsr #7  // guest 0x60955, sampled 0
6eac490e54:    	add	x17, x17, x16  // guest 0x60955, sampled 0
6eac490e58:    	ldp	x16, x17, [x17]  // guest 0x60955, sampled 0
6eac490e5c:    	and	w30, w23, #0xfffff003  // guest 0x60955, sampled 0
6eac490e60:    	cmp	w16, w30  // guest 0x60955, sampled 0
6eac490e64:    	b.ne	0x6eac491870 <trace+0xe30>  // guest 0x60955, sampled 0
6eac490e68:    	add	x30, x17, w23, uxtw  // guest 0x60955, sampled 0
6eac490e6c:    	ldapr	w23, [x30]  // guest 0x60955, sampled 0
6eac490e70:    	movi	v0.16b, #0x0  // guest 0x60955, sampled 1
6eac490e74:    	str	q0, [x19, #0x330]  // guest 0x60955, sampled 0
6eac490e78:    	add	x24, x19, #0x330  // guest 0x60955, sampled 0
6eac490e7c:    	str	w23, [x24]  // guest 0x60955, sampled 0
6eac490e80:    	add	x16, x19, #0x330  // guest 0x6095a, sampled 0
6eac490e84:    	ld1r	{ v1.4s }, [x16]  // guest 0x6095a, sampled 0
6eac490e88:    	str	q1, [x19, #0x330]  // guest 0x6095a, sampled 0
6eac490e8c:    	add	x1, x19, #0x330  // guest 0x6095e, sampled 0
6eac490e90:    	add	x2, x19, #0x330  // guest 0x6095e, sampled 0
6eac490e94:    	add	x3, x19, #0x3f0  // guest 0x6095e, sampled 0
6eac490e98:    	mov	x0, x19  // guest 0x6095e, sampled 0
6eac490e9c:    	adrp	x16, 0x6efc8b8000 <trace+0x50428000>  // guest 0x6095e, sampled 0
6eac490ea0:    	add	x16, x16, #0x88  // guest 0x6095e, sampled 0
6eac490ea4:    	blr	x16  // guest 0x6095e, sampled 0
6eac490ea8:    	add	x1, x19, #0x370  // guest 0x60961, sampled 0
6eac490eac:    	add	x2, x19, #0x370  // guest 0x60961, sampled 0
6eac490eb0:    	add	x3, x19, #0x2f0  // guest 0x60961, sampled 0
6eac490eb4:    	mov	x0, x19  // guest 0x60961, sampled 0
6eac490eb8:    	adrp	x16, 0x6efc8b7000 <trace+0x50427000>  // guest 0x60961, sampled 0
6eac490ebc:    	add	x16, x16, #0xd08  // guest 0x60961, sampled 0
6eac490ec0:    	blr	x16  // guest 0x60961, sampled 0
6eac490ec4:    	add	w23, w22, #0x18  // guest 0x60964, sampled 0
6eac490ec8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60964, sampled 0
6eac490ecc:    	and	x16, x16, x23, lsr #7  // guest 0x60964, sampled 0
6eac490ed0:    	add	x17, x17, x16  // guest 0x60964, sampled 0
6eac490ed4:    	ldp	x16, x17, [x17]  // guest 0x60964, sampled 0
6eac490ed8:    	and	w30, w23, #0xfffff003  // guest 0x60964, sampled 0
6eac490edc:    	cmp	w16, w30  // guest 0x60964, sampled 0
6eac490ee0:    	b.ne	0x6eac49189c <trace+0xe5c>  // guest 0x60964, sampled 0
6eac490ee4:    	add	x30, x17, w23, uxtw  // guest 0x60964, sampled 0
6eac490ee8:    	ldapr	w23, [x30]  // guest 0x60964, sampled 0
6eac490eec:    	movi	v0.16b, #0x0  // guest 0x60964, sampled 1
6eac490ef0:    	str	q0, [x19, #0x2f0]  // guest 0x60964, sampled 0
6eac490ef4:    	add	x24, x19, #0x2f0  // guest 0x60964, sampled 0
6eac490ef8:    	str	w23, [x24]  // guest 0x60964, sampled 0
6eac490efc:    	add	x16, x19, #0x2f0  // guest 0x60969, sampled 0
6eac490f00:    	ld1r	{ v1.4s }, [x16]  // guest 0x60969, sampled 0
6eac490f04:    	str	q1, [x19, #0x2f0]  // guest 0x60969, sampled 0
6eac490f08:    	add	x1, x19, #0x2f0  // guest 0x6096d, sampled 0
6eac490f0c:    	add	x2, x19, #0x2f0  // guest 0x6096d, sampled 0
6eac490f10:    	add	x3, x19, #0x430  // guest 0x6096d, sampled 0
6eac490f14:    	mov	x0, x19  // guest 0x6096d, sampled 0
6eac490f18:    	adrp	x16, 0x6efc8b8000 <trace+0x50428000>  // guest 0x6096d, sampled 0
6eac490f1c:    	add	x16, x16, #0x88  // guest 0x6096d, sampled 0
6eac490f20:    	blr	x16  // guest 0x6096d, sampled 0
6eac490f24:    	ldr	x23, [x19, #0x370]  // guest 0x60970, sampled 0
6eac490f28:    	ldr	x24, [x19, #0x378]  // guest 0x60970, sampled 0
6eac490f2c:    	dmb	ishst  // guest 0x60970, sampled 0
6eac490f30:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60970, sampled 0
6eac490f34:    	and	x16, x16, x21, lsr #7  // guest 0x60970, sampled 0
6eac490f38:    	add	x17, x17, x16  // guest 0x60970, sampled 0
6eac490f3c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x60970, sampled 0
6eac490f40:    	add	w30, w21, #0xf  // guest 0x60970, sampled 0
6eac490f44:    	and	w30, w30, #0xfffff000  // guest 0x60970, sampled 0
6eac490f48:    	cmp	w16, w30  // guest 0x60970, sampled 0
6eac490f4c:    	b.ne	0x6eac4918c8 <trace+0xe88>  // guest 0x60970, sampled 0
6eac490f50:    	add	x30, x17, w21, uxtw  // guest 0x60970, sampled 0
6eac490f54:    	stp	x23, x24, [x30]  // guest 0x60970, sampled 0
6eac490f58:    	add	x1, x19, #0x330  // guest 0x60973, sampled 0
6eac490f5c:    	add	x2, x19, #0x330  // guest 0x60973, sampled 0
6eac490f60:    	add	x3, x19, #0x2b0  // guest 0x60973, sampled 0
6eac490f64:    	mov	x0, x19  // guest 0x60973, sampled 0
6eac490f68:    	adrp	x16, 0x6efc8b7000 <trace+0x50427000>  // guest 0x60973, sampled 0
6eac490f6c:    	add	x16, x16, #0xd08  // guest 0x60973, sampled 0
6eac490f70:    	blr	x16  // guest 0x60973, sampled 0
6eac490f74:    	add	w23, w22, #0x1c  // guest 0x60976, sampled 0
6eac490f78:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60976, sampled 0
6eac490f7c:    	and	x16, x16, x23, lsr #7  // guest 0x60976, sampled 0
6eac490f80:    	add	x17, x17, x16  // guest 0x60976, sampled 0
6eac490f84:    	ldp	x16, x17, [x17]  // guest 0x60976, sampled 0
6eac490f88:    	and	w30, w23, #0xfffff003  // guest 0x60976, sampled 0
6eac490f8c:    	cmp	w16, w30  // guest 0x60976, sampled 0
6eac490f90:    	b.ne	0x6eac4918f8 <trace+0xeb8>  // guest 0x60976, sampled 0
6eac490f94:    	add	x30, x17, w23, uxtw  // guest 0x60976, sampled 0
6eac490f98:    	ldapr	w23, [x30]  // guest 0x60976, sampled 0
6eac490f9c:    	movi	v0.16b, #0x0  // guest 0x60976, sampled 0
6eac490fa0:    	str	q0, [x19, #0x370]  // guest 0x60976, sampled 0
6eac490fa4:    	add	x24, x19, #0x370  // guest 0x60976, sampled 0
6eac490fa8:    	str	w23, [x24]  // guest 0x60976, sampled 0
6eac490fac:    	add	x16, x19, #0x370  // guest 0x6097b, sampled 0
6eac490fb0:    	ld1r	{ v1.4s }, [x16]  // guest 0x6097b, sampled 0
6eac490fb4:    	str	q1, [x19, #0x370]  // guest 0x6097b, sampled 0
6eac490fb8:    	add	x1, x19, #0x370  // guest 0x6097f, sampled 0
6eac490fbc:    	add	x2, x19, #0x370  // guest 0x6097f, sampled 0
6eac490fc0:    	add	x3, x19, #0x470  // guest 0x6097f, sampled 0
6eac490fc4:    	mov	x0, x19  // guest 0x6097f, sampled 0
6eac490fc8:    	adrp	x16, 0x6efc8b8000 <trace+0x50428000>  // guest 0x6097f, sampled 0
6eac490fcc:    	add	x16, x16, #0x88  // guest 0x6097f, sampled 0
6eac490fd0:    	blr	x16  // guest 0x6097f, sampled 0
6eac490fd4:    	add	w23, w22, #0x20  // guest 0x60982, sampled 0
6eac490fd8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60982, sampled 0
6eac490fdc:    	and	x16, x16, x23, lsr #7  // guest 0x60982, sampled 0
6eac490fe0:    	add	x17, x17, x16  // guest 0x60982, sampled 0
6eac490fe4:    	ldp	x16, x17, [x17]  // guest 0x60982, sampled 0
6eac490fe8:    	and	w30, w23, #0xfffff003  // guest 0x60982, sampled 0
6eac490fec:    	cmp	w16, w30  // guest 0x60982, sampled 0
6eac490ff0:    	b.ne	0x6eac491924 <trace+0xee4>  // guest 0x60982, sampled 0
6eac490ff4:    	add	x30, x17, w23, uxtw  // guest 0x60982, sampled 0
6eac490ff8:    	ldapr	w23, [x30]  // guest 0x60982, sampled 0
6eac490ffc:    	movi	v0.16b, #0x0  // guest 0x60982, sampled 0
6eac491000:    	str	q0, [x19, #0x2b0]  // guest 0x60982, sampled 0
6eac491004:    	add	x24, x19, #0x2b0  // guest 0x60982, sampled 0
6eac491008:    	str	w23, [x24]  // guest 0x60982, sampled 0
6eac49100c:    	add	x16, x19, #0x2b0  // guest 0x60987, sampled 0
6eac491010:    	ld1r	{ v1.4s }, [x16]  // guest 0x60987, sampled 0
6eac491014:    	str	q1, [x19, #0x2b0]  // guest 0x60987, sampled 0
6eac491018:    	add	x1, x19, #0x2b0  // guest 0x6098b, sampled 0
6eac49101c:    	add	x2, x19, #0x2b0  // guest 0x6098b, sampled 0
6eac491020:    	add	x3, x19, #0x3b0  // guest 0x6098b, sampled 0
6eac491024:    	mov	x0, x19  // guest 0x6098b, sampled 0
6eac491028:    	adrp	x16, 0x6efc8b8000 <trace+0x50427000>  // guest 0x6098b, sampled 0
6eac49102c:    	add	x16, x16, #0x88  // guest 0x6098b, sampled 0
6eac491030:    	blr	x16  // guest 0x6098b, sampled 0
6eac491034:    	add	x1, x19, #0x370  // guest 0x6098e, sampled 0
6eac491038:    	add	x2, x19, #0x370  // guest 0x6098e, sampled 0
6eac49103c:    	add	x3, x19, #0x2f0  // guest 0x6098e, sampled 0
6eac491040:    	mov	x0, x19  // guest 0x6098e, sampled 0
6eac491044:    	adrp	x16, 0x6efc8b7000 <trace+0x50426000>  // guest 0x6098e, sampled 0
6eac491048:    	add	x16, x16, #0xd08  // guest 0x6098e, sampled 0
6eac49104c:    	blr	x16  // guest 0x6098e, sampled 0
6eac491050:    	add	w23, w22, #0x24  // guest 0x60991, sampled 0
6eac491054:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60991, sampled 0
6eac491058:    	and	x16, x16, x23, lsr #7  // guest 0x60991, sampled 0
6eac49105c:    	add	x17, x17, x16  // guest 0x60991, sampled 0
6eac491060:    	ldp	x16, x17, [x17]  // guest 0x60991, sampled 0
6eac491064:    	and	w30, w23, #0xfffff003  // guest 0x60991, sampled 0
6eac491068:    	cmp	w16, w30  // guest 0x60991, sampled 0
6eac49106c:    	b.ne	0x6eac491950 <trace+0xf10>  // guest 0x60991, sampled 0
6eac491070:    	add	x30, x17, w23, uxtw  // guest 0x60991, sampled 0
6eac491074:    	ldapr	w23, [x30]  // guest 0x60991, sampled 0
6eac491078:    	movi	v0.16b, #0x0  // guest 0x60991, sampled 0
6eac49107c:    	str	q0, [x19, #0x2f0]  // guest 0x60991, sampled 0
6eac491080:    	add	x24, x19, #0x2f0  // guest 0x60991, sampled 0
6eac491084:    	str	w23, [x24]  // guest 0x60991, sampled 0
6eac491088:    	add	x16, x19, #0x2f0  // guest 0x60996, sampled 0
6eac49108c:    	ld1r	{ v1.4s }, [x16]  // guest 0x60996, sampled 0
6eac491090:    	str	q1, [x19, #0x2f0]  // guest 0x60996, sampled 0
6eac491094:    	add	x1, x19, #0x2f0  // guest 0x6099a, sampled 0
6eac491098:    	add	x2, x19, #0x2f0  // guest 0x6099a, sampled 0
6eac49109c:    	add	x3, x19, #0x3f0  // guest 0x6099a, sampled 0
6eac4910a0:    	mov	x0, x19  // guest 0x6099a, sampled 0
6eac4910a4:    	adrp	x16, 0x6efc8b8000 <trace+0x50427000>  // guest 0x6099a, sampled 0
6eac4910a8:    	add	x16, x16, #0x88  // guest 0x6099a, sampled 0
6eac4910ac:    	blr	x16  // guest 0x6099a, sampled 0
6eac4910b0:    	add	x1, x19, #0x370  // guest 0x6099d, sampled 0
6eac4910b4:    	add	x2, x19, #0x370  // guest 0x6099d, sampled 0
6eac4910b8:    	add	x3, x19, #0x330  // guest 0x6099d, sampled 0
6eac4910bc:    	mov	x0, x19  // guest 0x6099d, sampled 0
6eac4910c0:    	adrp	x16, 0x6efc8b7000 <trace+0x50426000>  // guest 0x6099d, sampled 0
6eac4910c4:    	add	x16, x16, #0xd08  // guest 0x6099d, sampled 0
6eac4910c8:    	blr	x16  // guest 0x6099d, sampled 0
6eac4910cc:    	add	w23, w22, #0x28  // guest 0x609a0, sampled 0
6eac4910d0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x609a0, sampled 0
6eac4910d4:    	and	x16, x16, x23, lsr #7  // guest 0x609a0, sampled 0
6eac4910d8:    	add	x17, x17, x16  // guest 0x609a0, sampled 0
6eac4910dc:    	ldp	x16, x17, [x17]  // guest 0x609a0, sampled 0
6eac4910e0:    	and	w30, w23, #0xfffff003  // guest 0x609a0, sampled 0
6eac4910e4:    	cmp	w16, w30  // guest 0x609a0, sampled 0
6eac4910e8:    	b.ne	0x6eac49197c <trace+0xf3c>  // guest 0x609a0, sampled 0
6eac4910ec:    	add	x30, x17, w23, uxtw  // guest 0x609a0, sampled 0
6eac4910f0:    	ldapr	w23, [x30]  // guest 0x609a0, sampled 0
6eac4910f4:    	movi	v0.16b, #0x0  // guest 0x609a0, sampled 2
6eac4910f8:    	str	q0, [x19, #0x330]  // guest 0x609a0, sampled 0
6eac4910fc:    	add	x24, x19, #0x330  // guest 0x609a0, sampled 0
6eac491100:    	str	w23, [x24]  // guest 0x609a0, sampled 0
6eac491104:    	add	x16, x19, #0x330  // guest 0x609a5, sampled 0
6eac491108:    	ld1r	{ v1.4s }, [x16]  // guest 0x609a5, sampled 0
6eac49110c:    	str	q1, [x19, #0x330]  // guest 0x609a5, sampled 0
6eac491110:    	add	x1, x19, #0x330  // guest 0x609a9, sampled 0
6eac491114:    	add	x2, x19, #0x330  // guest 0x609a9, sampled 0
6eac491118:    	add	x3, x19, #0x430  // guest 0x609a9, sampled 0
6eac49111c:    	mov	x0, x19  // guest 0x609a9, sampled 0
6eac491120:    	adrp	x16, 0x6efc8b8000 <trace+0x50427000>  // guest 0x609a9, sampled 0
6eac491124:    	add	x16, x16, #0x88  // guest 0x609a9, sampled 0
6eac491128:    	blr	x16  // guest 0x609a9, sampled 0
6eac49112c:    	add	w23, w21, #0x10  // guest 0x609ac, sampled 0
6eac491130:    	ldr	x24, [x19, #0x370]  // guest 0x609ac, sampled 0
6eac491134:    	ldr	x25, [x19, #0x378]  // guest 0x609ac, sampled 0
6eac491138:    	dmb	ishst  // guest 0x609ac, sampled 0
6eac49113c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x609ac, sampled 0
6eac491140:    	and	x16, x16, x23, lsr #7  // guest 0x609ac, sampled 0
6eac491144:    	add	x17, x17, x16  // guest 0x609ac, sampled 0
6eac491148:    	ldp	x17, x16, [x17, #0x8]  // guest 0x609ac, sampled 0
6eac49114c:    	add	w30, w23, #0xf  // guest 0x609ac, sampled 0
6eac491150:    	and	w30, w30, #0xfffff000  // guest 0x609ac, sampled 0
6eac491154:    	cmp	w16, w30  // guest 0x609ac, sampled 0
6eac491158:    	b.ne	0x6eac4919a8 <trace+0xf68>  // guest 0x609ac, sampled 0
6eac49115c:    	add	x30, x17, w23, uxtw  // guest 0x609ac, sampled 0
6eac491160:    	stp	x24, x25, [x30]  // guest 0x609ac, sampled 0
6eac491164:    	add	x1, x19, #0x2f0  // guest 0x609b0, sampled 0
6eac491168:    	add	x2, x19, #0x2f0  // guest 0x609b0, sampled 0
6eac49116c:    	add	x3, x19, #0x2b0  // guest 0x609b0, sampled 0
6eac491170:    	mov	x0, x19  // guest 0x609b0, sampled 0
6eac491174:    	adrp	x16, 0x6efc8b7000 <trace+0x50426000>  // guest 0x609b0, sampled 0
6eac491178:    	add	x16, x16, #0xd08  // guest 0x609b0, sampled 0
6eac49117c:    	blr	x16  // guest 0x609b0, sampled 0
6eac491180:    	add	w23, w22, #0x2c  // guest 0x609b3, sampled 0
6eac491184:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x609b3, sampled 0
6eac491188:    	and	x16, x16, x23, lsr #7  // guest 0x609b3, sampled 0
6eac49118c:    	add	x17, x17, x16  // guest 0x609b3, sampled 0
6eac491190:    	ldp	x16, x17, [x17]  // guest 0x609b3, sampled 0
6eac491194:    	and	w30, w23, #0xfffff003  // guest 0x609b3, sampled 0
6eac491198:    	cmp	w16, w30  // guest 0x609b3, sampled 0
6eac49119c:    	b.ne	0x6eac4919d8 <trace+0xf98>  // guest 0x609b3, sampled 0
6eac4911a0:    	add	x30, x17, w23, uxtw  // guest 0x609b3, sampled 0
6eac4911a4:    	ldapr	w23, [x30]  // guest 0x609b3, sampled 0
6eac4911a8:    	movi	v0.16b, #0x0  // guest 0x609b3, sampled 1
6eac4911ac:    	str	q0, [x19, #0x370]  // guest 0x609b3, sampled 0
6eac4911b0:    	add	x24, x19, #0x370  // guest 0x609b3, sampled 0
6eac4911b4:    	str	w23, [x24]  // guest 0x609b3, sampled 0
6eac4911b8:    	add	x16, x19, #0x370  // guest 0x609b8, sampled 0
6eac4911bc:    	ld1r	{ v1.4s }, [x16]  // guest 0x609b8, sampled 0
6eac4911c0:    	str	q1, [x19, #0x370]  // guest 0x609b8, sampled 0
6eac4911c4:    	add	x1, x19, #0x370  // guest 0x609bc, sampled 0
6eac4911c8:    	add	x2, x19, #0x370  // guest 0x609bc, sampled 0
6eac4911cc:    	add	x3, x19, #0x470  // guest 0x609bc, sampled 0
6eac4911d0:    	mov	x0, x19  // guest 0x609bc, sampled 0
6eac4911d4:    	adrp	x16, 0x6efc8b8000 <trace+0x50427000>  // guest 0x609bc, sampled 0
6eac4911d8:    	add	x16, x16, #0x88  // guest 0x609bc, sampled 0
6eac4911dc:    	blr	x16  // guest 0x609bc, sampled 0
6eac4911e0:    	add	w23, w22, #0x30  // guest 0x609bf, sampled 0
6eac4911e4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x609bf, sampled 0
6eac4911e8:    	and	x16, x16, x23, lsr #7  // guest 0x609bf, sampled 0
6eac4911ec:    	add	x17, x17, x16  // guest 0x609bf, sampled 0
6eac4911f0:    	ldp	x16, x17, [x17]  // guest 0x609bf, sampled 0
6eac4911f4:    	and	w30, w23, #0xfffff003  // guest 0x609bf, sampled 0
6eac4911f8:    	cmp	w16, w30  // guest 0x609bf, sampled 0
6eac4911fc:    	b.ne	0x6eac491a04 <trace+0xfc4>  // guest 0x609bf, sampled 0
6eac491200:    	add	x30, x17, w23, uxtw  // guest 0x609bf, sampled 0
6eac491204:    	ldapr	w23, [x30]  // guest 0x609bf, sampled 0
6eac491208:    	movi	v0.16b, #0x0  // guest 0x609bf, sampled 0
6eac49120c:    	str	q0, [x19, #0x2b0]  // guest 0x609bf, sampled 0
6eac491210:    	add	x24, x19, #0x2b0  // guest 0x609bf, sampled 0
6eac491214:    	str	w23, [x24]  // guest 0x609bf, sampled 0
6eac491218:    	add	x16, x19, #0x2b0  // guest 0x609c4, sampled 0
6eac49121c:    	ld1r	{ v1.4s }, [x16]  // guest 0x609c4, sampled 0
6eac491220:    	str	q1, [x19, #0x2b0]  // guest 0x609c4, sampled 0
6eac491224:    	add	x1, x19, #0x2b0  // guest 0x609c8, sampled 0
6eac491228:    	add	x2, x19, #0x2b0  // guest 0x609c8, sampled 0
6eac49122c:    	add	x3, x19, #0x3b0  // guest 0x609c8, sampled 0
6eac491230:    	mov	x0, x19  // guest 0x609c8, sampled 0
6eac491234:    	adrp	x16, 0x6efc8b8000 <trace+0x50427000>  // guest 0x609c8, sampled 0
6eac491238:    	add	x16, x16, #0x88  // guest 0x609c8, sampled 0
6eac49123c:    	blr	x16  // guest 0x609c8, sampled 0
6eac491240:    	add	x1, x19, #0x370  // guest 0x609cb, sampled 0
6eac491244:    	add	x2, x19, #0x370  // guest 0x609cb, sampled 0
6eac491248:    	add	x3, x19, #0x330  // guest 0x609cb, sampled 0
6eac49124c:    	mov	x0, x19  // guest 0x609cb, sampled 0
6eac491250:    	adrp	x16, 0x6efc8b7000 <trace+0x50426000>  // guest 0x609cb, sampled 0
6eac491254:    	add	x16, x16, #0xd08  // guest 0x609cb, sampled 0
6eac491258:    	blr	x16  // guest 0x609cb, sampled 0
6eac49125c:    	add	w23, w22, #0x34  // guest 0x609ce, sampled 0
6eac491260:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x609ce, sampled 0
6eac491264:    	and	x16, x16, x23, lsr #7  // guest 0x609ce, sampled 0
6eac491268:    	add	x17, x17, x16  // guest 0x609ce, sampled 0
6eac49126c:    	ldp	x16, x17, [x17]  // guest 0x609ce, sampled 0
6eac491270:    	and	w30, w23, #0xfffff003  // guest 0x609ce, sampled 1
6eac491274:    	cmp	w16, w30  // guest 0x609ce, sampled 0
6eac491278:    	b.ne	0x6eac491a30 <trace+0xff0>  // guest 0x609ce, sampled 0
6eac49127c:    	add	x30, x17, w23, uxtw  // guest 0x609ce, sampled 0
6eac491280:    	ldapr	w23, [x30]  // guest 0x609ce, sampled 0
6eac491284:    	movi	v0.16b, #0x0  // guest 0x609ce, sampled 0
6eac491288:    	str	q0, [x19, #0x330]  // guest 0x609ce, sampled 0
6eac49128c:    	add	x24, x19, #0x330  // guest 0x609ce, sampled 0
6eac491290:    	str	w23, [x24]  // guest 0x609ce, sampled 0
6eac491294:    	add	x16, x19, #0x330  // guest 0x609d3, sampled 0
6eac491298:    	ld1r	{ v1.4s }, [x16]  // guest 0x609d3, sampled 0
6eac49129c:    	str	q1, [x19, #0x330]  // guest 0x609d3, sampled 0
6eac4912a0:    	add	x1, x19, #0x330  // guest 0x609d7, sampled 0
6eac4912a4:    	add	x2, x19, #0x330  // guest 0x609d7, sampled 0
6eac4912a8:    	add	x3, x19, #0x3f0  // guest 0x609d7, sampled 0
6eac4912ac:    	mov	x0, x19  // guest 0x609d7, sampled 0
6eac4912b0:    	adrp	x16, 0x6efc8b8000 <trace+0x50427000>  // guest 0x609d7, sampled 0
6eac4912b4:    	add	x16, x16, #0x88  // guest 0x609d7, sampled 0
6eac4912b8:    	blr	x16  // guest 0x609d7, sampled 0
6eac4912bc:    	add	x1, x19, #0x370  // guest 0x609da, sampled 0
6eac4912c0:    	add	x2, x19, #0x370  // guest 0x609da, sampled 0
6eac4912c4:    	add	x3, x19, #0x2f0  // guest 0x609da, sampled 0
6eac4912c8:    	mov	x0, x19  // guest 0x609da, sampled 0
6eac4912cc:    	adrp	x16, 0x6efc8b7000 <trace+0x50426000>  // guest 0x609da, sampled 0
6eac4912d0:    	add	x16, x16, #0xd08  // guest 0x609da, sampled 0
6eac4912d4:    	blr	x16  // guest 0x609da, sampled 0
6eac4912d8:    	add	w23, w22, #0x38  // guest 0x609dd, sampled 0
6eac4912dc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x609dd, sampled 0
6eac4912e0:    	and	x16, x16, x23, lsr #7  // guest 0x609dd, sampled 0
6eac4912e4:    	add	x17, x17, x16  // guest 0x609dd, sampled 0
6eac4912e8:    	ldp	x16, x17, [x17]  // guest 0x609dd, sampled 0
6eac4912ec:    	and	w30, w23, #0xfffff003  // guest 0x609dd, sampled 1
6eac4912f0:    	cmp	w16, w30  // guest 0x609dd, sampled 0
6eac4912f4:    	b.ne	0x6eac491a5c <trace+0x101c>  // guest 0x609dd, sampled 0
6eac4912f8:    	add	x30, x17, w23, uxtw  // guest 0x609dd, sampled 0
6eac4912fc:    	ldapr	w23, [x30]  // guest 0x609dd, sampled 0
6eac491300:    	movi	v0.16b, #0x0  // guest 0x609dd, sampled 0
6eac491304:    	str	q0, [x19, #0x2f0]  // guest 0x609dd, sampled 0
6eac491308:    	add	x24, x19, #0x2f0  // guest 0x609dd, sampled 0
6eac49130c:    	str	w23, [x24]  // guest 0x609dd, sampled 0
6eac491310:    	add	x16, x19, #0x2f0  // guest 0x609e2, sampled 0
6eac491314:    	ld1r	{ v1.4s }, [x16]  // guest 0x609e2, sampled 0
6eac491318:    	str	q1, [x19, #0x2f0]  // guest 0x609e2, sampled 1
6eac49131c:    	add	x1, x19, #0x2f0  // guest 0x609e6, sampled 0
6eac491320:    	add	x2, x19, #0x2f0  // guest 0x609e6, sampled 0
6eac491324:    	add	x3, x19, #0x430  // guest 0x609e6, sampled 0
6eac491328:    	mov	x0, x19  // guest 0x609e6, sampled 0
6eac49132c:    	adrp	x16, 0x6efc8b8000 <trace+0x50427000>  // guest 0x609e6, sampled 0
6eac491330:    	add	x16, x16, #0x88  // guest 0x609e6, sampled 0
6eac491334:    	blr	x16  // guest 0x609e6, sampled 0
6eac491338:    	add	w23, w21, #0x20  // guest 0x609e9, sampled 0
6eac49133c:    	ldr	x24, [x19, #0x370]  // guest 0x609e9, sampled 0
6eac491340:    	ldr	x25, [x19, #0x378]  // guest 0x609e9, sampled 0
6eac491344:    	dmb	ishst  // guest 0x609e9, sampled 0
6eac491348:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x609e9, sampled 0
6eac49134c:    	and	x16, x16, x23, lsr #7  // guest 0x609e9, sampled 0
6eac491350:    	add	x17, x17, x16  // guest 0x609e9, sampled 0
6eac491354:    	ldp	x17, x16, [x17, #0x8]  // guest 0x609e9, sampled 0
6eac491358:    	add	w30, w23, #0xf  // guest 0x609e9, sampled 0
6eac49135c:    	and	w30, w30, #0xfffff000  // guest 0x609e9, sampled 0
6eac491360:    	cmp	w16, w30  // guest 0x609e9, sampled 0
6eac491364:    	b.ne	0x6eac491a88 <trace+0x1048>  // guest 0x609e9, sampled 0
6eac491368:    	add	x30, x17, w23, uxtw  // guest 0x609e9, sampled 0
6eac49136c:    	stp	x24, x25, [x30]  // guest 0x609e9, sampled 0
6eac491370:    	add	x1, x19, #0x330  // guest 0x609ed, sampled 0
6eac491374:    	add	x2, x19, #0x330  // guest 0x609ed, sampled 0
6eac491378:    	add	x3, x19, #0x2b0  // guest 0x609ed, sampled 0
6eac49137c:    	mov	x0, x19  // guest 0x609ed, sampled 0
6eac491380:    	adrp	x16, 0x6efc8b7000 <trace+0x50426000>  // guest 0x609ed, sampled 0
6eac491384:    	add	x16, x16, #0xd08  // guest 0x609ed, sampled 0
6eac491388:    	blr	x16  // guest 0x609ed, sampled 0
6eac49138c:    	add	w22, w22, #0x3c  // guest 0x609f0, sampled 0
6eac491390:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x609f0, sampled 0
6eac491394:    	and	x16, x16, x22, lsr #7  // guest 0x609f0, sampled 0
6eac491398:    	add	x17, x17, x16  // guest 0x609f0, sampled 0
6eac49139c:    	ldp	x16, x17, [x17]  // guest 0x609f0, sampled 0
6eac4913a0:    	and	w30, w22, #0xfffff003  // guest 0x609f0, sampled 0
6eac4913a4:    	cmp	w16, w30  // guest 0x609f0, sampled 0
6eac4913a8:    	b.ne	0x6eac491ab8 <trace+0x1078>  // guest 0x609f0, sampled 0
6eac4913ac:    	add	x30, x17, w22, uxtw  // guest 0x609f0, sampled 0
6eac4913b0:    	ldapr	w22, [x30]  // guest 0x609f0, sampled 0
6eac4913b4:    	movi	v0.16b, #0x0  // guest 0x609f0, sampled 0
6eac4913b8:    	str	q0, [x19, #0x370]  // guest 0x609f0, sampled 0
6eac4913bc:    	add	x23, x19, #0x370  // guest 0x609f0, sampled 0
6eac4913c0:    	str	w22, [x23]  // guest 0x609f0, sampled 0
6eac4913c4:    	add	x16, x19, #0x370  // guest 0x609f5, sampled 0
6eac4913c8:    	ld1r	{ v0.4s }, [x16]  // guest 0x609f5, sampled 0
6eac4913cc:    	str	q0, [x19, #0x370]  // guest 0x609f5, sampled 0
6eac4913d0:    	add	x1, x19, #0x370  // guest 0x609f9, sampled 0
6eac4913d4:    	add	x2, x19, #0x370  // guest 0x609f9, sampled 0
6eac4913d8:    	add	x3, x19, #0x470  // guest 0x609f9, sampled 0
6eac4913dc:    	mov	x0, x19  // guest 0x609f9, sampled 0
6eac4913e0:    	adrp	x16, 0x6efc8b8000 <trace+0x50427000>  // guest 0x609f9, sampled 0
6eac4913e4:    	add	x16, x16, #0x88  // guest 0x609f9, sampled 0
6eac4913e8:    	blr	x16  // guest 0x609f9, sampled 0
6eac4913ec:    	add	x1, x19, #0x370  // guest 0x609fc, sampled 0
6eac4913f0:    	add	x2, x19, #0x370  // guest 0x609fc, sampled 0
6eac4913f4:    	add	x3, x19, #0x2f0  // guest 0x609fc, sampled 0
6eac4913f8:    	mov	x0, x19  // guest 0x609fc, sampled 0
6eac4913fc:    	adrp	x16, 0x6efc8b7000 <trace+0x50426000>  // guest 0x609fc, sampled 0
6eac491400:    	add	x16, x16, #0xd08  // guest 0x609fc, sampled 0
6eac491404:    	blr	x16  // guest 0x609fc, sampled 0
6eac491408:    	add	x1, x19, #0x370  // guest 0x609ff, sampled 0
6eac49140c:    	add	x2, x19, #0x370  // guest 0x609ff, sampled 0
6eac491410:    	add	x3, x19, #0x330  // guest 0x609ff, sampled 0
6eac491414:    	mov	x0, x19  // guest 0x609ff, sampled 0
6eac491418:    	adrp	x16, 0x6efc8b7000 <trace+0x50426000>  // guest 0x609ff, sampled 0
6eac49141c:    	add	x16, x16, #0xd08  // guest 0x609ff, sampled 0
6eac491420:    	blr	x16  // guest 0x609ff, sampled 0
6eac491424:    	add	w21, w21, #0x30  // guest 0x60a02, sampled 0
6eac491428:    	ldr	x22, [x19, #0x370]  // guest 0x60a02, sampled 0
6eac49142c:    	ldr	x23, [x19, #0x378]  // guest 0x60a02, sampled 0
6eac491430:    	dmb	ishst  // guest 0x60a02, sampled 0
6eac491434:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60a02, sampled 0
6eac491438:    	and	x16, x16, x21, lsr #7  // guest 0x60a02, sampled 0
6eac49143c:    	add	x17, x17, x16  // guest 0x60a02, sampled 0
6eac491440:    	ldp	x17, x16, [x17, #0x8]  // guest 0x60a02, sampled 0
6eac491444:    	add	w30, w21, #0xf  // guest 0x60a02, sampled 0
6eac491448:    	and	w30, w30, #0xfffff000  // guest 0x60a02, sampled 0
6eac49144c:    	cmp	w16, w30  // guest 0x60a02, sampled 0
6eac491450:    	b.ne	0x6eac491ae4 <trace+0x10a4>  // guest 0x60a02, sampled 0
6eac491454:    	add	x30, x17, w21, uxtw  // guest 0x60a02, sampled 0
6eac491458:    	stp	x22, x23, [x30]  // guest 0x60a02, sampled 0
6eac49145c:    	add	w21, w20, #0x50  // guest 0x60a06, sampled 1
6eac491460:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60a06, sampled 0
6eac491464:    	and	x16, x16, x21, lsr #7  // guest 0x60a06, sampled 0
6eac491468:    	add	x17, x17, x16  // guest 0x60a06, sampled 0
6eac49146c:    	ldp	x16, x17, [x17]  // guest 0x60a06, sampled 0
6eac491470:    	and	w30, w21, #0xfffff003  // guest 0x60a06, sampled 0
6eac491474:    	cmp	w16, w30  // guest 0x60a06, sampled 0
6eac491478:    	b.ne	0x6eac491b14 <trace+0x10d4>  // guest 0x60a06, sampled 0
6eac49147c:    	add	x30, x17, w21, uxtw  // guest 0x60a06, sampled 0
6eac491480:    	ldapr	w21, [x30]  // guest 0x60a06, sampled 0
6eac491484:    	str	w21, [x19]  // guest 0x60a06, sampled 0
6eac491488:    	mov	w22, #0x10              // =16  // guest 0x60a0a, sampled 0
6eac49148c:    	str	w22, [x19, #0x4]  // guest 0x60a0a, sampled 0
6eac491490:    	add	w20, w20, #0xc  // guest 0x60a0f, sampled 0
6eac491494:    	str	w20, [sp, #0x80]  // guest 0x60a0f, sampled 0
6eac491498:    	str	w20, [x19, #0x18]  // guest 0x60a0f, sampled 0
6eac49149c:    	str	w21, [sp, #0x84]  // guest 0x60a13, sampled 0
6eac4914a0:    	str	w21, [x19, #0x1c]  // guest 0x60a13, sampled 0
6eac4914a4:    	mov	w20, #0x1               // =1  // guest 0x60a13, sampled 0
6eac4914a8:    	sturb	w20, [x19, #-0xc]  // guest 0x60a13, sampled 0
6eac4914ac:    	ldr	w20, [x19, #0x38]  // guest 0x60a15, sampled 0
6eac4914b0:    	lsl	w20, w20, #2  // guest 0x60a15, sampled 0
6eac4914b4:    	str	w20, [sp, #0x88]  // guest 0x60a15, sampled 0
6eac4914b8:    	mov	w20, #0x12              // =18  // guest 0x60a15, sampled 0
6eac4914bc:    	str	w20, [x19, #0x34]  // guest 0x60a15, sampled 0
6eac4914c0:    	mov	w20, #0xf               // =15  // guest 0x60a15, sampled 0
6eac4914c4:    	str	w20, [sp, #0x8c]  // guest 0x60a15, sampled 0
6eac4914c8:    	ldr	w20, [x19, #0x18]  // guest 0x60a15, sampled 0
6eac4914cc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60a15, sampled 0
6eac4914d0:    	and	x16, x16, x20, lsr #7  // guest 0x60a15, sampled 0
6eac4914d4:    	add	x17, x17, x16  // guest 0x60a15, sampled 0
6eac4914d8:    	ldp	x16, x17, [x17]  // guest 0x60a15, sampled 0
6eac4914dc:    	and	w30, w20, #0xfffff003  // guest 0x60a15, sampled 3
6eac4914e0:    	cmp	w16, w30  // guest 0x60a15, sampled 0
6eac4914e4:    	b.ne	0x6eac491b40 <trace+0x1100>  // guest 0x60a15, sampled 0
6eac4914e8:    	add	x30, x17, w20, uxtw  // guest 0x60a15, sampled 0
6eac4914ec:    	ldapr	w21, [x30]  // guest 0x60a15, sampled 0
6eac4914f0:    	str	w21, [sp, #0x84]  // guest 0x60a15, sampled 4
6eac4914f4:    	ldr	w22, [x19, #0x1c]  // guest 0x60a15, sampled 0
6eac4914f8:    	str	w22, [sp, #0x80]  // guest 0x60a15, sampled 0
6eac4914fc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60a15, sampled 0
6eac491500:    	and	x16, x16, x22, lsr #7  // guest 0x60a15, sampled 0
6eac491504:    	add	x17, x17, x16  // guest 0x60a15, sampled 0
6eac491508:    	ldp	x17, x16, [x17, #0x8]  // guest 0x60a15, sampled 0
6eac49150c:    	and	w30, w22, #0xfffff003  // guest 0x60a15, sampled 1
6eac491510:    	cmp	w16, w30  // guest 0x60a15, sampled 2
6eac491514:    	b.ne	0x6eac491b6c <trace+0x112c>  // guest 0x60a15, sampled 0
6eac491518:    	add	x30, x17, w22, uxtw  // guest 0x60a15, sampled 0
6eac49151c:    	stlr	w21, [x30]  // guest 0x60a15, sampled 0
6eac491520:    	ldr	w21, [sp, #0x88]  // guest 0x60a15, sampled 3
6eac491524:    	add	w20, w20, w21  // guest 0x60a15, sampled 0
6eac491528:    	str	w20, [x19, #0x18]  // guest 0x60a15, sampled 0
6eac49152c:    	add	w20, w22, w21  // guest 0x60a15, sampled 0
6eac491530:    	str	w20, [x19, #0x1c]  // guest 0x60a15, sampled 0
6eac491534:    	ldr	w20, [sp, #0x8c]  // guest 0x60a15, sampled 0
6eac491538:    	str	w20, [x19, #0x4]  // guest 0x60a15, sampled 0
6eac49153c:    	sub	w20, w20, #0x1  // guest 0x60a15, sampled 0
6eac491540:    	str	w20, [sp, #0x8c]  // guest 0x60a15, sampled 0
6eac491544:    	tst	w20, #0xffff  // guest 0x60a15, sampled 0
6eac491548:    	b.ne	0x6eac4914c8 <trace+0xa88>  // guest 0x60a15, sampled 0
6eac49154c:    	cbz	w20, 0x6eac491578 <trace+0xb38>  // guest 0x60a15, sampled 0
6eac491550:    	ldr	w20, [x19, #0x24]  // guest 0x60a15, sampled 0
6eac491554:    	orr	w20, w20, #0x10000  // guest 0x60a15, sampled 0
6eac491558:    	str	w20, [x19, #0x24]  // guest 0x60a15, sampled 0
6eac49155c:    	b	0x6eac49155c <trace+0xb1c>  // guest 0x60a15, sampled 0
6eac491560:    	br	x16  // guest 0x60a15, sampled 0
6eac491564:    	mov	w20, #0xa15             // =2581  // guest 0x60a15, sampled 0
6eac491568:    	movk	w20, #0x6, lsl #16  // guest 0x60a15, sampled 0
6eac49156c:    	str	w20, [x19, #0x20]  // guest 0x60a15, sampled 0
6eac491570:    	adr	x0, 0x6eac490980 <trace+0xffffffffffffff40>  // guest 0x60a15, sampled 0
6eac491574:    	b	0x6ea842202c <trace+0xfffffffffbf915ec>  // guest 0x60a15, sampled 0
6eac491578:    	ldr	w20, [x19, #0x18]  // guest 0x60a15, sampled 0
6eac49157c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60a15, sampled 0
6eac491580:    	and	x16, x16, x20, lsr #7  // guest 0x60a15, sampled 0
6eac491584:    	add	x17, x17, x16  // guest 0x60a15, sampled 0
6eac491588:    	ldp	x16, x17, [x17]  // guest 0x60a15, sampled 0
6eac49158c:    	and	w30, w20, #0xfffff003  // guest 0x60a15, sampled 0
6eac491590:    	cmp	w16, w30  // guest 0x60a15, sampled 0
6eac491594:    	b.ne	0x6eac491b98 <trace+0x1158>  // guest 0x60a15, sampled 0
6eac491598:    	add	x30, x17, w20, uxtw  // guest 0x60a15, sampled 0
6eac49159c:    	ldapr	w21, [x30]  // guest 0x60a15, sampled 0
6eac4915a0:    	ldr	w22, [x19, #0x1c]  // guest 0x60a15, sampled 0
6eac4915a4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60a15, sampled 0
6eac4915a8:    	and	x16, x16, x22, lsr #7  // guest 0x60a15, sampled 0
6eac4915ac:    	add	x17, x17, x16  // guest 0x60a15, sampled 0
6eac4915b0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x60a15, sampled 0
6eac4915b4:    	and	w30, w22, #0xfffff003  // guest 0x60a15, sampled 0
6eac4915b8:    	cmp	w16, w30  // guest 0x60a15, sampled 0
6eac4915bc:    	b.ne	0x6eac491bc4 <trace+0x1184>  // guest 0x60a15, sampled 0
6eac4915c0:    	add	x30, x17, w22, uxtw  // guest 0x60a15, sampled 0
6eac4915c4:    	stlr	w21, [x30]  // guest 0x60a15, sampled 0
6eac4915c8:    	ldr	w21, [sp, #0x88]  // guest 0x60a15, sampled 0
6eac4915cc:    	add	w20, w20, w21  // guest 0x60a15, sampled 0
6eac4915d0:    	str	w20, [x19, #0x18]  // guest 0x60a15, sampled 0
6eac4915d4:    	add	w20, w22, w21  // guest 0x60a15, sampled 0
6eac4915d8:    	str	w20, [x19, #0x1c]  // guest 0x60a15, sampled 0
6eac4915dc:    	ldr	w20, [sp, #0x8c]  // guest 0x60a15, sampled 0
6eac4915e0:    	str	w20, [x19, #0x4]  // guest 0x60a15, sampled 0
6eac4915e4:    	b	0x6eac4915e4 <trace+0xba4>  // guest 0x60a15, sampled 0
6eac4915e8:    	br	x16  // guest 0x60a15, sampled 0
6eac4915ec:    	mov	w20, #0xa17             // =2583  // guest 0x60a15, sampled 0
6eac4915f0:    	movk	w20, #0x6, lsl #16  // guest 0x60a15, sampled 0
6eac4915f4:    	str	w20, [x19, #0x20]  // guest 0x60a15, sampled 0
6eac4915f8:    	adr	x0, 0x6eac490981 <trace+0xffffffffffffff41>  // guest 0x60a15, sampled 0
6eac4915fc:    	b	0x6ea842202c <trace+0xfffffffffbf915ec>  // guest 0x60a15, sampled 0
6eac491600:    	adr	x0, 0x6eac490983 <trace+0xffffffffffffff43>  // guest 0x60a15, sampled 0
6eac491604:    	b	0x6ea842202c <trace+0xfffffffffbf915ec>  // guest 0x60a15, sampled 0
6eac491608:    	mov	w1, w21
6eac49160c:    	mov	w2, w22
6eac491610:    	mov	x0, x19
6eac491614:    	mov	w3, #0x4045             // =16453
6eac491618:    	movk	w3, #0x1, lsl #16
6eac49161c:    	adr	x4, 0x6eac490a94 <trace+0x54>
6eac491620:    	adrp	x16, 0x6efc87d000 <trace+0x503ec000>
6eac491624:    	add	x16, x16, #0xc38
6eac491628:    	blr	x16
6eac49162c:    	dmb	ishld
6eac491630:    	b	0x6eac490a94 <trace+0x54>
6eac491634:    	mov	w1, w21
6eac491638:    	mov	w2, w22
6eac49163c:    	mov	x0, x19
6eac491640:    	mov	w3, #0x4045             // =16453
6eac491644:    	movk	w3, #0x1, lsl #16
6eac491648:    	adr	x4, 0x6eac490ac8 <trace+0x88>
6eac49164c:    	adrp	x16, 0x6efc87d000 <trace+0x503ec000>
6eac491650:    	add	x16, x16, #0xc38
6eac491654:    	blr	x16
6eac491658:    	dmb	ishld
6eac49165c:    	b	0x6eac490ac8 <trace+0x88>
6eac491660:    	mov	w1, w21
6eac491664:    	mov	w2, w22
6eac491668:    	mov	x0, x19
6eac49166c:    	mov	w3, #0x4045             // =16453
6eac491670:    	movk	w3, #0x1, lsl #16
6eac491674:    	adr	x4, 0x6eac490af8 <trace+0xb8>
6eac491678:    	adrp	x16, 0x6efc87d000 <trace+0x503ec000>
6eac49167c:    	add	x16, x16, #0xc38
6eac491680:    	blr	x16
6eac491684:    	dmb	ishld
6eac491688:    	b	0x6eac490af8 <trace+0xb8>
6eac49168c:    	mov	w1, w21
6eac491690:    	mov	x0, x19
6eac491694:    	mov	w2, #0x4045             // =16453
6eac491698:    	movk	w2, #0x1, lsl #16
6eac49169c:    	adr	x3, 0x6eac490b20 <trace+0xe0>
6eac4916a0:    	adrp	x16, 0x6efc87d000 <trace+0x503ec000>
6eac4916a4:    	add	x16, x16, #0x58
6eac4916a8:    	blr	x16
6eac4916ac:    	mov	w21, w0
6eac4916b0:    	dmb	ishld
6eac4916b4:    	b	0x6eac490b20 <trace+0xe0>
6eac4916b8:    	mov	w1, w22
6eac4916bc:    	mov	x0, x19
6eac4916c0:    	mov	w2, #0x4045             // =16453
6eac4916c4:    	movk	w2, #0x1, lsl #16
6eac4916c8:    	adr	x3, 0x6eac490b4c <trace+0x10c>
6eac4916cc:    	adrp	x16, 0x6efc87d000 <trace+0x503ec000>
6eac4916d0:    	add	x16, x16, #0x58
6eac4916d4:    	blr	x16
6eac4916d8:    	mov	w22, w0
6eac4916dc:    	dmb	ishld
6eac4916e0:    	b	0x6eac490b4c <trace+0x10c>
6eac4916e4:    	mov	w1, w21
6eac4916e8:    	mov	x0, x19
6eac4916ec:    	mov	w2, #0x4085             // =16517
6eac4916f0:    	movk	w2, #0x1, lsl #16
6eac4916f4:    	adr	x3, 0x6eac490b78 <trace+0x138>
6eac4916f8:    	adrp	x16, 0x6efc87d000 <trace+0x503ec000>
6eac4916fc:    	add	x16, x16, #0x53c
6eac491700:    	blr	x16
6eac491704:    	mov	x23, x0
6eac491708:    	mov	x24, x1
6eac49170c:    	b	0x6eac490b78 <trace+0x138>
6eac491710:    	mov	w1, w23
6eac491714:    	mov	x0, x19
6eac491718:    	mov	w2, #0x4085             // =16517
6eac49171c:    	movk	w2, #0x1, lsl #16
6eac491720:    	adr	x3, 0x6eac490bb0 <trace+0x170>
6eac491724:    	adrp	x16, 0x6efc87d000 <trace+0x503ec000>
6eac491728:    	add	x16, x16, #0x53c
6eac49172c:    	blr	x16
6eac491730:    	mov	x23, x0
6eac491734:    	mov	x24, x1
6eac491738:    	b	0x6eac490bb0 <trace+0x170>
6eac49173c:    	mov	w1, w23
6eac491740:    	mov	x0, x19
6eac491744:    	mov	w2, #0x4085             // =16517
6eac491748:    	movk	w2, #0x1, lsl #16
6eac49174c:    	adr	x3, 0x6eac490be8 <trace+0x1a8>
6eac491750:    	adrp	x16, 0x6efc87d000 <trace+0x503ec000>
6eac491754:    	add	x16, x16, #0x53c
6eac491758:    	blr	x16
6eac49175c:    	mov	x23, x0
6eac491760:    	mov	x24, x1
6eac491764:    	b	0x6eac490be8 <trace+0x1a8>
6eac491768:    	mov	w1, w21
6eac49176c:    	mov	x0, x19
6eac491770:    	mov	w2, #0x4085             // =16517
6eac491774:    	movk	w2, #0x1, lsl #16
6eac491778:    	adr	x3, 0x6eac490c20 <trace+0x1e0>
6eac49177c:    	adrp	x16, 0x6efc87d000 <trace+0x503ec000>
6eac491780:    	add	x16, x16, #0x53c
6eac491784:    	blr	x16
6eac491788:    	mov	x21, x0
6eac49178c:    	mov	x23, x1
6eac491790:    	b	0x6eac490c20 <trace+0x1e0>
6eac491794:    	mov	w1, w22
6eac491798:    	mov	x0, x19
6eac49179c:    	mov	w2, #0x4045             // =16453
6eac4917a0:    	movk	w2, #0x1, lsl #16
6eac4917a4:    	adr	x3, 0x6eac490c58 <trace+0x218>
6eac4917a8:    	adrp	x16, 0x6efc87d000 <trace+0x503ec000>
6eac4917ac:    	add	x16, x16, #0x58
6eac4917b0:    	blr	x16
6eac4917b4:    	mov	w23, w0
6eac4917b8:    	dmb	ishld
6eac4917bc:    	b	0x6eac490c58 <trace+0x218>
6eac4917c0:    	mov	w1, w23
6eac4917c4:    	mov	x0, x19
6eac4917c8:    	mov	w2, #0x4045             // =16453
6eac4917cc:    	movk	w2, #0x1, lsl #16
6eac4917d0:    	adr	x3, 0x6eac490cb8 <trace+0x278>
6eac4917d4:    	adrp	x16, 0x6efc87d000 <trace+0x503ec000>
6eac4917d8:    	add	x16, x16, #0x58
6eac4917dc:    	blr	x16
6eac4917e0:    	mov	w23, w0
6eac4917e4:    	dmb	ishld
6eac4917e8:    	b	0x6eac490cb8 <trace+0x278>
6eac4917ec:    	mov	w1, w23
6eac4917f0:    	mov	x0, x19
6eac4917f4:    	mov	w2, #0x4045             // =16453
6eac4917f8:    	movk	w2, #0x1, lsl #16
6eac4917fc:    	adr	x3, 0x6eac490d18 <trace+0x2d8>
6eac491800:    	adrp	x16, 0x6efc87d000 <trace+0x503ec000>
6eac491804:    	add	x16, x16, #0x58
6eac491808:    	blr	x16
6eac49180c:    	mov	w23, w0
6eac491810:    	dmb	ishld
6eac491814:    	b	0x6eac490d18 <trace+0x2d8>
6eac491818:    	mov	w1, w23
6eac49181c:    	mov	x0, x19
6eac491820:    	mov	w2, #0x4045             // =16453
6eac491824:    	movk	w2, #0x1, lsl #16
6eac491828:    	adr	x3, 0x6eac490d94 <trace+0x354>
6eac49182c:    	adrp	x16, 0x6efc87d000 <trace+0x503ec000>
6eac491830:    	add	x16, x16, #0x58
6eac491834:    	blr	x16
6eac491838:    	mov	w23, w0
6eac49183c:    	dmb	ishld
6eac491840:    	b	0x6eac490d94 <trace+0x354>
6eac491844:    	mov	w1, w23
6eac491848:    	mov	x0, x19
6eac49184c:    	mov	w2, #0x4045             // =16453
6eac491850:    	movk	w2, #0x1, lsl #16
6eac491854:    	adr	x3, 0x6eac490df4 <trace+0x3b4>
6eac491858:    	adrp	x16, 0x6efc87d000 <trace+0x503ec000>
6eac49185c:    	add	x16, x16, #0x58
6eac491860:    	blr	x16
6eac491864:    	mov	w23, w0
6eac491868:    	dmb	ishld
6eac49186c:    	b	0x6eac490df4 <trace+0x3b4>
6eac491870:    	mov	w1, w23
6eac491874:    	mov	x0, x19
6eac491878:    	mov	w2, #0x4045             // =16453
6eac49187c:    	movk	w2, #0x1, lsl #16
6eac491880:    	adr	x3, 0x6eac490e70 <trace+0x430>
6eac491884:    	adrp	x16, 0x6efc87d000 <trace+0x503ec000>
6eac491888:    	add	x16, x16, #0x58
6eac49188c:    	blr	x16
6eac491890:    	mov	w23, w0
6eac491894:    	dmb	ishld
6eac491898:    	b	0x6eac490e70 <trace+0x430>
6eac49189c:    	mov	w1, w23
6eac4918a0:    	mov	x0, x19
6eac4918a4:    	mov	w2, #0x4045             // =16453
6eac4918a8:    	movk	w2, #0x1, lsl #16
6eac4918ac:    	adr	x3, 0x6eac490eec <trace+0x4ac>
6eac4918b0:    	adrp	x16, 0x6efc87d000 <trace+0x503ec000>
6eac4918b4:    	add	x16, x16, #0x58
6eac4918b8:    	blr	x16
6eac4918bc:    	mov	w23, w0
6eac4918c0:    	dmb	ishld
6eac4918c4:    	b	0x6eac490eec <trace+0x4ac>
6eac4918c8:    	mov	w1, w21
6eac4918cc:    	mov	x2, x23
6eac4918d0:    	mov	x3, x24
6eac4918d4:    	mov	x0, x19
6eac4918d8:    	mov	w4, #0x4085             // =16517
6eac4918dc:    	movk	w4, #0x1, lsl #16
6eac4918e0:    	adr	x5, 0x6eac490f58 <trace+0x518>
6eac4918e4:    	adrp	x16, 0x6efc87e000 <trace+0x503ed000>
6eac4918e8:    	add	x16, x16, #0xac
6eac4918ec:    	blr	x16
6eac4918f0:    	dmb	ishld
6eac4918f4:    	b	0x6eac490f58 <trace+0x518>
6eac4918f8:    	mov	w1, w23
6eac4918fc:    	mov	x0, x19
6eac491900:    	mov	w2, #0x4045             // =16453
6eac491904:    	movk	w2, #0x1, lsl #16
6eac491908:    	adr	x3, 0x6eac490f9c <trace+0x55c>
6eac49190c:    	adrp	x16, 0x6efc87d000 <trace+0x503ec000>
6eac491910:    	add	x16, x16, #0x58
6eac491914:    	blr	x16
6eac491918:    	mov	w23, w0
6eac49191c:    	dmb	ishld
6eac491920:    	b	0x6eac490f9c <trace+0x55c>
6eac491924:    	mov	w1, w23
6eac491928:    	mov	x0, x19
6eac49192c:    	mov	w2, #0x4045             // =16453
6eac491930:    	movk	w2, #0x1, lsl #16
6eac491934:    	adr	x3, 0x6eac490ffc <trace+0x5bc>
6eac491938:    	adrp	x16, 0x6efc87d000 <trace+0x503ec000>
6eac49193c:    	add	x16, x16, #0x58
6eac491940:    	blr	x16
6eac491944:    	mov	w23, w0
6eac491948:    	dmb	ishld
6eac49194c:    	b	0x6eac490ffc <trace+0x5bc>
6eac491950:    	mov	w1, w23
6eac491954:    	mov	x0, x19
6eac491958:    	mov	w2, #0x4045             // =16453
6eac49195c:    	movk	w2, #0x1, lsl #16
6eac491960:    	adr	x3, 0x6eac491078 <trace+0x638>
6eac491964:    	adrp	x16, 0x6efc87d000 <trace+0x503ec000>
6eac491968:    	add	x16, x16, #0x58
6eac49196c:    	blr	x16
6eac491970:    	mov	w23, w0
6eac491974:    	dmb	ishld
6eac491978:    	b	0x6eac491078 <trace+0x638>
6eac49197c:    	mov	w1, w23
6eac491980:    	mov	x0, x19
6eac491984:    	mov	w2, #0x4045             // =16453
6eac491988:    	movk	w2, #0x1, lsl #16
6eac49198c:    	adr	x3, 0x6eac4910f4 <trace+0x6b4>
6eac491990:    	adrp	x16, 0x6efc87d000 <trace+0x503ec000>
6eac491994:    	add	x16, x16, #0x58
6eac491998:    	blr	x16
6eac49199c:    	mov	w23, w0
6eac4919a0:    	dmb	ishld
6eac4919a4:    	b	0x6eac4910f4 <trace+0x6b4>
6eac4919a8:    	mov	w1, w23
6eac4919ac:    	mov	x2, x24
6eac4919b0:    	mov	x3, x25
6eac4919b4:    	mov	x0, x19
6eac4919b8:    	mov	w4, #0x4085             // =16517
6eac4919bc:    	movk	w4, #0x1, lsl #16
6eac4919c0:    	adr	x5, 0x6eac491164 <trace+0x724>
6eac4919c4:    	adrp	x16, 0x6efc87e000 <trace+0x503ed000>
6eac4919c8:    	add	x16, x16, #0xac
6eac4919cc:    	blr	x16
6eac4919d0:    	dmb	ishld
6eac4919d4:    	b	0x6eac491164 <trace+0x724>
6eac4919d8:    	mov	w1, w23
6eac4919dc:    	mov	x0, x19
6eac4919e0:    	mov	w2, #0x4045             // =16453
6eac4919e4:    	movk	w2, #0x1, lsl #16
6eac4919e8:    	adr	x3, 0x6eac4911a8 <trace+0x768>
6eac4919ec:    	adrp	x16, 0x6efc87d000 <trace+0x503ec000>
6eac4919f0:    	add	x16, x16, #0x58
6eac4919f4:    	blr	x16
6eac4919f8:    	mov	w23, w0
6eac4919fc:    	dmb	ishld
6eac491a00:    	b	0x6eac4911a8 <trace+0x768>
6eac491a04:    	mov	w1, w23
6eac491a08:    	mov	x0, x19
6eac491a0c:    	mov	w2, #0x4045             // =16453
6eac491a10:    	movk	w2, #0x1, lsl #16
6eac491a14:    	adr	x3, 0x6eac491208 <trace+0x7c8>
6eac491a18:    	adrp	x16, 0x6efc87d000 <trace+0x503ec000>
6eac491a1c:    	add	x16, x16, #0x58
6eac491a20:    	blr	x16
6eac491a24:    	mov	w23, w0
6eac491a28:    	dmb	ishld
6eac491a2c:    	b	0x6eac491208 <trace+0x7c8>
6eac491a30:    	mov	w1, w23
6eac491a34:    	mov	x0, x19
6eac491a38:    	mov	w2, #0x4045             // =16453
6eac491a3c:    	movk	w2, #0x1, lsl #16
6eac491a40:    	adr	x3, 0x6eac491284 <trace+0x844>
6eac491a44:    	adrp	x16, 0x6efc87d000 <trace+0x503ed000>
6eac491a48:    	add	x16, x16, #0x58
6eac491a4c:    	blr	x16
6eac491a50:    	mov	w23, w0
6eac491a54:    	dmb	ishld
6eac491a58:    	b	0x6eac491284 <trace+0x844>
6eac491a5c:    	mov	w1, w23
6eac491a60:    	mov	x0, x19
6eac491a64:    	mov	w2, #0x4045             // =16453
6eac491a68:    	movk	w2, #0x1, lsl #16
6eac491a6c:    	adr	x3, 0x6eac491300 <trace+0x8c0>
6eac491a70:    	adrp	x16, 0x6efc87d000 <trace+0x503ed000>
6eac491a74:    	add	x16, x16, #0x58
6eac491a78:    	blr	x16
6eac491a7c:    	mov	w23, w0
6eac491a80:    	dmb	ishld
6eac491a84:    	b	0x6eac491300 <trace+0x8c0>
6eac491a88:    	mov	w1, w23
6eac491a8c:    	mov	x2, x24
6eac491a90:    	mov	x3, x25
6eac491a94:    	mov	x0, x19
6eac491a98:    	mov	w4, #0x4085             // =16517
6eac491a9c:    	movk	w4, #0x1, lsl #16
6eac491aa0:    	adr	x5, 0x6eac491370 <trace+0x930>
6eac491aa4:    	adrp	x16, 0x6efc87e000 <trace+0x503ee000>
6eac491aa8:    	add	x16, x16, #0xac
6eac491aac:    	blr	x16
6eac491ab0:    	dmb	ishld
6eac491ab4:    	b	0x6eac491370 <trace+0x930>
6eac491ab8:    	mov	w1, w22
6eac491abc:    	mov	x0, x19
6eac491ac0:    	mov	w2, #0x4045             // =16453
6eac491ac4:    	movk	w2, #0x1, lsl #16
6eac491ac8:    	adr	x3, 0x6eac4913b4 <trace+0x974>
6eac491acc:    	adrp	x16, 0x6efc87d000 <trace+0x503ed000>
6eac491ad0:    	add	x16, x16, #0x58
6eac491ad4:    	blr	x16
6eac491ad8:    	mov	w22, w0
6eac491adc:    	dmb	ishld
6eac491ae0:    	b	0x6eac4913b4 <trace+0x974>
6eac491ae4:    	mov	w1, w21
6eac491ae8:    	mov	x2, x22
6eac491aec:    	mov	x3, x23
6eac491af0:    	mov	x0, x19
6eac491af4:    	mov	w4, #0x4085             // =16517
6eac491af8:    	movk	w4, #0x1, lsl #16
6eac491afc:    	adr	x5, 0x6eac49145c <trace+0xa1c>
6eac491b00:    	adrp	x16, 0x6efc87e000 <trace+0x503ee000>
6eac491b04:    	add	x16, x16, #0xac
6eac491b08:    	blr	x16
6eac491b0c:    	dmb	ishld
6eac491b10:    	b	0x6eac49145c <trace+0xa1c>
6eac491b14:    	mov	w1, w21
6eac491b18:    	mov	x0, x19
6eac491b1c:    	mov	w2, #0x4045             // =16453
6eac491b20:    	movk	w2, #0x1, lsl #16
6eac491b24:    	adr	x3, 0x6eac491484 <trace+0xa44>
6eac491b28:    	adrp	x16, 0x6efc87d000 <trace+0x503ed000>
6eac491b2c:    	add	x16, x16, #0x58
6eac491b30:    	blr	x16
6eac491b34:    	mov	w21, w0
6eac491b38:    	dmb	ishld
6eac491b3c:    	b	0x6eac491484 <trace+0xa44>
6eac491b40:    	mov	w1, w20
6eac491b44:    	mov	x0, x19
6eac491b48:    	mov	w2, #0x4045             // =16453
6eac491b4c:    	movk	w2, #0x1, lsl #16
6eac491b50:    	adr	x3, 0x6eac4914f0 <trace+0xab0>
6eac491b54:    	adrp	x16, 0x6efc87d000 <trace+0x503ed000>
6eac491b58:    	add	x16, x16, #0x58
6eac491b5c:    	blr	x16
6eac491b60:    	mov	w21, w0
6eac491b64:    	dmb	ishld
6eac491b68:    	b	0x6eac4914f0 <trace+0xab0>
6eac491b6c:    	mov	w1, w22
6eac491b70:    	mov	w2, w21
6eac491b74:    	mov	x0, x19
6eac491b78:    	mov	w3, #0x4045             // =16453
6eac491b7c:    	movk	w3, #0x1, lsl #16
6eac491b80:    	adr	x4, 0x6eac491520 <trace+0xae0>
6eac491b84:    	adrp	x16, 0x6efc87d000 <trace+0x503ed000>
6eac491b88:    	add	x16, x16, #0xc38
6eac491b8c:    	blr	x16
6eac491b90:    	dmb	ishld
6eac491b94:    	b	0x6eac491520 <trace+0xae0>
6eac491b98:    	mov	w1, w20
6eac491b9c:    	mov	x0, x19
6eac491ba0:    	mov	w2, #0x4045             // =16453
6eac491ba4:    	movk	w2, #0x1, lsl #16
6eac491ba8:    	adr	x3, 0x6eac4915a0 <trace+0xb60>
6eac491bac:    	adrp	x16, 0x6efc87d000 <trace+0x503ed000>
6eac491bb0:    	add	x16, x16, #0x58
6eac491bb4:    	blr	x16
6eac491bb8:    	mov	w21, w0
6eac491bbc:    	dmb	ishld
6eac491bc0:    	b	0x6eac4915a0 <trace+0xb60>
6eac491bc4:    	mov	w1, w22
6eac491bc8:    	mov	w2, w21
6eac491bcc:    	mov	x0, x19
6eac491bd0:    	mov	w3, #0x4045             // =16453
6eac491bd4:    	movk	w3, #0x1, lsl #16
6eac491bd8:    	adr	x4, 0x6eac4915c8 <trace+0xb88>
6eac491bdc:    	adrp	x16, 0x6efc87d000 <trace+0x503ed000>
6eac491be0:    	add	x16, x16, #0xc38
6eac491be4:    	blr	x16
6eac491be8:    	dmb	ishld
6eac491bec:    	b	0x6eac4915c8 <trace+0xb88>