
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-2310de-6ead35d9c0.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006ead35d9c0 <trace>:
6ead35d9c0:    	ldur	w20, [x19, #-0x10]  // guest 0x2310de, sampled 0
6ead35d9c4:    	tbnz	w20, #0x1f, 0x6ead35dae4 <trace+0x124>  // guest 0x2310de, sampled 0
6ead35d9c8:    	sturb	wzr, [x19, #-0xc]  // guest 0x2310de, sampled 0
6ead35d9cc:    	ldr	w20, [x19, #0x10]  // guest 0x2310de, sampled 0
6ead35d9d0:    	add	w21, w20, #0x20  // guest 0x2310de, sampled 1
6ead35d9d4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2310de, sampled 0
6ead35d9d8:    	and	x16, x16, x21, lsr #7  // guest 0x2310de, sampled 0
6ead35d9dc:    	add	x17, x17, x16  // guest 0x2310de, sampled 2
6ead35d9e0:    	ldp	x16, x17, [x17]  // guest 0x2310de, sampled 0
6ead35d9e4:    	and	w30, w21, #0xfffff003  // guest 0x2310de, sampled 2
6ead35d9e8:    	cmp	w16, w30  // guest 0x2310de, sampled 0
6ead35d9ec:    	b.ne	0x6ead35daec <trace+0x12c>  // guest 0x2310de, sampled 0
6ead35d9f0:    	add	x30, x17, w21, uxtw  // guest 0x2310de, sampled 1
6ead35d9f4:    	ldapr	w21, [x30]  // guest 0x2310de, sampled 0
6ead35d9f8:    	str	w21, [x19, #0x18]  // guest 0x2310de, sampled 10
6ead35d9fc:    	ldr	w22, [x19, #0x8]  // guest 0x2310e2, sampled 0
6ead35da00:    	lsl	w22, w22, #2  // guest 0x2310e2, sampled 0
6ead35da04:    	mov	w23, #0x88e8            // =35048  // guest 0x2310e2, sampled 0
6ead35da08:    	movk	w23, #0x44, lsl #16  // guest 0x2310e2, sampled 0
6ead35da0c:    	add	w22, w22, w23  // guest 0x2310e2, sampled 0
6ead35da10:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2310e2, sampled 0
6ead35da14:    	and	x16, x16, x22, lsr #7  // guest 0x2310e2, sampled 0
6ead35da18:    	add	x17, x17, x16  // guest 0x2310e2, sampled 0
6ead35da1c:    	ldp	x16, x17, [x17]  // guest 0x2310e2, sampled 0
6ead35da20:    	and	w30, w22, #0xfffff003  // guest 0x2310e2, sampled 0
6ead35da24:    	cmp	w16, w30  // guest 0x2310e2, sampled 0
6ead35da28:    	b.ne	0x6ead35db18 <trace+0x158>  // guest 0x2310e2, sampled 0
6ead35da2c:    	add	x30, x17, w22, uxtw  // guest 0x2310e2, sampled 0
6ead35da30:    	ldapr	w22, [x30]  // guest 0x2310e2, sampled 0
6ead35da34:    	str	w22, [x19]  // guest 0x2310e2, sampled 3
6ead35da38:    	ldr	w22, [x19, #0x4]  // guest 0x2310e9, sampled 0
6ead35da3c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2310e9, sampled 0
6ead35da40:    	and	x16, x16, x21, lsr #7  // guest 0x2310e9, sampled 0
6ead35da44:    	add	x17, x17, x16  // guest 0x2310e9, sampled 0
6ead35da48:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2310e9, sampled 0
6ead35da4c:    	and	w30, w21, #0xfffff001  // guest 0x2310e9, sampled 5
6ead35da50:    	cmp	w16, w30  // guest 0x2310e9, sampled 0
6ead35da54:    	b.ne	0x6ead35db44 <trace+0x184>  // guest 0x2310e9, sampled 0
6ead35da58:    	add	x30, x17, w21, uxtw  // guest 0x2310e9, sampled 1
6ead35da5c:    	stlrh	w22, [x30]  // guest 0x2310e9, sampled 0
6ead35da60:    	add	w21, w21, #0x2  // guest 0x2310ec, sampled 2
6ead35da64:    	str	w21, [x19, #0x18]  // guest 0x2310ec, sampled 0
6ead35da68:    	ldr	w22, [x19, #0x14]  // guest 0x2310ef, sampled 0
6ead35da6c:    	str	w22, [x19, #0x28]  // guest 0x2310ef, sampled 0
6ead35da70:    	add	w20, w20, #0x20  // guest 0x2310f1, sampled 0
6ead35da74:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2310f1, sampled 0
6ead35da78:    	and	x16, x16, x20, lsr #7  // guest 0x2310f1, sampled 0
6ead35da7c:    	add	x17, x17, x16  // guest 0x2310f1, sampled 0
6ead35da80:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2310f1, sampled 2
6ead35da84:    	and	w30, w20, #0xfffff003  // guest 0x2310f1, sampled 0
6ead35da88:    	cmp	w16, w30  // guest 0x2310f1, sampled 0
6ead35da8c:    	b.ne	0x6ead35db70 <trace+0x1b0>  // guest 0x2310f1, sampled 0
6ead35da90:    	add	x30, x17, w20, uxtw  // guest 0x2310f1, sampled 0
6ead35da94:    	stlr	w21, [x30]  // guest 0x2310f1, sampled 0
6ead35da98:    	mov	w20, #0x1               // =1  // guest 0x2310f1, sampled 0
6ead35da9c:    	sturb	w20, [x19, #-0xc]  // guest 0x2310f1, sampled 1
6ead35daa0:    	mov	w20, #0x1a              // =26  // guest 0x2310f5, sampled 0
6ead35daa4:    	str	w20, [x19, #0x34]  // guest 0x2310f5, sampled 1
6ead35daa8:    	cbz	w22, 0x6ead35dac8 <trace+0x108>  // guest 0x2310f5, sampled 0
6ead35daac:    	b	0x6ead35daac <trace+0xec>  // guest 0x2310f5, sampled 0
6ead35dab0:    	br	x16  // guest 0x2310f5, sampled 0
6ead35dab4:    	mov	w20, #0x10f7            // =4343  // guest 0x2310f5, sampled 0
6ead35dab8:    	movk	w20, #0x23, lsl #16  // guest 0x2310f5, sampled 0
6ead35dabc:    	str	w20, [x19, #0x20]  // guest 0x2310f5, sampled 0
6ead35dac0:    	adr	x0, 0x6ead35d901 <trace+0xffffffffffffff41>  // guest 0x2310f5, sampled 0
6ead35dac4:    	b	0x6ea842202c <trace+0xfffffffffb0c466c>  // guest 0x2310f5, sampled 0
6ead35dac8:    	b	0x6ead35dac8 <trace+0x108>  // guest 0x2310f5, sampled 0
6ead35dacc:    	br	x16  // guest 0x2310f5, sampled 0
6ead35dad0:    	mov	w20, #0x1105            // =4357  // guest 0x2310f5, sampled 0
6ead35dad4:    	movk	w20, #0x23, lsl #16  // guest 0x2310f5, sampled 0
6ead35dad8:    	str	w20, [x19, #0x20]  // guest 0x2310f5, sampled 0
6ead35dadc:    	adr	x0, 0x6ead35d900 <trace+0xffffffffffffff40>  // guest 0x2310f5, sampled 0
6ead35dae0:    	b	0x6ea842202c <trace+0xfffffffffb0c466c>  // guest 0x2310f5, sampled 0
6ead35dae4:    	adr	x0, 0x6ead35d903 <trace+0xffffffffffffff43>  // guest 0x2310f5, sampled 0
6ead35dae8:    	b	0x6ea842202c <trace+0xfffffffffb0c466c>  // guest 0x2310f5, sampled 0
6ead35daec:    	mov	w1, w21
6ead35daf0:    	mov	x0, x19
6ead35daf4:    	mov	w2, #0x4045             // =16453
6ead35daf8:    	movk	w2, #0x1, lsl #16
6ead35dafc:    	adr	x3, 0x6ead35d9f8 <trace+0x38>
6ead35db00:    	adrp	x16, 0x6efc87d000 <trace+0x4f520000>
6ead35db04:    	add	x16, x16, #0x58
6ead35db08:    	blr	x16
6ead35db0c:    	mov	w21, w0
6ead35db10:    	dmb	ishld
6ead35db14:    	b	0x6ead35d9f8 <trace+0x38>
6ead35db18:    	mov	w1, w22
6ead35db1c:    	mov	x0, x19
6ead35db20:    	mov	w2, #0x4045             // =16453
6ead35db24:    	movk	w2, #0x1, lsl #16
6ead35db28:    	adr	x3, 0x6ead35da34 <trace+0x74>
6ead35db2c:    	adrp	x16, 0x6efc87d000 <trace+0x4f520000>
6ead35db30:    	add	x16, x16, #0x58
6ead35db34:    	blr	x16
6ead35db38:    	mov	w22, w0
6ead35db3c:    	dmb	ishld
6ead35db40:    	b	0x6ead35da34 <trace+0x74>
6ead35db44:    	mov	w1, w21
6ead35db48:    	mov	w2, w22
6ead35db4c:    	mov	x0, x19
6ead35db50:    	mov	w3, #0x4025             // =16421
6ead35db54:    	movk	w3, #0x1, lsl #16
6ead35db58:    	adr	x4, 0x6ead35da60 <trace+0xa0>
6ead35db5c:    	adrp	x16, 0x6efc87d000 <trace+0x4f520000>
6ead35db60:    	add	x16, x16, #0x9c8
6ead35db64:    	blr	x16
6ead35db68:    	dmb	ishld
6ead35db6c:    	b	0x6ead35da60 <trace+0xa0>
6ead35db70:    	mov	w1, w20
6ead35db74:    	mov	w2, w21
6ead35db78:    	mov	x0, x19
6ead35db7c:    	mov	w3, #0x4045             // =16453
6ead35db80:    	movk	w3, #0x1, lsl #16
6ead35db84:    	adr	x4, 0x6ead35da98 <trace+0xd8>
6ead35db88:    	adrp	x16, 0x6efc87d000 <trace+0x4f520000>
6ead35db8c:    	add	x16, x16, #0xc38
6ead35db90:    	blr	x16
6ead35db94:    	dmb	ishld
6ead35db98:    	b	0x6ead35da98 <trace+0xd8>