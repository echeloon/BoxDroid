
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-43933-6eabc82c00.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006eabc82c00 <trace>:
6eabc82c00:    	ldur	w20, [x19, #-0x10]  // guest 0x43933, sampled 0
6eabc82c04:    	tbnz	w20, #0x1f, 0x6eabc82d40 <trace+0x140>  // guest 0x43933, sampled 0
6eabc82c08:    	sturb	wzr, [x19, #-0xc]  // guest 0x43933, sampled 0
6eabc82c0c:    	ldr	w20, [x19, #0x14]  // guest 0x43933, sampled 0
6eabc82c10:    	add	w21, w20, #0xc  // guest 0x43933, sampled 0
6eabc82c14:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x43933, sampled 0
6eabc82c18:    	and	x16, x16, x21, lsr #7  // guest 0x43933, sampled 0
6eabc82c1c:    	add	x17, x17, x16  // guest 0x43933, sampled 0
6eabc82c20:    	ldp	x16, x17, [x17]  // guest 0x43933, sampled 0
6eabc82c24:    	and	w30, w21, #0xfffff003  // guest 0x43933, sampled 0
6eabc82c28:    	cmp	w16, w30  // guest 0x43933, sampled 0
6eabc82c2c:    	b.ne	0x6eabc82d48 <trace+0x148>  // guest 0x43933, sampled 0
6eabc82c30:    	add	x30, x17, w21, uxtw  // guest 0x43933, sampled 0
6eabc82c34:    	ldapr	w21, [x30]  // guest 0x43933, sampled 0
6eabc82c38:    	str	w21, [x19, #0x4]  // guest 0x43933, sampled 0
6eabc82c3c:    	sub	w20, w20, #0x4  // guest 0x43936, sampled 0
6eabc82c40:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x43936, sampled 1
6eabc82c44:    	and	x16, x16, x20, lsr #7  // guest 0x43936, sampled 0
6eabc82c48:    	add	x17, x17, x16  // guest 0x43936, sampled 0
6eabc82c4c:    	ldp	x16, x17, [x17]  // guest 0x43936, sampled 0
6eabc82c50:    	and	w30, w20, #0xfffff003  // guest 0x43936, sampled 0
6eabc82c54:    	cmp	w16, w30  // guest 0x43936, sampled 0
6eabc82c58:    	b.ne	0x6eabc82d74 <trace+0x174>  // guest 0x43936, sampled 0
6eabc82c5c:    	add	x30, x17, w20, uxtw  // guest 0x43936, sampled 1
6eabc82c60:    	ldapr	w20, [x30]  // guest 0x43936, sampled 0
6eabc82c64:    	add	w21, w21, w20  // guest 0x43936, sampled 2
6eabc82c68:    	str	w21, [x19, #0x4]  // guest 0x43936, sampled 0
6eabc82c6c:    	str	w21, [x19, #0x28]  // guest 0x43936, sampled 0
6eabc82c70:    	str	w20, [x19, #0x2c]  // guest 0x43936, sampled 0
6eabc82c74:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x43939, sampled 0
6eabc82c78:    	and	x16, x16, x21, lsr #7  // guest 0x43939, sampled 0
6eabc82c7c:    	add	x17, x17, x16  // guest 0x43939, sampled 0
6eabc82c80:    	ldp	x16, x17, [x17]  // guest 0x43939, sampled 0
6eabc82c84:    	and	w30, w21, #0xfffff000  // guest 0x43939, sampled 1
6eabc82c88:    	cmp	w16, w30  // guest 0x43939, sampled 0
6eabc82c8c:    	b.ne	0x6eabc82da0 <trace+0x1a0>  // guest 0x43939, sampled 0
6eabc82c90:    	add	x30, x17, w21, uxtw  // guest 0x43939, sampled 0
6eabc82c94:    	ldaprb	w20, [x30]  // guest 0x43939, sampled 0
6eabc82c98:    	ldr	w21, [x19, #0x8]  // guest 0x43939, sampled 6
6eabc82c9c:    	mov	w16, w20  // guest 0x43939, sampled 0
6eabc82ca0:    	mov	w20, w21  // guest 0x43939, sampled 0
6eabc82ca4:    	bfxil	w20, w16, #0, #8  // guest 0x43939, sampled 0
6eabc82ca8:    	str	w20, [x19, #0x8]  // guest 0x43939, sampled 0
6eabc82cac:    	ldr	w21, [x19, #0x10]  // guest 0x4393b, sampled 0
6eabc82cb0:    	sub	w21, w21, #0x4  // guest 0x4393b, sampled 0
6eabc82cb4:    	mov	w22, w21  // guest 0x4393b, sampled 0
6eabc82cb8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x4393b, sampled 2
6eabc82cbc:    	and	x16, x16, x22, lsr #7  // guest 0x4393b, sampled 1
6eabc82cc0:    	add	x17, x17, x16  // guest 0x4393b, sampled 0
6eabc82cc4:    	ldp	x17, x16, [x17, #0x8]  // guest 0x4393b, sampled 0
6eabc82cc8:    	and	w30, w22, #0xfffff003  // guest 0x4393b, sampled 0
6eabc82ccc:    	cmp	w16, w30  // guest 0x4393b, sampled 0
6eabc82cd0:    	b.ne	0x6eabc82dcc <trace+0x1cc>  // guest 0x4393b, sampled 0
6eabc82cd4:    	add	x30, x17, w22, uxtw  // guest 0x4393b, sampled 0
6eabc82cd8:    	stlr	w20, [x30]  // guest 0x4393b, sampled 0
6eabc82cdc:    	str	w21, [x19, #0x10]  // guest 0x4393b, sampled 1
6eabc82ce0:    	mov	w20, #0x1               // =1  // guest 0x4393b, sampled 0
6eabc82ce4:    	sturb	w20, [x19, #-0xc]  // guest 0x4393b, sampled 0
6eabc82ce8:    	sub	w20, w21, #0x4  // guest 0x4393c, sampled 0
6eabc82cec:    	mov	w21, w20  // guest 0x4393c, sampled 1
6eabc82cf0:    	mov	w22, #0x3941            // =14657  // guest 0x4393c, sampled 0
6eabc82cf4:    	movk	w22, #0x4, lsl #16  // guest 0x4393c, sampled 0
6eabc82cf8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x4393c, sampled 1
6eabc82cfc:    	and	x16, x16, x21, lsr #7  // guest 0x4393c, sampled 0
6eabc82d00:    	add	x17, x17, x16  // guest 0x4393c, sampled 0
6eabc82d04:    	ldp	x17, x16, [x17, #0x8]  // guest 0x4393c, sampled 0
6eabc82d08:    	and	w30, w21, #0xfffff003  // guest 0x4393c, sampled 0
6eabc82d0c:    	cmp	w16, w30  // guest 0x4393c, sampled 0
6eabc82d10:    	b.ne	0x6eabc82df8 <trace+0x1f8>  // guest 0x4393c, sampled 0
6eabc82d14:    	add	x30, x17, w21, uxtw  // guest 0x4393c, sampled 0
6eabc82d18:    	stlr	w22, [x30]  // guest 0x4393c, sampled 1
6eabc82d1c:    	str	w20, [x19, #0x10]  // guest 0x4393c, sampled 0
6eabc82d20:    	mov	w20, #0xa               // =10  // guest 0x4393c, sampled 1
6eabc82d24:    	str	w20, [x19, #0x34]  // guest 0x4393c, sampled 0
6eabc82d28:    	mov	w20, #0xdbc0            // =56256  // guest 0x4393c, sampled 0
6eabc82d2c:    	movk	w20, #0x2, lsl #16  // guest 0x4393c, sampled 0
6eabc82d30:    	str	w20, [x19, #0x20]  // guest 0x4393c, sampled 0
6eabc82d34:    	mov	x0, x19  // guest 0x4393c, sampled 0
6eabc82d38:    	bl	0x6ea842253c <trace+0xfffffffffc79f93c>  // guest 0x4393c, sampled 0
6eabc82d3c:    	br	x0  // guest 0x4393c, sampled 0
6eabc82d40:    	adr	x0, 0x6eabc82b43 <trace+0xffffffffffffff43>  // guest 0x4393c, sampled 0
6eabc82d44:    	b	0x6ea842202c <trace+0xfffffffffc79f42c>  // guest 0x4393c, sampled 0
6eabc82d48:    	mov	w1, w21
6eabc82d4c:    	mov	x0, x19
6eabc82d50:    	mov	w2, #0x4045             // =16453
6eabc82d54:    	movk	w2, #0x1, lsl #16
6eabc82d58:    	adr	x3, 0x6eabc82c38 <trace+0x38>
6eabc82d5c:    	adrp	x16, 0x6efc87d000 <trace+0x50bfb000>
6eabc82d60:    	add	x16, x16, #0x58
6eabc82d64:    	blr	x16
6eabc82d68:    	mov	w21, w0
6eabc82d6c:    	dmb	ishld
6eabc82d70:    	b	0x6eabc82c38 <trace+0x38>
6eabc82d74:    	mov	w1, w20
6eabc82d78:    	mov	x0, x19
6eabc82d7c:    	mov	w2, #0x4045             // =16453
6eabc82d80:    	movk	w2, #0x1, lsl #16
6eabc82d84:    	adr	x3, 0x6eabc82c64 <trace+0x64>
6eabc82d88:    	adrp	x16, 0x6efc87d000 <trace+0x50bfb000>
6eabc82d8c:    	add	x16, x16, #0x58
6eabc82d90:    	blr	x16
6eabc82d94:    	mov	w20, w0
6eabc82d98:    	dmb	ishld
6eabc82d9c:    	b	0x6eabc82c64 <trace+0x64>
6eabc82da0:    	mov	w1, w21
6eabc82da4:    	mov	x0, x19
6eabc82da8:    	mov	w2, #0x5c05             // =23557
6eabc82dac:    	movk	w2, #0x1, lsl #16
6eabc82db0:    	adr	x3, 0x6eabc82c98 <trace+0x98>
6eabc82db4:    	adrp	x16, 0x6efc87c000 <trace+0x50bfa000>
6eabc82db8:    	add	x16, x16, #0xcec
6eabc82dbc:    	blr	x16
6eabc82dc0:    	mov	w20, w0
6eabc82dc4:    	dmb	ishld
6eabc82dc8:    	b	0x6eabc82c98 <trace+0x98>
6eabc82dcc:    	mov	w1, w22
6eabc82dd0:    	mov	w2, w20
6eabc82dd4:    	mov	x0, x19
6eabc82dd8:    	mov	w3, #0x4045             // =16453
6eabc82ddc:    	movk	w3, #0x1, lsl #16
6eabc82de0:    	adr	x4, 0x6eabc82cdc <trace+0xdc>
6eabc82de4:    	adrp	x16, 0x6efc87d000 <trace+0x50bfb000>
6eabc82de8:    	add	x16, x16, #0xc38
6eabc82dec:    	blr	x16
6eabc82df0:    	dmb	ishld
6eabc82df4:    	b	0x6eabc82cdc <trace+0xdc>
6eabc82df8:    	mov	w1, w21
6eabc82dfc:    	mov	w2, w22
6eabc82e00:    	mov	x0, x19
6eabc82e04:    	mov	w3, #0x4045             // =16453
6eabc82e08:    	movk	w3, #0x1, lsl #16
6eabc82e0c:    	adr	x4, 0x6eabc82d1c <trace+0x11c>
6eabc82e10:    	adrp	x16, 0x6efc87d000 <trace+0x50bfb000>
6eabc82e14:    	add	x16, x16, #0xc38
6eabc82e18:    	blr	x16
6eabc82e1c:    	dmb	ishld
6eabc82e20:    	b	0x6eabc82d1c <trace+0x11c>