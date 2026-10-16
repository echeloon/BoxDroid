
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-18c914-6c514e6b00.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006c514e6b00 <trace>:
6c514e6b00:    	ldur	w20, [x19, #-0x10]  // guest 0x18c914, sampled 0
6c514e6b04:    	tbnz	w20, #0x1f, 0x6c514e7a18 <trace+0xf18>  // guest 0x18c914, sampled 0
6c514e6b08:    	sturb	wzr, [x19, #-0xc]  // guest 0x18c914, sampled 0
6c514e6b0c:    	ldr	w20, [x19, #0x188]  // guest 0x18c914, sampled 0
6c514e6b10:    	sub	w20, w20, #0x1  // guest 0x18c914, sampled 0
6c514e6b14:    	and	w20, w20, #0x7  // guest 0x18c914, sampled 0
6c514e6b18:    	str	w20, [x19, #0x188]  // guest 0x18c914, sampled 0
6c514e6b1c:    	sxtw	x21, w20  // guest 0x18c914, sampled 0
6c514e6b20:    	add	x21, x21, x19  // guest 0x18c914, sampled 0
6c514e6b24:    	strb	wzr, [x21, #0x190]  // guest 0x18c914, sampled 0
6c514e6b28:    	lsl	w21, w20, #4  // guest 0x18c914, sampled 0
6c514e6b2c:    	add	w21, w21, #0x1a0  // guest 0x18c914, sampled 0
6c514e6b30:    	sxtw	x21, w21  // guest 0x18c914, sampled 0
6c514e6b34:    	add	x21, x21, x19  // guest 0x18c914, sampled 0
6c514e6b38:    	add	w22, w20, #0x1  // guest 0x18c914, sampled 0
6c514e6b3c:    	and	w22, w22, #0x7  // guest 0x18c914, sampled 0
6c514e6b40:    	lsl	w22, w22, #4  // guest 0x18c914, sampled 0
6c514e6b44:    	add	w22, w22, #0x1a0  // guest 0x18c914, sampled 0
6c514e6b48:    	sxtw	x22, w22  // guest 0x18c914, sampled 0
6c514e6b4c:    	add	x22, x22, x19  // guest 0x18c914, sampled 0
6c514e6b50:    	ldr	x23, [x22]  // guest 0x18c914, sampled 0
6c514e6b54:    	ldrh	w22, [x22, #0x8]  // guest 0x18c914, sampled 0
6c514e6b58:    	str	x23, [x21]  // guest 0x18c914, sampled 0
6c514e6b5c:    	strh	w22, [x21, #0x8]  // guest 0x18c914, sampled 0
6c514e6b60:    	ldr	w21, [x19, #0x54]  // guest 0x18c914, sampled 0
6c514e6b64:    	strh	w21, [x19, #0x222]  // guest 0x18c914, sampled 0
6c514e6b68:    	mov	w21, #0xc914            // =51476  // guest 0x18c914, sampled 0
6c514e6b6c:    	movk	w21, #0x18, lsl #16  // guest 0x18c914, sampled 0
6c514e6b70:    	str	w21, [x19, #0x228]  // guest 0x18c914, sampled 0
6c514e6b74:    	ldr	w21, [x19, #0x8]  // guest 0x18c916, sampled 0
6c514e6b78:    	add	w21, w21, #0x4  // guest 0x18c916, sampled 0
6c514e6b7c:    	str	w21, [x19, #0x8]  // guest 0x18c916, sampled 0
6c514e6b80:    	str	w21, [x19, #0x28]  // guest 0x18c916, sampled 0
6c514e6b84:    	mov	w22, #0x4               // =4  // guest 0x18c916, sampled 0
6c514e6b88:    	str	w22, [x19, #0x2c]  // guest 0x18c916, sampled 0
6c514e6b8c:    	sub	w21, w21, #0x4  // guest 0x18c919, sampled 0
6c514e6b90:    	mov	w22, w21  // guest 0x18c919, sampled 0
6c514e6b94:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c919, sampled 0
6c514e6b98:    	and	x16, x16, x21, lsr #7  // guest 0x18c919, sampled 0
6c514e6b9c:    	add	x17, x17, x16  // guest 0x18c919, sampled 0
6c514e6ba0:    	ldp	x16, x17, [x17]  // guest 0x18c919, sampled 0
6c514e6ba4:    	and	w30, w21, #0xfffff003  // guest 0x18c919, sampled 0
6c514e6ba8:    	cmp	w16, w30  // guest 0x18c919, sampled 0
6c514e6bac:    	b.ne	0x6c514e7a20 <trace+0xf20>  // guest 0x18c919, sampled 0
6c514e6bb0:    	add	x30, x17, w21, uxtw  // guest 0x18c919, sampled 0
6c514e6bb4:    	ldapr	w2, [x30]  // guest 0x18c919, sampled 0
6c514e6bb8:    	add	x1, x19, #0x258  // guest 0x18c919, sampled 0
6c514e6bbc:    	mov	x0, x19  // guest 0x18c919, sampled 0
6c514e6bc0:    	adrp	x16, 0x6c97751000 <trace+0x4626b000>  // guest 0x18c919, sampled 0
6c514e6bc4:    	add	x16, x16, #0x3b4  // guest 0x18c919, sampled 0
6c514e6bc8:    	blr	x16  // guest 0x18c919, sampled 0
6c514e6bcc:    	lsl	w21, w20, #4  // guest 0x18c919, sampled 0
6c514e6bd0:    	add	w21, w21, #0x1a0  // guest 0x18c919, sampled 0
6c514e6bd4:    	sxtw	x21, w21  // guest 0x18c919, sampled 0
6c514e6bd8:    	add	x1, x21, x19  // guest 0x18c919, sampled 0
6c514e6bdc:    	add	x2, x19, #0x258  // guest 0x18c919, sampled 0
6c514e6be0:    	mov	x0, x19  // guest 0x18c919, sampled 0
6c514e6be4:    	adrp	x16, 0x6c97752000 <trace+0x4626c000>  // guest 0x18c919, sampled 0
6c514e6be8:    	add	x16, x16, #0xa7c  // guest 0x18c919, sampled 0
6c514e6bec:    	blr	x16  // guest 0x18c919, sampled 0
6c514e6bf0:    	ldr	w21, [x19, #0x74]  // guest 0x18c919, sampled 0
6c514e6bf4:    	strh	w21, [x19, #0x224]  // guest 0x18c919, sampled 0
6c514e6bf8:    	str	w22, [x19, #0x230]  // guest 0x18c919, sampled 0
6c514e6bfc:    	ldr	w21, [x19, #0x54]  // guest 0x18c919, sampled 0
6c514e6c00:    	strh	w21, [x19, #0x222]  // guest 0x18c919, sampled 0
6c514e6c04:    	mov	w21, #0xc919            // =51481  // guest 0x18c919, sampled 0
6c514e6c08:    	movk	w21, #0x18, lsl #16  // guest 0x18c919, sampled 0
6c514e6c0c:    	str	w21, [x19, #0x228]  // guest 0x18c919, sampled 0
6c514e6c10:    	ldr	w21, [x19]  // guest 0x18c91c, sampled 0
6c514e6c14:    	add	w21, w21, #0x8  // guest 0x18c91c, sampled 0
6c514e6c18:    	str	w21, [x19]  // guest 0x18c91c, sampled 0
6c514e6c1c:    	ldr	w21, [x19, #0x4]  // guest 0x18c91f, sampled 0
6c514e6c20:    	mov	w22, w21  // guest 0x18c91f, sampled 0
6c514e6c24:    	sub	w21, w21, #0x8  // guest 0x18c91f, sampled 0
6c514e6c28:    	str	w21, [x19, #0x4]  // guest 0x18c91f, sampled 0
6c514e6c2c:    	ldr	w21, [x19, #0x1c]  // guest 0x18c922, sampled 0
6c514e6c30:    	sub	w21, w21, #0x1  // guest 0x18c922, sampled 0
6c514e6c34:    	cmp	w22, #0x8  // guest 0x18c922, sampled 0
6c514e6c38:    	cset	w22, lo  // guest 0x18c922, sampled 0
6c514e6c3c:    	str	w21, [x19, #0x1c]  // guest 0x18c922, sampled 0
6c514e6c40:    	str	w21, [x19, #0x28]  // guest 0x18c922, sampled 0
6c514e6c44:    	str	w22, [x19, #0x2c]  // guest 0x18c922, sampled 0
6c514e6c48:    	sub	w20, w20, #0x1  // guest 0x18c923, sampled 0
6c514e6c4c:    	and	w20, w20, #0x7  // guest 0x18c923, sampled 0
6c514e6c50:    	str	w20, [x19, #0x188]  // guest 0x18c923, sampled 0
6c514e6c54:    	sxtw	x21, w20  // guest 0x18c923, sampled 0
6c514e6c58:    	add	x21, x21, x19  // guest 0x18c923, sampled 0
6c514e6c5c:    	strb	wzr, [x21, #0x190]  // guest 0x18c923, sampled 0
6c514e6c60:    	lsl	w21, w20, #4  // guest 0x18c923, sampled 0
6c514e6c64:    	add	w21, w21, #0x1a0  // guest 0x18c923, sampled 0
6c514e6c68:    	sxtw	x21, w21  // guest 0x18c923, sampled 0
6c514e6c6c:    	add	x21, x21, x19  // guest 0x18c923, sampled 0
6c514e6c70:    	add	w20, w20, #0x1  // guest 0x18c923, sampled 0
6c514e6c74:    	and	w20, w20, #0x7  // guest 0x18c923, sampled 0
6c514e6c78:    	lsl	w20, w20, #4  // guest 0x18c923, sampled 0
6c514e6c7c:    	add	w20, w20, #0x1a0  // guest 0x18c923, sampled 0
6c514e6c80:    	sxtw	x20, w20  // guest 0x18c923, sampled 0
6c514e6c84:    	add	x20, x20, x19  // guest 0x18c923, sampled 0
6c514e6c88:    	ldr	x22, [x20]  // guest 0x18c923, sampled 0
6c514e6c8c:    	ldrh	w20, [x20, #0x8]  // guest 0x18c923, sampled 0
6c514e6c90:    	str	x22, [x21]  // guest 0x18c923, sampled 0
6c514e6c94:    	strh	w20, [x21, #0x8]  // guest 0x18c923, sampled 0
6c514e6c98:    	ldr	w20, [x19, #0x54]  // guest 0x18c923, sampled 0
6c514e6c9c:    	strh	w20, [x19, #0x222]  // guest 0x18c923, sampled 0
6c514e6ca0:    	mov	w20, #0xc923            // =51491  // guest 0x18c923, sampled 0
6c514e6ca4:    	movk	w20, #0x18, lsl #16  // guest 0x18c923, sampled 0
6c514e6ca8:    	str	w20, [x19, #0x228]  // guest 0x18c923, sampled 0
6c514e6cac:    	mov	x0, x19  // guest 0x18c925, sampled 0
6c514e6cb0:    	dmb	ish  // guest 0x18c925, sampled 0
6c514e6cb4:    	adrp	x16, 0x6c97757000 <trace+0x46271000>  // guest 0x18c925, sampled 2
6c514e6cb8:    	add	x16, x16, #0xad8  // guest 0x18c925, sampled 0
6c514e6cbc:    	blr	x16  // guest 0x18c925, sampled 0
6c514e6cc0:    	dmb	ishld  // guest 0x18c925, sampled 0
6c514e6cc4:    	ldr	w20, [x19, #0x54]  // guest 0x18c925, sampled 1
6c514e6cc8:    	strh	w20, [x19, #0x222]  // guest 0x18c925, sampled 0
6c514e6ccc:    	mov	w20, #0xc925            // =51493  // guest 0x18c925, sampled 0
6c514e6cd0:    	movk	w20, #0x18, lsl #16  // guest 0x18c925, sampled 0
6c514e6cd4:    	str	w20, [x19, #0x228]  // guest 0x18c925, sampled 0
6c514e6cd8:    	mov	w1, #0x1                // =1  // guest 0x18c927, sampled 0
6c514e6cdc:    	mov	x0, x19  // guest 0x18c927, sampled 0
6c514e6ce0:    	adrp	x16, 0x6c97752000 <trace+0x4626c000>  // guest 0x18c927, sampled 0
6c514e6ce4:    	add	x16, x16, #0x4d0  // guest 0x18c927, sampled 0
6c514e6ce8:    	blr	x16  // guest 0x18c927, sampled 0
6c514e6cec:    	ldr	w20, [x19, #0x54]  // guest 0x18c927, sampled 0
6c514e6cf0:    	strh	w20, [x19, #0x222]  // guest 0x18c927, sampled 0
6c514e6cf4:    	mov	w20, #0xc927            // =51495  // guest 0x18c927, sampled 0
6c514e6cf8:    	movk	w20, #0x18, lsl #16  // guest 0x18c927, sampled 0
6c514e6cfc:    	str	w20, [x19, #0x228]  // guest 0x18c927, sampled 0
6c514e6d00:    	mov	x0, x19  // guest 0x18c929, sampled 0
6c514e6d04:    	dmb	ish  // guest 0x18c929, sampled 0
6c514e6d08:    	adrp	x16, 0x6c97757000 <trace+0x46271000>  // guest 0x18c929, sampled 0
6c514e6d0c:    	add	x16, x16, #0xa48  // guest 0x18c929, sampled 0
6c514e6d10:    	blr	x16  // guest 0x18c929, sampled 0
6c514e6d14:    	dmb	ishld  // guest 0x18c929, sampled 0
6c514e6d18:    	ldr	w20, [x19, #0x54]  // guest 0x18c929, sampled 1
6c514e6d1c:    	strh	w20, [x19, #0x222]  // guest 0x18c929, sampled 0
6c514e6d20:    	mov	w20, #0xc929            // =51497  // guest 0x18c929, sampled 0
6c514e6d24:    	movk	w20, #0x18, lsl #16  // guest 0x18c929, sampled 0
6c514e6d28:    	str	w20, [x19, #0x228]  // guest 0x18c929, sampled 0
6c514e6d2c:    	ldr	w20, [x19, #0x188]  // guest 0x18c92b, sampled 0
6c514e6d30:    	sub	w20, w20, #0x1  // guest 0x18c92b, sampled 0
6c514e6d34:    	and	w20, w20, #0x7  // guest 0x18c92b, sampled 0
6c514e6d38:    	str	w20, [x19, #0x188]  // guest 0x18c92b, sampled 0
6c514e6d3c:    	sxtw	x21, w20  // guest 0x18c92b, sampled 0
6c514e6d40:    	add	x21, x21, x19  // guest 0x18c92b, sampled 0
6c514e6d44:    	strb	wzr, [x21, #0x190]  // guest 0x18c92b, sampled 0
6c514e6d48:    	lsl	w21, w20, #4  // guest 0x18c92b, sampled 0
6c514e6d4c:    	add	w21, w21, #0x1a0  // guest 0x18c92b, sampled 0
6c514e6d50:    	sxtw	x21, w21  // guest 0x18c92b, sampled 0
6c514e6d54:    	add	x21, x21, x19  // guest 0x18c92b, sampled 0
6c514e6d58:    	add	w22, w20, #0x2  // guest 0x18c92b, sampled 0
6c514e6d5c:    	and	w22, w22, #0x7  // guest 0x18c92b, sampled 0
6c514e6d60:    	lsl	w22, w22, #4  // guest 0x18c92b, sampled 0
6c514e6d64:    	add	w22, w22, #0x1a0  // guest 0x18c92b, sampled 0
6c514e6d68:    	sxtw	x22, w22  // guest 0x18c92b, sampled 0
6c514e6d6c:    	add	x22, x22, x19  // guest 0x18c92b, sampled 0
6c514e6d70:    	ldr	x23, [x22]  // guest 0x18c92b, sampled 0
6c514e6d74:    	ldrh	w22, [x22, #0x8]  // guest 0x18c92b, sampled 0
6c514e6d78:    	str	x23, [x21]  // guest 0x18c92b, sampled 0
6c514e6d7c:    	strh	w22, [x21, #0x8]  // guest 0x18c92b, sampled 0
6c514e6d80:    	ldr	w21, [x19, #0x54]  // guest 0x18c92b, sampled 0
6c514e6d84:    	strh	w21, [x19, #0x222]  // guest 0x18c92b, sampled 0
6c514e6d88:    	mov	w21, #0xc92b            // =51499  // guest 0x18c92b, sampled 0
6c514e6d8c:    	movk	w21, #0x18, lsl #16  // guest 0x18c92b, sampled 0
6c514e6d90:    	str	w21, [x19, #0x228]  // guest 0x18c92b, sampled 0
6c514e6d94:    	ldr	w21, [x19]  // guest 0x18c92d, sampled 0
6c514e6d98:    	sub	w22, w21, #0xc  // guest 0x18c92d, sampled 0
6c514e6d9c:    	mov	w23, w22  // guest 0x18c92d, sampled 0
6c514e6da0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c92d, sampled 0
6c514e6da4:    	and	x16, x16, x22, lsr #7  // guest 0x18c92d, sampled 0
6c514e6da8:    	add	x17, x17, x16  // guest 0x18c92d, sampled 0
6c514e6dac:    	ldp	x16, x17, [x17]  // guest 0x18c92d, sampled 0
6c514e6db0:    	and	w30, w22, #0xfffff003  // guest 0x18c92d, sampled 0
6c514e6db4:    	cmp	w16, w30  // guest 0x18c92d, sampled 0
6c514e6db8:    	b.ne	0x6c514e7a4c <trace+0xf4c>  // guest 0x18c92d, sampled 0
6c514e6dbc:    	add	x30, x17, w22, uxtw  // guest 0x18c92d, sampled 0
6c514e6dc0:    	ldapr	w2, [x30]  // guest 0x18c92d, sampled 0
6c514e6dc4:    	add	x1, x19, #0x258  // guest 0x18c92d, sampled 0
6c514e6dc8:    	mov	x0, x19  // guest 0x18c92d, sampled 0
6c514e6dcc:    	adrp	x16, 0x6c97751000 <trace+0x4626b000>  // guest 0x18c92d, sampled 0
6c514e6dd0:    	add	x16, x16, #0x3b4  // guest 0x18c92d, sampled 0
6c514e6dd4:    	blr	x16  // guest 0x18c92d, sampled 0
6c514e6dd8:    	lsl	w22, w20, #4  // guest 0x18c92d, sampled 0
6c514e6ddc:    	add	w22, w22, #0x1a0  // guest 0x18c92d, sampled 0
6c514e6de0:    	sxtw	x22, w22  // guest 0x18c92d, sampled 0
6c514e6de4:    	add	x1, x22, x19  // guest 0x18c92d, sampled 0
6c514e6de8:    	add	x2, x19, #0x258  // guest 0x18c92d, sampled 0
6c514e6dec:    	mov	x0, x19  // guest 0x18c92d, sampled 0
6c514e6df0:    	adrp	x16, 0x6c97752000 <trace+0x4626c000>  // guest 0x18c92d, sampled 0
6c514e6df4:    	add	x16, x16, #0xa7c  // guest 0x18c92d, sampled 0
6c514e6df8:    	blr	x16  // guest 0x18c92d, sampled 0
6c514e6dfc:    	ldr	w22, [x19, #0x74]  // guest 0x18c92d, sampled 0
6c514e6e00:    	strh	w22, [x19, #0x224]  // guest 0x18c92d, sampled 0
6c514e6e04:    	str	w23, [x19, #0x230]  // guest 0x18c92d, sampled 0
6c514e6e08:    	ldr	w22, [x19, #0x54]  // guest 0x18c92d, sampled 0
6c514e6e0c:    	strh	w22, [x19, #0x222]  // guest 0x18c92d, sampled 0
6c514e6e10:    	mov	w22, #0xc92d            // =51501  // guest 0x18c92d, sampled 0
6c514e6e14:    	movk	w22, #0x18, lsl #16  // guest 0x18c92d, sampled 0
6c514e6e18:    	str	w22, [x19, #0x228]  // guest 0x18c92d, sampled 0
6c514e6e1c:    	sub	w20, w20, #0x1  // guest 0x18c930, sampled 0
6c514e6e20:    	and	w20, w20, #0x7  // guest 0x18c930, sampled 0
6c514e6e24:    	str	w20, [x19, #0x188]  // guest 0x18c930, sampled 0
6c514e6e28:    	sxtw	x22, w20  // guest 0x18c930, sampled 0
6c514e6e2c:    	add	x22, x22, x19  // guest 0x18c930, sampled 0
6c514e6e30:    	strb	wzr, [x22, #0x190]  // guest 0x18c930, sampled 0
6c514e6e34:    	lsl	w22, w20, #4  // guest 0x18c930, sampled 0
6c514e6e38:    	add	w22, w22, #0x1a0  // guest 0x18c930, sampled 0
6c514e6e3c:    	sxtw	x22, w22  // guest 0x18c930, sampled 0
6c514e6e40:    	add	x22, x22, x19  // guest 0x18c930, sampled 0
6c514e6e44:    	add	w23, w20, #0x2  // guest 0x18c930, sampled 0
6c514e6e48:    	and	w23, w23, #0x7  // guest 0x18c930, sampled 0
6c514e6e4c:    	lsl	w23, w23, #4  // guest 0x18c930, sampled 0
6c514e6e50:    	add	w23, w23, #0x1a0  // guest 0x18c930, sampled 0
6c514e6e54:    	sxtw	x23, w23  // guest 0x18c930, sampled 0
6c514e6e58:    	add	x23, x23, x19  // guest 0x18c930, sampled 0
6c514e6e5c:    	ldr	x24, [x23]  // guest 0x18c930, sampled 0
6c514e6e60:    	ldrh	w23, [x23, #0x8]  // guest 0x18c930, sampled 0
6c514e6e64:    	str	x24, [x22]  // guest 0x18c930, sampled 0
6c514e6e68:    	strh	w23, [x22, #0x8]  // guest 0x18c930, sampled 0
6c514e6e6c:    	ldr	w22, [x19, #0x54]  // guest 0x18c930, sampled 0
6c514e6e70:    	strh	w22, [x19, #0x222]  // guest 0x18c930, sampled 0
6c514e6e74:    	mov	w22, #0xc930            // =51504  // guest 0x18c930, sampled 0
6c514e6e78:    	movk	w22, #0x18, lsl #16  // guest 0x18c930, sampled 0
6c514e6e7c:    	str	w22, [x19, #0x228]  // guest 0x18c930, sampled 0
6c514e6e80:    	sub	w22, w21, #0x8  // guest 0x18c932, sampled 0
6c514e6e84:    	mov	w23, w22  // guest 0x18c932, sampled 0
6c514e6e88:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c932, sampled 0
6c514e6e8c:    	and	x16, x16, x22, lsr #7  // guest 0x18c932, sampled 0
6c514e6e90:    	add	x17, x17, x16  // guest 0x18c932, sampled 0
6c514e6e94:    	ldp	x16, x17, [x17]  // guest 0x18c932, sampled 0
6c514e6e98:    	and	w30, w22, #0xfffff003  // guest 0x18c932, sampled 0
6c514e6e9c:    	cmp	w16, w30  // guest 0x18c932, sampled 0
6c514e6ea0:    	b.ne	0x6c514e7a78 <trace+0xf78>  // guest 0x18c932, sampled 0
6c514e6ea4:    	add	x30, x17, w22, uxtw  // guest 0x18c932, sampled 0
6c514e6ea8:    	ldapr	w2, [x30]  // guest 0x18c932, sampled 0
6c514e6eac:    	add	x1, x19, #0x258  // guest 0x18c932, sampled 1
6c514e6eb0:    	mov	x0, x19  // guest 0x18c932, sampled 0
6c514e6eb4:    	adrp	x16, 0x6c97751000 <trace+0x4626b000>  // guest 0x18c932, sampled 0
6c514e6eb8:    	add	x16, x16, #0x3b4  // guest 0x18c932, sampled 0
6c514e6ebc:    	blr	x16  // guest 0x18c932, sampled 0
6c514e6ec0:    	lsl	w22, w20, #4  // guest 0x18c932, sampled 0
6c514e6ec4:    	add	w22, w22, #0x1a0  // guest 0x18c932, sampled 0
6c514e6ec8:    	sxtw	x22, w22  // guest 0x18c932, sampled 0
6c514e6ecc:    	add	x1, x22, x19  // guest 0x18c932, sampled 0
6c514e6ed0:    	add	x2, x19, #0x258  // guest 0x18c932, sampled 0
6c514e6ed4:    	mov	x0, x19  // guest 0x18c932, sampled 0
6c514e6ed8:    	adrp	x16, 0x6c97752000 <trace+0x4626c000>  // guest 0x18c932, sampled 0
6c514e6edc:    	add	x16, x16, #0xa7c  // guest 0x18c932, sampled 0
6c514e6ee0:    	blr	x16  // guest 0x18c932, sampled 0
6c514e6ee4:    	ldr	w22, [x19, #0x74]  // guest 0x18c932, sampled 0
6c514e6ee8:    	strh	w22, [x19, #0x224]  // guest 0x18c932, sampled 0
6c514e6eec:    	str	w23, [x19, #0x230]  // guest 0x18c932, sampled 0
6c514e6ef0:    	ldr	w22, [x19, #0x54]  // guest 0x18c932, sampled 0
6c514e6ef4:    	strh	w22, [x19, #0x222]  // guest 0x18c932, sampled 0
6c514e6ef8:    	mov	w22, #0xc932            // =51506  // guest 0x18c932, sampled 0
6c514e6efc:    	movk	w22, #0x18, lsl #16  // guest 0x18c932, sampled 0
6c514e6f00:    	str	w22, [x19, #0x228]  // guest 0x18c932, sampled 0
6c514e6f04:    	add	w22, w20, #0x1  // guest 0x18c935, sampled 0
6c514e6f08:    	and	w22, w22, #0x7  // guest 0x18c935, sampled 0
6c514e6f0c:    	lsl	w22, w22, #4  // guest 0x18c935, sampled 0
6c514e6f10:    	add	w22, w22, #0x1a0  // guest 0x18c935, sampled 0
6c514e6f14:    	sxtw	x22, w22  // guest 0x18c935, sampled 0
6c514e6f18:    	add	x1, x22, x19  // guest 0x18c935, sampled 0
6c514e6f1c:    	lsl	w22, w20, #4  // guest 0x18c935, sampled 0
6c514e6f20:    	add	w22, w22, #0x1a0  // guest 0x18c935, sampled 0
6c514e6f24:    	sxtw	x22, w22  // guest 0x18c935, sampled 0
6c514e6f28:    	add	x2, x22, x19  // guest 0x18c935, sampled 0
6c514e6f2c:    	mov	x0, x19  // guest 0x18c935, sampled 0
6c514e6f30:    	adrp	x16, 0x6c97752000 <trace+0x4626c000>  // guest 0x18c935, sampled 0
6c514e6f34:    	add	x16, x16, #0xb50  // guest 0x18c935, sampled 0
6c514e6f38:    	blr	x16  // guest 0x18c935, sampled 0
6c514e6f3c:    	sxtw	x22, w20  // guest 0x18c935, sampled 0
6c514e6f40:    	add	x22, x22, x19  // guest 0x18c935, sampled 0
6c514e6f44:    	mov	w23, #0x1               // =1  // guest 0x18c935, sampled 0
6c514e6f48:    	strb	w23, [x22, #0x190]  // guest 0x18c935, sampled 0
6c514e6f4c:    	add	w20, w20, w23  // guest 0x18c935, sampled 0
6c514e6f50:    	and	w20, w20, #0x7  // guest 0x18c935, sampled 0
6c514e6f54:    	str	w20, [x19, #0x188]  // guest 0x18c935, sampled 0
6c514e6f58:    	ldr	w22, [x19, #0x54]  // guest 0x18c935, sampled 0
6c514e6f5c:    	strh	w22, [x19, #0x222]  // guest 0x18c935, sampled 0
6c514e6f60:    	mov	w22, #0xc935            // =51509  // guest 0x18c935, sampled 0
6c514e6f64:    	movk	w22, #0x18, lsl #16  // guest 0x18c935, sampled 0
6c514e6f68:    	str	w22, [x19, #0x228]  // guest 0x18c935, sampled 0
6c514e6f6c:    	ldr	w22, [x19, #0x10]  // guest 0x18c937, sampled 0
6c514e6f70:    	add	w24, w22, #0x48  // guest 0x18c937, sampled 0
6c514e6f74:    	mov	w25, w24  // guest 0x18c937, sampled 0
6c514e6f78:    	lsl	w26, w20, #4  // guest 0x18c937, sampled 0
6c514e6f7c:    	add	w26, w26, #0x1a0  // guest 0x18c937, sampled 0
6c514e6f80:    	sxtw	x26, w26  // guest 0x18c937, sampled 0
6c514e6f84:    	add	x1, x26, x19  // guest 0x18c937, sampled 0
6c514e6f88:    	mov	x0, x19  // guest 0x18c937, sampled 0
6c514e6f8c:    	adrp	x16, 0x6c97751000 <trace+0x4626b000>  // guest 0x18c937, sampled 0
6c514e6f90:    	add	x16, x16, #0x4f0  // guest 0x18c937, sampled 0
6c514e6f94:    	blr	x16  // guest 0x18c937, sampled 0
6c514e6f98:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c937, sampled 0
6c514e6f9c:    	and	x16, x16, x24, lsr #7  // guest 0x18c937, sampled 0
6c514e6fa0:    	add	x17, x17, x16  // guest 0x18c937, sampled 0
6c514e6fa4:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18c937, sampled 0
6c514e6fa8:    	and	w30, w24, #0xfffff003  // guest 0x18c937, sampled 0
6c514e6fac:    	cmp	w16, w30  // guest 0x18c937, sampled 0
6c514e6fb0:    	b.ne	0x6c514e7aa4 <trace+0xfa4>  // guest 0x18c937, sampled 0
6c514e6fb4:    	add	x30, x17, w24, uxtw  // guest 0x18c937, sampled 0
6c514e6fb8:    	stlr	w0, [x30]  // guest 0x18c937, sampled 0
6c514e6fbc:    	sxtw	x24, w20  // guest 0x18c937, sampled 0
6c514e6fc0:    	add	x24, x24, x19  // guest 0x18c937, sampled 0
6c514e6fc4:    	strb	w23, [x24, #0x190]  // guest 0x18c937, sampled 0
6c514e6fc8:    	add	w20, w20, w23  // guest 0x18c937, sampled 0
6c514e6fcc:    	and	w20, w20, #0x7  // guest 0x18c937, sampled 0
6c514e6fd0:    	ldr	w24, [x19, #0x64]  // guest 0x18c937, sampled 0
6c514e6fd4:    	strh	w24, [x19, #0x224]  // guest 0x18c937, sampled 0
6c514e6fd8:    	str	w25, [x19, #0x230]  // guest 0x18c937, sampled 0
6c514e6fdc:    	ldr	w24, [x19, #0x54]  // guest 0x18c937, sampled 0
6c514e6fe0:    	strh	w24, [x19, #0x222]  // guest 0x18c937, sampled 0
6c514e6fe4:    	mov	w24, #0xc937            // =51511  // guest 0x18c937, sampled 0
6c514e6fe8:    	movk	w24, #0x18, lsl #16  // guest 0x18c937, sampled 0
6c514e6fec:    	str	w24, [x19, #0x228]  // guest 0x18c937, sampled 0
6c514e6ff0:    	sub	w20, w20, #0x1  // guest 0x18c93b, sampled 0
6c514e6ff4:    	and	w20, w20, #0x7  // guest 0x18c93b, sampled 0
6c514e6ff8:    	str	w20, [x19, #0x188]  // guest 0x18c93b, sampled 0
6c514e6ffc:    	sxtw	x24, w20  // guest 0x18c93b, sampled 0
6c514e7000:    	add	x24, x24, x19  // guest 0x18c93b, sampled 0
6c514e7004:    	strb	wzr, [x24, #0x190]  // guest 0x18c93b, sampled 0
6c514e7008:    	lsl	w24, w20, #4  // guest 0x18c93b, sampled 0
6c514e700c:    	add	w24, w24, #0x1a0  // guest 0x18c93b, sampled 0
6c514e7010:    	sxtw	x24, w24  // guest 0x18c93b, sampled 0
6c514e7014:    	add	x24, x24, x19  // guest 0x18c93b, sampled 0
6c514e7018:    	add	w25, w20, w23  // guest 0x18c93b, sampled 0
6c514e701c:    	and	w25, w25, #0x7  // guest 0x18c93b, sampled 0
6c514e7020:    	lsl	w25, w25, #4  // guest 0x18c93b, sampled 0
6c514e7024:    	add	w25, w25, #0x1a0  // guest 0x18c93b, sampled 0
6c514e7028:    	sxtw	x25, w25  // guest 0x18c93b, sampled 0
6c514e702c:    	add	x25, x25, x19  // guest 0x18c93b, sampled 0
6c514e7030:    	ldr	x26, [x25]  // guest 0x18c93b, sampled 0
6c514e7034:    	ldrh	w25, [x25, #0x8]  // guest 0x18c93b, sampled 0
6c514e7038:    	str	x26, [x24]  // guest 0x18c93b, sampled 0
6c514e703c:    	strh	w25, [x24, #0x8]  // guest 0x18c93b, sampled 0
6c514e7040:    	ldr	w24, [x19, #0x54]  // guest 0x18c93b, sampled 0
6c514e7044:    	strh	w24, [x19, #0x222]  // guest 0x18c93b, sampled 0
6c514e7048:    	mov	w24, #0xc93b            // =51515  // guest 0x18c93b, sampled 0
6c514e704c:    	movk	w24, #0x18, lsl #16  // guest 0x18c93b, sampled 0
6c514e7050:    	str	w24, [x19, #0x228]  // guest 0x18c93b, sampled 0
6c514e7054:    	sub	w24, w21, #0xc  // guest 0x18c93d, sampled 0
6c514e7058:    	mov	w25, w24  // guest 0x18c93d, sampled 0
6c514e705c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c93d, sampled 0
6c514e7060:    	and	x16, x16, x24, lsr #7  // guest 0x18c93d, sampled 0
6c514e7064:    	add	x17, x17, x16  // guest 0x18c93d, sampled 0
6c514e7068:    	ldp	x16, x17, [x17]  // guest 0x18c93d, sampled 0
6c514e706c:    	and	w30, w24, #0xfffff003  // guest 0x18c93d, sampled 0
6c514e7070:    	cmp	w16, w30  // guest 0x18c93d, sampled 0
6c514e7074:    	b.ne	0x6c514e7ad0 <trace+0xfd0>  // guest 0x18c93d, sampled 0
6c514e7078:    	add	x30, x17, w24, uxtw  // guest 0x18c93d, sampled 1
6c514e707c:    	ldapr	w2, [x30]  // guest 0x18c93d, sampled 0
6c514e7080:    	add	x1, x19, #0x258  // guest 0x18c93d, sampled 0
6c514e7084:    	mov	x0, x19  // guest 0x18c93d, sampled 0
6c514e7088:    	adrp	x16, 0x6c97751000 <trace+0x4626a000>  // guest 0x18c93d, sampled 0
6c514e708c:    	add	x16, x16, #0x3b4  // guest 0x18c93d, sampled 0
6c514e7090:    	blr	x16  // guest 0x18c93d, sampled 0
6c514e7094:    	lsl	w24, w20, #4  // guest 0x18c93d, sampled 0
6c514e7098:    	add	w24, w24, #0x1a0  // guest 0x18c93d, sampled 0
6c514e709c:    	sxtw	x24, w24  // guest 0x18c93d, sampled 0
6c514e70a0:    	add	x1, x24, x19  // guest 0x18c93d, sampled 0
6c514e70a4:    	add	x2, x19, #0x258  // guest 0x18c93d, sampled 0
6c514e70a8:    	mov	x0, x19  // guest 0x18c93d, sampled 0
6c514e70ac:    	adrp	x16, 0x6c97752000 <trace+0x4626b000>  // guest 0x18c93d, sampled 0
6c514e70b0:    	add	x16, x16, #0xa7c  // guest 0x18c93d, sampled 0
6c514e70b4:    	blr	x16  // guest 0x18c93d, sampled 0
6c514e70b8:    	ldr	w24, [x19, #0x74]  // guest 0x18c93d, sampled 0
6c514e70bc:    	strh	w24, [x19, #0x224]  // guest 0x18c93d, sampled 0
6c514e70c0:    	str	w25, [x19, #0x230]  // guest 0x18c93d, sampled 0
6c514e70c4:    	ldr	w24, [x19, #0x54]  // guest 0x18c93d, sampled 0
6c514e70c8:    	strh	w24, [x19, #0x222]  // guest 0x18c93d, sampled 0
6c514e70cc:    	mov	w24, #0xc93d            // =51517  // guest 0x18c93d, sampled 0
6c514e70d0:    	movk	w24, #0x18, lsl #16  // guest 0x18c93d, sampled 0
6c514e70d4:    	str	w24, [x19, #0x228]  // guest 0x18c93d, sampled 0
6c514e70d8:    	sub	w20, w20, #0x1  // guest 0x18c940, sampled 0
6c514e70dc:    	and	w20, w20, #0x7  // guest 0x18c940, sampled 0
6c514e70e0:    	str	w20, [x19, #0x188]  // guest 0x18c940, sampled 0
6c514e70e4:    	sxtw	x24, w20  // guest 0x18c940, sampled 0
6c514e70e8:    	add	x24, x24, x19  // guest 0x18c940, sampled 0
6c514e70ec:    	strb	wzr, [x24, #0x190]  // guest 0x18c940, sampled 0
6c514e70f0:    	lsl	w24, w20, #4  // guest 0x18c940, sampled 0
6c514e70f4:    	add	w24, w24, #0x1a0  // guest 0x18c940, sampled 0
6c514e70f8:    	sxtw	x24, w24  // guest 0x18c940, sampled 0
6c514e70fc:    	add	x24, x24, x19  // guest 0x18c940, sampled 0
6c514e7100:    	add	w25, w20, #0x3  // guest 0x18c940, sampled 0
6c514e7104:    	and	w25, w25, #0x7  // guest 0x18c940, sampled 0
6c514e7108:    	lsl	w25, w25, #4  // guest 0x18c940, sampled 0
6c514e710c:    	add	w25, w25, #0x1a0  // guest 0x18c940, sampled 0
6c514e7110:    	sxtw	x25, w25  // guest 0x18c940, sampled 0
6c514e7114:    	add	x25, x25, x19  // guest 0x18c940, sampled 0
6c514e7118:    	ldr	x26, [x25]  // guest 0x18c940, sampled 0
6c514e711c:    	ldrh	w25, [x25, #0x8]  // guest 0x18c940, sampled 2
6c514e7120:    	str	x26, [x24]  // guest 0x18c940, sampled 0
6c514e7124:    	strh	w25, [x24, #0x8]  // guest 0x18c940, sampled 0
6c514e7128:    	ldr	w24, [x19, #0x54]  // guest 0x18c940, sampled 0
6c514e712c:    	strh	w24, [x19, #0x222]  // guest 0x18c940, sampled 0
6c514e7130:    	mov	w24, #0xc940            // =51520  // guest 0x18c940, sampled 0
6c514e7134:    	movk	w24, #0x18, lsl #16  // guest 0x18c940, sampled 0
6c514e7138:    	str	w24, [x19, #0x228]  // guest 0x18c940, sampled 0
6c514e713c:    	sub	w21, w21, #0x8  // guest 0x18c942, sampled 0
6c514e7140:    	mov	w24, w21  // guest 0x18c942, sampled 0
6c514e7144:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c942, sampled 0
6c514e7148:    	and	x16, x16, x21, lsr #7  // guest 0x18c942, sampled 0
6c514e714c:    	add	x17, x17, x16  // guest 0x18c942, sampled 0
6c514e7150:    	ldp	x16, x17, [x17]  // guest 0x18c942, sampled 0
6c514e7154:    	and	w30, w21, #0xfffff003  // guest 0x18c942, sampled 0
6c514e7158:    	cmp	w16, w30  // guest 0x18c942, sampled 0
6c514e715c:    	b.ne	0x6c514e7afc <trace+0xffc>  // guest 0x18c942, sampled 0
6c514e7160:    	add	x30, x17, w21, uxtw  // guest 0x18c942, sampled 0
6c514e7164:    	ldapr	w2, [x30]  // guest 0x18c942, sampled 0
6c514e7168:    	add	x1, x19, #0x258  // guest 0x18c942, sampled 0
6c514e716c:    	mov	x0, x19  // guest 0x18c942, sampled 0
6c514e7170:    	adrp	x16, 0x6c97751000 <trace+0x4626a000>  // guest 0x18c942, sampled 0
6c514e7174:    	add	x16, x16, #0x3b4  // guest 0x18c942, sampled 0
6c514e7178:    	blr	x16  // guest 0x18c942, sampled 0
6c514e717c:    	lsl	w21, w20, #4  // guest 0x18c942, sampled 0
6c514e7180:    	add	w21, w21, #0x1a0  // guest 0x18c942, sampled 0
6c514e7184:    	sxtw	x21, w21  // guest 0x18c942, sampled 0
6c514e7188:    	add	x1, x21, x19  // guest 0x18c942, sampled 0
6c514e718c:    	add	x2, x19, #0x258  // guest 0x18c942, sampled 0
6c514e7190:    	mov	x0, x19  // guest 0x18c942, sampled 0
6c514e7194:    	adrp	x16, 0x6c97752000 <trace+0x4626b000>  // guest 0x18c942, sampled 0
6c514e7198:    	add	x16, x16, #0xa7c  // guest 0x18c942, sampled 0
6c514e719c:    	blr	x16  // guest 0x18c942, sampled 0
6c514e71a0:    	ldr	w21, [x19, #0x74]  // guest 0x18c942, sampled 0
6c514e71a4:    	strh	w21, [x19, #0x224]  // guest 0x18c942, sampled 0
6c514e71a8:    	str	w24, [x19, #0x230]  // guest 0x18c942, sampled 0
6c514e71ac:    	ldr	w21, [x19, #0x54]  // guest 0x18c942, sampled 0
6c514e71b0:    	strh	w21, [x19, #0x222]  // guest 0x18c942, sampled 0
6c514e71b4:    	mov	w21, #0xc942            // =51522  // guest 0x18c942, sampled 0
6c514e71b8:    	movk	w21, #0x18, lsl #16  // guest 0x18c942, sampled 0
6c514e71bc:    	str	w21, [x19, #0x228]  // guest 0x18c942, sampled 0
6c514e71c0:    	add	w21, w20, w23  // guest 0x18c945, sampled 0
6c514e71c4:    	and	w21, w21, #0x7  // guest 0x18c945, sampled 0
6c514e71c8:    	lsl	w21, w21, #4  // guest 0x18c945, sampled 0
6c514e71cc:    	add	w21, w21, #0x1a0  // guest 0x18c945, sampled 0
6c514e71d0:    	sxtw	x21, w21  // guest 0x18c945, sampled 0
6c514e71d4:    	add	x1, x21, x19  // guest 0x18c945, sampled 0
6c514e71d8:    	lsl	w21, w20, #4  // guest 0x18c945, sampled 0
6c514e71dc:    	add	w21, w21, #0x1a0  // guest 0x18c945, sampled 0
6c514e71e0:    	sxtw	x21, w21  // guest 0x18c945, sampled 0
6c514e71e4:    	add	x2, x21, x19  // guest 0x18c945, sampled 0
6c514e71e8:    	mov	x0, x19  // guest 0x18c945, sampled 0
6c514e71ec:    	adrp	x16, 0x6c97752000 <trace+0x4626b000>  // guest 0x18c945, sampled 0
6c514e71f0:    	add	x16, x16, #0x9a8  // guest 0x18c945, sampled 0
6c514e71f4:    	blr	x16  // guest 0x18c945, sampled 0
6c514e71f8:    	sxtw	x21, w20  // guest 0x18c945, sampled 0
6c514e71fc:    	add	x21, x21, x19  // guest 0x18c945, sampled 0
6c514e7200:    	strb	w23, [x21, #0x190]  // guest 0x18c945, sampled 0
6c514e7204:    	add	w20, w20, w23  // guest 0x18c945, sampled 0
6c514e7208:    	and	w20, w20, #0x7  // guest 0x18c945, sampled 0
6c514e720c:    	str	w20, [x19, #0x188]  // guest 0x18c945, sampled 0
6c514e7210:    	ldr	w21, [x19, #0x54]  // guest 0x18c945, sampled 0
6c514e7214:    	strh	w21, [x19, #0x222]  // guest 0x18c945, sampled 0
6c514e7218:    	mov	w21, #0xc945            // =51525  // guest 0x18c945, sampled 0
6c514e721c:    	movk	w21, #0x18, lsl #16  // guest 0x18c945, sampled 0
6c514e7220:    	str	w21, [x19, #0x228]  // guest 0x18c945, sampled 0
6c514e7224:    	add	w21, w22, #0x4c  // guest 0x18c947, sampled 0
6c514e7228:    	mov	w24, w21  // guest 0x18c947, sampled 0
6c514e722c:    	lsl	w25, w20, #4  // guest 0x18c947, sampled 0
6c514e7230:    	add	w25, w25, #0x1a0  // guest 0x18c947, sampled 0
6c514e7234:    	sxtw	x25, w25  // guest 0x18c947, sampled 0
6c514e7238:    	add	x1, x25, x19  // guest 0x18c947, sampled 0
6c514e723c:    	mov	x0, x19  // guest 0x18c947, sampled 0
6c514e7240:    	adrp	x16, 0x6c97751000 <trace+0x4626a000>  // guest 0x18c947, sampled 0
6c514e7244:    	add	x16, x16, #0x4f0  // guest 0x18c947, sampled 0
6c514e7248:    	blr	x16  // guest 0x18c947, sampled 0
6c514e724c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c947, sampled 0
6c514e7250:    	and	x16, x16, x21, lsr #7  // guest 0x18c947, sampled 0
6c514e7254:    	add	x17, x17, x16  // guest 0x18c947, sampled 0
6c514e7258:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18c947, sampled 0
6c514e725c:    	and	w30, w21, #0xfffff003  // guest 0x18c947, sampled 0
6c514e7260:    	cmp	w16, w30  // guest 0x18c947, sampled 0
6c514e7264:    	b.ne	0x6c514e7b28 <trace+0x1028>  // guest 0x18c947, sampled 0
6c514e7268:    	add	x30, x17, w21, uxtw  // guest 0x18c947, sampled 0
6c514e726c:    	stlr	w0, [x30]  // guest 0x18c947, sampled 0
6c514e7270:    	sxtw	x21, w20  // guest 0x18c947, sampled 0
6c514e7274:    	add	x21, x21, x19  // guest 0x18c947, sampled 0
6c514e7278:    	strb	w23, [x21, #0x190]  // guest 0x18c947, sampled 0
6c514e727c:    	add	w20, w20, w23  // guest 0x18c947, sampled 0
6c514e7280:    	and	w20, w20, #0x7  // guest 0x18c947, sampled 0
6c514e7284:    	ldr	w21, [x19, #0x64]  // guest 0x18c947, sampled 0
6c514e7288:    	strh	w21, [x19, #0x224]  // guest 0x18c947, sampled 0
6c514e728c:    	str	w24, [x19, #0x230]  // guest 0x18c947, sampled 0
6c514e7290:    	ldr	w21, [x19, #0x54]  // guest 0x18c947, sampled 0
6c514e7294:    	strh	w21, [x19, #0x222]  // guest 0x18c947, sampled 0
6c514e7298:    	mov	w21, #0xc947            // =51527  // guest 0x18c947, sampled 0
6c514e729c:    	movk	w21, #0x18, lsl #16  // guest 0x18c947, sampled 0
6c514e72a0:    	str	w21, [x19, #0x228]  // guest 0x18c947, sampled 0
6c514e72a4:    	sub	w20, w20, #0x1  // guest 0x18c94b, sampled 0
6c514e72a8:    	and	w20, w20, #0x7  // guest 0x18c94b, sampled 0
6c514e72ac:    	str	w20, [x19, #0x188]  // guest 0x18c94b, sampled 0
6c514e72b0:    	sxtw	x21, w20  // guest 0x18c94b, sampled 0
6c514e72b4:    	add	x21, x21, x19  // guest 0x18c94b, sampled 0
6c514e72b8:    	strb	wzr, [x21, #0x190]  // guest 0x18c94b, sampled 0
6c514e72bc:    	lsl	w21, w20, #4  // guest 0x18c94b, sampled 0
6c514e72c0:    	add	w21, w21, #0x1a0  // guest 0x18c94b, sampled 0
6c514e72c4:    	sxtw	x21, w21  // guest 0x18c94b, sampled 0
6c514e72c8:    	add	x21, x21, x19  // guest 0x18c94b, sampled 0
6c514e72cc:    	add	w24, w20, #0x2  // guest 0x18c94b, sampled 0
6c514e72d0:    	and	w24, w24, #0x7  // guest 0x18c94b, sampled 0
6c514e72d4:    	lsl	w24, w24, #4  // guest 0x18c94b, sampled 0
6c514e72d8:    	add	w24, w24, #0x1a0  // guest 0x18c94b, sampled 0
6c514e72dc:    	sxtw	x24, w24  // guest 0x18c94b, sampled 0
6c514e72e0:    	add	x24, x24, x19  // guest 0x18c94b, sampled 0
6c514e72e4:    	ldr	x25, [x24]  // guest 0x18c94b, sampled 0
6c514e72e8:    	ldrh	w24, [x24, #0x8]  // guest 0x18c94b, sampled 0
6c514e72ec:    	str	x25, [x21]  // guest 0x18c94b, sampled 0
6c514e72f0:    	strh	w24, [x21, #0x8]  // guest 0x18c94b, sampled 0
6c514e72f4:    	ldr	w21, [x19, #0x54]  // guest 0x18c94b, sampled 0
6c514e72f8:    	strh	w21, [x19, #0x222]  // guest 0x18c94b, sampled 0
6c514e72fc:    	mov	w21, #0xc94b            // =51531  // guest 0x18c94b, sampled 0
6c514e7300:    	movk	w21, #0x18, lsl #16  // guest 0x18c94b, sampled 0
6c514e7304:    	str	w21, [x19, #0x228]  // guest 0x18c94b, sampled 0
6c514e7308:    	ldr	w21, [x19, #0x4]  // guest 0x18c94d, sampled 1
6c514e730c:    	add	w24, w21, #0x8  // guest 0x18c94d, sampled 1
6c514e7310:    	mov	w25, w24  // guest 0x18c94d, sampled 0
6c514e7314:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c94d, sampled 0
6c514e7318:    	and	x16, x16, x24, lsr #7  // guest 0x18c94d, sampled 0
6c514e731c:    	add	x17, x17, x16  // guest 0x18c94d, sampled 0
6c514e7320:    	ldp	x16, x17, [x17]  // guest 0x18c94d, sampled 0
6c514e7324:    	and	w30, w24, #0xfffff003  // guest 0x18c94d, sampled 3
6c514e7328:    	cmp	w16, w30  // guest 0x18c94d, sampled 0
6c514e732c:    	b.ne	0x6c514e7b54 <trace+0x1054>  // guest 0x18c94d, sampled 0
6c514e7330:    	add	x30, x17, w24, uxtw  // guest 0x18c94d, sampled 0
6c514e7334:    	ldapr	w2, [x30]  // guest 0x18c94d, sampled 0
6c514e7338:    	add	x1, x19, #0x258  // guest 0x18c94d, sampled 0
6c514e733c:    	mov	x0, x19  // guest 0x18c94d, sampled 0
6c514e7340:    	adrp	x16, 0x6c97751000 <trace+0x4626a000>  // guest 0x18c94d, sampled 0
6c514e7344:    	add	x16, x16, #0x3b4  // guest 0x18c94d, sampled 0
6c514e7348:    	blr	x16  // guest 0x18c94d, sampled 0
6c514e734c:    	lsl	w24, w20, #4  // guest 0x18c94d, sampled 0
6c514e7350:    	add	w24, w24, #0x1a0  // guest 0x18c94d, sampled 0
6c514e7354:    	sxtw	x24, w24  // guest 0x18c94d, sampled 0
6c514e7358:    	add	x1, x24, x19  // guest 0x18c94d, sampled 0
6c514e735c:    	add	x2, x19, #0x258  // guest 0x18c94d, sampled 0
6c514e7360:    	mov	x0, x19  // guest 0x18c94d, sampled 0
6c514e7364:    	adrp	x16, 0x6c97752000 <trace+0x4626b000>  // guest 0x18c94d, sampled 0
6c514e7368:    	add	x16, x16, #0xa7c  // guest 0x18c94d, sampled 0
6c514e736c:    	blr	x16  // guest 0x18c94d, sampled 0
6c514e7370:    	ldr	w24, [x19, #0x74]  // guest 0x18c94d, sampled 0
6c514e7374:    	strh	w24, [x19, #0x224]  // guest 0x18c94d, sampled 0
6c514e7378:    	str	w25, [x19, #0x230]  // guest 0x18c94d, sampled 0
6c514e737c:    	ldr	w24, [x19, #0x54]  // guest 0x18c94d, sampled 0
6c514e7380:    	strh	w24, [x19, #0x222]  // guest 0x18c94d, sampled 0
6c514e7384:    	mov	w24, #0xc94d            // =51533  // guest 0x18c94d, sampled 0
6c514e7388:    	movk	w24, #0x18, lsl #16  // guest 0x18c94d, sampled 0
6c514e738c:    	str	w24, [x19, #0x228]  // guest 0x18c94d, sampled 0
6c514e7390:    	sub	w20, w20, #0x1  // guest 0x18c950, sampled 0
6c514e7394:    	and	w20, w20, #0x7  // guest 0x18c950, sampled 0
6c514e7398:    	str	w20, [x19, #0x188]  // guest 0x18c950, sampled 0
6c514e739c:    	sxtw	x24, w20  // guest 0x18c950, sampled 0
6c514e73a0:    	add	x24, x24, x19  // guest 0x18c950, sampled 0
6c514e73a4:    	strb	wzr, [x24, #0x190]  // guest 0x18c950, sampled 0
6c514e73a8:    	lsl	w24, w20, #4  // guest 0x18c950, sampled 0
6c514e73ac:    	add	w24, w24, #0x1a0  // guest 0x18c950, sampled 0
6c514e73b0:    	sxtw	x24, w24  // guest 0x18c950, sampled 0
6c514e73b4:    	add	x24, x24, x19  // guest 0x18c950, sampled 0
6c514e73b8:    	add	w25, w20, #0x2  // guest 0x18c950, sampled 0
6c514e73bc:    	and	w25, w25, #0x7  // guest 0x18c950, sampled 0
6c514e73c0:    	lsl	w25, w25, #4  // guest 0x18c950, sampled 0
6c514e73c4:    	add	w25, w25, #0x1a0  // guest 0x18c950, sampled 0
6c514e73c8:    	sxtw	x25, w25  // guest 0x18c950, sampled 0
6c514e73cc:    	add	x25, x25, x19  // guest 0x18c950, sampled 0
6c514e73d0:    	ldr	x26, [x25]  // guest 0x18c950, sampled 0
6c514e73d4:    	ldrh	w25, [x25, #0x8]  // guest 0x18c950, sampled 0
6c514e73d8:    	str	x26, [x24]  // guest 0x18c950, sampled 0
6c514e73dc:    	strh	w25, [x24, #0x8]  // guest 0x18c950, sampled 0
6c514e73e0:    	ldr	w24, [x19, #0x54]  // guest 0x18c950, sampled 0
6c514e73e4:    	strh	w24, [x19, #0x222]  // guest 0x18c950, sampled 0
6c514e73e8:    	mov	w24, #0xc950            // =51536  // guest 0x18c950, sampled 0
6c514e73ec:    	movk	w24, #0x18, lsl #16  // guest 0x18c950, sampled 0
6c514e73f0:    	str	w24, [x19, #0x228]  // guest 0x18c950, sampled 0
6c514e73f4:    	add	w24, w21, #0xc  // guest 0x18c952, sampled 0
6c514e73f8:    	mov	w25, w24  // guest 0x18c952, sampled 0
6c514e73fc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c952, sampled 0
6c514e7400:    	and	x16, x16, x24, lsr #7  // guest 0x18c952, sampled 0
6c514e7404:    	add	x17, x17, x16  // guest 0x18c952, sampled 0
6c514e7408:    	ldp	x16, x17, [x17]  // guest 0x18c952, sampled 0
6c514e740c:    	and	w30, w24, #0xfffff003  // guest 0x18c952, sampled 0
6c514e7410:    	cmp	w16, w30  // guest 0x18c952, sampled 0
6c514e7414:    	b.ne	0x6c514e7b80 <trace+0x1080>  // guest 0x18c952, sampled 0
6c514e7418:    	add	x30, x17, w24, uxtw  // guest 0x18c952, sampled 0
6c514e741c:    	ldapr	w2, [x30]  // guest 0x18c952, sampled 0
6c514e7420:    	add	x1, x19, #0x258  // guest 0x18c952, sampled 0
6c514e7424:    	mov	x0, x19  // guest 0x18c952, sampled 0
6c514e7428:    	adrp	x16, 0x6c97751000 <trace+0x4626a000>  // guest 0x18c952, sampled 0
6c514e742c:    	add	x16, x16, #0x3b4  // guest 0x18c952, sampled 0
6c514e7430:    	blr	x16  // guest 0x18c952, sampled 0
6c514e7434:    	lsl	w24, w20, #4  // guest 0x18c952, sampled 0
6c514e7438:    	add	w24, w24, #0x1a0  // guest 0x18c952, sampled 0
6c514e743c:    	sxtw	x24, w24  // guest 0x18c952, sampled 0
6c514e7440:    	add	x1, x24, x19  // guest 0x18c952, sampled 0
6c514e7444:    	add	x2, x19, #0x258  // guest 0x18c952, sampled 0
6c514e7448:    	mov	x0, x19  // guest 0x18c952, sampled 0
6c514e744c:    	adrp	x16, 0x6c97752000 <trace+0x4626b000>  // guest 0x18c952, sampled 0
6c514e7450:    	add	x16, x16, #0xa7c  // guest 0x18c952, sampled 0
6c514e7454:    	blr	x16  // guest 0x18c952, sampled 0
6c514e7458:    	ldr	w24, [x19, #0x74]  // guest 0x18c952, sampled 0
6c514e745c:    	strh	w24, [x19, #0x224]  // guest 0x18c952, sampled 0
6c514e7460:    	str	w25, [x19, #0x230]  // guest 0x18c952, sampled 0
6c514e7464:    	ldr	w24, [x19, #0x54]  // guest 0x18c952, sampled 0
6c514e7468:    	strh	w24, [x19, #0x222]  // guest 0x18c952, sampled 0
6c514e746c:    	mov	w24, #0xc952            // =51538  // guest 0x18c952, sampled 0
6c514e7470:    	movk	w24, #0x18, lsl #16  // guest 0x18c952, sampled 0
6c514e7474:    	str	w24, [x19, #0x228]  // guest 0x18c952, sampled 0
6c514e7478:    	add	w24, w20, w23  // guest 0x18c955, sampled 0
6c514e747c:    	and	w24, w24, #0x7  // guest 0x18c955, sampled 0
6c514e7480:    	lsl	w24, w24, #4  // guest 0x18c955, sampled 0
6c514e7484:    	add	w24, w24, #0x1a0  // guest 0x18c955, sampled 0
6c514e7488:    	sxtw	x24, w24  // guest 0x18c955, sampled 0
6c514e748c:    	add	x1, x24, x19  // guest 0x18c955, sampled 0
6c514e7490:    	lsl	w24, w20, #4  // guest 0x18c955, sampled 0
6c514e7494:    	add	w24, w24, #0x1a0  // guest 0x18c955, sampled 0
6c514e7498:    	sxtw	x24, w24  // guest 0x18c955, sampled 0
6c514e749c:    	add	x2, x24, x19  // guest 0x18c955, sampled 0
6c514e74a0:    	mov	x0, x19  // guest 0x18c955, sampled 0
6c514e74a4:    	adrp	x16, 0x6c97752000 <trace+0x4626b000>  // guest 0x18c955, sampled 0
6c514e74a8:    	add	x16, x16, #0xb50  // guest 0x18c955, sampled 0
6c514e74ac:    	blr	x16  // guest 0x18c955, sampled 0
6c514e74b0:    	sxtw	x24, w20  // guest 0x18c955, sampled 0
6c514e74b4:    	add	x24, x24, x19  // guest 0x18c955, sampled 0
6c514e74b8:    	strb	w23, [x24, #0x190]  // guest 0x18c955, sampled 0
6c514e74bc:    	add	w20, w20, w23  // guest 0x18c955, sampled 0
6c514e74c0:    	and	w20, w20, #0x7  // guest 0x18c955, sampled 0
6c514e74c4:    	str	w20, [x19, #0x188]  // guest 0x18c955, sampled 0
6c514e74c8:    	ldr	w24, [x19, #0x54]  // guest 0x18c955, sampled 0
6c514e74cc:    	strh	w24, [x19, #0x222]  // guest 0x18c955, sampled 0
6c514e74d0:    	mov	w24, #0xc955            // =51541  // guest 0x18c955, sampled 0
6c514e74d4:    	movk	w24, #0x18, lsl #16  // guest 0x18c955, sampled 0
6c514e74d8:    	str	w24, [x19, #0x228]  // guest 0x18c955, sampled 0
6c514e74dc:    	add	w22, w22, #0x3c  // guest 0x18c957, sampled 0
6c514e74e0:    	mov	w24, w22  // guest 0x18c957, sampled 0
6c514e74e4:    	lsl	w25, w20, #4  // guest 0x18c957, sampled 0
6c514e74e8:    	add	w25, w25, #0x1a0  // guest 0x18c957, sampled 0
6c514e74ec:    	sxtw	x25, w25  // guest 0x18c957, sampled 0
6c514e74f0:    	add	x1, x25, x19  // guest 0x18c957, sampled 0
6c514e74f4:    	mov	x0, x19  // guest 0x18c957, sampled 0
6c514e74f8:    	adrp	x16, 0x6c97751000 <trace+0x4626a000>  // guest 0x18c957, sampled 0
6c514e74fc:    	add	x16, x16, #0x4f0  // guest 0x18c957, sampled 0
6c514e7500:    	blr	x16  // guest 0x18c957, sampled 0
6c514e7504:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c957, sampled 0
6c514e7508:    	and	x16, x16, x22, lsr #7  // guest 0x18c957, sampled 0
6c514e750c:    	add	x17, x17, x16  // guest 0x18c957, sampled 0
6c514e7510:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18c957, sampled 0
6c514e7514:    	and	w30, w22, #0xfffff003  // guest 0x18c957, sampled 0
6c514e7518:    	cmp	w16, w30  // guest 0x18c957, sampled 0
6c514e751c:    	b.ne	0x6c514e7bac <trace+0x10ac>  // guest 0x18c957, sampled 0
6c514e7520:    	add	x30, x17, w22, uxtw  // guest 0x18c957, sampled 0
6c514e7524:    	stlr	w0, [x30]  // guest 0x18c957, sampled 0
6c514e7528:    	sxtw	x22, w20  // guest 0x18c957, sampled 0
6c514e752c:    	add	x22, x22, x19  // guest 0x18c957, sampled 0
6c514e7530:    	strb	w23, [x22, #0x190]  // guest 0x18c957, sampled 0
6c514e7534:    	add	w20, w20, w23  // guest 0x18c957, sampled 0
6c514e7538:    	and	w20, w20, #0x7  // guest 0x18c957, sampled 0
6c514e753c:    	str	w20, [x19, #0x188]  // guest 0x18c957, sampled 0
6c514e7540:    	ldr	w22, [x19, #0x64]  // guest 0x18c957, sampled 0
6c514e7544:    	strh	w22, [x19, #0x224]  // guest 0x18c957, sampled 0
6c514e7548:    	str	w24, [x19, #0x230]  // guest 0x18c957, sampled 0
6c514e754c:    	ldr	w22, [x19, #0x54]  // guest 0x18c957, sampled 0
6c514e7550:    	strh	w22, [x19, #0x222]  // guest 0x18c957, sampled 0
6c514e7554:    	mov	w22, #0xc957            // =51543  // guest 0x18c957, sampled 0
6c514e7558:    	movk	w22, #0x18, lsl #16  // guest 0x18c957, sampled 0
6c514e755c:    	str	w22, [x19, #0x228]  // guest 0x18c957, sampled 0
6c514e7560:    	add	w21, w21, #0x8  // guest 0x18c95b, sampled 0
6c514e7564:    	mov	w22, w21  // guest 0x18c95b, sampled 0
6c514e7568:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c95b, sampled 0
6c514e756c:    	and	x16, x16, x21, lsr #7  // guest 0x18c95b, sampled 0
6c514e7570:    	add	x17, x17, x16  // guest 0x18c95b, sampled 0
6c514e7574:    	ldp	x16, x17, [x17]  // guest 0x18c95b, sampled 0
6c514e7578:    	and	w30, w21, #0xfffff003  // guest 0x18c95b, sampled 1
6c514e757c:    	cmp	w16, w30  // guest 0x18c95b, sampled 0
6c514e7580:    	b.ne	0x6c514e7bd8 <trace+0x10d8>  // guest 0x18c95b, sampled 0
6c514e7584:    	add	x30, x17, w21, uxtw  // guest 0x18c95b, sampled 0
6c514e7588:    	ldapr	w2, [x30]  // guest 0x18c95b, sampled 0
6c514e758c:    	add	x1, x19, #0x258  // guest 0x18c95b, sampled 0
6c514e7590:    	mov	x0, x19  // guest 0x18c95b, sampled 0
6c514e7594:    	adrp	x16, 0x6c97751000 <trace+0x4626a000>  // guest 0x18c95b, sampled 0
6c514e7598:    	add	x16, x16, #0x3b4  // guest 0x18c95b, sampled 0
6c514e759c:    	blr	x16  // guest 0x18c95b, sampled 0
6c514e75a0:    	lsl	w20, w20, #4  // guest 0x18c95b, sampled 0
6c514e75a4:    	add	w20, w20, #0x1a0  // guest 0x18c95b, sampled 0
6c514e75a8:    	sxtw	x20, w20  // guest 0x18c95b, sampled 0
6c514e75ac:    	add	x1, x20, x19  // guest 0x18c95b, sampled 0
6c514e75b0:    	add	x2, x19, #0x258  // guest 0x18c95b, sampled 0
6c514e75b4:    	mov	x0, x19  // guest 0x18c95b, sampled 0
6c514e75b8:    	adrp	x16, 0x6c97752000 <trace+0x4626b000>  // guest 0x18c95b, sampled 0
6c514e75bc:    	add	x16, x16, #0xa7c  // guest 0x18c95b, sampled 0
6c514e75c0:    	blr	x16  // guest 0x18c95b, sampled 0
6c514e75c4:    	ldr	w20, [x19, #0x74]  // guest 0x18c95b, sampled 0
6c514e75c8:    	strh	w20, [x19, #0x224]  // guest 0x18c95b, sampled 1
6c514e75cc:    	str	w22, [x19, #0x230]  // guest 0x18c95b, sampled 0
6c514e75d0:    	ldr	w20, [x19, #0x54]  // guest 0x18c95b, sampled 0
6c514e75d4:    	strh	w20, [x19, #0x222]  // guest 0x18c95b, sampled 0
6c514e75d8:    	mov	w20, #0xc95b            // =51547  // guest 0x18c95b, sampled 0
6c514e75dc:    	movk	w20, #0x18, lsl #16  // guest 0x18c95b, sampled 0
6c514e75e0:    	str	w20, [x19, #0x228]  // guest 0x18c95b, sampled 0
6c514e75e4:    	mov	x0, x19  // guest 0x18c95e, sampled 0
6c514e75e8:    	adrp	x16, 0x6c97753000 <trace+0x4626c000>  // guest 0x18c95e, sampled 0
6c514e75ec:    	add	x16, x16, #0xabc  // guest 0x18c95e, sampled 0
6c514e75f0:    	blr	x16  // guest 0x18c95e, sampled 0
6c514e75f4:    	ldr	w20, [x19, #0x54]  // guest 0x18c95e, sampled 0
6c514e75f8:    	strh	w20, [x19, #0x222]  // guest 0x18c95e, sampled 0
6c514e75fc:    	mov	w20, #0xc95e            // =51550  // guest 0x18c95e, sampled 0
6c514e7600:    	movk	w20, #0x18, lsl #16  // guest 0x18c95e, sampled 0
6c514e7604:    	str	w20, [x19, #0x228]  // guest 0x18c95e, sampled 0
6c514e7608:    	mov	w1, w23  // guest 0x18c960, sampled 0
6c514e760c:    	mov	x0, x19  // guest 0x18c960, sampled 0
6c514e7610:    	adrp	x16, 0x6c97752000 <trace+0x4626b000>  // guest 0x18c960, sampled 0
6c514e7614:    	add	x16, x16, #0x4d0  // guest 0x18c960, sampled 0
6c514e7618:    	blr	x16  // guest 0x18c960, sampled 0
6c514e761c:    	ldr	w20, [x19, #0x54]  // guest 0x18c960, sampled 0
6c514e7620:    	strh	w20, [x19, #0x222]  // guest 0x18c960, sampled 0
6c514e7624:    	mov	w20, #0xc960            // =51552  // guest 0x18c960, sampled 0
6c514e7628:    	movk	w20, #0x18, lsl #16  // guest 0x18c960, sampled 0
6c514e762c:    	str	w20, [x19, #0x228]  // guest 0x18c960, sampled 0
6c514e7630:    	ldr	w20, [x19, #0x4]  // guest 0x18c962, sampled 0
6c514e7634:    	add	w20, w20, #0xc  // guest 0x18c962, sampled 0
6c514e7638:    	mov	w21, w20  // guest 0x18c962, sampled 0
6c514e763c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c962, sampled 0
6c514e7640:    	and	x16, x16, x20, lsr #7  // guest 0x18c962, sampled 0
6c514e7644:    	add	x17, x17, x16  // guest 0x18c962, sampled 0
6c514e7648:    	ldp	x16, x17, [x17]  // guest 0x18c962, sampled 0
6c514e764c:    	and	w30, w20, #0xfffff003  // guest 0x18c962, sampled 0
6c514e7650:    	cmp	w16, w30  // guest 0x18c962, sampled 0
6c514e7654:    	b.ne	0x6c514e7c04 <trace+0x1104>  // guest 0x18c962, sampled 0
6c514e7658:    	add	x30, x17, w20, uxtw  // guest 0x18c962, sampled 1
6c514e765c:    	ldapr	w2, [x30]  // guest 0x18c962, sampled 0
6c514e7660:    	add	x1, x19, #0x258  // guest 0x18c962, sampled 0
6c514e7664:    	mov	x0, x19  // guest 0x18c962, sampled 0
6c514e7668:    	adrp	x16, 0x6c97751000 <trace+0x4626a000>  // guest 0x18c962, sampled 0
6c514e766c:    	add	x16, x16, #0x3b4  // guest 0x18c962, sampled 0
6c514e7670:    	blr	x16  // guest 0x18c962, sampled 0
6c514e7674:    	ldr	w20, [x19, #0x188]  // guest 0x18c962, sampled 0
6c514e7678:    	lsl	w22, w20, #4  // guest 0x18c962, sampled 0
6c514e767c:    	add	w22, w22, #0x1a0  // guest 0x18c962, sampled 0
6c514e7680:    	sxtw	x22, w22  // guest 0x18c962, sampled 0
6c514e7684:    	add	x1, x22, x19  // guest 0x18c962, sampled 0
6c514e7688:    	add	x2, x19, #0x258  // guest 0x18c962, sampled 0
6c514e768c:    	mov	x0, x19  // guest 0x18c962, sampled 0
6c514e7690:    	adrp	x16, 0x6c97752000 <trace+0x4626b000>  // guest 0x18c962, sampled 0
6c514e7694:    	add	x16, x16, #0xa7c  // guest 0x18c962, sampled 0
6c514e7698:    	blr	x16  // guest 0x18c962, sampled 0
6c514e769c:    	ldr	w22, [x19, #0x74]  // guest 0x18c962, sampled 0
6c514e76a0:    	strh	w22, [x19, #0x224]  // guest 0x18c962, sampled 0
6c514e76a4:    	str	w21, [x19, #0x230]  // guest 0x18c962, sampled 0
6c514e76a8:    	ldr	w21, [x19, #0x54]  // guest 0x18c962, sampled 0
6c514e76ac:    	strh	w21, [x19, #0x222]  // guest 0x18c962, sampled 0
6c514e76b0:    	mov	w21, #0xc962            // =51554  // guest 0x18c962, sampled 0
6c514e76b4:    	movk	w21, #0x18, lsl #16  // guest 0x18c962, sampled 0
6c514e76b8:    	str	w21, [x19, #0x228]  // guest 0x18c962, sampled 0
6c514e76bc:    	add	w21, w20, w23  // guest 0x18c965, sampled 0
6c514e76c0:    	and	w21, w21, #0x7  // guest 0x18c965, sampled 0
6c514e76c4:    	lsl	w21, w21, #4  // guest 0x18c965, sampled 0
6c514e76c8:    	add	w21, w21, #0x1a0  // guest 0x18c965, sampled 0
6c514e76cc:    	sxtw	x21, w21  // guest 0x18c965, sampled 0
6c514e76d0:    	add	x1, x21, x19  // guest 0x18c965, sampled 0
6c514e76d4:    	lsl	w21, w20, #4  // guest 0x18c965, sampled 0
6c514e76d8:    	add	w21, w21, #0x1a0  // guest 0x18c965, sampled 0
6c514e76dc:    	sxtw	x21, w21  // guest 0x18c965, sampled 0
6c514e76e0:    	add	x2, x21, x19  // guest 0x18c965, sampled 0
6c514e76e4:    	mov	x0, x19  // guest 0x18c965, sampled 0
6c514e76e8:    	adrp	x16, 0x6c97752000 <trace+0x4626b000>  // guest 0x18c965, sampled 0
6c514e76ec:    	add	x16, x16, #0xb50  // guest 0x18c965, sampled 0
6c514e76f0:    	blr	x16  // guest 0x18c965, sampled 0
6c514e76f4:    	sxtw	x21, w20  // guest 0x18c965, sampled 0
6c514e76f8:    	add	x21, x21, x19  // guest 0x18c965, sampled 0
6c514e76fc:    	strb	w23, [x21, #0x190]  // guest 0x18c965, sampled 0
6c514e7700:    	add	w20, w20, w23  // guest 0x18c965, sampled 0
6c514e7704:    	and	w20, w20, #0x7  // guest 0x18c965, sampled 0
6c514e7708:    	str	w20, [x19, #0x188]  // guest 0x18c965, sampled 0
6c514e770c:    	ldr	w21, [x19, #0x54]  // guest 0x18c965, sampled 0
6c514e7710:    	strh	w21, [x19, #0x222]  // guest 0x18c965, sampled 0
6c514e7714:    	mov	w21, #0xc965            // =51557  // guest 0x18c965, sampled 0
6c514e7718:    	movk	w21, #0x18, lsl #16  // guest 0x18c965, sampled 0
6c514e771c:    	str	w21, [x19, #0x228]  // guest 0x18c965, sampled 0
6c514e7720:    	ldr	w21, [x19, #0x10]  // guest 0x18c967, sampled 0
6c514e7724:    	add	w22, w21, #0x3c  // guest 0x18c967, sampled 0
6c514e7728:    	mov	w24, w22  // guest 0x18c967, sampled 0
6c514e772c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c967, sampled 0
6c514e7730:    	and	x16, x16, x22, lsr #7  // guest 0x18c967, sampled 0
6c514e7734:    	add	x17, x17, x16  // guest 0x18c967, sampled 0
6c514e7738:    	ldp	x16, x17, [x17]  // guest 0x18c967, sampled 0
6c514e773c:    	and	w30, w22, #0xfffff003  // guest 0x18c967, sampled 1
6c514e7740:    	cmp	w16, w30  // guest 0x18c967, sampled 0
6c514e7744:    	b.ne	0x6c514e7c30 <trace+0x1130>  // guest 0x18c967, sampled 0
6c514e7748:    	add	x30, x17, w22, uxtw  // guest 0x18c967, sampled 0
6c514e774c:    	ldapr	w2, [x30]  // guest 0x18c967, sampled 0
6c514e7750:    	add	w22, w20, #0x7  // guest 0x18c967, sampled 0
6c514e7754:    	and	w22, w22, #0x7  // guest 0x18c967, sampled 0
6c514e7758:    	lsl	w22, w22, #4  // guest 0x18c967, sampled 0
6c514e775c:    	add	w22, w22, #0x1a0  // guest 0x18c967, sampled 0
6c514e7760:    	sxtw	x22, w22  // guest 0x18c967, sampled 0
6c514e7764:    	add	x1, x22, x19  // guest 0x18c967, sampled 0
6c514e7768:    	mov	x0, x19  // guest 0x18c967, sampled 0
6c514e776c:    	adrp	x16, 0x6c97751000 <trace+0x4626a000>  // guest 0x18c967, sampled 0
6c514e7770:    	add	x16, x16, #0x3b4  // guest 0x18c967, sampled 0
6c514e7774:    	blr	x16  // guest 0x18c967, sampled 0
6c514e7778:    	sub	w20, w20, #0x1  // guest 0x18c967, sampled 0
6c514e777c:    	and	w20, w20, #0x7  // guest 0x18c967, sampled 0
6c514e7780:    	str	w20, [x19, #0x188]  // guest 0x18c967, sampled 0
6c514e7784:    	sxtw	x22, w20  // guest 0x18c967, sampled 0
6c514e7788:    	add	x22, x22, x19  // guest 0x18c967, sampled 0
6c514e778c:    	strb	wzr, [x22, #0x190]  // guest 0x18c967, sampled 0
6c514e7790:    	ldr	w22, [x19, #0x64]  // guest 0x18c967, sampled 0
6c514e7794:    	strh	w22, [x19, #0x224]  // guest 0x18c967, sampled 0
6c514e7798:    	str	w24, [x19, #0x230]  // guest 0x18c967, sampled 0
6c514e779c:    	ldr	w22, [x19, #0x54]  // guest 0x18c967, sampled 0
6c514e77a0:    	strh	w22, [x19, #0x222]  // guest 0x18c967, sampled 0
6c514e77a4:    	mov	w22, #0xc967            // =51559  // guest 0x18c967, sampled 0
6c514e77a8:    	movk	w22, #0x18, lsl #16  // guest 0x18c967, sampled 0
6c514e77ac:    	str	w22, [x19, #0x228]  // guest 0x18c967, sampled 0
6c514e77b0:    	add	w22, w21, #0x48  // guest 0x18c96b, sampled 0
6c514e77b4:    	mov	w24, w22  // guest 0x18c96b, sampled 0
6c514e77b8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c96b, sampled 0
6c514e77bc:    	and	x16, x16, x22, lsr #7  // guest 0x18c96b, sampled 0
6c514e77c0:    	add	x17, x17, x16  // guest 0x18c96b, sampled 0
6c514e77c4:    	ldp	x16, x17, [x17]  // guest 0x18c96b, sampled 0
6c514e77c8:    	and	w30, w22, #0xfffff003  // guest 0x18c96b, sampled 0
6c514e77cc:    	cmp	w16, w30  // guest 0x18c96b, sampled 0
6c514e77d0:    	b.ne	0x6c514e7c5c <trace+0x115c>  // guest 0x18c96b, sampled 0
6c514e77d4:    	add	x30, x17, w22, uxtw  // guest 0x18c96b, sampled 0
6c514e77d8:    	ldapr	w2, [x30]  // guest 0x18c96b, sampled 0
6c514e77dc:    	add	x1, x19, #0x258  // guest 0x18c96b, sampled 1
6c514e77e0:    	mov	x0, x19  // guest 0x18c96b, sampled 0
6c514e77e4:    	adrp	x16, 0x6c97751000 <trace+0x4626a000>  // guest 0x18c96b, sampled 0
6c514e77e8:    	add	x16, x16, #0x3b4  // guest 0x18c96b, sampled 0
6c514e77ec:    	blr	x16  // guest 0x18c96b, sampled 0
6c514e77f0:    	lsl	w22, w20, #4  // guest 0x18c96b, sampled 0
6c514e77f4:    	add	w22, w22, #0x1a0  // guest 0x18c96b, sampled 0
6c514e77f8:    	sxtw	x22, w22  // guest 0x18c96b, sampled 0
6c514e77fc:    	add	x1, x22, x19  // guest 0x18c96b, sampled 0
6c514e7800:    	add	x2, x19, #0x258  // guest 0x18c96b, sampled 0
6c514e7804:    	mov	x0, x19  // guest 0x18c96b, sampled 0
6c514e7808:    	adrp	x16, 0x6c97752000 <trace+0x4626b000>  // guest 0x18c96b, sampled 0
6c514e780c:    	add	x16, x16, #0x9a8  // guest 0x18c96b, sampled 0
6c514e7810:    	blr	x16  // guest 0x18c96b, sampled 0
6c514e7814:    	ldr	w22, [x19, #0x64]  // guest 0x18c96b, sampled 0
6c514e7818:    	strh	w22, [x19, #0x224]  // guest 0x18c96b, sampled 0
6c514e781c:    	str	w24, [x19, #0x230]  // guest 0x18c96b, sampled 0
6c514e7820:    	ldr	w22, [x19, #0x54]  // guest 0x18c96b, sampled 0
6c514e7824:    	strh	w22, [x19, #0x222]  // guest 0x18c96b, sampled 0
6c514e7828:    	mov	w22, #0xc96b            // =51563  // guest 0x18c96b, sampled 0
6c514e782c:    	movk	w22, #0x18, lsl #16  // guest 0x18c96b, sampled 0
6c514e7830:    	str	w22, [x19, #0x228]  // guest 0x18c96b, sampled 0
6c514e7834:    	ldr	w22, [x19]  // guest 0x18c96f, sampled 0
6c514e7838:    	mov	w24, #0x83fc            // =33788  // guest 0x18c96f, sampled 0
6c514e783c:    	add	w24, w22, w24  // guest 0x18c96f, sampled 0
6c514e7840:    	mov	w25, w24  // guest 0x18c96f, sampled 0
6c514e7844:    	lsl	w26, w20, #4  // guest 0x18c96f, sampled 0
6c514e7848:    	add	w26, w26, #0x1a0  // guest 0x18c96f, sampled 0
6c514e784c:    	sxtw	x26, w26  // guest 0x18c96f, sampled 0
6c514e7850:    	add	x1, x26, x19  // guest 0x18c96f, sampled 0
6c514e7854:    	mov	x0, x19  // guest 0x18c96f, sampled 0
6c514e7858:    	adrp	x16, 0x6c97751000 <trace+0x4626a000>  // guest 0x18c96f, sampled 1
6c514e785c:    	add	x16, x16, #0x4f0  // guest 0x18c96f, sampled 0
6c514e7860:    	blr	x16  // guest 0x18c96f, sampled 0
6c514e7864:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c96f, sampled 0
6c514e7868:    	and	x16, x16, x24, lsr #7  // guest 0x18c96f, sampled 0
6c514e786c:    	add	x17, x17, x16  // guest 0x18c96f, sampled 0
6c514e7870:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18c96f, sampled 0
6c514e7874:    	and	w30, w24, #0xfffff003  // guest 0x18c96f, sampled 1
6c514e7878:    	cmp	w16, w30  // guest 0x18c96f, sampled 0
6c514e787c:    	b.ne	0x6c514e7c88 <trace+0x1188>  // guest 0x18c96f, sampled 0
6c514e7880:    	add	x30, x17, w24, uxtw  // guest 0x18c96f, sampled 0
6c514e7884:    	stlr	w0, [x30]  // guest 0x18c96f, sampled 0
6c514e7888:    	sxtw	x24, w20  // guest 0x18c96f, sampled 0
6c514e788c:    	add	x24, x24, x19  // guest 0x18c96f, sampled 0
6c514e7890:    	strb	w23, [x24, #0x190]  // guest 0x18c96f, sampled 0
6c514e7894:    	add	w20, w20, w23  // guest 0x18c96f, sampled 0
6c514e7898:    	and	w20, w20, #0x7  // guest 0x18c96f, sampled 0
6c514e789c:    	str	w20, [x19, #0x188]  // guest 0x18c96f, sampled 0
6c514e78a0:    	ldr	w24, [x19, #0x74]  // guest 0x18c96f, sampled 0
6c514e78a4:    	strh	w24, [x19, #0x224]  // guest 0x18c96f, sampled 0
6c514e78a8:    	str	w25, [x19, #0x230]  // guest 0x18c96f, sampled 0
6c514e78ac:    	ldr	w24, [x19, #0x54]  // guest 0x18c96f, sampled 0
6c514e78b0:    	strh	w24, [x19, #0x222]  // guest 0x18c96f, sampled 0
6c514e78b4:    	mov	w24, #0xc96f            // =51567  // guest 0x18c96f, sampled 0
6c514e78b8:    	movk	w24, #0x18, lsl #16  // guest 0x18c96f, sampled 0
6c514e78bc:    	str	w24, [x19, #0x228]  // guest 0x18c96f, sampled 0
6c514e78c0:    	add	w21, w21, #0x4c  // guest 0x18c975, sampled 0
6c514e78c4:    	mov	w24, w21  // guest 0x18c975, sampled 0
6c514e78c8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c975, sampled 0
6c514e78cc:    	and	x16, x16, x21, lsr #7  // guest 0x18c975, sampled 0
6c514e78d0:    	add	x17, x17, x16  // guest 0x18c975, sampled 0
6c514e78d4:    	ldp	x16, x17, [x17]  // guest 0x18c975, sampled 0
6c514e78d8:    	and	w30, w21, #0xfffff003  // guest 0x18c975, sampled 0
6c514e78dc:    	cmp	w16, w30  // guest 0x18c975, sampled 0
6c514e78e0:    	b.ne	0x6c514e7cb4 <trace+0x11b4>  // guest 0x18c975, sampled 0
6c514e78e4:    	add	x30, x17, w21, uxtw  // guest 0x18c975, sampled 0
6c514e78e8:    	ldapr	w2, [x30]  // guest 0x18c975, sampled 0
6c514e78ec:    	add	x1, x19, #0x258  // guest 0x18c975, sampled 0
6c514e78f0:    	mov	x0, x19  // guest 0x18c975, sampled 0
6c514e78f4:    	adrp	x16, 0x6c97751000 <trace+0x4626a000>  // guest 0x18c975, sampled 0
6c514e78f8:    	add	x16, x16, #0x3b4  // guest 0x18c975, sampled 0
6c514e78fc:    	blr	x16  // guest 0x18c975, sampled 0
6c514e7900:    	lsl	w21, w20, #4  // guest 0x18c975, sampled 0
6c514e7904:    	add	w21, w21, #0x1a0  // guest 0x18c975, sampled 0
6c514e7908:    	sxtw	x21, w21  // guest 0x18c975, sampled 0
6c514e790c:    	add	x1, x21, x19  // guest 0x18c975, sampled 0
6c514e7910:    	add	x2, x19, #0x258  // guest 0x18c975, sampled 0
6c514e7914:    	mov	x0, x19  // guest 0x18c975, sampled 0
6c514e7918:    	adrp	x16, 0x6c97752000 <trace+0x4626b000>  // guest 0x18c975, sampled 0
6c514e791c:    	add	x16, x16, #0x9a8  // guest 0x18c975, sampled 0
6c514e7920:    	blr	x16  // guest 0x18c975, sampled 0
6c514e7924:    	ldr	w21, [x19, #0x64]  // guest 0x18c975, sampled 0
6c514e7928:    	strh	w21, [x19, #0x224]  // guest 0x18c975, sampled 0
6c514e792c:    	str	w24, [x19, #0x230]  // guest 0x18c975, sampled 0
6c514e7930:    	ldr	w21, [x19, #0x54]  // guest 0x18c975, sampled 0
6c514e7934:    	strh	w21, [x19, #0x222]  // guest 0x18c975, sampled 0
6c514e7938:    	mov	w21, #0xc975            // =51573  // guest 0x18c975, sampled 0
6c514e793c:    	movk	w21, #0x18, lsl #16  // guest 0x18c975, sampled 0
6c514e7940:    	str	w21, [x19, #0x228]  // guest 0x18c975, sampled 0
6c514e7944:    	mov	w21, #0x8400            // =33792  // guest 0x18c979, sampled 0
6c514e7948:    	add	w21, w22, w21  // guest 0x18c979, sampled 0
6c514e794c:    	mov	w22, w21  // guest 0x18c979, sampled 0
6c514e7950:    	lsl	w24, w20, #4  // guest 0x18c979, sampled 0
6c514e7954:    	add	w24, w24, #0x1a0  // guest 0x18c979, sampled 0
6c514e7958:    	sxtw	x24, w24  // guest 0x18c979, sampled 0
6c514e795c:    	add	x1, x24, x19  // guest 0x18c979, sampled 0
6c514e7960:    	mov	x0, x19  // guest 0x18c979, sampled 0
6c514e7964:    	adrp	x16, 0x6c97751000 <trace+0x4626a000>  // guest 0x18c979, sampled 0
6c514e7968:    	add	x16, x16, #0x4f0  // guest 0x18c979, sampled 0
6c514e796c:    	blr	x16  // guest 0x18c979, sampled 0
6c514e7970:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c979, sampled 0
6c514e7974:    	and	x16, x16, x21, lsr #7  // guest 0x18c979, sampled 0
6c514e7978:    	add	x17, x17, x16  // guest 0x18c979, sampled 0
6c514e797c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18c979, sampled 0
6c514e7980:    	and	w30, w21, #0xfffff003  // guest 0x18c979, sampled 1
6c514e7984:    	cmp	w16, w30  // guest 0x18c979, sampled 0
6c514e7988:    	b.ne	0x6c514e7ce0 <trace+0x11e0>  // guest 0x18c979, sampled 0
6c514e798c:    	add	x30, x17, w21, uxtw  // guest 0x18c979, sampled 0
6c514e7990:    	stlr	w0, [x30]  // guest 0x18c979, sampled 0
6c514e7994:    	sxtw	x21, w20  // guest 0x18c979, sampled 0
6c514e7998:    	add	x21, x21, x19  // guest 0x18c979, sampled 0
6c514e799c:    	strb	w23, [x21, #0x190]  // guest 0x18c979, sampled 0
6c514e79a0:    	add	w20, w20, w23  // guest 0x18c979, sampled 0
6c514e79a4:    	and	w20, w20, #0x7  // guest 0x18c979, sampled 0
6c514e79a8:    	str	w20, [x19, #0x188]  // guest 0x18c979, sampled 0
6c514e79ac:    	ldr	w20, [x19, #0x74]  // guest 0x18c979, sampled 0
6c514e79b0:    	strh	w20, [x19, #0x224]  // guest 0x18c979, sampled 0
6c514e79b4:    	str	w22, [x19, #0x230]  // guest 0x18c979, sampled 0
6c514e79b8:    	ldr	w20, [x19, #0x54]  // guest 0x18c979, sampled 0
6c514e79bc:    	strh	w20, [x19, #0x222]  // guest 0x18c979, sampled 0
6c514e79c0:    	mov	w20, #0xc979            // =51577  // guest 0x18c979, sampled 0
6c514e79c4:    	movk	w20, #0x18, lsl #16  // guest 0x18c979, sampled 0
6c514e79c8:    	str	w20, [x19, #0x228]  // guest 0x18c979, sampled 0
6c514e79cc:    	sturb	w23, [x19, #-0xc]  // guest 0x18c979, sampled 0
6c514e79d0:    	mov	w20, #0x22              // =34  // guest 0x18c97f, sampled 0
6c514e79d4:    	str	w20, [x19, #0x34]  // guest 0x18c97f, sampled 0
6c514e79d8:    	ldr	w20, [x19, #0x28]  // guest 0x18c97f, sampled 0
6c514e79dc:    	cbnz	w20, 0x6c514e79fc <trace+0xefc>  // guest 0x18c97f, sampled 0
6c514e79e0:    	b	0x6c514e79e0 <trace+0xee0>  // guest 0x18c97f, sampled 0
6c514e79e4:    	br	x16  // guest 0x18c97f, sampled 0
6c514e79e8:    	mov	w20, #0xc981            // =51585  // guest 0x18c97f, sampled 0
6c514e79ec:    	movk	w20, #0x18, lsl #16  // guest 0x18c97f, sampled 0
6c514e79f0:    	str	w20, [x19, #0x20]  // guest 0x18c97f, sampled 0
6c514e79f4:    	adr	x0, 0x6c514e6a41 <trace+0xffffffffffffff41>  // guest 0x18c97f, sampled 0
6c514e79f8:    	b	0x6c4ae5d02c <trace+0xfffffffff997652c>  // guest 0x18c97f, sampled 0
6c514e79fc:    	b	0x6c514e79fc <trace+0xefc>  // guest 0x18c97f, sampled 0
6c514e7a00:    	br	x16  // guest 0x18c97f, sampled 0
6c514e7a04:    	mov	w20, #0xc914            // =51476  // guest 0x18c97f, sampled 0
6c514e7a08:    	movk	w20, #0x18, lsl #16  // guest 0x18c97f, sampled 0
6c514e7a0c:    	str	w20, [x19, #0x20]  // guest 0x18c97f, sampled 0
6c514e7a10:    	adr	x0, 0x6c514e6a40 <trace+0xffffffffffffff40>  // guest 0x18c97f, sampled 0
6c514e7a14:    	b	0x6c4ae5d02c <trace+0xfffffffff997652c>  // guest 0x18c97f, sampled 0
6c514e7a18:    	adr	x0, 0x6c514e6a43 <trace+0xffffffffffffff43>  // guest 0x18c97f, sampled 0
6c514e7a1c:    	b	0x6c4ae5d02c <trace+0xfffffffff997652c>  // guest 0x18c97f, sampled 0
6c514e7a20:    	mov	w1, w21
6c514e7a24:    	mov	x0, x19
6c514e7a28:    	mov	w2, #0x4045             // =16453
6c514e7a2c:    	movk	w2, #0x1, lsl #16
6c514e7a30:    	adr	x3, 0x6c514e6bb8 <trace+0xb8>
6c514e7a34:    	adrp	x16, 0x6c97723000 <trace+0x4623c000>
6c514e7a38:    	add	x16, x16, #0xf88
6c514e7a3c:    	blr	x16
6c514e7a40:    	mov	w2, w0
6c514e7a44:    	dmb	ishld
6c514e7a48:    	b	0x6c514e6bb8 <trace+0xb8>
6c514e7a4c:    	mov	w1, w22
6c514e7a50:    	mov	x0, x19
6c514e7a54:    	mov	w2, #0x4045             // =16453
6c514e7a58:    	movk	w2, #0x1, lsl #16
6c514e7a5c:    	adr	x3, 0x6c514e6dc4 <trace+0x2c4>
6c514e7a60:    	adrp	x16, 0x6c97723000 <trace+0x4623c000>
6c514e7a64:    	add	x16, x16, #0xf88
6c514e7a68:    	blr	x16
6c514e7a6c:    	mov	w2, w0
6c514e7a70:    	dmb	ishld
6c514e7a74:    	b	0x6c514e6dc4 <trace+0x2c4>
6c514e7a78:    	mov	w1, w22
6c514e7a7c:    	mov	x0, x19
6c514e7a80:    	mov	w2, #0x4045             // =16453
6c514e7a84:    	movk	w2, #0x1, lsl #16
6c514e7a88:    	adr	x3, 0x6c514e6eac <trace+0x3ac>
6c514e7a8c:    	adrp	x16, 0x6c97723000 <trace+0x4623c000>
6c514e7a90:    	add	x16, x16, #0xf88
6c514e7a94:    	blr	x16
6c514e7a98:    	mov	w2, w0
6c514e7a9c:    	dmb	ishld
6c514e7aa0:    	b	0x6c514e6eac <trace+0x3ac>
6c514e7aa4:    	mov	w1, w24
6c514e7aa8:    	mov	w2, w0
6c514e7aac:    	mov	x0, x19
6c514e7ab0:    	mov	w3, #0x4045             // =16453
6c514e7ab4:    	movk	w3, #0x1, lsl #16
6c514e7ab8:    	adr	x4, 0x6c514e6fbc <trace+0x4bc>
6c514e7abc:    	adrp	x16, 0x6c97724000 <trace+0x4623d000>
6c514e7ac0:    	add	x16, x16, #0xb68
6c514e7ac4:    	blr	x16
6c514e7ac8:    	dmb	ishld
6c514e7acc:    	b	0x6c514e6fbc <trace+0x4bc>
6c514e7ad0:    	mov	w1, w24
6c514e7ad4:    	mov	x0, x19
6c514e7ad8:    	mov	w2, #0x4045             // =16453
6c514e7adc:    	movk	w2, #0x1, lsl #16
6c514e7ae0:    	adr	x3, 0x6c514e7080 <trace+0x580>
6c514e7ae4:    	adrp	x16, 0x6c97723000 <trace+0x4623c000>
6c514e7ae8:    	add	x16, x16, #0xf88
6c514e7aec:    	blr	x16
6c514e7af0:    	mov	w2, w0
6c514e7af4:    	dmb	ishld
6c514e7af8:    	b	0x6c514e7080 <trace+0x580>
6c514e7afc:    	mov	w1, w21
6c514e7b00:    	mov	x0, x19
6c514e7b04:    	mov	w2, #0x4045             // =16453
6c514e7b08:    	movk	w2, #0x1, lsl #16
6c514e7b0c:    	adr	x3, 0x6c514e7168 <trace+0x668>
6c514e7b10:    	adrp	x16, 0x6c97723000 <trace+0x4623d000>
6c514e7b14:    	add	x16, x16, #0xf88
6c514e7b18:    	blr	x16
6c514e7b1c:    	mov	w2, w0
6c514e7b20:    	dmb	ishld
6c514e7b24:    	b	0x6c514e7168 <trace+0x668>
6c514e7b28:    	mov	w1, w21
6c514e7b2c:    	mov	w2, w0
6c514e7b30:    	mov	x0, x19
6c514e7b34:    	mov	w3, #0x4045             // =16453
6c514e7b38:    	movk	w3, #0x1, lsl #16
6c514e7b3c:    	adr	x4, 0x6c514e7270 <trace+0x770>
6c514e7b40:    	adrp	x16, 0x6c97724000 <trace+0x4623e000>
6c514e7b44:    	add	x16, x16, #0xb68
6c514e7b48:    	blr	x16
6c514e7b4c:    	dmb	ishld
6c514e7b50:    	b	0x6c514e7270 <trace+0x770>
6c514e7b54:    	mov	w1, w24
6c514e7b58:    	mov	x0, x19
6c514e7b5c:    	mov	w2, #0x4045             // =16453
6c514e7b60:    	movk	w2, #0x1, lsl #16
6c514e7b64:    	adr	x3, 0x6c514e7338 <trace+0x838>
6c514e7b68:    	adrp	x16, 0x6c97723000 <trace+0x4623d000>
6c514e7b6c:    	add	x16, x16, #0xf88
6c514e7b70:    	blr	x16
6c514e7b74:    	mov	w2, w0
6c514e7b78:    	dmb	ishld
6c514e7b7c:    	b	0x6c514e7338 <trace+0x838>
6c514e7b80:    	mov	w1, w24
6c514e7b84:    	mov	x0, x19
6c514e7b88:    	mov	w2, #0x4045             // =16453
6c514e7b8c:    	movk	w2, #0x1, lsl #16
6c514e7b90:    	adr	x3, 0x6c514e7420 <trace+0x920>
6c514e7b94:    	adrp	x16, 0x6c97723000 <trace+0x4623d000>
6c514e7b98:    	add	x16, x16, #0xf88
6c514e7b9c:    	blr	x16
6c514e7ba0:    	mov	w2, w0
6c514e7ba4:    	dmb	ishld
6c514e7ba8:    	b	0x6c514e7420 <trace+0x920>
6c514e7bac:    	mov	w1, w22
6c514e7bb0:    	mov	w2, w0
6c514e7bb4:    	mov	x0, x19
6c514e7bb8:    	mov	w3, #0x4045             // =16453
6c514e7bbc:    	movk	w3, #0x1, lsl #16
6c514e7bc0:    	adr	x4, 0x6c514e7528 <trace+0xa28>
6c514e7bc4:    	adrp	x16, 0x6c97724000 <trace+0x4623e000>
6c514e7bc8:    	add	x16, x16, #0xb68
6c514e7bcc:    	blr	x16
6c514e7bd0:    	dmb	ishld
6c514e7bd4:    	b	0x6c514e7528 <trace+0xa28>
6c514e7bd8:    	mov	w1, w21
6c514e7bdc:    	mov	x0, x19
6c514e7be0:    	mov	w2, #0x4045             // =16453
6c514e7be4:    	movk	w2, #0x1, lsl #16
6c514e7be8:    	adr	x3, 0x6c514e758c <trace+0xa8c>
6c514e7bec:    	adrp	x16, 0x6c97723000 <trace+0x4623d000>
6c514e7bf0:    	add	x16, x16, #0xf88
6c514e7bf4:    	blr	x16
6c514e7bf8:    	mov	w2, w0
6c514e7bfc:    	dmb	ishld
6c514e7c00:    	b	0x6c514e758c <trace+0xa8c>
6c514e7c04:    	mov	w1, w20
6c514e7c08:    	mov	x0, x19
6c514e7c0c:    	mov	w2, #0x4045             // =16453
6c514e7c10:    	movk	w2, #0x1, lsl #16
6c514e7c14:    	adr	x3, 0x6c514e7660 <trace+0xb60>
6c514e7c18:    	adrp	x16, 0x6c97723000 <trace+0x4623d000>
6c514e7c1c:    	add	x16, x16, #0xf88
6c514e7c20:    	blr	x16
6c514e7c24:    	mov	w2, w0
6c514e7c28:    	dmb	ishld
6c514e7c2c:    	b	0x6c514e7660 <trace+0xb60>
6c514e7c30:    	mov	w1, w22
6c514e7c34:    	mov	x0, x19
6c514e7c38:    	mov	w2, #0x4045             // =16453
6c514e7c3c:    	movk	w2, #0x1, lsl #16
6c514e7c40:    	adr	x3, 0x6c514e7750 <trace+0xc50>
6c514e7c44:    	adrp	x16, 0x6c97723000 <trace+0x4623d000>
6c514e7c48:    	add	x16, x16, #0xf88
6c514e7c4c:    	blr	x16
6c514e7c50:    	mov	w2, w0
6c514e7c54:    	dmb	ishld
6c514e7c58:    	b	0x6c514e7750 <trace+0xc50>
6c514e7c5c:    	mov	w1, w22
6c514e7c60:    	mov	x0, x19
6c514e7c64:    	mov	w2, #0x4045             // =16453
6c514e7c68:    	movk	w2, #0x1, lsl #16
6c514e7c6c:    	adr	x3, 0x6c514e77dc <trace+0xcdc>
6c514e7c70:    	adrp	x16, 0x6c97723000 <trace+0x4623d000>
6c514e7c74:    	add	x16, x16, #0xf88
6c514e7c78:    	blr	x16
6c514e7c7c:    	mov	w2, w0
6c514e7c80:    	dmb	ishld
6c514e7c84:    	b	0x6c514e77dc <trace+0xcdc>
6c514e7c88:    	mov	w1, w24
6c514e7c8c:    	mov	w2, w0
6c514e7c90:    	mov	x0, x19
6c514e7c94:    	mov	w3, #0x4045             // =16453
6c514e7c98:    	movk	w3, #0x1, lsl #16
6c514e7c9c:    	adr	x4, 0x6c514e7888 <trace+0xd88>
6c514e7ca0:    	adrp	x16, 0x6c97724000 <trace+0x4623e000>
6c514e7ca4:    	add	x16, x16, #0xb68
6c514e7ca8:    	blr	x16
6c514e7cac:    	dmb	ishld
6c514e7cb0:    	b	0x6c514e7888 <trace+0xd88>
6c514e7cb4:    	mov	w1, w21
6c514e7cb8:    	mov	x0, x19
6c514e7cbc:    	mov	w2, #0x4045             // =16453
6c514e7cc0:    	movk	w2, #0x1, lsl #16
6c514e7cc4:    	adr	x3, 0x6c514e78ec <trace+0xdec>
6c514e7cc8:    	adrp	x16, 0x6c97723000 <trace+0x4623d000>
6c514e7ccc:    	add	x16, x16, #0xf88
6c514e7cd0:    	blr	x16
6c514e7cd4:    	mov	w2, w0
6c514e7cd8:    	dmb	ishld
6c514e7cdc:    	b	0x6c514e78ec <trace+0xdec>
6c514e7ce0:    	mov	w1, w21
6c514e7ce4:    	mov	w2, w0
6c514e7ce8:    	mov	x0, x19
6c514e7cec:    	mov	w3, #0x4045             // =16453
6c514e7cf0:    	movk	w3, #0x1, lsl #16
6c514e7cf4:    	adr	x4, 0x6c514e7994 <trace+0xe94>
6c514e7cf8:    	adrp	x16, 0x6c97724000 <trace+0x4623e000>
6c514e7cfc:    	add	x16, x16, #0xb68
6c514e7d00:    	blr	x16
6c514e7d04:    	dmb	ishld
6c514e7d08:    	b	0x6c514e7994 <trace+0xe94>