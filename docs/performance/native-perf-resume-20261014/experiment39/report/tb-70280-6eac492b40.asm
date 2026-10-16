
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-70280-6eac492b40.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006eac492b40 <trace>:
6eac492b40:    	ldur	w20, [x19, #-0x10]  // guest 0x70280, sampled 0
6eac492b44:    	tbnz	w20, #0x1f, 0x6eac494bcc <trace+0x208c>  // guest 0x70280, sampled 0
6eac492b48:    	sturb	wzr, [x19, #-0xc]  // guest 0x70280, sampled 0
6eac492b4c:    	ldr	w20, [x19, #0x10]  // guest 0x70280, sampled 0
6eac492b50:    	sub	w20, w20, #0x4  // guest 0x70280, sampled 0
6eac492b54:    	mov	w21, w20  // guest 0x70280, sampled 0
6eac492b58:    	ldr	w22, [x19, #0x4]  // guest 0x70280, sampled 0
6eac492b5c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x70280, sampled 0
6eac492b60:    	and	x16, x16, x21, lsr #7  // guest 0x70280, sampled 0
6eac492b64:    	add	x17, x17, x16  // guest 0x70280, sampled 0
6eac492b68:    	ldp	x17, x16, [x17, #0x8]  // guest 0x70280, sampled 0
6eac492b6c:    	and	w30, w21, #0xfffff003  // guest 0x70280, sampled 0
6eac492b70:    	cmp	w16, w30  // guest 0x70280, sampled 0
6eac492b74:    	b.ne	0x6eac494bd4 <trace+0x2094>  // guest 0x70280, sampled 0
6eac492b78:    	add	x30, x17, w21, uxtw  // guest 0x70280, sampled 0
6eac492b7c:    	stlr	w22, [x30]  // guest 0x70280, sampled 0
6eac492b80:    	str	w20, [x19, #0x10]  // guest 0x70280, sampled 0
6eac492b84:    	add	w21, w22, #0x28  // guest 0x70281, sampled 0
6eac492b88:    	mov	w23, w21  // guest 0x70281, sampled 0
6eac492b8c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x70281, sampled 0
6eac492b90:    	and	x16, x16, x21, lsr #7  // guest 0x70281, sampled 0
6eac492b94:    	add	x17, x17, x16  // guest 0x70281, sampled 0
6eac492b98:    	ldp	x16, x17, [x17]  // guest 0x70281, sampled 0
6eac492b9c:    	and	w30, w21, #0xfffff003  // guest 0x70281, sampled 0
6eac492ba0:    	cmp	w16, w30  // guest 0x70281, sampled 0
6eac492ba4:    	b.ne	0x6eac494c00 <trace+0x20c0>  // guest 0x70281, sampled 0
6eac492ba8:    	add	x30, x17, w21, uxtw  // guest 0x70281, sampled 0
6eac492bac:    	ldapr	w2, [x30]  // guest 0x70281, sampled 0
6eac492bb0:    	ldr	w21, [x19, #0x188]  // guest 0x70281, sampled 0
6eac492bb4:    	add	w24, w21, #0x7  // guest 0x70281, sampled 0
6eac492bb8:    	and	w24, w24, #0x7  // guest 0x70281, sampled 0
6eac492bbc:    	lsl	w24, w24, #4  // guest 0x70281, sampled 0
6eac492bc0:    	add	w24, w24, #0x1a0  // guest 0x70281, sampled 0
6eac492bc4:    	sxtw	x24, w24  // guest 0x70281, sampled 0
6eac492bc8:    	add	x1, x24, x19  // guest 0x70281, sampled 0
6eac492bcc:    	mov	x0, x19  // guest 0x70281, sampled 0
6eac492bd0:    	adrp	x16, 0x6efc8aa000 <trace+0x50418000>  // guest 0x70281, sampled 0
6eac492bd4:    	add	x16, x16, #0x484  // guest 0x70281, sampled 0
6eac492bd8:    	blr	x16  // guest 0x70281, sampled 0
6eac492bdc:    	sub	w21, w21, #0x1  // guest 0x70281, sampled 0
6eac492be0:    	and	w21, w21, #0x7  // guest 0x70281, sampled 0
6eac492be4:    	str	w21, [x19, #0x188]  // guest 0x70281, sampled 0
6eac492be8:    	sxtw	x24, w21  // guest 0x70281, sampled 0
6eac492bec:    	add	x24, x24, x19  // guest 0x70281, sampled 0
6eac492bf0:    	strb	wzr, [x24, #0x190]  // guest 0x70281, sampled 0
6eac492bf4:    	ldr	w24, [x19, #0x74]  // guest 0x70281, sampled 0
6eac492bf8:    	strh	w24, [x19, #0x224]  // guest 0x70281, sampled 0
6eac492bfc:    	str	w23, [x19, #0x230]  // guest 0x70281, sampled 0
6eac492c00:    	ldr	w23, [x19, #0x54]  // guest 0x70281, sampled 0
6eac492c04:    	strh	w23, [x19, #0x222]  // guest 0x70281, sampled 0
6eac492c08:    	mov	w23, #0x281             // =641  // guest 0x70281, sampled 0
6eac492c0c:    	movk	w23, #0x7, lsl #16  // guest 0x70281, sampled 0
6eac492c10:    	str	w23, [x19, #0x228]  // guest 0x70281, sampled 0
6eac492c14:    	add	w23, w22, #0x3c  // guest 0x70284, sampled 0
6eac492c18:    	mov	w24, w23  // guest 0x70284, sampled 0
6eac492c1c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x70284, sampled 0
6eac492c20:    	and	x16, x16, x23, lsr #7  // guest 0x70284, sampled 0
6eac492c24:    	add	x17, x17, x16  // guest 0x70284, sampled 0
6eac492c28:    	ldp	x16, x17, [x17]  // guest 0x70284, sampled 0
6eac492c2c:    	and	w30, w23, #0xfffff003  // guest 0x70284, sampled 0
6eac492c30:    	cmp	w16, w30  // guest 0x70284, sampled 0
6eac492c34:    	b.ne	0x6eac494c2c <trace+0x20ec>  // guest 0x70284, sampled 0
6eac492c38:    	add	x30, x17, w23, uxtw  // guest 0x70284, sampled 0
6eac492c3c:    	ldapr	w2, [x30]  // guest 0x70284, sampled 0
6eac492c40:    	add	x1, x19, #0x258  // guest 0x70284, sampled 0
6eac492c44:    	mov	x0, x19  // guest 0x70284, sampled 0
6eac492c48:    	adrp	x16, 0x6efc8aa000 <trace+0x50418000>  // guest 0x70284, sampled 0
6eac492c4c:    	add	x16, x16, #0x484  // guest 0x70284, sampled 0
6eac492c50:    	blr	x16  // guest 0x70284, sampled 0
6eac492c54:    	lsl	w23, w21, #4  // guest 0x70284, sampled 0
6eac492c58:    	add	w23, w23, #0x1a0  // guest 0x70284, sampled 0
6eac492c5c:    	sxtw	x23, w23  // guest 0x70284, sampled 0
6eac492c60:    	add	x1, x23, x19  // guest 0x70284, sampled 0
6eac492c64:    	add	x2, x19, #0x258  // guest 0x70284, sampled 0
6eac492c68:    	mov	x0, x19  // guest 0x70284, sampled 0
6eac492c6c:    	adrp	x16, 0x6efc8ab000 <trace+0x50419000>  // guest 0x70284, sampled 0
6eac492c70:    	add	x16, x16, #0xb4c  // guest 0x70284, sampled 0
6eac492c74:    	blr	x16  // guest 0x70284, sampled 0
6eac492c78:    	ldr	w23, [x19, #0x74]  // guest 0x70284, sampled 0
6eac492c7c:    	strh	w23, [x19, #0x224]  // guest 0x70284, sampled 0
6eac492c80:    	str	w24, [x19, #0x230]  // guest 0x70284, sampled 0
6eac492c84:    	ldr	w23, [x19, #0x54]  // guest 0x70284, sampled 0
6eac492c88:    	strh	w23, [x19, #0x222]  // guest 0x70284, sampled 0
6eac492c8c:    	mov	w23, #0x284             // =644  // guest 0x70284, sampled 0
6eac492c90:    	movk	w23, #0x7, lsl #16  // guest 0x70284, sampled 0
6eac492c94:    	str	w23, [x19, #0x228]  // guest 0x70284, sampled 0
6eac492c98:    	add	w23, w22, #0x38  // guest 0x70287, sampled 0
6eac492c9c:    	mov	w24, w23  // guest 0x70287, sampled 0
6eac492ca0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x70287, sampled 0
6eac492ca4:    	and	x16, x16, x23, lsr #7  // guest 0x70287, sampled 0
6eac492ca8:    	add	x17, x17, x16  // guest 0x70287, sampled 0
6eac492cac:    	ldp	x16, x17, [x17]  // guest 0x70287, sampled 0
6eac492cb0:    	and	w30, w23, #0xfffff003  // guest 0x70287, sampled 0
6eac492cb4:    	cmp	w16, w30  // guest 0x70287, sampled 0
6eac492cb8:    	b.ne	0x6eac494c58 <trace+0x2118>  // guest 0x70287, sampled 0
6eac492cbc:    	add	x30, x17, w23, uxtw  // guest 0x70287, sampled 0
6eac492cc0:    	ldapr	w2, [x30]  // guest 0x70287, sampled 0
6eac492cc4:    	add	w23, w21, #0x7  // guest 0x70287, sampled 0
6eac492cc8:    	and	w23, w23, #0x7  // guest 0x70287, sampled 0
6eac492ccc:    	lsl	w23, w23, #4  // guest 0x70287, sampled 0
6eac492cd0:    	add	w23, w23, #0x1a0  // guest 0x70287, sampled 0
6eac492cd4:    	sxtw	x23, w23  // guest 0x70287, sampled 0
6eac492cd8:    	add	x1, x23, x19  // guest 0x70287, sampled 0
6eac492cdc:    	mov	x0, x19  // guest 0x70287, sampled 0
6eac492ce0:    	adrp	x16, 0x6efc8aa000 <trace+0x50418000>  // guest 0x70287, sampled 0
6eac492ce4:    	add	x16, x16, #0x484  // guest 0x70287, sampled 0
6eac492ce8:    	blr	x16  // guest 0x70287, sampled 0
6eac492cec:    	sub	w21, w21, #0x1  // guest 0x70287, sampled 0
6eac492cf0:    	and	w21, w21, #0x7  // guest 0x70287, sampled 0
6eac492cf4:    	str	w21, [x19, #0x188]  // guest 0x70287, sampled 0
6eac492cf8:    	sxtw	x23, w21  // guest 0x70287, sampled 0
6eac492cfc:    	add	x23, x23, x19  // guest 0x70287, sampled 0
6eac492d00:    	strb	wzr, [x23, #0x190]  // guest 0x70287, sampled 0
6eac492d04:    	ldr	w23, [x19, #0x74]  // guest 0x70287, sampled 0
6eac492d08:    	strh	w23, [x19, #0x224]  // guest 0x70287, sampled 0
6eac492d0c:    	str	w24, [x19, #0x230]  // guest 0x70287, sampled 0
6eac492d10:    	ldr	w23, [x19, #0x54]  // guest 0x70287, sampled 0
6eac492d14:    	strh	w23, [x19, #0x222]  // guest 0x70287, sampled 0
6eac492d18:    	mov	w23, #0x287             // =647  // guest 0x70287, sampled 0
6eac492d1c:    	movk	w23, #0x7, lsl #16  // guest 0x70287, sampled 0
6eac492d20:    	str	w23, [x19, #0x228]  // guest 0x70287, sampled 0
6eac492d24:    	add	w23, w22, #0x2c  // guest 0x7028a, sampled 0
6eac492d28:    	mov	w24, w23  // guest 0x7028a, sampled 0
6eac492d2c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x7028a, sampled 0
6eac492d30:    	and	x16, x16, x23, lsr #7  // guest 0x7028a, sampled 0
6eac492d34:    	add	x17, x17, x16  // guest 0x7028a, sampled 0
6eac492d38:    	ldp	x16, x17, [x17]  // guest 0x7028a, sampled 0
6eac492d3c:    	and	w30, w23, #0xfffff003  // guest 0x7028a, sampled 0
6eac492d40:    	cmp	w16, w30  // guest 0x7028a, sampled 0
6eac492d44:    	b.ne	0x6eac494c84 <trace+0x2144>  // guest 0x7028a, sampled 0
6eac492d48:    	add	x30, x17, w23, uxtw  // guest 0x7028a, sampled 0
6eac492d4c:    	ldapr	w2, [x30]  // guest 0x7028a, sampled 0
6eac492d50:    	add	x1, x19, #0x258  // guest 0x7028a, sampled 0
6eac492d54:    	mov	x0, x19  // guest 0x7028a, sampled 0
6eac492d58:    	adrp	x16, 0x6efc8aa000 <trace+0x50418000>  // guest 0x7028a, sampled 0
6eac492d5c:    	add	x16, x16, #0x484  // guest 0x7028a, sampled 0
6eac492d60:    	blr	x16  // guest 0x7028a, sampled 0
6eac492d64:    	lsl	w23, w21, #4  // guest 0x7028a, sampled 0
6eac492d68:    	add	w23, w23, #0x1a0  // guest 0x7028a, sampled 0
6eac492d6c:    	sxtw	x23, w23  // guest 0x7028a, sampled 0
6eac492d70:    	add	x1, x23, x19  // guest 0x7028a, sampled 0
6eac492d74:    	add	x2, x19, #0x258  // guest 0x7028a, sampled 0
6eac492d78:    	mov	x0, x19  // guest 0x7028a, sampled 0
6eac492d7c:    	adrp	x16, 0x6efc8ab000 <trace+0x50419000>  // guest 0x7028a, sampled 0
6eac492d80:    	add	x16, x16, #0xb4c  // guest 0x7028a, sampled 0
6eac492d84:    	blr	x16  // guest 0x7028a, sampled 0
6eac492d88:    	ldr	w23, [x19, #0x74]  // guest 0x7028a, sampled 0
6eac492d8c:    	strh	w23, [x19, #0x224]  // guest 0x7028a, sampled 0
6eac492d90:    	str	w24, [x19, #0x230]  // guest 0x7028a, sampled 0
6eac492d94:    	ldr	w23, [x19, #0x54]  // guest 0x7028a, sampled 0
6eac492d98:    	strh	w23, [x19, #0x222]  // guest 0x7028a, sampled 0
6eac492d9c:    	mov	w23, #0x28a             // =650  // guest 0x7028a, sampled 0
6eac492da0:    	movk	w23, #0x7, lsl #16  // guest 0x7028a, sampled 0
6eac492da4:    	str	w23, [x19, #0x228]  // guest 0x7028a, sampled 0
6eac492da8:    	add	w23, w21, #0x1  // guest 0x7028d, sampled 0
6eac492dac:    	and	w23, w23, #0x7  // guest 0x7028d, sampled 0
6eac492db0:    	lsl	w23, w23, #4  // guest 0x7028d, sampled 0
6eac492db4:    	add	w23, w23, #0x1a0  // guest 0x7028d, sampled 0
6eac492db8:    	sxtw	x23, w23  // guest 0x7028d, sampled 0
6eac492dbc:    	add	x1, x23, x19  // guest 0x7028d, sampled 0
6eac492dc0:    	lsl	w23, w21, #4  // guest 0x7028d, sampled 0
6eac492dc4:    	add	w23, w23, #0x1a0  // guest 0x7028d, sampled 0
6eac492dc8:    	sxtw	x23, w23  // guest 0x7028d, sampled 0
6eac492dcc:    	add	x2, x23, x19  // guest 0x7028d, sampled 0
6eac492dd0:    	mov	x0, x19  // guest 0x7028d, sampled 0
6eac492dd4:    	adrp	x16, 0x6efc8ab000 <trace+0x50419000>  // guest 0x7028d, sampled 0
6eac492dd8:    	add	x16, x16, #0xc20  // guest 0x7028d, sampled 0
6eac492ddc:    	blr	x16  // guest 0x7028d, sampled 0
6eac492de0:    	sxtw	x23, w21  // guest 0x7028d, sampled 0
6eac492de4:    	add	x23, x23, x19  // guest 0x7028d, sampled 0
6eac492de8:    	mov	w24, #0x1               // =1  // guest 0x7028d, sampled 0
6eac492dec:    	strb	w24, [x23, #0x190]  // guest 0x7028d, sampled 0
6eac492df0:    	add	w21, w21, w24  // guest 0x7028d, sampled 0
6eac492df4:    	and	w21, w21, #0x7  // guest 0x7028d, sampled 0
6eac492df8:    	str	w21, [x19, #0x188]  // guest 0x7028d, sampled 0
6eac492dfc:    	ldr	w23, [x19, #0x54]  // guest 0x7028d, sampled 0
6eac492e00:    	strh	w23, [x19, #0x222]  // guest 0x7028d, sampled 0
6eac492e04:    	mov	w23, #0x28d             // =653  // guest 0x7028d, sampled 0
6eac492e08:    	movk	w23, #0x7, lsl #16  // guest 0x7028d, sampled 0
6eac492e0c:    	str	w23, [x19, #0x228]  // guest 0x7028d, sampled 0
6eac492e10:    	add	w23, w22, #0x3c  // guest 0x7028f, sampled 0
6eac492e14:    	mov	w25, w23  // guest 0x7028f, sampled 0
6eac492e18:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x7028f, sampled 0
6eac492e1c:    	and	x16, x16, x23, lsr #7  // guest 0x7028f, sampled 0
6eac492e20:    	add	x17, x17, x16  // guest 0x7028f, sampled 0
6eac492e24:    	ldp	x16, x17, [x17]  // guest 0x7028f, sampled 0
6eac492e28:    	and	w30, w23, #0xfffff003  // guest 0x7028f, sampled 0
6eac492e2c:    	cmp	w16, w30  // guest 0x7028f, sampled 0
6eac492e30:    	b.ne	0x6eac494cb0 <trace+0x2170>  // guest 0x7028f, sampled 0
6eac492e34:    	add	x30, x17, w23, uxtw  // guest 0x7028f, sampled 0
6eac492e38:    	ldapr	w2, [x30]  // guest 0x7028f, sampled 0
6eac492e3c:    	add	w23, w21, #0x7  // guest 0x7028f, sampled 0
6eac492e40:    	and	w23, w23, #0x7  // guest 0x7028f, sampled 0
6eac492e44:    	lsl	w23, w23, #4  // guest 0x7028f, sampled 0
6eac492e48:    	add	w23, w23, #0x1a0  // guest 0x7028f, sampled 0
6eac492e4c:    	sxtw	x23, w23  // guest 0x7028f, sampled 0
6eac492e50:    	add	x1, x23, x19  // guest 0x7028f, sampled 0
6eac492e54:    	mov	x0, x19  // guest 0x7028f, sampled 0
6eac492e58:    	adrp	x16, 0x6efc8aa000 <trace+0x50418000>  // guest 0x7028f, sampled 0
6eac492e5c:    	add	x16, x16, #0x484  // guest 0x7028f, sampled 0
6eac492e60:    	blr	x16  // guest 0x7028f, sampled 0
6eac492e64:    	sub	w21, w21, #0x1  // guest 0x7028f, sampled 0
6eac492e68:    	and	w21, w21, #0x7  // guest 0x7028f, sampled 0
6eac492e6c:    	str	w21, [x19, #0x188]  // guest 0x7028f, sampled 0
6eac492e70:    	sxtw	x23, w21  // guest 0x7028f, sampled 0
6eac492e74:    	add	x23, x23, x19  // guest 0x7028f, sampled 0
6eac492e78:    	strb	wzr, [x23, #0x190]  // guest 0x7028f, sampled 0
6eac492e7c:    	ldr	w23, [x19, #0x74]  // guest 0x7028f, sampled 0
6eac492e80:    	strh	w23, [x19, #0x224]  // guest 0x7028f, sampled 0
6eac492e84:    	str	w25, [x19, #0x230]  // guest 0x7028f, sampled 0
6eac492e88:    	ldr	w23, [x19, #0x54]  // guest 0x7028f, sampled 0
6eac492e8c:    	strh	w23, [x19, #0x222]  // guest 0x7028f, sampled 0
6eac492e90:    	mov	w23, #0x28f             // =655  // guest 0x7028f, sampled 0
6eac492e94:    	movk	w23, #0x7, lsl #16  // guest 0x7028f, sampled 0
6eac492e98:    	str	w23, [x19, #0x228]  // guest 0x7028f, sampled 0
6eac492e9c:    	add	w23, w22, #0x18  // guest 0x70292, sampled 0
6eac492ea0:    	mov	w25, w23  // guest 0x70292, sampled 0
6eac492ea4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x70292, sampled 0
6eac492ea8:    	and	x16, x16, x23, lsr #7  // guest 0x70292, sampled 0
6eac492eac:    	add	x17, x17, x16  // guest 0x70292, sampled 0
6eac492eb0:    	ldp	x16, x17, [x17]  // guest 0x70292, sampled 0
6eac492eb4:    	and	w30, w23, #0xfffff003  // guest 0x70292, sampled 0
6eac492eb8:    	cmp	w16, w30  // guest 0x70292, sampled 0
6eac492ebc:    	b.ne	0x6eac494cdc <trace+0x219c>  // guest 0x70292, sampled 0
6eac492ec0:    	add	x30, x17, w23, uxtw  // guest 0x70292, sampled 0
6eac492ec4:    	ldapr	w2, [x30]  // guest 0x70292, sampled 0
6eac492ec8:    	add	x1, x19, #0x258  // guest 0x70292, sampled 0
6eac492ecc:    	mov	x0, x19  // guest 0x70292, sampled 0
6eac492ed0:    	adrp	x16, 0x6efc8aa000 <trace+0x50418000>  // guest 0x70292, sampled 0
6eac492ed4:    	add	x16, x16, #0x484  // guest 0x70292, sampled 0
6eac492ed8:    	blr	x16  // guest 0x70292, sampled 0
6eac492edc:    	lsl	w23, w21, #4  // guest 0x70292, sampled 0
6eac492ee0:    	add	w23, w23, #0x1a0  // guest 0x70292, sampled 0
6eac492ee4:    	sxtw	x23, w23  // guest 0x70292, sampled 0
6eac492ee8:    	add	x1, x23, x19  // guest 0x70292, sampled 0
6eac492eec:    	add	x2, x19, #0x258  // guest 0x70292, sampled 0
6eac492ef0:    	mov	x0, x19  // guest 0x70292, sampled 0
6eac492ef4:    	adrp	x16, 0x6efc8ab000 <trace+0x50419000>  // guest 0x70292, sampled 0
6eac492ef8:    	add	x16, x16, #0xb4c  // guest 0x70292, sampled 0
6eac492efc:    	blr	x16  // guest 0x70292, sampled 0
6eac492f00:    	ldr	w23, [x19, #0x74]  // guest 0x70292, sampled 0
6eac492f04:    	strh	w23, [x19, #0x224]  // guest 0x70292, sampled 0
6eac492f08:    	str	w25, [x19, #0x230]  // guest 0x70292, sampled 0
6eac492f0c:    	ldr	w23, [x19, #0x54]  // guest 0x70292, sampled 0
6eac492f10:    	strh	w23, [x19, #0x222]  // guest 0x70292, sampled 0
6eac492f14:    	mov	w23, #0x292             // =658  // guest 0x70292, sampled 0
6eac492f18:    	movk	w23, #0x7, lsl #16  // guest 0x70292, sampled 0
6eac492f1c:    	str	w23, [x19, #0x228]  // guest 0x70292, sampled 0
6eac492f20:    	add	w23, w22, #0x38  // guest 0x70295, sampled 0
6eac492f24:    	mov	w25, w23  // guest 0x70295, sampled 0
6eac492f28:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x70295, sampled 0
6eac492f2c:    	and	x16, x16, x23, lsr #7  // guest 0x70295, sampled 0
6eac492f30:    	add	x17, x17, x16  // guest 0x70295, sampled 0
6eac492f34:    	ldp	x16, x17, [x17]  // guest 0x70295, sampled 0
6eac492f38:    	and	w30, w23, #0xfffff003  // guest 0x70295, sampled 0
6eac492f3c:    	cmp	w16, w30  // guest 0x70295, sampled 0
6eac492f40:    	b.ne	0x6eac494d08 <trace+0x21c8>  // guest 0x70295, sampled 0
6eac492f44:    	add	x30, x17, w23, uxtw  // guest 0x70295, sampled 0
6eac492f48:    	ldapr	w2, [x30]  // guest 0x70295, sampled 0
6eac492f4c:    	add	w23, w21, #0x7  // guest 0x70295, sampled 0
6eac492f50:    	and	w23, w23, #0x7  // guest 0x70295, sampled 0
6eac492f54:    	lsl	w23, w23, #4  // guest 0x70295, sampled 0
6eac492f58:    	add	w23, w23, #0x1a0  // guest 0x70295, sampled 0
6eac492f5c:    	sxtw	x23, w23  // guest 0x70295, sampled 0
6eac492f60:    	add	x1, x23, x19  // guest 0x70295, sampled 0
6eac492f64:    	mov	x0, x19  // guest 0x70295, sampled 0
6eac492f68:    	adrp	x16, 0x6efc8aa000 <trace+0x50418000>  // guest 0x70295, sampled 0
6eac492f6c:    	add	x16, x16, #0x484  // guest 0x70295, sampled 0
6eac492f70:    	blr	x16  // guest 0x70295, sampled 0
6eac492f74:    	sub	w21, w21, #0x1  // guest 0x70295, sampled 0
6eac492f78:    	and	w21, w21, #0x7  // guest 0x70295, sampled 0
6eac492f7c:    	str	w21, [x19, #0x188]  // guest 0x70295, sampled 0
6eac492f80:    	sxtw	x23, w21  // guest 0x70295, sampled 0
6eac492f84:    	add	x23, x23, x19  // guest 0x70295, sampled 0
6eac492f88:    	strb	wzr, [x23, #0x190]  // guest 0x70295, sampled 0
6eac492f8c:    	ldr	w23, [x19, #0x74]  // guest 0x70295, sampled 0
6eac492f90:    	strh	w23, [x19, #0x224]  // guest 0x70295, sampled 0
6eac492f94:    	str	w25, [x19, #0x230]  // guest 0x70295, sampled 0
6eac492f98:    	ldr	w23, [x19, #0x54]  // guest 0x70295, sampled 0
6eac492f9c:    	strh	w23, [x19, #0x222]  // guest 0x70295, sampled 0
6eac492fa0:    	mov	w23, #0x295             // =661  // guest 0x70295, sampled 0
6eac492fa4:    	movk	w23, #0x7, lsl #16  // guest 0x70295, sampled 0
6eac492fa8:    	str	w23, [x19, #0x228]  // guest 0x70295, sampled 0
6eac492fac:    	add	w23, w22, #0x1c  // guest 0x70298, sampled 0
6eac492fb0:    	mov	w25, w23  // guest 0x70298, sampled 0
6eac492fb4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x70298, sampled 0
6eac492fb8:    	and	x16, x16, x23, lsr #7  // guest 0x70298, sampled 0
6eac492fbc:    	add	x17, x17, x16  // guest 0x70298, sampled 0
6eac492fc0:    	ldp	x16, x17, [x17]  // guest 0x70298, sampled 0
6eac492fc4:    	and	w30, w23, #0xfffff003  // guest 0x70298, sampled 0
6eac492fc8:    	cmp	w16, w30  // guest 0x70298, sampled 0
6eac492fcc:    	b.ne	0x6eac494d34 <trace+0x21f4>  // guest 0x70298, sampled 0
6eac492fd0:    	add	x30, x17, w23, uxtw  // guest 0x70298, sampled 0
6eac492fd4:    	ldapr	w2, [x30]  // guest 0x70298, sampled 0
6eac492fd8:    	add	x1, x19, #0x258  // guest 0x70298, sampled 1
6eac492fdc:    	mov	x0, x19  // guest 0x70298, sampled 0
6eac492fe0:    	adrp	x16, 0x6efc8aa000 <trace+0x50418000>  // guest 0x70298, sampled 0
6eac492fe4:    	add	x16, x16, #0x484  // guest 0x70298, sampled 0
6eac492fe8:    	blr	x16  // guest 0x70298, sampled 0
6eac492fec:    	lsl	w23, w21, #4  // guest 0x70298, sampled 0
6eac492ff0:    	add	w23, w23, #0x1a0  // guest 0x70298, sampled 0
6eac492ff4:    	sxtw	x23, w23  // guest 0x70298, sampled 0
6eac492ff8:    	add	x1, x23, x19  // guest 0x70298, sampled 0
6eac492ffc:    	add	x2, x19, #0x258  // guest 0x70298, sampled 0
6eac493000:    	mov	x0, x19  // guest 0x70298, sampled 0
6eac493004:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x70298, sampled 0
6eac493008:    	add	x16, x16, #0xb4c  // guest 0x70298, sampled 0
6eac49300c:    	blr	x16  // guest 0x70298, sampled 0
6eac493010:    	ldr	w23, [x19, #0x74]  // guest 0x70298, sampled 0
6eac493014:    	strh	w23, [x19, #0x224]  // guest 0x70298, sampled 0
6eac493018:    	str	w25, [x19, #0x230]  // guest 0x70298, sampled 0
6eac49301c:    	ldr	w23, [x19, #0x54]  // guest 0x70298, sampled 0
6eac493020:    	strh	w23, [x19, #0x222]  // guest 0x70298, sampled 0
6eac493024:    	mov	w23, #0x298             // =664  // guest 0x70298, sampled 0
6eac493028:    	movk	w23, #0x7, lsl #16  // guest 0x70298, sampled 0
6eac49302c:    	str	w23, [x19, #0x228]  // guest 0x70298, sampled 0
6eac493030:    	add	w23, w21, w24  // guest 0x7029b, sampled 0
6eac493034:    	and	w23, w23, #0x7  // guest 0x7029b, sampled 0
6eac493038:    	lsl	w23, w23, #4  // guest 0x7029b, sampled 0
6eac49303c:    	add	w23, w23, #0x1a0  // guest 0x7029b, sampled 0
6eac493040:    	sxtw	x23, w23  // guest 0x7029b, sampled 0
6eac493044:    	add	x1, x23, x19  // guest 0x7029b, sampled 0
6eac493048:    	lsl	w23, w21, #4  // guest 0x7029b, sampled 0
6eac49304c:    	add	w23, w23, #0x1a0  // guest 0x7029b, sampled 0
6eac493050:    	sxtw	x23, w23  // guest 0x7029b, sampled 0
6eac493054:    	add	x2, x23, x19  // guest 0x7029b, sampled 0
6eac493058:    	mov	x0, x19  // guest 0x7029b, sampled 0
6eac49305c:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x7029b, sampled 0
6eac493060:    	add	x16, x16, #0xc20  // guest 0x7029b, sampled 0
6eac493064:    	blr	x16  // guest 0x7029b, sampled 0
6eac493068:    	sxtw	x23, w21  // guest 0x7029b, sampled 0
6eac49306c:    	add	x23, x23, x19  // guest 0x7029b, sampled 0
6eac493070:    	strb	w24, [x23, #0x190]  // guest 0x7029b, sampled 0
6eac493074:    	add	w21, w21, w24  // guest 0x7029b, sampled 0
6eac493078:    	and	w21, w21, #0x7  // guest 0x7029b, sampled 0
6eac49307c:    	str	w21, [x19, #0x188]  // guest 0x7029b, sampled 0
6eac493080:    	ldr	w23, [x19, #0x54]  // guest 0x7029b, sampled 0
6eac493084:    	strh	w23, [x19, #0x222]  // guest 0x7029b, sampled 0
6eac493088:    	mov	w23, #0x29b             // =667  // guest 0x7029b, sampled 0
6eac49308c:    	movk	w23, #0x7, lsl #16  // guest 0x7029b, sampled 0
6eac493090:    	str	w23, [x19, #0x228]  // guest 0x7029b, sampled 0
6eac493094:    	add	w23, w22, #0x2c  // guest 0x7029d, sampled 0
6eac493098:    	mov	w25, w23  // guest 0x7029d, sampled 0
6eac49309c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x7029d, sampled 0
6eac4930a0:    	and	x16, x16, x23, lsr #7  // guest 0x7029d, sampled 0
6eac4930a4:    	add	x17, x17, x16  // guest 0x7029d, sampled 0
6eac4930a8:    	ldp	x16, x17, [x17]  // guest 0x7029d, sampled 0
6eac4930ac:    	and	w30, w23, #0xfffff003  // guest 0x7029d, sampled 0
6eac4930b0:    	cmp	w16, w30  // guest 0x7029d, sampled 0
6eac4930b4:    	b.ne	0x6eac494d60 <trace+0x2220>  // guest 0x7029d, sampled 0
6eac4930b8:    	add	x30, x17, w23, uxtw  // guest 0x7029d, sampled 0
6eac4930bc:    	ldapr	w2, [x30]  // guest 0x7029d, sampled 0
6eac4930c0:    	add	w23, w21, #0x7  // guest 0x7029d, sampled 0
6eac4930c4:    	and	w23, w23, #0x7  // guest 0x7029d, sampled 0
6eac4930c8:    	lsl	w23, w23, #4  // guest 0x7029d, sampled 0
6eac4930cc:    	add	w23, w23, #0x1a0  // guest 0x7029d, sampled 0
6eac4930d0:    	sxtw	x23, w23  // guest 0x7029d, sampled 0
6eac4930d4:    	add	x1, x23, x19  // guest 0x7029d, sampled 0
6eac4930d8:    	mov	x0, x19  // guest 0x7029d, sampled 0
6eac4930dc:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x7029d, sampled 0
6eac4930e0:    	add	x16, x16, #0x484  // guest 0x7029d, sampled 0
6eac4930e4:    	blr	x16  // guest 0x7029d, sampled 0
6eac4930e8:    	sub	w21, w21, #0x1  // guest 0x7029d, sampled 0
6eac4930ec:    	and	w21, w21, #0x7  // guest 0x7029d, sampled 0
6eac4930f0:    	str	w21, [x19, #0x188]  // guest 0x7029d, sampled 0
6eac4930f4:    	sxtw	x23, w21  // guest 0x7029d, sampled 0
6eac4930f8:    	add	x23, x23, x19  // guest 0x7029d, sampled 0
6eac4930fc:    	strb	wzr, [x23, #0x190]  // guest 0x7029d, sampled 0
6eac493100:    	ldr	w23, [x19, #0x74]  // guest 0x7029d, sampled 0
6eac493104:    	strh	w23, [x19, #0x224]  // guest 0x7029d, sampled 0
6eac493108:    	str	w25, [x19, #0x230]  // guest 0x7029d, sampled 0
6eac49310c:    	ldr	w23, [x19, #0x54]  // guest 0x7029d, sampled 0
6eac493110:    	strh	w23, [x19, #0x222]  // guest 0x7029d, sampled 0
6eac493114:    	mov	w23, #0x29d             // =669  // guest 0x7029d, sampled 0
6eac493118:    	movk	w23, #0x7, lsl #16  // guest 0x7029d, sampled 0
6eac49311c:    	str	w23, [x19, #0x228]  // guest 0x7029d, sampled 0
6eac493120:    	add	w23, w22, #0x18  // guest 0x702a0, sampled 0
6eac493124:    	mov	w25, w23  // guest 0x702a0, sampled 0
6eac493128:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702a0, sampled 0
6eac49312c:    	and	x16, x16, x23, lsr #7  // guest 0x702a0, sampled 0
6eac493130:    	add	x17, x17, x16  // guest 0x702a0, sampled 0
6eac493134:    	ldp	x16, x17, [x17]  // guest 0x702a0, sampled 0
6eac493138:    	and	w30, w23, #0xfffff003  // guest 0x702a0, sampled 0
6eac49313c:    	cmp	w16, w30  // guest 0x702a0, sampled 0
6eac493140:    	b.ne	0x6eac494d8c <trace+0x224c>  // guest 0x702a0, sampled 0
6eac493144:    	add	x30, x17, w23, uxtw  // guest 0x702a0, sampled 0
6eac493148:    	ldapr	w2, [x30]  // guest 0x702a0, sampled 0
6eac49314c:    	add	x1, x19, #0x258  // guest 0x702a0, sampled 0
6eac493150:    	mov	x0, x19  // guest 0x702a0, sampled 0
6eac493154:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x702a0, sampled 0
6eac493158:    	add	x16, x16, #0x484  // guest 0x702a0, sampled 0
6eac49315c:    	blr	x16  // guest 0x702a0, sampled 0
6eac493160:    	lsl	w23, w21, #4  // guest 0x702a0, sampled 0
6eac493164:    	add	w23, w23, #0x1a0  // guest 0x702a0, sampled 0
6eac493168:    	sxtw	x23, w23  // guest 0x702a0, sampled 0
6eac49316c:    	add	x1, x23, x19  // guest 0x702a0, sampled 0
6eac493170:    	add	x2, x19, #0x258  // guest 0x702a0, sampled 0
6eac493174:    	mov	x0, x19  // guest 0x702a0, sampled 0
6eac493178:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x702a0, sampled 0
6eac49317c:    	add	x16, x16, #0xb4c  // guest 0x702a0, sampled 0
6eac493180:    	blr	x16  // guest 0x702a0, sampled 0
6eac493184:    	ldr	w23, [x19, #0x74]  // guest 0x702a0, sampled 0
6eac493188:    	strh	w23, [x19, #0x224]  // guest 0x702a0, sampled 0
6eac49318c:    	str	w25, [x19, #0x230]  // guest 0x702a0, sampled 0
6eac493190:    	ldr	w23, [x19, #0x54]  // guest 0x702a0, sampled 0
6eac493194:    	strh	w23, [x19, #0x222]  // guest 0x702a0, sampled 0
6eac493198:    	mov	w23, #0x2a0             // =672  // guest 0x702a0, sampled 0
6eac49319c:    	movk	w23, #0x7, lsl #16  // guest 0x702a0, sampled 0
6eac4931a0:    	str	w23, [x19, #0x228]  // guest 0x702a0, sampled 0
6eac4931a4:    	add	w23, w22, #0x28  // guest 0x702a3, sampled 0
6eac4931a8:    	mov	w25, w23  // guest 0x702a3, sampled 0
6eac4931ac:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702a3, sampled 0
6eac4931b0:    	and	x16, x16, x23, lsr #7  // guest 0x702a3, sampled 0
6eac4931b4:    	add	x17, x17, x16  // guest 0x702a3, sampled 0
6eac4931b8:    	ldp	x16, x17, [x17]  // guest 0x702a3, sampled 0
6eac4931bc:    	and	w30, w23, #0xfffff003  // guest 0x702a3, sampled 0
6eac4931c0:    	cmp	w16, w30  // guest 0x702a3, sampled 0
6eac4931c4:    	b.ne	0x6eac494db8 <trace+0x2278>  // guest 0x702a3, sampled 0
6eac4931c8:    	add	x30, x17, w23, uxtw  // guest 0x702a3, sampled 0
6eac4931cc:    	ldapr	w2, [x30]  // guest 0x702a3, sampled 0
6eac4931d0:    	add	w23, w21, #0x7  // guest 0x702a3, sampled 0
6eac4931d4:    	and	w23, w23, #0x7  // guest 0x702a3, sampled 0
6eac4931d8:    	lsl	w23, w23, #4  // guest 0x702a3, sampled 0
6eac4931dc:    	add	w23, w23, #0x1a0  // guest 0x702a3, sampled 0
6eac4931e0:    	sxtw	x23, w23  // guest 0x702a3, sampled 0
6eac4931e4:    	add	x1, x23, x19  // guest 0x702a3, sampled 0
6eac4931e8:    	mov	x0, x19  // guest 0x702a3, sampled 0
6eac4931ec:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x702a3, sampled 0
6eac4931f0:    	add	x16, x16, #0x484  // guest 0x702a3, sampled 0
6eac4931f4:    	blr	x16  // guest 0x702a3, sampled 0
6eac4931f8:    	sub	w21, w21, #0x1  // guest 0x702a3, sampled 0
6eac4931fc:    	and	w21, w21, #0x7  // guest 0x702a3, sampled 0
6eac493200:    	str	w21, [x19, #0x188]  // guest 0x702a3, sampled 0
6eac493204:    	sxtw	x23, w21  // guest 0x702a3, sampled 0
6eac493208:    	add	x23, x23, x19  // guest 0x702a3, sampled 0
6eac49320c:    	strb	wzr, [x23, #0x190]  // guest 0x702a3, sampled 0
6eac493210:    	ldr	w23, [x19, #0x74]  // guest 0x702a3, sampled 0
6eac493214:    	strh	w23, [x19, #0x224]  // guest 0x702a3, sampled 0
6eac493218:    	str	w25, [x19, #0x230]  // guest 0x702a3, sampled 0
6eac49321c:    	ldr	w23, [x19, #0x54]  // guest 0x702a3, sampled 0
6eac493220:    	strh	w23, [x19, #0x222]  // guest 0x702a3, sampled 0
6eac493224:    	mov	w23, #0x2a3             // =675  // guest 0x702a3, sampled 0
6eac493228:    	movk	w23, #0x7, lsl #16  // guest 0x702a3, sampled 0
6eac49322c:    	str	w23, [x19, #0x228]  // guest 0x702a3, sampled 0
6eac493230:    	add	w23, w22, #0x1c  // guest 0x702a6, sampled 0
6eac493234:    	mov	w25, w23  // guest 0x702a6, sampled 0
6eac493238:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702a6, sampled 0
6eac49323c:    	and	x16, x16, x23, lsr #7  // guest 0x702a6, sampled 0
6eac493240:    	add	x17, x17, x16  // guest 0x702a6, sampled 0
6eac493244:    	ldp	x16, x17, [x17]  // guest 0x702a6, sampled 0
6eac493248:    	and	w30, w23, #0xfffff003  // guest 0x702a6, sampled 0
6eac49324c:    	cmp	w16, w30  // guest 0x702a6, sampled 0
6eac493250:    	b.ne	0x6eac494de4 <trace+0x22a4>  // guest 0x702a6, sampled 0
6eac493254:    	add	x30, x17, w23, uxtw  // guest 0x702a6, sampled 0
6eac493258:    	ldapr	w2, [x30]  // guest 0x702a6, sampled 0
6eac49325c:    	add	x1, x19, #0x258  // guest 0x702a6, sampled 0
6eac493260:    	mov	x0, x19  // guest 0x702a6, sampled 0
6eac493264:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x702a6, sampled 0
6eac493268:    	add	x16, x16, #0x484  // guest 0x702a6, sampled 0
6eac49326c:    	blr	x16  // guest 0x702a6, sampled 0
6eac493270:    	lsl	w23, w21, #4  // guest 0x702a6, sampled 0
6eac493274:    	add	w23, w23, #0x1a0  // guest 0x702a6, sampled 0
6eac493278:    	sxtw	x23, w23  // guest 0x702a6, sampled 0
6eac49327c:    	add	x1, x23, x19  // guest 0x702a6, sampled 0
6eac493280:    	add	x2, x19, #0x258  // guest 0x702a6, sampled 0
6eac493284:    	mov	x0, x19  // guest 0x702a6, sampled 0
6eac493288:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x702a6, sampled 0
6eac49328c:    	add	x16, x16, #0xb4c  // guest 0x702a6, sampled 0
6eac493290:    	blr	x16  // guest 0x702a6, sampled 0
6eac493294:    	ldr	w23, [x19, #0x74]  // guest 0x702a6, sampled 0
6eac493298:    	strh	w23, [x19, #0x224]  // guest 0x702a6, sampled 0
6eac49329c:    	str	w25, [x19, #0x230]  // guest 0x702a6, sampled 0
6eac4932a0:    	ldr	w23, [x19, #0x54]  // guest 0x702a6, sampled 0
6eac4932a4:    	strh	w23, [x19, #0x222]  // guest 0x702a6, sampled 0
6eac4932a8:    	mov	w23, #0x2a6             // =678  // guest 0x702a6, sampled 0
6eac4932ac:    	movk	w23, #0x7, lsl #16  // guest 0x702a6, sampled 0
6eac4932b0:    	str	w23, [x19, #0x228]  // guest 0x702a6, sampled 0
6eac4932b4:    	add	w23, w21, w24  // guest 0x702a9, sampled 0
6eac4932b8:    	and	w23, w23, #0x7  // guest 0x702a9, sampled 0
6eac4932bc:    	lsl	w23, w23, #4  // guest 0x702a9, sampled 0
6eac4932c0:    	add	w23, w23, #0x1a0  // guest 0x702a9, sampled 0
6eac4932c4:    	sxtw	x23, w23  // guest 0x702a9, sampled 0
6eac4932c8:    	add	x1, x23, x19  // guest 0x702a9, sampled 0
6eac4932cc:    	lsl	w23, w21, #4  // guest 0x702a9, sampled 0
6eac4932d0:    	add	w23, w23, #0x1a0  // guest 0x702a9, sampled 0
6eac4932d4:    	sxtw	x23, w23  // guest 0x702a9, sampled 0
6eac4932d8:    	add	x2, x23, x19  // guest 0x702a9, sampled 0
6eac4932dc:    	mov	x0, x19  // guest 0x702a9, sampled 0
6eac4932e0:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x702a9, sampled 0
6eac4932e4:    	add	x16, x16, #0xc20  // guest 0x702a9, sampled 0
6eac4932e8:    	blr	x16  // guest 0x702a9, sampled 0
6eac4932ec:    	sxtw	x23, w21  // guest 0x702a9, sampled 0
6eac4932f0:    	add	x23, x23, x19  // guest 0x702a9, sampled 0
6eac4932f4:    	strb	w24, [x23, #0x190]  // guest 0x702a9, sampled 0
6eac4932f8:    	add	w21, w21, w24  // guest 0x702a9, sampled 0
6eac4932fc:    	and	w21, w21, #0x7  // guest 0x702a9, sampled 0
6eac493300:    	str	w21, [x19, #0x188]  // guest 0x702a9, sampled 0
6eac493304:    	ldr	w23, [x19, #0x54]  // guest 0x702a9, sampled 0
6eac493308:    	strh	w23, [x19, #0x222]  // guest 0x702a9, sampled 0
6eac49330c:    	mov	w23, #0x2a9             // =681  // guest 0x702a9, sampled 0
6eac493310:    	movk	w23, #0x7, lsl #16  // guest 0x702a9, sampled 0
6eac493314:    	str	w23, [x19, #0x228]  // guest 0x702a9, sampled 0
6eac493318:    	add	w23, w22, #0x3c  // guest 0x702ab, sampled 0
6eac49331c:    	mov	w25, w23  // guest 0x702ab, sampled 0
6eac493320:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702ab, sampled 0
6eac493324:    	and	x16, x16, x23, lsr #7  // guest 0x702ab, sampled 0
6eac493328:    	add	x17, x17, x16  // guest 0x702ab, sampled 0
6eac49332c:    	ldp	x16, x17, [x17]  // guest 0x702ab, sampled 0
6eac493330:    	and	w30, w23, #0xfffff003  // guest 0x702ab, sampled 0
6eac493334:    	cmp	w16, w30  // guest 0x702ab, sampled 0
6eac493338:    	b.ne	0x6eac494e10 <trace+0x22d0>  // guest 0x702ab, sampled 0
6eac49333c:    	add	x30, x17, w23, uxtw  // guest 0x702ab, sampled 0
6eac493340:    	ldapr	w2, [x30]  // guest 0x702ab, sampled 0
6eac493344:    	add	w23, w21, #0x7  // guest 0x702ab, sampled 0
6eac493348:    	and	w23, w23, #0x7  // guest 0x702ab, sampled 0
6eac49334c:    	lsl	w23, w23, #4  // guest 0x702ab, sampled 0
6eac493350:    	add	w23, w23, #0x1a0  // guest 0x702ab, sampled 0
6eac493354:    	sxtw	x23, w23  // guest 0x702ab, sampled 0
6eac493358:    	add	x1, x23, x19  // guest 0x702ab, sampled 0
6eac49335c:    	mov	x0, x19  // guest 0x702ab, sampled 0
6eac493360:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x702ab, sampled 0
6eac493364:    	add	x16, x16, #0x484  // guest 0x702ab, sampled 0
6eac493368:    	blr	x16  // guest 0x702ab, sampled 0
6eac49336c:    	sub	w21, w21, #0x1  // guest 0x702ab, sampled 0
6eac493370:    	and	w21, w21, #0x7  // guest 0x702ab, sampled 0
6eac493374:    	str	w21, [x19, #0x188]  // guest 0x702ab, sampled 0
6eac493378:    	sxtw	x23, w21  // guest 0x702ab, sampled 0
6eac49337c:    	add	x23, x23, x19  // guest 0x702ab, sampled 0
6eac493380:    	strb	wzr, [x23, #0x190]  // guest 0x702ab, sampled 0
6eac493384:    	ldr	w23, [x19, #0x74]  // guest 0x702ab, sampled 0
6eac493388:    	strh	w23, [x19, #0x224]  // guest 0x702ab, sampled 0
6eac49338c:    	str	w25, [x19, #0x230]  // guest 0x702ab, sampled 0
6eac493390:    	ldr	w23, [x19, #0x54]  // guest 0x702ab, sampled 0
6eac493394:    	strh	w23, [x19, #0x222]  // guest 0x702ab, sampled 0
6eac493398:    	mov	w23, #0x2ab             // =683  // guest 0x702ab, sampled 0
6eac49339c:    	movk	w23, #0x7, lsl #16  // guest 0x702ab, sampled 0
6eac4933a0:    	str	w23, [x19, #0x228]  // guest 0x702ab, sampled 0
6eac4933a4:    	add	w23, w22, #0x8  // guest 0x702ae, sampled 0
6eac4933a8:    	mov	w25, w23  // guest 0x702ae, sampled 0
6eac4933ac:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702ae, sampled 0
6eac4933b0:    	and	x16, x16, x23, lsr #7  // guest 0x702ae, sampled 0
6eac4933b4:    	add	x17, x17, x16  // guest 0x702ae, sampled 0
6eac4933b8:    	ldp	x16, x17, [x17]  // guest 0x702ae, sampled 0
6eac4933bc:    	and	w30, w23, #0xfffff003  // guest 0x702ae, sampled 0
6eac4933c0:    	cmp	w16, w30  // guest 0x702ae, sampled 0
6eac4933c4:    	b.ne	0x6eac494e3c <trace+0x22fc>  // guest 0x702ae, sampled 0
6eac4933c8:    	add	x30, x17, w23, uxtw  // guest 0x702ae, sampled 0
6eac4933cc:    	ldapr	w2, [x30]  // guest 0x702ae, sampled 0
6eac4933d0:    	add	x1, x19, #0x258  // guest 0x702ae, sampled 0
6eac4933d4:    	mov	x0, x19  // guest 0x702ae, sampled 0
6eac4933d8:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x702ae, sampled 0
6eac4933dc:    	add	x16, x16, #0x484  // guest 0x702ae, sampled 0
6eac4933e0:    	blr	x16  // guest 0x702ae, sampled 0
6eac4933e4:    	lsl	w23, w21, #4  // guest 0x702ae, sampled 0
6eac4933e8:    	add	w23, w23, #0x1a0  // guest 0x702ae, sampled 0
6eac4933ec:    	sxtw	x23, w23  // guest 0x702ae, sampled 0
6eac4933f0:    	add	x1, x23, x19  // guest 0x702ae, sampled 0
6eac4933f4:    	add	x2, x19, #0x258  // guest 0x702ae, sampled 0
6eac4933f8:    	mov	x0, x19  // guest 0x702ae, sampled 0
6eac4933fc:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x702ae, sampled 0
6eac493400:    	add	x16, x16, #0xb4c  // guest 0x702ae, sampled 0
6eac493404:    	blr	x16  // guest 0x702ae, sampled 0
6eac493408:    	ldr	w23, [x19, #0x74]  // guest 0x702ae, sampled 0
6eac49340c:    	strh	w23, [x19, #0x224]  // guest 0x702ae, sampled 0
6eac493410:    	str	w25, [x19, #0x230]  // guest 0x702ae, sampled 0
6eac493414:    	ldr	w23, [x19, #0x54]  // guest 0x702ae, sampled 0
6eac493418:    	strh	w23, [x19, #0x222]  // guest 0x702ae, sampled 0
6eac49341c:    	mov	w23, #0x2ae             // =686  // guest 0x702ae, sampled 0
6eac493420:    	movk	w23, #0x7, lsl #16  // guest 0x702ae, sampled 0
6eac493424:    	str	w23, [x19, #0x228]  // guest 0x702ae, sampled 0
6eac493428:    	add	w23, w22, #0x38  // guest 0x702b1, sampled 0
6eac49342c:    	mov	w25, w23  // guest 0x702b1, sampled 0
6eac493430:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702b1, sampled 0
6eac493434:    	and	x16, x16, x23, lsr #7  // guest 0x702b1, sampled 0
6eac493438:    	add	x17, x17, x16  // guest 0x702b1, sampled 0
6eac49343c:    	ldp	x16, x17, [x17]  // guest 0x702b1, sampled 0
6eac493440:    	and	w30, w23, #0xfffff003  // guest 0x702b1, sampled 0
6eac493444:    	cmp	w16, w30  // guest 0x702b1, sampled 0
6eac493448:    	b.ne	0x6eac494e68 <trace+0x2328>  // guest 0x702b1, sampled 0
6eac49344c:    	add	x30, x17, w23, uxtw  // guest 0x702b1, sampled 0
6eac493450:    	ldapr	w2, [x30]  // guest 0x702b1, sampled 0
6eac493454:    	add	w23, w21, #0x7  // guest 0x702b1, sampled 0
6eac493458:    	and	w23, w23, #0x7  // guest 0x702b1, sampled 0
6eac49345c:    	lsl	w23, w23, #4  // guest 0x702b1, sampled 0
6eac493460:    	add	w23, w23, #0x1a0  // guest 0x702b1, sampled 0
6eac493464:    	sxtw	x23, w23  // guest 0x702b1, sampled 0
6eac493468:    	add	x1, x23, x19  // guest 0x702b1, sampled 0
6eac49346c:    	mov	x0, x19  // guest 0x702b1, sampled 0
6eac493470:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x702b1, sampled 0
6eac493474:    	add	x16, x16, #0x484  // guest 0x702b1, sampled 0
6eac493478:    	blr	x16  // guest 0x702b1, sampled 0
6eac49347c:    	sub	w21, w21, #0x1  // guest 0x702b1, sampled 0
6eac493480:    	and	w21, w21, #0x7  // guest 0x702b1, sampled 0
6eac493484:    	str	w21, [x19, #0x188]  // guest 0x702b1, sampled 0
6eac493488:    	sxtw	x23, w21  // guest 0x702b1, sampled 0
6eac49348c:    	add	x23, x23, x19  // guest 0x702b1, sampled 0
6eac493490:    	strb	wzr, [x23, #0x190]  // guest 0x702b1, sampled 0
6eac493494:    	ldr	w23, [x19, #0x74]  // guest 0x702b1, sampled 1
6eac493498:    	strh	w23, [x19, #0x224]  // guest 0x702b1, sampled 0
6eac49349c:    	str	w25, [x19, #0x230]  // guest 0x702b1, sampled 0
6eac4934a0:    	ldr	w23, [x19, #0x54]  // guest 0x702b1, sampled 0
6eac4934a4:    	strh	w23, [x19, #0x222]  // guest 0x702b1, sampled 1
6eac4934a8:    	mov	w23, #0x2b1             // =689  // guest 0x702b1, sampled 0
6eac4934ac:    	movk	w23, #0x7, lsl #16  // guest 0x702b1, sampled 0
6eac4934b0:    	str	w23, [x19, #0x228]  // guest 0x702b1, sampled 0
6eac4934b4:    	add	w23, w22, #0xc  // guest 0x702b4, sampled 0
6eac4934b8:    	mov	w25, w23  // guest 0x702b4, sampled 0
6eac4934bc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702b4, sampled 0
6eac4934c0:    	and	x16, x16, x23, lsr #7  // guest 0x702b4, sampled 0
6eac4934c4:    	add	x17, x17, x16  // guest 0x702b4, sampled 0
6eac4934c8:    	ldp	x16, x17, [x17]  // guest 0x702b4, sampled 0
6eac4934cc:    	and	w30, w23, #0xfffff003  // guest 0x702b4, sampled 0
6eac4934d0:    	cmp	w16, w30  // guest 0x702b4, sampled 0
6eac4934d4:    	b.ne	0x6eac494e94 <trace+0x2354>  // guest 0x702b4, sampled 0
6eac4934d8:    	add	x30, x17, w23, uxtw  // guest 0x702b4, sampled 0
6eac4934dc:    	ldapr	w2, [x30]  // guest 0x702b4, sampled 0
6eac4934e0:    	add	x1, x19, #0x258  // guest 0x702b4, sampled 0
6eac4934e4:    	mov	x0, x19  // guest 0x702b4, sampled 0
6eac4934e8:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x702b4, sampled 0
6eac4934ec:    	add	x16, x16, #0x484  // guest 0x702b4, sampled 0
6eac4934f0:    	blr	x16  // guest 0x702b4, sampled 0
6eac4934f4:    	lsl	w23, w21, #4  // guest 0x702b4, sampled 0
6eac4934f8:    	add	w23, w23, #0x1a0  // guest 0x702b4, sampled 0
6eac4934fc:    	sxtw	x23, w23  // guest 0x702b4, sampled 0
6eac493500:    	add	x1, x23, x19  // guest 0x702b4, sampled 0
6eac493504:    	add	x2, x19, #0x258  // guest 0x702b4, sampled 0
6eac493508:    	mov	x0, x19  // guest 0x702b4, sampled 0
6eac49350c:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x702b4, sampled 0
6eac493510:    	add	x16, x16, #0xb4c  // guest 0x702b4, sampled 0
6eac493514:    	blr	x16  // guest 0x702b4, sampled 0
6eac493518:    	ldr	w23, [x19, #0x74]  // guest 0x702b4, sampled 0
6eac49351c:    	strh	w23, [x19, #0x224]  // guest 0x702b4, sampled 0
6eac493520:    	str	w25, [x19, #0x230]  // guest 0x702b4, sampled 0
6eac493524:    	ldr	w23, [x19, #0x54]  // guest 0x702b4, sampled 0
6eac493528:    	strh	w23, [x19, #0x222]  // guest 0x702b4, sampled 0
6eac49352c:    	mov	w23, #0x2b4             // =692  // guest 0x702b4, sampled 0
6eac493530:    	movk	w23, #0x7, lsl #16  // guest 0x702b4, sampled 0
6eac493534:    	str	w23, [x19, #0x228]  // guest 0x702b4, sampled 0
6eac493538:    	add	w23, w21, w24  // guest 0x702b7, sampled 0
6eac49353c:    	and	w23, w23, #0x7  // guest 0x702b7, sampled 0
6eac493540:    	lsl	w23, w23, #4  // guest 0x702b7, sampled 0
6eac493544:    	add	w23, w23, #0x1a0  // guest 0x702b7, sampled 0
6eac493548:    	sxtw	x23, w23  // guest 0x702b7, sampled 0
6eac49354c:    	add	x1, x23, x19  // guest 0x702b7, sampled 0
6eac493550:    	lsl	w23, w21, #4  // guest 0x702b7, sampled 0
6eac493554:    	add	w23, w23, #0x1a0  // guest 0x702b7, sampled 0
6eac493558:    	sxtw	x23, w23  // guest 0x702b7, sampled 0
6eac49355c:    	add	x2, x23, x19  // guest 0x702b7, sampled 0
6eac493560:    	mov	x0, x19  // guest 0x702b7, sampled 0
6eac493564:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x702b7, sampled 0
6eac493568:    	add	x16, x16, #0xc20  // guest 0x702b7, sampled 0
6eac49356c:    	blr	x16  // guest 0x702b7, sampled 0
6eac493570:    	sxtw	x23, w21  // guest 0x702b7, sampled 0
6eac493574:    	add	x23, x23, x19  // guest 0x702b7, sampled 0
6eac493578:    	strb	w24, [x23, #0x190]  // guest 0x702b7, sampled 0
6eac49357c:    	add	w21, w21, w24  // guest 0x702b7, sampled 0
6eac493580:    	and	w21, w21, #0x7  // guest 0x702b7, sampled 0
6eac493584:    	str	w21, [x19, #0x188]  // guest 0x702b7, sampled 0
6eac493588:    	ldr	w23, [x19, #0x54]  // guest 0x702b7, sampled 0
6eac49358c:    	strh	w23, [x19, #0x222]  // guest 0x702b7, sampled 0
6eac493590:    	mov	w23, #0x2b7             // =695  // guest 0x702b7, sampled 0
6eac493594:    	movk	w23, #0x7, lsl #16  // guest 0x702b7, sampled 0
6eac493598:    	str	w23, [x19, #0x228]  // guest 0x702b7, sampled 0
6eac49359c:    	add	w23, w22, #0x2c  // guest 0x702b9, sampled 0
6eac4935a0:    	mov	w25, w23  // guest 0x702b9, sampled 0
6eac4935a4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702b9, sampled 0
6eac4935a8:    	and	x16, x16, x23, lsr #7  // guest 0x702b9, sampled 0
6eac4935ac:    	add	x17, x17, x16  // guest 0x702b9, sampled 0
6eac4935b0:    	ldp	x16, x17, [x17]  // guest 0x702b9, sampled 0
6eac4935b4:    	and	w30, w23, #0xfffff003  // guest 0x702b9, sampled 0
6eac4935b8:    	cmp	w16, w30  // guest 0x702b9, sampled 0
6eac4935bc:    	b.ne	0x6eac494ec0 <trace+0x2380>  // guest 0x702b9, sampled 0
6eac4935c0:    	add	x30, x17, w23, uxtw  // guest 0x702b9, sampled 0
6eac4935c4:    	ldapr	w2, [x30]  // guest 0x702b9, sampled 0
6eac4935c8:    	add	w23, w21, #0x7  // guest 0x702b9, sampled 0
6eac4935cc:    	and	w23, w23, #0x7  // guest 0x702b9, sampled 0
6eac4935d0:    	lsl	w23, w23, #4  // guest 0x702b9, sampled 0
6eac4935d4:    	add	w23, w23, #0x1a0  // guest 0x702b9, sampled 0
6eac4935d8:    	sxtw	x23, w23  // guest 0x702b9, sampled 0
6eac4935dc:    	add	x1, x23, x19  // guest 0x702b9, sampled 0
6eac4935e0:    	mov	x0, x19  // guest 0x702b9, sampled 0
6eac4935e4:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x702b9, sampled 0
6eac4935e8:    	add	x16, x16, #0x484  // guest 0x702b9, sampled 0
6eac4935ec:    	blr	x16  // guest 0x702b9, sampled 0
6eac4935f0:    	sub	w21, w21, #0x1  // guest 0x702b9, sampled 0
6eac4935f4:    	and	w21, w21, #0x7  // guest 0x702b9, sampled 0
6eac4935f8:    	str	w21, [x19, #0x188]  // guest 0x702b9, sampled 0
6eac4935fc:    	sxtw	x23, w21  // guest 0x702b9, sampled 0
6eac493600:    	add	x23, x23, x19  // guest 0x702b9, sampled 0
6eac493604:    	strb	wzr, [x23, #0x190]  // guest 0x702b9, sampled 0
6eac493608:    	ldr	w23, [x19, #0x74]  // guest 0x702b9, sampled 0
6eac49360c:    	strh	w23, [x19, #0x224]  // guest 0x702b9, sampled 0
6eac493610:    	str	w25, [x19, #0x230]  // guest 0x702b9, sampled 0
6eac493614:    	ldr	w23, [x19, #0x54]  // guest 0x702b9, sampled 0
6eac493618:    	strh	w23, [x19, #0x222]  // guest 0x702b9, sampled 0
6eac49361c:    	mov	w23, #0x2b9             // =697  // guest 0x702b9, sampled 0
6eac493620:    	movk	w23, #0x7, lsl #16  // guest 0x702b9, sampled 0
6eac493624:    	str	w23, [x19, #0x228]  // guest 0x702b9, sampled 0
6eac493628:    	add	w23, w22, #0x8  // guest 0x702bc, sampled 0
6eac49362c:    	mov	w25, w23  // guest 0x702bc, sampled 0
6eac493630:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702bc, sampled 0
6eac493634:    	and	x16, x16, x23, lsr #7  // guest 0x702bc, sampled 1
6eac493638:    	add	x17, x17, x16  // guest 0x702bc, sampled 0
6eac49363c:    	ldp	x16, x17, [x17]  // guest 0x702bc, sampled 0
6eac493640:    	and	w30, w23, #0xfffff003  // guest 0x702bc, sampled 0
6eac493644:    	cmp	w16, w30  // guest 0x702bc, sampled 0
6eac493648:    	b.ne	0x6eac494eec <trace+0x23ac>  // guest 0x702bc, sampled 0
6eac49364c:    	add	x30, x17, w23, uxtw  // guest 0x702bc, sampled 0
6eac493650:    	ldapr	w2, [x30]  // guest 0x702bc, sampled 0
6eac493654:    	add	x1, x19, #0x258  // guest 0x702bc, sampled 0
6eac493658:    	mov	x0, x19  // guest 0x702bc, sampled 0
6eac49365c:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x702bc, sampled 0
6eac493660:    	add	x16, x16, #0x484  // guest 0x702bc, sampled 0
6eac493664:    	blr	x16  // guest 0x702bc, sampled 0
6eac493668:    	lsl	w23, w21, #4  // guest 0x702bc, sampled 0
6eac49366c:    	add	w23, w23, #0x1a0  // guest 0x702bc, sampled 0
6eac493670:    	sxtw	x23, w23  // guest 0x702bc, sampled 0
6eac493674:    	add	x1, x23, x19  // guest 0x702bc, sampled 0
6eac493678:    	add	x2, x19, #0x258  // guest 0x702bc, sampled 0
6eac49367c:    	mov	x0, x19  // guest 0x702bc, sampled 0
6eac493680:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x702bc, sampled 0
6eac493684:    	add	x16, x16, #0xb4c  // guest 0x702bc, sampled 0
6eac493688:    	blr	x16  // guest 0x702bc, sampled 0
6eac49368c:    	ldr	w23, [x19, #0x74]  // guest 0x702bc, sampled 0
6eac493690:    	strh	w23, [x19, #0x224]  // guest 0x702bc, sampled 0
6eac493694:    	str	w25, [x19, #0x230]  // guest 0x702bc, sampled 0
6eac493698:    	ldr	w23, [x19, #0x54]  // guest 0x702bc, sampled 0
6eac49369c:    	strh	w23, [x19, #0x222]  // guest 0x702bc, sampled 0
6eac4936a0:    	mov	w23, #0x2bc             // =700  // guest 0x702bc, sampled 0
6eac4936a4:    	movk	w23, #0x7, lsl #16  // guest 0x702bc, sampled 0
6eac4936a8:    	str	w23, [x19, #0x228]  // guest 0x702bc, sampled 0
6eac4936ac:    	add	w23, w22, #0x28  // guest 0x702bf, sampled 0
6eac4936b0:    	mov	w25, w23  // guest 0x702bf, sampled 0
6eac4936b4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702bf, sampled 0
6eac4936b8:    	and	x16, x16, x23, lsr #7  // guest 0x702bf, sampled 0
6eac4936bc:    	add	x17, x17, x16  // guest 0x702bf, sampled 0
6eac4936c0:    	ldp	x16, x17, [x17]  // guest 0x702bf, sampled 0
6eac4936c4:    	and	w30, w23, #0xfffff003  // guest 0x702bf, sampled 0
6eac4936c8:    	cmp	w16, w30  // guest 0x702bf, sampled 0
6eac4936cc:    	b.ne	0x6eac494f18 <trace+0x23d8>  // guest 0x702bf, sampled 0
6eac4936d0:    	add	x30, x17, w23, uxtw  // guest 0x702bf, sampled 0
6eac4936d4:    	ldapr	w2, [x30]  // guest 0x702bf, sampled 0
6eac4936d8:    	add	w23, w21, #0x7  // guest 0x702bf, sampled 0
6eac4936dc:    	and	w23, w23, #0x7  // guest 0x702bf, sampled 0
6eac4936e0:    	lsl	w23, w23, #4  // guest 0x702bf, sampled 0
6eac4936e4:    	add	w23, w23, #0x1a0  // guest 0x702bf, sampled 0
6eac4936e8:    	sxtw	x23, w23  // guest 0x702bf, sampled 0
6eac4936ec:    	add	x1, x23, x19  // guest 0x702bf, sampled 0
6eac4936f0:    	mov	x0, x19  // guest 0x702bf, sampled 0
6eac4936f4:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x702bf, sampled 0
6eac4936f8:    	add	x16, x16, #0x484  // guest 0x702bf, sampled 0
6eac4936fc:    	blr	x16  // guest 0x702bf, sampled 0
6eac493700:    	sub	w21, w21, #0x1  // guest 0x702bf, sampled 0
6eac493704:    	and	w21, w21, #0x7  // guest 0x702bf, sampled 0
6eac493708:    	str	w21, [x19, #0x188]  // guest 0x702bf, sampled 0
6eac49370c:    	sxtw	x23, w21  // guest 0x702bf, sampled 0
6eac493710:    	add	x23, x23, x19  // guest 0x702bf, sampled 0
6eac493714:    	strb	wzr, [x23, #0x190]  // guest 0x702bf, sampled 0
6eac493718:    	ldr	w23, [x19, #0x74]  // guest 0x702bf, sampled 0
6eac49371c:    	strh	w23, [x19, #0x224]  // guest 0x702bf, sampled 0
6eac493720:    	str	w25, [x19, #0x230]  // guest 0x702bf, sampled 0
6eac493724:    	ldr	w23, [x19, #0x54]  // guest 0x702bf, sampled 0
6eac493728:    	strh	w23, [x19, #0x222]  // guest 0x702bf, sampled 0
6eac49372c:    	mov	w23, #0x2bf             // =703  // guest 0x702bf, sampled 0
6eac493730:    	movk	w23, #0x7, lsl #16  // guest 0x702bf, sampled 0
6eac493734:    	str	w23, [x19, #0x228]  // guest 0x702bf, sampled 0
6eac493738:    	add	w23, w22, #0xc  // guest 0x702c2, sampled 0
6eac49373c:    	mov	w25, w23  // guest 0x702c2, sampled 0
6eac493740:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702c2, sampled 0
6eac493744:    	and	x16, x16, x23, lsr #7  // guest 0x702c2, sampled 0
6eac493748:    	add	x17, x17, x16  // guest 0x702c2, sampled 0
6eac49374c:    	ldp	x16, x17, [x17]  // guest 0x702c2, sampled 0
6eac493750:    	and	w30, w23, #0xfffff003  // guest 0x702c2, sampled 0
6eac493754:    	cmp	w16, w30  // guest 0x702c2, sampled 0
6eac493758:    	b.ne	0x6eac494f44 <trace+0x2404>  // guest 0x702c2, sampled 0
6eac49375c:    	add	x30, x17, w23, uxtw  // guest 0x702c2, sampled 0
6eac493760:    	ldapr	w2, [x30]  // guest 0x702c2, sampled 0
6eac493764:    	add	x1, x19, #0x258  // guest 0x702c2, sampled 0
6eac493768:    	mov	x0, x19  // guest 0x702c2, sampled 0
6eac49376c:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x702c2, sampled 0
6eac493770:    	add	x16, x16, #0x484  // guest 0x702c2, sampled 0
6eac493774:    	blr	x16  // guest 0x702c2, sampled 0
6eac493778:    	lsl	w23, w21, #4  // guest 0x702c2, sampled 0
6eac49377c:    	add	w23, w23, #0x1a0  // guest 0x702c2, sampled 0
6eac493780:    	sxtw	x23, w23  // guest 0x702c2, sampled 0
6eac493784:    	add	x1, x23, x19  // guest 0x702c2, sampled 0
6eac493788:    	add	x2, x19, #0x258  // guest 0x702c2, sampled 0
6eac49378c:    	mov	x0, x19  // guest 0x702c2, sampled 0
6eac493790:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x702c2, sampled 0
6eac493794:    	add	x16, x16, #0xb4c  // guest 0x702c2, sampled 0
6eac493798:    	blr	x16  // guest 0x702c2, sampled 0
6eac49379c:    	ldr	w23, [x19, #0x74]  // guest 0x702c2, sampled 0
6eac4937a0:    	strh	w23, [x19, #0x224]  // guest 0x702c2, sampled 0
6eac4937a4:    	str	w25, [x19, #0x230]  // guest 0x702c2, sampled 0
6eac4937a8:    	ldr	w23, [x19, #0x54]  // guest 0x702c2, sampled 0
6eac4937ac:    	strh	w23, [x19, #0x222]  // guest 0x702c2, sampled 0
6eac4937b0:    	mov	w23, #0x2c2             // =706  // guest 0x702c2, sampled 0
6eac4937b4:    	movk	w23, #0x7, lsl #16  // guest 0x702c2, sampled 0
6eac4937b8:    	str	w23, [x19, #0x228]  // guest 0x702c2, sampled 0
6eac4937bc:    	add	w23, w21, w24  // guest 0x702c5, sampled 0
6eac4937c0:    	and	w23, w23, #0x7  // guest 0x702c5, sampled 0
6eac4937c4:    	lsl	w23, w23, #4  // guest 0x702c5, sampled 0
6eac4937c8:    	add	w23, w23, #0x1a0  // guest 0x702c5, sampled 0
6eac4937cc:    	sxtw	x23, w23  // guest 0x702c5, sampled 0
6eac4937d0:    	add	x1, x23, x19  // guest 0x702c5, sampled 0
6eac4937d4:    	lsl	w23, w21, #4  // guest 0x702c5, sampled 0
6eac4937d8:    	add	w23, w23, #0x1a0  // guest 0x702c5, sampled 0
6eac4937dc:    	sxtw	x23, w23  // guest 0x702c5, sampled 0
6eac4937e0:    	add	x2, x23, x19  // guest 0x702c5, sampled 0
6eac4937e4:    	mov	x0, x19  // guest 0x702c5, sampled 0
6eac4937e8:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x702c5, sampled 0
6eac4937ec:    	add	x16, x16, #0xc20  // guest 0x702c5, sampled 0
6eac4937f0:    	blr	x16  // guest 0x702c5, sampled 0
6eac4937f4:    	sxtw	x23, w21  // guest 0x702c5, sampled 0
6eac4937f8:    	add	x23, x23, x19  // guest 0x702c5, sampled 0
6eac4937fc:    	strb	w24, [x23, #0x190]  // guest 0x702c5, sampled 0
6eac493800:    	add	w21, w21, w24  // guest 0x702c5, sampled 1
6eac493804:    	and	w21, w21, #0x7  // guest 0x702c5, sampled 0
6eac493808:    	str	w21, [x19, #0x188]  // guest 0x702c5, sampled 0
6eac49380c:    	ldr	w23, [x19, #0x54]  // guest 0x702c5, sampled 0
6eac493810:    	strh	w23, [x19, #0x222]  // guest 0x702c5, sampled 0
6eac493814:    	mov	w23, #0x2c5             // =709  // guest 0x702c5, sampled 0
6eac493818:    	movk	w23, #0x7, lsl #16  // guest 0x702c5, sampled 0
6eac49381c:    	str	w23, [x19, #0x228]  // guest 0x702c5, sampled 0
6eac493820:    	add	w23, w22, #0x1c  // guest 0x702c7, sampled 0
6eac493824:    	mov	w25, w23  // guest 0x702c7, sampled 0
6eac493828:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702c7, sampled 0
6eac49382c:    	and	x16, x16, x23, lsr #7  // guest 0x702c7, sampled 0
6eac493830:    	add	x17, x17, x16  // guest 0x702c7, sampled 0
6eac493834:    	ldp	x16, x17, [x17]  // guest 0x702c7, sampled 0
6eac493838:    	and	w30, w23, #0xfffff003  // guest 0x702c7, sampled 0
6eac49383c:    	cmp	w16, w30  // guest 0x702c7, sampled 0
6eac493840:    	b.ne	0x6eac494f70 <trace+0x2430>  // guest 0x702c7, sampled 0
6eac493844:    	add	x30, x17, w23, uxtw  // guest 0x702c7, sampled 0
6eac493848:    	ldapr	w2, [x30]  // guest 0x702c7, sampled 0
6eac49384c:    	add	w23, w21, #0x7  // guest 0x702c7, sampled 0
6eac493850:    	and	w23, w23, #0x7  // guest 0x702c7, sampled 0
6eac493854:    	lsl	w23, w23, #4  // guest 0x702c7, sampled 0
6eac493858:    	add	w23, w23, #0x1a0  // guest 0x702c7, sampled 0
6eac49385c:    	sxtw	x23, w23  // guest 0x702c7, sampled 0
6eac493860:    	add	x1, x23, x19  // guest 0x702c7, sampled 0
6eac493864:    	mov	x0, x19  // guest 0x702c7, sampled 0
6eac493868:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x702c7, sampled 0
6eac49386c:    	add	x16, x16, #0x484  // guest 0x702c7, sampled 0
6eac493870:    	blr	x16  // guest 0x702c7, sampled 0
6eac493874:    	sub	w21, w21, #0x1  // guest 0x702c7, sampled 0
6eac493878:    	and	w21, w21, #0x7  // guest 0x702c7, sampled 0
6eac49387c:    	str	w21, [x19, #0x188]  // guest 0x702c7, sampled 0
6eac493880:    	sxtw	x23, w21  // guest 0x702c7, sampled 0
6eac493884:    	add	x23, x23, x19  // guest 0x702c7, sampled 0
6eac493888:    	strb	wzr, [x23, #0x190]  // guest 0x702c7, sampled 0
6eac49388c:    	ldr	w23, [x19, #0x74]  // guest 0x702c7, sampled 0
6eac493890:    	strh	w23, [x19, #0x224]  // guest 0x702c7, sampled 0
6eac493894:    	str	w25, [x19, #0x230]  // guest 0x702c7, sampled 0
6eac493898:    	ldr	w23, [x19, #0x54]  // guest 0x702c7, sampled 0
6eac49389c:    	strh	w23, [x19, #0x222]  // guest 0x702c7, sampled 0
6eac4938a0:    	mov	w23, #0x2c7             // =711  // guest 0x702c7, sampled 0
6eac4938a4:    	movk	w23, #0x7, lsl #16  // guest 0x702c7, sampled 0
6eac4938a8:    	str	w23, [x19, #0x228]  // guest 0x702c7, sampled 0
6eac4938ac:    	add	w23, w22, #0x8  // guest 0x702ca, sampled 0
6eac4938b0:    	mov	w25, w23  // guest 0x702ca, sampled 0
6eac4938b4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702ca, sampled 0
6eac4938b8:    	and	x16, x16, x23, lsr #7  // guest 0x702ca, sampled 0
6eac4938bc:    	add	x17, x17, x16  // guest 0x702ca, sampled 0
6eac4938c0:    	ldp	x16, x17, [x17]  // guest 0x702ca, sampled 0
6eac4938c4:    	and	w30, w23, #0xfffff003  // guest 0x702ca, sampled 0
6eac4938c8:    	cmp	w16, w30  // guest 0x702ca, sampled 0
6eac4938cc:    	b.ne	0x6eac494f9c <trace+0x245c>  // guest 0x702ca, sampled 0
6eac4938d0:    	add	x30, x17, w23, uxtw  // guest 0x702ca, sampled 0
6eac4938d4:    	ldapr	w2, [x30]  // guest 0x702ca, sampled 0
6eac4938d8:    	add	x1, x19, #0x258  // guest 0x702ca, sampled 0
6eac4938dc:    	mov	x0, x19  // guest 0x702ca, sampled 0
6eac4938e0:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x702ca, sampled 0
6eac4938e4:    	add	x16, x16, #0x484  // guest 0x702ca, sampled 0
6eac4938e8:    	blr	x16  // guest 0x702ca, sampled 0
6eac4938ec:    	lsl	w23, w21, #4  // guest 0x702ca, sampled 0
6eac4938f0:    	add	w23, w23, #0x1a0  // guest 0x702ca, sampled 0
6eac4938f4:    	sxtw	x23, w23  // guest 0x702ca, sampled 0
6eac4938f8:    	add	x1, x23, x19  // guest 0x702ca, sampled 0
6eac4938fc:    	add	x2, x19, #0x258  // guest 0x702ca, sampled 0
6eac493900:    	mov	x0, x19  // guest 0x702ca, sampled 0
6eac493904:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x702ca, sampled 0
6eac493908:    	add	x16, x16, #0xb4c  // guest 0x702ca, sampled 0
6eac49390c:    	blr	x16  // guest 0x702ca, sampled 0
6eac493910:    	ldr	w23, [x19, #0x74]  // guest 0x702ca, sampled 0
6eac493914:    	strh	w23, [x19, #0x224]  // guest 0x702ca, sampled 0
6eac493918:    	str	w25, [x19, #0x230]  // guest 0x702ca, sampled 0
6eac49391c:    	ldr	w23, [x19, #0x54]  // guest 0x702ca, sampled 0
6eac493920:    	strh	w23, [x19, #0x222]  // guest 0x702ca, sampled 0
6eac493924:    	mov	w23, #0x2ca             // =714  // guest 0x702ca, sampled 0
6eac493928:    	movk	w23, #0x7, lsl #16  // guest 0x702ca, sampled 0
6eac49392c:    	str	w23, [x19, #0x228]  // guest 0x702ca, sampled 0
6eac493930:    	add	w23, w22, #0x18  // guest 0x702cd, sampled 0
6eac493934:    	mov	w25, w23  // guest 0x702cd, sampled 0
6eac493938:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702cd, sampled 0
6eac49393c:    	and	x16, x16, x23, lsr #7  // guest 0x702cd, sampled 0
6eac493940:    	add	x17, x17, x16  // guest 0x702cd, sampled 0
6eac493944:    	ldp	x16, x17, [x17]  // guest 0x702cd, sampled 0
6eac493948:    	and	w30, w23, #0xfffff003  // guest 0x702cd, sampled 0
6eac49394c:    	cmp	w16, w30  // guest 0x702cd, sampled 0
6eac493950:    	b.ne	0x6eac494fc8 <trace+0x2488>  // guest 0x702cd, sampled 0
6eac493954:    	add	x30, x17, w23, uxtw  // guest 0x702cd, sampled 0
6eac493958:    	ldapr	w2, [x30]  // guest 0x702cd, sampled 0
6eac49395c:    	add	w23, w21, #0x7  // guest 0x702cd, sampled 0
6eac493960:    	and	w23, w23, #0x7  // guest 0x702cd, sampled 0
6eac493964:    	lsl	w23, w23, #4  // guest 0x702cd, sampled 0
6eac493968:    	add	w23, w23, #0x1a0  // guest 0x702cd, sampled 0
6eac49396c:    	sxtw	x23, w23  // guest 0x702cd, sampled 0
6eac493970:    	add	x1, x23, x19  // guest 0x702cd, sampled 0
6eac493974:    	mov	x0, x19  // guest 0x702cd, sampled 0
6eac493978:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x702cd, sampled 0
6eac49397c:    	add	x16, x16, #0x484  // guest 0x702cd, sampled 0
6eac493980:    	blr	x16  // guest 0x702cd, sampled 1
6eac493984:    	sub	w21, w21, #0x1  // guest 0x702cd, sampled 0
6eac493988:    	and	w21, w21, #0x7  // guest 0x702cd, sampled 0
6eac49398c:    	str	w21, [x19, #0x188]  // guest 0x702cd, sampled 0
6eac493990:    	sxtw	x23, w21  // guest 0x702cd, sampled 0
6eac493994:    	add	x23, x23, x19  // guest 0x702cd, sampled 0
6eac493998:    	strb	wzr, [x23, #0x190]  // guest 0x702cd, sampled 0
6eac49399c:    	ldr	w23, [x19, #0x74]  // guest 0x702cd, sampled 0
6eac4939a0:    	strh	w23, [x19, #0x224]  // guest 0x702cd, sampled 0
6eac4939a4:    	str	w25, [x19, #0x230]  // guest 0x702cd, sampled 0
6eac4939a8:    	ldr	w23, [x19, #0x54]  // guest 0x702cd, sampled 0
6eac4939ac:    	strh	w23, [x19, #0x222]  // guest 0x702cd, sampled 0
6eac4939b0:    	mov	w23, #0x2cd             // =717  // guest 0x702cd, sampled 0
6eac4939b4:    	movk	w23, #0x7, lsl #16  // guest 0x702cd, sampled 0
6eac4939b8:    	str	w23, [x19, #0x228]  // guest 0x702cd, sampled 0
6eac4939bc:    	add	w23, w22, #0xc  // guest 0x702d0, sampled 0
6eac4939c0:    	mov	w25, w23  // guest 0x702d0, sampled 0
6eac4939c4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702d0, sampled 0
6eac4939c8:    	and	x16, x16, x23, lsr #7  // guest 0x702d0, sampled 0
6eac4939cc:    	add	x17, x17, x16  // guest 0x702d0, sampled 0
6eac4939d0:    	ldp	x16, x17, [x17]  // guest 0x702d0, sampled 0
6eac4939d4:    	and	w30, w23, #0xfffff003  // guest 0x702d0, sampled 0
6eac4939d8:    	cmp	w16, w30  // guest 0x702d0, sampled 0
6eac4939dc:    	b.ne	0x6eac494ff4 <trace+0x24b4>  // guest 0x702d0, sampled 0
6eac4939e0:    	add	x30, x17, w23, uxtw  // guest 0x702d0, sampled 0
6eac4939e4:    	ldapr	w2, [x30]  // guest 0x702d0, sampled 0
6eac4939e8:    	add	x1, x19, #0x258  // guest 0x702d0, sampled 0
6eac4939ec:    	mov	x0, x19  // guest 0x702d0, sampled 0
6eac4939f0:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x702d0, sampled 0
6eac4939f4:    	add	x16, x16, #0x484  // guest 0x702d0, sampled 0
6eac4939f8:    	blr	x16  // guest 0x702d0, sampled 0
6eac4939fc:    	lsl	w23, w21, #4  // guest 0x702d0, sampled 0
6eac493a00:    	add	w23, w23, #0x1a0  // guest 0x702d0, sampled 0
6eac493a04:    	sxtw	x23, w23  // guest 0x702d0, sampled 0
6eac493a08:    	add	x1, x23, x19  // guest 0x702d0, sampled 0
6eac493a0c:    	add	x2, x19, #0x258  // guest 0x702d0, sampled 1
6eac493a10:    	mov	x0, x19  // guest 0x702d0, sampled 0
6eac493a14:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x702d0, sampled 0
6eac493a18:    	add	x16, x16, #0xb4c  // guest 0x702d0, sampled 0
6eac493a1c:    	blr	x16  // guest 0x702d0, sampled 0
6eac493a20:    	ldr	w23, [x19, #0x74]  // guest 0x702d0, sampled 0
6eac493a24:    	strh	w23, [x19, #0x224]  // guest 0x702d0, sampled 0
6eac493a28:    	str	w25, [x19, #0x230]  // guest 0x702d0, sampled 0
6eac493a2c:    	ldr	w23, [x19, #0x54]  // guest 0x702d0, sampled 0
6eac493a30:    	strh	w23, [x19, #0x222]  // guest 0x702d0, sampled 0
6eac493a34:    	mov	w23, #0x2d0             // =720  // guest 0x702d0, sampled 0
6eac493a38:    	movk	w23, #0x7, lsl #16  // guest 0x702d0, sampled 0
6eac493a3c:    	str	w23, [x19, #0x228]  // guest 0x702d0, sampled 0
6eac493a40:    	add	w23, w21, w24  // guest 0x702d3, sampled 0
6eac493a44:    	and	w23, w23, #0x7  // guest 0x702d3, sampled 0
6eac493a48:    	lsl	w23, w23, #4  // guest 0x702d3, sampled 0
6eac493a4c:    	add	w23, w23, #0x1a0  // guest 0x702d3, sampled 0
6eac493a50:    	sxtw	x23, w23  // guest 0x702d3, sampled 0
6eac493a54:    	add	x1, x23, x19  // guest 0x702d3, sampled 0
6eac493a58:    	lsl	w23, w21, #4  // guest 0x702d3, sampled 0
6eac493a5c:    	add	w23, w23, #0x1a0  // guest 0x702d3, sampled 0
6eac493a60:    	sxtw	x23, w23  // guest 0x702d3, sampled 0
6eac493a64:    	add	x2, x23, x19  // guest 0x702d3, sampled 0
6eac493a68:    	mov	x0, x19  // guest 0x702d3, sampled 0
6eac493a6c:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x702d3, sampled 0
6eac493a70:    	add	x16, x16, #0xc20  // guest 0x702d3, sampled 0
6eac493a74:    	blr	x16  // guest 0x702d3, sampled 0
6eac493a78:    	sxtw	x23, w21  // guest 0x702d3, sampled 0
6eac493a7c:    	add	x23, x23, x19  // guest 0x702d3, sampled 0
6eac493a80:    	strb	w24, [x23, #0x190]  // guest 0x702d3, sampled 0
6eac493a84:    	add	w21, w21, w24  // guest 0x702d3, sampled 0
6eac493a88:    	and	w21, w21, #0x7  // guest 0x702d3, sampled 0
6eac493a8c:    	str	w21, [x19, #0x188]  // guest 0x702d3, sampled 0
6eac493a90:    	ldr	w23, [x19, #0x54]  // guest 0x702d3, sampled 0
6eac493a94:    	strh	w23, [x19, #0x222]  // guest 0x702d3, sampled 0
6eac493a98:    	mov	w23, #0x2d3             // =723  // guest 0x702d3, sampled 0
6eac493a9c:    	movk	w23, #0x7, lsl #16  // guest 0x702d3, sampled 0
6eac493aa0:    	str	w23, [x19, #0x228]  // guest 0x702d3, sampled 0
6eac493aa4:    	lsl	w23, w21, #4  // guest 0x702d5, sampled 0
6eac493aa8:    	add	w23, w23, #0x1a0  // guest 0x702d5, sampled 0
6eac493aac:    	sxtw	x23, w23  // guest 0x702d5, sampled 0
6eac493ab0:    	add	x1, x23, x19  // guest 0x702d5, sampled 0
6eac493ab4:    	mov	x0, x19  // guest 0x702d5, sampled 0
6eac493ab8:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x702d5, sampled 0
6eac493abc:    	add	x16, x16, #0x5c0  // guest 0x702d5, sampled 0
6eac493ac0:    	blr	x16  // guest 0x702d5, sampled 0
6eac493ac4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702d5, sampled 0
6eac493ac8:    	and	x16, x16, x20, lsr #7  // guest 0x702d5, sampled 0
6eac493acc:    	add	x17, x17, x16  // guest 0x702d5, sampled 0
6eac493ad0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x702d5, sampled 0
6eac493ad4:    	and	w30, w20, #0xfffff003  // guest 0x702d5, sampled 0
6eac493ad8:    	cmp	w16, w30  // guest 0x702d5, sampled 0
6eac493adc:    	b.ne	0x6eac495020 <trace+0x24e0>  // guest 0x702d5, sampled 0
6eac493ae0:    	add	x30, x17, w20, uxtw  // guest 0x702d5, sampled 0
6eac493ae4:    	stlr	w0, [x30]  // guest 0x702d5, sampled 0
6eac493ae8:    	sxtw	x23, w21  // guest 0x702d5, sampled 0
6eac493aec:    	add	x23, x23, x19  // guest 0x702d5, sampled 0
6eac493af0:    	strb	w24, [x23, #0x190]  // guest 0x702d5, sampled 0
6eac493af4:    	add	w21, w21, w24  // guest 0x702d5, sampled 0
6eac493af8:    	and	w21, w21, #0x7  // guest 0x702d5, sampled 0
6eac493afc:    	ldr	w23, [x19, #0x64]  // guest 0x702d5, sampled 0
6eac493b00:    	strh	w23, [x19, #0x224]  // guest 0x702d5, sampled 0
6eac493b04:    	str	w20, [x19, #0x230]  // guest 0x702d5, sampled 0
6eac493b08:    	ldr	w20, [x19, #0x54]  // guest 0x702d5, sampled 0
6eac493b0c:    	strh	w20, [x19, #0x222]  // guest 0x702d5, sampled 0
6eac493b10:    	mov	w20, #0x2d5             // =725  // guest 0x702d5, sampled 0
6eac493b14:    	movk	w20, #0x7, lsl #16  // guest 0x702d5, sampled 0
6eac493b18:    	str	w20, [x19, #0x228]  // guest 0x702d5, sampled 0
6eac493b1c:    	sub	w20, w21, #0x1  // guest 0x702d8, sampled 0
6eac493b20:    	and	w20, w20, #0x7  // guest 0x702d8, sampled 0
6eac493b24:    	str	w20, [x19, #0x188]  // guest 0x702d8, sampled 0
6eac493b28:    	sxtw	x21, w20  // guest 0x702d8, sampled 0
6eac493b2c:    	add	x21, x21, x19  // guest 0x702d8, sampled 0
6eac493b30:    	strb	wzr, [x21, #0x190]  // guest 0x702d8, sampled 0
6eac493b34:    	lsl	w21, w20, #4  // guest 0x702d8, sampled 0
6eac493b38:    	add	w21, w21, #0x1a0  // guest 0x702d8, sampled 0
6eac493b3c:    	sxtw	x21, w21  // guest 0x702d8, sampled 0
6eac493b40:    	add	x21, x21, x19  // guest 0x702d8, sampled 0
6eac493b44:    	add	w23, w20, #0x5  // guest 0x702d8, sampled 0
6eac493b48:    	and	w23, w23, #0x7  // guest 0x702d8, sampled 0
6eac493b4c:    	lsl	w23, w23, #4  // guest 0x702d8, sampled 0
6eac493b50:    	add	w23, w23, #0x1a0  // guest 0x702d8, sampled 0
6eac493b54:    	sxtw	x23, w23  // guest 0x702d8, sampled 0
6eac493b58:    	add	x23, x23, x19  // guest 0x702d8, sampled 0
6eac493b5c:    	ldr	x25, [x23]  // guest 0x702d8, sampled 0
6eac493b60:    	ldrh	w23, [x23, #0x8]  // guest 0x702d8, sampled 0
6eac493b64:    	str	x25, [x21]  // guest 0x702d8, sampled 0
6eac493b68:    	strh	w23, [x21, #0x8]  // guest 0x702d8, sampled 0
6eac493b6c:    	ldr	w21, [x19, #0x54]  // guest 0x702d8, sampled 0
6eac493b70:    	strh	w21, [x19, #0x222]  // guest 0x702d8, sampled 0
6eac493b74:    	mov	w21, #0x2d8             // =728  // guest 0x702d8, sampled 0
6eac493b78:    	movk	w21, #0x7, lsl #16  // guest 0x702d8, sampled 0
6eac493b7c:    	str	w21, [x19, #0x228]  // guest 0x702d8, sampled 0
6eac493b80:    	add	w21, w22, #0x14  // guest 0x702da, sampled 0
6eac493b84:    	mov	w23, w21  // guest 0x702da, sampled 0
6eac493b88:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702da, sampled 0
6eac493b8c:    	and	x16, x16, x21, lsr #7  // guest 0x702da, sampled 0
6eac493b90:    	add	x17, x17, x16  // guest 0x702da, sampled 0
6eac493b94:    	ldp	x16, x17, [x17]  // guest 0x702da, sampled 0
6eac493b98:    	and	w30, w21, #0xfffff003  // guest 0x702da, sampled 0
6eac493b9c:    	cmp	w16, w30  // guest 0x702da, sampled 0
6eac493ba0:    	b.ne	0x6eac49504c <trace+0x250c>  // guest 0x702da, sampled 0
6eac493ba4:    	add	x30, x17, w21, uxtw  // guest 0x702da, sampled 0
6eac493ba8:    	ldapr	w2, [x30]  // guest 0x702da, sampled 0
6eac493bac:    	add	x1, x19, #0x258  // guest 0x702da, sampled 0
6eac493bb0:    	mov	x0, x19  // guest 0x702da, sampled 0
6eac493bb4:    	adrp	x16, 0x6efc8aa000 <trace+0x50418000>  // guest 0x702da, sampled 0
6eac493bb8:    	add	x16, x16, #0x484  // guest 0x702da, sampled 0
6eac493bbc:    	blr	x16  // guest 0x702da, sampled 0
6eac493bc0:    	lsl	w21, w20, #4  // guest 0x702da, sampled 0
6eac493bc4:    	add	w21, w21, #0x1a0  // guest 0x702da, sampled 0
6eac493bc8:    	sxtw	x21, w21  // guest 0x702da, sampled 0
6eac493bcc:    	add	x1, x21, x19  // guest 0x702da, sampled 0
6eac493bd0:    	add	x2, x19, #0x258  // guest 0x702da, sampled 0
6eac493bd4:    	mov	x0, x19  // guest 0x702da, sampled 0
6eac493bd8:    	adrp	x16, 0x6efc8ab000 <trace+0x50419000>  // guest 0x702da, sampled 0
6eac493bdc:    	add	x16, x16, #0xb4c  // guest 0x702da, sampled 0
6eac493be0:    	blr	x16  // guest 0x702da, sampled 0
6eac493be4:    	ldr	w21, [x19, #0x74]  // guest 0x702da, sampled 0
6eac493be8:    	strh	w21, [x19, #0x224]  // guest 0x702da, sampled 0
6eac493bec:    	str	w23, [x19, #0x230]  // guest 0x702da, sampled 0
6eac493bf0:    	ldr	w21, [x19, #0x54]  // guest 0x702da, sampled 0
6eac493bf4:    	strh	w21, [x19, #0x222]  // guest 0x702da, sampled 0
6eac493bf8:    	mov	w21, #0x2da             // =730  // guest 0x702da, sampled 0
6eac493bfc:    	movk	w21, #0x7, lsl #16  // guest 0x702da, sampled 0
6eac493c00:    	str	w21, [x19, #0x228]  // guest 0x702da, sampled 0
6eac493c04:    	sub	w20, w20, #0x1  // guest 0x702dd, sampled 0
6eac493c08:    	and	w20, w20, #0x7  // guest 0x702dd, sampled 0
6eac493c0c:    	str	w20, [x19, #0x188]  // guest 0x702dd, sampled 0
6eac493c10:    	sxtw	x21, w20  // guest 0x702dd, sampled 0
6eac493c14:    	add	x21, x21, x19  // guest 0x702dd, sampled 0
6eac493c18:    	strb	wzr, [x21, #0x190]  // guest 0x702dd, sampled 0
6eac493c1c:    	lsl	w21, w20, #4  // guest 0x702dd, sampled 0
6eac493c20:    	add	w21, w21, #0x1a0  // guest 0x702dd, sampled 0
6eac493c24:    	sxtw	x21, w21  // guest 0x702dd, sampled 0
6eac493c28:    	add	x21, x21, x19  // guest 0x702dd, sampled 0
6eac493c2c:    	add	w23, w20, #0x5  // guest 0x702dd, sampled 0
6eac493c30:    	and	w23, w23, #0x7  // guest 0x702dd, sampled 0
6eac493c34:    	lsl	w23, w23, #4  // guest 0x702dd, sampled 0
6eac493c38:    	add	w23, w23, #0x1a0  // guest 0x702dd, sampled 0
6eac493c3c:    	sxtw	x23, w23  // guest 0x702dd, sampled 0
6eac493c40:    	add	x23, x23, x19  // guest 0x702dd, sampled 0
6eac493c44:    	ldr	x25, [x23]  // guest 0x702dd, sampled 0
6eac493c48:    	ldrh	w23, [x23, #0x8]  // guest 0x702dd, sampled 1
6eac493c4c:    	str	x25, [x21]  // guest 0x702dd, sampled 0
6eac493c50:    	strh	w23, [x21, #0x8]  // guest 0x702dd, sampled 0
6eac493c54:    	ldr	w21, [x19, #0x54]  // guest 0x702dd, sampled 0
6eac493c58:    	strh	w21, [x19, #0x222]  // guest 0x702dd, sampled 0
6eac493c5c:    	mov	w21, #0x2dd             // =733  // guest 0x702dd, sampled 0
6eac493c60:    	movk	w21, #0x7, lsl #16  // guest 0x702dd, sampled 0
6eac493c64:    	str	w21, [x19, #0x228]  // guest 0x702dd, sampled 0
6eac493c68:    	add	w21, w22, #0x24  // guest 0x702df, sampled 0
6eac493c6c:    	mov	w23, w21  // guest 0x702df, sampled 0
6eac493c70:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702df, sampled 0
6eac493c74:    	and	x16, x16, x21, lsr #7  // guest 0x702df, sampled 0
6eac493c78:    	add	x17, x17, x16  // guest 0x702df, sampled 0
6eac493c7c:    	ldp	x16, x17, [x17]  // guest 0x702df, sampled 0
6eac493c80:    	and	w30, w21, #0xfffff003  // guest 0x702df, sampled 0
6eac493c84:    	cmp	w16, w30  // guest 0x702df, sampled 0
6eac493c88:    	b.ne	0x6eac495078 <trace+0x2538>  // guest 0x702df, sampled 0
6eac493c8c:    	add	x30, x17, w21, uxtw  // guest 0x702df, sampled 0
6eac493c90:    	ldapr	w2, [x30]  // guest 0x702df, sampled 0
6eac493c94:    	add	x1, x19, #0x258  // guest 0x702df, sampled 0
6eac493c98:    	mov	x0, x19  // guest 0x702df, sampled 0
6eac493c9c:    	adrp	x16, 0x6efc8aa000 <trace+0x50418000>  // guest 0x702df, sampled 0
6eac493ca0:    	add	x16, x16, #0x484  // guest 0x702df, sampled 0
6eac493ca4:    	blr	x16  // guest 0x702df, sampled 0
6eac493ca8:    	lsl	w21, w20, #4  // guest 0x702df, sampled 0
6eac493cac:    	add	w21, w21, #0x1a0  // guest 0x702df, sampled 0
6eac493cb0:    	sxtw	x21, w21  // guest 0x702df, sampled 0
6eac493cb4:    	add	x1, x21, x19  // guest 0x702df, sampled 0
6eac493cb8:    	add	x2, x19, #0x258  // guest 0x702df, sampled 0
6eac493cbc:    	mov	x0, x19  // guest 0x702df, sampled 0
6eac493cc0:    	adrp	x16, 0x6efc8ab000 <trace+0x50419000>  // guest 0x702df, sampled 0
6eac493cc4:    	add	x16, x16, #0xb4c  // guest 0x702df, sampled 0
6eac493cc8:    	blr	x16  // guest 0x702df, sampled 0
6eac493ccc:    	ldr	w21, [x19, #0x74]  // guest 0x702df, sampled 0
6eac493cd0:    	strh	w21, [x19, #0x224]  // guest 0x702df, sampled 0
6eac493cd4:    	str	w23, [x19, #0x230]  // guest 0x702df, sampled 0
6eac493cd8:    	ldr	w21, [x19, #0x54]  // guest 0x702df, sampled 0
6eac493cdc:    	strh	w21, [x19, #0x222]  // guest 0x702df, sampled 0
6eac493ce0:    	mov	w21, #0x2df             // =735  // guest 0x702df, sampled 0
6eac493ce4:    	movk	w21, #0x7, lsl #16  // guest 0x702df, sampled 0
6eac493ce8:    	str	w21, [x19, #0x228]  // guest 0x702df, sampled 0
6eac493cec:    	add	w21, w20, w24  // guest 0x702e2, sampled 0
6eac493cf0:    	and	w21, w21, #0x7  // guest 0x702e2, sampled 0
6eac493cf4:    	lsl	w21, w21, #4  // guest 0x702e2, sampled 0
6eac493cf8:    	add	w21, w21, #0x1a0  // guest 0x702e2, sampled 0
6eac493cfc:    	sxtw	x21, w21  // guest 0x702e2, sampled 0
6eac493d00:    	add	x1, x21, x19  // guest 0x702e2, sampled 0
6eac493d04:    	lsl	w21, w20, #4  // guest 0x702e2, sampled 0
6eac493d08:    	add	w21, w21, #0x1a0  // guest 0x702e2, sampled 0
6eac493d0c:    	sxtw	x21, w21  // guest 0x702e2, sampled 0
6eac493d10:    	add	x2, x21, x19  // guest 0x702e2, sampled 0
6eac493d14:    	mov	x0, x19  // guest 0x702e2, sampled 0
6eac493d18:    	adrp	x16, 0x6efc8ab000 <trace+0x50419000>  // guest 0x702e2, sampled 0
6eac493d1c:    	add	x16, x16, #0xc20  // guest 0x702e2, sampled 0
6eac493d20:    	blr	x16  // guest 0x702e2, sampled 0
6eac493d24:    	sxtw	x21, w20  // guest 0x702e2, sampled 0
6eac493d28:    	add	x21, x21, x19  // guest 0x702e2, sampled 0
6eac493d2c:    	strb	w24, [x21, #0x190]  // guest 0x702e2, sampled 0
6eac493d30:    	add	w20, w20, w24  // guest 0x702e2, sampled 0
6eac493d34:    	and	w20, w20, #0x7  // guest 0x702e2, sampled 0
6eac493d38:    	ldr	w21, [x19, #0x54]  // guest 0x702e2, sampled 0
6eac493d3c:    	strh	w21, [x19, #0x222]  // guest 0x702e2, sampled 0
6eac493d40:    	mov	w21, #0x2e2             // =738  // guest 0x702e2, sampled 0
6eac493d44:    	movk	w21, #0x7, lsl #16  // guest 0x702e2, sampled 0
6eac493d48:    	str	w21, [x19, #0x228]  // guest 0x702e2, sampled 0
6eac493d4c:    	sub	w20, w20, #0x1  // guest 0x702e4, sampled 0
6eac493d50:    	and	w20, w20, #0x7  // guest 0x702e4, sampled 0
6eac493d54:    	str	w20, [x19, #0x188]  // guest 0x702e4, sampled 0
6eac493d58:    	sxtw	x21, w20  // guest 0x702e4, sampled 0
6eac493d5c:    	add	x21, x21, x19  // guest 0x702e4, sampled 0
6eac493d60:    	strb	wzr, [x21, #0x190]  // guest 0x702e4, sampled 0
6eac493d64:    	lsl	w21, w20, #4  // guest 0x702e4, sampled 0
6eac493d68:    	add	w21, w21, #0x1a0  // guest 0x702e4, sampled 0
6eac493d6c:    	sxtw	x21, w21  // guest 0x702e4, sampled 0
6eac493d70:    	add	x21, x21, x19  // guest 0x702e4, sampled 0
6eac493d74:    	add	w23, w20, #0x4  // guest 0x702e4, sampled 0
6eac493d78:    	and	w23, w23, #0x7  // guest 0x702e4, sampled 0
6eac493d7c:    	lsl	w23, w23, #4  // guest 0x702e4, sampled 0
6eac493d80:    	add	w23, w23, #0x1a0  // guest 0x702e4, sampled 0
6eac493d84:    	sxtw	x23, w23  // guest 0x702e4, sampled 0
6eac493d88:    	add	x23, x23, x19  // guest 0x702e4, sampled 0
6eac493d8c:    	ldr	x25, [x23]  // guest 0x702e4, sampled 0
6eac493d90:    	ldrh	w23, [x23, #0x8]  // guest 0x702e4, sampled 1
6eac493d94:    	str	x25, [x21]  // guest 0x702e4, sampled 0
6eac493d98:    	strh	w23, [x21, #0x8]  // guest 0x702e4, sampled 0
6eac493d9c:    	ldr	w21, [x19, #0x54]  // guest 0x702e4, sampled 0
6eac493da0:    	strh	w21, [x19, #0x222]  // guest 0x702e4, sampled 0
6eac493da4:    	mov	w21, #0x2e4             // =740  // guest 0x702e4, sampled 0
6eac493da8:    	movk	w21, #0x7, lsl #16  // guest 0x702e4, sampled 0
6eac493dac:    	str	w21, [x19, #0x228]  // guest 0x702e4, sampled 0
6eac493db0:    	add	w21, w22, #0x34  // guest 0x702e6, sampled 0
6eac493db4:    	mov	w23, w21  // guest 0x702e6, sampled 0
6eac493db8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702e6, sampled 0
6eac493dbc:    	and	x16, x16, x21, lsr #7  // guest 0x702e6, sampled 0
6eac493dc0:    	add	x17, x17, x16  // guest 0x702e6, sampled 0
6eac493dc4:    	ldp	x16, x17, [x17]  // guest 0x702e6, sampled 0
6eac493dc8:    	and	w30, w21, #0xfffff003  // guest 0x702e6, sampled 0
6eac493dcc:    	cmp	w16, w30  // guest 0x702e6, sampled 0
6eac493dd0:    	b.ne	0x6eac4950a4 <trace+0x2564>  // guest 0x702e6, sampled 0
6eac493dd4:    	add	x30, x17, w21, uxtw  // guest 0x702e6, sampled 0
6eac493dd8:    	ldapr	w2, [x30]  // guest 0x702e6, sampled 0
6eac493ddc:    	add	x1, x19, #0x258  // guest 0x702e6, sampled 0
6eac493de0:    	mov	x0, x19  // guest 0x702e6, sampled 0
6eac493de4:    	adrp	x16, 0x6efc8aa000 <trace+0x50418000>  // guest 0x702e6, sampled 0
6eac493de8:    	add	x16, x16, #0x484  // guest 0x702e6, sampled 0
6eac493dec:    	blr	x16  // guest 0x702e6, sampled 0
6eac493df0:    	lsl	w21, w20, #4  // guest 0x702e6, sampled 0
6eac493df4:    	add	w21, w21, #0x1a0  // guest 0x702e6, sampled 0
6eac493df8:    	sxtw	x21, w21  // guest 0x702e6, sampled 0
6eac493dfc:    	add	x1, x21, x19  // guest 0x702e6, sampled 0
6eac493e00:    	add	x2, x19, #0x258  // guest 0x702e6, sampled 0
6eac493e04:    	mov	x0, x19  // guest 0x702e6, sampled 0
6eac493e08:    	adrp	x16, 0x6efc8ab000 <trace+0x50419000>  // guest 0x702e6, sampled 0
6eac493e0c:    	add	x16, x16, #0xb4c  // guest 0x702e6, sampled 0
6eac493e10:    	blr	x16  // guest 0x702e6, sampled 0
6eac493e14:    	ldr	w21, [x19, #0x74]  // guest 0x702e6, sampled 0
6eac493e18:    	strh	w21, [x19, #0x224]  // guest 0x702e6, sampled 0
6eac493e1c:    	str	w23, [x19, #0x230]  // guest 0x702e6, sampled 0
6eac493e20:    	ldr	w21, [x19, #0x54]  // guest 0x702e6, sampled 0
6eac493e24:    	strh	w21, [x19, #0x222]  // guest 0x702e6, sampled 0
6eac493e28:    	mov	w21, #0x2e6             // =742  // guest 0x702e6, sampled 0
6eac493e2c:    	movk	w21, #0x7, lsl #16  // guest 0x702e6, sampled 0
6eac493e30:    	str	w21, [x19, #0x228]  // guest 0x702e6, sampled 0
6eac493e34:    	add	w21, w20, w24  // guest 0x702e9, sampled 0
6eac493e38:    	and	w21, w21, #0x7  // guest 0x702e9, sampled 0
6eac493e3c:    	lsl	w21, w21, #4  // guest 0x702e9, sampled 0
6eac493e40:    	add	w21, w21, #0x1a0  // guest 0x702e9, sampled 0
6eac493e44:    	sxtw	x21, w21  // guest 0x702e9, sampled 0
6eac493e48:    	add	x1, x21, x19  // guest 0x702e9, sampled 0
6eac493e4c:    	lsl	w21, w20, #4  // guest 0x702e9, sampled 0
6eac493e50:    	add	w21, w21, #0x1a0  // guest 0x702e9, sampled 0
6eac493e54:    	sxtw	x21, w21  // guest 0x702e9, sampled 0
6eac493e58:    	add	x2, x21, x19  // guest 0x702e9, sampled 0
6eac493e5c:    	mov	x0, x19  // guest 0x702e9, sampled 0
6eac493e60:    	adrp	x16, 0x6efc8ab000 <trace+0x50419000>  // guest 0x702e9, sampled 0
6eac493e64:    	add	x16, x16, #0xa78  // guest 0x702e9, sampled 0
6eac493e68:    	blr	x16  // guest 0x702e9, sampled 0
6eac493e6c:    	sxtw	x21, w20  // guest 0x702e9, sampled 0
6eac493e70:    	add	x21, x21, x19  // guest 0x702e9, sampled 0
6eac493e74:    	strb	w24, [x21, #0x190]  // guest 0x702e9, sampled 0
6eac493e78:    	add	w20, w20, w24  // guest 0x702e9, sampled 0
6eac493e7c:    	and	w20, w20, #0x7  // guest 0x702e9, sampled 0
6eac493e80:    	str	w20, [x19, #0x188]  // guest 0x702e9, sampled 0
6eac493e84:    	ldr	w21, [x19, #0x54]  // guest 0x702e9, sampled 0
6eac493e88:    	strh	w21, [x19, #0x222]  // guest 0x702e9, sampled 0
6eac493e8c:    	mov	w21, #0x2e9             // =745  // guest 0x702e9, sampled 0
6eac493e90:    	movk	w21, #0x7, lsl #16  // guest 0x702e9, sampled 0
6eac493e94:    	str	w21, [x19, #0x228]  // guest 0x702e9, sampled 0
6eac493e98:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702eb, sampled 0
6eac493e9c:    	and	x16, x16, x22, lsr #7  // guest 0x702eb, sampled 0
6eac493ea0:    	add	x17, x17, x16  // guest 0x702eb, sampled 0
6eac493ea4:    	ldp	x16, x17, [x17]  // guest 0x702eb, sampled 0
6eac493ea8:    	and	w30, w22, #0xfffff003  // guest 0x702eb, sampled 0
6eac493eac:    	cmp	w16, w30  // guest 0x702eb, sampled 0
6eac493eb0:    	b.ne	0x6eac4950d0 <trace+0x2590>  // guest 0x702eb, sampled 0
6eac493eb4:    	add	x30, x17, w22, uxtw  // guest 0x702eb, sampled 0
6eac493eb8:    	ldapr	w2, [x30]  // guest 0x702eb, sampled 0
6eac493ebc:    	add	x1, x19, #0x258  // guest 0x702eb, sampled 1
6eac493ec0:    	mov	x0, x19  // guest 0x702eb, sampled 0
6eac493ec4:    	adrp	x16, 0x6efc8aa000 <trace+0x50418000>  // guest 0x702eb, sampled 0
6eac493ec8:    	add	x16, x16, #0x484  // guest 0x702eb, sampled 0
6eac493ecc:    	blr	x16  // guest 0x702eb, sampled 0
6eac493ed0:    	lsl	w20, w20, #4  // guest 0x702eb, sampled 0
6eac493ed4:    	add	w20, w20, #0x1a0  // guest 0x702eb, sampled 0
6eac493ed8:    	sxtw	x20, w20  // guest 0x702eb, sampled 0
6eac493edc:    	add	x1, x20, x19  // guest 0x702eb, sampled 0
6eac493ee0:    	add	x2, x19, #0x258  // guest 0x702eb, sampled 0
6eac493ee4:    	mov	x0, x19  // guest 0x702eb, sampled 0
6eac493ee8:    	adrp	x16, 0x6efc8ab000 <trace+0x50419000>  // guest 0x702eb, sampled 0
6eac493eec:    	add	x16, x16, #0xb4c  // guest 0x702eb, sampled 0
6eac493ef0:    	blr	x16  // guest 0x702eb, sampled 0
6eac493ef4:    	ldr	w20, [x19, #0x74]  // guest 0x702eb, sampled 0
6eac493ef8:    	strh	w20, [x19, #0x224]  // guest 0x702eb, sampled 0
6eac493efc:    	str	w22, [x19, #0x230]  // guest 0x702eb, sampled 0
6eac493f00:    	ldr	w20, [x19, #0x54]  // guest 0x702eb, sampled 0
6eac493f04:    	strh	w20, [x19, #0x222]  // guest 0x702eb, sampled 0
6eac493f08:    	mov	w20, #0x2eb             // =747  // guest 0x702eb, sampled 0
6eac493f0c:    	movk	w20, #0x7, lsl #16  // guest 0x702eb, sampled 0
6eac493f10:    	str	w20, [x19, #0x228]  // guest 0x702eb, sampled 0
6eac493f14:    	mov	w1, #0x5                // =5  // guest 0x702ed, sampled 0
6eac493f18:    	mov	x0, x19  // guest 0x702ed, sampled 0
6eac493f1c:    	adrp	x16, 0x6efc8ab000 <trace+0x50419000>  // guest 0x702ed, sampled 0
6eac493f20:    	add	x16, x16, #0x5a0  // guest 0x702ed, sampled 0
6eac493f24:    	blr	x16  // guest 0x702ed, sampled 0
6eac493f28:    	ldr	w20, [x19, #0x54]  // guest 0x702ed, sampled 0
6eac493f2c:    	strh	w20, [x19, #0x222]  // guest 0x702ed, sampled 0
6eac493f30:    	mov	w20, #0x2ed             // =749  // guest 0x702ed, sampled 0
6eac493f34:    	movk	w20, #0x7, lsl #16  // guest 0x702ed, sampled 0
6eac493f38:    	str	w20, [x19, #0x228]  // guest 0x702ed, sampled 0
6eac493f3c:    	ldr	w20, [x19, #0x4]  // guest 0x702ef, sampled 0
6eac493f40:    	add	w21, w20, #0x4  // guest 0x702ef, sampled 0
6eac493f44:    	mov	w22, w21  // guest 0x702ef, sampled 0
6eac493f48:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702ef, sampled 0
6eac493f4c:    	and	x16, x16, x21, lsr #7  // guest 0x702ef, sampled 0
6eac493f50:    	add	x17, x17, x16  // guest 0x702ef, sampled 0
6eac493f54:    	ldp	x16, x17, [x17]  // guest 0x702ef, sampled 0
6eac493f58:    	and	w30, w21, #0xfffff003  // guest 0x702ef, sampled 0
6eac493f5c:    	cmp	w16, w30  // guest 0x702ef, sampled 0
6eac493f60:    	b.ne	0x6eac4950fc <trace+0x25bc>  // guest 0x702ef, sampled 0
6eac493f64:    	add	x30, x17, w21, uxtw  // guest 0x702ef, sampled 0
6eac493f68:    	ldapr	w2, [x30]  // guest 0x702ef, sampled 0
6eac493f6c:    	add	x1, x19, #0x258  // guest 0x702ef, sampled 0
6eac493f70:    	mov	x0, x19  // guest 0x702ef, sampled 0
6eac493f74:    	adrp	x16, 0x6efc8aa000 <trace+0x50418000>  // guest 0x702ef, sampled 0
6eac493f78:    	add	x16, x16, #0x484  // guest 0x702ef, sampled 0
6eac493f7c:    	blr	x16  // guest 0x702ef, sampled 0
6eac493f80:    	ldr	w21, [x19, #0x188]  // guest 0x702ef, sampled 0
6eac493f84:    	lsl	w23, w21, #4  // guest 0x702ef, sampled 0
6eac493f88:    	add	w23, w23, #0x1a0  // guest 0x702ef, sampled 0
6eac493f8c:    	sxtw	x23, w23  // guest 0x702ef, sampled 0
6eac493f90:    	add	x1, x23, x19  // guest 0x702ef, sampled 0
6eac493f94:    	add	x2, x19, #0x258  // guest 0x702ef, sampled 0
6eac493f98:    	mov	x0, x19  // guest 0x702ef, sampled 0
6eac493f9c:    	adrp	x16, 0x6efc8ab000 <trace+0x50419000>  // guest 0x702ef, sampled 0
6eac493fa0:    	add	x16, x16, #0xb4c  // guest 0x702ef, sampled 0
6eac493fa4:    	blr	x16  // guest 0x702ef, sampled 0
6eac493fa8:    	ldr	w23, [x19, #0x74]  // guest 0x702ef, sampled 0
6eac493fac:    	strh	w23, [x19, #0x224]  // guest 0x702ef, sampled 0
6eac493fb0:    	str	w22, [x19, #0x230]  // guest 0x702ef, sampled 0
6eac493fb4:    	ldr	w22, [x19, #0x54]  // guest 0x702ef, sampled 0
6eac493fb8:    	strh	w22, [x19, #0x222]  // guest 0x702ef, sampled 0
6eac493fbc:    	mov	w22, #0x2ef             // =751  // guest 0x702ef, sampled 0
6eac493fc0:    	movk	w22, #0x7, lsl #16  // guest 0x702ef, sampled 0
6eac493fc4:    	str	w22, [x19, #0x228]  // guest 0x702ef, sampled 0
6eac493fc8:    	sub	w21, w21, #0x1  // guest 0x702f2, sampled 0
6eac493fcc:    	and	w21, w21, #0x7  // guest 0x702f2, sampled 0
6eac493fd0:    	str	w21, [x19, #0x188]  // guest 0x702f2, sampled 0
6eac493fd4:    	sxtw	x22, w21  // guest 0x702f2, sampled 0
6eac493fd8:    	add	x22, x22, x19  // guest 0x702f2, sampled 0
6eac493fdc:    	strb	wzr, [x22, #0x190]  // guest 0x702f2, sampled 0
6eac493fe0:    	lsl	w22, w21, #4  // guest 0x702f2, sampled 0
6eac493fe4:    	add	w22, w22, #0x1a0  // guest 0x702f2, sampled 0
6eac493fe8:    	sxtw	x22, w22  // guest 0x702f2, sampled 0
6eac493fec:    	add	x22, x22, x19  // guest 0x702f2, sampled 0
6eac493ff0:    	add	w23, w21, #0x3  // guest 0x702f2, sampled 0
6eac493ff4:    	and	w23, w23, #0x7  // guest 0x702f2, sampled 0
6eac493ff8:    	lsl	w23, w23, #4  // guest 0x702f2, sampled 0
6eac493ffc:    	add	w23, w23, #0x1a0  // guest 0x702f2, sampled 0
6eac494000:    	sxtw	x23, w23  // guest 0x702f2, sampled 0
6eac494004:    	add	x23, x23, x19  // guest 0x702f2, sampled 0
6eac494008:    	ldr	x25, [x23]  // guest 0x702f2, sampled 0
6eac49400c:    	ldrh	w23, [x23, #0x8]  // guest 0x702f2, sampled 0
6eac494010:    	str	x25, [x22]  // guest 0x702f2, sampled 0
6eac494014:    	strh	w23, [x22, #0x8]  // guest 0x702f2, sampled 0
6eac494018:    	ldr	w22, [x19, #0x54]  // guest 0x702f2, sampled 0
6eac49401c:    	strh	w22, [x19, #0x222]  // guest 0x702f2, sampled 0
6eac494020:    	mov	w22, #0x2f2             // =754  // guest 0x702f2, sampled 0
6eac494024:    	movk	w22, #0x7, lsl #16  // guest 0x702f2, sampled 0
6eac494028:    	str	w22, [x19, #0x228]  // guest 0x702f2, sampled 0
6eac49402c:    	add	w22, w20, #0x24  // guest 0x702f4, sampled 0
6eac494030:    	mov	w23, w22  // guest 0x702f4, sampled 0
6eac494034:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702f4, sampled 0
6eac494038:    	and	x16, x16, x22, lsr #7  // guest 0x702f4, sampled 0
6eac49403c:    	add	x17, x17, x16  // guest 0x702f4, sampled 0
6eac494040:    	ldp	x16, x17, [x17]  // guest 0x702f4, sampled 0
6eac494044:    	and	w30, w22, #0xfffff003  // guest 0x702f4, sampled 0
6eac494048:    	cmp	w16, w30  // guest 0x702f4, sampled 0
6eac49404c:    	b.ne	0x6eac495128 <trace+0x25e8>  // guest 0x702f4, sampled 0
6eac494050:    	add	x30, x17, w22, uxtw  // guest 0x702f4, sampled 0
6eac494054:    	ldapr	w2, [x30]  // guest 0x702f4, sampled 0
6eac494058:    	add	x1, x19, #0x258  // guest 0x702f4, sampled 0
6eac49405c:    	mov	x0, x19  // guest 0x702f4, sampled 0
6eac494060:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x702f4, sampled 0
6eac494064:    	add	x16, x16, #0x484  // guest 0x702f4, sampled 0
6eac494068:    	blr	x16  // guest 0x702f4, sampled 0
6eac49406c:    	lsl	w22, w21, #4  // guest 0x702f4, sampled 0
6eac494070:    	add	w22, w22, #0x1a0  // guest 0x702f4, sampled 0
6eac494074:    	sxtw	x22, w22  // guest 0x702f4, sampled 0
6eac494078:    	add	x1, x22, x19  // guest 0x702f4, sampled 0
6eac49407c:    	add	x2, x19, #0x258  // guest 0x702f4, sampled 0
6eac494080:    	mov	x0, x19  // guest 0x702f4, sampled 0
6eac494084:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x702f4, sampled 0
6eac494088:    	add	x16, x16, #0xb4c  // guest 0x702f4, sampled 0
6eac49408c:    	blr	x16  // guest 0x702f4, sampled 0
6eac494090:    	ldr	w22, [x19, #0x74]  // guest 0x702f4, sampled 0
6eac494094:    	strh	w22, [x19, #0x224]  // guest 0x702f4, sampled 0
6eac494098:    	str	w23, [x19, #0x230]  // guest 0x702f4, sampled 0
6eac49409c:    	ldr	w22, [x19, #0x54]  // guest 0x702f4, sampled 0
6eac4940a0:    	strh	w22, [x19, #0x222]  // guest 0x702f4, sampled 0
6eac4940a4:    	mov	w22, #0x2f4             // =756  // guest 0x702f4, sampled 0
6eac4940a8:    	movk	w22, #0x7, lsl #16  // guest 0x702f4, sampled 0
6eac4940ac:    	str	w22, [x19, #0x228]  // guest 0x702f4, sampled 0
6eac4940b0:    	add	w22, w21, w24  // guest 0x702f7, sampled 0
6eac4940b4:    	and	w22, w22, #0x7  // guest 0x702f7, sampled 0
6eac4940b8:    	lsl	w22, w22, #4  // guest 0x702f7, sampled 0
6eac4940bc:    	add	w22, w22, #0x1a0  // guest 0x702f7, sampled 0
6eac4940c0:    	sxtw	x22, w22  // guest 0x702f7, sampled 0
6eac4940c4:    	add	x1, x22, x19  // guest 0x702f7, sampled 0
6eac4940c8:    	lsl	w22, w21, #4  // guest 0x702f7, sampled 0
6eac4940cc:    	add	w22, w22, #0x1a0  // guest 0x702f7, sampled 0
6eac4940d0:    	sxtw	x22, w22  // guest 0x702f7, sampled 0
6eac4940d4:    	add	x2, x22, x19  // guest 0x702f7, sampled 0
6eac4940d8:    	mov	x0, x19  // guest 0x702f7, sampled 0
6eac4940dc:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x702f7, sampled 0
6eac4940e0:    	add	x16, x16, #0xc20  // guest 0x702f7, sampled 0
6eac4940e4:    	blr	x16  // guest 0x702f7, sampled 0
6eac4940e8:    	sxtw	x22, w21  // guest 0x702f7, sampled 0
6eac4940ec:    	add	x22, x22, x19  // guest 0x702f7, sampled 0
6eac4940f0:    	strb	w24, [x22, #0x190]  // guest 0x702f7, sampled 0
6eac4940f4:    	add	w21, w21, w24  // guest 0x702f7, sampled 0
6eac4940f8:    	and	w21, w21, #0x7  // guest 0x702f7, sampled 0
6eac4940fc:    	ldr	w22, [x19, #0x54]  // guest 0x702f7, sampled 0
6eac494100:    	strh	w22, [x19, #0x222]  // guest 0x702f7, sampled 0
6eac494104:    	mov	w22, #0x2f7             // =759  // guest 0x702f7, sampled 0
6eac494108:    	movk	w22, #0x7, lsl #16  // guest 0x702f7, sampled 0
6eac49410c:    	str	w22, [x19, #0x228]  // guest 0x702f7, sampled 0
6eac494110:    	sub	w21, w21, #0x1  // guest 0x702f9, sampled 0
6eac494114:    	and	w21, w21, #0x7  // guest 0x702f9, sampled 0
6eac494118:    	str	w21, [x19, #0x188]  // guest 0x702f9, sampled 0
6eac49411c:    	sxtw	x22, w21  // guest 0x702f9, sampled 0
6eac494120:    	add	x22, x22, x19  // guest 0x702f9, sampled 0
6eac494124:    	strb	wzr, [x22, #0x190]  // guest 0x702f9, sampled 0
6eac494128:    	lsl	w22, w21, #4  // guest 0x702f9, sampled 0
6eac49412c:    	add	w22, w22, #0x1a0  // guest 0x702f9, sampled 0
6eac494130:    	sxtw	x22, w22  // guest 0x702f9, sampled 0
6eac494134:    	add	x22, x22, x19  // guest 0x702f9, sampled 0
6eac494138:    	add	w23, w21, #0x2  // guest 0x702f9, sampled 0
6eac49413c:    	and	w23, w23, #0x7  // guest 0x702f9, sampled 0
6eac494140:    	lsl	w23, w23, #4  // guest 0x702f9, sampled 0
6eac494144:    	add	w23, w23, #0x1a0  // guest 0x702f9, sampled 0
6eac494148:    	sxtw	x23, w23  // guest 0x702f9, sampled 0
6eac49414c:    	add	x23, x23, x19  // guest 0x702f9, sampled 0
6eac494150:    	ldr	x25, [x23]  // guest 0x702f9, sampled 0
6eac494154:    	ldrh	w23, [x23, #0x8]  // guest 0x702f9, sampled 0
6eac494158:    	str	x25, [x22]  // guest 0x702f9, sampled 0
6eac49415c:    	strh	w23, [x22, #0x8]  // guest 0x702f9, sampled 0
6eac494160:    	ldr	w22, [x19, #0x54]  // guest 0x702f9, sampled 0
6eac494164:    	strh	w22, [x19, #0x222]  // guest 0x702f9, sampled 0
6eac494168:    	mov	w22, #0x2f9             // =761  // guest 0x702f9, sampled 0
6eac49416c:    	movk	w22, #0x7, lsl #16  // guest 0x702f9, sampled 0
6eac494170:    	str	w22, [x19, #0x228]  // guest 0x702f9, sampled 0
6eac494174:    	add	w22, w20, #0x34  // guest 0x702fb, sampled 0
6eac494178:    	mov	w23, w22  // guest 0x702fb, sampled 0
6eac49417c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x702fb, sampled 0
6eac494180:    	and	x16, x16, x22, lsr #7  // guest 0x702fb, sampled 0
6eac494184:    	add	x17, x17, x16  // guest 0x702fb, sampled 0
6eac494188:    	ldp	x16, x17, [x17]  // guest 0x702fb, sampled 0
6eac49418c:    	and	w30, w22, #0xfffff003  // guest 0x702fb, sampled 0
6eac494190:    	cmp	w16, w30  // guest 0x702fb, sampled 0
6eac494194:    	b.ne	0x6eac495154 <trace+0x2614>  // guest 0x702fb, sampled 0
6eac494198:    	add	x30, x17, w22, uxtw  // guest 0x702fb, sampled 0
6eac49419c:    	ldapr	w2, [x30]  // guest 0x702fb, sampled 0
6eac4941a0:    	add	x1, x19, #0x258  // guest 0x702fb, sampled 0
6eac4941a4:    	mov	x0, x19  // guest 0x702fb, sampled 0
6eac4941a8:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x702fb, sampled 0
6eac4941ac:    	add	x16, x16, #0x484  // guest 0x702fb, sampled 0
6eac4941b0:    	blr	x16  // guest 0x702fb, sampled 0
6eac4941b4:    	lsl	w22, w21, #4  // guest 0x702fb, sampled 0
6eac4941b8:    	add	w22, w22, #0x1a0  // guest 0x702fb, sampled 0
6eac4941bc:    	sxtw	x22, w22  // guest 0x702fb, sampled 0
6eac4941c0:    	add	x1, x22, x19  // guest 0x702fb, sampled 0
6eac4941c4:    	add	x2, x19, #0x258  // guest 0x702fb, sampled 0
6eac4941c8:    	mov	x0, x19  // guest 0x702fb, sampled 0
6eac4941cc:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x702fb, sampled 0
6eac4941d0:    	add	x16, x16, #0xb4c  // guest 0x702fb, sampled 0
6eac4941d4:    	blr	x16  // guest 0x702fb, sampled 0
6eac4941d8:    	ldr	w22, [x19, #0x74]  // guest 0x702fb, sampled 0
6eac4941dc:    	strh	w22, [x19, #0x224]  // guest 0x702fb, sampled 0
6eac4941e0:    	str	w23, [x19, #0x230]  // guest 0x702fb, sampled 0
6eac4941e4:    	ldr	w22, [x19, #0x54]  // guest 0x702fb, sampled 0
6eac4941e8:    	strh	w22, [x19, #0x222]  // guest 0x702fb, sampled 0
6eac4941ec:    	mov	w22, #0x2fb             // =763  // guest 0x702fb, sampled 0
6eac4941f0:    	movk	w22, #0x7, lsl #16  // guest 0x702fb, sampled 0
6eac4941f4:    	str	w22, [x19, #0x228]  // guest 0x702fb, sampled 0
6eac4941f8:    	add	w22, w21, w24  // guest 0x702fe, sampled 0
6eac4941fc:    	and	w22, w22, #0x7  // guest 0x702fe, sampled 0
6eac494200:    	lsl	w22, w22, #4  // guest 0x702fe, sampled 0
6eac494204:    	add	w22, w22, #0x1a0  // guest 0x702fe, sampled 0
6eac494208:    	sxtw	x22, w22  // guest 0x702fe, sampled 0
6eac49420c:    	add	x1, x22, x19  // guest 0x702fe, sampled 0
6eac494210:    	lsl	w22, w21, #4  // guest 0x702fe, sampled 0
6eac494214:    	add	w22, w22, #0x1a0  // guest 0x702fe, sampled 0
6eac494218:    	sxtw	x22, w22  // guest 0x702fe, sampled 0
6eac49421c:    	add	x2, x22, x19  // guest 0x702fe, sampled 0
6eac494220:    	mov	x0, x19  // guest 0x702fe, sampled 0
6eac494224:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x702fe, sampled 0
6eac494228:    	add	x16, x16, #0xa78  // guest 0x702fe, sampled 0
6eac49422c:    	blr	x16  // guest 0x702fe, sampled 0
6eac494230:    	sxtw	x22, w21  // guest 0x702fe, sampled 0
6eac494234:    	add	x22, x22, x19  // guest 0x702fe, sampled 0
6eac494238:    	strb	w24, [x22, #0x190]  // guest 0x702fe, sampled 0
6eac49423c:    	add	w21, w21, w24  // guest 0x702fe, sampled 0
6eac494240:    	and	w21, w21, #0x7  // guest 0x702fe, sampled 0
6eac494244:    	str	w21, [x19, #0x188]  // guest 0x702fe, sampled 0
6eac494248:    	ldr	w22, [x19, #0x54]  // guest 0x702fe, sampled 0
6eac49424c:    	strh	w22, [x19, #0x222]  // guest 0x702fe, sampled 0
6eac494250:    	mov	w22, #0x2fe             // =766  // guest 0x702fe, sampled 0
6eac494254:    	movk	w22, #0x7, lsl #16  // guest 0x702fe, sampled 0
6eac494258:    	str	w22, [x19, #0x228]  // guest 0x702fe, sampled 0
6eac49425c:    	add	w20, w20, #0x10  // guest 0x70300, sampled 0
6eac494260:    	mov	w22, w20  // guest 0x70300, sampled 0
6eac494264:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x70300, sampled 0
6eac494268:    	and	x16, x16, x20, lsr #7  // guest 0x70300, sampled 0
6eac49426c:    	add	x17, x17, x16  // guest 0x70300, sampled 0
6eac494270:    	ldp	x16, x17, [x17]  // guest 0x70300, sampled 0
6eac494274:    	and	w30, w20, #0xfffff003  // guest 0x70300, sampled 0
6eac494278:    	cmp	w16, w30  // guest 0x70300, sampled 0
6eac49427c:    	b.ne	0x6eac495180 <trace+0x2640>  // guest 0x70300, sampled 0
6eac494280:    	add	x30, x17, w20, uxtw  // guest 0x70300, sampled 0
6eac494284:    	ldapr	w2, [x30]  // guest 0x70300, sampled 0
6eac494288:    	add	x1, x19, #0x258  // guest 0x70300, sampled 0
6eac49428c:    	mov	x0, x19  // guest 0x70300, sampled 0
6eac494290:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x70300, sampled 0
6eac494294:    	add	x16, x16, #0x484  // guest 0x70300, sampled 0
6eac494298:    	blr	x16  // guest 0x70300, sampled 0
6eac49429c:    	lsl	w20, w21, #4  // guest 0x70300, sampled 0
6eac4942a0:    	add	w20, w20, #0x1a0  // guest 0x70300, sampled 0
6eac4942a4:    	sxtw	x20, w20  // guest 0x70300, sampled 0
6eac4942a8:    	add	x1, x20, x19  // guest 0x70300, sampled 0
6eac4942ac:    	add	x2, x19, #0x258  // guest 0x70300, sampled 0
6eac4942b0:    	mov	x0, x19  // guest 0x70300, sampled 0
6eac4942b4:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x70300, sampled 0
6eac4942b8:    	add	x16, x16, #0xb4c  // guest 0x70300, sampled 0
6eac4942bc:    	blr	x16  // guest 0x70300, sampled 0
6eac4942c0:    	ldr	w20, [x19, #0x74]  // guest 0x70300, sampled 0
6eac4942c4:    	strh	w20, [x19, #0x224]  // guest 0x70300, sampled 0
6eac4942c8:    	str	w22, [x19, #0x230]  // guest 0x70300, sampled 0
6eac4942cc:    	ldr	w20, [x19, #0x54]  // guest 0x70300, sampled 0
6eac4942d0:    	strh	w20, [x19, #0x222]  // guest 0x70300, sampled 0
6eac4942d4:    	mov	w20, #0x300             // =768  // guest 0x70300, sampled 0
6eac4942d8:    	movk	w20, #0x7, lsl #16  // guest 0x70300, sampled 0
6eac4942dc:    	str	w20, [x19, #0x228]  // guest 0x70300, sampled 0
6eac4942e0:    	add	w20, w21, #0x5  // guest 0x70303, sampled 0
6eac4942e4:    	and	w20, w20, #0x7  // guest 0x70303, sampled 0
6eac4942e8:    	lsl	w20, w20, #4  // guest 0x70303, sampled 0
6eac4942ec:    	add	w20, w20, #0x1a0  // guest 0x70303, sampled 0
6eac4942f0:    	sxtw	x20, w20  // guest 0x70303, sampled 0
6eac4942f4:    	add	x1, x20, x19  // guest 0x70303, sampled 0
6eac4942f8:    	lsl	w20, w21, #4  // guest 0x70303, sampled 0
6eac4942fc:    	add	w20, w20, #0x1a0  // guest 0x70303, sampled 0
6eac494300:    	sxtw	x20, w20  // guest 0x70303, sampled 0
6eac494304:    	add	x2, x20, x19  // guest 0x70303, sampled 0
6eac494308:    	mov	x0, x19  // guest 0x70303, sampled 0
6eac49430c:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x70303, sampled 0
6eac494310:    	add	x16, x16, #0xc20  // guest 0x70303, sampled 0
6eac494314:    	blr	x16  // guest 0x70303, sampled 0
6eac494318:    	sxtw	x20, w21  // guest 0x70303, sampled 0
6eac49431c:    	add	x20, x20, x19  // guest 0x70303, sampled 0
6eac494320:    	strb	w24, [x20, #0x190]  // guest 0x70303, sampled 0
6eac494324:    	add	w20, w21, w24  // guest 0x70303, sampled 0
6eac494328:    	and	w20, w20, #0x7  // guest 0x70303, sampled 0
6eac49432c:    	str	w20, [x19, #0x188]  // guest 0x70303, sampled 0
6eac494330:    	ldr	w20, [x19, #0x54]  // guest 0x70303, sampled 0
6eac494334:    	strh	w20, [x19, #0x222]  // guest 0x70303, sampled 0
6eac494338:    	mov	w20, #0x303             // =771  // guest 0x70303, sampled 0
6eac49433c:    	movk	w20, #0x7, lsl #16  // guest 0x70303, sampled 0
6eac494340:    	str	w20, [x19, #0x228]  // guest 0x70303, sampled 0
6eac494344:    	mov	w1, #0x3                // =3  // guest 0x70305, sampled 0
6eac494348:    	mov	x0, x19  // guest 0x70305, sampled 0
6eac49434c:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x70305, sampled 0
6eac494350:    	add	x16, x16, #0x5a0  // guest 0x70305, sampled 0
6eac494354:    	blr	x16  // guest 0x70305, sampled 0
6eac494358:    	ldr	w20, [x19, #0x54]  // guest 0x70305, sampled 0
6eac49435c:    	strh	w20, [x19, #0x222]  // guest 0x70305, sampled 0
6eac494360:    	mov	w20, #0x305             // =773  // guest 0x70305, sampled 0
6eac494364:    	movk	w20, #0x7, lsl #16  // guest 0x70305, sampled 0
6eac494368:    	str	w20, [x19, #0x228]  // guest 0x70305, sampled 0
6eac49436c:    	ldr	w20, [x19, #0x4]  // guest 0x70307, sampled 0
6eac494370:    	add	w20, w20, #0x4  // guest 0x70307, sampled 0
6eac494374:    	mov	w21, w20  // guest 0x70307, sampled 0
6eac494378:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x70307, sampled 0
6eac49437c:    	and	x16, x16, x20, lsr #7  // guest 0x70307, sampled 0
6eac494380:    	add	x17, x17, x16  // guest 0x70307, sampled 0
6eac494384:    	ldp	x16, x17, [x17]  // guest 0x70307, sampled 0
6eac494388:    	and	w30, w20, #0xfffff003  // guest 0x70307, sampled 0
6eac49438c:    	cmp	w16, w30  // guest 0x70307, sampled 0
6eac494390:    	b.ne	0x6eac4951ac <trace+0x266c>  // guest 0x70307, sampled 0
6eac494394:    	add	x30, x17, w20, uxtw  // guest 0x70307, sampled 0
6eac494398:    	ldapr	w2, [x30]  // guest 0x70307, sampled 0
6eac49439c:    	add	x1, x19, #0x258  // guest 0x70307, sampled 0
6eac4943a0:    	mov	x0, x19  // guest 0x70307, sampled 0
6eac4943a4:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x70307, sampled 0
6eac4943a8:    	add	x16, x16, #0x484  // guest 0x70307, sampled 0
6eac4943ac:    	blr	x16  // guest 0x70307, sampled 0
6eac4943b0:    	ldr	w20, [x19, #0x188]  // guest 0x70307, sampled 0
6eac4943b4:    	lsl	w20, w20, #4  // guest 0x70307, sampled 0
6eac4943b8:    	add	w20, w20, #0x1a0  // guest 0x70307, sampled 0
6eac4943bc:    	sxtw	x20, w20  // guest 0x70307, sampled 0
6eac4943c0:    	add	x1, x20, x19  // guest 0x70307, sampled 0
6eac4943c4:    	add	x2, x19, #0x258  // guest 0x70307, sampled 0
6eac4943c8:    	mov	x0, x19  // guest 0x70307, sampled 0
6eac4943cc:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x70307, sampled 0
6eac4943d0:    	add	x16, x16, #0xb4c  // guest 0x70307, sampled 0
6eac4943d4:    	blr	x16  // guest 0x70307, sampled 0
6eac4943d8:    	ldr	w20, [x19, #0x74]  // guest 0x70307, sampled 0
6eac4943dc:    	strh	w20, [x19, #0x224]  // guest 0x70307, sampled 0
6eac4943e0:    	str	w21, [x19, #0x230]  // guest 0x70307, sampled 0
6eac4943e4:    	ldr	w20, [x19, #0x54]  // guest 0x70307, sampled 0
6eac4943e8:    	strh	w20, [x19, #0x222]  // guest 0x70307, sampled 0
6eac4943ec:    	mov	w20, #0x307             // =775  // guest 0x70307, sampled 0
6eac4943f0:    	movk	w20, #0x7, lsl #16  // guest 0x70307, sampled 0
6eac4943f4:    	str	w20, [x19, #0x228]  // guest 0x70307, sampled 0
6eac4943f8:    	mov	w1, w24  // guest 0x7030a, sampled 0
6eac4943fc:    	mov	x0, x19  // guest 0x7030a, sampled 1
6eac494400:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x7030a, sampled 0
6eac494404:    	add	x16, x16, #0x5a0  // guest 0x7030a, sampled 0
6eac494408:    	blr	x16  // guest 0x7030a, sampled 0
6eac49440c:    	ldr	w20, [x19, #0x54]  // guest 0x7030a, sampled 0
6eac494410:    	strh	w20, [x19, #0x222]  // guest 0x7030a, sampled 0
6eac494414:    	mov	w20, #0x30a             // =778  // guest 0x7030a, sampled 0
6eac494418:    	movk	w20, #0x7, lsl #16  // guest 0x7030a, sampled 0
6eac49441c:    	str	w20, [x19, #0x228]  // guest 0x7030a, sampled 0
6eac494420:    	ldr	w20, [x19, #0x4]  // guest 0x7030c, sampled 0
6eac494424:    	add	w21, w20, #0x14  // guest 0x7030c, sampled 0
6eac494428:    	mov	w22, w21  // guest 0x7030c, sampled 0
6eac49442c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x7030c, sampled 0
6eac494430:    	and	x16, x16, x21, lsr #7  // guest 0x7030c, sampled 0
6eac494434:    	add	x17, x17, x16  // guest 0x7030c, sampled 0
6eac494438:    	ldp	x16, x17, [x17]  // guest 0x7030c, sampled 0
6eac49443c:    	and	w30, w21, #0xfffff003  // guest 0x7030c, sampled 0
6eac494440:    	cmp	w16, w30  // guest 0x7030c, sampled 0
6eac494444:    	b.ne	0x6eac4951d8 <trace+0x2698>  // guest 0x7030c, sampled 0
6eac494448:    	add	x30, x17, w21, uxtw  // guest 0x7030c, sampled 0
6eac49444c:    	ldapr	w2, [x30]  // guest 0x7030c, sampled 0
6eac494450:    	add	x1, x19, #0x258  // guest 0x7030c, sampled 0
6eac494454:    	mov	x0, x19  // guest 0x7030c, sampled 0
6eac494458:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x7030c, sampled 0
6eac49445c:    	add	x16, x16, #0x484  // guest 0x7030c, sampled 0
6eac494460:    	blr	x16  // guest 0x7030c, sampled 0
6eac494464:    	ldr	w21, [x19, #0x188]  // guest 0x7030c, sampled 0
6eac494468:    	lsl	w23, w21, #4  // guest 0x7030c, sampled 0
6eac49446c:    	add	w23, w23, #0x1a0  // guest 0x7030c, sampled 0
6eac494470:    	sxtw	x23, w23  // guest 0x7030c, sampled 0
6eac494474:    	add	x1, x23, x19  // guest 0x7030c, sampled 0
6eac494478:    	add	x2, x19, #0x258  // guest 0x7030c, sampled 0
6eac49447c:    	mov	x0, x19  // guest 0x7030c, sampled 0
6eac494480:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x7030c, sampled 1
6eac494484:    	add	x16, x16, #0xb4c  // guest 0x7030c, sampled 0
6eac494488:    	blr	x16  // guest 0x7030c, sampled 0
6eac49448c:    	ldr	w23, [x19, #0x74]  // guest 0x7030c, sampled 0
6eac494490:    	strh	w23, [x19, #0x224]  // guest 0x7030c, sampled 0
6eac494494:    	str	w22, [x19, #0x230]  // guest 0x7030c, sampled 0
6eac494498:    	ldr	w22, [x19, #0x54]  // guest 0x7030c, sampled 0
6eac49449c:    	strh	w22, [x19, #0x222]  // guest 0x7030c, sampled 0
6eac4944a0:    	mov	w22, #0x30c             // =780  // guest 0x7030c, sampled 0
6eac4944a4:    	movk	w22, #0x7, lsl #16  // guest 0x7030c, sampled 0
6eac4944a8:    	str	w22, [x19, #0x228]  // guest 0x7030c, sampled 0
6eac4944ac:    	add	w22, w21, w24  // guest 0x7030f, sampled 0
6eac4944b0:    	and	w22, w22, #0x7  // guest 0x7030f, sampled 0
6eac4944b4:    	lsl	w22, w22, #4  // guest 0x7030f, sampled 0
6eac4944b8:    	add	w22, w22, #0x1a0  // guest 0x7030f, sampled 0
6eac4944bc:    	sxtw	x22, w22  // guest 0x7030f, sampled 0
6eac4944c0:    	add	x1, x22, x19  // guest 0x7030f, sampled 0
6eac4944c4:    	lsl	w22, w21, #4  // guest 0x7030f, sampled 0
6eac4944c8:    	add	w22, w22, #0x1a0  // guest 0x7030f, sampled 0
6eac4944cc:    	sxtw	x22, w22  // guest 0x7030f, sampled 0
6eac4944d0:    	add	x2, x22, x19  // guest 0x7030f, sampled 0
6eac4944d4:    	mov	x0, x19  // guest 0x7030f, sampled 0
6eac4944d8:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x7030f, sampled 0
6eac4944dc:    	add	x16, x16, #0xc20  // guest 0x7030f, sampled 0
6eac4944e0:    	blr	x16  // guest 0x7030f, sampled 0
6eac4944e4:    	sxtw	x22, w21  // guest 0x7030f, sampled 0
6eac4944e8:    	add	x22, x22, x19  // guest 0x7030f, sampled 0
6eac4944ec:    	strb	w24, [x22, #0x190]  // guest 0x7030f, sampled 0
6eac4944f0:    	add	w21, w21, w24  // guest 0x7030f, sampled 0
6eac4944f4:    	and	w21, w21, #0x7  // guest 0x7030f, sampled 0
6eac4944f8:    	str	w21, [x19, #0x188]  // guest 0x7030f, sampled 0
6eac4944fc:    	ldr	w22, [x19, #0x54]  // guest 0x7030f, sampled 0
6eac494500:    	strh	w22, [x19, #0x222]  // guest 0x7030f, sampled 0
6eac494504:    	mov	w22, #0x30f             // =783  // guest 0x7030f, sampled 0
6eac494508:    	movk	w22, #0x7, lsl #16  // guest 0x7030f, sampled 0
6eac49450c:    	str	w22, [x19, #0x228]  // guest 0x7030f, sampled 0
6eac494510:    	ldr	w22, [x19, #0x10]  // guest 0x70311, sampled 0
6eac494514:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x70311, sampled 0
6eac494518:    	and	x16, x16, x22, lsr #7  // guest 0x70311, sampled 0
6eac49451c:    	add	x17, x17, x16  // guest 0x70311, sampled 0
6eac494520:    	ldp	x16, x17, [x17]  // guest 0x70311, sampled 0
6eac494524:    	and	w30, w22, #0xfffff003  // guest 0x70311, sampled 0
6eac494528:    	cmp	w16, w30  // guest 0x70311, sampled 0
6eac49452c:    	b.ne	0x6eac495204 <trace+0x26c4>  // guest 0x70311, sampled 0
6eac494530:    	add	x30, x17, w22, uxtw  // guest 0x70311, sampled 0
6eac494534:    	ldapr	w2, [x30]  // guest 0x70311, sampled 0
6eac494538:    	add	w23, w21, #0x7  // guest 0x70311, sampled 0
6eac49453c:    	and	w23, w23, #0x7  // guest 0x70311, sampled 0
6eac494540:    	lsl	w23, w23, #4  // guest 0x70311, sampled 0
6eac494544:    	add	w23, w23, #0x1a0  // guest 0x70311, sampled 0
6eac494548:    	sxtw	x23, w23  // guest 0x70311, sampled 0
6eac49454c:    	add	x1, x23, x19  // guest 0x70311, sampled 0
6eac494550:    	mov	x0, x19  // guest 0x70311, sampled 0
6eac494554:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x70311, sampled 0
6eac494558:    	add	x16, x16, #0x484  // guest 0x70311, sampled 0
6eac49455c:    	blr	x16  // guest 0x70311, sampled 0
6eac494560:    	sub	w21, w21, #0x1  // guest 0x70311, sampled 0
6eac494564:    	and	w21, w21, #0x7  // guest 0x70311, sampled 0
6eac494568:    	str	w21, [x19, #0x188]  // guest 0x70311, sampled 0
6eac49456c:    	sxtw	x23, w21  // guest 0x70311, sampled 0
6eac494570:    	add	x23, x23, x19  // guest 0x70311, sampled 0
6eac494574:    	strb	wzr, [x23, #0x190]  // guest 0x70311, sampled 0
6eac494578:    	ldr	w23, [x19, #0x64]  // guest 0x70311, sampled 0
6eac49457c:    	strh	w23, [x19, #0x224]  // guest 0x70311, sampled 0
6eac494580:    	str	w22, [x19, #0x230]  // guest 0x70311, sampled 0
6eac494584:    	ldr	w22, [x19, #0x54]  // guest 0x70311, sampled 0
6eac494588:    	strh	w22, [x19, #0x222]  // guest 0x70311, sampled 0
6eac49458c:    	mov	w22, #0x311             // =785  // guest 0x70311, sampled 0
6eac494590:    	movk	w22, #0x7, lsl #16  // guest 0x70311, sampled 0
6eac494594:    	str	w22, [x19, #0x228]  // guest 0x70311, sampled 0
6eac494598:    	add	w22, w20, #0x34  // guest 0x70314, sampled 0
6eac49459c:    	mov	w23, w22  // guest 0x70314, sampled 0
6eac4945a0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x70314, sampled 0
6eac4945a4:    	and	x16, x16, x22, lsr #7  // guest 0x70314, sampled 0
6eac4945a8:    	add	x17, x17, x16  // guest 0x70314, sampled 0
6eac4945ac:    	ldp	x16, x17, [x17]  // guest 0x70314, sampled 0
6eac4945b0:    	and	w30, w22, #0xfffff003  // guest 0x70314, sampled 0
6eac4945b4:    	cmp	w16, w30  // guest 0x70314, sampled 0
6eac4945b8:    	b.ne	0x6eac495230 <trace+0x26f0>  // guest 0x70314, sampled 0
6eac4945bc:    	add	x30, x17, w22, uxtw  // guest 0x70314, sampled 0
6eac4945c0:    	ldapr	w2, [x30]  // guest 0x70314, sampled 0
6eac4945c4:    	add	x1, x19, #0x258  // guest 0x70314, sampled 0
6eac4945c8:    	mov	x0, x19  // guest 0x70314, sampled 0
6eac4945cc:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x70314, sampled 0
6eac4945d0:    	add	x16, x16, #0x484  // guest 0x70314, sampled 0
6eac4945d4:    	blr	x16  // guest 0x70314, sampled 0
6eac4945d8:    	lsl	w22, w21, #4  // guest 0x70314, sampled 0
6eac4945dc:    	add	w22, w22, #0x1a0  // guest 0x70314, sampled 0
6eac4945e0:    	sxtw	x22, w22  // guest 0x70314, sampled 0
6eac4945e4:    	add	x1, x22, x19  // guest 0x70314, sampled 0
6eac4945e8:    	add	x2, x19, #0x258  // guest 0x70314, sampled 0
6eac4945ec:    	mov	x0, x19  // guest 0x70314, sampled 0
6eac4945f0:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x70314, sampled 0
6eac4945f4:    	add	x16, x16, #0xb4c  // guest 0x70314, sampled 0
6eac4945f8:    	blr	x16  // guest 0x70314, sampled 0
6eac4945fc:    	ldr	w22, [x19, #0x74]  // guest 0x70314, sampled 0
6eac494600:    	strh	w22, [x19, #0x224]  // guest 0x70314, sampled 0
6eac494604:    	str	w23, [x19, #0x230]  // guest 0x70314, sampled 0
6eac494608:    	ldr	w22, [x19, #0x54]  // guest 0x70314, sampled 0
6eac49460c:    	strh	w22, [x19, #0x222]  // guest 0x70314, sampled 0
6eac494610:    	mov	w22, #0x314             // =788  // guest 0x70314, sampled 0
6eac494614:    	movk	w22, #0x7, lsl #16  // guest 0x70314, sampled 0
6eac494618:    	str	w22, [x19, #0x228]  // guest 0x70314, sampled 0
6eac49461c:    	add	w22, w21, w24  // guest 0x70317, sampled 0
6eac494620:    	and	w22, w22, #0x7  // guest 0x70317, sampled 0
6eac494624:    	lsl	w22, w22, #4  // guest 0x70317, sampled 0
6eac494628:    	add	w22, w22, #0x1a0  // guest 0x70317, sampled 0
6eac49462c:    	sxtw	x22, w22  // guest 0x70317, sampled 0
6eac494630:    	add	x1, x22, x19  // guest 0x70317, sampled 0
6eac494634:    	lsl	w22, w21, #4  // guest 0x70317, sampled 0
6eac494638:    	add	w22, w22, #0x1a0  // guest 0x70317, sampled 0
6eac49463c:    	sxtw	x22, w22  // guest 0x70317, sampled 0
6eac494640:    	add	x2, x22, x19  // guest 0x70317, sampled 0
6eac494644:    	mov	x0, x19  // guest 0x70317, sampled 0
6eac494648:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x70317, sampled 0
6eac49464c:    	add	x16, x16, #0xa78  // guest 0x70317, sampled 0
6eac494650:    	blr	x16  // guest 0x70317, sampled 0
6eac494654:    	sxtw	x22, w21  // guest 0x70317, sampled 0
6eac494658:    	add	x22, x22, x19  // guest 0x70317, sampled 1
6eac49465c:    	strb	w24, [x22, #0x190]  // guest 0x70317, sampled 0
6eac494660:    	add	w21, w21, w24  // guest 0x70317, sampled 0
6eac494664:    	and	w21, w21, #0x7  // guest 0x70317, sampled 0
6eac494668:    	str	w21, [x19, #0x188]  // guest 0x70317, sampled 0
6eac49466c:    	ldr	w22, [x19, #0x54]  // guest 0x70317, sampled 0
6eac494670:    	strh	w22, [x19, #0x222]  // guest 0x70317, sampled 0
6eac494674:    	mov	w22, #0x317             // =791  // guest 0x70317, sampled 0
6eac494678:    	movk	w22, #0x7, lsl #16  // guest 0x70317, sampled 0
6eac49467c:    	str	w22, [x19, #0x228]  // guest 0x70317, sampled 0
6eac494680:    	add	w22, w20, #0x20  // guest 0x70319, sampled 0
6eac494684:    	mov	w23, w22  // guest 0x70319, sampled 0
6eac494688:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x70319, sampled 0
6eac49468c:    	and	x16, x16, x22, lsr #7  // guest 0x70319, sampled 0
6eac494690:    	add	x17, x17, x16  // guest 0x70319, sampled 0
6eac494694:    	ldp	x16, x17, [x17]  // guest 0x70319, sampled 0
6eac494698:    	and	w30, w22, #0xfffff003  // guest 0x70319, sampled 0
6eac49469c:    	cmp	w16, w30  // guest 0x70319, sampled 0
6eac4946a0:    	b.ne	0x6eac49525c <trace+0x271c>  // guest 0x70319, sampled 0
6eac4946a4:    	add	x30, x17, w22, uxtw  // guest 0x70319, sampled 0
6eac4946a8:    	ldapr	w2, [x30]  // guest 0x70319, sampled 0
6eac4946ac:    	add	x1, x19, #0x258  // guest 0x70319, sampled 0
6eac4946b0:    	mov	x0, x19  // guest 0x70319, sampled 0
6eac4946b4:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x70319, sampled 0
6eac4946b8:    	add	x16, x16, #0x484  // guest 0x70319, sampled 0
6eac4946bc:    	blr	x16  // guest 0x70319, sampled 0
6eac4946c0:    	lsl	w22, w21, #4  // guest 0x70319, sampled 0
6eac4946c4:    	add	w22, w22, #0x1a0  // guest 0x70319, sampled 0
6eac4946c8:    	sxtw	x22, w22  // guest 0x70319, sampled 0
6eac4946cc:    	add	x1, x22, x19  // guest 0x70319, sampled 0
6eac4946d0:    	add	x2, x19, #0x258  // guest 0x70319, sampled 0
6eac4946d4:    	mov	x0, x19  // guest 0x70319, sampled 0
6eac4946d8:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x70319, sampled 0
6eac4946dc:    	add	x16, x16, #0xb4c  // guest 0x70319, sampled 0
6eac4946e0:    	blr	x16  // guest 0x70319, sampled 0
6eac4946e4:    	ldr	w22, [x19, #0x74]  // guest 0x70319, sampled 0
6eac4946e8:    	strh	w22, [x19, #0x224]  // guest 0x70319, sampled 0
6eac4946ec:    	str	w23, [x19, #0x230]  // guest 0x70319, sampled 0
6eac4946f0:    	ldr	w22, [x19, #0x54]  // guest 0x70319, sampled 0
6eac4946f4:    	strh	w22, [x19, #0x222]  // guest 0x70319, sampled 0
6eac4946f8:    	mov	w22, #0x319             // =793  // guest 0x70319, sampled 0
6eac4946fc:    	movk	w22, #0x7, lsl #16  // guest 0x70319, sampled 0
6eac494700:    	str	w22, [x19, #0x228]  // guest 0x70319, sampled 0
6eac494704:    	add	w22, w21, #0x3  // guest 0x7031c, sampled 0
6eac494708:    	and	w22, w22, #0x7  // guest 0x7031c, sampled 0
6eac49470c:    	lsl	w22, w22, #4  // guest 0x7031c, sampled 0
6eac494710:    	add	w22, w22, #0x1a0  // guest 0x7031c, sampled 0
6eac494714:    	sxtw	x22, w22  // guest 0x7031c, sampled 0
6eac494718:    	add	x1, x22, x19  // guest 0x7031c, sampled 0
6eac49471c:    	lsl	w22, w21, #4  // guest 0x7031c, sampled 0
6eac494720:    	add	w22, w22, #0x1a0  // guest 0x7031c, sampled 0
6eac494724:    	sxtw	x22, w22  // guest 0x7031c, sampled 0
6eac494728:    	add	x2, x22, x19  // guest 0x7031c, sampled 0
6eac49472c:    	mov	x0, x19  // guest 0x7031c, sampled 0
6eac494730:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x7031c, sampled 0
6eac494734:    	add	x16, x16, #0xa78  // guest 0x7031c, sampled 0
6eac494738:    	blr	x16  // guest 0x7031c, sampled 0
6eac49473c:    	sxtw	x22, w21  // guest 0x7031c, sampled 0
6eac494740:    	add	x22, x22, x19  // guest 0x7031c, sampled 0
6eac494744:    	strb	w24, [x22, #0x190]  // guest 0x7031c, sampled 0
6eac494748:    	add	w21, w21, w24  // guest 0x7031c, sampled 0
6eac49474c:    	and	w21, w21, #0x7  // guest 0x7031c, sampled 0
6eac494750:    	str	w21, [x19, #0x188]  // guest 0x7031c, sampled 0
6eac494754:    	ldr	w22, [x19, #0x54]  // guest 0x7031c, sampled 0
6eac494758:    	strh	w22, [x19, #0x222]  // guest 0x7031c, sampled 0
6eac49475c:    	mov	w22, #0x31c             // =796  // guest 0x7031c, sampled 0
6eac494760:    	movk	w22, #0x7, lsl #16  // guest 0x7031c, sampled 0
6eac494764:    	str	w22, [x19, #0x228]  // guest 0x7031c, sampled 0
6eac494768:    	add	w20, w20, #0x4  // guest 0x7031e, sampled 0
6eac49476c:    	mov	w22, w20  // guest 0x7031e, sampled 0
6eac494770:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x7031e, sampled 0
6eac494774:    	and	x16, x16, x20, lsr #7  // guest 0x7031e, sampled 0
6eac494778:    	add	x17, x17, x16  // guest 0x7031e, sampled 0
6eac49477c:    	ldp	x16, x17, [x17]  // guest 0x7031e, sampled 0
6eac494780:    	and	w30, w20, #0xfffff003  // guest 0x7031e, sampled 0
6eac494784:    	cmp	w16, w30  // guest 0x7031e, sampled 0
6eac494788:    	b.ne	0x6eac495288 <trace+0x2748>  // guest 0x7031e, sampled 0
6eac49478c:    	add	x30, x17, w20, uxtw  // guest 0x7031e, sampled 0
6eac494790:    	ldapr	w2, [x30]  // guest 0x7031e, sampled 0
6eac494794:    	add	x1, x19, #0x258  // guest 0x7031e, sampled 1
6eac494798:    	mov	x0, x19  // guest 0x7031e, sampled 0
6eac49479c:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x7031e, sampled 0
6eac4947a0:    	add	x16, x16, #0x484  // guest 0x7031e, sampled 0
6eac4947a4:    	blr	x16  // guest 0x7031e, sampled 0
6eac4947a8:    	lsl	w20, w21, #4  // guest 0x7031e, sampled 0
6eac4947ac:    	add	w20, w20, #0x1a0  // guest 0x7031e, sampled 0
6eac4947b0:    	sxtw	x20, w20  // guest 0x7031e, sampled 0
6eac4947b4:    	add	x1, x20, x19  // guest 0x7031e, sampled 0
6eac4947b8:    	add	x2, x19, #0x258  // guest 0x7031e, sampled 0
6eac4947bc:    	mov	x0, x19  // guest 0x7031e, sampled 0
6eac4947c0:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x7031e, sampled 0
6eac4947c4:    	add	x16, x16, #0xb4c  // guest 0x7031e, sampled 0
6eac4947c8:    	blr	x16  // guest 0x7031e, sampled 0
6eac4947cc:    	ldr	w20, [x19, #0x74]  // guest 0x7031e, sampled 0
6eac4947d0:    	strh	w20, [x19, #0x224]  // guest 0x7031e, sampled 0
6eac4947d4:    	str	w22, [x19, #0x230]  // guest 0x7031e, sampled 0
6eac4947d8:    	ldr	w20, [x19, #0x54]  // guest 0x7031e, sampled 0
6eac4947dc:    	strh	w20, [x19, #0x222]  // guest 0x7031e, sampled 0
6eac4947e0:    	mov	w20, #0x31e             // =798  // guest 0x7031e, sampled 0
6eac4947e4:    	movk	w20, #0x7, lsl #16  // guest 0x7031e, sampled 0
6eac4947e8:    	str	w20, [x19, #0x228]  // guest 0x7031e, sampled 0
6eac4947ec:    	mov	w1, w24  // guest 0x70321, sampled 0
6eac4947f0:    	mov	x0, x19  // guest 0x70321, sampled 0
6eac4947f4:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x70321, sampled 0
6eac4947f8:    	add	x16, x16, #0x5a0  // guest 0x70321, sampled 0
6eac4947fc:    	blr	x16  // guest 0x70321, sampled 0
6eac494800:    	ldr	w20, [x19, #0x54]  // guest 0x70321, sampled 0
6eac494804:    	strh	w20, [x19, #0x222]  // guest 0x70321, sampled 0
6eac494808:    	mov	w20, #0x321             // =801  // guest 0x70321, sampled 0
6eac49480c:    	movk	w20, #0x7, lsl #16  // guest 0x70321, sampled 0
6eac494810:    	str	w20, [x19, #0x228]  // guest 0x70321, sampled 0
6eac494814:    	ldr	w20, [x19, #0x4]  // guest 0x70323, sampled 0
6eac494818:    	add	w21, w20, #0x14  // guest 0x70323, sampled 0
6eac49481c:    	mov	w22, w21  // guest 0x70323, sampled 0
6eac494820:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x70323, sampled 0
6eac494824:    	and	x16, x16, x21, lsr #7  // guest 0x70323, sampled 0
6eac494828:    	add	x17, x17, x16  // guest 0x70323, sampled 0
6eac49482c:    	ldp	x16, x17, [x17]  // guest 0x70323, sampled 0
6eac494830:    	and	w30, w21, #0xfffff003  // guest 0x70323, sampled 1
6eac494834:    	cmp	w16, w30  // guest 0x70323, sampled 0
6eac494838:    	b.ne	0x6eac4952b4 <trace+0x2774>  // guest 0x70323, sampled 0
6eac49483c:    	add	x30, x17, w21, uxtw  // guest 0x70323, sampled 0
6eac494840:    	ldapr	w2, [x30]  // guest 0x70323, sampled 0
6eac494844:    	add	x1, x19, #0x258  // guest 0x70323, sampled 1
6eac494848:    	mov	x0, x19  // guest 0x70323, sampled 0
6eac49484c:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x70323, sampled 0
6eac494850:    	add	x16, x16, #0x484  // guest 0x70323, sampled 0
6eac494854:    	blr	x16  // guest 0x70323, sampled 0
6eac494858:    	ldr	w21, [x19, #0x188]  // guest 0x70323, sampled 0
6eac49485c:    	lsl	w23, w21, #4  // guest 0x70323, sampled 0
6eac494860:    	add	w23, w23, #0x1a0  // guest 0x70323, sampled 0
6eac494864:    	sxtw	x23, w23  // guest 0x70323, sampled 0
6eac494868:    	add	x1, x23, x19  // guest 0x70323, sampled 0
6eac49486c:    	add	x2, x19, #0x258  // guest 0x70323, sampled 0
6eac494870:    	mov	x0, x19  // guest 0x70323, sampled 0
6eac494874:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x70323, sampled 0
6eac494878:    	add	x16, x16, #0xb4c  // guest 0x70323, sampled 0
6eac49487c:    	blr	x16  // guest 0x70323, sampled 0
6eac494880:    	ldr	w23, [x19, #0x74]  // guest 0x70323, sampled 0
6eac494884:    	strh	w23, [x19, #0x224]  // guest 0x70323, sampled 0
6eac494888:    	str	w22, [x19, #0x230]  // guest 0x70323, sampled 0
6eac49488c:    	ldr	w22, [x19, #0x54]  // guest 0x70323, sampled 0
6eac494890:    	strh	w22, [x19, #0x222]  // guest 0x70323, sampled 0
6eac494894:    	mov	w22, #0x323             // =803  // guest 0x70323, sampled 0
6eac494898:    	movk	w22, #0x7, lsl #16  // guest 0x70323, sampled 0
6eac49489c:    	str	w22, [x19, #0x228]  // guest 0x70323, sampled 0
6eac4948a0:    	add	w22, w21, w24  // guest 0x70326, sampled 0
6eac4948a4:    	and	w22, w22, #0x7  // guest 0x70326, sampled 0
6eac4948a8:    	lsl	w22, w22, #4  // guest 0x70326, sampled 0
6eac4948ac:    	add	w22, w22, #0x1a0  // guest 0x70326, sampled 0
6eac4948b0:    	sxtw	x22, w22  // guest 0x70326, sampled 0
6eac4948b4:    	add	x1, x22, x19  // guest 0x70326, sampled 0
6eac4948b8:    	lsl	w22, w21, #4  // guest 0x70326, sampled 0
6eac4948bc:    	add	w22, w22, #0x1a0  // guest 0x70326, sampled 0
6eac4948c0:    	sxtw	x22, w22  // guest 0x70326, sampled 0
6eac4948c4:    	add	x2, x22, x19  // guest 0x70326, sampled 0
6eac4948c8:    	mov	x0, x19  // guest 0x70326, sampled 0
6eac4948cc:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x70326, sampled 0
6eac4948d0:    	add	x16, x16, #0xc20  // guest 0x70326, sampled 0
6eac4948d4:    	blr	x16  // guest 0x70326, sampled 0
6eac4948d8:    	sxtw	x22, w21  // guest 0x70326, sampled 0
6eac4948dc:    	add	x22, x22, x19  // guest 0x70326, sampled 0
6eac4948e0:    	strb	w24, [x22, #0x190]  // guest 0x70326, sampled 0
6eac4948e4:    	add	w21, w21, w24  // guest 0x70326, sampled 0
6eac4948e8:    	and	w21, w21, #0x7  // guest 0x70326, sampled 0
6eac4948ec:    	str	w21, [x19, #0x188]  // guest 0x70326, sampled 0
6eac4948f0:    	ldr	w22, [x19, #0x54]  // guest 0x70326, sampled 0
6eac4948f4:    	strh	w22, [x19, #0x222]  // guest 0x70326, sampled 0
6eac4948f8:    	mov	w22, #0x326             // =806  // guest 0x70326, sampled 0
6eac4948fc:    	movk	w22, #0x7, lsl #16  // guest 0x70326, sampled 0
6eac494900:    	str	w22, [x19, #0x228]  // guest 0x70326, sampled 0
6eac494904:    	ldr	w22, [x19, #0x10]  // guest 0x70328, sampled 0
6eac494908:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x70328, sampled 0
6eac49490c:    	and	x16, x16, x22, lsr #7  // guest 0x70328, sampled 0
6eac494910:    	add	x17, x17, x16  // guest 0x70328, sampled 0
6eac494914:    	ldp	x16, x17, [x17]  // guest 0x70328, sampled 0
6eac494918:    	and	w30, w22, #0xfffff003  // guest 0x70328, sampled 0
6eac49491c:    	cmp	w16, w30  // guest 0x70328, sampled 0
6eac494920:    	b.ne	0x6eac4952e0 <trace+0x27a0>  // guest 0x70328, sampled 0
6eac494924:    	add	x30, x17, w22, uxtw  // guest 0x70328, sampled 0
6eac494928:    	ldapr	w2, [x30]  // guest 0x70328, sampled 0
6eac49492c:    	add	w23, w21, #0x7  // guest 0x70328, sampled 2
6eac494930:    	and	w23, w23, #0x7  // guest 0x70328, sampled 0
6eac494934:    	lsl	w23, w23, #4  // guest 0x70328, sampled 0
6eac494938:    	add	w23, w23, #0x1a0  // guest 0x70328, sampled 0
6eac49493c:    	sxtw	x23, w23  // guest 0x70328, sampled 0
6eac494940:    	add	x1, x23, x19  // guest 0x70328, sampled 0
6eac494944:    	mov	x0, x19  // guest 0x70328, sampled 0
6eac494948:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x70328, sampled 0
6eac49494c:    	add	x16, x16, #0x484  // guest 0x70328, sampled 0
6eac494950:    	blr	x16  // guest 0x70328, sampled 0
6eac494954:    	sub	w21, w21, #0x1  // guest 0x70328, sampled 0
6eac494958:    	and	w21, w21, #0x7  // guest 0x70328, sampled 0
6eac49495c:    	str	w21, [x19, #0x188]  // guest 0x70328, sampled 0
6eac494960:    	sxtw	x23, w21  // guest 0x70328, sampled 0
6eac494964:    	add	x23, x23, x19  // guest 0x70328, sampled 0
6eac494968:    	strb	wzr, [x23, #0x190]  // guest 0x70328, sampled 0
6eac49496c:    	ldr	w23, [x19, #0x64]  // guest 0x70328, sampled 0
6eac494970:    	strh	w23, [x19, #0x224]  // guest 0x70328, sampled 0
6eac494974:    	str	w22, [x19, #0x230]  // guest 0x70328, sampled 0
6eac494978:    	ldr	w23, [x19, #0x54]  // guest 0x70328, sampled 0
6eac49497c:    	strh	w23, [x19, #0x222]  // guest 0x70328, sampled 0
6eac494980:    	mov	w23, #0x328             // =808  // guest 0x70328, sampled 0
6eac494984:    	movk	w23, #0x7, lsl #16  // guest 0x70328, sampled 0
6eac494988:    	str	w23, [x19, #0x228]  // guest 0x70328, sampled 0
6eac49498c:    	add	w23, w20, #0x24  // guest 0x7032b, sampled 0
6eac494990:    	mov	w25, w23  // guest 0x7032b, sampled 0
6eac494994:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x7032b, sampled 0
6eac494998:    	and	x16, x16, x23, lsr #7  // guest 0x7032b, sampled 0
6eac49499c:    	add	x17, x17, x16  // guest 0x7032b, sampled 0
6eac4949a0:    	ldp	x16, x17, [x17]  // guest 0x7032b, sampled 0
6eac4949a4:    	and	w30, w23, #0xfffff003  // guest 0x7032b, sampled 0
6eac4949a8:    	cmp	w16, w30  // guest 0x7032b, sampled 0
6eac4949ac:    	b.ne	0x6eac49530c <trace+0x27cc>  // guest 0x7032b, sampled 0
6eac4949b0:    	add	x30, x17, w23, uxtw  // guest 0x7032b, sampled 0
6eac4949b4:    	ldapr	w2, [x30]  // guest 0x7032b, sampled 0
6eac4949b8:    	add	x1, x19, #0x258  // guest 0x7032b, sampled 0
6eac4949bc:    	mov	x0, x19  // guest 0x7032b, sampled 0
6eac4949c0:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x7032b, sampled 0
6eac4949c4:    	add	x16, x16, #0x484  // guest 0x7032b, sampled 0
6eac4949c8:    	blr	x16  // guest 0x7032b, sampled 0
6eac4949cc:    	lsl	w23, w21, #4  // guest 0x7032b, sampled 0
6eac4949d0:    	add	w23, w23, #0x1a0  // guest 0x7032b, sampled 0
6eac4949d4:    	sxtw	x23, w23  // guest 0x7032b, sampled 0
6eac4949d8:    	add	x1, x23, x19  // guest 0x7032b, sampled 0
6eac4949dc:    	add	x2, x19, #0x258  // guest 0x7032b, sampled 0
6eac4949e0:    	mov	x0, x19  // guest 0x7032b, sampled 0
6eac4949e4:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x7032b, sampled 0
6eac4949e8:    	add	x16, x16, #0xb4c  // guest 0x7032b, sampled 0
6eac4949ec:    	blr	x16  // guest 0x7032b, sampled 0
6eac4949f0:    	ldr	w23, [x19, #0x74]  // guest 0x7032b, sampled 0
6eac4949f4:    	strh	w23, [x19, #0x224]  // guest 0x7032b, sampled 0
6eac4949f8:    	str	w25, [x19, #0x230]  // guest 0x7032b, sampled 0
6eac4949fc:    	ldr	w23, [x19, #0x54]  // guest 0x7032b, sampled 0
6eac494a00:    	strh	w23, [x19, #0x222]  // guest 0x7032b, sampled 0
6eac494a04:    	mov	w23, #0x32b             // =811  // guest 0x7032b, sampled 0
6eac494a08:    	movk	w23, #0x7, lsl #16  // guest 0x7032b, sampled 0
6eac494a0c:    	str	w23, [x19, #0x228]  // guest 0x7032b, sampled 0
6eac494a10:    	add	w23, w21, w24  // guest 0x7032e, sampled 0
6eac494a14:    	and	w23, w23, #0x7  // guest 0x7032e, sampled 0
6eac494a18:    	lsl	w23, w23, #4  // guest 0x7032e, sampled 0
6eac494a1c:    	add	w23, w23, #0x1a0  // guest 0x7032e, sampled 0
6eac494a20:    	sxtw	x23, w23  // guest 0x7032e, sampled 0
6eac494a24:    	add	x1, x23, x19  // guest 0x7032e, sampled 0
6eac494a28:    	lsl	w23, w21, #4  // guest 0x7032e, sampled 0
6eac494a2c:    	add	w23, w23, #0x1a0  // guest 0x7032e, sampled 0
6eac494a30:    	sxtw	x23, w23  // guest 0x7032e, sampled 0
6eac494a34:    	add	x2, x23, x19  // guest 0x7032e, sampled 0
6eac494a38:    	mov	x0, x19  // guest 0x7032e, sampled 0
6eac494a3c:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x7032e, sampled 0
6eac494a40:    	add	x16, x16, #0xa78  // guest 0x7032e, sampled 0
6eac494a44:    	blr	x16  // guest 0x7032e, sampled 0
6eac494a48:    	sxtw	x23, w21  // guest 0x7032e, sampled 0
6eac494a4c:    	add	x23, x23, x19  // guest 0x7032e, sampled 0
6eac494a50:    	strb	w24, [x23, #0x190]  // guest 0x7032e, sampled 0
6eac494a54:    	add	w21, w21, w24  // guest 0x7032e, sampled 0
6eac494a58:    	and	w21, w21, #0x7  // guest 0x7032e, sampled 0
6eac494a5c:    	str	w21, [x19, #0x188]  // guest 0x7032e, sampled 0
6eac494a60:    	ldr	w23, [x19, #0x54]  // guest 0x7032e, sampled 0
6eac494a64:    	strh	w23, [x19, #0x222]  // guest 0x7032e, sampled 0
6eac494a68:    	mov	w23, #0x32e             // =814  // guest 0x7032e, sampled 0
6eac494a6c:    	movk	w23, #0x7, lsl #16  // guest 0x7032e, sampled 0
6eac494a70:    	str	w23, [x19, #0x228]  // guest 0x7032e, sampled 0
6eac494a74:    	add	w20, w20, #0x30  // guest 0x70330, sampled 0
6eac494a78:    	mov	w23, w20  // guest 0x70330, sampled 0
6eac494a7c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x70330, sampled 0
6eac494a80:    	and	x16, x16, x20, lsr #7  // guest 0x70330, sampled 0
6eac494a84:    	add	x17, x17, x16  // guest 0x70330, sampled 0
6eac494a88:    	ldp	x16, x17, [x17]  // guest 0x70330, sampled 0
6eac494a8c:    	and	w30, w20, #0xfffff003  // guest 0x70330, sampled 0
6eac494a90:    	cmp	w16, w30  // guest 0x70330, sampled 0
6eac494a94:    	b.ne	0x6eac495338 <trace+0x27f8>  // guest 0x70330, sampled 0
6eac494a98:    	add	x30, x17, w20, uxtw  // guest 0x70330, sampled 0
6eac494a9c:    	ldapr	w2, [x30]  // guest 0x70330, sampled 0
6eac494aa0:    	add	x1, x19, #0x258  // guest 0x70330, sampled 0
6eac494aa4:    	mov	x0, x19  // guest 0x70330, sampled 0
6eac494aa8:    	adrp	x16, 0x6efc8aa000 <trace+0x50417000>  // guest 0x70330, sampled 0
6eac494aac:    	add	x16, x16, #0x484  // guest 0x70330, sampled 0
6eac494ab0:    	blr	x16  // guest 0x70330, sampled 0
6eac494ab4:    	lsl	w20, w21, #4  // guest 0x70330, sampled 0
6eac494ab8:    	add	w20, w20, #0x1a0  // guest 0x70330, sampled 0
6eac494abc:    	sxtw	x20, w20  // guest 0x70330, sampled 0
6eac494ac0:    	add	x1, x20, x19  // guest 0x70330, sampled 0
6eac494ac4:    	add	x2, x19, #0x258  // guest 0x70330, sampled 0
6eac494ac8:    	mov	x0, x19  // guest 0x70330, sampled 0
6eac494acc:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x70330, sampled 0
6eac494ad0:    	add	x16, x16, #0xb4c  // guest 0x70330, sampled 0
6eac494ad4:    	blr	x16  // guest 0x70330, sampled 0
6eac494ad8:    	ldr	w20, [x19, #0x74]  // guest 0x70330, sampled 0
6eac494adc:    	strh	w20, [x19, #0x224]  // guest 0x70330, sampled 0
6eac494ae0:    	str	w23, [x19, #0x230]  // guest 0x70330, sampled 0
6eac494ae4:    	ldr	w20, [x19, #0x54]  // guest 0x70330, sampled 0
6eac494ae8:    	strh	w20, [x19, #0x222]  // guest 0x70330, sampled 0
6eac494aec:    	mov	w20, #0x330             // =816  // guest 0x70330, sampled 0
6eac494af0:    	movk	w20, #0x7, lsl #16  // guest 0x70330, sampled 0
6eac494af4:    	str	w20, [x19, #0x228]  // guest 0x70330, sampled 0
6eac494af8:    	add	w20, w21, w24  // guest 0x70333, sampled 0
6eac494afc:    	and	w20, w20, #0x7  // guest 0x70333, sampled 0
6eac494b00:    	lsl	w20, w20, #4  // guest 0x70333, sampled 0
6eac494b04:    	add	w20, w20, #0x1a0  // guest 0x70333, sampled 0
6eac494b08:    	sxtw	x20, w20  // guest 0x70333, sampled 0
6eac494b0c:    	add	x1, x20, x19  // guest 0x70333, sampled 0
6eac494b10:    	lsl	w20, w21, #4  // guest 0x70333, sampled 0
6eac494b14:    	add	w20, w20, #0x1a0  // guest 0x70333, sampled 0
6eac494b18:    	sxtw	x20, w20  // guest 0x70333, sampled 0
6eac494b1c:    	add	x2, x20, x19  // guest 0x70333, sampled 0
6eac494b20:    	mov	x0, x19  // guest 0x70333, sampled 0
6eac494b24:    	adrp	x16, 0x6efc8ab000 <trace+0x50418000>  // guest 0x70333, sampled 0
6eac494b28:    	add	x16, x16, #0xc20  // guest 0x70333, sampled 0
6eac494b2c:    	blr	x16  // guest 0x70333, sampled 0
6eac494b30:    	sxtw	x20, w21  // guest 0x70333, sampled 0
6eac494b34:    	add	x20, x20, x19  // guest 0x70333, sampled 0
6eac494b38:    	strb	w24, [x20, #0x190]  // guest 0x70333, sampled 0
6eac494b3c:    	add	w20, w21, w24  // guest 0x70333, sampled 0
6eac494b40:    	and	w20, w20, #0x7  // guest 0x70333, sampled 0
6eac494b44:    	str	w20, [x19, #0x188]  // guest 0x70333, sampled 0
6eac494b48:    	ldr	w20, [x19, #0x54]  // guest 0x70333, sampled 0
6eac494b4c:    	strh	w20, [x19, #0x222]  // guest 0x70333, sampled 0
6eac494b50:    	mov	w20, #0x333             // =819  // guest 0x70333, sampled 0
6eac494b54:    	movk	w20, #0x7, lsl #16  // guest 0x70333, sampled 0
6eac494b58:    	str	w20, [x19, #0x228]  // guest 0x70333, sampled 0
6eac494b5c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x70335, sampled 0
6eac494b60:    	and	x16, x16, x22, lsr #7  // guest 0x70335, sampled 0
6eac494b64:    	add	x17, x17, x16  // guest 0x70335, sampled 0
6eac494b68:    	ldp	x16, x17, [x17]  // guest 0x70335, sampled 0
6eac494b6c:    	and	w30, w22, #0xfffff003  // guest 0x70335, sampled 0
6eac494b70:    	cmp	w16, w30  // guest 0x70335, sampled 0
6eac494b74:    	b.ne	0x6eac495364 <trace+0x2824>  // guest 0x70335, sampled 0
6eac494b78:    	add	x30, x17, w22, uxtw  // guest 0x70335, sampled 0
6eac494b7c:    	ldapr	w20, [x30]  // guest 0x70335, sampled 0
6eac494b80:    	add	w21, w22, #0x4  // guest 0x70335, sampled 0
6eac494b84:    	str	w21, [x19, #0x10]  // guest 0x70335, sampled 0
6eac494b88:    	str	w20, [x19, #0x4]  // guest 0x70335, sampled 0
6eac494b8c:    	sturb	w24, [x19, #-0xc]  // guest 0x70335, sampled 0
6eac494b90:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x70336, sampled 0
6eac494b94:    	and	x16, x16, x21, lsr #7  // guest 0x70336, sampled 0
6eac494b98:    	add	x17, x17, x16  // guest 0x70336, sampled 0
6eac494b9c:    	ldp	x16, x17, [x17]  // guest 0x70336, sampled 0
6eac494ba0:    	and	w30, w21, #0xfffff003  // guest 0x70336, sampled 0
6eac494ba4:    	cmp	w16, w30  // guest 0x70336, sampled 0
6eac494ba8:    	b.ne	0x6eac495390 <trace+0x2850>  // guest 0x70336, sampled 0
6eac494bac:    	add	x30, x17, w21, uxtw  // guest 0x70336, sampled 0
6eac494bb0:    	ldapr	w20, [x30]  // guest 0x70336, sampled 0
6eac494bb4:    	add	w21, w21, #0x4  // guest 0x70336, sampled 0
6eac494bb8:    	str	w21, [x19, #0x10]  // guest 0x70336, sampled 0
6eac494bbc:    	str	w20, [x19, #0x20]  // guest 0x70336, sampled 0
6eac494bc0:    	mov	x0, x19  // guest 0x70336, sampled 0
6eac494bc4:    	bl	0x6ea842253c <trace+0xfffffffffbf8f9fc>  // guest 0x70336, sampled 0
6eac494bc8:    	br	x0  // guest 0x70336, sampled 0
6eac494bcc:    	adr	x0, 0x6eac492a83 <trace+0xffffffffffffff43>  // guest 0x70336, sampled 0
6eac494bd0:    	b	0x6ea842202c <trace+0xfffffffffbf8f4ec>  // guest 0x70336, sampled 0
6eac494bd4:    	mov	w1, w21
6eac494bd8:    	mov	w2, w22
6eac494bdc:    	mov	x0, x19
6eac494be0:    	mov	w3, #0x4045             // =16453
6eac494be4:    	movk	w3, #0x1, lsl #16
6eac494be8:    	adr	x4, 0x6eac492b80 <trace+0x40>
6eac494bec:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494bf0:    	add	x16, x16, #0xc38
6eac494bf4:    	blr	x16
6eac494bf8:    	dmb	ishld
6eac494bfc:    	b	0x6eac492b80 <trace+0x40>
6eac494c00:    	mov	w1, w21
6eac494c04:    	mov	x0, x19
6eac494c08:    	mov	w2, #0x4045             // =16453
6eac494c0c:    	movk	w2, #0x1, lsl #16
6eac494c10:    	adr	x3, 0x6eac492bb0 <trace+0x70>
6eac494c14:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494c18:    	add	x16, x16, #0x58
6eac494c1c:    	blr	x16
6eac494c20:    	mov	w2, w0
6eac494c24:    	dmb	ishld
6eac494c28:    	b	0x6eac492bb0 <trace+0x70>
6eac494c2c:    	mov	w1, w23
6eac494c30:    	mov	x0, x19
6eac494c34:    	mov	w2, #0x4045             // =16453
6eac494c38:    	movk	w2, #0x1, lsl #16
6eac494c3c:    	adr	x3, 0x6eac492c40 <trace+0x100>
6eac494c40:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494c44:    	add	x16, x16, #0x58
6eac494c48:    	blr	x16
6eac494c4c:    	mov	w2, w0
6eac494c50:    	dmb	ishld
6eac494c54:    	b	0x6eac492c40 <trace+0x100>
6eac494c58:    	mov	w1, w23
6eac494c5c:    	mov	x0, x19
6eac494c60:    	mov	w2, #0x4045             // =16453
6eac494c64:    	movk	w2, #0x1, lsl #16
6eac494c68:    	adr	x3, 0x6eac492cc4 <trace+0x184>
6eac494c6c:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494c70:    	add	x16, x16, #0x58
6eac494c74:    	blr	x16
6eac494c78:    	mov	w2, w0
6eac494c7c:    	dmb	ishld
6eac494c80:    	b	0x6eac492cc4 <trace+0x184>
6eac494c84:    	mov	w1, w23
6eac494c88:    	mov	x0, x19
6eac494c8c:    	mov	w2, #0x4045             // =16453
6eac494c90:    	movk	w2, #0x1, lsl #16
6eac494c94:    	adr	x3, 0x6eac492d50 <trace+0x210>
6eac494c98:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494c9c:    	add	x16, x16, #0x58
6eac494ca0:    	blr	x16
6eac494ca4:    	mov	w2, w0
6eac494ca8:    	dmb	ishld
6eac494cac:    	b	0x6eac492d50 <trace+0x210>
6eac494cb0:    	mov	w1, w23
6eac494cb4:    	mov	x0, x19
6eac494cb8:    	mov	w2, #0x4045             // =16453
6eac494cbc:    	movk	w2, #0x1, lsl #16
6eac494cc0:    	adr	x3, 0x6eac492e3c <trace+0x2fc>
6eac494cc4:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494cc8:    	add	x16, x16, #0x58
6eac494ccc:    	blr	x16
6eac494cd0:    	mov	w2, w0
6eac494cd4:    	dmb	ishld
6eac494cd8:    	b	0x6eac492e3c <trace+0x2fc>
6eac494cdc:    	mov	w1, w23
6eac494ce0:    	mov	x0, x19
6eac494ce4:    	mov	w2, #0x4045             // =16453
6eac494ce8:    	movk	w2, #0x1, lsl #16
6eac494cec:    	adr	x3, 0x6eac492ec8 <trace+0x388>
6eac494cf0:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494cf4:    	add	x16, x16, #0x58
6eac494cf8:    	blr	x16
6eac494cfc:    	mov	w2, w0
6eac494d00:    	dmb	ishld
6eac494d04:    	b	0x6eac492ec8 <trace+0x388>
6eac494d08:    	mov	w1, w23
6eac494d0c:    	mov	x0, x19
6eac494d10:    	mov	w2, #0x4045             // =16453
6eac494d14:    	movk	w2, #0x1, lsl #16
6eac494d18:    	adr	x3, 0x6eac492f4c <trace+0x40c>
6eac494d1c:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494d20:    	add	x16, x16, #0x58
6eac494d24:    	blr	x16
6eac494d28:    	mov	w2, w0
6eac494d2c:    	dmb	ishld
6eac494d30:    	b	0x6eac492f4c <trace+0x40c>
6eac494d34:    	mov	w1, w23
6eac494d38:    	mov	x0, x19
6eac494d3c:    	mov	w2, #0x4045             // =16453
6eac494d40:    	movk	w2, #0x1, lsl #16
6eac494d44:    	adr	x3, 0x6eac492fd8 <trace+0x498>
6eac494d48:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494d4c:    	add	x16, x16, #0x58
6eac494d50:    	blr	x16
6eac494d54:    	mov	w2, w0
6eac494d58:    	dmb	ishld
6eac494d5c:    	b	0x6eac492fd8 <trace+0x498>
6eac494d60:    	mov	w1, w23
6eac494d64:    	mov	x0, x19
6eac494d68:    	mov	w2, #0x4045             // =16453
6eac494d6c:    	movk	w2, #0x1, lsl #16
6eac494d70:    	adr	x3, 0x6eac4930c0 <trace+0x580>
6eac494d74:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494d78:    	add	x16, x16, #0x58
6eac494d7c:    	blr	x16
6eac494d80:    	mov	w2, w0
6eac494d84:    	dmb	ishld
6eac494d88:    	b	0x6eac4930c0 <trace+0x580>
6eac494d8c:    	mov	w1, w23
6eac494d90:    	mov	x0, x19
6eac494d94:    	mov	w2, #0x4045             // =16453
6eac494d98:    	movk	w2, #0x1, lsl #16
6eac494d9c:    	adr	x3, 0x6eac49314c <trace+0x60c>
6eac494da0:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494da4:    	add	x16, x16, #0x58
6eac494da8:    	blr	x16
6eac494dac:    	mov	w2, w0
6eac494db0:    	dmb	ishld
6eac494db4:    	b	0x6eac49314c <trace+0x60c>
6eac494db8:    	mov	w1, w23
6eac494dbc:    	mov	x0, x19
6eac494dc0:    	mov	w2, #0x4045             // =16453
6eac494dc4:    	movk	w2, #0x1, lsl #16
6eac494dc8:    	adr	x3, 0x6eac4931d0 <trace+0x690>
6eac494dcc:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494dd0:    	add	x16, x16, #0x58
6eac494dd4:    	blr	x16
6eac494dd8:    	mov	w2, w0
6eac494ddc:    	dmb	ishld
6eac494de0:    	b	0x6eac4931d0 <trace+0x690>
6eac494de4:    	mov	w1, w23
6eac494de8:    	mov	x0, x19
6eac494dec:    	mov	w2, #0x4045             // =16453
6eac494df0:    	movk	w2, #0x1, lsl #16
6eac494df4:    	adr	x3, 0x6eac49325c <trace+0x71c>
6eac494df8:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494dfc:    	add	x16, x16, #0x58
6eac494e00:    	blr	x16
6eac494e04:    	mov	w2, w0
6eac494e08:    	dmb	ishld
6eac494e0c:    	b	0x6eac49325c <trace+0x71c>
6eac494e10:    	mov	w1, w23
6eac494e14:    	mov	x0, x19
6eac494e18:    	mov	w2, #0x4045             // =16453
6eac494e1c:    	movk	w2, #0x1, lsl #16
6eac494e20:    	adr	x3, 0x6eac493344 <trace+0x804>
6eac494e24:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494e28:    	add	x16, x16, #0x58
6eac494e2c:    	blr	x16
6eac494e30:    	mov	w2, w0
6eac494e34:    	dmb	ishld
6eac494e38:    	b	0x6eac493344 <trace+0x804>
6eac494e3c:    	mov	w1, w23
6eac494e40:    	mov	x0, x19
6eac494e44:    	mov	w2, #0x4045             // =16453
6eac494e48:    	movk	w2, #0x1, lsl #16
6eac494e4c:    	adr	x3, 0x6eac4933d0 <trace+0x890>
6eac494e50:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494e54:    	add	x16, x16, #0x58
6eac494e58:    	blr	x16
6eac494e5c:    	mov	w2, w0
6eac494e60:    	dmb	ishld
6eac494e64:    	b	0x6eac4933d0 <trace+0x890>
6eac494e68:    	mov	w1, w23
6eac494e6c:    	mov	x0, x19
6eac494e70:    	mov	w2, #0x4045             // =16453
6eac494e74:    	movk	w2, #0x1, lsl #16
6eac494e78:    	adr	x3, 0x6eac493454 <trace+0x914>
6eac494e7c:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494e80:    	add	x16, x16, #0x58
6eac494e84:    	blr	x16
6eac494e88:    	mov	w2, w0
6eac494e8c:    	dmb	ishld
6eac494e90:    	b	0x6eac493454 <trace+0x914>
6eac494e94:    	mov	w1, w23
6eac494e98:    	mov	x0, x19
6eac494e9c:    	mov	w2, #0x4045             // =16453
6eac494ea0:    	movk	w2, #0x1, lsl #16
6eac494ea4:    	adr	x3, 0x6eac4934e0 <trace+0x9a0>
6eac494ea8:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494eac:    	add	x16, x16, #0x58
6eac494eb0:    	blr	x16
6eac494eb4:    	mov	w2, w0
6eac494eb8:    	dmb	ishld
6eac494ebc:    	b	0x6eac4934e0 <trace+0x9a0>
6eac494ec0:    	mov	w1, w23
6eac494ec4:    	mov	x0, x19
6eac494ec8:    	mov	w2, #0x4045             // =16453
6eac494ecc:    	movk	w2, #0x1, lsl #16
6eac494ed0:    	adr	x3, 0x6eac4935c8 <trace+0xa88>
6eac494ed4:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494ed8:    	add	x16, x16, #0x58
6eac494edc:    	blr	x16
6eac494ee0:    	mov	w2, w0
6eac494ee4:    	dmb	ishld
6eac494ee8:    	b	0x6eac4935c8 <trace+0xa88>
6eac494eec:    	mov	w1, w23
6eac494ef0:    	mov	x0, x19
6eac494ef4:    	mov	w2, #0x4045             // =16453
6eac494ef8:    	movk	w2, #0x1, lsl #16
6eac494efc:    	adr	x3, 0x6eac493654 <trace+0xb14>
6eac494f00:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494f04:    	add	x16, x16, #0x58
6eac494f08:    	blr	x16
6eac494f0c:    	mov	w2, w0
6eac494f10:    	dmb	ishld
6eac494f14:    	b	0x6eac493654 <trace+0xb14>
6eac494f18:    	mov	w1, w23
6eac494f1c:    	mov	x0, x19
6eac494f20:    	mov	w2, #0x4045             // =16453
6eac494f24:    	movk	w2, #0x1, lsl #16
6eac494f28:    	adr	x3, 0x6eac4936d8 <trace+0xb98>
6eac494f2c:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494f30:    	add	x16, x16, #0x58
6eac494f34:    	blr	x16
6eac494f38:    	mov	w2, w0
6eac494f3c:    	dmb	ishld
6eac494f40:    	b	0x6eac4936d8 <trace+0xb98>
6eac494f44:    	mov	w1, w23
6eac494f48:    	mov	x0, x19
6eac494f4c:    	mov	w2, #0x4045             // =16453
6eac494f50:    	movk	w2, #0x1, lsl #16
6eac494f54:    	adr	x3, 0x6eac493764 <trace+0xc24>
6eac494f58:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494f5c:    	add	x16, x16, #0x58
6eac494f60:    	blr	x16
6eac494f64:    	mov	w2, w0
6eac494f68:    	dmb	ishld
6eac494f6c:    	b	0x6eac493764 <trace+0xc24>
6eac494f70:    	mov	w1, w23
6eac494f74:    	mov	x0, x19
6eac494f78:    	mov	w2, #0x4045             // =16453
6eac494f7c:    	movk	w2, #0x1, lsl #16
6eac494f80:    	adr	x3, 0x6eac49384c <trace+0xd0c>
6eac494f84:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494f88:    	add	x16, x16, #0x58
6eac494f8c:    	blr	x16
6eac494f90:    	mov	w2, w0
6eac494f94:    	dmb	ishld
6eac494f98:    	b	0x6eac49384c <trace+0xd0c>
6eac494f9c:    	mov	w1, w23
6eac494fa0:    	mov	x0, x19
6eac494fa4:    	mov	w2, #0x4045             // =16453
6eac494fa8:    	movk	w2, #0x1, lsl #16
6eac494fac:    	adr	x3, 0x6eac4938d8 <trace+0xd98>
6eac494fb0:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494fb4:    	add	x16, x16, #0x58
6eac494fb8:    	blr	x16
6eac494fbc:    	mov	w2, w0
6eac494fc0:    	dmb	ishld
6eac494fc4:    	b	0x6eac4938d8 <trace+0xd98>
6eac494fc8:    	mov	w1, w23
6eac494fcc:    	mov	x0, x19
6eac494fd0:    	mov	w2, #0x4045             // =16453
6eac494fd4:    	movk	w2, #0x1, lsl #16
6eac494fd8:    	adr	x3, 0x6eac49395c <trace+0xe1c>
6eac494fdc:    	adrp	x16, 0x6efc87d000 <trace+0x503eb000>
6eac494fe0:    	add	x16, x16, #0x58
6eac494fe4:    	blr	x16
6eac494fe8:    	mov	w2, w0
6eac494fec:    	dmb	ishld
6eac494ff0:    	b	0x6eac49395c <trace+0xe1c>
6eac494ff4:    	mov	w1, w23
6eac494ff8:    	mov	x0, x19
6eac494ffc:    	mov	w2, #0x4045             // =16453
6eac495000:    	movk	w2, #0x1, lsl #16
6eac495004:    	adr	x3, 0x6eac4939e8 <trace+0xea8>
6eac495008:    	adrp	x16, 0x6efc87d000 <trace+0x503ea000>
6eac49500c:    	add	x16, x16, #0x58
6eac495010:    	blr	x16
6eac495014:    	mov	w2, w0
6eac495018:    	dmb	ishld
6eac49501c:    	b	0x6eac4939e8 <trace+0xea8>
6eac495020:    	mov	w1, w20
6eac495024:    	mov	w2, w0
6eac495028:    	mov	x0, x19
6eac49502c:    	mov	w3, #0x4045             // =16453
6eac495030:    	movk	w3, #0x1, lsl #16
6eac495034:    	adr	x4, 0x6eac493ae8 <trace+0xfa8>
6eac495038:    	adrp	x16, 0x6efc87d000 <trace+0x503ea000>
6eac49503c:    	add	x16, x16, #0xc38
6eac495040:    	blr	x16
6eac495044:    	dmb	ishld
6eac495048:    	b	0x6eac493ae8 <trace+0xfa8>
6eac49504c:    	mov	w1, w21
6eac495050:    	mov	x0, x19
6eac495054:    	mov	w2, #0x4045             // =16453
6eac495058:    	movk	w2, #0x1, lsl #16
6eac49505c:    	adr	x3, 0x6eac493bac <trace+0x106c>
6eac495060:    	adrp	x16, 0x6efc87d000 <trace+0x503ea000>
6eac495064:    	add	x16, x16, #0x58
6eac495068:    	blr	x16
6eac49506c:    	mov	w2, w0
6eac495070:    	dmb	ishld
6eac495074:    	b	0x6eac493bac <trace+0x106c>
6eac495078:    	mov	w1, w21
6eac49507c:    	mov	x0, x19
6eac495080:    	mov	w2, #0x4045             // =16453
6eac495084:    	movk	w2, #0x1, lsl #16
6eac495088:    	adr	x3, 0x6eac493c94 <trace+0x1154>
6eac49508c:    	adrp	x16, 0x6efc87d000 <trace+0x503ea000>
6eac495090:    	add	x16, x16, #0x58
6eac495094:    	blr	x16
6eac495098:    	mov	w2, w0
6eac49509c:    	dmb	ishld
6eac4950a0:    	b	0x6eac493c94 <trace+0x1154>
6eac4950a4:    	mov	w1, w21
6eac4950a8:    	mov	x0, x19
6eac4950ac:    	mov	w2, #0x4045             // =16453
6eac4950b0:    	movk	w2, #0x1, lsl #16
6eac4950b4:    	adr	x3, 0x6eac493ddc <trace+0x129c>
6eac4950b8:    	adrp	x16, 0x6efc87d000 <trace+0x503ea000>
6eac4950bc:    	add	x16, x16, #0x58
6eac4950c0:    	blr	x16
6eac4950c4:    	mov	w2, w0
6eac4950c8:    	dmb	ishld
6eac4950cc:    	b	0x6eac493ddc <trace+0x129c>
6eac4950d0:    	mov	w1, w22
6eac4950d4:    	mov	x0, x19
6eac4950d8:    	mov	w2, #0x4045             // =16453
6eac4950dc:    	movk	w2, #0x1, lsl #16
6eac4950e0:    	adr	x3, 0x6eac493ebc <trace+0x137c>
6eac4950e4:    	adrp	x16, 0x6efc87d000 <trace+0x503ea000>
6eac4950e8:    	add	x16, x16, #0x58
6eac4950ec:    	blr	x16
6eac4950f0:    	mov	w2, w0
6eac4950f4:    	dmb	ishld
6eac4950f8:    	b	0x6eac493ebc <trace+0x137c>
6eac4950fc:    	mov	w1, w21
6eac495100:    	mov	x0, x19
6eac495104:    	mov	w2, #0x4045             // =16453
6eac495108:    	movk	w2, #0x1, lsl #16
6eac49510c:    	adr	x3, 0x6eac493f6c <trace+0x142c>
6eac495110:    	adrp	x16, 0x6efc87d000 <trace+0x503ea000>
6eac495114:    	add	x16, x16, #0x58
6eac495118:    	blr	x16
6eac49511c:    	mov	w2, w0
6eac495120:    	dmb	ishld
6eac495124:    	b	0x6eac493f6c <trace+0x142c>
6eac495128:    	mov	w1, w22
6eac49512c:    	mov	x0, x19
6eac495130:    	mov	w2, #0x4045             // =16453
6eac495134:    	movk	w2, #0x1, lsl #16
6eac495138:    	adr	x3, 0x6eac494058 <trace+0x1518>
6eac49513c:    	adrp	x16, 0x6efc87d000 <trace+0x503ea000>
6eac495140:    	add	x16, x16, #0x58
6eac495144:    	blr	x16
6eac495148:    	mov	w2, w0
6eac49514c:    	dmb	ishld
6eac495150:    	b	0x6eac494058 <trace+0x1518>
6eac495154:    	mov	w1, w22
6eac495158:    	mov	x0, x19
6eac49515c:    	mov	w2, #0x4045             // =16453
6eac495160:    	movk	w2, #0x1, lsl #16
6eac495164:    	adr	x3, 0x6eac4941a0 <trace+0x1660>
6eac495168:    	adrp	x16, 0x6efc87d000 <trace+0x503ea000>
6eac49516c:    	add	x16, x16, #0x58
6eac495170:    	blr	x16
6eac495174:    	mov	w2, w0
6eac495178:    	dmb	ishld
6eac49517c:    	b	0x6eac4941a0 <trace+0x1660>
6eac495180:    	mov	w1, w20
6eac495184:    	mov	x0, x19
6eac495188:    	mov	w2, #0x4045             // =16453
6eac49518c:    	movk	w2, #0x1, lsl #16
6eac495190:    	adr	x3, 0x6eac494288 <trace+0x1748>
6eac495194:    	adrp	x16, 0x6efc87d000 <trace+0x503ea000>
6eac495198:    	add	x16, x16, #0x58
6eac49519c:    	blr	x16
6eac4951a0:    	mov	w2, w0
6eac4951a4:    	dmb	ishld
6eac4951a8:    	b	0x6eac494288 <trace+0x1748>
6eac4951ac:    	mov	w1, w20
6eac4951b0:    	mov	x0, x19
6eac4951b4:    	mov	w2, #0x4045             // =16453
6eac4951b8:    	movk	w2, #0x1, lsl #16
6eac4951bc:    	adr	x3, 0x6eac49439c <trace+0x185c>
6eac4951c0:    	adrp	x16, 0x6efc87d000 <trace+0x503ea000>
6eac4951c4:    	add	x16, x16, #0x58
6eac4951c8:    	blr	x16
6eac4951cc:    	mov	w2, w0
6eac4951d0:    	dmb	ishld
6eac4951d4:    	b	0x6eac49439c <trace+0x185c>
6eac4951d8:    	mov	w1, w21
6eac4951dc:    	mov	x0, x19
6eac4951e0:    	mov	w2, #0x4045             // =16453
6eac4951e4:    	movk	w2, #0x1, lsl #16
6eac4951e8:    	adr	x3, 0x6eac494450 <trace+0x1910>
6eac4951ec:    	adrp	x16, 0x6efc87d000 <trace+0x503ea000>
6eac4951f0:    	add	x16, x16, #0x58
6eac4951f4:    	blr	x16
6eac4951f8:    	mov	w2, w0
6eac4951fc:    	dmb	ishld
6eac495200:    	b	0x6eac494450 <trace+0x1910>
6eac495204:    	mov	w1, w22
6eac495208:    	mov	x0, x19
6eac49520c:    	mov	w2, #0x4045             // =16453
6eac495210:    	movk	w2, #0x1, lsl #16
6eac495214:    	adr	x3, 0x6eac494538 <trace+0x19f8>
6eac495218:    	adrp	x16, 0x6efc87d000 <trace+0x503ea000>
6eac49521c:    	add	x16, x16, #0x58
6eac495220:    	blr	x16
6eac495224:    	mov	w2, w0
6eac495228:    	dmb	ishld
6eac49522c:    	b	0x6eac494538 <trace+0x19f8>
6eac495230:    	mov	w1, w22
6eac495234:    	mov	x0, x19
6eac495238:    	mov	w2, #0x4045             // =16453
6eac49523c:    	movk	w2, #0x1, lsl #16
6eac495240:    	adr	x3, 0x6eac4945c4 <trace+0x1a84>
6eac495244:    	adrp	x16, 0x6efc87d000 <trace+0x503ea000>
6eac495248:    	add	x16, x16, #0x58
6eac49524c:    	blr	x16
6eac495250:    	mov	w2, w0
6eac495254:    	dmb	ishld
6eac495258:    	b	0x6eac4945c4 <trace+0x1a84>
6eac49525c:    	mov	w1, w22
6eac495260:    	mov	x0, x19
6eac495264:    	mov	w2, #0x4045             // =16453
6eac495268:    	movk	w2, #0x1, lsl #16
6eac49526c:    	adr	x3, 0x6eac4946ac <trace+0x1b6c>
6eac495270:    	adrp	x16, 0x6efc87d000 <trace+0x503ea000>
6eac495274:    	add	x16, x16, #0x58
6eac495278:    	blr	x16
6eac49527c:    	mov	w2, w0
6eac495280:    	dmb	ishld
6eac495284:    	b	0x6eac4946ac <trace+0x1b6c>
6eac495288:    	mov	w1, w20
6eac49528c:    	mov	x0, x19
6eac495290:    	mov	w2, #0x4045             // =16453
6eac495294:    	movk	w2, #0x1, lsl #16
6eac495298:    	adr	x3, 0x6eac494794 <trace+0x1c54>
6eac49529c:    	adrp	x16, 0x6efc87d000 <trace+0x503ea000>
6eac4952a0:    	add	x16, x16, #0x58
6eac4952a4:    	blr	x16
6eac4952a8:    	mov	w2, w0
6eac4952ac:    	dmb	ishld
6eac4952b0:    	b	0x6eac494794 <trace+0x1c54>
6eac4952b4:    	mov	w1, w21
6eac4952b8:    	mov	x0, x19
6eac4952bc:    	mov	w2, #0x4045             // =16453
6eac4952c0:    	movk	w2, #0x1, lsl #16
6eac4952c4:    	adr	x3, 0x6eac494844 <trace+0x1d04>
6eac4952c8:    	adrp	x16, 0x6efc87d000 <trace+0x503ea000>
6eac4952cc:    	add	x16, x16, #0x58
6eac4952d0:    	blr	x16
6eac4952d4:    	mov	w2, w0
6eac4952d8:    	dmb	ishld
6eac4952dc:    	b	0x6eac494844 <trace+0x1d04>
6eac4952e0:    	mov	w1, w22
6eac4952e4:    	mov	x0, x19
6eac4952e8:    	mov	w2, #0x4045             // =16453
6eac4952ec:    	movk	w2, #0x1, lsl #16
6eac4952f0:    	adr	x3, 0x6eac49492c <trace+0x1dec>
6eac4952f4:    	adrp	x16, 0x6efc87d000 <trace+0x503ea000>
6eac4952f8:    	add	x16, x16, #0x58
6eac4952fc:    	blr	x16
6eac495300:    	mov	w2, w0
6eac495304:    	dmb	ishld
6eac495308:    	b	0x6eac49492c <trace+0x1dec>
6eac49530c:    	mov	w1, w23
6eac495310:    	mov	x0, x19
6eac495314:    	mov	w2, #0x4045             // =16453
6eac495318:    	movk	w2, #0x1, lsl #16
6eac49531c:    	adr	x3, 0x6eac4949b8 <trace+0x1e78>
6eac495320:    	adrp	x16, 0x6efc87d000 <trace+0x503ea000>
6eac495324:    	add	x16, x16, #0x58
6eac495328:    	blr	x16
6eac49532c:    	mov	w2, w0
6eac495330:    	dmb	ishld
6eac495334:    	b	0x6eac4949b8 <trace+0x1e78>
6eac495338:    	mov	w1, w20
6eac49533c:    	mov	x0, x19
6eac495340:    	mov	w2, #0x4045             // =16453
6eac495344:    	movk	w2, #0x1, lsl #16
6eac495348:    	adr	x3, 0x6eac494aa0 <trace+0x1f60>
6eac49534c:    	adrp	x16, 0x6efc87d000 <trace+0x503ea000>
6eac495350:    	add	x16, x16, #0x58
6eac495354:    	blr	x16
6eac495358:    	mov	w2, w0
6eac49535c:    	dmb	ishld
6eac495360:    	b	0x6eac494aa0 <trace+0x1f60>
6eac495364:    	mov	w1, w22
6eac495368:    	mov	x0, x19
6eac49536c:    	mov	w2, #0x4045             // =16453
6eac495370:    	movk	w2, #0x1, lsl #16
6eac495374:    	adr	x3, 0x6eac494b80 <trace+0x2040>
6eac495378:    	adrp	x16, 0x6efc87d000 <trace+0x503ea000>
6eac49537c:    	add	x16, x16, #0x58
6eac495380:    	blr	x16
6eac495384:    	mov	w20, w0
6eac495388:    	dmb	ishld
6eac49538c:    	b	0x6eac494b80 <trace+0x2040>
6eac495390:    	mov	w1, w21
6eac495394:    	mov	x0, x19
6eac495398:    	mov	w2, #0x4045             // =16453
6eac49539c:    	movk	w2, #0x1, lsl #16
6eac4953a0:    	adr	x3, 0x6eac494bb4 <trace+0x2074>
6eac4953a4:    	adrp	x16, 0x6efc87d000 <trace+0x503ea000>
6eac4953a8:    	add	x16, x16, #0x58
6eac4953ac:    	blr	x16
6eac4953b0:    	mov	w20, w0
6eac4953b4:    	dmb	ishld
6eac4953b8:    	b	0x6eac494bb4 <trace+0x2074>