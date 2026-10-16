
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-608f0-6c4ee81bc0.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006c4ee81bc0 <trace>:
6c4ee81bc0:    	ldur	w20, [x19, #-0x10]  // guest 0x608f0, sampled 0
6c4ee81bc4:    	tbnz	w20, #0x1f, 0x6c4ee82780 <trace+0xbc0>  // guest 0x608f0, sampled 0
6c4ee81bc8:    	sturb	wzr, [x19, #-0xc]  // guest 0x608f0, sampled 0
6c4ee81bcc:    	ldr	w20, [x19, #0x10]  // guest 0x608f0, sampled 0
6c4ee81bd0:    	sub	w20, w20, #0x44  // guest 0x608f0, sampled 0
6c4ee81bd4:    	str	w20, [x19, #0x10]  // guest 0x608f0, sampled 0
6c4ee81bd8:    	str	w20, [x19, #0x28]  // guest 0x608f0, sampled 0
6c4ee81bdc:    	mov	w21, #0x44              // =68  // guest 0x608f0, sampled 0
6c4ee81be0:    	str	w21, [x19, #0x2c]  // guest 0x608f0, sampled 0
6c4ee81be4:    	sub	w20, w20, #0x4  // guest 0x608f3, sampled 0
6c4ee81be8:    	mov	w21, w20  // guest 0x608f3, sampled 0
6c4ee81bec:    	ldr	w22, [x19, #0x18]  // guest 0x608f3, sampled 0
6c4ee81bf0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x608f3, sampled 0
6c4ee81bf4:    	and	x16, x16, x21, lsr #7  // guest 0x608f3, sampled 0
6c4ee81bf8:    	add	x17, x17, x16  // guest 0x608f3, sampled 0
6c4ee81bfc:    	ldp	x17, x16, [x17, #0x8]  // guest 0x608f3, sampled 0
6c4ee81c00:    	and	w30, w21, #0xfffff003  // guest 0x608f3, sampled 0
6c4ee81c04:    	cmp	w16, w30  // guest 0x608f3, sampled 0
6c4ee81c08:    	b.ne	0x6c4ee82788 <trace+0xbc8>  // guest 0x608f3, sampled 0
6c4ee81c0c:    	add	x30, x17, w21, uxtw  // guest 0x608f3, sampled 0
6c4ee81c10:    	stlr	w22, [x30]  // guest 0x608f3, sampled 0
6c4ee81c14:    	str	w20, [x19, #0x10]  // guest 0x608f3, sampled 0
6c4ee81c18:    	sub	w20, w20, #0x4  // guest 0x608f4, sampled 0
6c4ee81c1c:    	mov	w21, w20  // guest 0x608f4, sampled 0
6c4ee81c20:    	ldr	w22, [x19, #0x1c]  // guest 0x608f4, sampled 0
6c4ee81c24:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x608f4, sampled 0
6c4ee81c28:    	and	x16, x16, x21, lsr #7  // guest 0x608f4, sampled 0
6c4ee81c2c:    	add	x17, x17, x16  // guest 0x608f4, sampled 0
6c4ee81c30:    	ldp	x17, x16, [x17, #0x8]  // guest 0x608f4, sampled 0
6c4ee81c34:    	and	w30, w21, #0xfffff003  // guest 0x608f4, sampled 0
6c4ee81c38:    	cmp	w16, w30  // guest 0x608f4, sampled 0
6c4ee81c3c:    	b.ne	0x6c4ee827b4 <trace+0xbf4>  // guest 0x608f4, sampled 0
6c4ee81c40:    	add	x30, x17, w21, uxtw  // guest 0x608f4, sampled 0
6c4ee81c44:    	stlr	w22, [x30]  // guest 0x608f4, sampled 0
6c4ee81c48:    	str	w20, [x19, #0x10]  // guest 0x608f4, sampled 1
6c4ee81c4c:    	add	w21, w20, #0x8  // guest 0x608f5, sampled 0
6c4ee81c50:    	ldr	w22, [x19, #0x4]  // guest 0x608f5, sampled 0
6c4ee81c54:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x608f5, sampled 0
6c4ee81c58:    	and	x16, x16, x21, lsr #7  // guest 0x608f5, sampled 0
6c4ee81c5c:    	add	x17, x17, x16  // guest 0x608f5, sampled 0
6c4ee81c60:    	ldp	x17, x16, [x17, #0x8]  // guest 0x608f5, sampled 0
6c4ee81c64:    	and	w30, w21, #0xfffff003  // guest 0x608f5, sampled 0
6c4ee81c68:    	cmp	w16, w30  // guest 0x608f5, sampled 0
6c4ee81c6c:    	b.ne	0x6c4ee827e0 <trace+0xc20>  // guest 0x608f5, sampled 0
6c4ee81c70:    	add	x30, x17, w21, uxtw  // guest 0x608f5, sampled 1
6c4ee81c74:    	stlr	w22, [x30]  // guest 0x608f5, sampled 0
6c4ee81c78:    	add	w21, w20, #0x54  // guest 0x608f9, sampled 0
6c4ee81c7c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x608f9, sampled 0
6c4ee81c80:    	and	x16, x16, x21, lsr #7  // guest 0x608f9, sampled 0
6c4ee81c84:    	add	x17, x17, x16  // guest 0x608f9, sampled 0
6c4ee81c88:    	ldp	x16, x17, [x17]  // guest 0x608f9, sampled 0
6c4ee81c8c:    	and	w30, w21, #0xfffff003  // guest 0x608f9, sampled 0
6c4ee81c90:    	cmp	w16, w30  // guest 0x608f9, sampled 0
6c4ee81c94:    	b.ne	0x6c4ee8280c <trace+0xc4c>  // guest 0x608f9, sampled 0
6c4ee81c98:    	add	x30, x17, w21, uxtw  // guest 0x608f9, sampled 0
6c4ee81c9c:    	ldapr	w21, [x30]  // guest 0x608f9, sampled 0
6c4ee81ca0:    	str	w21, [x19]  // guest 0x608f9, sampled 0
6c4ee81ca4:    	add	w22, w20, #0x8  // guest 0x608fd, sampled 0
6c4ee81ca8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x608fd, sampled 0
6c4ee81cac:    	and	x16, x16, x22, lsr #7  // guest 0x608fd, sampled 0
6c4ee81cb0:    	add	x17, x17, x16  // guest 0x608fd, sampled 0
6c4ee81cb4:    	ldp	x16, x17, [x17]  // guest 0x608fd, sampled 0
6c4ee81cb8:    	and	w30, w22, #0xfffff003  // guest 0x608fd, sampled 0
6c4ee81cbc:    	cmp	w16, w30  // guest 0x608fd, sampled 0
6c4ee81cc0:    	b.ne	0x6c4ee82838 <trace+0xc78>  // guest 0x608fd, sampled 0
6c4ee81cc4:    	add	x30, x17, w22, uxtw  // guest 0x608fd, sampled 0
6c4ee81cc8:    	ldapr	w22, [x30]  // guest 0x608fd, sampled 0
6c4ee81ccc:    	str	w22, [x19, #0x4]  // guest 0x608fd, sampled 0
6c4ee81cd0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60901, sampled 0
6c4ee81cd4:    	and	x16, x16, x21, lsr #7  // guest 0x60901, sampled 0
6c4ee81cd8:    	add	x17, x17, x16  // guest 0x60901, sampled 0
6c4ee81cdc:    	ldp	x16, x17, [x17]  // guest 0x60901, sampled 0
6c4ee81ce0:    	add	w30, w21, #0xf  // guest 0x60901, sampled 0
6c4ee81ce4:    	and	w30, w30, #0xfffff000  // guest 0x60901, sampled 0
6c4ee81ce8:    	cmp	w16, w30  // guest 0x60901, sampled 0
6c4ee81cec:    	b.ne	0x6c4ee82864 <trace+0xca4>  // guest 0x60901, sampled 0
6c4ee81cf0:    	add	x30, x17, w21, uxtw  // guest 0x60901, sampled 0
6c4ee81cf4:    	ldp	x23, x24, [x30]  // guest 0x60901, sampled 0
6c4ee81cf8:    	dmb	ishld  // guest 0x60901, sampled 0
6c4ee81cfc:    	str	x23, [x19, #0x3b0]  // guest 0x60901, sampled 0
6c4ee81d00:    	str	x24, [x19, #0x3b8]  // guest 0x60901, sampled 0
6c4ee81d04:    	add	w23, w21, #0x10  // guest 0x60904, sampled 0
6c4ee81d08:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60904, sampled 0
6c4ee81d0c:    	and	x16, x16, x23, lsr #7  // guest 0x60904, sampled 0
6c4ee81d10:    	add	x17, x17, x16  // guest 0x60904, sampled 0
6c4ee81d14:    	ldp	x16, x17, [x17]  // guest 0x60904, sampled 0
6c4ee81d18:    	add	w30, w23, #0xf  // guest 0x60904, sampled 0
6c4ee81d1c:    	and	w30, w30, #0xfffff000  // guest 0x60904, sampled 0
6c4ee81d20:    	cmp	w16, w30  // guest 0x60904, sampled 0
6c4ee81d24:    	b.ne	0x6c4ee82890 <trace+0xcd0>  // guest 0x60904, sampled 0
6c4ee81d28:    	add	x30, x17, w23, uxtw  // guest 0x60904, sampled 0
6c4ee81d2c:    	ldp	x23, x24, [x30]  // guest 0x60904, sampled 0
6c4ee81d30:    	dmb	ishld  // guest 0x60904, sampled 0
6c4ee81d34:    	str	x23, [x19, #0x3f0]  // guest 0x60904, sampled 0
6c4ee81d38:    	str	x24, [x19, #0x3f8]  // guest 0x60904, sampled 0
6c4ee81d3c:    	add	w23, w21, #0x20  // guest 0x60908, sampled 0
6c4ee81d40:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60908, sampled 0
6c4ee81d44:    	and	x16, x16, x23, lsr #7  // guest 0x60908, sampled 0
6c4ee81d48:    	add	x17, x17, x16  // guest 0x60908, sampled 0
6c4ee81d4c:    	ldp	x16, x17, [x17]  // guest 0x60908, sampled 0
6c4ee81d50:    	add	w30, w23, #0xf  // guest 0x60908, sampled 0
6c4ee81d54:    	and	w30, w30, #0xfffff000  // guest 0x60908, sampled 0
6c4ee81d58:    	cmp	w16, w30  // guest 0x60908, sampled 0
6c4ee81d5c:    	b.ne	0x6c4ee828bc <trace+0xcfc>  // guest 0x60908, sampled 0
6c4ee81d60:    	add	x30, x17, w23, uxtw  // guest 0x60908, sampled 0
6c4ee81d64:    	ldp	x23, x24, [x30]  // guest 0x60908, sampled 0
6c4ee81d68:    	dmb	ishld  // guest 0x60908, sampled 0
6c4ee81d6c:    	str	x23, [x19, #0x430]  // guest 0x60908, sampled 0
6c4ee81d70:    	str	x24, [x19, #0x438]  // guest 0x60908, sampled 0
6c4ee81d74:    	add	w21, w21, #0x30  // guest 0x6090c, sampled 0
6c4ee81d78:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x6090c, sampled 0
6c4ee81d7c:    	and	x16, x16, x21, lsr #7  // guest 0x6090c, sampled 0
6c4ee81d80:    	add	x17, x17, x16  // guest 0x6090c, sampled 0
6c4ee81d84:    	ldp	x16, x17, [x17]  // guest 0x6090c, sampled 0
6c4ee81d88:    	add	w30, w21, #0xf  // guest 0x6090c, sampled 0
6c4ee81d8c:    	and	w30, w30, #0xfffff000  // guest 0x6090c, sampled 0
6c4ee81d90:    	cmp	w16, w30  // guest 0x6090c, sampled 0
6c4ee81d94:    	b.ne	0x6c4ee828e8 <trace+0xd28>  // guest 0x6090c, sampled 0
6c4ee81d98:    	add	x30, x17, w21, uxtw  // guest 0x6090c, sampled 0
6c4ee81d9c:    	ldp	x21, x23, [x30]  // guest 0x6090c, sampled 0
6c4ee81da0:    	dmb	ishld  // guest 0x6090c, sampled 0
6c4ee81da4:    	str	x21, [x19, #0x470]  // guest 0x6090c, sampled 1
6c4ee81da8:    	str	x23, [x19, #0x478]  // guest 0x6090c, sampled 0
6c4ee81dac:    	add	w21, w20, #0xc  // guest 0x60910, sampled 0
6c4ee81db0:    	str	w21, [x19]  // guest 0x60910, sampled 0
6c4ee81db4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60914, sampled 0
6c4ee81db8:    	and	x16, x16, x22, lsr #7  // guest 0x60914, sampled 0
6c4ee81dbc:    	add	x17, x17, x16  // guest 0x60914, sampled 0
6c4ee81dc0:    	ldp	x16, x17, [x17]  // guest 0x60914, sampled 0
6c4ee81dc4:    	and	w30, w22, #0xfffff003  // guest 0x60914, sampled 0
6c4ee81dc8:    	cmp	w16, w30  // guest 0x60914, sampled 0
6c4ee81dcc:    	b.ne	0x6c4ee82914 <trace+0xd54>  // guest 0x60914, sampled 0
6c4ee81dd0:    	add	x30, x17, w22, uxtw  // guest 0x60914, sampled 0
6c4ee81dd4:    	ldapr	w23, [x30]  // guest 0x60914, sampled 0
6c4ee81dd8:    	movi	v0.16b, #0x0  // guest 0x60914, sampled 0
6c4ee81ddc:    	str	q0, [x19, #0x2b0]  // guest 0x60914, sampled 0
6c4ee81de0:    	add	x24, x19, #0x2b0  // guest 0x60914, sampled 0
6c4ee81de4:    	str	w23, [x24]  // guest 0x60914, sampled 0
6c4ee81de8:    	add	x16, x19, #0x2b0  // guest 0x60918, sampled 0
6c4ee81dec:    	ld1r	{ v1.4s }, [x16]  // guest 0x60918, sampled 0
6c4ee81df0:    	str	q1, [x19, #0x2b0]  // guest 0x60918, sampled 0
6c4ee81df4:    	add	x1, x19, #0x2b0  // guest 0x6091c, sampled 0
6c4ee81df8:    	add	x2, x19, #0x2b0  // guest 0x6091c, sampled 0
6c4ee81dfc:    	add	x3, x19, #0x3b0  // guest 0x6091c, sampled 0
6c4ee81e00:    	mov	x0, x19  // guest 0x6091c, sampled 0
6c4ee81e04:    	adrp	x16, 0x6c9775e000 <trace+0x488dd000>  // guest 0x6091c, sampled 0
6c4ee81e08:    	add	x16, x16, #0xfb8  // guest 0x6091c, sampled 0
6c4ee81e0c:    	blr	x16  // guest 0x6091c, sampled 0
6c4ee81e10:    	add	w23, w22, #0x4  // guest 0x6091f, sampled 0
6c4ee81e14:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x6091f, sampled 0
6c4ee81e18:    	and	x16, x16, x23, lsr #7  // guest 0x6091f, sampled 0
6c4ee81e1c:    	add	x17, x17, x16  // guest 0x6091f, sampled 0
6c4ee81e20:    	ldp	x16, x17, [x17]  // guest 0x6091f, sampled 0
6c4ee81e24:    	and	w30, w23, #0xfffff003  // guest 0x6091f, sampled 0
6c4ee81e28:    	cmp	w16, w30  // guest 0x6091f, sampled 0
6c4ee81e2c:    	b.ne	0x6c4ee82940 <trace+0xd80>  // guest 0x6091f, sampled 0
6c4ee81e30:    	add	x30, x17, w23, uxtw  // guest 0x6091f, sampled 0
6c4ee81e34:    	ldapr	w23, [x30]  // guest 0x6091f, sampled 0
6c4ee81e38:    	movi	v0.16b, #0x0  // guest 0x6091f, sampled 0
6c4ee81e3c:    	str	q0, [x19, #0x2f0]  // guest 0x6091f, sampled 0
6c4ee81e40:    	add	x24, x19, #0x2f0  // guest 0x6091f, sampled 0
6c4ee81e44:    	str	w23, [x24]  // guest 0x6091f, sampled 0
6c4ee81e48:    	add	x16, x19, #0x2f0  // guest 0x60924, sampled 0
6c4ee81e4c:    	ld1r	{ v1.4s }, [x16]  // guest 0x60924, sampled 0
6c4ee81e50:    	str	q1, [x19, #0x2f0]  // guest 0x60924, sampled 0
6c4ee81e54:    	add	x1, x19, #0x2f0  // guest 0x60928, sampled 0
6c4ee81e58:    	add	x2, x19, #0x2f0  // guest 0x60928, sampled 0
6c4ee81e5c:    	add	x3, x19, #0x3f0  // guest 0x60928, sampled 0
6c4ee81e60:    	mov	x0, x19  // guest 0x60928, sampled 0
6c4ee81e64:    	adrp	x16, 0x6c9775e000 <trace+0x488dd000>  // guest 0x60928, sampled 0
6c4ee81e68:    	add	x16, x16, #0xfb8  // guest 0x60928, sampled 0
6c4ee81e6c:    	blr	x16  // guest 0x60928, sampled 0
6c4ee81e70:    	add	w23, w22, #0x8  // guest 0x6092b, sampled 0
6c4ee81e74:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x6092b, sampled 0
6c4ee81e78:    	and	x16, x16, x23, lsr #7  // guest 0x6092b, sampled 0
6c4ee81e7c:    	add	x17, x17, x16  // guest 0x6092b, sampled 0
6c4ee81e80:    	ldp	x16, x17, [x17]  // guest 0x6092b, sampled 0
6c4ee81e84:    	and	w30, w23, #0xfffff003  // guest 0x6092b, sampled 0
6c4ee81e88:    	cmp	w16, w30  // guest 0x6092b, sampled 0
6c4ee81e8c:    	b.ne	0x6c4ee8296c <trace+0xdac>  // guest 0x6092b, sampled 0
6c4ee81e90:    	add	x30, x17, w23, uxtw  // guest 0x6092b, sampled 0
6c4ee81e94:    	ldapr	w23, [x30]  // guest 0x6092b, sampled 0
6c4ee81e98:    	movi	v0.16b, #0x0  // guest 0x6092b, sampled 0
6c4ee81e9c:    	str	q0, [x19, #0x330]  // guest 0x6092b, sampled 0
6c4ee81ea0:    	add	x24, x19, #0x330  // guest 0x6092b, sampled 0
6c4ee81ea4:    	str	w23, [x24]  // guest 0x6092b, sampled 0
6c4ee81ea8:    	add	x16, x19, #0x330  // guest 0x60930, sampled 0
6c4ee81eac:    	ld1r	{ v1.4s }, [x16]  // guest 0x60930, sampled 0
6c4ee81eb0:    	str	q1, [x19, #0x330]  // guest 0x60930, sampled 0
6c4ee81eb4:    	add	x1, x19, #0x330  // guest 0x60934, sampled 0
6c4ee81eb8:    	add	x2, x19, #0x330  // guest 0x60934, sampled 0
6c4ee81ebc:    	add	x3, x19, #0x430  // guest 0x60934, sampled 0
6c4ee81ec0:    	mov	x0, x19  // guest 0x60934, sampled 0
6c4ee81ec4:    	adrp	x16, 0x6c9775e000 <trace+0x488dd000>  // guest 0x60934, sampled 0
6c4ee81ec8:    	add	x16, x16, #0xfb8  // guest 0x60934, sampled 0
6c4ee81ecc:    	blr	x16  // guest 0x60934, sampled 0
6c4ee81ed0:    	add	x1, x19, #0x2f0  // guest 0x60937, sampled 0
6c4ee81ed4:    	add	x2, x19, #0x2f0  // guest 0x60937, sampled 0
6c4ee81ed8:    	add	x3, x19, #0x2b0  // guest 0x60937, sampled 0
6c4ee81edc:    	mov	x0, x19  // guest 0x60937, sampled 0
6c4ee81ee0:    	adrp	x16, 0x6c9775e000 <trace+0x488dd000>  // guest 0x60937, sampled 0
6c4ee81ee4:    	add	x16, x16, #0xc38  // guest 0x60937, sampled 0
6c4ee81ee8:    	blr	x16  // guest 0x60937, sampled 0
6c4ee81eec:    	add	w23, w22, #0xc  // guest 0x6093a, sampled 0
6c4ee81ef0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x6093a, sampled 0
6c4ee81ef4:    	and	x16, x16, x23, lsr #7  // guest 0x6093a, sampled 0
6c4ee81ef8:    	add	x17, x17, x16  // guest 0x6093a, sampled 0
6c4ee81efc:    	ldp	x16, x17, [x17]  // guest 0x6093a, sampled 0
6c4ee81f00:    	and	w30, w23, #0xfffff003  // guest 0x6093a, sampled 0
6c4ee81f04:    	cmp	w16, w30  // guest 0x6093a, sampled 0
6c4ee81f08:    	b.ne	0x6c4ee82998 <trace+0xdd8>  // guest 0x6093a, sampled 0
6c4ee81f0c:    	add	x30, x17, w23, uxtw  // guest 0x6093a, sampled 0
6c4ee81f10:    	ldapr	w23, [x30]  // guest 0x6093a, sampled 0
6c4ee81f14:    	movi	v0.16b, #0x0  // guest 0x6093a, sampled 0
6c4ee81f18:    	str	q0, [x19, #0x370]  // guest 0x6093a, sampled 0
6c4ee81f1c:    	add	x24, x19, #0x370  // guest 0x6093a, sampled 0
6c4ee81f20:    	str	w23, [x24]  // guest 0x6093a, sampled 0
6c4ee81f24:    	add	x16, x19, #0x370  // guest 0x6093f, sampled 0
6c4ee81f28:    	ld1r	{ v1.4s }, [x16]  // guest 0x6093f, sampled 0
6c4ee81f2c:    	str	q1, [x19, #0x370]  // guest 0x6093f, sampled 0
6c4ee81f30:    	add	x1, x19, #0x370  // guest 0x60943, sampled 0
6c4ee81f34:    	add	x2, x19, #0x370  // guest 0x60943, sampled 0
6c4ee81f38:    	add	x3, x19, #0x470  // guest 0x60943, sampled 0
6c4ee81f3c:    	mov	x0, x19  // guest 0x60943, sampled 0
6c4ee81f40:    	adrp	x16, 0x6c9775e000 <trace+0x488dd000>  // guest 0x60943, sampled 0
6c4ee81f44:    	add	x16, x16, #0xfb8  // guest 0x60943, sampled 0
6c4ee81f48:    	blr	x16  // guest 0x60943, sampled 0
6c4ee81f4c:    	add	w23, w22, #0x10  // guest 0x60946, sampled 0
6c4ee81f50:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60946, sampled 0
6c4ee81f54:    	and	x16, x16, x23, lsr #7  // guest 0x60946, sampled 0
6c4ee81f58:    	add	x17, x17, x16  // guest 0x60946, sampled 0
6c4ee81f5c:    	ldp	x16, x17, [x17]  // guest 0x60946, sampled 0
6c4ee81f60:    	and	w30, w23, #0xfffff003  // guest 0x60946, sampled 0
6c4ee81f64:    	cmp	w16, w30  // guest 0x60946, sampled 0
6c4ee81f68:    	b.ne	0x6c4ee829c4 <trace+0xe04>  // guest 0x60946, sampled 0
6c4ee81f6c:    	add	x30, x17, w23, uxtw  // guest 0x60946, sampled 0
6c4ee81f70:    	ldapr	w23, [x30]  // guest 0x60946, sampled 0
6c4ee81f74:    	movi	v0.16b, #0x0  // guest 0x60946, sampled 0
6c4ee81f78:    	str	q0, [x19, #0x2b0]  // guest 0x60946, sampled 0
6c4ee81f7c:    	add	x24, x19, #0x2b0  // guest 0x60946, sampled 0
6c4ee81f80:    	str	w23, [x24]  // guest 0x60946, sampled 0
6c4ee81f84:    	add	x16, x19, #0x2b0  // guest 0x6094b, sampled 0
6c4ee81f88:    	ld1r	{ v1.4s }, [x16]  // guest 0x6094b, sampled 0
6c4ee81f8c:    	str	q1, [x19, #0x2b0]  // guest 0x6094b, sampled 0
6c4ee81f90:    	add	x1, x19, #0x2b0  // guest 0x6094f, sampled 0
6c4ee81f94:    	add	x2, x19, #0x2b0  // guest 0x6094f, sampled 0
6c4ee81f98:    	add	x3, x19, #0x3b0  // guest 0x6094f, sampled 0
6c4ee81f9c:    	mov	x0, x19  // guest 0x6094f, sampled 0
6c4ee81fa0:    	adrp	x16, 0x6c9775e000 <trace+0x488dd000>  // guest 0x6094f, sampled 0
6c4ee81fa4:    	add	x16, x16, #0xfb8  // guest 0x6094f, sampled 0
6c4ee81fa8:    	blr	x16  // guest 0x6094f, sampled 0
6c4ee81fac:    	add	x1, x19, #0x370  // guest 0x60952, sampled 0
6c4ee81fb0:    	add	x2, x19, #0x370  // guest 0x60952, sampled 0
6c4ee81fb4:    	add	x3, x19, #0x330  // guest 0x60952, sampled 0
6c4ee81fb8:    	mov	x0, x19  // guest 0x60952, sampled 0
6c4ee81fbc:    	adrp	x16, 0x6c9775e000 <trace+0x488dd000>  // guest 0x60952, sampled 0
6c4ee81fc0:    	add	x16, x16, #0xc38  // guest 0x60952, sampled 0
6c4ee81fc4:    	blr	x16  // guest 0x60952, sampled 0
6c4ee81fc8:    	add	w23, w22, #0x14  // guest 0x60955, sampled 0
6c4ee81fcc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60955, sampled 0
6c4ee81fd0:    	and	x16, x16, x23, lsr #7  // guest 0x60955, sampled 0
6c4ee81fd4:    	add	x17, x17, x16  // guest 0x60955, sampled 0
6c4ee81fd8:    	ldp	x16, x17, [x17]  // guest 0x60955, sampled 0
6c4ee81fdc:    	and	w30, w23, #0xfffff003  // guest 0x60955, sampled 0
6c4ee81fe0:    	cmp	w16, w30  // guest 0x60955, sampled 0
6c4ee81fe4:    	b.ne	0x6c4ee829f0 <trace+0xe30>  // guest 0x60955, sampled 0
6c4ee81fe8:    	add	x30, x17, w23, uxtw  // guest 0x60955, sampled 0
6c4ee81fec:    	ldapr	w23, [x30]  // guest 0x60955, sampled 0
6c4ee81ff0:    	movi	v0.16b, #0x0  // guest 0x60955, sampled 1
6c4ee81ff4:    	str	q0, [x19, #0x330]  // guest 0x60955, sampled 0
6c4ee81ff8:    	add	x24, x19, #0x330  // guest 0x60955, sampled 0
6c4ee81ffc:    	str	w23, [x24]  // guest 0x60955, sampled 0
6c4ee82000:    	add	x16, x19, #0x330  // guest 0x6095a, sampled 0
6c4ee82004:    	ld1r	{ v1.4s }, [x16]  // guest 0x6095a, sampled 0
6c4ee82008:    	str	q1, [x19, #0x330]  // guest 0x6095a, sampled 1
6c4ee8200c:    	add	x1, x19, #0x330  // guest 0x6095e, sampled 0
6c4ee82010:    	add	x2, x19, #0x330  // guest 0x6095e, sampled 0
6c4ee82014:    	add	x3, x19, #0x3f0  // guest 0x6095e, sampled 0
6c4ee82018:    	mov	x0, x19  // guest 0x6095e, sampled 0
6c4ee8201c:    	adrp	x16, 0x6c9775e000 <trace+0x488dc000>  // guest 0x6095e, sampled 0
6c4ee82020:    	add	x16, x16, #0xfb8  // guest 0x6095e, sampled 0
6c4ee82024:    	blr	x16  // guest 0x6095e, sampled 0
6c4ee82028:    	add	x1, x19, #0x370  // guest 0x60961, sampled 0
6c4ee8202c:    	add	x2, x19, #0x370  // guest 0x60961, sampled 0
6c4ee82030:    	add	x3, x19, #0x2f0  // guest 0x60961, sampled 0
6c4ee82034:    	mov	x0, x19  // guest 0x60961, sampled 0
6c4ee82038:    	adrp	x16, 0x6c9775e000 <trace+0x488dc000>  // guest 0x60961, sampled 0
6c4ee8203c:    	add	x16, x16, #0xc38  // guest 0x60961, sampled 0
6c4ee82040:    	blr	x16  // guest 0x60961, sampled 0
6c4ee82044:    	add	w23, w22, #0x18  // guest 0x60964, sampled 0
6c4ee82048:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60964, sampled 0
6c4ee8204c:    	and	x16, x16, x23, lsr #7  // guest 0x60964, sampled 0
6c4ee82050:    	add	x17, x17, x16  // guest 0x60964, sampled 0
6c4ee82054:    	ldp	x16, x17, [x17]  // guest 0x60964, sampled 0
6c4ee82058:    	and	w30, w23, #0xfffff003  // guest 0x60964, sampled 1
6c4ee8205c:    	cmp	w16, w30  // guest 0x60964, sampled 0
6c4ee82060:    	b.ne	0x6c4ee82a1c <trace+0xe5c>  // guest 0x60964, sampled 0
6c4ee82064:    	add	x30, x17, w23, uxtw  // guest 0x60964, sampled 0
6c4ee82068:    	ldapr	w23, [x30]  // guest 0x60964, sampled 0
6c4ee8206c:    	movi	v0.16b, #0x0  // guest 0x60964, sampled 0
6c4ee82070:    	str	q0, [x19, #0x2f0]  // guest 0x60964, sampled 0
6c4ee82074:    	add	x24, x19, #0x2f0  // guest 0x60964, sampled 0
6c4ee82078:    	str	w23, [x24]  // guest 0x60964, sampled 0
6c4ee8207c:    	add	x16, x19, #0x2f0  // guest 0x60969, sampled 0
6c4ee82080:    	ld1r	{ v1.4s }, [x16]  // guest 0x60969, sampled 0
6c4ee82084:    	str	q1, [x19, #0x2f0]  // guest 0x60969, sampled 0
6c4ee82088:    	add	x1, x19, #0x2f0  // guest 0x6096d, sampled 0
6c4ee8208c:    	add	x2, x19, #0x2f0  // guest 0x6096d, sampled 0
6c4ee82090:    	add	x3, x19, #0x430  // guest 0x6096d, sampled 0
6c4ee82094:    	mov	x0, x19  // guest 0x6096d, sampled 0
6c4ee82098:    	adrp	x16, 0x6c9775e000 <trace+0x488dc000>  // guest 0x6096d, sampled 0
6c4ee8209c:    	add	x16, x16, #0xfb8  // guest 0x6096d, sampled 0
6c4ee820a0:    	blr	x16  // guest 0x6096d, sampled 0
6c4ee820a4:    	ldr	x23, [x19, #0x370]  // guest 0x60970, sampled 0
6c4ee820a8:    	ldr	x24, [x19, #0x378]  // guest 0x60970, sampled 0
6c4ee820ac:    	dmb	ishst  // guest 0x60970, sampled 0
6c4ee820b0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60970, sampled 0
6c4ee820b4:    	and	x16, x16, x21, lsr #7  // guest 0x60970, sampled 0
6c4ee820b8:    	add	x17, x17, x16  // guest 0x60970, sampled 0
6c4ee820bc:    	ldp	x17, x16, [x17, #0x8]  // guest 0x60970, sampled 0
6c4ee820c0:    	add	w30, w21, #0xf  // guest 0x60970, sampled 0
6c4ee820c4:    	and	w30, w30, #0xfffff000  // guest 0x60970, sampled 0
6c4ee820c8:    	cmp	w16, w30  // guest 0x60970, sampled 0
6c4ee820cc:    	b.ne	0x6c4ee82a48 <trace+0xe88>  // guest 0x60970, sampled 0
6c4ee820d0:    	add	x30, x17, w21, uxtw  // guest 0x60970, sampled 0
6c4ee820d4:    	stp	x23, x24, [x30]  // guest 0x60970, sampled 0
6c4ee820d8:    	add	x1, x19, #0x330  // guest 0x60973, sampled 0
6c4ee820dc:    	add	x2, x19, #0x330  // guest 0x60973, sampled 0
6c4ee820e0:    	add	x3, x19, #0x2b0  // guest 0x60973, sampled 0
6c4ee820e4:    	mov	x0, x19  // guest 0x60973, sampled 0
6c4ee820e8:    	adrp	x16, 0x6c9775e000 <trace+0x488dc000>  // guest 0x60973, sampled 0
6c4ee820ec:    	add	x16, x16, #0xc38  // guest 0x60973, sampled 0
6c4ee820f0:    	blr	x16  // guest 0x60973, sampled 0
6c4ee820f4:    	add	w23, w22, #0x1c  // guest 0x60976, sampled 0
6c4ee820f8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60976, sampled 0
6c4ee820fc:    	and	x16, x16, x23, lsr #7  // guest 0x60976, sampled 0
6c4ee82100:    	add	x17, x17, x16  // guest 0x60976, sampled 0
6c4ee82104:    	ldp	x16, x17, [x17]  // guest 0x60976, sampled 0
6c4ee82108:    	and	w30, w23, #0xfffff003  // guest 0x60976, sampled 1
6c4ee8210c:    	cmp	w16, w30  // guest 0x60976, sampled 0
6c4ee82110:    	b.ne	0x6c4ee82a78 <trace+0xeb8>  // guest 0x60976, sampled 0
6c4ee82114:    	add	x30, x17, w23, uxtw  // guest 0x60976, sampled 0
6c4ee82118:    	ldapr	w23, [x30]  // guest 0x60976, sampled 0
6c4ee8211c:    	movi	v0.16b, #0x0  // guest 0x60976, sampled 0
6c4ee82120:    	str	q0, [x19, #0x370]  // guest 0x60976, sampled 0
6c4ee82124:    	add	x24, x19, #0x370  // guest 0x60976, sampled 0
6c4ee82128:    	str	w23, [x24]  // guest 0x60976, sampled 0
6c4ee8212c:    	add	x16, x19, #0x370  // guest 0x6097b, sampled 0
6c4ee82130:    	ld1r	{ v1.4s }, [x16]  // guest 0x6097b, sampled 1
6c4ee82134:    	str	q1, [x19, #0x370]  // guest 0x6097b, sampled 0
6c4ee82138:    	add	x1, x19, #0x370  // guest 0x6097f, sampled 0
6c4ee8213c:    	add	x2, x19, #0x370  // guest 0x6097f, sampled 0
6c4ee82140:    	add	x3, x19, #0x470  // guest 0x6097f, sampled 0
6c4ee82144:    	mov	x0, x19  // guest 0x6097f, sampled 0
6c4ee82148:    	adrp	x16, 0x6c9775e000 <trace+0x488dc000>  // guest 0x6097f, sampled 0
6c4ee8214c:    	add	x16, x16, #0xfb8  // guest 0x6097f, sampled 0
6c4ee82150:    	blr	x16  // guest 0x6097f, sampled 0
6c4ee82154:    	add	w23, w22, #0x20  // guest 0x60982, sampled 0
6c4ee82158:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60982, sampled 0
6c4ee8215c:    	and	x16, x16, x23, lsr #7  // guest 0x60982, sampled 0
6c4ee82160:    	add	x17, x17, x16  // guest 0x60982, sampled 0
6c4ee82164:    	ldp	x16, x17, [x17]  // guest 0x60982, sampled 0
6c4ee82168:    	and	w30, w23, #0xfffff003  // guest 0x60982, sampled 0
6c4ee8216c:    	cmp	w16, w30  // guest 0x60982, sampled 0
6c4ee82170:    	b.ne	0x6c4ee82aa4 <trace+0xee4>  // guest 0x60982, sampled 0
6c4ee82174:    	add	x30, x17, w23, uxtw  // guest 0x60982, sampled 0
6c4ee82178:    	ldapr	w23, [x30]  // guest 0x60982, sampled 0
6c4ee8217c:    	movi	v0.16b, #0x0  // guest 0x60982, sampled 0
6c4ee82180:    	str	q0, [x19, #0x2b0]  // guest 0x60982, sampled 0
6c4ee82184:    	add	x24, x19, #0x2b0  // guest 0x60982, sampled 0
6c4ee82188:    	str	w23, [x24]  // guest 0x60982, sampled 0
6c4ee8218c:    	add	x16, x19, #0x2b0  // guest 0x60987, sampled 0
6c4ee82190:    	ld1r	{ v1.4s }, [x16]  // guest 0x60987, sampled 0
6c4ee82194:    	str	q1, [x19, #0x2b0]  // guest 0x60987, sampled 1
6c4ee82198:    	add	x1, x19, #0x2b0  // guest 0x6098b, sampled 0
6c4ee8219c:    	add	x2, x19, #0x2b0  // guest 0x6098b, sampled 0
6c4ee821a0:    	add	x3, x19, #0x3b0  // guest 0x6098b, sampled 0
6c4ee821a4:    	mov	x0, x19  // guest 0x6098b, sampled 0
6c4ee821a8:    	adrp	x16, 0x6c9775e000 <trace+0x488dc000>  // guest 0x6098b, sampled 0
6c4ee821ac:    	add	x16, x16, #0xfb8  // guest 0x6098b, sampled 0
6c4ee821b0:    	blr	x16  // guest 0x6098b, sampled 0
6c4ee821b4:    	add	x1, x19, #0x370  // guest 0x6098e, sampled 0
6c4ee821b8:    	add	x2, x19, #0x370  // guest 0x6098e, sampled 0
6c4ee821bc:    	add	x3, x19, #0x2f0  // guest 0x6098e, sampled 0
6c4ee821c0:    	mov	x0, x19  // guest 0x6098e, sampled 0
6c4ee821c4:    	adrp	x16, 0x6c9775e000 <trace+0x488dc000>  // guest 0x6098e, sampled 0
6c4ee821c8:    	add	x16, x16, #0xc38  // guest 0x6098e, sampled 0
6c4ee821cc:    	blr	x16  // guest 0x6098e, sampled 0
6c4ee821d0:    	add	w23, w22, #0x24  // guest 0x60991, sampled 0
6c4ee821d4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60991, sampled 0
6c4ee821d8:    	and	x16, x16, x23, lsr #7  // guest 0x60991, sampled 0
6c4ee821dc:    	add	x17, x17, x16  // guest 0x60991, sampled 0
6c4ee821e0:    	ldp	x16, x17, [x17]  // guest 0x60991, sampled 0
6c4ee821e4:    	and	w30, w23, #0xfffff003  // guest 0x60991, sampled 0
6c4ee821e8:    	cmp	w16, w30  // guest 0x60991, sampled 0
6c4ee821ec:    	b.ne	0x6c4ee82ad0 <trace+0xf10>  // guest 0x60991, sampled 0
6c4ee821f0:    	add	x30, x17, w23, uxtw  // guest 0x60991, sampled 0
6c4ee821f4:    	ldapr	w23, [x30]  // guest 0x60991, sampled 0
6c4ee821f8:    	movi	v0.16b, #0x0  // guest 0x60991, sampled 1
6c4ee821fc:    	str	q0, [x19, #0x2f0]  // guest 0x60991, sampled 0
6c4ee82200:    	add	x24, x19, #0x2f0  // guest 0x60991, sampled 0
6c4ee82204:    	str	w23, [x24]  // guest 0x60991, sampled 0
6c4ee82208:    	add	x16, x19, #0x2f0  // guest 0x60996, sampled 0
6c4ee8220c:    	ld1r	{ v1.4s }, [x16]  // guest 0x60996, sampled 0
6c4ee82210:    	str	q1, [x19, #0x2f0]  // guest 0x60996, sampled 0
6c4ee82214:    	add	x1, x19, #0x2f0  // guest 0x6099a, sampled 0
6c4ee82218:    	add	x2, x19, #0x2f0  // guest 0x6099a, sampled 0
6c4ee8221c:    	add	x3, x19, #0x3f0  // guest 0x6099a, sampled 0
6c4ee82220:    	mov	x0, x19  // guest 0x6099a, sampled 0
6c4ee82224:    	adrp	x16, 0x6c9775e000 <trace+0x488dc000>  // guest 0x6099a, sampled 0
6c4ee82228:    	add	x16, x16, #0xfb8  // guest 0x6099a, sampled 0
6c4ee8222c:    	blr	x16  // guest 0x6099a, sampled 0
6c4ee82230:    	add	x1, x19, #0x370  // guest 0x6099d, sampled 0
6c4ee82234:    	add	x2, x19, #0x370  // guest 0x6099d, sampled 0
6c4ee82238:    	add	x3, x19, #0x330  // guest 0x6099d, sampled 0
6c4ee8223c:    	mov	x0, x19  // guest 0x6099d, sampled 0
6c4ee82240:    	adrp	x16, 0x6c9775e000 <trace+0x488dc000>  // guest 0x6099d, sampled 0
6c4ee82244:    	add	x16, x16, #0xc38  // guest 0x6099d, sampled 0
6c4ee82248:    	blr	x16  // guest 0x6099d, sampled 0
6c4ee8224c:    	add	w23, w22, #0x28  // guest 0x609a0, sampled 0
6c4ee82250:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x609a0, sampled 0
6c4ee82254:    	and	x16, x16, x23, lsr #7  // guest 0x609a0, sampled 0
6c4ee82258:    	add	x17, x17, x16  // guest 0x609a0, sampled 0
6c4ee8225c:    	ldp	x16, x17, [x17]  // guest 0x609a0, sampled 0
6c4ee82260:    	and	w30, w23, #0xfffff003  // guest 0x609a0, sampled 0
6c4ee82264:    	cmp	w16, w30  // guest 0x609a0, sampled 0
6c4ee82268:    	b.ne	0x6c4ee82afc <trace+0xf3c>  // guest 0x609a0, sampled 0
6c4ee8226c:    	add	x30, x17, w23, uxtw  // guest 0x609a0, sampled 0
6c4ee82270:    	ldapr	w23, [x30]  // guest 0x609a0, sampled 0
6c4ee82274:    	movi	v0.16b, #0x0  // guest 0x609a0, sampled 0
6c4ee82278:    	str	q0, [x19, #0x330]  // guest 0x609a0, sampled 0
6c4ee8227c:    	add	x24, x19, #0x330  // guest 0x609a0, sampled 0
6c4ee82280:    	str	w23, [x24]  // guest 0x609a0, sampled 0
6c4ee82284:    	add	x16, x19, #0x330  // guest 0x609a5, sampled 0
6c4ee82288:    	ld1r	{ v1.4s }, [x16]  // guest 0x609a5, sampled 0
6c4ee8228c:    	str	q1, [x19, #0x330]  // guest 0x609a5, sampled 0
6c4ee82290:    	add	x1, x19, #0x330  // guest 0x609a9, sampled 0
6c4ee82294:    	add	x2, x19, #0x330  // guest 0x609a9, sampled 0
6c4ee82298:    	add	x3, x19, #0x430  // guest 0x609a9, sampled 0
6c4ee8229c:    	mov	x0, x19  // guest 0x609a9, sampled 0
6c4ee822a0:    	adrp	x16, 0x6c9775e000 <trace+0x488dc000>  // guest 0x609a9, sampled 0
6c4ee822a4:    	add	x16, x16, #0xfb8  // guest 0x609a9, sampled 0
6c4ee822a8:    	blr	x16  // guest 0x609a9, sampled 0
6c4ee822ac:    	add	w23, w21, #0x10  // guest 0x609ac, sampled 0
6c4ee822b0:    	ldr	x24, [x19, #0x370]  // guest 0x609ac, sampled 0
6c4ee822b4:    	ldr	x25, [x19, #0x378]  // guest 0x609ac, sampled 0
6c4ee822b8:    	dmb	ishst  // guest 0x609ac, sampled 0
6c4ee822bc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x609ac, sampled 0
6c4ee822c0:    	and	x16, x16, x23, lsr #7  // guest 0x609ac, sampled 0
6c4ee822c4:    	add	x17, x17, x16  // guest 0x609ac, sampled 0
6c4ee822c8:    	ldp	x17, x16, [x17, #0x8]  // guest 0x609ac, sampled 0
6c4ee822cc:    	add	w30, w23, #0xf  // guest 0x609ac, sampled 0
6c4ee822d0:    	and	w30, w30, #0xfffff000  // guest 0x609ac, sampled 0
6c4ee822d4:    	cmp	w16, w30  // guest 0x609ac, sampled 0
6c4ee822d8:    	b.ne	0x6c4ee82b28 <trace+0xf68>  // guest 0x609ac, sampled 0
6c4ee822dc:    	add	x30, x17, w23, uxtw  // guest 0x609ac, sampled 0
6c4ee822e0:    	stp	x24, x25, [x30]  // guest 0x609ac, sampled 0
6c4ee822e4:    	add	x1, x19, #0x2f0  // guest 0x609b0, sampled 0
6c4ee822e8:    	add	x2, x19, #0x2f0  // guest 0x609b0, sampled 0
6c4ee822ec:    	add	x3, x19, #0x2b0  // guest 0x609b0, sampled 0
6c4ee822f0:    	mov	x0, x19  // guest 0x609b0, sampled 0
6c4ee822f4:    	adrp	x16, 0x6c9775e000 <trace+0x488dc000>  // guest 0x609b0, sampled 0
6c4ee822f8:    	add	x16, x16, #0xc38  // guest 0x609b0, sampled 0
6c4ee822fc:    	blr	x16  // guest 0x609b0, sampled 0
6c4ee82300:    	add	w23, w22, #0x2c  // guest 0x609b3, sampled 0
6c4ee82304:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x609b3, sampled 0
6c4ee82308:    	and	x16, x16, x23, lsr #7  // guest 0x609b3, sampled 0
6c4ee8230c:    	add	x17, x17, x16  // guest 0x609b3, sampled 0
6c4ee82310:    	ldp	x16, x17, [x17]  // guest 0x609b3, sampled 0
6c4ee82314:    	and	w30, w23, #0xfffff003  // guest 0x609b3, sampled 0
6c4ee82318:    	cmp	w16, w30  // guest 0x609b3, sampled 0
6c4ee8231c:    	b.ne	0x6c4ee82b58 <trace+0xf98>  // guest 0x609b3, sampled 0
6c4ee82320:    	add	x30, x17, w23, uxtw  // guest 0x609b3, sampled 0
6c4ee82324:    	ldapr	w23, [x30]  // guest 0x609b3, sampled 0
6c4ee82328:    	movi	v0.16b, #0x0  // guest 0x609b3, sampled 0
6c4ee8232c:    	str	q0, [x19, #0x370]  // guest 0x609b3, sampled 0
6c4ee82330:    	add	x24, x19, #0x370  // guest 0x609b3, sampled 0
6c4ee82334:    	str	w23, [x24]  // guest 0x609b3, sampled 0
6c4ee82338:    	add	x16, x19, #0x370  // guest 0x609b8, sampled 0
6c4ee8233c:    	ld1r	{ v1.4s }, [x16]  // guest 0x609b8, sampled 0
6c4ee82340:    	str	q1, [x19, #0x370]  // guest 0x609b8, sampled 0
6c4ee82344:    	add	x1, x19, #0x370  // guest 0x609bc, sampled 0
6c4ee82348:    	add	x2, x19, #0x370  // guest 0x609bc, sampled 0
6c4ee8234c:    	add	x3, x19, #0x470  // guest 0x609bc, sampled 0
6c4ee82350:    	mov	x0, x19  // guest 0x609bc, sampled 0
6c4ee82354:    	adrp	x16, 0x6c9775e000 <trace+0x488dc000>  // guest 0x609bc, sampled 0
6c4ee82358:    	add	x16, x16, #0xfb8  // guest 0x609bc, sampled 0
6c4ee8235c:    	blr	x16  // guest 0x609bc, sampled 0
6c4ee82360:    	add	w23, w22, #0x30  // guest 0x609bf, sampled 0
6c4ee82364:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x609bf, sampled 0
6c4ee82368:    	and	x16, x16, x23, lsr #7  // guest 0x609bf, sampled 0
6c4ee8236c:    	add	x17, x17, x16  // guest 0x609bf, sampled 0
6c4ee82370:    	ldp	x16, x17, [x17]  // guest 0x609bf, sampled 0
6c4ee82374:    	and	w30, w23, #0xfffff003  // guest 0x609bf, sampled 0
6c4ee82378:    	cmp	w16, w30  // guest 0x609bf, sampled 0
6c4ee8237c:    	b.ne	0x6c4ee82b84 <trace+0xfc4>  // guest 0x609bf, sampled 0
6c4ee82380:    	add	x30, x17, w23, uxtw  // guest 0x609bf, sampled 0
6c4ee82384:    	ldapr	w23, [x30]  // guest 0x609bf, sampled 0
6c4ee82388:    	movi	v0.16b, #0x0  // guest 0x609bf, sampled 0
6c4ee8238c:    	str	q0, [x19, #0x2b0]  // guest 0x609bf, sampled 0
6c4ee82390:    	add	x24, x19, #0x2b0  // guest 0x609bf, sampled 0
6c4ee82394:    	str	w23, [x24]  // guest 0x609bf, sampled 0
6c4ee82398:    	add	x16, x19, #0x2b0  // guest 0x609c4, sampled 0
6c4ee8239c:    	ld1r	{ v1.4s }, [x16]  // guest 0x609c4, sampled 0
6c4ee823a0:    	str	q1, [x19, #0x2b0]  // guest 0x609c4, sampled 0
6c4ee823a4:    	add	x1, x19, #0x2b0  // guest 0x609c8, sampled 0
6c4ee823a8:    	add	x2, x19, #0x2b0  // guest 0x609c8, sampled 0
6c4ee823ac:    	add	x3, x19, #0x3b0  // guest 0x609c8, sampled 0
6c4ee823b0:    	mov	x0, x19  // guest 0x609c8, sampled 0
6c4ee823b4:    	adrp	x16, 0x6c9775e000 <trace+0x488dc000>  // guest 0x609c8, sampled 0
6c4ee823b8:    	add	x16, x16, #0xfb8  // guest 0x609c8, sampled 0
6c4ee823bc:    	blr	x16  // guest 0x609c8, sampled 0
6c4ee823c0:    	add	x1, x19, #0x370  // guest 0x609cb, sampled 0
6c4ee823c4:    	add	x2, x19, #0x370  // guest 0x609cb, sampled 0
6c4ee823c8:    	add	x3, x19, #0x330  // guest 0x609cb, sampled 0
6c4ee823cc:    	mov	x0, x19  // guest 0x609cb, sampled 0
6c4ee823d0:    	adrp	x16, 0x6c9775e000 <trace+0x488dc000>  // guest 0x609cb, sampled 0
6c4ee823d4:    	add	x16, x16, #0xc38  // guest 0x609cb, sampled 0
6c4ee823d8:    	blr	x16  // guest 0x609cb, sampled 0
6c4ee823dc:    	add	w23, w22, #0x34  // guest 0x609ce, sampled 0
6c4ee823e0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x609ce, sampled 0
6c4ee823e4:    	and	x16, x16, x23, lsr #7  // guest 0x609ce, sampled 0
6c4ee823e8:    	add	x17, x17, x16  // guest 0x609ce, sampled 0
6c4ee823ec:    	ldp	x16, x17, [x17]  // guest 0x609ce, sampled 0
6c4ee823f0:    	and	w30, w23, #0xfffff003  // guest 0x609ce, sampled 0
6c4ee823f4:    	cmp	w16, w30  // guest 0x609ce, sampled 0
6c4ee823f8:    	b.ne	0x6c4ee82bb0 <trace+0xff0>  // guest 0x609ce, sampled 0
6c4ee823fc:    	add	x30, x17, w23, uxtw  // guest 0x609ce, sampled 0
6c4ee82400:    	ldapr	w23, [x30]  // guest 0x609ce, sampled 0
6c4ee82404:    	movi	v0.16b, #0x0  // guest 0x609ce, sampled 0
6c4ee82408:    	str	q0, [x19, #0x330]  // guest 0x609ce, sampled 0
6c4ee8240c:    	add	x24, x19, #0x330  // guest 0x609ce, sampled 0
6c4ee82410:    	str	w23, [x24]  // guest 0x609ce, sampled 0
6c4ee82414:    	add	x16, x19, #0x330  // guest 0x609d3, sampled 0
6c4ee82418:    	ld1r	{ v1.4s }, [x16]  // guest 0x609d3, sampled 0
6c4ee8241c:    	str	q1, [x19, #0x330]  // guest 0x609d3, sampled 0
6c4ee82420:    	add	x1, x19, #0x330  // guest 0x609d7, sampled 0
6c4ee82424:    	add	x2, x19, #0x330  // guest 0x609d7, sampled 0
6c4ee82428:    	add	x3, x19, #0x3f0  // guest 0x609d7, sampled 0
6c4ee8242c:    	mov	x0, x19  // guest 0x609d7, sampled 0
6c4ee82430:    	adrp	x16, 0x6c9775e000 <trace+0x488dc000>  // guest 0x609d7, sampled 0
6c4ee82434:    	add	x16, x16, #0xfb8  // guest 0x609d7, sampled 0
6c4ee82438:    	blr	x16  // guest 0x609d7, sampled 0
6c4ee8243c:    	add	x1, x19, #0x370  // guest 0x609da, sampled 0
6c4ee82440:    	add	x2, x19, #0x370  // guest 0x609da, sampled 0
6c4ee82444:    	add	x3, x19, #0x2f0  // guest 0x609da, sampled 0
6c4ee82448:    	mov	x0, x19  // guest 0x609da, sampled 0
6c4ee8244c:    	adrp	x16, 0x6c9775e000 <trace+0x488dc000>  // guest 0x609da, sampled 0
6c4ee82450:    	add	x16, x16, #0xc38  // guest 0x609da, sampled 0
6c4ee82454:    	blr	x16  // guest 0x609da, sampled 0
6c4ee82458:    	add	w23, w22, #0x38  // guest 0x609dd, sampled 0
6c4ee8245c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x609dd, sampled 0
6c4ee82460:    	and	x16, x16, x23, lsr #7  // guest 0x609dd, sampled 0
6c4ee82464:    	add	x17, x17, x16  // guest 0x609dd, sampled 0
6c4ee82468:    	ldp	x16, x17, [x17]  // guest 0x609dd, sampled 0
6c4ee8246c:    	and	w30, w23, #0xfffff003  // guest 0x609dd, sampled 0
6c4ee82470:    	cmp	w16, w30  // guest 0x609dd, sampled 0
6c4ee82474:    	b.ne	0x6c4ee82bdc <trace+0x101c>  // guest 0x609dd, sampled 0
6c4ee82478:    	add	x30, x17, w23, uxtw  // guest 0x609dd, sampled 0
6c4ee8247c:    	ldapr	w23, [x30]  // guest 0x609dd, sampled 0
6c4ee82480:    	movi	v0.16b, #0x0  // guest 0x609dd, sampled 0
6c4ee82484:    	str	q0, [x19, #0x2f0]  // guest 0x609dd, sampled 0
6c4ee82488:    	add	x24, x19, #0x2f0  // guest 0x609dd, sampled 0
6c4ee8248c:    	str	w23, [x24]  // guest 0x609dd, sampled 0
6c4ee82490:    	add	x16, x19, #0x2f0  // guest 0x609e2, sampled 0
6c4ee82494:    	ld1r	{ v1.4s }, [x16]  // guest 0x609e2, sampled 0
6c4ee82498:    	str	q1, [x19, #0x2f0]  // guest 0x609e2, sampled 0
6c4ee8249c:    	add	x1, x19, #0x2f0  // guest 0x609e6, sampled 0
6c4ee824a0:    	add	x2, x19, #0x2f0  // guest 0x609e6, sampled 0
6c4ee824a4:    	add	x3, x19, #0x430  // guest 0x609e6, sampled 0
6c4ee824a8:    	mov	x0, x19  // guest 0x609e6, sampled 0
6c4ee824ac:    	adrp	x16, 0x6c9775e000 <trace+0x488dc000>  // guest 0x609e6, sampled 0
6c4ee824b0:    	add	x16, x16, #0xfb8  // guest 0x609e6, sampled 0
6c4ee824b4:    	blr	x16  // guest 0x609e6, sampled 0
6c4ee824b8:    	add	w23, w21, #0x20  // guest 0x609e9, sampled 0
6c4ee824bc:    	ldr	x24, [x19, #0x370]  // guest 0x609e9, sampled 0
6c4ee824c0:    	ldr	x25, [x19, #0x378]  // guest 0x609e9, sampled 0
6c4ee824c4:    	dmb	ishst  // guest 0x609e9, sampled 0
6c4ee824c8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x609e9, sampled 0
6c4ee824cc:    	and	x16, x16, x23, lsr #7  // guest 0x609e9, sampled 0
6c4ee824d0:    	add	x17, x17, x16  // guest 0x609e9, sampled 0
6c4ee824d4:    	ldp	x17, x16, [x17, #0x8]  // guest 0x609e9, sampled 0
6c4ee824d8:    	add	w30, w23, #0xf  // guest 0x609e9, sampled 0
6c4ee824dc:    	and	w30, w30, #0xfffff000  // guest 0x609e9, sampled 0
6c4ee824e0:    	cmp	w16, w30  // guest 0x609e9, sampled 0
6c4ee824e4:    	b.ne	0x6c4ee82c08 <trace+0x1048>  // guest 0x609e9, sampled 0
6c4ee824e8:    	add	x30, x17, w23, uxtw  // guest 0x609e9, sampled 0
6c4ee824ec:    	stp	x24, x25, [x30]  // guest 0x609e9, sampled 0
6c4ee824f0:    	add	x1, x19, #0x330  // guest 0x609ed, sampled 0
6c4ee824f4:    	add	x2, x19, #0x330  // guest 0x609ed, sampled 0
6c4ee824f8:    	add	x3, x19, #0x2b0  // guest 0x609ed, sampled 0
6c4ee824fc:    	mov	x0, x19  // guest 0x609ed, sampled 0
6c4ee82500:    	adrp	x16, 0x6c9775e000 <trace+0x488dc000>  // guest 0x609ed, sampled 0
6c4ee82504:    	add	x16, x16, #0xc38  // guest 0x609ed, sampled 0
6c4ee82508:    	blr	x16  // guest 0x609ed, sampled 0
6c4ee8250c:    	add	w22, w22, #0x3c  // guest 0x609f0, sampled 0
6c4ee82510:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x609f0, sampled 0
6c4ee82514:    	and	x16, x16, x22, lsr #7  // guest 0x609f0, sampled 0
6c4ee82518:    	add	x17, x17, x16  // guest 0x609f0, sampled 0
6c4ee8251c:    	ldp	x16, x17, [x17]  // guest 0x609f0, sampled 0
6c4ee82520:    	and	w30, w22, #0xfffff003  // guest 0x609f0, sampled 0
6c4ee82524:    	cmp	w16, w30  // guest 0x609f0, sampled 0
6c4ee82528:    	b.ne	0x6c4ee82c38 <trace+0x1078>  // guest 0x609f0, sampled 0
6c4ee8252c:    	add	x30, x17, w22, uxtw  // guest 0x609f0, sampled 0
6c4ee82530:    	ldapr	w22, [x30]  // guest 0x609f0, sampled 0
6c4ee82534:    	movi	v0.16b, #0x0  // guest 0x609f0, sampled 0
6c4ee82538:    	str	q0, [x19, #0x370]  // guest 0x609f0, sampled 0
6c4ee8253c:    	add	x23, x19, #0x370  // guest 0x609f0, sampled 0
6c4ee82540:    	str	w22, [x23]  // guest 0x609f0, sampled 0
6c4ee82544:    	add	x16, x19, #0x370  // guest 0x609f5, sampled 0
6c4ee82548:    	ld1r	{ v0.4s }, [x16]  // guest 0x609f5, sampled 0
6c4ee8254c:    	str	q0, [x19, #0x370]  // guest 0x609f5, sampled 1
6c4ee82550:    	add	x1, x19, #0x370  // guest 0x609f9, sampled 0
6c4ee82554:    	add	x2, x19, #0x370  // guest 0x609f9, sampled 0
6c4ee82558:    	add	x3, x19, #0x470  // guest 0x609f9, sampled 0
6c4ee8255c:    	mov	x0, x19  // guest 0x609f9, sampled 0
6c4ee82560:    	adrp	x16, 0x6c9775e000 <trace+0x488dc000>  // guest 0x609f9, sampled 0
6c4ee82564:    	add	x16, x16, #0xfb8  // guest 0x609f9, sampled 0
6c4ee82568:    	blr	x16  // guest 0x609f9, sampled 0
6c4ee8256c:    	add	x1, x19, #0x370  // guest 0x609fc, sampled 0
6c4ee82570:    	add	x2, x19, #0x370  // guest 0x609fc, sampled 0
6c4ee82574:    	add	x3, x19, #0x2f0  // guest 0x609fc, sampled 0
6c4ee82578:    	mov	x0, x19  // guest 0x609fc, sampled 0
6c4ee8257c:    	adrp	x16, 0x6c9775e000 <trace+0x488dc000>  // guest 0x609fc, sampled 0
6c4ee82580:    	add	x16, x16, #0xc38  // guest 0x609fc, sampled 0
6c4ee82584:    	blr	x16  // guest 0x609fc, sampled 0
6c4ee82588:    	add	x1, x19, #0x370  // guest 0x609ff, sampled 0
6c4ee8258c:    	add	x2, x19, #0x370  // guest 0x609ff, sampled 0
6c4ee82590:    	add	x3, x19, #0x330  // guest 0x609ff, sampled 0
6c4ee82594:    	mov	x0, x19  // guest 0x609ff, sampled 0
6c4ee82598:    	adrp	x16, 0x6c9775e000 <trace+0x488dc000>  // guest 0x609ff, sampled 0
6c4ee8259c:    	add	x16, x16, #0xc38  // guest 0x609ff, sampled 0
6c4ee825a0:    	blr	x16  // guest 0x609ff, sampled 0
6c4ee825a4:    	add	w21, w21, #0x30  // guest 0x60a02, sampled 0
6c4ee825a8:    	ldr	x22, [x19, #0x370]  // guest 0x60a02, sampled 0
6c4ee825ac:    	ldr	x23, [x19, #0x378]  // guest 0x60a02, sampled 0
6c4ee825b0:    	dmb	ishst  // guest 0x60a02, sampled 0
6c4ee825b4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60a02, sampled 0
6c4ee825b8:    	and	x16, x16, x21, lsr #7  // guest 0x60a02, sampled 0
6c4ee825bc:    	add	x17, x17, x16  // guest 0x60a02, sampled 0
6c4ee825c0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x60a02, sampled 0
6c4ee825c4:    	add	w30, w21, #0xf  // guest 0x60a02, sampled 0
6c4ee825c8:    	and	w30, w30, #0xfffff000  // guest 0x60a02, sampled 0
6c4ee825cc:    	cmp	w16, w30  // guest 0x60a02, sampled 0
6c4ee825d0:    	b.ne	0x6c4ee82c64 <trace+0x10a4>  // guest 0x60a02, sampled 0
6c4ee825d4:    	add	x30, x17, w21, uxtw  // guest 0x60a02, sampled 0
6c4ee825d8:    	stp	x22, x23, [x30]  // guest 0x60a02, sampled 0
6c4ee825dc:    	add	w21, w20, #0x50  // guest 0x60a06, sampled 0
6c4ee825e0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60a06, sampled 0
6c4ee825e4:    	and	x16, x16, x21, lsr #7  // guest 0x60a06, sampled 0
6c4ee825e8:    	add	x17, x17, x16  // guest 0x60a06, sampled 0
6c4ee825ec:    	ldp	x16, x17, [x17]  // guest 0x60a06, sampled 0
6c4ee825f0:    	and	w30, w21, #0xfffff003  // guest 0x60a06, sampled 0
6c4ee825f4:    	cmp	w16, w30  // guest 0x60a06, sampled 0
6c4ee825f8:    	b.ne	0x6c4ee82c94 <trace+0x10d4>  // guest 0x60a06, sampled 0
6c4ee825fc:    	add	x30, x17, w21, uxtw  // guest 0x60a06, sampled 0
6c4ee82600:    	ldapr	w21, [x30]  // guest 0x60a06, sampled 0
6c4ee82604:    	str	w21, [x19]  // guest 0x60a06, sampled 0
6c4ee82608:    	mov	w22, #0x10              // =16  // guest 0x60a0a, sampled 1
6c4ee8260c:    	str	w22, [x19, #0x4]  // guest 0x60a0a, sampled 0
6c4ee82610:    	add	w20, w20, #0xc  // guest 0x60a0f, sampled 0
6c4ee82614:    	str	w20, [sp, #0x80]  // guest 0x60a0f, sampled 0
6c4ee82618:    	str	w20, [x19, #0x18]  // guest 0x60a0f, sampled 0
6c4ee8261c:    	str	w21, [sp, #0x84]  // guest 0x60a13, sampled 0
6c4ee82620:    	str	w21, [x19, #0x1c]  // guest 0x60a13, sampled 0
6c4ee82624:    	mov	w20, #0x1               // =1  // guest 0x60a13, sampled 0
6c4ee82628:    	sturb	w20, [x19, #-0xc]  // guest 0x60a13, sampled 0
6c4ee8262c:    	ldr	w20, [x19, #0x38]  // guest 0x60a15, sampled 0
6c4ee82630:    	lsl	w20, w20, #2  // guest 0x60a15, sampled 0
6c4ee82634:    	str	w20, [sp, #0x88]  // guest 0x60a15, sampled 0
6c4ee82638:    	mov	w20, #0x12              // =18  // guest 0x60a15, sampled 0
6c4ee8263c:    	str	w20, [x19, #0x34]  // guest 0x60a15, sampled 0
6c4ee82640:    	mov	w20, #0xf               // =15  // guest 0x60a15, sampled 0
6c4ee82644:    	str	w20, [sp, #0x8c]  // guest 0x60a15, sampled 0
6c4ee82648:    	ldr	w20, [x19, #0x18]  // guest 0x60a15, sampled 0
6c4ee8264c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60a15, sampled 0
6c4ee82650:    	and	x16, x16, x20, lsr #7  // guest 0x60a15, sampled 0
6c4ee82654:    	add	x17, x17, x16  // guest 0x60a15, sampled 0
6c4ee82658:    	ldp	x16, x17, [x17]  // guest 0x60a15, sampled 0
6c4ee8265c:    	and	w30, w20, #0xfffff003  // guest 0x60a15, sampled 2
6c4ee82660:    	cmp	w16, w30  // guest 0x60a15, sampled 0
6c4ee82664:    	b.ne	0x6c4ee82cc0 <trace+0x1100>  // guest 0x60a15, sampled 0
6c4ee82668:    	add	x30, x17, w20, uxtw  // guest 0x60a15, sampled 0
6c4ee8266c:    	ldapr	w21, [x30]  // guest 0x60a15, sampled 0
6c4ee82670:    	str	w21, [sp, #0x84]  // guest 0x60a15, sampled 2
6c4ee82674:    	ldr	w22, [x19, #0x1c]  // guest 0x60a15, sampled 0
6c4ee82678:    	str	w22, [sp, #0x80]  // guest 0x60a15, sampled 0
6c4ee8267c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60a15, sampled 0
6c4ee82680:    	and	x16, x16, x22, lsr #7  // guest 0x60a15, sampled 0
6c4ee82684:    	add	x17, x17, x16  // guest 0x60a15, sampled 0
6c4ee82688:    	ldp	x17, x16, [x17, #0x8]  // guest 0x60a15, sampled 0
6c4ee8268c:    	and	w30, w22, #0xfffff003  // guest 0x60a15, sampled 1
6c4ee82690:    	cmp	w16, w30  // guest 0x60a15, sampled 1
6c4ee82694:    	b.ne	0x6c4ee82cec <trace+0x112c>  // guest 0x60a15, sampled 0
6c4ee82698:    	add	x30, x17, w22, uxtw  // guest 0x60a15, sampled 0
6c4ee8269c:    	stlr	w21, [x30]  // guest 0x60a15, sampled 0
6c4ee826a0:    	ldr	w21, [sp, #0x88]  // guest 0x60a15, sampled 0
6c4ee826a4:    	add	w20, w20, w21  // guest 0x60a15, sampled 0
6c4ee826a8:    	str	w20, [x19, #0x18]  // guest 0x60a15, sampled 0
6c4ee826ac:    	add	w20, w22, w21  // guest 0x60a15, sampled 0
6c4ee826b0:    	str	w20, [x19, #0x1c]  // guest 0x60a15, sampled 1
6c4ee826b4:    	ldr	w20, [sp, #0x8c]  // guest 0x60a15, sampled 0
6c4ee826b8:    	str	w20, [x19, #0x4]  // guest 0x60a15, sampled 0
6c4ee826bc:    	sub	w20, w20, #0x1  // guest 0x60a15, sampled 0
6c4ee826c0:    	str	w20, [sp, #0x8c]  // guest 0x60a15, sampled 0
6c4ee826c4:    	tst	w20, #0xffff  // guest 0x60a15, sampled 0
6c4ee826c8:    	b.ne	0x6c4ee82648 <trace+0xa88>  // guest 0x60a15, sampled 0
6c4ee826cc:    	cbz	w20, 0x6c4ee826f8 <trace+0xb38>  // guest 0x60a15, sampled 0
6c4ee826d0:    	ldr	w20, [x19, #0x24]  // guest 0x60a15, sampled 0
6c4ee826d4:    	orr	w20, w20, #0x10000  // guest 0x60a15, sampled 0
6c4ee826d8:    	str	w20, [x19, #0x24]  // guest 0x60a15, sampled 0
6c4ee826dc:    	b	0x6c4ee826dc <trace+0xb1c>  // guest 0x60a15, sampled 0
6c4ee826e0:    	br	x16  // guest 0x60a15, sampled 0
6c4ee826e4:    	mov	w20, #0xa15             // =2581  // guest 0x60a15, sampled 0
6c4ee826e8:    	movk	w20, #0x6, lsl #16  // guest 0x60a15, sampled 0
6c4ee826ec:    	str	w20, [x19, #0x20]  // guest 0x60a15, sampled 0
6c4ee826f0:    	adr	x0, 0x6c4ee81b00 <trace+0xffffffffffffff40>  // guest 0x60a15, sampled 0
6c4ee826f4:    	b	0x6c4ae5d02c <trace+0xfffffffffbfdb46c>  // guest 0x60a15, sampled 0
6c4ee826f8:    	ldr	w20, [x19, #0x18]  // guest 0x60a15, sampled 0
6c4ee826fc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60a15, sampled 0
6c4ee82700:    	and	x16, x16, x20, lsr #7  // guest 0x60a15, sampled 0
6c4ee82704:    	add	x17, x17, x16  // guest 0x60a15, sampled 0
6c4ee82708:    	ldp	x16, x17, [x17]  // guest 0x60a15, sampled 0
6c4ee8270c:    	and	w30, w20, #0xfffff003  // guest 0x60a15, sampled 0
6c4ee82710:    	cmp	w16, w30  // guest 0x60a15, sampled 0
6c4ee82714:    	b.ne	0x6c4ee82d18 <trace+0x1158>  // guest 0x60a15, sampled 0
6c4ee82718:    	add	x30, x17, w20, uxtw  // guest 0x60a15, sampled 0
6c4ee8271c:    	ldapr	w21, [x30]  // guest 0x60a15, sampled 0
6c4ee82720:    	ldr	w22, [x19, #0x1c]  // guest 0x60a15, sampled 0
6c4ee82724:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x60a15, sampled 0
6c4ee82728:    	and	x16, x16, x22, lsr #7  // guest 0x60a15, sampled 0
6c4ee8272c:    	add	x17, x17, x16  // guest 0x60a15, sampled 0
6c4ee82730:    	ldp	x17, x16, [x17, #0x8]  // guest 0x60a15, sampled 0
6c4ee82734:    	and	w30, w22, #0xfffff003  // guest 0x60a15, sampled 0
6c4ee82738:    	cmp	w16, w30  // guest 0x60a15, sampled 0
6c4ee8273c:    	b.ne	0x6c4ee82d44 <trace+0x1184>  // guest 0x60a15, sampled 0
6c4ee82740:    	add	x30, x17, w22, uxtw  // guest 0x60a15, sampled 0
6c4ee82744:    	stlr	w21, [x30]  // guest 0x60a15, sampled 0
6c4ee82748:    	ldr	w21, [sp, #0x88]  // guest 0x60a15, sampled 0
6c4ee8274c:    	add	w20, w20, w21  // guest 0x60a15, sampled 0
6c4ee82750:    	str	w20, [x19, #0x18]  // guest 0x60a15, sampled 0
6c4ee82754:    	add	w20, w22, w21  // guest 0x60a15, sampled 0
6c4ee82758:    	str	w20, [x19, #0x1c]  // guest 0x60a15, sampled 0
6c4ee8275c:    	ldr	w20, [sp, #0x8c]  // guest 0x60a15, sampled 0
6c4ee82760:    	str	w20, [x19, #0x4]  // guest 0x60a15, sampled 0
6c4ee82764:    	b	0x6c4ee82764 <trace+0xba4>  // guest 0x60a15, sampled 0
6c4ee82768:    	br	x16  // guest 0x60a15, sampled 0
6c4ee8276c:    	mov	w20, #0xa17             // =2583  // guest 0x60a15, sampled 0
6c4ee82770:    	movk	w20, #0x6, lsl #16  // guest 0x60a15, sampled 0
6c4ee82774:    	str	w20, [x19, #0x20]  // guest 0x60a15, sampled 0
6c4ee82778:    	adr	x0, 0x6c4ee81b01 <trace+0xffffffffffffff41>  // guest 0x60a15, sampled 0
6c4ee8277c:    	b	0x6c4ae5d02c <trace+0xfffffffffbfdb46c>  // guest 0x60a15, sampled 0
6c4ee82780:    	adr	x0, 0x6c4ee81b03 <trace+0xffffffffffffff43>  // guest 0x60a15, sampled 0
6c4ee82784:    	b	0x6c4ae5d02c <trace+0xfffffffffbfdb46c>  // guest 0x60a15, sampled 0
6c4ee82788:    	mov	w1, w21
6c4ee8278c:    	mov	w2, w22
6c4ee82790:    	mov	x0, x19
6c4ee82794:    	mov	w3, #0x4045             // =16453
6c4ee82798:    	movk	w3, #0x1, lsl #16
6c4ee8279c:    	adr	x4, 0x6c4ee81c14 <trace+0x54>
6c4ee827a0:    	adrp	x16, 0x6c97724000 <trace+0x488a2000>
6c4ee827a4:    	add	x16, x16, #0xb68
6c4ee827a8:    	blr	x16
6c4ee827ac:    	dmb	ishld
6c4ee827b0:    	b	0x6c4ee81c14 <trace+0x54>
6c4ee827b4:    	mov	w1, w21
6c4ee827b8:    	mov	w2, w22
6c4ee827bc:    	mov	x0, x19
6c4ee827c0:    	mov	w3, #0x4045             // =16453
6c4ee827c4:    	movk	w3, #0x1, lsl #16
6c4ee827c8:    	adr	x4, 0x6c4ee81c48 <trace+0x88>
6c4ee827cc:    	adrp	x16, 0x6c97724000 <trace+0x488a2000>
6c4ee827d0:    	add	x16, x16, #0xb68
6c4ee827d4:    	blr	x16
6c4ee827d8:    	dmb	ishld
6c4ee827dc:    	b	0x6c4ee81c48 <trace+0x88>
6c4ee827e0:    	mov	w1, w21
6c4ee827e4:    	mov	w2, w22
6c4ee827e8:    	mov	x0, x19
6c4ee827ec:    	mov	w3, #0x4045             // =16453
6c4ee827f0:    	movk	w3, #0x1, lsl #16
6c4ee827f4:    	adr	x4, 0x6c4ee81c78 <trace+0xb8>
6c4ee827f8:    	adrp	x16, 0x6c97724000 <trace+0x488a2000>
6c4ee827fc:    	add	x16, x16, #0xb68
6c4ee82800:    	blr	x16
6c4ee82804:    	dmb	ishld
6c4ee82808:    	b	0x6c4ee81c78 <trace+0xb8>
6c4ee8280c:    	mov	w1, w21
6c4ee82810:    	mov	x0, x19
6c4ee82814:    	mov	w2, #0x4045             // =16453
6c4ee82818:    	movk	w2, #0x1, lsl #16
6c4ee8281c:    	adr	x3, 0x6c4ee81ca0 <trace+0xe0>
6c4ee82820:    	adrp	x16, 0x6c97723000 <trace+0x488a1000>
6c4ee82824:    	add	x16, x16, #0xf88
6c4ee82828:    	blr	x16
6c4ee8282c:    	mov	w21, w0
6c4ee82830:    	dmb	ishld
6c4ee82834:    	b	0x6c4ee81ca0 <trace+0xe0>
6c4ee82838:    	mov	w1, w22
6c4ee8283c:    	mov	x0, x19
6c4ee82840:    	mov	w2, #0x4045             // =16453
6c4ee82844:    	movk	w2, #0x1, lsl #16
6c4ee82848:    	adr	x3, 0x6c4ee81ccc <trace+0x10c>
6c4ee8284c:    	adrp	x16, 0x6c97723000 <trace+0x488a1000>
6c4ee82850:    	add	x16, x16, #0xf88
6c4ee82854:    	blr	x16
6c4ee82858:    	mov	w22, w0
6c4ee8285c:    	dmb	ishld
6c4ee82860:    	b	0x6c4ee81ccc <trace+0x10c>
6c4ee82864:    	mov	w1, w21
6c4ee82868:    	mov	x0, x19
6c4ee8286c:    	mov	w2, #0x4085             // =16517
6c4ee82870:    	movk	w2, #0x1, lsl #16
6c4ee82874:    	adr	x3, 0x6c4ee81cf8 <trace+0x138>
6c4ee82878:    	adrp	x16, 0x6c97724000 <trace+0x488a2000>
6c4ee8287c:    	add	x16, x16, #0x46c
6c4ee82880:    	blr	x16
6c4ee82884:    	mov	x23, x0
6c4ee82888:    	mov	x24, x1
6c4ee8288c:    	b	0x6c4ee81cf8 <trace+0x138>
6c4ee82890:    	mov	w1, w23
6c4ee82894:    	mov	x0, x19
6c4ee82898:    	mov	w2, #0x4085             // =16517
6c4ee8289c:    	movk	w2, #0x1, lsl #16
6c4ee828a0:    	adr	x3, 0x6c4ee81d30 <trace+0x170>
6c4ee828a4:    	adrp	x16, 0x6c97724000 <trace+0x488a2000>
6c4ee828a8:    	add	x16, x16, #0x46c
6c4ee828ac:    	blr	x16
6c4ee828b0:    	mov	x23, x0
6c4ee828b4:    	mov	x24, x1
6c4ee828b8:    	b	0x6c4ee81d30 <trace+0x170>
6c4ee828bc:    	mov	w1, w23
6c4ee828c0:    	mov	x0, x19
6c4ee828c4:    	mov	w2, #0x4085             // =16517
6c4ee828c8:    	movk	w2, #0x1, lsl #16
6c4ee828cc:    	adr	x3, 0x6c4ee81d68 <trace+0x1a8>
6c4ee828d0:    	adrp	x16, 0x6c97724000 <trace+0x488a2000>
6c4ee828d4:    	add	x16, x16, #0x46c
6c4ee828d8:    	blr	x16
6c4ee828dc:    	mov	x23, x0
6c4ee828e0:    	mov	x24, x1
6c4ee828e4:    	b	0x6c4ee81d68 <trace+0x1a8>
6c4ee828e8:    	mov	w1, w21
6c4ee828ec:    	mov	x0, x19
6c4ee828f0:    	mov	w2, #0x4085             // =16517
6c4ee828f4:    	movk	w2, #0x1, lsl #16
6c4ee828f8:    	adr	x3, 0x6c4ee81da0 <trace+0x1e0>
6c4ee828fc:    	adrp	x16, 0x6c97724000 <trace+0x488a2000>
6c4ee82900:    	add	x16, x16, #0x46c
6c4ee82904:    	blr	x16
6c4ee82908:    	mov	x21, x0
6c4ee8290c:    	mov	x23, x1
6c4ee82910:    	b	0x6c4ee81da0 <trace+0x1e0>
6c4ee82914:    	mov	w1, w22
6c4ee82918:    	mov	x0, x19
6c4ee8291c:    	mov	w2, #0x4045             // =16453
6c4ee82920:    	movk	w2, #0x1, lsl #16
6c4ee82924:    	adr	x3, 0x6c4ee81dd8 <trace+0x218>
6c4ee82928:    	adrp	x16, 0x6c97723000 <trace+0x488a1000>
6c4ee8292c:    	add	x16, x16, #0xf88
6c4ee82930:    	blr	x16
6c4ee82934:    	mov	w23, w0
6c4ee82938:    	dmb	ishld
6c4ee8293c:    	b	0x6c4ee81dd8 <trace+0x218>
6c4ee82940:    	mov	w1, w23
6c4ee82944:    	mov	x0, x19
6c4ee82948:    	mov	w2, #0x4045             // =16453
6c4ee8294c:    	movk	w2, #0x1, lsl #16
6c4ee82950:    	adr	x3, 0x6c4ee81e38 <trace+0x278>
6c4ee82954:    	adrp	x16, 0x6c97723000 <trace+0x488a1000>
6c4ee82958:    	add	x16, x16, #0xf88
6c4ee8295c:    	blr	x16
6c4ee82960:    	mov	w23, w0
6c4ee82964:    	dmb	ishld
6c4ee82968:    	b	0x6c4ee81e38 <trace+0x278>
6c4ee8296c:    	mov	w1, w23
6c4ee82970:    	mov	x0, x19
6c4ee82974:    	mov	w2, #0x4045             // =16453
6c4ee82978:    	movk	w2, #0x1, lsl #16
6c4ee8297c:    	adr	x3, 0x6c4ee81e98 <trace+0x2d8>
6c4ee82980:    	adrp	x16, 0x6c97723000 <trace+0x488a1000>
6c4ee82984:    	add	x16, x16, #0xf88
6c4ee82988:    	blr	x16
6c4ee8298c:    	mov	w23, w0
6c4ee82990:    	dmb	ishld
6c4ee82994:    	b	0x6c4ee81e98 <trace+0x2d8>
6c4ee82998:    	mov	w1, w23
6c4ee8299c:    	mov	x0, x19
6c4ee829a0:    	mov	w2, #0x4045             // =16453
6c4ee829a4:    	movk	w2, #0x1, lsl #16
6c4ee829a8:    	adr	x3, 0x6c4ee81f14 <trace+0x354>
6c4ee829ac:    	adrp	x16, 0x6c97723000 <trace+0x488a1000>
6c4ee829b0:    	add	x16, x16, #0xf88
6c4ee829b4:    	blr	x16
6c4ee829b8:    	mov	w23, w0
6c4ee829bc:    	dmb	ishld
6c4ee829c0:    	b	0x6c4ee81f14 <trace+0x354>
6c4ee829c4:    	mov	w1, w23
6c4ee829c8:    	mov	x0, x19
6c4ee829cc:    	mov	w2, #0x4045             // =16453
6c4ee829d0:    	movk	w2, #0x1, lsl #16
6c4ee829d4:    	adr	x3, 0x6c4ee81f74 <trace+0x3b4>
6c4ee829d8:    	adrp	x16, 0x6c97723000 <trace+0x488a1000>
6c4ee829dc:    	add	x16, x16, #0xf88
6c4ee829e0:    	blr	x16
6c4ee829e4:    	mov	w23, w0
6c4ee829e8:    	dmb	ishld
6c4ee829ec:    	b	0x6c4ee81f74 <trace+0x3b4>
6c4ee829f0:    	mov	w1, w23
6c4ee829f4:    	mov	x0, x19
6c4ee829f8:    	mov	w2, #0x4045             // =16453
6c4ee829fc:    	movk	w2, #0x1, lsl #16
6c4ee82a00:    	adr	x3, 0x6c4ee81ff0 <trace+0x430>
6c4ee82a04:    	adrp	x16, 0x6c97723000 <trace+0x488a1000>
6c4ee82a08:    	add	x16, x16, #0xf88
6c4ee82a0c:    	blr	x16
6c4ee82a10:    	mov	w23, w0
6c4ee82a14:    	dmb	ishld
6c4ee82a18:    	b	0x6c4ee81ff0 <trace+0x430>
6c4ee82a1c:    	mov	w1, w23
6c4ee82a20:    	mov	x0, x19
6c4ee82a24:    	mov	w2, #0x4045             // =16453
6c4ee82a28:    	movk	w2, #0x1, lsl #16
6c4ee82a2c:    	adr	x3, 0x6c4ee8206c <trace+0x4ac>
6c4ee82a30:    	adrp	x16, 0x6c97723000 <trace+0x488a1000>
6c4ee82a34:    	add	x16, x16, #0xf88
6c4ee82a38:    	blr	x16
6c4ee82a3c:    	mov	w23, w0
6c4ee82a40:    	dmb	ishld
6c4ee82a44:    	b	0x6c4ee8206c <trace+0x4ac>
6c4ee82a48:    	mov	w1, w21
6c4ee82a4c:    	mov	x2, x23
6c4ee82a50:    	mov	x3, x24
6c4ee82a54:    	mov	x0, x19
6c4ee82a58:    	mov	w4, #0x4085             // =16517
6c4ee82a5c:    	movk	w4, #0x1, lsl #16
6c4ee82a60:    	adr	x5, 0x6c4ee820d8 <trace+0x518>
6c4ee82a64:    	adrp	x16, 0x6c97724000 <trace+0x488a2000>
6c4ee82a68:    	add	x16, x16, #0xfdc
6c4ee82a6c:    	blr	x16
6c4ee82a70:    	dmb	ishld
6c4ee82a74:    	b	0x6c4ee820d8 <trace+0x518>
6c4ee82a78:    	mov	w1, w23
6c4ee82a7c:    	mov	x0, x19
6c4ee82a80:    	mov	w2, #0x4045             // =16453
6c4ee82a84:    	movk	w2, #0x1, lsl #16
6c4ee82a88:    	adr	x3, 0x6c4ee8211c <trace+0x55c>
6c4ee82a8c:    	adrp	x16, 0x6c97723000 <trace+0x488a1000>
6c4ee82a90:    	add	x16, x16, #0xf88
6c4ee82a94:    	blr	x16
6c4ee82a98:    	mov	w23, w0
6c4ee82a9c:    	dmb	ishld
6c4ee82aa0:    	b	0x6c4ee8211c <trace+0x55c>
6c4ee82aa4:    	mov	w1, w23
6c4ee82aa8:    	mov	x0, x19
6c4ee82aac:    	mov	w2, #0x4045             // =16453
6c4ee82ab0:    	movk	w2, #0x1, lsl #16
6c4ee82ab4:    	adr	x3, 0x6c4ee8217c <trace+0x5bc>
6c4ee82ab8:    	adrp	x16, 0x6c97723000 <trace+0x488a1000>
6c4ee82abc:    	add	x16, x16, #0xf88
6c4ee82ac0:    	blr	x16
6c4ee82ac4:    	mov	w23, w0
6c4ee82ac8:    	dmb	ishld
6c4ee82acc:    	b	0x6c4ee8217c <trace+0x5bc>
6c4ee82ad0:    	mov	w1, w23
6c4ee82ad4:    	mov	x0, x19
6c4ee82ad8:    	mov	w2, #0x4045             // =16453
6c4ee82adc:    	movk	w2, #0x1, lsl #16
6c4ee82ae0:    	adr	x3, 0x6c4ee821f8 <trace+0x638>
6c4ee82ae4:    	adrp	x16, 0x6c97723000 <trace+0x488a1000>
6c4ee82ae8:    	add	x16, x16, #0xf88
6c4ee82aec:    	blr	x16
6c4ee82af0:    	mov	w23, w0
6c4ee82af4:    	dmb	ishld
6c4ee82af8:    	b	0x6c4ee821f8 <trace+0x638>
6c4ee82afc:    	mov	w1, w23
6c4ee82b00:    	mov	x0, x19
6c4ee82b04:    	mov	w2, #0x4045             // =16453
6c4ee82b08:    	movk	w2, #0x1, lsl #16
6c4ee82b0c:    	adr	x3, 0x6c4ee82274 <trace+0x6b4>
6c4ee82b10:    	adrp	x16, 0x6c97723000 <trace+0x488a1000>
6c4ee82b14:    	add	x16, x16, #0xf88
6c4ee82b18:    	blr	x16
6c4ee82b1c:    	mov	w23, w0
6c4ee82b20:    	dmb	ishld
6c4ee82b24:    	b	0x6c4ee82274 <trace+0x6b4>
6c4ee82b28:    	mov	w1, w23
6c4ee82b2c:    	mov	x2, x24
6c4ee82b30:    	mov	x3, x25
6c4ee82b34:    	mov	x0, x19
6c4ee82b38:    	mov	w4, #0x4085             // =16517
6c4ee82b3c:    	movk	w4, #0x1, lsl #16
6c4ee82b40:    	adr	x5, 0x6c4ee822e4 <trace+0x724>
6c4ee82b44:    	adrp	x16, 0x6c97724000 <trace+0x488a2000>
6c4ee82b48:    	add	x16, x16, #0xfdc
6c4ee82b4c:    	blr	x16
6c4ee82b50:    	dmb	ishld
6c4ee82b54:    	b	0x6c4ee822e4 <trace+0x724>
6c4ee82b58:    	mov	w1, w23
6c4ee82b5c:    	mov	x0, x19
6c4ee82b60:    	mov	w2, #0x4045             // =16453
6c4ee82b64:    	movk	w2, #0x1, lsl #16
6c4ee82b68:    	adr	x3, 0x6c4ee82328 <trace+0x768>
6c4ee82b6c:    	adrp	x16, 0x6c97723000 <trace+0x488a1000>
6c4ee82b70:    	add	x16, x16, #0xf88
6c4ee82b74:    	blr	x16
6c4ee82b78:    	mov	w23, w0
6c4ee82b7c:    	dmb	ishld
6c4ee82b80:    	b	0x6c4ee82328 <trace+0x768>
6c4ee82b84:    	mov	w1, w23
6c4ee82b88:    	mov	x0, x19
6c4ee82b8c:    	mov	w2, #0x4045             // =16453
6c4ee82b90:    	movk	w2, #0x1, lsl #16
6c4ee82b94:    	adr	x3, 0x6c4ee82388 <trace+0x7c8>
6c4ee82b98:    	adrp	x16, 0x6c97723000 <trace+0x488a1000>
6c4ee82b9c:    	add	x16, x16, #0xf88
6c4ee82ba0:    	blr	x16
6c4ee82ba4:    	mov	w23, w0
6c4ee82ba8:    	dmb	ishld
6c4ee82bac:    	b	0x6c4ee82388 <trace+0x7c8>
6c4ee82bb0:    	mov	w1, w23
6c4ee82bb4:    	mov	x0, x19
6c4ee82bb8:    	mov	w2, #0x4045             // =16453
6c4ee82bbc:    	movk	w2, #0x1, lsl #16
6c4ee82bc0:    	adr	x3, 0x6c4ee82404 <trace+0x844>
6c4ee82bc4:    	adrp	x16, 0x6c97723000 <trace+0x488a2000>
6c4ee82bc8:    	add	x16, x16, #0xf88
6c4ee82bcc:    	blr	x16
6c4ee82bd0:    	mov	w23, w0
6c4ee82bd4:    	dmb	ishld
6c4ee82bd8:    	b	0x6c4ee82404 <trace+0x844>
6c4ee82bdc:    	mov	w1, w23
6c4ee82be0:    	mov	x0, x19
6c4ee82be4:    	mov	w2, #0x4045             // =16453
6c4ee82be8:    	movk	w2, #0x1, lsl #16
6c4ee82bec:    	adr	x3, 0x6c4ee82480 <trace+0x8c0>
6c4ee82bf0:    	adrp	x16, 0x6c97723000 <trace+0x488a2000>
6c4ee82bf4:    	add	x16, x16, #0xf88
6c4ee82bf8:    	blr	x16
6c4ee82bfc:    	mov	w23, w0
6c4ee82c00:    	dmb	ishld
6c4ee82c04:    	b	0x6c4ee82480 <trace+0x8c0>
6c4ee82c08:    	mov	w1, w23
6c4ee82c0c:    	mov	x2, x24
6c4ee82c10:    	mov	x3, x25
6c4ee82c14:    	mov	x0, x19
6c4ee82c18:    	mov	w4, #0x4085             // =16517
6c4ee82c1c:    	movk	w4, #0x1, lsl #16
6c4ee82c20:    	adr	x5, 0x6c4ee824f0 <trace+0x930>
6c4ee82c24:    	adrp	x16, 0x6c97724000 <trace+0x488a3000>
6c4ee82c28:    	add	x16, x16, #0xfdc
6c4ee82c2c:    	blr	x16
6c4ee82c30:    	dmb	ishld
6c4ee82c34:    	b	0x6c4ee824f0 <trace+0x930>
6c4ee82c38:    	mov	w1, w22
6c4ee82c3c:    	mov	x0, x19
6c4ee82c40:    	mov	w2, #0x4045             // =16453
6c4ee82c44:    	movk	w2, #0x1, lsl #16
6c4ee82c48:    	adr	x3, 0x6c4ee82534 <trace+0x974>
6c4ee82c4c:    	adrp	x16, 0x6c97723000 <trace+0x488a2000>
6c4ee82c50:    	add	x16, x16, #0xf88
6c4ee82c54:    	blr	x16
6c4ee82c58:    	mov	w22, w0
6c4ee82c5c:    	dmb	ishld
6c4ee82c60:    	b	0x6c4ee82534 <trace+0x974>
6c4ee82c64:    	mov	w1, w21
6c4ee82c68:    	mov	x2, x22
6c4ee82c6c:    	mov	x3, x23
6c4ee82c70:    	mov	x0, x19
6c4ee82c74:    	mov	w4, #0x4085             // =16517
6c4ee82c78:    	movk	w4, #0x1, lsl #16
6c4ee82c7c:    	adr	x5, 0x6c4ee825dc <trace+0xa1c>
6c4ee82c80:    	adrp	x16, 0x6c97724000 <trace+0x488a3000>
6c4ee82c84:    	add	x16, x16, #0xfdc
6c4ee82c88:    	blr	x16
6c4ee82c8c:    	dmb	ishld
6c4ee82c90:    	b	0x6c4ee825dc <trace+0xa1c>
6c4ee82c94:    	mov	w1, w21
6c4ee82c98:    	mov	x0, x19
6c4ee82c9c:    	mov	w2, #0x4045             // =16453
6c4ee82ca0:    	movk	w2, #0x1, lsl #16
6c4ee82ca4:    	adr	x3, 0x6c4ee82604 <trace+0xa44>
6c4ee82ca8:    	adrp	x16, 0x6c97723000 <trace+0x488a2000>
6c4ee82cac:    	add	x16, x16, #0xf88
6c4ee82cb0:    	blr	x16
6c4ee82cb4:    	mov	w21, w0
6c4ee82cb8:    	dmb	ishld
6c4ee82cbc:    	b	0x6c4ee82604 <trace+0xa44>
6c4ee82cc0:    	mov	w1, w20
6c4ee82cc4:    	mov	x0, x19
6c4ee82cc8:    	mov	w2, #0x4045             // =16453
6c4ee82ccc:    	movk	w2, #0x1, lsl #16
6c4ee82cd0:    	adr	x3, 0x6c4ee82670 <trace+0xab0>
6c4ee82cd4:    	adrp	x16, 0x6c97723000 <trace+0x488a2000>
6c4ee82cd8:    	add	x16, x16, #0xf88
6c4ee82cdc:    	blr	x16
6c4ee82ce0:    	mov	w21, w0
6c4ee82ce4:    	dmb	ishld
6c4ee82ce8:    	b	0x6c4ee82670 <trace+0xab0>
6c4ee82cec:    	mov	w1, w22
6c4ee82cf0:    	mov	w2, w21
6c4ee82cf4:    	mov	x0, x19
6c4ee82cf8:    	mov	w3, #0x4045             // =16453
6c4ee82cfc:    	movk	w3, #0x1, lsl #16
6c4ee82d00:    	adr	x4, 0x6c4ee826a0 <trace+0xae0>
6c4ee82d04:    	adrp	x16, 0x6c97724000 <trace+0x488a3000>
6c4ee82d08:    	add	x16, x16, #0xb68
6c4ee82d0c:    	blr	x16
6c4ee82d10:    	dmb	ishld
6c4ee82d14:    	b	0x6c4ee826a0 <trace+0xae0>
6c4ee82d18:    	mov	w1, w20
6c4ee82d1c:    	mov	x0, x19
6c4ee82d20:    	mov	w2, #0x4045             // =16453
6c4ee82d24:    	movk	w2, #0x1, lsl #16
6c4ee82d28:    	adr	x3, 0x6c4ee82720 <trace+0xb60>
6c4ee82d2c:    	adrp	x16, 0x6c97723000 <trace+0x488a2000>
6c4ee82d30:    	add	x16, x16, #0xf88
6c4ee82d34:    	blr	x16
6c4ee82d38:    	mov	w21, w0
6c4ee82d3c:    	dmb	ishld
6c4ee82d40:    	b	0x6c4ee82720 <trace+0xb60>
6c4ee82d44:    	mov	w1, w22
6c4ee82d48:    	mov	w2, w21
6c4ee82d4c:    	mov	x0, x19
6c4ee82d50:    	mov	w3, #0x4045             // =16453
6c4ee82d54:    	movk	w3, #0x1, lsl #16
6c4ee82d58:    	adr	x4, 0x6c4ee82748 <trace+0xb88>
6c4ee82d5c:    	adrp	x16, 0x6c97724000 <trace+0x488a3000>
6c4ee82d60:    	add	x16, x16, #0xb68
6c4ee82d64:    	blr	x16
6c4ee82d68:    	dmb	ishld
6c4ee82d6c:    	b	0x6c4ee82748 <trace+0xb88>