
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-33c2c0-6c51181e00.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006c51181e00 <trace>:
6c51181e00:    	ldur	w20, [x19, #-0x10]  // guest 0x33c2c0, sampled 0
6c51181e04:    	tbnz	w20, #0x1f, 0x6c51182150 <trace+0x350>  // guest 0x33c2c0, sampled 0
6c51181e08:    	sturb	wzr, [x19, #-0xc]  // guest 0x33c2c0, sampled 0
6c51181e0c:    	str	wzr, [x19, #0x188]  // guest 0x33c2c8, sampled 1
6c51181e10:    	str	xzr, [x19, #0x190]  // guest 0x33c2c8, sampled 0
6c51181e14:    	ldr	w20, [x19, #0x18]  // guest 0x33c2c8, sampled 0
6c51181e18:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2c8, sampled 1
6c51181e1c:    	and	x16, x16, x20, lsr #7  // guest 0x33c2c8, sampled 0
6c51181e20:    	add	x17, x17, x16  // guest 0x33c2c8, sampled 0
6c51181e24:    	ldp	x16, x17, [x17]  // guest 0x33c2c8, sampled 0
6c51181e28:    	and	w30, w20, #0xfffff007  // guest 0x33c2c8, sampled 1
6c51181e2c:    	cmp	w16, w30  // guest 0x33c2c8, sampled 0
6c51181e30:    	b.ne	0x6c51182158 <trace+0x358>  // guest 0x33c2c8, sampled 0
6c51181e34:    	add	x30, x17, w20, uxtw  // guest 0x33c2c8, sampled 0
6c51181e38:    	ldapr	x21, [x30]  // guest 0x33c2c8, sampled 0
6c51181e3c:    	str	x21, [x19, #0x4f0]  // guest 0x33c2c8, sampled 1
6c51181e40:    	str	x21, [x19, #0x1a0]  // guest 0x33c2c8, sampled 0
6c51181e44:    	add	w22, w20, #0x8  // guest 0x33c2cb, sampled 0
6c51181e48:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2cb, sampled 0
6c51181e4c:    	and	x16, x16, x22, lsr #7  // guest 0x33c2cb, sampled 0
6c51181e50:    	add	x17, x17, x16  // guest 0x33c2cb, sampled 0
6c51181e54:    	ldp	x16, x17, [x17]  // guest 0x33c2cb, sampled 0
6c51181e58:    	and	w30, w22, #0xfffff007  // guest 0x33c2cb, sampled 0
6c51181e5c:    	cmp	w16, w30  // guest 0x33c2cb, sampled 0
6c51181e60:    	b.ne	0x6c51182184 <trace+0x384>  // guest 0x33c2cb, sampled 0
6c51181e64:    	add	x30, x17, w22, uxtw  // guest 0x33c2cb, sampled 0
6c51181e68:    	ldapr	x22, [x30]  // guest 0x33c2cb, sampled 0
6c51181e6c:    	str	x22, [x19, #0x4f0]  // guest 0x33c2cb, sampled 0
6c51181e70:    	str	x22, [x19, #0x1b0]  // guest 0x33c2cb, sampled 0
6c51181e74:    	add	w23, w20, #0x10  // guest 0x33c2cf, sampled 0
6c51181e78:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2cf, sampled 0
6c51181e7c:    	and	x16, x16, x23, lsr #7  // guest 0x33c2cf, sampled 0
6c51181e80:    	add	x17, x17, x16  // guest 0x33c2cf, sampled 0
6c51181e84:    	ldp	x16, x17, [x17]  // guest 0x33c2cf, sampled 0
6c51181e88:    	and	w30, w23, #0xfffff007  // guest 0x33c2cf, sampled 1
6c51181e8c:    	cmp	w16, w30  // guest 0x33c2cf, sampled 0
6c51181e90:    	b.ne	0x6c511821b0 <trace+0x3b0>  // guest 0x33c2cf, sampled 0
6c51181e94:    	add	x30, x17, w23, uxtw  // guest 0x33c2cf, sampled 0
6c51181e98:    	ldapr	x23, [x30]  // guest 0x33c2cf, sampled 0
6c51181e9c:    	str	x23, [x19, #0x4f0]  // guest 0x33c2cf, sampled 1
6c51181ea0:    	str	x23, [x19, #0x1c0]  // guest 0x33c2cf, sampled 0
6c51181ea4:    	add	w24, w20, #0x18  // guest 0x33c2d3, sampled 0
6c51181ea8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2d3, sampled 0
6c51181eac:    	and	x16, x16, x24, lsr #7  // guest 0x33c2d3, sampled 0
6c51181eb0:    	add	x17, x17, x16  // guest 0x33c2d3, sampled 0
6c51181eb4:    	ldp	x16, x17, [x17]  // guest 0x33c2d3, sampled 0
6c51181eb8:    	and	w30, w24, #0xfffff007  // guest 0x33c2d3, sampled 0
6c51181ebc:    	cmp	w16, w30  // guest 0x33c2d3, sampled 0
6c51181ec0:    	b.ne	0x6c511821dc <trace+0x3dc>  // guest 0x33c2d3, sampled 0
6c51181ec4:    	add	x30, x17, w24, uxtw  // guest 0x33c2d3, sampled 0
6c51181ec8:    	ldapr	x24, [x30]  // guest 0x33c2d3, sampled 0
6c51181ecc:    	str	x24, [x19, #0x4f0]  // guest 0x33c2d3, sampled 0
6c51181ed0:    	str	x24, [x19, #0x1d0]  // guest 0x33c2d3, sampled 0
6c51181ed4:    	add	w25, w20, #0x20  // guest 0x33c2d7, sampled 0
6c51181ed8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2d7, sampled 0
6c51181edc:    	and	x16, x16, x25, lsr #7  // guest 0x33c2d7, sampled 0
6c51181ee0:    	add	x17, x17, x16  // guest 0x33c2d7, sampled 0
6c51181ee4:    	ldp	x16, x17, [x17]  // guest 0x33c2d7, sampled 0
6c51181ee8:    	and	w30, w25, #0xfffff007  // guest 0x33c2d7, sampled 0
6c51181eec:    	cmp	w16, w30  // guest 0x33c2d7, sampled 0
6c51181ef0:    	b.ne	0x6c51182208 <trace+0x408>  // guest 0x33c2d7, sampled 0
6c51181ef4:    	add	x30, x17, w25, uxtw  // guest 0x33c2d7, sampled 0
6c51181ef8:    	ldapr	x25, [x30]  // guest 0x33c2d7, sampled 0
6c51181efc:    	str	x25, [x19, #0x4f0]  // guest 0x33c2d7, sampled 0
6c51181f00:    	str	x25, [x19, #0x1e0]  // guest 0x33c2d7, sampled 0
6c51181f04:    	add	w26, w20, #0x28  // guest 0x33c2db, sampled 0
6c51181f08:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2db, sampled 0
6c51181f0c:    	and	x16, x16, x26, lsr #7  // guest 0x33c2db, sampled 0
6c51181f10:    	add	x17, x17, x16  // guest 0x33c2db, sampled 0
6c51181f14:    	ldp	x16, x17, [x17]  // guest 0x33c2db, sampled 0
6c51181f18:    	and	w30, w26, #0xfffff007  // guest 0x33c2db, sampled 0
6c51181f1c:    	cmp	w16, w30  // guest 0x33c2db, sampled 0
6c51181f20:    	b.ne	0x6c51182234 <trace+0x434>  // guest 0x33c2db, sampled 0
6c51181f24:    	add	x30, x17, w26, uxtw  // guest 0x33c2db, sampled 0
6c51181f28:    	ldapr	x26, [x30]  // guest 0x33c2db, sampled 0
6c51181f2c:    	str	x26, [x19, #0x4f0]  // guest 0x33c2db, sampled 0
6c51181f30:    	str	x26, [x19, #0x1f0]  // guest 0x33c2db, sampled 0
6c51181f34:    	add	w27, w20, #0x30  // guest 0x33c2df, sampled 0
6c51181f38:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2df, sampled 0
6c51181f3c:    	and	x16, x16, x27, lsr #7  // guest 0x33c2df, sampled 0
6c51181f40:    	add	x17, x17, x16  // guest 0x33c2df, sampled 0
6c51181f44:    	ldp	x16, x17, [x17]  // guest 0x33c2df, sampled 0
6c51181f48:    	and	w30, w27, #0xfffff007  // guest 0x33c2df, sampled 0
6c51181f4c:    	cmp	w16, w30  // guest 0x33c2df, sampled 0
6c51181f50:    	b.ne	0x6c51182260 <trace+0x460>  // guest 0x33c2df, sampled 0
6c51181f54:    	add	x30, x17, w27, uxtw  // guest 0x33c2df, sampled 0
6c51181f58:    	ldapr	x27, [x30]  // guest 0x33c2df, sampled 0
6c51181f5c:    	str	x27, [x19, #0x4f0]  // guest 0x33c2df, sampled 0
6c51181f60:    	str	x27, [x19, #0x200]  // guest 0x33c2df, sampled 0
6c51181f64:    	add	w28, w20, #0x38  // guest 0x33c2e3, sampled 1
6c51181f68:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2e3, sampled 0
6c51181f6c:    	and	x16, x16, x28, lsr #7  // guest 0x33c2e3, sampled 0
6c51181f70:    	add	x17, x17, x16  // guest 0x33c2e3, sampled 0
6c51181f74:    	ldp	x16, x17, [x17]  // guest 0x33c2e3, sampled 0
6c51181f78:    	and	w30, w28, #0xfffff007  // guest 0x33c2e3, sampled 0
6c51181f7c:    	cmp	w16, w30  // guest 0x33c2e3, sampled 0
6c51181f80:    	b.ne	0x6c5118228c <trace+0x48c>  // guest 0x33c2e3, sampled 0
6c51181f84:    	add	x30, x17, w28, uxtw  // guest 0x33c2e3, sampled 0
6c51181f88:    	ldapr	x28, [x30]  // guest 0x33c2e3, sampled 0
6c51181f8c:    	str	x28, [x19, #0x4f0]  // guest 0x33c2e3, sampled 2
6c51181f90:    	str	x28, [x19, #0x210]  // guest 0x33c2e3, sampled 1
6c51181f94:    	ldr	w8, [x19, #0x1c]  // guest 0x33c2e9, sampled 0
6c51181f98:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2e9, sampled 0
6c51181f9c:    	and	x16, x16, x8, lsr #7  // guest 0x33c2e9, sampled 0
6c51181fa0:    	add	x17, x17, x16  // guest 0x33c2e9, sampled 0
6c51181fa4:    	ldp	x17, x16, [x17, #0x8]  // guest 0x33c2e9, sampled 0
6c51181fa8:    	and	w30, w8, #0xfffff007  // guest 0x33c2e9, sampled 0
6c51181fac:    	cmp	w16, w30  // guest 0x33c2e9, sampled 0
6c51181fb0:    	b.ne	0x6c511822b8 <trace+0x4b8>  // guest 0x33c2e9, sampled 0
6c51181fb4:    	add	x30, x17, w8, uxtw  // guest 0x33c2e9, sampled 1
6c51181fb8:    	stlr	x21, [x30]  // guest 0x33c2e9, sampled 0
6c51181fbc:    	ldr	w21, [x19, #0x1c]  // guest 0x33c2ec, sampled 0
6c51181fc0:    	add	w8, w21, #0x8  // guest 0x33c2ec, sampled 0
6c51181fc4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2ec, sampled 0
6c51181fc8:    	and	x16, x16, x8, lsr #7  // guest 0x33c2ec, sampled 0
6c51181fcc:    	add	x17, x17, x16  // guest 0x33c2ec, sampled 0
6c51181fd0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x33c2ec, sampled 0
6c51181fd4:    	and	w30, w8, #0xfffff007  // guest 0x33c2ec, sampled 0
6c51181fd8:    	cmp	w16, w30  // guest 0x33c2ec, sampled 0
6c51181fdc:    	b.ne	0x6c511822e4 <trace+0x4e4>  // guest 0x33c2ec, sampled 0
6c51181fe0:    	add	x30, x17, w8, uxtw  // guest 0x33c2ec, sampled 0
6c51181fe4:    	stlr	x22, [x30]  // guest 0x33c2ec, sampled 0
6c51181fe8:    	add	w22, w21, #0x10  // guest 0x33c2f0, sampled 0
6c51181fec:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2f0, sampled 0
6c51181ff0:    	and	x16, x16, x22, lsr #7  // guest 0x33c2f0, sampled 0
6c51181ff4:    	add	x17, x17, x16  // guest 0x33c2f0, sampled 0
6c51181ff8:    	ldp	x17, x16, [x17, #0x8]  // guest 0x33c2f0, sampled 0
6c51181ffc:    	and	w30, w22, #0xfffff007  // guest 0x33c2f0, sampled 0
6c51182000:    	cmp	w16, w30  // guest 0x33c2f0, sampled 0
6c51182004:    	b.ne	0x6c51182310 <trace+0x510>  // guest 0x33c2f0, sampled 0
6c51182008:    	add	x30, x17, w22, uxtw  // guest 0x33c2f0, sampled 0
6c5118200c:    	stlr	x23, [x30]  // guest 0x33c2f0, sampled 0
6c51182010:    	add	w22, w21, #0x18  // guest 0x33c2f4, sampled 0
6c51182014:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2f4, sampled 0
6c51182018:    	and	x16, x16, x22, lsr #7  // guest 0x33c2f4, sampled 0
6c5118201c:    	add	x17, x17, x16  // guest 0x33c2f4, sampled 0
6c51182020:    	ldp	x17, x16, [x17, #0x8]  // guest 0x33c2f4, sampled 0
6c51182024:    	and	w30, w22, #0xfffff007  // guest 0x33c2f4, sampled 0
6c51182028:    	cmp	w16, w30  // guest 0x33c2f4, sampled 0
6c5118202c:    	b.ne	0x6c5118233c <trace+0x53c>  // guest 0x33c2f4, sampled 0
6c51182030:    	add	x30, x17, w22, uxtw  // guest 0x33c2f4, sampled 0
6c51182034:    	stlr	x24, [x30]  // guest 0x33c2f4, sampled 0
6c51182038:    	add	w22, w21, #0x20  // guest 0x33c2f8, sampled 0
6c5118203c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2f8, sampled 0
6c51182040:    	and	x16, x16, x22, lsr #7  // guest 0x33c2f8, sampled 0
6c51182044:    	add	x17, x17, x16  // guest 0x33c2f8, sampled 0
6c51182048:    	ldp	x17, x16, [x17, #0x8]  // guest 0x33c2f8, sampled 0
6c5118204c:    	and	w30, w22, #0xfffff007  // guest 0x33c2f8, sampled 2
6c51182050:    	cmp	w16, w30  // guest 0x33c2f8, sampled 0
6c51182054:    	b.ne	0x6c51182368 <trace+0x568>  // guest 0x33c2f8, sampled 0
6c51182058:    	add	x30, x17, w22, uxtw  // guest 0x33c2f8, sampled 0
6c5118205c:    	stlr	x25, [x30]  // guest 0x33c2f8, sampled 0
6c51182060:    	add	w22, w21, #0x28  // guest 0x33c2fc, sampled 0
6c51182064:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2fc, sampled 0
6c51182068:    	and	x16, x16, x22, lsr #7  // guest 0x33c2fc, sampled 0
6c5118206c:    	add	x17, x17, x16  // guest 0x33c2fc, sampled 0
6c51182070:    	ldp	x17, x16, [x17, #0x8]  // guest 0x33c2fc, sampled 0
6c51182074:    	and	w30, w22, #0xfffff007  // guest 0x33c2fc, sampled 0
6c51182078:    	cmp	w16, w30  // guest 0x33c2fc, sampled 0
6c5118207c:    	b.ne	0x6c51182394 <trace+0x594>  // guest 0x33c2fc, sampled 0
6c51182080:    	add	x30, x17, w22, uxtw  // guest 0x33c2fc, sampled 0
6c51182084:    	stlr	x26, [x30]  // guest 0x33c2fc, sampled 0
6c51182088:    	add	w22, w21, #0x30  // guest 0x33c300, sampled 0
6c5118208c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c300, sampled 0
6c51182090:    	and	x16, x16, x22, lsr #7  // guest 0x33c300, sampled 0
6c51182094:    	add	x17, x17, x16  // guest 0x33c300, sampled 0
6c51182098:    	ldp	x17, x16, [x17, #0x8]  // guest 0x33c300, sampled 0
6c5118209c:    	and	w30, w22, #0xfffff007  // guest 0x33c300, sampled 0
6c511820a0:    	cmp	w16, w30  // guest 0x33c300, sampled 0
6c511820a4:    	b.ne	0x6c511823c0 <trace+0x5c0>  // guest 0x33c300, sampled 0
6c511820a8:    	add	x30, x17, w22, uxtw  // guest 0x33c300, sampled 0
6c511820ac:    	stlr	x27, [x30]  // guest 0x33c300, sampled 0
6c511820b0:    	add	w22, w21, #0x38  // guest 0x33c304, sampled 0
6c511820b4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c304, sampled 0
6c511820b8:    	and	x16, x16, x22, lsr #7  // guest 0x33c304, sampled 0
6c511820bc:    	add	x17, x17, x16  // guest 0x33c304, sampled 0
6c511820c0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x33c304, sampled 0
6c511820c4:    	and	w30, w22, #0xfffff007  // guest 0x33c304, sampled 0
6c511820c8:    	cmp	w16, w30  // guest 0x33c304, sampled 0
6c511820cc:    	b.ne	0x6c511823ec <trace+0x5ec>  // guest 0x33c304, sampled 0
6c511820d0:    	add	x30, x17, w22, uxtw  // guest 0x33c304, sampled 0
6c511820d4:    	stlr	x28, [x30]  // guest 0x33c304, sampled 0
6c511820d8:    	add	w20, w20, #0x40  // guest 0x33c308, sampled 0
6c511820dc:    	str	w20, [x19, #0x18]  // guest 0x33c308, sampled 0
6c511820e0:    	add	w20, w21, #0x40  // guest 0x33c30b, sampled 0
6c511820e4:    	str	w20, [x19, #0x1c]  // guest 0x33c30b, sampled 0
6c511820e8:    	ldr	w21, [x19, #0x4]  // guest 0x33c30e, sampled 0
6c511820ec:    	sub	w21, w21, #0x1  // guest 0x33c30e, sampled 0
6c511820f0:    	cmp	w20, #0x40  // guest 0x33c30e, sampled 0
6c511820f4:    	cset	w20, lo  // guest 0x33c30e, sampled 0
6c511820f8:    	str	w21, [x19, #0x4]  // guest 0x33c30e, sampled 0
6c511820fc:    	str	w21, [x19, #0x28]  // guest 0x33c30e, sampled 0
6c51182100:    	str	w20, [x19, #0x2c]  // guest 0x33c30e, sampled 0
6c51182104:    	mov	w20, #0x1               // =1  // guest 0x33c30e, sampled 0
6c51182108:    	sturb	w20, [x19, #-0xc]  // guest 0x33c30e, sampled 0
6c5118210c:    	mov	w20, #0x22              // =34  // guest 0x33c30f, sampled 0
6c51182110:    	str	w20, [x19, #0x34]  // guest 0x33c30f, sampled 0
6c51182114:    	cbnz	w21, 0x6c51182134 <trace+0x334>  // guest 0x33c30f, sampled 0
6c51182118:    	b	0x6c51182118 <trace+0x318>  // guest 0x33c30f, sampled 0
6c5118211c:    	br	x16  // guest 0x33c30f, sampled 0
6c51182120:    	mov	w20, #0xc311            // =49937  // guest 0x33c30f, sampled 0
6c51182124:    	movk	w20, #0x33, lsl #16  // guest 0x33c30f, sampled 0
6c51182128:    	str	w20, [x19, #0x20]  // guest 0x33c30f, sampled 0
6c5118212c:    	adr	x0, 0x6c51181d41 <trace+0xffffffffffffff41>  // guest 0x33c30f, sampled 0
6c51182130:    	b	0x6c4ae5d02c <trace+0xfffffffff9cdb22c>  // guest 0x33c30f, sampled 0
6c51182134:    	b	0x6c51182134 <trace+0x334>  // guest 0x33c30f, sampled 0
6c51182138:    	br	x16  // guest 0x33c30f, sampled 0
6c5118213c:    	mov	w20, #0xc2c0            // =49856  // guest 0x33c30f, sampled 0
6c51182140:    	movk	w20, #0x33, lsl #16  // guest 0x33c30f, sampled 0
6c51182144:    	str	w20, [x19, #0x20]  // guest 0x33c30f, sampled 0
6c51182148:    	adr	x0, 0x6c51181d40 <trace+0xffffffffffffff40>  // guest 0x33c30f, sampled 0
6c5118214c:    	b	0x6c4ae5d02c <trace+0xfffffffff9cdb22c>  // guest 0x33c30f, sampled 0
6c51182150:    	adr	x0, 0x6c51181d43 <trace+0xffffffffffffff43>  // guest 0x33c30f, sampled 0
6c51182154:    	b	0x6c4ae5d02c <trace+0xfffffffff9cdb22c>  // guest 0x33c30f, sampled 0
6c51182158:    	mov	w1, w20
6c5118215c:    	mov	x0, x19
6c51182160:    	mov	w2, #0x4065             // =16485
6c51182164:    	movk	w2, #0x1, lsl #16
6c51182168:    	adr	x3, 0x6c51181e3c <trace+0x3c>
6c5118216c:    	adrp	x16, 0x6c97724000 <trace+0x465a2000>
6c51182170:    	add	x16, x16, #0x228
6c51182174:    	blr	x16
6c51182178:    	mov	x21, x0
6c5118217c:    	dmb	ishld
6c51182180:    	b	0x6c51181e3c <trace+0x3c>
6c51182184:    	mov	w1, w22
6c51182188:    	mov	x0, x19
6c5118218c:    	mov	w2, #0x4065             // =16485
6c51182190:    	movk	w2, #0x1, lsl #16
6c51182194:    	adr	x3, 0x6c51181e6c <trace+0x6c>
6c51182198:    	adrp	x16, 0x6c97724000 <trace+0x465a2000>
6c5118219c:    	add	x16, x16, #0x228
6c511821a0:    	blr	x16
6c511821a4:    	mov	x22, x0
6c511821a8:    	dmb	ishld
6c511821ac:    	b	0x6c51181e6c <trace+0x6c>
6c511821b0:    	mov	w1, w23
6c511821b4:    	mov	x0, x19
6c511821b8:    	mov	w2, #0x4065             // =16485
6c511821bc:    	movk	w2, #0x1, lsl #16
6c511821c0:    	adr	x3, 0x6c51181e9c <trace+0x9c>
6c511821c4:    	adrp	x16, 0x6c97724000 <trace+0x465a2000>
6c511821c8:    	add	x16, x16, #0x228
6c511821cc:    	blr	x16
6c511821d0:    	mov	x23, x0
6c511821d4:    	dmb	ishld
6c511821d8:    	b	0x6c51181e9c <trace+0x9c>
6c511821dc:    	mov	w1, w24
6c511821e0:    	mov	x0, x19
6c511821e4:    	mov	w2, #0x4065             // =16485
6c511821e8:    	movk	w2, #0x1, lsl #16
6c511821ec:    	adr	x3, 0x6c51181ecc <trace+0xcc>
6c511821f0:    	adrp	x16, 0x6c97724000 <trace+0x465a2000>
6c511821f4:    	add	x16, x16, #0x228
6c511821f8:    	blr	x16
6c511821fc:    	mov	x24, x0
6c51182200:    	dmb	ishld
6c51182204:    	b	0x6c51181ecc <trace+0xcc>
6c51182208:    	mov	w1, w25
6c5118220c:    	mov	x0, x19
6c51182210:    	mov	w2, #0x4065             // =16485
6c51182214:    	movk	w2, #0x1, lsl #16
6c51182218:    	adr	x3, 0x6c51181efc <trace+0xfc>
6c5118221c:    	adrp	x16, 0x6c97724000 <trace+0x465a2000>
6c51182220:    	add	x16, x16, #0x228
6c51182224:    	blr	x16
6c51182228:    	mov	x25, x0
6c5118222c:    	dmb	ishld
6c51182230:    	b	0x6c51181efc <trace+0xfc>
6c51182234:    	mov	w1, w26
6c51182238:    	mov	x0, x19
6c5118223c:    	mov	w2, #0x4065             // =16485
6c51182240:    	movk	w2, #0x1, lsl #16
6c51182244:    	adr	x3, 0x6c51181f2c <trace+0x12c>
6c51182248:    	adrp	x16, 0x6c97724000 <trace+0x465a2000>
6c5118224c:    	add	x16, x16, #0x228
6c51182250:    	blr	x16
6c51182254:    	mov	x26, x0
6c51182258:    	dmb	ishld
6c5118225c:    	b	0x6c51181f2c <trace+0x12c>
6c51182260:    	mov	w1, w27
6c51182264:    	mov	x0, x19
6c51182268:    	mov	w2, #0x4065             // =16485
6c5118226c:    	movk	w2, #0x1, lsl #16
6c51182270:    	adr	x3, 0x6c51181f5c <trace+0x15c>
6c51182274:    	adrp	x16, 0x6c97724000 <trace+0x465a2000>
6c51182278:    	add	x16, x16, #0x228
6c5118227c:    	blr	x16
6c51182280:    	mov	x27, x0
6c51182284:    	dmb	ishld
6c51182288:    	b	0x6c51181f5c <trace+0x15c>
6c5118228c:    	mov	w1, w28
6c51182290:    	mov	x0, x19
6c51182294:    	mov	w2, #0x4065             // =16485
6c51182298:    	movk	w2, #0x1, lsl #16
6c5118229c:    	adr	x3, 0x6c51181f8c <trace+0x18c>
6c511822a0:    	adrp	x16, 0x6c97724000 <trace+0x465a2000>
6c511822a4:    	add	x16, x16, #0x228
6c511822a8:    	blr	x16
6c511822ac:    	mov	x28, x0
6c511822b0:    	dmb	ishld
6c511822b4:    	b	0x6c51181f8c <trace+0x18c>
6c511822b8:    	mov	w1, w8
6c511822bc:    	mov	x2, x21
6c511822c0:    	mov	x0, x19
6c511822c4:    	mov	w3, #0x4065             // =16485
6c511822c8:    	movk	w3, #0x1, lsl #16
6c511822cc:    	adr	x4, 0x6c51181fbc <trace+0x1bc>
6c511822d0:    	adrp	x16, 0x6c97724000 <trace+0x465a2000>
6c511822d4:    	add	x16, x16, #0xecc
6c511822d8:    	blr	x16
6c511822dc:    	dmb	ishld
6c511822e0:    	b	0x6c51181fbc <trace+0x1bc>
6c511822e4:    	mov	w1, w8
6c511822e8:    	mov	x2, x22
6c511822ec:    	mov	x0, x19
6c511822f0:    	mov	w3, #0x4065             // =16485
6c511822f4:    	movk	w3, #0x1, lsl #16
6c511822f8:    	adr	x4, 0x6c51181fe8 <trace+0x1e8>
6c511822fc:    	adrp	x16, 0x6c97724000 <trace+0x465a2000>
6c51182300:    	add	x16, x16, #0xecc
6c51182304:    	blr	x16
6c51182308:    	dmb	ishld
6c5118230c:    	b	0x6c51181fe8 <trace+0x1e8>
6c51182310:    	mov	w1, w22
6c51182314:    	mov	x2, x23
6c51182318:    	mov	x0, x19
6c5118231c:    	mov	w3, #0x4065             // =16485
6c51182320:    	movk	w3, #0x1, lsl #16
6c51182324:    	adr	x4, 0x6c51182010 <trace+0x210>
6c51182328:    	adrp	x16, 0x6c97724000 <trace+0x465a2000>
6c5118232c:    	add	x16, x16, #0xecc
6c51182330:    	blr	x16
6c51182334:    	dmb	ishld
6c51182338:    	b	0x6c51182010 <trace+0x210>
6c5118233c:    	mov	w1, w22
6c51182340:    	mov	x2, x24
6c51182344:    	mov	x0, x19
6c51182348:    	mov	w3, #0x4065             // =16485
6c5118234c:    	movk	w3, #0x1, lsl #16
6c51182350:    	adr	x4, 0x6c51182038 <trace+0x238>
6c51182354:    	adrp	x16, 0x6c97724000 <trace+0x465a2000>
6c51182358:    	add	x16, x16, #0xecc
6c5118235c:    	blr	x16
6c51182360:    	dmb	ishld
6c51182364:    	b	0x6c51182038 <trace+0x238>
6c51182368:    	mov	w1, w22
6c5118236c:    	mov	x2, x25
6c51182370:    	mov	x0, x19
6c51182374:    	mov	w3, #0x4065             // =16485
6c51182378:    	movk	w3, #0x1, lsl #16
6c5118237c:    	adr	x4, 0x6c51182060 <trace+0x260>
6c51182380:    	adrp	x16, 0x6c97724000 <trace+0x465a2000>
6c51182384:    	add	x16, x16, #0xecc
6c51182388:    	blr	x16
6c5118238c:    	dmb	ishld
6c51182390:    	b	0x6c51182060 <trace+0x260>
6c51182394:    	mov	w1, w22
6c51182398:    	mov	x2, x26
6c5118239c:    	mov	x0, x19
6c511823a0:    	mov	w3, #0x4065             // =16485
6c511823a4:    	movk	w3, #0x1, lsl #16
6c511823a8:    	adr	x4, 0x6c51182088 <trace+0x288>
6c511823ac:    	adrp	x16, 0x6c97724000 <trace+0x465a2000>
6c511823b0:    	add	x16, x16, #0xecc
6c511823b4:    	blr	x16
6c511823b8:    	dmb	ishld
6c511823bc:    	b	0x6c51182088 <trace+0x288>
6c511823c0:    	mov	w1, w22
6c511823c4:    	mov	x2, x27
6c511823c8:    	mov	x0, x19
6c511823cc:    	mov	w3, #0x4065             // =16485
6c511823d0:    	movk	w3, #0x1, lsl #16
6c511823d4:    	adr	x4, 0x6c511820b0 <trace+0x2b0>
6c511823d8:    	adrp	x16, 0x6c97724000 <trace+0x465a2000>
6c511823dc:    	add	x16, x16, #0xecc
6c511823e0:    	blr	x16
6c511823e4:    	dmb	ishld
6c511823e8:    	b	0x6c511820b0 <trace+0x2b0>
6c511823ec:    	mov	w1, w22
6c511823f0:    	mov	x2, x28
6c511823f4:    	mov	x0, x19
6c511823f8:    	mov	w3, #0x4065             // =16485
6c511823fc:    	movk	w3, #0x1, lsl #16
6c51182400:    	adr	x4, 0x6c511820d8 <trace+0x2d8>
6c51182404:    	adrp	x16, 0x6c97724000 <trace+0x465a2000>
6c51182408:    	add	x16, x16, #0xecc
6c5118240c:    	blr	x16
6c51182410:    	dmb	ishld
6c51182414:    	b	0x6c511820d8 <trace+0x2d8>