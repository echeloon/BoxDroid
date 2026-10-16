
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-250a0-6c4f5e6b80.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006c4f5e6b80 <trace>:
6c4f5e6b80:    	ldur	w20, [x19, #-0x10]  // guest 0x250a0, sampled 0
6c4f5e6b84:    	tbnz	w20, #0x1f, 0x6c4f5e7d48 <trace+0x11c8>  // guest 0x250a0, sampled 0
6c4f5e6b88:    	sturb	wzr, [x19, #-0xc]  // guest 0x250a0, sampled 0
6c4f5e6b8c:    	ldr	w20, [x19, #0x10]  // guest 0x250a0, sampled 0
6c4f5e6b90:    	sub	w20, w20, #0x4  // guest 0x250a0, sampled 0
6c4f5e6b94:    	mov	w21, w20  // guest 0x250a0, sampled 0
6c4f5e6b98:    	ldr	w22, [x19, #0x18]  // guest 0x250a0, sampled 0
6c4f5e6b9c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250a0, sampled 0
6c4f5e6ba0:    	and	x16, x16, x21, lsr #7  // guest 0x250a0, sampled 0
6c4f5e6ba4:    	add	x17, x17, x16  // guest 0x250a0, sampled 0
6c4f5e6ba8:    	ldp	x17, x16, [x17, #0x8]  // guest 0x250a0, sampled 0
6c4f5e6bac:    	and	w30, w21, #0xfffff003  // guest 0x250a0, sampled 0
6c4f5e6bb0:    	cmp	w16, w30  // guest 0x250a0, sampled 0
6c4f5e6bb4:    	b.ne	0x6c4f5e7d50 <trace+0x11d0>  // guest 0x250a0, sampled 0
6c4f5e6bb8:    	add	x30, x17, w21, uxtw  // guest 0x250a0, sampled 0
6c4f5e6bbc:    	stlr	w22, [x30]  // guest 0x250a0, sampled 0
6c4f5e6bc0:    	str	w20, [x19, #0x10]  // guest 0x250a0, sampled 0
6c4f5e6bc4:    	sub	w20, w20, #0x4  // guest 0x250a1, sampled 0
6c4f5e6bc8:    	mov	w21, w20  // guest 0x250a1, sampled 0
6c4f5e6bcc:    	ldr	w22, [x19, #0x1c]  // guest 0x250a1, sampled 0
6c4f5e6bd0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250a1, sampled 0
6c4f5e6bd4:    	and	x16, x16, x21, lsr #7  // guest 0x250a1, sampled 0
6c4f5e6bd8:    	add	x17, x17, x16  // guest 0x250a1, sampled 0
6c4f5e6bdc:    	ldp	x17, x16, [x17, #0x8]  // guest 0x250a1, sampled 0
6c4f5e6be0:    	and	w30, w21, #0xfffff003  // guest 0x250a1, sampled 0
6c4f5e6be4:    	cmp	w16, w30  // guest 0x250a1, sampled 0
6c4f5e6be8:    	b.ne	0x6c4f5e7d7c <trace+0x11fc>  // guest 0x250a1, sampled 0
6c4f5e6bec:    	add	x30, x17, w21, uxtw  // guest 0x250a1, sampled 0
6c4f5e6bf0:    	stlr	w22, [x30]  // guest 0x250a1, sampled 0
6c4f5e6bf4:    	str	w20, [x19, #0x10]  // guest 0x250a1, sampled 0
6c4f5e6bf8:    	add	w21, w20, #0x10  // guest 0x250a2, sampled 0
6c4f5e6bfc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250a2, sampled 0
6c4f5e6c00:    	and	x16, x16, x21, lsr #7  // guest 0x250a2, sampled 1
6c4f5e6c04:    	add	x17, x17, x16  // guest 0x250a2, sampled 0
6c4f5e6c08:    	ldp	x16, x17, [x17]  // guest 0x250a2, sampled 0
6c4f5e6c0c:    	and	w30, w21, #0xfffff003  // guest 0x250a2, sampled 0
6c4f5e6c10:    	cmp	w16, w30  // guest 0x250a2, sampled 0
6c4f5e6c14:    	b.ne	0x6c4f5e7da8 <trace+0x1228>  // guest 0x250a2, sampled 0
6c4f5e6c18:    	add	x30, x17, w21, uxtw  // guest 0x250a2, sampled 0
6c4f5e6c1c:    	ldapr	w21, [x30]  // guest 0x250a2, sampled 0
6c4f5e6c20:    	str	w21, [x19, #0x18]  // guest 0x250a2, sampled 0
6c4f5e6c24:    	add	w22, w20, #0xc  // guest 0x250a6, sampled 0
6c4f5e6c28:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250a6, sampled 0
6c4f5e6c2c:    	and	x16, x16, x22, lsr #7  // guest 0x250a6, sampled 0
6c4f5e6c30:    	add	x17, x17, x16  // guest 0x250a6, sampled 0
6c4f5e6c34:    	ldp	x16, x17, [x17]  // guest 0x250a6, sampled 0
6c4f5e6c38:    	and	w30, w22, #0xfffff003  // guest 0x250a6, sampled 0
6c4f5e6c3c:    	cmp	w16, w30  // guest 0x250a6, sampled 0
6c4f5e6c40:    	b.ne	0x6c4f5e7dd4 <trace+0x1254>  // guest 0x250a6, sampled 0
6c4f5e6c44:    	add	x30, x17, w22, uxtw  // guest 0x250a6, sampled 0
6c4f5e6c48:    	ldapr	w22, [x30]  // guest 0x250a6, sampled 0
6c4f5e6c4c:    	str	w22, [x19, #0x8]  // guest 0x250a6, sampled 0
6c4f5e6c50:    	add	w20, w20, #0x14  // guest 0x250aa, sampled 0
6c4f5e6c54:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250aa, sampled 0
6c4f5e6c58:    	and	x16, x16, x20, lsr #7  // guest 0x250aa, sampled 0
6c4f5e6c5c:    	add	x17, x17, x16  // guest 0x250aa, sampled 0
6c4f5e6c60:    	ldp	x16, x17, [x17]  // guest 0x250aa, sampled 0
6c4f5e6c64:    	and	w30, w20, #0xfffff003  // guest 0x250aa, sampled 0
6c4f5e6c68:    	cmp	w16, w30  // guest 0x250aa, sampled 0
6c4f5e6c6c:    	b.ne	0x6c4f5e7e00 <trace+0x1280>  // guest 0x250aa, sampled 0
6c4f5e6c70:    	add	x30, x17, w20, uxtw  // guest 0x250aa, sampled 0
6c4f5e6c74:    	ldapr	w20, [x30]  // guest 0x250aa, sampled 0
6c4f5e6c78:    	str	w20, [x19, #0x1c]  // guest 0x250aa, sampled 0
6c4f5e6c7c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250ae, sampled 0
6c4f5e6c80:    	and	x16, x16, x21, lsr #7  // guest 0x250ae, sampled 0
6c4f5e6c84:    	add	x17, x17, x16  // guest 0x250ae, sampled 0
6c4f5e6c88:    	ldp	x16, x17, [x17]  // guest 0x250ae, sampled 0
6c4f5e6c8c:    	and	w30, w21, #0xfffff003  // guest 0x250ae, sampled 0
6c4f5e6c90:    	cmp	w16, w30  // guest 0x250ae, sampled 0
6c4f5e6c94:    	b.ne	0x6c4f5e7e2c <trace+0x12ac>  // guest 0x250ae, sampled 0
6c4f5e6c98:    	add	x30, x17, w21, uxtw  // guest 0x250ae, sampled 0
6c4f5e6c9c:    	ldapr	w2, [x30]  // guest 0x250ae, sampled 0
6c4f5e6ca0:    	ldr	w20, [x19, #0x188]  // guest 0x250ae, sampled 0
6c4f5e6ca4:    	add	w22, w20, #0x7  // guest 0x250ae, sampled 0
6c4f5e6ca8:    	and	w22, w22, #0x7  // guest 0x250ae, sampled 0
6c4f5e6cac:    	lsl	w22, w22, #4  // guest 0x250ae, sampled 0
6c4f5e6cb0:    	add	w22, w22, #0x1a0  // guest 0x250ae, sampled 0
6c4f5e6cb4:    	sxtw	x22, w22  // guest 0x250ae, sampled 0
6c4f5e6cb8:    	add	x1, x22, x19  // guest 0x250ae, sampled 0
6c4f5e6cbc:    	mov	x0, x19  // guest 0x250ae, sampled 0
6c4f5e6cc0:    	adrp	x16, 0x6c97751000 <trace+0x4816b000>  // guest 0x250ae, sampled 0
6c4f5e6cc4:    	add	x16, x16, #0x3b4  // guest 0x250ae, sampled 0
6c4f5e6cc8:    	blr	x16  // guest 0x250ae, sampled 0
6c4f5e6ccc:    	sub	w20, w20, #0x1  // guest 0x250ae, sampled 0
6c4f5e6cd0:    	and	w20, w20, #0x7  // guest 0x250ae, sampled 0
6c4f5e6cd4:    	str	w20, [x19, #0x188]  // guest 0x250ae, sampled 0
6c4f5e6cd8:    	sxtw	x22, w20  // guest 0x250ae, sampled 0
6c4f5e6cdc:    	add	x22, x22, x19  // guest 0x250ae, sampled 0
6c4f5e6ce0:    	strb	wzr, [x22, #0x190]  // guest 0x250ae, sampled 0
6c4f5e6ce4:    	ldr	w22, [x19, #0x74]  // guest 0x250ae, sampled 0
6c4f5e6ce8:    	strh	w22, [x19, #0x224]  // guest 0x250ae, sampled 0
6c4f5e6cec:    	str	w21, [x19, #0x230]  // guest 0x250ae, sampled 0
6c4f5e6cf0:    	ldr	w22, [x19, #0x54]  // guest 0x250ae, sampled 0
6c4f5e6cf4:    	strh	w22, [x19, #0x222]  // guest 0x250ae, sampled 0
6c4f5e6cf8:    	mov	w22, #0x50ae            // =20654  // guest 0x250ae, sampled 0
6c4f5e6cfc:    	movk	w22, #0x2, lsl #16  // guest 0x250ae, sampled 0
6c4f5e6d00:    	str	w22, [x19, #0x228]  // guest 0x250ae, sampled 0
6c4f5e6d04:    	add	w22, w21, #0x4  // guest 0x250b0, sampled 0
6c4f5e6d08:    	mov	w23, w22  // guest 0x250b0, sampled 0
6c4f5e6d0c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250b0, sampled 0
6c4f5e6d10:    	and	x16, x16, x22, lsr #7  // guest 0x250b0, sampled 0
6c4f5e6d14:    	add	x17, x17, x16  // guest 0x250b0, sampled 0
6c4f5e6d18:    	ldp	x16, x17, [x17]  // guest 0x250b0, sampled 0
6c4f5e6d1c:    	and	w30, w22, #0xfffff003  // guest 0x250b0, sampled 0
6c4f5e6d20:    	cmp	w16, w30  // guest 0x250b0, sampled 0
6c4f5e6d24:    	b.ne	0x6c4f5e7e58 <trace+0x12d8>  // guest 0x250b0, sampled 0
6c4f5e6d28:    	add	x30, x17, w22, uxtw  // guest 0x250b0, sampled 0
6c4f5e6d2c:    	ldapr	w2, [x30]  // guest 0x250b0, sampled 0
6c4f5e6d30:    	add	w22, w20, #0x7  // guest 0x250b0, sampled 0
6c4f5e6d34:    	and	w22, w22, #0x7  // guest 0x250b0, sampled 0
6c4f5e6d38:    	lsl	w22, w22, #4  // guest 0x250b0, sampled 0
6c4f5e6d3c:    	add	w22, w22, #0x1a0  // guest 0x250b0, sampled 0
6c4f5e6d40:    	sxtw	x22, w22  // guest 0x250b0, sampled 0
6c4f5e6d44:    	add	x1, x22, x19  // guest 0x250b0, sampled 0
6c4f5e6d48:    	mov	x0, x19  // guest 0x250b0, sampled 0
6c4f5e6d4c:    	adrp	x16, 0x6c97751000 <trace+0x4816b000>  // guest 0x250b0, sampled 0
6c4f5e6d50:    	add	x16, x16, #0x3b4  // guest 0x250b0, sampled 0
6c4f5e6d54:    	blr	x16  // guest 0x250b0, sampled 0
6c4f5e6d58:    	sub	w20, w20, #0x1  // guest 0x250b0, sampled 0
6c4f5e6d5c:    	and	w20, w20, #0x7  // guest 0x250b0, sampled 0
6c4f5e6d60:    	str	w20, [x19, #0x188]  // guest 0x250b0, sampled 0
6c4f5e6d64:    	sxtw	x22, w20  // guest 0x250b0, sampled 0
6c4f5e6d68:    	add	x22, x22, x19  // guest 0x250b0, sampled 0
6c4f5e6d6c:    	strb	wzr, [x22, #0x190]  // guest 0x250b0, sampled 0
6c4f5e6d70:    	ldr	w22, [x19, #0x74]  // guest 0x250b0, sampled 0
6c4f5e6d74:    	strh	w22, [x19, #0x224]  // guest 0x250b0, sampled 0
6c4f5e6d78:    	str	w23, [x19, #0x230]  // guest 0x250b0, sampled 0
6c4f5e6d7c:    	ldr	w22, [x19, #0x54]  // guest 0x250b0, sampled 0
6c4f5e6d80:    	strh	w22, [x19, #0x222]  // guest 0x250b0, sampled 0
6c4f5e6d84:    	mov	w22, #0x50b0            // =20656  // guest 0x250b0, sampled 0
6c4f5e6d88:    	movk	w22, #0x2, lsl #16  // guest 0x250b0, sampled 0
6c4f5e6d8c:    	str	w22, [x19, #0x228]  // guest 0x250b0, sampled 0
6c4f5e6d90:    	add	w21, w21, #0x8  // guest 0x250b3, sampled 0
6c4f5e6d94:    	mov	w22, w21  // guest 0x250b3, sampled 0
6c4f5e6d98:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250b3, sampled 0
6c4f5e6d9c:    	and	x16, x16, x21, lsr #7  // guest 0x250b3, sampled 0
6c4f5e6da0:    	add	x17, x17, x16  // guest 0x250b3, sampled 0
6c4f5e6da4:    	ldp	x16, x17, [x17]  // guest 0x250b3, sampled 0
6c4f5e6da8:    	and	w30, w21, #0xfffff003  // guest 0x250b3, sampled 0
6c4f5e6dac:    	cmp	w16, w30  // guest 0x250b3, sampled 0
6c4f5e6db0:    	b.ne	0x6c4f5e7e84 <trace+0x1304>  // guest 0x250b3, sampled 0
6c4f5e6db4:    	add	x30, x17, w21, uxtw  // guest 0x250b3, sampled 0
6c4f5e6db8:    	ldapr	w2, [x30]  // guest 0x250b3, sampled 0
6c4f5e6dbc:    	add	w21, w20, #0x7  // guest 0x250b3, sampled 0
6c4f5e6dc0:    	and	w21, w21, #0x7  // guest 0x250b3, sampled 0
6c4f5e6dc4:    	lsl	w21, w21, #4  // guest 0x250b3, sampled 0
6c4f5e6dc8:    	add	w21, w21, #0x1a0  // guest 0x250b3, sampled 0
6c4f5e6dcc:    	sxtw	x21, w21  // guest 0x250b3, sampled 0
6c4f5e6dd0:    	add	x1, x21, x19  // guest 0x250b3, sampled 0
6c4f5e6dd4:    	mov	x0, x19  // guest 0x250b3, sampled 0
6c4f5e6dd8:    	adrp	x16, 0x6c97751000 <trace+0x4816b000>  // guest 0x250b3, sampled 0
6c4f5e6ddc:    	add	x16, x16, #0x3b4  // guest 0x250b3, sampled 0
6c4f5e6de0:    	blr	x16  // guest 0x250b3, sampled 0
6c4f5e6de4:    	sub	w20, w20, #0x1  // guest 0x250b3, sampled 0
6c4f5e6de8:    	and	w20, w20, #0x7  // guest 0x250b3, sampled 0
6c4f5e6dec:    	str	w20, [x19, #0x188]  // guest 0x250b3, sampled 0
6c4f5e6df0:    	sxtw	x20, w20  // guest 0x250b3, sampled 0
6c4f5e6df4:    	add	x20, x20, x19  // guest 0x250b3, sampled 0
6c4f5e6df8:    	strb	wzr, [x20, #0x190]  // guest 0x250b3, sampled 0
6c4f5e6dfc:    	ldr	w20, [x19, #0x74]  // guest 0x250b3, sampled 0
6c4f5e6e00:    	strh	w20, [x19, #0x224]  // guest 0x250b3, sampled 0
6c4f5e6e04:    	str	w22, [x19, #0x230]  // guest 0x250b3, sampled 0
6c4f5e6e08:    	ldr	w20, [x19, #0x54]  // guest 0x250b3, sampled 0
6c4f5e6e0c:    	strh	w20, [x19, #0x222]  // guest 0x250b3, sampled 0
6c4f5e6e10:    	mov	w20, #0x50b3            // =20659  // guest 0x250b3, sampled 0
6c4f5e6e14:    	movk	w20, #0x2, lsl #16  // guest 0x250b3, sampled 0
6c4f5e6e18:    	str	w20, [x19, #0x228]  // guest 0x250b3, sampled 0
6c4f5e6e1c:    	mov	w1, #0x2                // =2  // guest 0x250b6, sampled 0
6c4f5e6e20:    	mov	x0, x19  // guest 0x250b6, sampled 0
6c4f5e6e24:    	adrp	x16, 0x6c97752000 <trace+0x4816c000>  // guest 0x250b6, sampled 0
6c4f5e6e28:    	add	x16, x16, #0x4d0  // guest 0x250b6, sampled 0
6c4f5e6e2c:    	blr	x16  // guest 0x250b6, sampled 0
6c4f5e6e30:    	ldr	w20, [x19, #0x54]  // guest 0x250b6, sampled 0
6c4f5e6e34:    	strh	w20, [x19, #0x222]  // guest 0x250b6, sampled 0
6c4f5e6e38:    	mov	w20, #0x50b6            // =20662  // guest 0x250b6, sampled 0
6c4f5e6e3c:    	movk	w20, #0x2, lsl #16  // guest 0x250b6, sampled 0
6c4f5e6e40:    	str	w20, [x19, #0x228]  // guest 0x250b6, sampled 0
6c4f5e6e44:    	ldr	w20, [x19, #0x8]  // guest 0x250b8, sampled 0
6c4f5e6e48:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250b8, sampled 0
6c4f5e6e4c:    	and	x16, x16, x20, lsr #7  // guest 0x250b8, sampled 0
6c4f5e6e50:    	add	x17, x17, x16  // guest 0x250b8, sampled 0
6c4f5e6e54:    	ldp	x16, x17, [x17]  // guest 0x250b8, sampled 0
6c4f5e6e58:    	and	w30, w20, #0xfffff003  // guest 0x250b8, sampled 0
6c4f5e6e5c:    	cmp	w16, w30  // guest 0x250b8, sampled 0
6c4f5e6e60:    	b.ne	0x6c4f5e7eb0 <trace+0x1330>  // guest 0x250b8, sampled 0
6c4f5e6e64:    	add	x30, x17, w20, uxtw  // guest 0x250b8, sampled 0
6c4f5e6e68:    	ldapr	w2, [x30]  // guest 0x250b8, sampled 0
6c4f5e6e6c:    	add	x1, x19, #0x258  // guest 0x250b8, sampled 1
6c4f5e6e70:    	mov	x0, x19  // guest 0x250b8, sampled 0
6c4f5e6e74:    	adrp	x16, 0x6c97751000 <trace+0x4816b000>  // guest 0x250b8, sampled 0
6c4f5e6e78:    	add	x16, x16, #0x3b4  // guest 0x250b8, sampled 0
6c4f5e6e7c:    	blr	x16  // guest 0x250b8, sampled 0
6c4f5e6e80:    	ldr	w21, [x19, #0x188]  // guest 0x250b8, sampled 0
6c4f5e6e84:    	lsl	w21, w21, #4  // guest 0x250b8, sampled 0
6c4f5e6e88:    	add	w21, w21, #0x1a0  // guest 0x250b8, sampled 0
6c4f5e6e8c:    	sxtw	x21, w21  // guest 0x250b8, sampled 0
6c4f5e6e90:    	add	x1, x21, x19  // guest 0x250b8, sampled 0
6c4f5e6e94:    	add	x2, x19, #0x258  // guest 0x250b8, sampled 0
6c4f5e6e98:    	mov	x0, x19  // guest 0x250b8, sampled 0
6c4f5e6e9c:    	adrp	x16, 0x6c97752000 <trace+0x4816c000>  // guest 0x250b8, sampled 0
6c4f5e6ea0:    	add	x16, x16, #0xb50  // guest 0x250b8, sampled 0
6c4f5e6ea4:    	blr	x16  // guest 0x250b8, sampled 0
6c4f5e6ea8:    	ldr	w21, [x19, #0x74]  // guest 0x250b8, sampled 0
6c4f5e6eac:    	strh	w21, [x19, #0x224]  // guest 0x250b8, sampled 0
6c4f5e6eb0:    	str	w20, [x19, #0x230]  // guest 0x250b8, sampled 0
6c4f5e6eb4:    	ldr	w20, [x19, #0x54]  // guest 0x250b8, sampled 0
6c4f5e6eb8:    	strh	w20, [x19, #0x222]  // guest 0x250b8, sampled 0
6c4f5e6ebc:    	mov	w20, #0x50b8            // =20664  // guest 0x250b8, sampled 0
6c4f5e6ec0:    	movk	w20, #0x2, lsl #16  // guest 0x250b8, sampled 0
6c4f5e6ec4:    	str	w20, [x19, #0x228]  // guest 0x250b8, sampled 0
6c4f5e6ec8:    	mov	w1, #0x1                // =1  // guest 0x250ba, sampled 0
6c4f5e6ecc:    	mov	x0, x19  // guest 0x250ba, sampled 0
6c4f5e6ed0:    	adrp	x16, 0x6c97752000 <trace+0x4816c000>  // guest 0x250ba, sampled 0
6c4f5e6ed4:    	add	x16, x16, #0x4d0  // guest 0x250ba, sampled 0
6c4f5e6ed8:    	blr	x16  // guest 0x250ba, sampled 0
6c4f5e6edc:    	ldr	w20, [x19, #0x54]  // guest 0x250ba, sampled 0
6c4f5e6ee0:    	strh	w20, [x19, #0x222]  // guest 0x250ba, sampled 0
6c4f5e6ee4:    	mov	w20, #0x50ba            // =20666  // guest 0x250ba, sampled 0
6c4f5e6ee8:    	movk	w20, #0x2, lsl #16  // guest 0x250ba, sampled 0
6c4f5e6eec:    	str	w20, [x19, #0x228]  // guest 0x250ba, sampled 0
6c4f5e6ef0:    	ldr	w20, [x19, #0x8]  // guest 0x250bc, sampled 0
6c4f5e6ef4:    	add	w20, w20, #0x4  // guest 0x250bc, sampled 0
6c4f5e6ef8:    	mov	w21, w20  // guest 0x250bc, sampled 0
6c4f5e6efc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250bc, sampled 0
6c4f5e6f00:    	and	x16, x16, x20, lsr #7  // guest 0x250bc, sampled 0
6c4f5e6f04:    	add	x17, x17, x16  // guest 0x250bc, sampled 0
6c4f5e6f08:    	ldp	x16, x17, [x17]  // guest 0x250bc, sampled 0
6c4f5e6f0c:    	and	w30, w20, #0xfffff003  // guest 0x250bc, sampled 0
6c4f5e6f10:    	cmp	w16, w30  // guest 0x250bc, sampled 0
6c4f5e6f14:    	b.ne	0x6c4f5e7edc <trace+0x135c>  // guest 0x250bc, sampled 0
6c4f5e6f18:    	add	x30, x17, w20, uxtw  // guest 0x250bc, sampled 0
6c4f5e6f1c:    	ldapr	w2, [x30]  // guest 0x250bc, sampled 0
6c4f5e6f20:    	add	x1, x19, #0x258  // guest 0x250bc, sampled 0
6c4f5e6f24:    	mov	x0, x19  // guest 0x250bc, sampled 0
6c4f5e6f28:    	adrp	x16, 0x6c97751000 <trace+0x4816b000>  // guest 0x250bc, sampled 0
6c4f5e6f2c:    	add	x16, x16, #0x3b4  // guest 0x250bc, sampled 0
6c4f5e6f30:    	blr	x16  // guest 0x250bc, sampled 0
6c4f5e6f34:    	ldr	w20, [x19, #0x188]  // guest 0x250bc, sampled 0
6c4f5e6f38:    	lsl	w20, w20, #4  // guest 0x250bc, sampled 0
6c4f5e6f3c:    	add	w20, w20, #0x1a0  // guest 0x250bc, sampled 0
6c4f5e6f40:    	sxtw	x20, w20  // guest 0x250bc, sampled 0
6c4f5e6f44:    	add	x1, x20, x19  // guest 0x250bc, sampled 0
6c4f5e6f48:    	add	x2, x19, #0x258  // guest 0x250bc, sampled 0
6c4f5e6f4c:    	mov	x0, x19  // guest 0x250bc, sampled 0
6c4f5e6f50:    	adrp	x16, 0x6c97752000 <trace+0x4816c000>  // guest 0x250bc, sampled 0
6c4f5e6f54:    	add	x16, x16, #0xb50  // guest 0x250bc, sampled 0
6c4f5e6f58:    	blr	x16  // guest 0x250bc, sampled 0
6c4f5e6f5c:    	ldr	w20, [x19, #0x74]  // guest 0x250bc, sampled 0
6c4f5e6f60:    	strh	w20, [x19, #0x224]  // guest 0x250bc, sampled 0
6c4f5e6f64:    	str	w21, [x19, #0x230]  // guest 0x250bc, sampled 0
6c4f5e6f68:    	ldr	w20, [x19, #0x54]  // guest 0x250bc, sampled 0
6c4f5e6f6c:    	strh	w20, [x19, #0x222]  // guest 0x250bc, sampled 0
6c4f5e6f70:    	mov	w20, #0x50bc            // =20668  // guest 0x250bc, sampled 0
6c4f5e6f74:    	movk	w20, #0x2, lsl #16  // guest 0x250bc, sampled 0
6c4f5e6f78:    	str	w20, [x19, #0x228]  // guest 0x250bc, sampled 0
6c4f5e6f7c:    	mov	w1, #0x2                // =2  // guest 0x250bf, sampled 0
6c4f5e6f80:    	mov	x0, x19  // guest 0x250bf, sampled 0
6c4f5e6f84:    	adrp	x16, 0x6c97752000 <trace+0x4816c000>  // guest 0x250bf, sampled 0
6c4f5e6f88:    	add	x16, x16, #0x4d0  // guest 0x250bf, sampled 0
6c4f5e6f8c:    	blr	x16  // guest 0x250bf, sampled 0
6c4f5e6f90:    	ldr	w20, [x19, #0x54]  // guest 0x250bf, sampled 0
6c4f5e6f94:    	strh	w20, [x19, #0x222]  // guest 0x250bf, sampled 0
6c4f5e6f98:    	mov	w20, #0x50bf            // =20671  // guest 0x250bf, sampled 0
6c4f5e6f9c:    	movk	w20, #0x2, lsl #16  // guest 0x250bf, sampled 0
6c4f5e6fa0:    	str	w20, [x19, #0x228]  // guest 0x250bf, sampled 0
6c4f5e6fa4:    	ldr	w20, [x19, #0x8]  // guest 0x250c1, sampled 0
6c4f5e6fa8:    	add	w20, w20, #0x8  // guest 0x250c1, sampled 0
6c4f5e6fac:    	mov	w21, w20  // guest 0x250c1, sampled 0
6c4f5e6fb0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250c1, sampled 0
6c4f5e6fb4:    	and	x16, x16, x20, lsr #7  // guest 0x250c1, sampled 0
6c4f5e6fb8:    	add	x17, x17, x16  // guest 0x250c1, sampled 0
6c4f5e6fbc:    	ldp	x16, x17, [x17]  // guest 0x250c1, sampled 0
6c4f5e6fc0:    	and	w30, w20, #0xfffff003  // guest 0x250c1, sampled 0
6c4f5e6fc4:    	cmp	w16, w30  // guest 0x250c1, sampled 0
6c4f5e6fc8:    	b.ne	0x6c4f5e7f08 <trace+0x1388>  // guest 0x250c1, sampled 0
6c4f5e6fcc:    	add	x30, x17, w20, uxtw  // guest 0x250c1, sampled 0
6c4f5e6fd0:    	ldapr	w2, [x30]  // guest 0x250c1, sampled 0
6c4f5e6fd4:    	add	x1, x19, #0x258  // guest 0x250c1, sampled 0
6c4f5e6fd8:    	mov	x0, x19  // guest 0x250c1, sampled 0
6c4f5e6fdc:    	adrp	x16, 0x6c97751000 <trace+0x4816b000>  // guest 0x250c1, sampled 0
6c4f5e6fe0:    	add	x16, x16, #0x3b4  // guest 0x250c1, sampled 0
6c4f5e6fe4:    	blr	x16  // guest 0x250c1, sampled 0
6c4f5e6fe8:    	ldr	w20, [x19, #0x188]  // guest 0x250c1, sampled 0
6c4f5e6fec:    	lsl	w20, w20, #4  // guest 0x250c1, sampled 0
6c4f5e6ff0:    	add	w20, w20, #0x1a0  // guest 0x250c1, sampled 0
6c4f5e6ff4:    	sxtw	x20, w20  // guest 0x250c1, sampled 0
6c4f5e6ff8:    	add	x1, x20, x19  // guest 0x250c1, sampled 0
6c4f5e6ffc:    	add	x2, x19, #0x258  // guest 0x250c1, sampled 0
6c4f5e7000:    	mov	x0, x19  // guest 0x250c1, sampled 0
6c4f5e7004:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x250c1, sampled 0
6c4f5e7008:    	add	x16, x16, #0xb50  // guest 0x250c1, sampled 0
6c4f5e700c:    	blr	x16  // guest 0x250c1, sampled 0
6c4f5e7010:    	ldr	w20, [x19, #0x74]  // guest 0x250c1, sampled 0
6c4f5e7014:    	strh	w20, [x19, #0x224]  // guest 0x250c1, sampled 0
6c4f5e7018:    	str	w21, [x19, #0x230]  // guest 0x250c1, sampled 0
6c4f5e701c:    	ldr	w20, [x19, #0x54]  // guest 0x250c1, sampled 0
6c4f5e7020:    	strh	w20, [x19, #0x222]  // guest 0x250c1, sampled 0
6c4f5e7024:    	mov	w20, #0x50c1            // =20673  // guest 0x250c1, sampled 0
6c4f5e7028:    	movk	w20, #0x2, lsl #16  // guest 0x250c1, sampled 0
6c4f5e702c:    	str	w20, [x19, #0x228]  // guest 0x250c1, sampled 0
6c4f5e7030:    	mov	w1, #0x1                // =1  // guest 0x250c4, sampled 0
6c4f5e7034:    	mov	x0, x19  // guest 0x250c4, sampled 0
6c4f5e7038:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x250c4, sampled 0
6c4f5e703c:    	add	x16, x16, #0x4d0  // guest 0x250c4, sampled 0
6c4f5e7040:    	blr	x16  // guest 0x250c4, sampled 0
6c4f5e7044:    	ldr	w20, [x19, #0x54]  // guest 0x250c4, sampled 0
6c4f5e7048:    	strh	w20, [x19, #0x222]  // guest 0x250c4, sampled 0
6c4f5e704c:    	mov	w20, #0x50c4            // =20676  // guest 0x250c4, sampled 0
6c4f5e7050:    	movk	w20, #0x2, lsl #16  // guest 0x250c4, sampled 0
6c4f5e7054:    	str	w20, [x19, #0x228]  // guest 0x250c4, sampled 0
6c4f5e7058:    	ldr	w20, [x19, #0x188]  // guest 0x250c6, sampled 0
6c4f5e705c:    	sub	w20, w20, #0x1  // guest 0x250c6, sampled 0
6c4f5e7060:    	and	w20, w20, #0x7  // guest 0x250c6, sampled 1
6c4f5e7064:    	str	w20, [x19, #0x188]  // guest 0x250c6, sampled 0
6c4f5e7068:    	sxtw	x21, w20  // guest 0x250c6, sampled 0
6c4f5e706c:    	add	x21, x21, x19  // guest 0x250c6, sampled 0
6c4f5e7070:    	strb	wzr, [x21, #0x190]  // guest 0x250c6, sampled 0
6c4f5e7074:    	lsl	w21, w20, #4  // guest 0x250c6, sampled 0
6c4f5e7078:    	add	w21, w21, #0x1a0  // guest 0x250c6, sampled 0
6c4f5e707c:    	sxtw	x21, w21  // guest 0x250c6, sampled 0
6c4f5e7080:    	add	x21, x21, x19  // guest 0x250c6, sampled 0
6c4f5e7084:    	add	w22, w20, #0x1  // guest 0x250c6, sampled 0
6c4f5e7088:    	and	w22, w22, #0x7  // guest 0x250c6, sampled 0
6c4f5e708c:    	lsl	w22, w22, #4  // guest 0x250c6, sampled 0
6c4f5e7090:    	add	w22, w22, #0x1a0  // guest 0x250c6, sampled 0
6c4f5e7094:    	sxtw	x22, w22  // guest 0x250c6, sampled 0
6c4f5e7098:    	add	x22, x22, x19  // guest 0x250c6, sampled 0
6c4f5e709c:    	ldr	x23, [x22]  // guest 0x250c6, sampled 0
6c4f5e70a0:    	ldrh	w22, [x22, #0x8]  // guest 0x250c6, sampled 1
6c4f5e70a4:    	str	x23, [x21]  // guest 0x250c6, sampled 0
6c4f5e70a8:    	strh	w22, [x21, #0x8]  // guest 0x250c6, sampled 0
6c4f5e70ac:    	ldr	w21, [x19, #0x54]  // guest 0x250c6, sampled 0
6c4f5e70b0:    	strh	w21, [x19, #0x222]  // guest 0x250c6, sampled 0
6c4f5e70b4:    	mov	w21, #0x50c6            // =20678  // guest 0x250c6, sampled 0
6c4f5e70b8:    	movk	w21, #0x2, lsl #16  // guest 0x250c6, sampled 0
6c4f5e70bc:    	str	w21, [x19, #0x228]  // guest 0x250c6, sampled 0
6c4f5e70c0:    	ldr	w21, [x19, #0x8]  // guest 0x250c8, sampled 0
6c4f5e70c4:    	add	w22, w21, #0xc  // guest 0x250c8, sampled 0
6c4f5e70c8:    	mov	w23, w22  // guest 0x250c8, sampled 0
6c4f5e70cc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250c8, sampled 0
6c4f5e70d0:    	and	x16, x16, x22, lsr #7  // guest 0x250c8, sampled 0
6c4f5e70d4:    	add	x17, x17, x16  // guest 0x250c8, sampled 0
6c4f5e70d8:    	ldp	x16, x17, [x17]  // guest 0x250c8, sampled 0
6c4f5e70dc:    	and	w30, w22, #0xfffff003  // guest 0x250c8, sampled 0
6c4f5e70e0:    	cmp	w16, w30  // guest 0x250c8, sampled 0
6c4f5e70e4:    	b.ne	0x6c4f5e7f34 <trace+0x13b4>  // guest 0x250c8, sampled 0
6c4f5e70e8:    	add	x30, x17, w22, uxtw  // guest 0x250c8, sampled 0
6c4f5e70ec:    	ldapr	w2, [x30]  // guest 0x250c8, sampled 0
6c4f5e70f0:    	add	x1, x19, #0x258  // guest 0x250c8, sampled 0
6c4f5e70f4:    	mov	x0, x19  // guest 0x250c8, sampled 0
6c4f5e70f8:    	adrp	x16, 0x6c97751000 <trace+0x4816a000>  // guest 0x250c8, sampled 0
6c4f5e70fc:    	add	x16, x16, #0x3b4  // guest 0x250c8, sampled 0
6c4f5e7100:    	blr	x16  // guest 0x250c8, sampled 0
6c4f5e7104:    	lsl	w22, w20, #4  // guest 0x250c8, sampled 0
6c4f5e7108:    	add	w22, w22, #0x1a0  // guest 0x250c8, sampled 0
6c4f5e710c:    	sxtw	x22, w22  // guest 0x250c8, sampled 0
6c4f5e7110:    	add	x1, x22, x19  // guest 0x250c8, sampled 0
6c4f5e7114:    	add	x2, x19, #0x258  // guest 0x250c8, sampled 0
6c4f5e7118:    	mov	x0, x19  // guest 0x250c8, sampled 0
6c4f5e711c:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x250c8, sampled 0
6c4f5e7120:    	add	x16, x16, #0xa7c  // guest 0x250c8, sampled 0
6c4f5e7124:    	blr	x16  // guest 0x250c8, sampled 0
6c4f5e7128:    	ldr	w22, [x19, #0x74]  // guest 0x250c8, sampled 0
6c4f5e712c:    	strh	w22, [x19, #0x224]  // guest 0x250c8, sampled 0
6c4f5e7130:    	str	w23, [x19, #0x230]  // guest 0x250c8, sampled 0
6c4f5e7134:    	ldr	w22, [x19, #0x54]  // guest 0x250c8, sampled 0
6c4f5e7138:    	strh	w22, [x19, #0x222]  // guest 0x250c8, sampled 0
6c4f5e713c:    	mov	w22, #0x50c8            // =20680  // guest 0x250c8, sampled 0
6c4f5e7140:    	movk	w22, #0x2, lsl #16  // guest 0x250c8, sampled 0
6c4f5e7144:    	str	w22, [x19, #0x228]  // guest 0x250c8, sampled 0
6c4f5e7148:    	sub	w20, w20, #0x1  // guest 0x250cb, sampled 0
6c4f5e714c:    	and	w20, w20, #0x7  // guest 0x250cb, sampled 0
6c4f5e7150:    	str	w20, [x19, #0x188]  // guest 0x250cb, sampled 0
6c4f5e7154:    	sxtw	x22, w20  // guest 0x250cb, sampled 0
6c4f5e7158:    	add	x22, x22, x19  // guest 0x250cb, sampled 0
6c4f5e715c:    	strb	wzr, [x22, #0x190]  // guest 0x250cb, sampled 0
6c4f5e7160:    	lsl	w22, w20, #4  // guest 0x250cb, sampled 0
6c4f5e7164:    	add	w22, w22, #0x1a0  // guest 0x250cb, sampled 0
6c4f5e7168:    	sxtw	x22, w22  // guest 0x250cb, sampled 0
6c4f5e716c:    	add	x22, x22, x19  // guest 0x250cb, sampled 0
6c4f5e7170:    	add	w23, w20, #0x2  // guest 0x250cb, sampled 0
6c4f5e7174:    	and	w23, w23, #0x7  // guest 0x250cb, sampled 0
6c4f5e7178:    	lsl	w23, w23, #4  // guest 0x250cb, sampled 0
6c4f5e717c:    	add	w23, w23, #0x1a0  // guest 0x250cb, sampled 0
6c4f5e7180:    	sxtw	x23, w23  // guest 0x250cb, sampled 0
6c4f5e7184:    	add	x23, x23, x19  // guest 0x250cb, sampled 0
6c4f5e7188:    	ldr	x24, [x23]  // guest 0x250cb, sampled 0
6c4f5e718c:    	ldrh	w23, [x23, #0x8]  // guest 0x250cb, sampled 0
6c4f5e7190:    	str	x24, [x22]  // guest 0x250cb, sampled 0
6c4f5e7194:    	strh	w23, [x22, #0x8]  // guest 0x250cb, sampled 0
6c4f5e7198:    	ldr	w22, [x19, #0x54]  // guest 0x250cb, sampled 0
6c4f5e719c:    	strh	w22, [x19, #0x222]  // guest 0x250cb, sampled 0
6c4f5e71a0:    	mov	w22, #0x50cb            // =20683  // guest 0x250cb, sampled 0
6c4f5e71a4:    	movk	w22, #0x2, lsl #16  // guest 0x250cb, sampled 0
6c4f5e71a8:    	str	w22, [x19, #0x228]  // guest 0x250cb, sampled 0
6c4f5e71ac:    	add	w21, w21, #0x18  // guest 0x250cd, sampled 0
6c4f5e71b0:    	mov	w22, w21  // guest 0x250cd, sampled 0
6c4f5e71b4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250cd, sampled 0
6c4f5e71b8:    	and	x16, x16, x21, lsr #7  // guest 0x250cd, sampled 0
6c4f5e71bc:    	add	x17, x17, x16  // guest 0x250cd, sampled 0
6c4f5e71c0:    	ldp	x16, x17, [x17]  // guest 0x250cd, sampled 0
6c4f5e71c4:    	and	w30, w21, #0xfffff003  // guest 0x250cd, sampled 0
6c4f5e71c8:    	cmp	w16, w30  // guest 0x250cd, sampled 0
6c4f5e71cc:    	b.ne	0x6c4f5e7f60 <trace+0x13e0>  // guest 0x250cd, sampled 0
6c4f5e71d0:    	add	x30, x17, w21, uxtw  // guest 0x250cd, sampled 0
6c4f5e71d4:    	ldapr	w2, [x30]  // guest 0x250cd, sampled 0
6c4f5e71d8:    	add	x1, x19, #0x258  // guest 0x250cd, sampled 1
6c4f5e71dc:    	mov	x0, x19  // guest 0x250cd, sampled 0
6c4f5e71e0:    	adrp	x16, 0x6c97751000 <trace+0x4816a000>  // guest 0x250cd, sampled 0
6c4f5e71e4:    	add	x16, x16, #0x3b4  // guest 0x250cd, sampled 0
6c4f5e71e8:    	blr	x16  // guest 0x250cd, sampled 0
6c4f5e71ec:    	lsl	w20, w20, #4  // guest 0x250cd, sampled 0
6c4f5e71f0:    	add	w20, w20, #0x1a0  // guest 0x250cd, sampled 0
6c4f5e71f4:    	sxtw	x20, w20  // guest 0x250cd, sampled 0
6c4f5e71f8:    	add	x1, x20, x19  // guest 0x250cd, sampled 0
6c4f5e71fc:    	add	x2, x19, #0x258  // guest 0x250cd, sampled 0
6c4f5e7200:    	mov	x0, x19  // guest 0x250cd, sampled 0
6c4f5e7204:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x250cd, sampled 0
6c4f5e7208:    	add	x16, x16, #0xa7c  // guest 0x250cd, sampled 0
6c4f5e720c:    	blr	x16  // guest 0x250cd, sampled 0
6c4f5e7210:    	ldr	w20, [x19, #0x74]  // guest 0x250cd, sampled 0
6c4f5e7214:    	strh	w20, [x19, #0x224]  // guest 0x250cd, sampled 0
6c4f5e7218:    	str	w22, [x19, #0x230]  // guest 0x250cd, sampled 0
6c4f5e721c:    	ldr	w20, [x19, #0x54]  // guest 0x250cd, sampled 0
6c4f5e7220:    	strh	w20, [x19, #0x222]  // guest 0x250cd, sampled 0
6c4f5e7224:    	mov	w20, #0x50cd            // =20685  // guest 0x250cd, sampled 0
6c4f5e7228:    	movk	w20, #0x2, lsl #16  // guest 0x250cd, sampled 0
6c4f5e722c:    	str	w20, [x19, #0x228]  // guest 0x250cd, sampled 0
6c4f5e7230:    	mov	w1, #0x2                // =2  // guest 0x250d0, sampled 0
6c4f5e7234:    	mov	x0, x19  // guest 0x250d0, sampled 0
6c4f5e7238:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x250d0, sampled 0
6c4f5e723c:    	add	x16, x16, #0x4d0  // guest 0x250d0, sampled 0
6c4f5e7240:    	blr	x16  // guest 0x250d0, sampled 0
6c4f5e7244:    	ldr	w20, [x19, #0x54]  // guest 0x250d0, sampled 0
6c4f5e7248:    	strh	w20, [x19, #0x222]  // guest 0x250d0, sampled 0
6c4f5e724c:    	mov	w20, #0x50d0            // =20688  // guest 0x250d0, sampled 0
6c4f5e7250:    	movk	w20, #0x2, lsl #16  // guest 0x250d0, sampled 0
6c4f5e7254:    	str	w20, [x19, #0x228]  // guest 0x250d0, sampled 0
6c4f5e7258:    	ldr	w20, [x19, #0x8]  // guest 0x250d2, sampled 0
6c4f5e725c:    	add	w20, w20, #0x24  // guest 0x250d2, sampled 0
6c4f5e7260:    	mov	w21, w20  // guest 0x250d2, sampled 0
6c4f5e7264:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250d2, sampled 0
6c4f5e7268:    	and	x16, x16, x20, lsr #7  // guest 0x250d2, sampled 0
6c4f5e726c:    	add	x17, x17, x16  // guest 0x250d2, sampled 0
6c4f5e7270:    	ldp	x16, x17, [x17]  // guest 0x250d2, sampled 0
6c4f5e7274:    	and	w30, w20, #0xfffff003  // guest 0x250d2, sampled 0
6c4f5e7278:    	cmp	w16, w30  // guest 0x250d2, sampled 0
6c4f5e727c:    	b.ne	0x6c4f5e7f8c <trace+0x140c>  // guest 0x250d2, sampled 0
6c4f5e7280:    	add	x30, x17, w20, uxtw  // guest 0x250d2, sampled 0
6c4f5e7284:    	ldapr	w2, [x30]  // guest 0x250d2, sampled 0
6c4f5e7288:    	add	x1, x19, #0x258  // guest 0x250d2, sampled 0
6c4f5e728c:    	mov	x0, x19  // guest 0x250d2, sampled 0
6c4f5e7290:    	adrp	x16, 0x6c97751000 <trace+0x4816a000>  // guest 0x250d2, sampled 0
6c4f5e7294:    	add	x16, x16, #0x3b4  // guest 0x250d2, sampled 0
6c4f5e7298:    	blr	x16  // guest 0x250d2, sampled 0
6c4f5e729c:    	ldr	w20, [x19, #0x188]  // guest 0x250d2, sampled 0
6c4f5e72a0:    	lsl	w20, w20, #4  // guest 0x250d2, sampled 1
6c4f5e72a4:    	add	w20, w20, #0x1a0  // guest 0x250d2, sampled 0
6c4f5e72a8:    	sxtw	x20, w20  // guest 0x250d2, sampled 0
6c4f5e72ac:    	add	x1, x20, x19  // guest 0x250d2, sampled 0
6c4f5e72b0:    	add	x2, x19, #0x258  // guest 0x250d2, sampled 0
6c4f5e72b4:    	mov	x0, x19  // guest 0x250d2, sampled 0
6c4f5e72b8:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x250d2, sampled 0
6c4f5e72bc:    	add	x16, x16, #0xa7c  // guest 0x250d2, sampled 0
6c4f5e72c0:    	blr	x16  // guest 0x250d2, sampled 0
6c4f5e72c4:    	ldr	w20, [x19, #0x74]  // guest 0x250d2, sampled 0
6c4f5e72c8:    	strh	w20, [x19, #0x224]  // guest 0x250d2, sampled 0
6c4f5e72cc:    	str	w21, [x19, #0x230]  // guest 0x250d2, sampled 0
6c4f5e72d0:    	ldr	w20, [x19, #0x54]  // guest 0x250d2, sampled 0
6c4f5e72d4:    	strh	w20, [x19, #0x222]  // guest 0x250d2, sampled 0
6c4f5e72d8:    	mov	w20, #0x50d2            // =20690  // guest 0x250d2, sampled 0
6c4f5e72dc:    	movk	w20, #0x2, lsl #16  // guest 0x250d2, sampled 0
6c4f5e72e0:    	str	w20, [x19, #0x228]  // guest 0x250d2, sampled 0
6c4f5e72e4:    	mov	w1, #0x4                // =4  // guest 0x250d5, sampled 0
6c4f5e72e8:    	mov	x0, x19  // guest 0x250d5, sampled 0
6c4f5e72ec:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x250d5, sampled 0
6c4f5e72f0:    	add	x16, x16, #0x4d0  // guest 0x250d5, sampled 0
6c4f5e72f4:    	blr	x16  // guest 0x250d5, sampled 0
6c4f5e72f8:    	ldr	w20, [x19, #0x54]  // guest 0x250d5, sampled 0
6c4f5e72fc:    	strh	w20, [x19, #0x222]  // guest 0x250d5, sampled 0
6c4f5e7300:    	mov	w20, #0x50d5            // =20693  // guest 0x250d5, sampled 0
6c4f5e7304:    	movk	w20, #0x2, lsl #16  // guest 0x250d5, sampled 0
6c4f5e7308:    	str	w20, [x19, #0x228]  // guest 0x250d5, sampled 0
6c4f5e730c:    	ldr	w20, [x19, #0x188]  // guest 0x250d7, sampled 0
6c4f5e7310:    	sub	w20, w20, #0x1  // guest 0x250d7, sampled 0
6c4f5e7314:    	and	w20, w20, #0x7  // guest 0x250d7, sampled 0
6c4f5e7318:    	str	w20, [x19, #0x188]  // guest 0x250d7, sampled 0
6c4f5e731c:    	sxtw	x21, w20  // guest 0x250d7, sampled 0
6c4f5e7320:    	add	x21, x21, x19  // guest 0x250d7, sampled 0
6c4f5e7324:    	strb	wzr, [x21, #0x190]  // guest 0x250d7, sampled 0
6c4f5e7328:    	lsl	w21, w20, #4  // guest 0x250d7, sampled 0
6c4f5e732c:    	add	w21, w21, #0x1a0  // guest 0x250d7, sampled 0
6c4f5e7330:    	sxtw	x21, w21  // guest 0x250d7, sampled 0
6c4f5e7334:    	add	x21, x21, x19  // guest 0x250d7, sampled 1
6c4f5e7338:    	add	w22, w20, #0x1  // guest 0x250d7, sampled 0
6c4f5e733c:    	and	w22, w22, #0x7  // guest 0x250d7, sampled 0
6c4f5e7340:    	lsl	w22, w22, #4  // guest 0x250d7, sampled 0
6c4f5e7344:    	add	w22, w22, #0x1a0  // guest 0x250d7, sampled 0
6c4f5e7348:    	sxtw	x22, w22  // guest 0x250d7, sampled 0
6c4f5e734c:    	add	x22, x22, x19  // guest 0x250d7, sampled 0
6c4f5e7350:    	ldr	x23, [x22]  // guest 0x250d7, sampled 0
6c4f5e7354:    	ldrh	w22, [x22, #0x8]  // guest 0x250d7, sampled 0
6c4f5e7358:    	str	x23, [x21]  // guest 0x250d7, sampled 0
6c4f5e735c:    	strh	w22, [x21, #0x8]  // guest 0x250d7, sampled 0
6c4f5e7360:    	ldr	w21, [x19, #0x54]  // guest 0x250d7, sampled 0
6c4f5e7364:    	strh	w21, [x19, #0x222]  // guest 0x250d7, sampled 0
6c4f5e7368:    	mov	w21, #0x50d7            // =20695  // guest 0x250d7, sampled 0
6c4f5e736c:    	movk	w21, #0x2, lsl #16  // guest 0x250d7, sampled 0
6c4f5e7370:    	str	w21, [x19, #0x228]  // guest 0x250d7, sampled 0
6c4f5e7374:    	ldr	w21, [x19, #0x8]  // guest 0x250d9, sampled 0
6c4f5e7378:    	add	w22, w21, #0x10  // guest 0x250d9, sampled 0
6c4f5e737c:    	mov	w23, w22  // guest 0x250d9, sampled 0
6c4f5e7380:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250d9, sampled 0
6c4f5e7384:    	and	x16, x16, x22, lsr #7  // guest 0x250d9, sampled 0
6c4f5e7388:    	add	x17, x17, x16  // guest 0x250d9, sampled 0
6c4f5e738c:    	ldp	x16, x17, [x17]  // guest 0x250d9, sampled 0
6c4f5e7390:    	and	w30, w22, #0xfffff003  // guest 0x250d9, sampled 0
6c4f5e7394:    	cmp	w16, w30  // guest 0x250d9, sampled 0
6c4f5e7398:    	b.ne	0x6c4f5e7fb8 <trace+0x1438>  // guest 0x250d9, sampled 0
6c4f5e739c:    	add	x30, x17, w22, uxtw  // guest 0x250d9, sampled 0
6c4f5e73a0:    	ldapr	w2, [x30]  // guest 0x250d9, sampled 0
6c4f5e73a4:    	add	x1, x19, #0x258  // guest 0x250d9, sampled 0
6c4f5e73a8:    	mov	x0, x19  // guest 0x250d9, sampled 0
6c4f5e73ac:    	adrp	x16, 0x6c97751000 <trace+0x4816a000>  // guest 0x250d9, sampled 0
6c4f5e73b0:    	add	x16, x16, #0x3b4  // guest 0x250d9, sampled 0
6c4f5e73b4:    	blr	x16  // guest 0x250d9, sampled 0
6c4f5e73b8:    	lsl	w22, w20, #4  // guest 0x250d9, sampled 0
6c4f5e73bc:    	add	w22, w22, #0x1a0  // guest 0x250d9, sampled 0
6c4f5e73c0:    	sxtw	x22, w22  // guest 0x250d9, sampled 0
6c4f5e73c4:    	add	x1, x22, x19  // guest 0x250d9, sampled 0
6c4f5e73c8:    	add	x2, x19, #0x258  // guest 0x250d9, sampled 0
6c4f5e73cc:    	mov	x0, x19  // guest 0x250d9, sampled 0
6c4f5e73d0:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x250d9, sampled 0
6c4f5e73d4:    	add	x16, x16, #0xa7c  // guest 0x250d9, sampled 0
6c4f5e73d8:    	blr	x16  // guest 0x250d9, sampled 0
6c4f5e73dc:    	ldr	w22, [x19, #0x74]  // guest 0x250d9, sampled 0
6c4f5e73e0:    	strh	w22, [x19, #0x224]  // guest 0x250d9, sampled 0
6c4f5e73e4:    	str	w23, [x19, #0x230]  // guest 0x250d9, sampled 0
6c4f5e73e8:    	ldr	w22, [x19, #0x54]  // guest 0x250d9, sampled 0
6c4f5e73ec:    	strh	w22, [x19, #0x222]  // guest 0x250d9, sampled 0
6c4f5e73f0:    	mov	w22, #0x50d9            // =20697  // guest 0x250d9, sampled 0
6c4f5e73f4:    	movk	w22, #0x2, lsl #16  // guest 0x250d9, sampled 0
6c4f5e73f8:    	str	w22, [x19, #0x228]  // guest 0x250d9, sampled 0
6c4f5e73fc:    	sub	w20, w20, #0x1  // guest 0x250dc, sampled 0
6c4f5e7400:    	and	w20, w20, #0x7  // guest 0x250dc, sampled 0
6c4f5e7404:    	str	w20, [x19, #0x188]  // guest 0x250dc, sampled 0
6c4f5e7408:    	sxtw	x22, w20  // guest 0x250dc, sampled 0
6c4f5e740c:    	add	x22, x22, x19  // guest 0x250dc, sampled 0
6c4f5e7410:    	strb	wzr, [x22, #0x190]  // guest 0x250dc, sampled 0
6c4f5e7414:    	lsl	w22, w20, #4  // guest 0x250dc, sampled 0
6c4f5e7418:    	add	w22, w22, #0x1a0  // guest 0x250dc, sampled 0
6c4f5e741c:    	sxtw	x22, w22  // guest 0x250dc, sampled 0
6c4f5e7420:    	add	x22, x22, x19  // guest 0x250dc, sampled 0
6c4f5e7424:    	add	w23, w20, #0x2  // guest 0x250dc, sampled 0
6c4f5e7428:    	and	w23, w23, #0x7  // guest 0x250dc, sampled 0
6c4f5e742c:    	lsl	w23, w23, #4  // guest 0x250dc, sampled 0
6c4f5e7430:    	add	w23, w23, #0x1a0  // guest 0x250dc, sampled 0
6c4f5e7434:    	sxtw	x23, w23  // guest 0x250dc, sampled 0
6c4f5e7438:    	add	x23, x23, x19  // guest 0x250dc, sampled 0
6c4f5e743c:    	ldr	x24, [x23]  // guest 0x250dc, sampled 0
6c4f5e7440:    	ldrh	w23, [x23, #0x8]  // guest 0x250dc, sampled 0
6c4f5e7444:    	str	x24, [x22]  // guest 0x250dc, sampled 0
6c4f5e7448:    	strh	w23, [x22, #0x8]  // guest 0x250dc, sampled 0
6c4f5e744c:    	ldr	w22, [x19, #0x54]  // guest 0x250dc, sampled 0
6c4f5e7450:    	strh	w22, [x19, #0x222]  // guest 0x250dc, sampled 0
6c4f5e7454:    	mov	w22, #0x50dc            // =20700  // guest 0x250dc, sampled 0
6c4f5e7458:    	movk	w22, #0x2, lsl #16  // guest 0x250dc, sampled 0
6c4f5e745c:    	str	w22, [x19, #0x228]  // guest 0x250dc, sampled 0
6c4f5e7460:    	add	w21, w21, #0x1c  // guest 0x250de, sampled 0
6c4f5e7464:    	mov	w22, w21  // guest 0x250de, sampled 0
6c4f5e7468:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250de, sampled 0
6c4f5e746c:    	and	x16, x16, x21, lsr #7  // guest 0x250de, sampled 0
6c4f5e7470:    	add	x17, x17, x16  // guest 0x250de, sampled 0
6c4f5e7474:    	ldp	x16, x17, [x17]  // guest 0x250de, sampled 0
6c4f5e7478:    	and	w30, w21, #0xfffff003  // guest 0x250de, sampled 1
6c4f5e747c:    	cmp	w16, w30  // guest 0x250de, sampled 0
6c4f5e7480:    	b.ne	0x6c4f5e7fe4 <trace+0x1464>  // guest 0x250de, sampled 1
6c4f5e7484:    	add	x30, x17, w21, uxtw  // guest 0x250de, sampled 0
6c4f5e7488:    	ldapr	w2, [x30]  // guest 0x250de, sampled 0
6c4f5e748c:    	add	x1, x19, #0x258  // guest 0x250de, sampled 0
6c4f5e7490:    	mov	x0, x19  // guest 0x250de, sampled 0
6c4f5e7494:    	adrp	x16, 0x6c97751000 <trace+0x4816a000>  // guest 0x250de, sampled 0
6c4f5e7498:    	add	x16, x16, #0x3b4  // guest 0x250de, sampled 0
6c4f5e749c:    	blr	x16  // guest 0x250de, sampled 0
6c4f5e74a0:    	lsl	w20, w20, #4  // guest 0x250de, sampled 0
6c4f5e74a4:    	add	w20, w20, #0x1a0  // guest 0x250de, sampled 0
6c4f5e74a8:    	sxtw	x20, w20  // guest 0x250de, sampled 0
6c4f5e74ac:    	add	x1, x20, x19  // guest 0x250de, sampled 0
6c4f5e74b0:    	add	x2, x19, #0x258  // guest 0x250de, sampled 0
6c4f5e74b4:    	mov	x0, x19  // guest 0x250de, sampled 0
6c4f5e74b8:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x250de, sampled 0
6c4f5e74bc:    	add	x16, x16, #0xa7c  // guest 0x250de, sampled 0
6c4f5e74c0:    	blr	x16  // guest 0x250de, sampled 0
6c4f5e74c4:    	ldr	w20, [x19, #0x74]  // guest 0x250de, sampled 0
6c4f5e74c8:    	strh	w20, [x19, #0x224]  // guest 0x250de, sampled 0
6c4f5e74cc:    	str	w22, [x19, #0x230]  // guest 0x250de, sampled 0
6c4f5e74d0:    	ldr	w20, [x19, #0x54]  // guest 0x250de, sampled 0
6c4f5e74d4:    	strh	w20, [x19, #0x222]  // guest 0x250de, sampled 0
6c4f5e74d8:    	mov	w20, #0x50de            // =20702  // guest 0x250de, sampled 0
6c4f5e74dc:    	movk	w20, #0x2, lsl #16  // guest 0x250de, sampled 0
6c4f5e74e0:    	str	w20, [x19, #0x228]  // guest 0x250de, sampled 0
6c4f5e74e4:    	mov	w1, #0x2                // =2  // guest 0x250e1, sampled 0
6c4f5e74e8:    	mov	x0, x19  // guest 0x250e1, sampled 0
6c4f5e74ec:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x250e1, sampled 0
6c4f5e74f0:    	add	x16, x16, #0x4d0  // guest 0x250e1, sampled 0
6c4f5e74f4:    	blr	x16  // guest 0x250e1, sampled 0
6c4f5e74f8:    	ldr	w20, [x19, #0x54]  // guest 0x250e1, sampled 0
6c4f5e74fc:    	strh	w20, [x19, #0x222]  // guest 0x250e1, sampled 0
6c4f5e7500:    	mov	w20, #0x50e1            // =20705  // guest 0x250e1, sampled 0
6c4f5e7504:    	movk	w20, #0x2, lsl #16  // guest 0x250e1, sampled 0
6c4f5e7508:    	str	w20, [x19, #0x228]  // guest 0x250e1, sampled 0
6c4f5e750c:    	ldr	w20, [x19, #0x8]  // guest 0x250e3, sampled 0
6c4f5e7510:    	add	w20, w20, #0x28  // guest 0x250e3, sampled 0
6c4f5e7514:    	mov	w21, w20  // guest 0x250e3, sampled 0
6c4f5e7518:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250e3, sampled 0
6c4f5e751c:    	and	x16, x16, x20, lsr #7  // guest 0x250e3, sampled 0
6c4f5e7520:    	add	x17, x17, x16  // guest 0x250e3, sampled 0
6c4f5e7524:    	ldp	x16, x17, [x17]  // guest 0x250e3, sampled 0
6c4f5e7528:    	and	w30, w20, #0xfffff003  // guest 0x250e3, sampled 0
6c4f5e752c:    	cmp	w16, w30  // guest 0x250e3, sampled 0
6c4f5e7530:    	b.ne	0x6c4f5e8010 <trace+0x1490>  // guest 0x250e3, sampled 0
6c4f5e7534:    	add	x30, x17, w20, uxtw  // guest 0x250e3, sampled 0
6c4f5e7538:    	ldapr	w2, [x30]  // guest 0x250e3, sampled 0
6c4f5e753c:    	add	x1, x19, #0x258  // guest 0x250e3, sampled 0
6c4f5e7540:    	mov	x0, x19  // guest 0x250e3, sampled 0
6c4f5e7544:    	adrp	x16, 0x6c97751000 <trace+0x4816a000>  // guest 0x250e3, sampled 0
6c4f5e7548:    	add	x16, x16, #0x3b4  // guest 0x250e3, sampled 0
6c4f5e754c:    	blr	x16  // guest 0x250e3, sampled 0
6c4f5e7550:    	ldr	w20, [x19, #0x188]  // guest 0x250e3, sampled 0
6c4f5e7554:    	lsl	w20, w20, #4  // guest 0x250e3, sampled 0
6c4f5e7558:    	add	w20, w20, #0x1a0  // guest 0x250e3, sampled 0
6c4f5e755c:    	sxtw	x20, w20  // guest 0x250e3, sampled 0
6c4f5e7560:    	add	x1, x20, x19  // guest 0x250e3, sampled 0
6c4f5e7564:    	add	x2, x19, #0x258  // guest 0x250e3, sampled 0
6c4f5e7568:    	mov	x0, x19  // guest 0x250e3, sampled 0
6c4f5e756c:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x250e3, sampled 0
6c4f5e7570:    	add	x16, x16, #0xa7c  // guest 0x250e3, sampled 0
6c4f5e7574:    	blr	x16  // guest 0x250e3, sampled 0
6c4f5e7578:    	ldr	w20, [x19, #0x74]  // guest 0x250e3, sampled 0
6c4f5e757c:    	strh	w20, [x19, #0x224]  // guest 0x250e3, sampled 0
6c4f5e7580:    	str	w21, [x19, #0x230]  // guest 0x250e3, sampled 0
6c4f5e7584:    	ldr	w20, [x19, #0x54]  // guest 0x250e3, sampled 0
6c4f5e7588:    	strh	w20, [x19, #0x222]  // guest 0x250e3, sampled 0
6c4f5e758c:    	mov	w20, #0x50e3            // =20707  // guest 0x250e3, sampled 0
6c4f5e7590:    	movk	w20, #0x2, lsl #16  // guest 0x250e3, sampled 0
6c4f5e7594:    	str	w20, [x19, #0x228]  // guest 0x250e3, sampled 0
6c4f5e7598:    	mov	w1, #0x1                // =1  // guest 0x250e6, sampled 0
6c4f5e759c:    	mov	x0, x19  // guest 0x250e6, sampled 0
6c4f5e75a0:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x250e6, sampled 0
6c4f5e75a4:    	add	x16, x16, #0x4d0  // guest 0x250e6, sampled 0
6c4f5e75a8:    	blr	x16  // guest 0x250e6, sampled 0
6c4f5e75ac:    	ldr	w20, [x19, #0x54]  // guest 0x250e6, sampled 0
6c4f5e75b0:    	strh	w20, [x19, #0x222]  // guest 0x250e6, sampled 0
6c4f5e75b4:    	mov	w20, #0x50e6            // =20710  // guest 0x250e6, sampled 0
6c4f5e75b8:    	movk	w20, #0x2, lsl #16  // guest 0x250e6, sampled 0
6c4f5e75bc:    	str	w20, [x19, #0x228]  // guest 0x250e6, sampled 0
6c4f5e75c0:    	ldr	w20, [x19, #0x188]  // guest 0x250e8, sampled 0
6c4f5e75c4:    	add	w21, w20, #0x3  // guest 0x250e8, sampled 0
6c4f5e75c8:    	and	w21, w21, #0x7  // guest 0x250e8, sampled 0
6c4f5e75cc:    	lsl	w21, w21, #4  // guest 0x250e8, sampled 0
6c4f5e75d0:    	add	w21, w21, #0x1a0  // guest 0x250e8, sampled 0
6c4f5e75d4:    	sxtw	x21, w21  // guest 0x250e8, sampled 0
6c4f5e75d8:    	add	x1, x21, x19  // guest 0x250e8, sampled 0
6c4f5e75dc:    	lsl	w21, w20, #4  // guest 0x250e8, sampled 0
6c4f5e75e0:    	add	w21, w21, #0x1a0  // guest 0x250e8, sampled 0
6c4f5e75e4:    	sxtw	x21, w21  // guest 0x250e8, sampled 0
6c4f5e75e8:    	add	x2, x21, x19  // guest 0x250e8, sampled 0
6c4f5e75ec:    	mov	x0, x19  // guest 0x250e8, sampled 0
6c4f5e75f0:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x250e8, sampled 0
6c4f5e75f4:    	add	x16, x16, #0x9a8  // guest 0x250e8, sampled 0
6c4f5e75f8:    	blr	x16  // guest 0x250e8, sampled 0
6c4f5e75fc:    	sxtw	x21, w20  // guest 0x250e8, sampled 0
6c4f5e7600:    	add	x21, x21, x19  // guest 0x250e8, sampled 0
6c4f5e7604:    	mov	w22, #0x1               // =1  // guest 0x250e8, sampled 0
6c4f5e7608:    	strb	w22, [x21, #0x190]  // guest 0x250e8, sampled 0
6c4f5e760c:    	add	w20, w20, w22  // guest 0x250e8, sampled 0
6c4f5e7610:    	and	w20, w20, #0x7  // guest 0x250e8, sampled 0
6c4f5e7614:    	ldr	w21, [x19, #0x54]  // guest 0x250e8, sampled 0
6c4f5e7618:    	strh	w21, [x19, #0x222]  // guest 0x250e8, sampled 0
6c4f5e761c:    	mov	w21, #0x50e8            // =20712  // guest 0x250e8, sampled 0
6c4f5e7620:    	movk	w21, #0x2, lsl #16  // guest 0x250e8, sampled 0
6c4f5e7624:    	str	w21, [x19, #0x228]  // guest 0x250e8, sampled 0
6c4f5e7628:    	add	w21, w20, #0x5  // guest 0x250ea, sampled 0
6c4f5e762c:    	and	w21, w21, #0x7  // guest 0x250ea, sampled 0
6c4f5e7630:    	lsl	w21, w21, #4  // guest 0x250ea, sampled 0
6c4f5e7634:    	add	w21, w21, #0x1a0  // guest 0x250ea, sampled 0
6c4f5e7638:    	sxtw	x21, w21  // guest 0x250ea, sampled 0
6c4f5e763c:    	add	x1, x21, x19  // guest 0x250ea, sampled 0
6c4f5e7640:    	lsl	w21, w20, #4  // guest 0x250ea, sampled 0
6c4f5e7644:    	add	w21, w21, #0x1a0  // guest 0x250ea, sampled 0
6c4f5e7648:    	sxtw	x21, w21  // guest 0x250ea, sampled 0
6c4f5e764c:    	add	x2, x21, x19  // guest 0x250ea, sampled 0
6c4f5e7650:    	mov	x0, x19  // guest 0x250ea, sampled 0
6c4f5e7654:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x250ea, sampled 0
6c4f5e7658:    	add	x16, x16, #0x9a8  // guest 0x250ea, sampled 0
6c4f5e765c:    	blr	x16  // guest 0x250ea, sampled 0
6c4f5e7660:    	sxtw	x21, w20  // guest 0x250ea, sampled 0
6c4f5e7664:    	add	x21, x21, x19  // guest 0x250ea, sampled 0
6c4f5e7668:    	strb	w22, [x21, #0x190]  // guest 0x250ea, sampled 0
6c4f5e766c:    	add	w20, w20, w22  // guest 0x250ea, sampled 0
6c4f5e7670:    	and	w20, w20, #0x7  // guest 0x250ea, sampled 0
6c4f5e7674:    	ldr	w21, [x19, #0x54]  // guest 0x250ea, sampled 0
6c4f5e7678:    	strh	w21, [x19, #0x222]  // guest 0x250ea, sampled 0
6c4f5e767c:    	mov	w21, #0x50ea            // =20714  // guest 0x250ea, sampled 0
6c4f5e7680:    	movk	w21, #0x2, lsl #16  // guest 0x250ea, sampled 0
6c4f5e7684:    	str	w21, [x19, #0x228]  // guest 0x250ea, sampled 0
6c4f5e7688:    	add	w21, w20, #0x2  // guest 0x250ec, sampled 0
6c4f5e768c:    	and	w21, w21, #0x7  // guest 0x250ec, sampled 0
6c4f5e7690:    	lsl	w21, w21, #4  // guest 0x250ec, sampled 0
6c4f5e7694:    	add	w21, w21, #0x1a0  // guest 0x250ec, sampled 0
6c4f5e7698:    	sxtw	x21, w21  // guest 0x250ec, sampled 0
6c4f5e769c:    	add	x1, x21, x19  // guest 0x250ec, sampled 0
6c4f5e76a0:    	lsl	w21, w20, #4  // guest 0x250ec, sampled 0
6c4f5e76a4:    	add	w21, w21, #0x1a0  // guest 0x250ec, sampled 0
6c4f5e76a8:    	sxtw	x21, w21  // guest 0x250ec, sampled 1
6c4f5e76ac:    	add	x2, x21, x19  // guest 0x250ec, sampled 0
6c4f5e76b0:    	mov	x0, x19  // guest 0x250ec, sampled 0
6c4f5e76b4:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x250ec, sampled 0
6c4f5e76b8:    	add	x16, x16, #0x9a8  // guest 0x250ec, sampled 0
6c4f5e76bc:    	blr	x16  // guest 0x250ec, sampled 0
6c4f5e76c0:    	sxtw	x21, w20  // guest 0x250ec, sampled 0
6c4f5e76c4:    	add	x21, x21, x19  // guest 0x250ec, sampled 0
6c4f5e76c8:    	strb	w22, [x21, #0x190]  // guest 0x250ec, sampled 0
6c4f5e76cc:    	add	w20, w20, w22  // guest 0x250ec, sampled 0
6c4f5e76d0:    	and	w20, w20, #0x7  // guest 0x250ec, sampled 0
6c4f5e76d4:    	str	w20, [x19, #0x188]  // guest 0x250ec, sampled 0
6c4f5e76d8:    	ldr	w20, [x19, #0x54]  // guest 0x250ec, sampled 0
6c4f5e76dc:    	strh	w20, [x19, #0x222]  // guest 0x250ec, sampled 0
6c4f5e76e0:    	mov	w20, #0x50ec            // =20716  // guest 0x250ec, sampled 0
6c4f5e76e4:    	movk	w20, #0x2, lsl #16  // guest 0x250ec, sampled 0
6c4f5e76e8:    	str	w20, [x19, #0x228]  // guest 0x250ec, sampled 0
6c4f5e76ec:    	mov	w1, #0x2                // =2  // guest 0x250ee, sampled 0
6c4f5e76f0:    	mov	x0, x19  // guest 0x250ee, sampled 0
6c4f5e76f4:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x250ee, sampled 0
6c4f5e76f8:    	add	x16, x16, #0x4d0  // guest 0x250ee, sampled 0
6c4f5e76fc:    	blr	x16  // guest 0x250ee, sampled 0
6c4f5e7700:    	ldr	w20, [x19, #0x54]  // guest 0x250ee, sampled 0
6c4f5e7704:    	strh	w20, [x19, #0x222]  // guest 0x250ee, sampled 0
6c4f5e7708:    	mov	w20, #0x50ee            // =20718  // guest 0x250ee, sampled 0
6c4f5e770c:    	movk	w20, #0x2, lsl #16  // guest 0x250ee, sampled 0
6c4f5e7710:    	str	w20, [x19, #0x228]  // guest 0x250ee, sampled 0
6c4f5e7714:    	ldr	w20, [x19, #0x188]  // guest 0x250f0, sampled 0
6c4f5e7718:    	sub	w20, w20, #0x1  // guest 0x250f0, sampled 0
6c4f5e771c:    	and	w20, w20, #0x7  // guest 0x250f0, sampled 0
6c4f5e7720:    	str	w20, [x19, #0x188]  // guest 0x250f0, sampled 0
6c4f5e7724:    	sxtw	x21, w20  // guest 0x250f0, sampled 0
6c4f5e7728:    	add	x21, x21, x19  // guest 0x250f0, sampled 0
6c4f5e772c:    	strb	wzr, [x21, #0x190]  // guest 0x250f0, sampled 0
6c4f5e7730:    	lsl	w21, w20, #4  // guest 0x250f0, sampled 0
6c4f5e7734:    	add	w21, w21, #0x1a0  // guest 0x250f0, sampled 0
6c4f5e7738:    	sxtw	x21, w21  // guest 0x250f0, sampled 0
6c4f5e773c:    	add	x21, x21, x19  // guest 0x250f0, sampled 0
6c4f5e7740:    	add	w23, w20, w22  // guest 0x250f0, sampled 0
6c4f5e7744:    	and	w23, w23, #0x7  // guest 0x250f0, sampled 0
6c4f5e7748:    	lsl	w23, w23, #4  // guest 0x250f0, sampled 0
6c4f5e774c:    	add	w23, w23, #0x1a0  // guest 0x250f0, sampled 0
6c4f5e7750:    	sxtw	x23, w23  // guest 0x250f0, sampled 0
6c4f5e7754:    	add	x23, x23, x19  // guest 0x250f0, sampled 0
6c4f5e7758:    	ldr	x24, [x23]  // guest 0x250f0, sampled 0
6c4f5e775c:    	ldrh	w23, [x23, #0x8]  // guest 0x250f0, sampled 0
6c4f5e7760:    	str	x24, [x21]  // guest 0x250f0, sampled 0
6c4f5e7764:    	strh	w23, [x21, #0x8]  // guest 0x250f0, sampled 0
6c4f5e7768:    	ldr	w21, [x19, #0x54]  // guest 0x250f0, sampled 0
6c4f5e776c:    	strh	w21, [x19, #0x222]  // guest 0x250f0, sampled 0
6c4f5e7770:    	mov	w21, #0x50f0            // =20720  // guest 0x250f0, sampled 0
6c4f5e7774:    	movk	w21, #0x2, lsl #16  // guest 0x250f0, sampled 0
6c4f5e7778:    	str	w21, [x19, #0x228]  // guest 0x250f0, sampled 0
6c4f5e777c:    	ldr	w21, [x19, #0x8]  // guest 0x250f2, sampled 0
6c4f5e7780:    	add	w23, w21, #0x14  // guest 0x250f2, sampled 0
6c4f5e7784:    	mov	w24, w23  // guest 0x250f2, sampled 0
6c4f5e7788:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250f2, sampled 0
6c4f5e778c:    	and	x16, x16, x23, lsr #7  // guest 0x250f2, sampled 0
6c4f5e7790:    	add	x17, x17, x16  // guest 0x250f2, sampled 0
6c4f5e7794:    	ldp	x16, x17, [x17]  // guest 0x250f2, sampled 0
6c4f5e7798:    	and	w30, w23, #0xfffff003  // guest 0x250f2, sampled 0
6c4f5e779c:    	cmp	w16, w30  // guest 0x250f2, sampled 0
6c4f5e77a0:    	b.ne	0x6c4f5e803c <trace+0x14bc>  // guest 0x250f2, sampled 0
6c4f5e77a4:    	add	x30, x17, w23, uxtw  // guest 0x250f2, sampled 0
6c4f5e77a8:    	ldapr	w2, [x30]  // guest 0x250f2, sampled 0
6c4f5e77ac:    	add	x1, x19, #0x258  // guest 0x250f2, sampled 0
6c4f5e77b0:    	mov	x0, x19  // guest 0x250f2, sampled 0
6c4f5e77b4:    	adrp	x16, 0x6c97751000 <trace+0x4816a000>  // guest 0x250f2, sampled 0
6c4f5e77b8:    	add	x16, x16, #0x3b4  // guest 0x250f2, sampled 0
6c4f5e77bc:    	blr	x16  // guest 0x250f2, sampled 0
6c4f5e77c0:    	lsl	w23, w20, #4  // guest 0x250f2, sampled 0
6c4f5e77c4:    	add	w23, w23, #0x1a0  // guest 0x250f2, sampled 0
6c4f5e77c8:    	sxtw	x23, w23  // guest 0x250f2, sampled 0
6c4f5e77cc:    	add	x1, x23, x19  // guest 0x250f2, sampled 0
6c4f5e77d0:    	add	x2, x19, #0x258  // guest 0x250f2, sampled 0
6c4f5e77d4:    	mov	x0, x19  // guest 0x250f2, sampled 0
6c4f5e77d8:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x250f2, sampled 0
6c4f5e77dc:    	add	x16, x16, #0xa7c  // guest 0x250f2, sampled 0
6c4f5e77e0:    	blr	x16  // guest 0x250f2, sampled 0
6c4f5e77e4:    	ldr	w23, [x19, #0x74]  // guest 0x250f2, sampled 0
6c4f5e77e8:    	strh	w23, [x19, #0x224]  // guest 0x250f2, sampled 0
6c4f5e77ec:    	str	w24, [x19, #0x230]  // guest 0x250f2, sampled 0
6c4f5e77f0:    	ldr	w23, [x19, #0x54]  // guest 0x250f2, sampled 0
6c4f5e77f4:    	strh	w23, [x19, #0x222]  // guest 0x250f2, sampled 0
6c4f5e77f8:    	mov	w23, #0x50f2            // =20722  // guest 0x250f2, sampled 0
6c4f5e77fc:    	movk	w23, #0x2, lsl #16  // guest 0x250f2, sampled 0
6c4f5e7800:    	str	w23, [x19, #0x228]  // guest 0x250f2, sampled 0
6c4f5e7804:    	sub	w20, w20, #0x1  // guest 0x250f5, sampled 0
6c4f5e7808:    	and	w20, w20, #0x7  // guest 0x250f5, sampled 0
6c4f5e780c:    	str	w20, [x19, #0x188]  // guest 0x250f5, sampled 0
6c4f5e7810:    	sxtw	x23, w20  // guest 0x250f5, sampled 0
6c4f5e7814:    	add	x23, x23, x19  // guest 0x250f5, sampled 0
6c4f5e7818:    	strb	wzr, [x23, #0x190]  // guest 0x250f5, sampled 0
6c4f5e781c:    	lsl	w23, w20, #4  // guest 0x250f5, sampled 0
6c4f5e7820:    	add	w23, w23, #0x1a0  // guest 0x250f5, sampled 0
6c4f5e7824:    	sxtw	x23, w23  // guest 0x250f5, sampled 0
6c4f5e7828:    	add	x23, x23, x19  // guest 0x250f5, sampled 0
6c4f5e782c:    	add	w24, w20, #0x2  // guest 0x250f5, sampled 0
6c4f5e7830:    	and	w24, w24, #0x7  // guest 0x250f5, sampled 0
6c4f5e7834:    	lsl	w24, w24, #4  // guest 0x250f5, sampled 0
6c4f5e7838:    	add	w24, w24, #0x1a0  // guest 0x250f5, sampled 0
6c4f5e783c:    	sxtw	x24, w24  // guest 0x250f5, sampled 0
6c4f5e7840:    	add	x24, x24, x19  // guest 0x250f5, sampled 0
6c4f5e7844:    	ldr	x25, [x24]  // guest 0x250f5, sampled 0
6c4f5e7848:    	ldrh	w24, [x24, #0x8]  // guest 0x250f5, sampled 0
6c4f5e784c:    	str	x25, [x23]  // guest 0x250f5, sampled 0
6c4f5e7850:    	strh	w24, [x23, #0x8]  // guest 0x250f5, sampled 0
6c4f5e7854:    	ldr	w23, [x19, #0x54]  // guest 0x250f5, sampled 0
6c4f5e7858:    	strh	w23, [x19, #0x222]  // guest 0x250f5, sampled 0
6c4f5e785c:    	mov	w23, #0x50f5            // =20725  // guest 0x250f5, sampled 0
6c4f5e7860:    	movk	w23, #0x2, lsl #16  // guest 0x250f5, sampled 0
6c4f5e7864:    	str	w23, [x19, #0x228]  // guest 0x250f5, sampled 0
6c4f5e7868:    	add	w21, w21, #0x20  // guest 0x250f7, sampled 0
6c4f5e786c:    	mov	w23, w21  // guest 0x250f7, sampled 0
6c4f5e7870:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250f7, sampled 0
6c4f5e7874:    	and	x16, x16, x21, lsr #7  // guest 0x250f7, sampled 0
6c4f5e7878:    	add	x17, x17, x16  // guest 0x250f7, sampled 0
6c4f5e787c:    	ldp	x16, x17, [x17]  // guest 0x250f7, sampled 0
6c4f5e7880:    	and	w30, w21, #0xfffff003  // guest 0x250f7, sampled 0
6c4f5e7884:    	cmp	w16, w30  // guest 0x250f7, sampled 0
6c4f5e7888:    	b.ne	0x6c4f5e8068 <trace+0x14e8>  // guest 0x250f7, sampled 0
6c4f5e788c:    	add	x30, x17, w21, uxtw  // guest 0x250f7, sampled 0
6c4f5e7890:    	ldapr	w2, [x30]  // guest 0x250f7, sampled 0
6c4f5e7894:    	add	x1, x19, #0x258  // guest 0x250f7, sampled 0
6c4f5e7898:    	mov	x0, x19  // guest 0x250f7, sampled 0
6c4f5e789c:    	adrp	x16, 0x6c97751000 <trace+0x4816a000>  // guest 0x250f7, sampled 0
6c4f5e78a0:    	add	x16, x16, #0x3b4  // guest 0x250f7, sampled 0
6c4f5e78a4:    	blr	x16  // guest 0x250f7, sampled 0
6c4f5e78a8:    	lsl	w20, w20, #4  // guest 0x250f7, sampled 0
6c4f5e78ac:    	add	w20, w20, #0x1a0  // guest 0x250f7, sampled 0
6c4f5e78b0:    	sxtw	x20, w20  // guest 0x250f7, sampled 0
6c4f5e78b4:    	add	x1, x20, x19  // guest 0x250f7, sampled 0
6c4f5e78b8:    	add	x2, x19, #0x258  // guest 0x250f7, sampled 0
6c4f5e78bc:    	mov	x0, x19  // guest 0x250f7, sampled 0
6c4f5e78c0:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x250f7, sampled 0
6c4f5e78c4:    	add	x16, x16, #0xa7c  // guest 0x250f7, sampled 0
6c4f5e78c8:    	blr	x16  // guest 0x250f7, sampled 0
6c4f5e78cc:    	ldr	w20, [x19, #0x74]  // guest 0x250f7, sampled 0
6c4f5e78d0:    	strh	w20, [x19, #0x224]  // guest 0x250f7, sampled 0
6c4f5e78d4:    	str	w23, [x19, #0x230]  // guest 0x250f7, sampled 0
6c4f5e78d8:    	ldr	w20, [x19, #0x54]  // guest 0x250f7, sampled 0
6c4f5e78dc:    	strh	w20, [x19, #0x222]  // guest 0x250f7, sampled 0
6c4f5e78e0:    	mov	w20, #0x50f7            // =20727  // guest 0x250f7, sampled 0
6c4f5e78e4:    	movk	w20, #0x2, lsl #16  // guest 0x250f7, sampled 0
6c4f5e78e8:    	str	w20, [x19, #0x228]  // guest 0x250f7, sampled 0
6c4f5e78ec:    	mov	w1, #0x2                // =2  // guest 0x250fa, sampled 0
6c4f5e78f0:    	mov	x0, x19  // guest 0x250fa, sampled 0
6c4f5e78f4:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x250fa, sampled 0
6c4f5e78f8:    	add	x16, x16, #0x4d0  // guest 0x250fa, sampled 0
6c4f5e78fc:    	blr	x16  // guest 0x250fa, sampled 0
6c4f5e7900:    	ldr	w20, [x19, #0x54]  // guest 0x250fa, sampled 0
6c4f5e7904:    	strh	w20, [x19, #0x222]  // guest 0x250fa, sampled 0
6c4f5e7908:    	mov	w20, #0x50fa            // =20730  // guest 0x250fa, sampled 0
6c4f5e790c:    	movk	w20, #0x2, lsl #16  // guest 0x250fa, sampled 0
6c4f5e7910:    	str	w20, [x19, #0x228]  // guest 0x250fa, sampled 0
6c4f5e7914:    	ldr	w20, [x19, #0x8]  // guest 0x250fc, sampled 0
6c4f5e7918:    	add	w20, w20, #0x2c  // guest 0x250fc, sampled 0
6c4f5e791c:    	mov	w21, w20  // guest 0x250fc, sampled 0
6c4f5e7920:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250fc, sampled 0
6c4f5e7924:    	and	x16, x16, x20, lsr #7  // guest 0x250fc, sampled 0
6c4f5e7928:    	add	x17, x17, x16  // guest 0x250fc, sampled 0
6c4f5e792c:    	ldp	x16, x17, [x17]  // guest 0x250fc, sampled 0
6c4f5e7930:    	and	w30, w20, #0xfffff003  // guest 0x250fc, sampled 1
6c4f5e7934:    	cmp	w16, w30  // guest 0x250fc, sampled 0
6c4f5e7938:    	b.ne	0x6c4f5e8094 <trace+0x1514>  // guest 0x250fc, sampled 0
6c4f5e793c:    	add	x30, x17, w20, uxtw  // guest 0x250fc, sampled 0
6c4f5e7940:    	ldapr	w2, [x30]  // guest 0x250fc, sampled 0
6c4f5e7944:    	add	x1, x19, #0x258  // guest 0x250fc, sampled 0
6c4f5e7948:    	mov	x0, x19  // guest 0x250fc, sampled 0
6c4f5e794c:    	adrp	x16, 0x6c97751000 <trace+0x4816a000>  // guest 0x250fc, sampled 0
6c4f5e7950:    	add	x16, x16, #0x3b4  // guest 0x250fc, sampled 0
6c4f5e7954:    	blr	x16  // guest 0x250fc, sampled 0
6c4f5e7958:    	ldr	w20, [x19, #0x188]  // guest 0x250fc, sampled 0
6c4f5e795c:    	lsl	w20, w20, #4  // guest 0x250fc, sampled 0
6c4f5e7960:    	add	w20, w20, #0x1a0  // guest 0x250fc, sampled 0
6c4f5e7964:    	sxtw	x20, w20  // guest 0x250fc, sampled 0
6c4f5e7968:    	add	x1, x20, x19  // guest 0x250fc, sampled 0
6c4f5e796c:    	add	x2, x19, #0x258  // guest 0x250fc, sampled 0
6c4f5e7970:    	mov	x0, x19  // guest 0x250fc, sampled 0
6c4f5e7974:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x250fc, sampled 0
6c4f5e7978:    	add	x16, x16, #0xa7c  // guest 0x250fc, sampled 0
6c4f5e797c:    	blr	x16  // guest 0x250fc, sampled 0
6c4f5e7980:    	ldr	w20, [x19, #0x74]  // guest 0x250fc, sampled 0
6c4f5e7984:    	strh	w20, [x19, #0x224]  // guest 0x250fc, sampled 0
6c4f5e7988:    	str	w21, [x19, #0x230]  // guest 0x250fc, sampled 0
6c4f5e798c:    	ldr	w20, [x19, #0x54]  // guest 0x250fc, sampled 0
6c4f5e7990:    	strh	w20, [x19, #0x222]  // guest 0x250fc, sampled 0
6c4f5e7994:    	mov	w20, #0x50fc            // =20732  // guest 0x250fc, sampled 0
6c4f5e7998:    	movk	w20, #0x2, lsl #16  // guest 0x250fc, sampled 0
6c4f5e799c:    	str	w20, [x19, #0x228]  // guest 0x250fc, sampled 0
6c4f5e79a0:    	mov	w1, w22  // guest 0x250ff, sampled 0
6c4f5e79a4:    	mov	x0, x19  // guest 0x250ff, sampled 0
6c4f5e79a8:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x250ff, sampled 0
6c4f5e79ac:    	add	x16, x16, #0x4d0  // guest 0x250ff, sampled 0
6c4f5e79b0:    	blr	x16  // guest 0x250ff, sampled 0
6c4f5e79b4:    	ldr	w20, [x19, #0x54]  // guest 0x250ff, sampled 0
6c4f5e79b8:    	strh	w20, [x19, #0x222]  // guest 0x250ff, sampled 0
6c4f5e79bc:    	mov	w20, #0x50ff            // =20735  // guest 0x250ff, sampled 0
6c4f5e79c0:    	movk	w20, #0x2, lsl #16  // guest 0x250ff, sampled 0
6c4f5e79c4:    	str	w20, [x19, #0x228]  // guest 0x250ff, sampled 0
6c4f5e79c8:    	ldr	w20, [x19, #0x188]  // guest 0x25101, sampled 0
6c4f5e79cc:    	add	w21, w20, #0x4  // guest 0x25101, sampled 0
6c4f5e79d0:    	and	w21, w21, #0x7  // guest 0x25101, sampled 1
6c4f5e79d4:    	lsl	w21, w21, #4  // guest 0x25101, sampled 0
6c4f5e79d8:    	add	w21, w21, #0x1a0  // guest 0x25101, sampled 0
6c4f5e79dc:    	sxtw	x21, w21  // guest 0x25101, sampled 0
6c4f5e79e0:    	add	x1, x21, x19  // guest 0x25101, sampled 0
6c4f5e79e4:    	lsl	w21, w20, #4  // guest 0x25101, sampled 0
6c4f5e79e8:    	add	w21, w21, #0x1a0  // guest 0x25101, sampled 0
6c4f5e79ec:    	sxtw	x21, w21  // guest 0x25101, sampled 0
6c4f5e79f0:    	add	x2, x21, x19  // guest 0x25101, sampled 0
6c4f5e79f4:    	mov	x0, x19  // guest 0x25101, sampled 0
6c4f5e79f8:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x25101, sampled 0
6c4f5e79fc:    	add	x16, x16, #0x9a8  // guest 0x25101, sampled 0
6c4f5e7a00:    	blr	x16  // guest 0x25101, sampled 0
6c4f5e7a04:    	sxtw	x21, w20  // guest 0x25101, sampled 0
6c4f5e7a08:    	add	x21, x21, x19  // guest 0x25101, sampled 0
6c4f5e7a0c:    	strb	w22, [x21, #0x190]  // guest 0x25101, sampled 0
6c4f5e7a10:    	add	w20, w20, w22  // guest 0x25101, sampled 0
6c4f5e7a14:    	and	w20, w20, #0x7  // guest 0x25101, sampled 0
6c4f5e7a18:    	ldr	w21, [x19, #0x54]  // guest 0x25101, sampled 0
6c4f5e7a1c:    	strh	w21, [x19, #0x222]  // guest 0x25101, sampled 0
6c4f5e7a20:    	mov	w21, #0x5101            // =20737  // guest 0x25101, sampled 0
6c4f5e7a24:    	movk	w21, #0x2, lsl #16  // guest 0x25101, sampled 0
6c4f5e7a28:    	str	w21, [x19, #0x228]  // guest 0x25101, sampled 0
6c4f5e7a2c:    	add	w21, w20, #0x4  // guest 0x25103, sampled 0
6c4f5e7a30:    	and	w21, w21, #0x7  // guest 0x25103, sampled 0
6c4f5e7a34:    	lsl	w21, w21, #4  // guest 0x25103, sampled 0
6c4f5e7a38:    	add	w21, w21, #0x1a0  // guest 0x25103, sampled 0
6c4f5e7a3c:    	sxtw	x21, w21  // guest 0x25103, sampled 0
6c4f5e7a40:    	add	x1, x21, x19  // guest 0x25103, sampled 0
6c4f5e7a44:    	lsl	w21, w20, #4  // guest 0x25103, sampled 0
6c4f5e7a48:    	add	w21, w21, #0x1a0  // guest 0x25103, sampled 0
6c4f5e7a4c:    	sxtw	x21, w21  // guest 0x25103, sampled 0
6c4f5e7a50:    	add	x2, x21, x19  // guest 0x25103, sampled 0
6c4f5e7a54:    	mov	x0, x19  // guest 0x25103, sampled 0
6c4f5e7a58:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x25103, sampled 0
6c4f5e7a5c:    	add	x16, x16, #0x9a8  // guest 0x25103, sampled 0
6c4f5e7a60:    	blr	x16  // guest 0x25103, sampled 0
6c4f5e7a64:    	sxtw	x21, w20  // guest 0x25103, sampled 0
6c4f5e7a68:    	add	x21, x21, x19  // guest 0x25103, sampled 0
6c4f5e7a6c:    	strb	w22, [x21, #0x190]  // guest 0x25103, sampled 0
6c4f5e7a70:    	add	w20, w20, w22  // guest 0x25103, sampled 0
6c4f5e7a74:    	and	w20, w20, #0x7  // guest 0x25103, sampled 0
6c4f5e7a78:    	ldr	w21, [x19, #0x54]  // guest 0x25103, sampled 0
6c4f5e7a7c:    	strh	w21, [x19, #0x222]  // guest 0x25103, sampled 0
6c4f5e7a80:    	mov	w21, #0x5103            // =20739  // guest 0x25103, sampled 0
6c4f5e7a84:    	movk	w21, #0x2, lsl #16  // guest 0x25103, sampled 0
6c4f5e7a88:    	str	w21, [x19, #0x228]  // guest 0x25103, sampled 0
6c4f5e7a8c:    	add	w21, w20, w22  // guest 0x25105, sampled 0
6c4f5e7a90:    	and	w21, w21, #0x7  // guest 0x25105, sampled 0
6c4f5e7a94:    	lsl	w21, w21, #4  // guest 0x25105, sampled 0
6c4f5e7a98:    	add	w21, w21, #0x1a0  // guest 0x25105, sampled 0
6c4f5e7a9c:    	sxtw	x21, w21  // guest 0x25105, sampled 0
6c4f5e7aa0:    	add	x1, x21, x19  // guest 0x25105, sampled 0
6c4f5e7aa4:    	lsl	w21, w20, #4  // guest 0x25105, sampled 0
6c4f5e7aa8:    	add	w21, w21, #0x1a0  // guest 0x25105, sampled 0
6c4f5e7aac:    	sxtw	x21, w21  // guest 0x25105, sampled 0
6c4f5e7ab0:    	add	x2, x21, x19  // guest 0x25105, sampled 0
6c4f5e7ab4:    	mov	x0, x19  // guest 0x25105, sampled 0
6c4f5e7ab8:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x25105, sampled 0
6c4f5e7abc:    	add	x16, x16, #0x9a8  // guest 0x25105, sampled 0
6c4f5e7ac0:    	blr	x16  // guest 0x25105, sampled 0
6c4f5e7ac4:    	sxtw	x21, w20  // guest 0x25105, sampled 0
6c4f5e7ac8:    	add	x21, x21, x19  // guest 0x25105, sampled 0
6c4f5e7acc:    	strb	w22, [x21, #0x190]  // guest 0x25105, sampled 0
6c4f5e7ad0:    	add	w20, w20, w22  // guest 0x25105, sampled 0
6c4f5e7ad4:    	and	w20, w20, #0x7  // guest 0x25105, sampled 0
6c4f5e7ad8:    	str	w20, [x19, #0x188]  // guest 0x25105, sampled 0
6c4f5e7adc:    	ldr	w20, [x19, #0x54]  // guest 0x25105, sampled 0
6c4f5e7ae0:    	strh	w20, [x19, #0x222]  // guest 0x25105, sampled 0
6c4f5e7ae4:    	mov	w20, #0x5105            // =20741  // guest 0x25105, sampled 0
6c4f5e7ae8:    	movk	w20, #0x2, lsl #16  // guest 0x25105, sampled 0
6c4f5e7aec:    	str	w20, [x19, #0x228]  // guest 0x25105, sampled 0
6c4f5e7af0:    	mov	w1, w22  // guest 0x25107, sampled 0
6c4f5e7af4:    	mov	x0, x19  // guest 0x25107, sampled 0
6c4f5e7af8:    	adrp	x16, 0x6c97752000 <trace+0x4816b000>  // guest 0x25107, sampled 0
6c4f5e7afc:    	add	x16, x16, #0x4d0  // guest 0x25107, sampled 0
6c4f5e7b00:    	blr	x16  // guest 0x25107, sampled 0
6c4f5e7b04:    	ldr	w20, [x19, #0x54]  // guest 0x25107, sampled 0
6c4f5e7b08:    	strh	w20, [x19, #0x222]  // guest 0x25107, sampled 0
6c4f5e7b0c:    	mov	w20, #0x5107            // =20743  // guest 0x25107, sampled 0
6c4f5e7b10:    	movk	w20, #0x2, lsl #16  // guest 0x25107, sampled 0
6c4f5e7b14:    	str	w20, [x19, #0x228]  // guest 0x25107, sampled 0
6c4f5e7b18:    	ldr	w20, [x19, #0x188]  // guest 0x25109, sampled 0
6c4f5e7b1c:    	lsl	w21, w20, #4  // guest 0x25109, sampled 0
6c4f5e7b20:    	add	w21, w21, #0x1a0  // guest 0x25109, sampled 0
6c4f5e7b24:    	sxtw	x21, w21  // guest 0x25109, sampled 0
6c4f5e7b28:    	add	x1, x21, x19  // guest 0x25109, sampled 0
6c4f5e7b2c:    	mov	x0, x19  // guest 0x25109, sampled 0
6c4f5e7b30:    	adrp	x16, 0x6c97751000 <trace+0x4816a000>  // guest 0x25109, sampled 0
6c4f5e7b34:    	add	x16, x16, #0x4f0  // guest 0x25109, sampled 0
6c4f5e7b38:    	blr	x16  // guest 0x25109, sampled 0
6c4f5e7b3c:    	ldr	w21, [x19, #0x1c]  // guest 0x25109, sampled 0
6c4f5e7b40:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25109, sampled 1
6c4f5e7b44:    	and	x16, x16, x21, lsr #7  // guest 0x25109, sampled 0
6c4f5e7b48:    	add	x17, x17, x16  // guest 0x25109, sampled 0
6c4f5e7b4c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x25109, sampled 0
6c4f5e7b50:    	and	w30, w21, #0xfffff003  // guest 0x25109, sampled 0
6c4f5e7b54:    	cmp	w16, w30  // guest 0x25109, sampled 0
6c4f5e7b58:    	b.ne	0x6c4f5e80c0 <trace+0x1540>  // guest 0x25109, sampled 0
6c4f5e7b5c:    	add	x30, x17, w21, uxtw  // guest 0x25109, sampled 0
6c4f5e7b60:    	stlr	w0, [x30]  // guest 0x25109, sampled 0
6c4f5e7b64:    	sxtw	x23, w20  // guest 0x25109, sampled 0
6c4f5e7b68:    	add	x23, x23, x19  // guest 0x25109, sampled 0
6c4f5e7b6c:    	strb	w22, [x23, #0x190]  // guest 0x25109, sampled 0
6c4f5e7b70:    	add	w20, w20, w22  // guest 0x25109, sampled 0
6c4f5e7b74:    	and	w20, w20, #0x7  // guest 0x25109, sampled 0
6c4f5e7b78:    	str	w20, [x19, #0x188]  // guest 0x25109, sampled 0
6c4f5e7b7c:    	ldr	w23, [x19, #0x74]  // guest 0x25109, sampled 0
6c4f5e7b80:    	strh	w23, [x19, #0x224]  // guest 0x25109, sampled 0
6c4f5e7b84:    	str	w21, [x19, #0x230]  // guest 0x25109, sampled 0
6c4f5e7b88:    	ldr	w23, [x19, #0x54]  // guest 0x25109, sampled 0
6c4f5e7b8c:    	strh	w23, [x19, #0x222]  // guest 0x25109, sampled 0
6c4f5e7b90:    	mov	w23, #0x5109            // =20745  // guest 0x25109, sampled 0
6c4f5e7b94:    	movk	w23, #0x2, lsl #16  // guest 0x25109, sampled 0
6c4f5e7b98:    	str	w23, [x19, #0x228]  // guest 0x25109, sampled 0
6c4f5e7b9c:    	add	w23, w21, #0x4  // guest 0x2510b, sampled 0
6c4f5e7ba0:    	mov	w24, w23  // guest 0x2510b, sampled 0
6c4f5e7ba4:    	lsl	w25, w20, #4  // guest 0x2510b, sampled 0
6c4f5e7ba8:    	add	w25, w25, #0x1a0  // guest 0x2510b, sampled 0
6c4f5e7bac:    	sxtw	x25, w25  // guest 0x2510b, sampled 0
6c4f5e7bb0:    	add	x1, x25, x19  // guest 0x2510b, sampled 0
6c4f5e7bb4:    	mov	x0, x19  // guest 0x2510b, sampled 0
6c4f5e7bb8:    	adrp	x16, 0x6c97751000 <trace+0x4816b000>  // guest 0x2510b, sampled 0
6c4f5e7bbc:    	add	x16, x16, #0x4f0  // guest 0x2510b, sampled 0
6c4f5e7bc0:    	blr	x16  // guest 0x2510b, sampled 0
6c4f5e7bc4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2510b, sampled 0
6c4f5e7bc8:    	and	x16, x16, x23, lsr #7  // guest 0x2510b, sampled 0
6c4f5e7bcc:    	add	x17, x17, x16  // guest 0x2510b, sampled 0
6c4f5e7bd0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2510b, sampled 0
6c4f5e7bd4:    	and	w30, w23, #0xfffff003  // guest 0x2510b, sampled 0
6c4f5e7bd8:    	cmp	w16, w30  // guest 0x2510b, sampled 0
6c4f5e7bdc:    	b.ne	0x6c4f5e80ec <trace+0x156c>  // guest 0x2510b, sampled 0
6c4f5e7be0:    	add	x30, x17, w23, uxtw  // guest 0x2510b, sampled 0
6c4f5e7be4:    	stlr	w0, [x30]  // guest 0x2510b, sampled 0
6c4f5e7be8:    	sxtw	x23, w20  // guest 0x2510b, sampled 0
6c4f5e7bec:    	add	x23, x23, x19  // guest 0x2510b, sampled 0
6c4f5e7bf0:    	strb	w22, [x23, #0x190]  // guest 0x2510b, sampled 0
6c4f5e7bf4:    	add	w20, w20, w22  // guest 0x2510b, sampled 0
6c4f5e7bf8:    	and	w20, w20, #0x7  // guest 0x2510b, sampled 0
6c4f5e7bfc:    	str	w20, [x19, #0x188]  // guest 0x2510b, sampled 0
6c4f5e7c00:    	ldr	w23, [x19, #0x74]  // guest 0x2510b, sampled 0
6c4f5e7c04:    	strh	w23, [x19, #0x224]  // guest 0x2510b, sampled 0
6c4f5e7c08:    	str	w24, [x19, #0x230]  // guest 0x2510b, sampled 0
6c4f5e7c0c:    	ldr	w23, [x19, #0x54]  // guest 0x2510b, sampled 0
6c4f5e7c10:    	strh	w23, [x19, #0x222]  // guest 0x2510b, sampled 0
6c4f5e7c14:    	mov	w23, #0x510b            // =20747  // guest 0x2510b, sampled 0
6c4f5e7c18:    	movk	w23, #0x2, lsl #16  // guest 0x2510b, sampled 0
6c4f5e7c1c:    	str	w23, [x19, #0x228]  // guest 0x2510b, sampled 0
6c4f5e7c20:    	add	w21, w21, #0x8  // guest 0x2510e, sampled 0
6c4f5e7c24:    	mov	w23, w21  // guest 0x2510e, sampled 0
6c4f5e7c28:    	lsl	w24, w20, #4  // guest 0x2510e, sampled 0
6c4f5e7c2c:    	add	w24, w24, #0x1a0  // guest 0x2510e, sampled 0
6c4f5e7c30:    	sxtw	x24, w24  // guest 0x2510e, sampled 0
6c4f5e7c34:    	add	x1, x24, x19  // guest 0x2510e, sampled 0
6c4f5e7c38:    	mov	x0, x19  // guest 0x2510e, sampled 0
6c4f5e7c3c:    	adrp	x16, 0x6c97751000 <trace+0x4816b000>  // guest 0x2510e, sampled 0
6c4f5e7c40:    	add	x16, x16, #0x4f0  // guest 0x2510e, sampled 0
6c4f5e7c44:    	blr	x16  // guest 0x2510e, sampled 0
6c4f5e7c48:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2510e, sampled 0
6c4f5e7c4c:    	and	x16, x16, x21, lsr #7  // guest 0x2510e, sampled 0
6c4f5e7c50:    	add	x17, x17, x16  // guest 0x2510e, sampled 0
6c4f5e7c54:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2510e, sampled 0
6c4f5e7c58:    	and	w30, w21, #0xfffff003  // guest 0x2510e, sampled 0
6c4f5e7c5c:    	cmp	w16, w30  // guest 0x2510e, sampled 0
6c4f5e7c60:    	b.ne	0x6c4f5e8118 <trace+0x1598>  // guest 0x2510e, sampled 0
6c4f5e7c64:    	add	x30, x17, w21, uxtw  // guest 0x2510e, sampled 0
6c4f5e7c68:    	stlr	w0, [x30]  // guest 0x2510e, sampled 0
6c4f5e7c6c:    	sxtw	x21, w20  // guest 0x2510e, sampled 0
6c4f5e7c70:    	add	x21, x21, x19  // guest 0x2510e, sampled 0
6c4f5e7c74:    	strb	w22, [x21, #0x190]  // guest 0x2510e, sampled 0
6c4f5e7c78:    	add	w20, w20, w22  // guest 0x2510e, sampled 0
6c4f5e7c7c:    	and	w20, w20, #0x7  // guest 0x2510e, sampled 0
6c4f5e7c80:    	str	w20, [x19, #0x188]  // guest 0x2510e, sampled 0
6c4f5e7c84:    	ldr	w20, [x19, #0x74]  // guest 0x2510e, sampled 0
6c4f5e7c88:    	strh	w20, [x19, #0x224]  // guest 0x2510e, sampled 0
6c4f5e7c8c:    	str	w23, [x19, #0x230]  // guest 0x2510e, sampled 0
6c4f5e7c90:    	ldr	w20, [x19, #0x54]  // guest 0x2510e, sampled 0
6c4f5e7c94:    	strh	w20, [x19, #0x222]  // guest 0x2510e, sampled 0
6c4f5e7c98:    	mov	w20, #0x510e            // =20750  // guest 0x2510e, sampled 0
6c4f5e7c9c:    	movk	w20, #0x2, lsl #16  // guest 0x2510e, sampled 0
6c4f5e7ca0:    	str	w20, [x19, #0x228]  // guest 0x2510e, sampled 0
6c4f5e7ca4:    	ldr	w20, [x19, #0x10]  // guest 0x25111, sampled 0
6c4f5e7ca8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25111, sampled 0
6c4f5e7cac:    	and	x16, x16, x20, lsr #7  // guest 0x25111, sampled 0
6c4f5e7cb0:    	add	x17, x17, x16  // guest 0x25111, sampled 0
6c4f5e7cb4:    	ldp	x16, x17, [x17]  // guest 0x25111, sampled 0
6c4f5e7cb8:    	and	w30, w20, #0xfffff003  // guest 0x25111, sampled 0
6c4f5e7cbc:    	cmp	w16, w30  // guest 0x25111, sampled 0
6c4f5e7cc0:    	b.ne	0x6c4f5e8144 <trace+0x15c4>  // guest 0x25111, sampled 0
6c4f5e7cc4:    	add	x30, x17, w20, uxtw  // guest 0x25111, sampled 0
6c4f5e7cc8:    	ldapr	w21, [x30]  // guest 0x25111, sampled 0
6c4f5e7ccc:    	add	w20, w20, #0x4  // guest 0x25111, sampled 1
6c4f5e7cd0:    	str	w20, [x19, #0x10]  // guest 0x25111, sampled 0
6c4f5e7cd4:    	str	w21, [x19, #0x1c]  // guest 0x25111, sampled 0
6c4f5e7cd8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25112, sampled 0
6c4f5e7cdc:    	and	x16, x16, x20, lsr #7  // guest 0x25112, sampled 0
6c4f5e7ce0:    	add	x17, x17, x16  // guest 0x25112, sampled 0
6c4f5e7ce4:    	ldp	x16, x17, [x17]  // guest 0x25112, sampled 0
6c4f5e7ce8:    	and	w30, w20, #0xfffff003  // guest 0x25112, sampled 0
6c4f5e7cec:    	cmp	w16, w30  // guest 0x25112, sampled 0
6c4f5e7cf0:    	b.ne	0x6c4f5e8170 <trace+0x15f0>  // guest 0x25112, sampled 0
6c4f5e7cf4:    	add	x30, x17, w20, uxtw  // guest 0x25112, sampled 0
6c4f5e7cf8:    	ldapr	w21, [x30]  // guest 0x25112, sampled 0
6c4f5e7cfc:    	add	w20, w20, #0x4  // guest 0x25112, sampled 0
6c4f5e7d00:    	str	w20, [x19, #0x10]  // guest 0x25112, sampled 0
6c4f5e7d04:    	str	w21, [x19, #0x18]  // guest 0x25112, sampled 0
6c4f5e7d08:    	sturb	w22, [x19, #-0xc]  // guest 0x25112, sampled 0
6c4f5e7d0c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25113, sampled 0
6c4f5e7d10:    	and	x16, x16, x20, lsr #7  // guest 0x25113, sampled 0
6c4f5e7d14:    	add	x17, x17, x16  // guest 0x25113, sampled 0
6c4f5e7d18:    	ldp	x16, x17, [x17]  // guest 0x25113, sampled 0
6c4f5e7d1c:    	and	w30, w20, #0xfffff003  // guest 0x25113, sampled 0
6c4f5e7d20:    	cmp	w16, w30  // guest 0x25113, sampled 0
6c4f5e7d24:    	b.ne	0x6c4f5e819c <trace+0x161c>  // guest 0x25113, sampled 0
6c4f5e7d28:    	add	x30, x17, w20, uxtw  // guest 0x25113, sampled 0
6c4f5e7d2c:    	ldapr	w21, [x30]  // guest 0x25113, sampled 0
6c4f5e7d30:    	add	w20, w20, #0x4  // guest 0x25113, sampled 0
6c4f5e7d34:    	str	w20, [x19, #0x10]  // guest 0x25113, sampled 0
6c4f5e7d38:    	str	w21, [x19, #0x20]  // guest 0x25113, sampled 0
6c4f5e7d3c:    	mov	x0, x19  // guest 0x25113, sampled 0
6c4f5e7d40:    	bl	0x6c4ae5d53c <trace+0xfffffffffb8769bc>  // guest 0x25113, sampled 0
6c4f5e7d44:    	br	x0  // guest 0x25113, sampled 0
6c4f5e7d48:    	adr	x0, 0x6c4f5e6ac3 <trace+0xffffffffffffff43>  // guest 0x25113, sampled 0
6c4f5e7d4c:    	b	0x6c4ae5d02c <trace+0xfffffffffb8764ac>  // guest 0x25113, sampled 0
6c4f5e7d50:    	mov	w1, w21
6c4f5e7d54:    	mov	w2, w22
6c4f5e7d58:    	mov	x0, x19
6c4f5e7d5c:    	mov	w3, #0x4045             // =16453
6c4f5e7d60:    	movk	w3, #0x1, lsl #16
6c4f5e7d64:    	adr	x4, 0x6c4f5e6bc0 <trace+0x40>
6c4f5e7d68:    	adrp	x16, 0x6c97724000 <trace+0x4813e000>
6c4f5e7d6c:    	add	x16, x16, #0xb68
6c4f5e7d70:    	blr	x16
6c4f5e7d74:    	dmb	ishld
6c4f5e7d78:    	b	0x6c4f5e6bc0 <trace+0x40>
6c4f5e7d7c:    	mov	w1, w21
6c4f5e7d80:    	mov	w2, w22
6c4f5e7d84:    	mov	x0, x19
6c4f5e7d88:    	mov	w3, #0x4045             // =16453
6c4f5e7d8c:    	movk	w3, #0x1, lsl #16
6c4f5e7d90:    	adr	x4, 0x6c4f5e6bf4 <trace+0x74>
6c4f5e7d94:    	adrp	x16, 0x6c97724000 <trace+0x4813e000>
6c4f5e7d98:    	add	x16, x16, #0xb68
6c4f5e7d9c:    	blr	x16
6c4f5e7da0:    	dmb	ishld
6c4f5e7da4:    	b	0x6c4f5e6bf4 <trace+0x74>
6c4f5e7da8:    	mov	w1, w21
6c4f5e7dac:    	mov	x0, x19
6c4f5e7db0:    	mov	w2, #0x4045             // =16453
6c4f5e7db4:    	movk	w2, #0x1, lsl #16
6c4f5e7db8:    	adr	x3, 0x6c4f5e6c20 <trace+0xa0>
6c4f5e7dbc:    	adrp	x16, 0x6c97723000 <trace+0x4813d000>
6c4f5e7dc0:    	add	x16, x16, #0xf88
6c4f5e7dc4:    	blr	x16
6c4f5e7dc8:    	mov	w21, w0
6c4f5e7dcc:    	dmb	ishld
6c4f5e7dd0:    	b	0x6c4f5e6c20 <trace+0xa0>
6c4f5e7dd4:    	mov	w1, w22
6c4f5e7dd8:    	mov	x0, x19
6c4f5e7ddc:    	mov	w2, #0x4045             // =16453
6c4f5e7de0:    	movk	w2, #0x1, lsl #16
6c4f5e7de4:    	adr	x3, 0x6c4f5e6c4c <trace+0xcc>
6c4f5e7de8:    	adrp	x16, 0x6c97723000 <trace+0x4813d000>
6c4f5e7dec:    	add	x16, x16, #0xf88
6c4f5e7df0:    	blr	x16
6c4f5e7df4:    	mov	w22, w0
6c4f5e7df8:    	dmb	ishld
6c4f5e7dfc:    	b	0x6c4f5e6c4c <trace+0xcc>
6c4f5e7e00:    	mov	w1, w20
6c4f5e7e04:    	mov	x0, x19
6c4f5e7e08:    	mov	w2, #0x4045             // =16453
6c4f5e7e0c:    	movk	w2, #0x1, lsl #16
6c4f5e7e10:    	adr	x3, 0x6c4f5e6c78 <trace+0xf8>
6c4f5e7e14:    	adrp	x16, 0x6c97723000 <trace+0x4813d000>
6c4f5e7e18:    	add	x16, x16, #0xf88
6c4f5e7e1c:    	blr	x16
6c4f5e7e20:    	mov	w20, w0
6c4f5e7e24:    	dmb	ishld
6c4f5e7e28:    	b	0x6c4f5e6c78 <trace+0xf8>
6c4f5e7e2c:    	mov	w1, w21
6c4f5e7e30:    	mov	x0, x19
6c4f5e7e34:    	mov	w2, #0x4045             // =16453
6c4f5e7e38:    	movk	w2, #0x1, lsl #16
6c4f5e7e3c:    	adr	x3, 0x6c4f5e6ca0 <trace+0x120>
6c4f5e7e40:    	adrp	x16, 0x6c97723000 <trace+0x4813d000>
6c4f5e7e44:    	add	x16, x16, #0xf88
6c4f5e7e48:    	blr	x16
6c4f5e7e4c:    	mov	w2, w0
6c4f5e7e50:    	dmb	ishld
6c4f5e7e54:    	b	0x6c4f5e6ca0 <trace+0x120>
6c4f5e7e58:    	mov	w1, w22
6c4f5e7e5c:    	mov	x0, x19
6c4f5e7e60:    	mov	w2, #0x4045             // =16453
6c4f5e7e64:    	movk	w2, #0x1, lsl #16
6c4f5e7e68:    	adr	x3, 0x6c4f5e6d30 <trace+0x1b0>
6c4f5e7e6c:    	adrp	x16, 0x6c97723000 <trace+0x4813d000>
6c4f5e7e70:    	add	x16, x16, #0xf88
6c4f5e7e74:    	blr	x16
6c4f5e7e78:    	mov	w2, w0
6c4f5e7e7c:    	dmb	ishld
6c4f5e7e80:    	b	0x6c4f5e6d30 <trace+0x1b0>
6c4f5e7e84:    	mov	w1, w21
6c4f5e7e88:    	mov	x0, x19
6c4f5e7e8c:    	mov	w2, #0x4045             // =16453
6c4f5e7e90:    	movk	w2, #0x1, lsl #16
6c4f5e7e94:    	adr	x3, 0x6c4f5e6dbc <trace+0x23c>
6c4f5e7e98:    	adrp	x16, 0x6c97723000 <trace+0x4813d000>
6c4f5e7e9c:    	add	x16, x16, #0xf88
6c4f5e7ea0:    	blr	x16
6c4f5e7ea4:    	mov	w2, w0
6c4f5e7ea8:    	dmb	ishld
6c4f5e7eac:    	b	0x6c4f5e6dbc <trace+0x23c>
6c4f5e7eb0:    	mov	w1, w20
6c4f5e7eb4:    	mov	x0, x19
6c4f5e7eb8:    	mov	w2, #0x4045             // =16453
6c4f5e7ebc:    	movk	w2, #0x1, lsl #16
6c4f5e7ec0:    	adr	x3, 0x6c4f5e6e6c <trace+0x2ec>
6c4f5e7ec4:    	adrp	x16, 0x6c97723000 <trace+0x4813d000>
6c4f5e7ec8:    	add	x16, x16, #0xf88
6c4f5e7ecc:    	blr	x16
6c4f5e7ed0:    	mov	w2, w0
6c4f5e7ed4:    	dmb	ishld
6c4f5e7ed8:    	b	0x6c4f5e6e6c <trace+0x2ec>
6c4f5e7edc:    	mov	w1, w20
6c4f5e7ee0:    	mov	x0, x19
6c4f5e7ee4:    	mov	w2, #0x4045             // =16453
6c4f5e7ee8:    	movk	w2, #0x1, lsl #16
6c4f5e7eec:    	adr	x3, 0x6c4f5e6f20 <trace+0x3a0>
6c4f5e7ef0:    	adrp	x16, 0x6c97723000 <trace+0x4813d000>
6c4f5e7ef4:    	add	x16, x16, #0xf88
6c4f5e7ef8:    	blr	x16
6c4f5e7efc:    	mov	w2, w0
6c4f5e7f00:    	dmb	ishld
6c4f5e7f04:    	b	0x6c4f5e6f20 <trace+0x3a0>
6c4f5e7f08:    	mov	w1, w20
6c4f5e7f0c:    	mov	x0, x19
6c4f5e7f10:    	mov	w2, #0x4045             // =16453
6c4f5e7f14:    	movk	w2, #0x1, lsl #16
6c4f5e7f18:    	adr	x3, 0x6c4f5e6fd4 <trace+0x454>
6c4f5e7f1c:    	adrp	x16, 0x6c97723000 <trace+0x4813d000>
6c4f5e7f20:    	add	x16, x16, #0xf88
6c4f5e7f24:    	blr	x16
6c4f5e7f28:    	mov	w2, w0
6c4f5e7f2c:    	dmb	ishld
6c4f5e7f30:    	b	0x6c4f5e6fd4 <trace+0x454>
6c4f5e7f34:    	mov	w1, w22
6c4f5e7f38:    	mov	x0, x19
6c4f5e7f3c:    	mov	w2, #0x4045             // =16453
6c4f5e7f40:    	movk	w2, #0x1, lsl #16
6c4f5e7f44:    	adr	x3, 0x6c4f5e70f0 <trace+0x570>
6c4f5e7f48:    	adrp	x16, 0x6c97723000 <trace+0x4813d000>
6c4f5e7f4c:    	add	x16, x16, #0xf88
6c4f5e7f50:    	blr	x16
6c4f5e7f54:    	mov	w2, w0
6c4f5e7f58:    	dmb	ishld
6c4f5e7f5c:    	b	0x6c4f5e70f0 <trace+0x570>
6c4f5e7f60:    	mov	w1, w21
6c4f5e7f64:    	mov	x0, x19
6c4f5e7f68:    	mov	w2, #0x4045             // =16453
6c4f5e7f6c:    	movk	w2, #0x1, lsl #16
6c4f5e7f70:    	adr	x3, 0x6c4f5e71d8 <trace+0x658>
6c4f5e7f74:    	adrp	x16, 0x6c97723000 <trace+0x4813d000>
6c4f5e7f78:    	add	x16, x16, #0xf88
6c4f5e7f7c:    	blr	x16
6c4f5e7f80:    	mov	w2, w0
6c4f5e7f84:    	dmb	ishld
6c4f5e7f88:    	b	0x6c4f5e71d8 <trace+0x658>
6c4f5e7f8c:    	mov	w1, w20
6c4f5e7f90:    	mov	x0, x19
6c4f5e7f94:    	mov	w2, #0x4045             // =16453
6c4f5e7f98:    	movk	w2, #0x1, lsl #16
6c4f5e7f9c:    	adr	x3, 0x6c4f5e7288 <trace+0x708>
6c4f5e7fa0:    	adrp	x16, 0x6c97723000 <trace+0x4813d000>
6c4f5e7fa4:    	add	x16, x16, #0xf88
6c4f5e7fa8:    	blr	x16
6c4f5e7fac:    	mov	w2, w0
6c4f5e7fb0:    	dmb	ishld
6c4f5e7fb4:    	b	0x6c4f5e7288 <trace+0x708>
6c4f5e7fb8:    	mov	w1, w22
6c4f5e7fbc:    	mov	x0, x19
6c4f5e7fc0:    	mov	w2, #0x4045             // =16453
6c4f5e7fc4:    	movk	w2, #0x1, lsl #16
6c4f5e7fc8:    	adr	x3, 0x6c4f5e73a4 <trace+0x824>
6c4f5e7fcc:    	adrp	x16, 0x6c97723000 <trace+0x4813d000>
6c4f5e7fd0:    	add	x16, x16, #0xf88
6c4f5e7fd4:    	blr	x16
6c4f5e7fd8:    	mov	w2, w0
6c4f5e7fdc:    	dmb	ishld
6c4f5e7fe0:    	b	0x6c4f5e73a4 <trace+0x824>
6c4f5e7fe4:    	mov	w1, w21
6c4f5e7fe8:    	mov	x0, x19
6c4f5e7fec:    	mov	w2, #0x4045             // =16453
6c4f5e7ff0:    	movk	w2, #0x1, lsl #16
6c4f5e7ff4:    	adr	x3, 0x6c4f5e748c <trace+0x90c>
6c4f5e7ff8:    	adrp	x16, 0x6c97723000 <trace+0x4813d000>
6c4f5e7ffc:    	add	x16, x16, #0xf88
6c4f5e8000:    	blr	x16
6c4f5e8004:    	mov	w2, w0
6c4f5e8008:    	dmb	ishld
6c4f5e800c:    	b	0x6c4f5e748c <trace+0x90c>
6c4f5e8010:    	mov	w1, w20
6c4f5e8014:    	mov	x0, x19
6c4f5e8018:    	mov	w2, #0x4045             // =16453
6c4f5e801c:    	movk	w2, #0x1, lsl #16
6c4f5e8020:    	adr	x3, 0x6c4f5e753c <trace+0x9bc>
6c4f5e8024:    	adrp	x16, 0x6c97723000 <trace+0x4813c000>
6c4f5e8028:    	add	x16, x16, #0xf88
6c4f5e802c:    	blr	x16
6c4f5e8030:    	mov	w2, w0
6c4f5e8034:    	dmb	ishld
6c4f5e8038:    	b	0x6c4f5e753c <trace+0x9bc>
6c4f5e803c:    	mov	w1, w23
6c4f5e8040:    	mov	x0, x19
6c4f5e8044:    	mov	w2, #0x4045             // =16453
6c4f5e8048:    	movk	w2, #0x1, lsl #16
6c4f5e804c:    	adr	x3, 0x6c4f5e77ac <trace+0xc2c>
6c4f5e8050:    	adrp	x16, 0x6c97723000 <trace+0x4813c000>
6c4f5e8054:    	add	x16, x16, #0xf88
6c4f5e8058:    	blr	x16
6c4f5e805c:    	mov	w2, w0
6c4f5e8060:    	dmb	ishld
6c4f5e8064:    	b	0x6c4f5e77ac <trace+0xc2c>
6c4f5e8068:    	mov	w1, w21
6c4f5e806c:    	mov	x0, x19
6c4f5e8070:    	mov	w2, #0x4045             // =16453
6c4f5e8074:    	movk	w2, #0x1, lsl #16
6c4f5e8078:    	adr	x3, 0x6c4f5e7894 <trace+0xd14>
6c4f5e807c:    	adrp	x16, 0x6c97723000 <trace+0x4813c000>
6c4f5e8080:    	add	x16, x16, #0xf88
6c4f5e8084:    	blr	x16
6c4f5e8088:    	mov	w2, w0
6c4f5e808c:    	dmb	ishld
6c4f5e8090:    	b	0x6c4f5e7894 <trace+0xd14>
6c4f5e8094:    	mov	w1, w20
6c4f5e8098:    	mov	x0, x19
6c4f5e809c:    	mov	w2, #0x4045             // =16453
6c4f5e80a0:    	movk	w2, #0x1, lsl #16
6c4f5e80a4:    	adr	x3, 0x6c4f5e7944 <trace+0xdc4>
6c4f5e80a8:    	adrp	x16, 0x6c97723000 <trace+0x4813c000>
6c4f5e80ac:    	add	x16, x16, #0xf88
6c4f5e80b0:    	blr	x16
6c4f5e80b4:    	mov	w2, w0
6c4f5e80b8:    	dmb	ishld
6c4f5e80bc:    	b	0x6c4f5e7944 <trace+0xdc4>
6c4f5e80c0:    	mov	w1, w21
6c4f5e80c4:    	mov	w2, w0
6c4f5e80c8:    	mov	x0, x19
6c4f5e80cc:    	mov	w3, #0x4045             // =16453
6c4f5e80d0:    	movk	w3, #0x1, lsl #16
6c4f5e80d4:    	adr	x4, 0x6c4f5e7b64 <trace+0xfe4>
6c4f5e80d8:    	adrp	x16, 0x6c97724000 <trace+0x4813d000>
6c4f5e80dc:    	add	x16, x16, #0xb68
6c4f5e80e0:    	blr	x16
6c4f5e80e4:    	dmb	ishld
6c4f5e80e8:    	b	0x6c4f5e7b64 <trace+0xfe4>
6c4f5e80ec:    	mov	w1, w23
6c4f5e80f0:    	mov	w2, w0
6c4f5e80f4:    	mov	x0, x19
6c4f5e80f8:    	mov	w3, #0x4045             // =16453
6c4f5e80fc:    	movk	w3, #0x1, lsl #16
6c4f5e8100:    	adr	x4, 0x6c4f5e7be8 <trace+0x1068>
6c4f5e8104:    	adrp	x16, 0x6c97724000 <trace+0x4813d000>
6c4f5e8108:    	add	x16, x16, #0xb68
6c4f5e810c:    	blr	x16
6c4f5e8110:    	dmb	ishld
6c4f5e8114:    	b	0x6c4f5e7be8 <trace+0x1068>
6c4f5e8118:    	mov	w1, w21
6c4f5e811c:    	mov	w2, w0
6c4f5e8120:    	mov	x0, x19
6c4f5e8124:    	mov	w3, #0x4045             // =16453
6c4f5e8128:    	movk	w3, #0x1, lsl #16
6c4f5e812c:    	adr	x4, 0x6c4f5e7c6c <trace+0x10ec>
6c4f5e8130:    	adrp	x16, 0x6c97724000 <trace+0x4813d000>
6c4f5e8134:    	add	x16, x16, #0xb68
6c4f5e8138:    	blr	x16
6c4f5e813c:    	dmb	ishld
6c4f5e8140:    	b	0x6c4f5e7c6c <trace+0x10ec>
6c4f5e8144:    	mov	w1, w20
6c4f5e8148:    	mov	x0, x19
6c4f5e814c:    	mov	w2, #0x4045             // =16453
6c4f5e8150:    	movk	w2, #0x1, lsl #16
6c4f5e8154:    	adr	x3, 0x6c4f5e7ccc <trace+0x114c>
6c4f5e8158:    	adrp	x16, 0x6c97723000 <trace+0x4813c000>
6c4f5e815c:    	add	x16, x16, #0xf88
6c4f5e8160:    	blr	x16
6c4f5e8164:    	mov	w21, w0
6c4f5e8168:    	dmb	ishld
6c4f5e816c:    	b	0x6c4f5e7ccc <trace+0x114c>
6c4f5e8170:    	mov	w1, w20
6c4f5e8174:    	mov	x0, x19
6c4f5e8178:    	mov	w2, #0x4045             // =16453
6c4f5e817c:    	movk	w2, #0x1, lsl #16
6c4f5e8180:    	adr	x3, 0x6c4f5e7cfc <trace+0x117c>
6c4f5e8184:    	adrp	x16, 0x6c97723000 <trace+0x4813c000>
6c4f5e8188:    	add	x16, x16, #0xf88
6c4f5e818c:    	blr	x16
6c4f5e8190:    	mov	w21, w0
6c4f5e8194:    	dmb	ishld
6c4f5e8198:    	b	0x6c4f5e7cfc <trace+0x117c>
6c4f5e819c:    	mov	w1, w20
6c4f5e81a0:    	mov	x0, x19
6c4f5e81a4:    	mov	w2, #0x4045             // =16453
6c4f5e81a8:    	movk	w2, #0x1, lsl #16
6c4f5e81ac:    	adr	x3, 0x6c4f5e7d30 <trace+0x11b0>
6c4f5e81b0:    	adrp	x16, 0x6c97723000 <trace+0x4813c000>
6c4f5e81b4:    	add	x16, x16, #0xf88
6c4f5e81b8:    	blr	x16
6c4f5e81bc:    	mov	w21, w0
6c4f5e81c0:    	dmb	ishld
6c4f5e81c4:    	b	0x6c4f5e7d30 <trace+0x11b0>