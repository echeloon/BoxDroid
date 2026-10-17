
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-d6960-6eae4ede80.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006eae4ede80 <trace>:
6eae4ede80:    	ldur	w20, [x19, #-0x10]  // guest 0xd6960, sampled 0
6eae4ede84:    	tbnz	w20, #0x1f, 0x6eae4edfac <trace+0x12c>  // guest 0xd6960, sampled 0
6eae4ede88:    	sturb	wzr, [x19, #-0xc]  // guest 0xd6960, sampled 0
6eae4ede8c:    	ldr	w20, [x19, #0x10]  // guest 0xd6960, sampled 0
6eae4ede90:    	sub	w20, w20, #0x4  // guest 0xd6960, sampled 0
6eae4ede94:    	mov	w21, w20  // guest 0xd6960, sampled 0
6eae4ede98:    	ldr	w22, [x19, #0xc]  // guest 0xd6960, sampled 0
6eae4ede9c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0xd6960, sampled 0
6eae4edea0:    	and	x16, x16, x21, lsr #7  // guest 0xd6960, sampled 0
6eae4edea4:    	add	x17, x17, x16  // guest 0xd6960, sampled 0
6eae4edea8:    	ldp	x17, x16, [x17, #0x8]  // guest 0xd6960, sampled 0
6eae4edeac:    	and	w30, w21, #0xfffff003  // guest 0xd6960, sampled 0
6eae4edeb0:    	cmp	w16, w30  // guest 0xd6960, sampled 0
6eae4edeb4:    	b.ne	0x6eae4edfb4 <trace+0x134>  // guest 0xd6960, sampled 0
6eae4edeb8:    	add	x30, x17, w21, uxtw  // guest 0xd6960, sampled 0
6eae4edebc:    	stlr	w22, [x30]  // guest 0xd6960, sampled 0
6eae4edec0:    	str	w20, [x19, #0x10]  // guest 0xd6960, sampled 0
6eae4edec4:    	sub	w20, w20, #0x4  // guest 0xd6961, sampled 0
6eae4edec8:    	mov	w21, w20  // guest 0xd6961, sampled 0
6eae4edecc:    	ldr	w22, [x19, #0x18]  // guest 0xd6961, sampled 0
6eae4eded0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0xd6961, sampled 0
6eae4eded4:    	and	x16, x16, x21, lsr #7  // guest 0xd6961, sampled 0
6eae4eded8:    	add	x17, x17, x16  // guest 0xd6961, sampled 0
6eae4ededc:    	ldp	x17, x16, [x17, #0x8]  // guest 0xd6961, sampled 0
6eae4edee0:    	and	w30, w21, #0xfffff003  // guest 0xd6961, sampled 0
6eae4edee4:    	cmp	w16, w30  // guest 0xd6961, sampled 0
6eae4edee8:    	b.ne	0x6eae4edfe0 <trace+0x160>  // guest 0xd6961, sampled 0
6eae4edeec:    	add	x30, x17, w21, uxtw  // guest 0xd6961, sampled 0
6eae4edef0:    	stlr	w22, [x30]  // guest 0xd6961, sampled 0
6eae4edef4:    	str	w20, [x19, #0x10]  // guest 0xd6961, sampled 0
6eae4edef8:    	add	w20, w20, #0xc  // guest 0xd6962, sampled 0
6eae4edefc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0xd6962, sampled 0
6eae4edf00:    	and	x16, x16, x20, lsr #7  // guest 0xd6962, sampled 0
6eae4edf04:    	add	x17, x17, x16  // guest 0xd6962, sampled 0
6eae4edf08:    	ldp	x16, x17, [x17]  // guest 0xd6962, sampled 0
6eae4edf0c:    	and	w30, w20, #0xfffff003  // guest 0xd6962, sampled 0
6eae4edf10:    	cmp	w16, w30  // guest 0xd6962, sampled 0
6eae4edf14:    	b.ne	0x6eae4ee00c <trace+0x18c>  // guest 0xd6962, sampled 0
6eae4edf18:    	add	x30, x17, w20, uxtw  // guest 0xd6962, sampled 0
6eae4edf1c:    	ldapr	w20, [x30]  // guest 0xd6962, sampled 0
6eae4edf20:    	str	w20, [x19, #0x18]  // guest 0xd6962, sampled 0
6eae4edf24:    	add	w20, w20, #0x60  // guest 0xd6966, sampled 0
6eae4edf28:    	ldp	x16, x17, [x19, #-0x70]  // guest 0xd6966, sampled 0
6eae4edf2c:    	and	x16, x16, x20, lsr #7  // guest 0xd6966, sampled 0
6eae4edf30:    	add	x17, x17, x16  // guest 0xd6966, sampled 0
6eae4edf34:    	ldp	x16, x17, [x17]  // guest 0xd6966, sampled 0
6eae4edf38:    	and	w30, w20, #0xfffff003  // guest 0xd6966, sampled 0
6eae4edf3c:    	cmp	w16, w30  // guest 0xd6966, sampled 0
6eae4edf40:    	b.ne	0x6eae4ee038 <trace+0x1b8>  // guest 0xd6966, sampled 0
6eae4edf44:    	add	x30, x17, w20, uxtw  // guest 0xd6966, sampled 0
6eae4edf48:    	ldapr	w20, [x30]  // guest 0xd6966, sampled 0
6eae4edf4c:    	str	w20, [x19]  // guest 0xd6966, sampled 24
6eae4edf50:    	and	w20, w20, #0x4  // guest 0xd6969, sampled 0
6eae4edf54:    	str	w20, [x19, #0x28]  // guest 0xd6969, sampled 0
6eae4edf58:    	ldr	w21, [x19, #0x4]  // guest 0xd696b, sampled 0
6eae4edf5c:    	str	w21, [x19, #0xc]  // guest 0xd696b, sampled 0
6eae4edf60:    	mov	w21, #0x1               // =1  // guest 0xd696b, sampled 0
6eae4edf64:    	sturb	w21, [x19, #-0xc]  // guest 0xd696b, sampled 0
6eae4edf68:    	mov	w21, #0x18              // =24  // guest 0xd696d, sampled 0
6eae4edf6c:    	str	w21, [x19, #0x34]  // guest 0xd696d, sampled 0
6eae4edf70:    	cbz	w20, 0x6eae4edf90 <trace+0x110>  // guest 0xd696d, sampled 0
6eae4edf74:    	b	0x6eae4edf74 <trace+0xf4>  // guest 0xd696d, sampled 0
6eae4edf78:    	br	x16  // guest 0xd696d, sampled 0
6eae4edf7c:    	mov	w20, #0x696f            // =26991  // guest 0xd696d, sampled 0
6eae4edf80:    	movk	w20, #0xd, lsl #16  // guest 0xd696d, sampled 0
6eae4edf84:    	str	w20, [x19, #0x20]  // guest 0xd696d, sampled 0
6eae4edf88:    	adr	x0, 0x6eae4eddc1 <trace+0xffffffffffffff41>  // guest 0xd696d, sampled 0
6eae4edf8c:    	b	0x6ea842202c <trace+0xfffffffff9f341ac>  // guest 0xd696d, sampled 0
6eae4edf90:    	b	0x6eae4edf90 <trace+0x110>  // guest 0xd696d, sampled 0
6eae4edf94:    	br	x16  // guest 0xd696d, sampled 0
6eae4edf98:    	mov	w20, #0x697d            // =27005  // guest 0xd696d, sampled 0
6eae4edf9c:    	movk	w20, #0xd, lsl #16  // guest 0xd696d, sampled 0
6eae4edfa0:    	str	w20, [x19, #0x20]  // guest 0xd696d, sampled 0
6eae4edfa4:    	adr	x0, 0x6eae4eddc0 <trace+0xffffffffffffff40>  // guest 0xd696d, sampled 0
6eae4edfa8:    	b	0x6ea842202c <trace+0xfffffffff9f341ac>  // guest 0xd696d, sampled 0
6eae4edfac:    	adr	x0, 0x6eae4eddc3 <trace+0xffffffffffffff43>  // guest 0xd696d, sampled 0
6eae4edfb0:    	b	0x6ea842202c <trace+0xfffffffff9f341ac>  // guest 0xd696d, sampled 0
6eae4edfb4:    	mov	w1, w21
6eae4edfb8:    	mov	w2, w22
6eae4edfbc:    	mov	x0, x19
6eae4edfc0:    	mov	w3, #0x4045             // =16453
6eae4edfc4:    	movk	w3, #0x1, lsl #16
6eae4edfc8:    	adr	x4, 0x6eae4edec0 <trace+0x40>
6eae4edfcc:    	adrp	x16, 0x6efc87d000 <trace+0x4e390000>
6eae4edfd0:    	add	x16, x16, #0xc38
6eae4edfd4:    	blr	x16
6eae4edfd8:    	dmb	ishld
6eae4edfdc:    	b	0x6eae4edec0 <trace+0x40>
6eae4edfe0:    	mov	w1, w21
6eae4edfe4:    	mov	w2, w22
6eae4edfe8:    	mov	x0, x19
6eae4edfec:    	mov	w3, #0x4045             // =16453
6eae4edff0:    	movk	w3, #0x1, lsl #16
6eae4edff4:    	adr	x4, 0x6eae4edef4 <trace+0x74>
6eae4edff8:    	adrp	x16, 0x6efc87d000 <trace+0x4e390000>
6eae4edffc:    	add	x16, x16, #0xc38
6eae4ee000:    	blr	x16
6eae4ee004:    	dmb	ishld
6eae4ee008:    	b	0x6eae4edef4 <trace+0x74>
6eae4ee00c:    	mov	w1, w20
6eae4ee010:    	mov	x0, x19
6eae4ee014:    	mov	w2, #0x4045             // =16453
6eae4ee018:    	movk	w2, #0x1, lsl #16
6eae4ee01c:    	adr	x3, 0x6eae4edf20 <trace+0xa0>
6eae4ee020:    	adrp	x16, 0x6efc87d000 <trace+0x4e38f000>
6eae4ee024:    	add	x16, x16, #0x58
6eae4ee028:    	blr	x16
6eae4ee02c:    	mov	w20, w0
6eae4ee030:    	dmb	ishld
6eae4ee034:    	b	0x6eae4edf20 <trace+0xa0>
6eae4ee038:    	mov	w1, w20
6eae4ee03c:    	mov	x0, x19
6eae4ee040:    	mov	w2, #0x4045             // =16453
6eae4ee044:    	movk	w2, #0x1, lsl #16
6eae4ee048:    	adr	x3, 0x6eae4edf4c <trace+0xcc>
6eae4ee04c:    	adrp	x16, 0x6efc87d000 <trace+0x4e38f000>
6eae4ee050:    	add	x16, x16, #0x58
6eae4ee054:    	blr	x16
6eae4ee058:    	mov	w20, w0
6eae4ee05c:    	dmb	ishld
6eae4ee060:    	b	0x6eae4edf4c <trace+0xcc>