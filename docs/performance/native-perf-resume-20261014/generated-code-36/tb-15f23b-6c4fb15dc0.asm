
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-15f23b-6c4fb15dc0.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006c4fb15dc0 <trace>:
6c4fb15dc0:    	ldur	w20, [x19, #-0x10]  // guest 0x15f23b, sampled 0
6c4fb15dc4:    	tbnz	w20, #0x1f, 0x6c4fb15f90 <trace+0x1d0>  // guest 0x15f23b, sampled 0
6c4fb15dc8:    	sturb	wzr, [x19, #-0xc]  // guest 0x15f23b, sampled 0
6c4fb15dcc:    	ldr	w20, [x19, #0xc]  // guest 0x15f23b, sampled 0
6c4fb15dd0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15f23b, sampled 0
6c4fb15dd4:    	and	x16, x16, x20, lsr #7  // guest 0x15f23b, sampled 0
6c4fb15dd8:    	add	x17, x17, x16  // guest 0x15f23b, sampled 0
6c4fb15ddc:    	ldp	x16, x17, [x17]  // guest 0x15f23b, sampled 0
6c4fb15de0:    	and	w30, w20, #0xfffff003  // guest 0x15f23b, sampled 0
6c4fb15de4:    	cmp	w16, w30  // guest 0x15f23b, sampled 0
6c4fb15de8:    	b.ne	0x6c4fb15f98 <trace+0x1d8>  // guest 0x15f23b, sampled 0
6c4fb15dec:    	add	x30, x17, w20, uxtw  // guest 0x15f23b, sampled 0
6c4fb15df0:    	ldapr	w20, [x30]  // guest 0x15f23b, sampled 0
6c4fb15df4:    	ldr	w21, [x19, #0x1c]  // guest 0x15f23d, sampled 0
6c4fb15df8:    	sxtw	x21, w21  // guest 0x15f23d, sampled 0
6c4fb15dfc:    	mov	w22, #0xf30             // =3888  // guest 0x15f23d, sampled 0
6c4fb15e00:    	mul	x21, x21, x22  // guest 0x15f23d, sampled 0
6c4fb15e04:    	add	w21, w21, w20  // guest 0x15f243, sampled 0
6c4fb15e08:    	str	w21, [x19, #0x1c]  // guest 0x15f243, sampled 0
6c4fb15e0c:    	str	w21, [x19, #0x28]  // guest 0x15f243, sampled 0
6c4fb15e10:    	str	w20, [x19, #0x2c]  // guest 0x15f243, sampled 0
6c4fb15e14:    	ldr	w20, [x19, #0x14]  // guest 0x15f245, sampled 0
6c4fb15e18:    	add	w20, w20, #0x30  // guest 0x15f245, sampled 0
6c4fb15e1c:    	str	w20, [sp, #0x80]  // guest 0x15f245, sampled 0
6c4fb15e20:    	str	w20, [x19, #0x18]  // guest 0x15f245, sampled 0
6c4fb15e24:    	mov	w20, #0x3cc             // =972  // guest 0x15f248, sampled 0
6c4fb15e28:    	str	w20, [sp, #0x84]  // guest 0x15f248, sampled 0
6c4fb15e2c:    	mov	w20, #0x3cc             // =972  // guest 0x15f248, sampled 0
6c4fb15e30:    	str	w20, [x19, #0x4]  // guest 0x15f248, sampled 0
6c4fb15e34:    	mov	w20, #0x1               // =1  // guest 0x15f248, sampled 0
6c4fb15e38:    	sturb	w20, [x19, #-0xc]  // guest 0x15f248, sampled 0
6c4fb15e3c:    	ldr	w20, [x19, #0x38]  // guest 0x15f24d, sampled 0
6c4fb15e40:    	lsl	w20, w20, #2  // guest 0x15f24d, sampled 0
6c4fb15e44:    	str	w20, [sp, #0x88]  // guest 0x15f24d, sampled 0
6c4fb15e48:    	mov	w20, #0xa               // =10  // guest 0x15f24d, sampled 0
6c4fb15e4c:    	str	w20, [x19, #0x34]  // guest 0x15f24d, sampled 0
6c4fb15e50:    	mov	w20, #0x3cb             // =971  // guest 0x15f24d, sampled 0
6c4fb15e54:    	str	w20, [sp, #0x8c]  // guest 0x15f24d, sampled 0
6c4fb15e58:    	ldr	w20, [x19, #0x18]  // guest 0x15f24d, sampled 1
6c4fb15e5c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15f24d, sampled 1
6c4fb15e60:    	and	x16, x16, x20, lsr #7  // guest 0x15f24d, sampled 0
6c4fb15e64:    	add	x17, x17, x16  // guest 0x15f24d, sampled 1
6c4fb15e68:    	ldp	x16, x17, [x17]  // guest 0x15f24d, sampled 0
6c4fb15e6c:    	and	w30, w20, #0xfffff003  // guest 0x15f24d, sampled 11
6c4fb15e70:    	cmp	w16, w30  // guest 0x15f24d, sampled 0
6c4fb15e74:    	b.ne	0x6c4fb15fc4 <trace+0x204>  // guest 0x15f24d, sampled 0
6c4fb15e78:    	add	x30, x17, w20, uxtw  // guest 0x15f24d, sampled 3
6c4fb15e7c:    	ldapr	w21, [x30]  // guest 0x15f24d, sampled 0
6c4fb15e80:    	str	w21, [sp, #0x84]  // guest 0x15f24d, sampled 18
6c4fb15e84:    	ldr	w22, [x19, #0x1c]  // guest 0x15f24d, sampled 0
6c4fb15e88:    	str	w22, [sp, #0x80]  // guest 0x15f24d, sampled 0
6c4fb15e8c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15f24d, sampled 0
6c4fb15e90:    	and	x16, x16, x22, lsr #7  // guest 0x15f24d, sampled 0
6c4fb15e94:    	add	x17, x17, x16  // guest 0x15f24d, sampled 0
6c4fb15e98:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15f24d, sampled 0
6c4fb15e9c:    	and	w30, w22, #0xfffff003  // guest 0x15f24d, sampled 0
6c4fb15ea0:    	cmp	w16, w30  // guest 0x15f24d, sampled 3
6c4fb15ea4:    	b.ne	0x6c4fb15ff0 <trace+0x230>  // guest 0x15f24d, sampled 0
6c4fb15ea8:    	add	x30, x17, w22, uxtw  // guest 0x15f24d, sampled 0
6c4fb15eac:    	stlr	w21, [x30]  // guest 0x15f24d, sampled 0
6c4fb15eb0:    	ldr	w21, [sp, #0x88]  // guest 0x15f24d, sampled 1
6c4fb15eb4:    	add	w20, w20, w21  // guest 0x15f24d, sampled 0
6c4fb15eb8:    	str	w20, [x19, #0x18]  // guest 0x15f24d, sampled 0
6c4fb15ebc:    	add	w20, w22, w21  // guest 0x15f24d, sampled 0
6c4fb15ec0:    	str	w20, [x19, #0x1c]  // guest 0x15f24d, sampled 0
6c4fb15ec4:    	ldr	w20, [sp, #0x8c]  // guest 0x15f24d, sampled 2
6c4fb15ec8:    	str	w20, [x19, #0x4]  // guest 0x15f24d, sampled 0
6c4fb15ecc:    	sub	w20, w20, #0x1  // guest 0x15f24d, sampled 1
6c4fb15ed0:    	str	w20, [sp, #0x8c]  // guest 0x15f24d, sampled 0
6c4fb15ed4:    	tst	w20, #0xffff  // guest 0x15f24d, sampled 0
6c4fb15ed8:    	b.ne	0x6c4fb15e58 <trace+0x98>  // guest 0x15f24d, sampled 0
6c4fb15edc:    	cbz	w20, 0x6c4fb15f08 <trace+0x148>  // guest 0x15f24d, sampled 0
6c4fb15ee0:    	ldr	w20, [x19, #0x24]  // guest 0x15f24d, sampled 0
6c4fb15ee4:    	orr	w20, w20, #0x10000  // guest 0x15f24d, sampled 0
6c4fb15ee8:    	str	w20, [x19, #0x24]  // guest 0x15f24d, sampled 0
6c4fb15eec:    	b	0x6c4fb15eec <trace+0x12c>  // guest 0x15f24d, sampled 0
6c4fb15ef0:    	br	x16  // guest 0x15f24d, sampled 0
6c4fb15ef4:    	mov	w20, #0xf24d            // =62029  // guest 0x15f24d, sampled 0
6c4fb15ef8:    	movk	w20, #0x15, lsl #16  // guest 0x15f24d, sampled 0
6c4fb15efc:    	str	w20, [x19, #0x20]  // guest 0x15f24d, sampled 0
6c4fb15f00:    	adr	x0, 0x6c4fb15d00 <trace+0xffffffffffffff40>  // guest 0x15f24d, sampled 0
6c4fb15f04:    	b	0x6c4ae5d02c <trace+0xfffffffffb34726c>  // guest 0x15f24d, sampled 0
6c4fb15f08:    	ldr	w20, [x19, #0x18]  // guest 0x15f24d, sampled 0
6c4fb15f0c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15f24d, sampled 0
6c4fb15f10:    	and	x16, x16, x20, lsr #7  // guest 0x15f24d, sampled 0
6c4fb15f14:    	add	x17, x17, x16  // guest 0x15f24d, sampled 0
6c4fb15f18:    	ldp	x16, x17, [x17]  // guest 0x15f24d, sampled 0
6c4fb15f1c:    	and	w30, w20, #0xfffff003  // guest 0x15f24d, sampled 0
6c4fb15f20:    	cmp	w16, w30  // guest 0x15f24d, sampled 0
6c4fb15f24:    	b.ne	0x6c4fb1601c <trace+0x25c>  // guest 0x15f24d, sampled 0
6c4fb15f28:    	add	x30, x17, w20, uxtw  // guest 0x15f24d, sampled 0
6c4fb15f2c:    	ldapr	w21, [x30]  // guest 0x15f24d, sampled 0
6c4fb15f30:    	ldr	w22, [x19, #0x1c]  // guest 0x15f24d, sampled 0
6c4fb15f34:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15f24d, sampled 0
6c4fb15f38:    	and	x16, x16, x22, lsr #7  // guest 0x15f24d, sampled 0
6c4fb15f3c:    	add	x17, x17, x16  // guest 0x15f24d, sampled 0
6c4fb15f40:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15f24d, sampled 0
6c4fb15f44:    	and	w30, w22, #0xfffff003  // guest 0x15f24d, sampled 0
6c4fb15f48:    	cmp	w16, w30  // guest 0x15f24d, sampled 0
6c4fb15f4c:    	b.ne	0x6c4fb16048 <trace+0x288>  // guest 0x15f24d, sampled 0
6c4fb15f50:    	add	x30, x17, w22, uxtw  // guest 0x15f24d, sampled 0
6c4fb15f54:    	stlr	w21, [x30]  // guest 0x15f24d, sampled 0
6c4fb15f58:    	ldr	w21, [sp, #0x88]  // guest 0x15f24d, sampled 0
6c4fb15f5c:    	add	w20, w20, w21  // guest 0x15f24d, sampled 0
6c4fb15f60:    	str	w20, [x19, #0x18]  // guest 0x15f24d, sampled 0
6c4fb15f64:    	add	w20, w22, w21  // guest 0x15f24d, sampled 0
6c4fb15f68:    	str	w20, [x19, #0x1c]  // guest 0x15f24d, sampled 0
6c4fb15f6c:    	ldr	w20, [sp, #0x8c]  // guest 0x15f24d, sampled 0
6c4fb15f70:    	str	w20, [x19, #0x4]  // guest 0x15f24d, sampled 0
6c4fb15f74:    	b	0x6c4fb15f74 <trace+0x1b4>  // guest 0x15f24d, sampled 0
6c4fb15f78:    	br	x16  // guest 0x15f24d, sampled 0
6c4fb15f7c:    	mov	w20, #0xf24f            // =62031  // guest 0x15f24d, sampled 0
6c4fb15f80:    	movk	w20, #0x15, lsl #16  // guest 0x15f24d, sampled 0
6c4fb15f84:    	str	w20, [x19, #0x20]  // guest 0x15f24d, sampled 0
6c4fb15f88:    	adr	x0, 0x6c4fb15d01 <trace+0xffffffffffffff41>  // guest 0x15f24d, sampled 0
6c4fb15f8c:    	b	0x6c4ae5d02c <trace+0xfffffffffb34726c>  // guest 0x15f24d, sampled 0
6c4fb15f90:    	adr	x0, 0x6c4fb15d03 <trace+0xffffffffffffff43>  // guest 0x15f24d, sampled 0
6c4fb15f94:    	b	0x6c4ae5d02c <trace+0xfffffffffb34726c>  // guest 0x15f24d, sampled 0
6c4fb15f98:    	mov	w1, w20
6c4fb15f9c:    	mov	x0, x19
6c4fb15fa0:    	mov	w2, #0x4045             // =16453
6c4fb15fa4:    	movk	w2, #0x1, lsl #16
6c4fb15fa8:    	adr	x3, 0x6c4fb15df4 <trace+0x34>
6c4fb15fac:    	adrp	x16, 0x6c97723000 <trace+0x47c0e000>
6c4fb15fb0:    	add	x16, x16, #0xf88
6c4fb15fb4:    	blr	x16
6c4fb15fb8:    	mov	w20, w0
6c4fb15fbc:    	dmb	ishld
6c4fb15fc0:    	b	0x6c4fb15df4 <trace+0x34>
6c4fb15fc4:    	mov	w1, w20
6c4fb15fc8:    	mov	x0, x19
6c4fb15fcc:    	mov	w2, #0x4045             // =16453
6c4fb15fd0:    	movk	w2, #0x1, lsl #16
6c4fb15fd4:    	adr	x3, 0x6c4fb15e80 <trace+0xc0>
6c4fb15fd8:    	adrp	x16, 0x6c97723000 <trace+0x47c0e000>
6c4fb15fdc:    	add	x16, x16, #0xf88
6c4fb15fe0:    	blr	x16
6c4fb15fe4:    	mov	w21, w0
6c4fb15fe8:    	dmb	ishld
6c4fb15fec:    	b	0x6c4fb15e80 <trace+0xc0>
6c4fb15ff0:    	mov	w1, w22
6c4fb15ff4:    	mov	w2, w21
6c4fb15ff8:    	mov	x0, x19
6c4fb15ffc:    	mov	w3, #0x4045             // =16453
6c4fb16000:    	movk	w3, #0x1, lsl #16
6c4fb16004:    	adr	x4, 0x6c4fb15eb0 <trace+0xf0>
6c4fb16008:    	adrp	x16, 0x6c97724000 <trace+0x47c0e000>
6c4fb1600c:    	add	x16, x16, #0xb68
6c4fb16010:    	blr	x16
6c4fb16014:    	dmb	ishld
6c4fb16018:    	b	0x6c4fb15eb0 <trace+0xf0>
6c4fb1601c:    	mov	w1, w20
6c4fb16020:    	mov	x0, x19
6c4fb16024:    	mov	w2, #0x4045             // =16453
6c4fb16028:    	movk	w2, #0x1, lsl #16
6c4fb1602c:    	adr	x3, 0x6c4fb15f30 <trace+0x170>
6c4fb16030:    	adrp	x16, 0x6c97723000 <trace+0x47c0d000>
6c4fb16034:    	add	x16, x16, #0xf88
6c4fb16038:    	blr	x16
6c4fb1603c:    	mov	w21, w0
6c4fb16040:    	dmb	ishld
6c4fb16044:    	b	0x6c4fb15f30 <trace+0x170>
6c4fb16048:    	mov	w1, w22
6c4fb1604c:    	mov	w2, w21
6c4fb16050:    	mov	x0, x19
6c4fb16054:    	mov	w3, #0x4045             // =16453
6c4fb16058:    	movk	w3, #0x1, lsl #16
6c4fb1605c:    	adr	x4, 0x6c4fb15f58 <trace+0x198>
6c4fb16060:    	adrp	x16, 0x6c97724000 <trace+0x47c0e000>
6c4fb16064:    	add	x16, x16, #0xb68
6c4fb16068:    	blr	x16
6c4fb1606c:    	dmb	ishld
6c4fb16070:    	b	0x6c4fb15f58 <trace+0x198>