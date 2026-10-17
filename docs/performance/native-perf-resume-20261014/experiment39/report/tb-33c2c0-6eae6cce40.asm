
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-33c2c0-6eae6cce40.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006eae6cce40 <trace>:
6eae6cce40:    	ldur	w20, [x19, #-0x10]  // guest 0x33c2c0, sampled 0
6eae6cce44:    	tbnz	w20, #0x1f, 0x6eae6cd190 <trace+0x350>  // guest 0x33c2c0, sampled 0
6eae6cce48:    	sturb	wzr, [x19, #-0xc]  // guest 0x33c2c0, sampled 0
6eae6cce4c:    	str	wzr, [x19, #0x188]  // guest 0x33c2c8, sampled 0
6eae6cce50:    	str	xzr, [x19, #0x190]  // guest 0x33c2c8, sampled 0
6eae6cce54:    	ldr	w20, [x19, #0x18]  // guest 0x33c2c8, sampled 0
6eae6cce58:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2c8, sampled 1
6eae6cce5c:    	and	x16, x16, x20, lsr #7  // guest 0x33c2c8, sampled 0
6eae6cce60:    	add	x17, x17, x16  // guest 0x33c2c8, sampled 0
6eae6cce64:    	ldp	x16, x17, [x17]  // guest 0x33c2c8, sampled 0
6eae6cce68:    	and	w30, w20, #0xfffff007  // guest 0x33c2c8, sampled 1
6eae6cce6c:    	cmp	w16, w30  // guest 0x33c2c8, sampled 0
6eae6cce70:    	b.ne	0x6eae6cd198 <trace+0x358>  // guest 0x33c2c8, sampled 0
6eae6cce74:    	add	x30, x17, w20, uxtw  // guest 0x33c2c8, sampled 0
6eae6cce78:    	ldapr	x21, [x30]  // guest 0x33c2c8, sampled 1
6eae6cce7c:    	str	x21, [x19, #0x4f0]  // guest 0x33c2c8, sampled 1
6eae6cce80:    	str	x21, [x19, #0x1a0]  // guest 0x33c2c8, sampled 0
6eae6cce84:    	add	w22, w20, #0x8  // guest 0x33c2cb, sampled 0
6eae6cce88:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2cb, sampled 0
6eae6cce8c:    	and	x16, x16, x22, lsr #7  // guest 0x33c2cb, sampled 0
6eae6cce90:    	add	x17, x17, x16  // guest 0x33c2cb, sampled 0
6eae6cce94:    	ldp	x16, x17, [x17]  // guest 0x33c2cb, sampled 0
6eae6cce98:    	and	w30, w22, #0xfffff007  // guest 0x33c2cb, sampled 0
6eae6cce9c:    	cmp	w16, w30  // guest 0x33c2cb, sampled 0
6eae6ccea0:    	b.ne	0x6eae6cd1c4 <trace+0x384>  // guest 0x33c2cb, sampled 0
6eae6ccea4:    	add	x30, x17, w22, uxtw  // guest 0x33c2cb, sampled 0
6eae6ccea8:    	ldapr	x22, [x30]  // guest 0x33c2cb, sampled 0
6eae6cceac:    	str	x22, [x19, #0x4f0]  // guest 0x33c2cb, sampled 1
6eae6cceb0:    	str	x22, [x19, #0x1b0]  // guest 0x33c2cb, sampled 0
6eae6cceb4:    	add	w23, w20, #0x10  // guest 0x33c2cf, sampled 0
6eae6cceb8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2cf, sampled 0
6eae6ccebc:    	and	x16, x16, x23, lsr #7  // guest 0x33c2cf, sampled 0
6eae6ccec0:    	add	x17, x17, x16  // guest 0x33c2cf, sampled 0
6eae6ccec4:    	ldp	x16, x17, [x17]  // guest 0x33c2cf, sampled 0
6eae6ccec8:    	and	w30, w23, #0xfffff007  // guest 0x33c2cf, sampled 0
6eae6ccecc:    	cmp	w16, w30  // guest 0x33c2cf, sampled 0
6eae6cced0:    	b.ne	0x6eae6cd1f0 <trace+0x3b0>  // guest 0x33c2cf, sampled 0
6eae6cced4:    	add	x30, x17, w23, uxtw  // guest 0x33c2cf, sampled 0
6eae6cced8:    	ldapr	x23, [x30]  // guest 0x33c2cf, sampled 0
6eae6ccedc:    	str	x23, [x19, #0x4f0]  // guest 0x33c2cf, sampled 1
6eae6ccee0:    	str	x23, [x19, #0x1c0]  // guest 0x33c2cf, sampled 0
6eae6ccee4:    	add	w24, w20, #0x18  // guest 0x33c2d3, sampled 0
6eae6ccee8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2d3, sampled 0
6eae6cceec:    	and	x16, x16, x24, lsr #7  // guest 0x33c2d3, sampled 0
6eae6ccef0:    	add	x17, x17, x16  // guest 0x33c2d3, sampled 0
6eae6ccef4:    	ldp	x16, x17, [x17]  // guest 0x33c2d3, sampled 0
6eae6ccef8:    	and	w30, w24, #0xfffff007  // guest 0x33c2d3, sampled 0
6eae6ccefc:    	cmp	w16, w30  // guest 0x33c2d3, sampled 0
6eae6ccf00:    	b.ne	0x6eae6cd21c <trace+0x3dc>  // guest 0x33c2d3, sampled 0
6eae6ccf04:    	add	x30, x17, w24, uxtw  // guest 0x33c2d3, sampled 0
6eae6ccf08:    	ldapr	x24, [x30]  // guest 0x33c2d3, sampled 0
6eae6ccf0c:    	str	x24, [x19, #0x4f0]  // guest 0x33c2d3, sampled 1
6eae6ccf10:    	str	x24, [x19, #0x1d0]  // guest 0x33c2d3, sampled 0
6eae6ccf14:    	add	w25, w20, #0x20  // guest 0x33c2d7, sampled 0
6eae6ccf18:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2d7, sampled 0
6eae6ccf1c:    	and	x16, x16, x25, lsr #7  // guest 0x33c2d7, sampled 0
6eae6ccf20:    	add	x17, x17, x16  // guest 0x33c2d7, sampled 0
6eae6ccf24:    	ldp	x16, x17, [x17]  // guest 0x33c2d7, sampled 0
6eae6ccf28:    	and	w30, w25, #0xfffff007  // guest 0x33c2d7, sampled 0
6eae6ccf2c:    	cmp	w16, w30  // guest 0x33c2d7, sampled 0
6eae6ccf30:    	b.ne	0x6eae6cd248 <trace+0x408>  // guest 0x33c2d7, sampled 0
6eae6ccf34:    	add	x30, x17, w25, uxtw  // guest 0x33c2d7, sampled 0
6eae6ccf38:    	ldapr	x25, [x30]  // guest 0x33c2d7, sampled 0
6eae6ccf3c:    	str	x25, [x19, #0x4f0]  // guest 0x33c2d7, sampled 0
6eae6ccf40:    	str	x25, [x19, #0x1e0]  // guest 0x33c2d7, sampled 0
6eae6ccf44:    	add	w26, w20, #0x28  // guest 0x33c2db, sampled 0
6eae6ccf48:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2db, sampled 0
6eae6ccf4c:    	and	x16, x16, x26, lsr #7  // guest 0x33c2db, sampled 0
6eae6ccf50:    	add	x17, x17, x16  // guest 0x33c2db, sampled 0
6eae6ccf54:    	ldp	x16, x17, [x17]  // guest 0x33c2db, sampled 0
6eae6ccf58:    	and	w30, w26, #0xfffff007  // guest 0x33c2db, sampled 1
6eae6ccf5c:    	cmp	w16, w30  // guest 0x33c2db, sampled 0
6eae6ccf60:    	b.ne	0x6eae6cd274 <trace+0x434>  // guest 0x33c2db, sampled 0
6eae6ccf64:    	add	x30, x17, w26, uxtw  // guest 0x33c2db, sampled 0
6eae6ccf68:    	ldapr	x26, [x30]  // guest 0x33c2db, sampled 0
6eae6ccf6c:    	str	x26, [x19, #0x4f0]  // guest 0x33c2db, sampled 0
6eae6ccf70:    	str	x26, [x19, #0x1f0]  // guest 0x33c2db, sampled 0
6eae6ccf74:    	add	w27, w20, #0x30  // guest 0x33c2df, sampled 0
6eae6ccf78:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2df, sampled 0
6eae6ccf7c:    	and	x16, x16, x27, lsr #7  // guest 0x33c2df, sampled 0
6eae6ccf80:    	add	x17, x17, x16  // guest 0x33c2df, sampled 1
6eae6ccf84:    	ldp	x16, x17, [x17]  // guest 0x33c2df, sampled 0
6eae6ccf88:    	and	w30, w27, #0xfffff007  // guest 0x33c2df, sampled 0
6eae6ccf8c:    	cmp	w16, w30  // guest 0x33c2df, sampled 0
6eae6ccf90:    	b.ne	0x6eae6cd2a0 <trace+0x460>  // guest 0x33c2df, sampled 0
6eae6ccf94:    	add	x30, x17, w27, uxtw  // guest 0x33c2df, sampled 0
6eae6ccf98:    	ldapr	x27, [x30]  // guest 0x33c2df, sampled 0
6eae6ccf9c:    	str	x27, [x19, #0x4f0]  // guest 0x33c2df, sampled 0
6eae6ccfa0:    	str	x27, [x19, #0x200]  // guest 0x33c2df, sampled 0
6eae6ccfa4:    	add	w28, w20, #0x38  // guest 0x33c2e3, sampled 0
6eae6ccfa8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2e3, sampled 0
6eae6ccfac:    	and	x16, x16, x28, lsr #7  // guest 0x33c2e3, sampled 0
6eae6ccfb0:    	add	x17, x17, x16  // guest 0x33c2e3, sampled 0
6eae6ccfb4:    	ldp	x16, x17, [x17]  // guest 0x33c2e3, sampled 0
6eae6ccfb8:    	and	w30, w28, #0xfffff007  // guest 0x33c2e3, sampled 0
6eae6ccfbc:    	cmp	w16, w30  // guest 0x33c2e3, sampled 0
6eae6ccfc0:    	b.ne	0x6eae6cd2cc <trace+0x48c>  // guest 0x33c2e3, sampled 0
6eae6ccfc4:    	add	x30, x17, w28, uxtw  // guest 0x33c2e3, sampled 0
6eae6ccfc8:    	ldapr	x28, [x30]  // guest 0x33c2e3, sampled 0
6eae6ccfcc:    	str	x28, [x19, #0x4f0]  // guest 0x33c2e3, sampled 0
6eae6ccfd0:    	str	x28, [x19, #0x210]  // guest 0x33c2e3, sampled 0
6eae6ccfd4:    	ldr	w8, [x19, #0x1c]  // guest 0x33c2e9, sampled 0
6eae6ccfd8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2e9, sampled 0
6eae6ccfdc:    	and	x16, x16, x8, lsr #7  // guest 0x33c2e9, sampled 0
6eae6ccfe0:    	add	x17, x17, x16  // guest 0x33c2e9, sampled 0
6eae6ccfe4:    	ldp	x17, x16, [x17, #0x8]  // guest 0x33c2e9, sampled 0
6eae6ccfe8:    	and	w30, w8, #0xfffff007  // guest 0x33c2e9, sampled 1
6eae6ccfec:    	cmp	w16, w30  // guest 0x33c2e9, sampled 0
6eae6ccff0:    	b.ne	0x6eae6cd2f8 <trace+0x4b8>  // guest 0x33c2e9, sampled 0
6eae6ccff4:    	add	x30, x17, w8, uxtw  // guest 0x33c2e9, sampled 0
6eae6ccff8:    	stlr	x21, [x30]  // guest 0x33c2e9, sampled 0
6eae6ccffc:    	ldr	w21, [x19, #0x1c]  // guest 0x33c2ec, sampled 1
6eae6cd000:    	add	w8, w21, #0x8  // guest 0x33c2ec, sampled 0
6eae6cd004:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2ec, sampled 0
6eae6cd008:    	and	x16, x16, x8, lsr #7  // guest 0x33c2ec, sampled 0
6eae6cd00c:    	add	x17, x17, x16  // guest 0x33c2ec, sampled 0
6eae6cd010:    	ldp	x17, x16, [x17, #0x8]  // guest 0x33c2ec, sampled 0
6eae6cd014:    	and	w30, w8, #0xfffff007  // guest 0x33c2ec, sampled 0
6eae6cd018:    	cmp	w16, w30  // guest 0x33c2ec, sampled 0
6eae6cd01c:    	b.ne	0x6eae6cd324 <trace+0x4e4>  // guest 0x33c2ec, sampled 0
6eae6cd020:    	add	x30, x17, w8, uxtw  // guest 0x33c2ec, sampled 0
6eae6cd024:    	stlr	x22, [x30]  // guest 0x33c2ec, sampled 0
6eae6cd028:    	add	w22, w21, #0x10  // guest 0x33c2f0, sampled 0
6eae6cd02c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2f0, sampled 0
6eae6cd030:    	and	x16, x16, x22, lsr #7  // guest 0x33c2f0, sampled 0
6eae6cd034:    	add	x17, x17, x16  // guest 0x33c2f0, sampled 0
6eae6cd038:    	ldp	x17, x16, [x17, #0x8]  // guest 0x33c2f0, sampled 0
6eae6cd03c:    	and	w30, w22, #0xfffff007  // guest 0x33c2f0, sampled 0
6eae6cd040:    	cmp	w16, w30  // guest 0x33c2f0, sampled 0
6eae6cd044:    	b.ne	0x6eae6cd350 <trace+0x510>  // guest 0x33c2f0, sampled 0
6eae6cd048:    	add	x30, x17, w22, uxtw  // guest 0x33c2f0, sampled 0
6eae6cd04c:    	stlr	x23, [x30]  // guest 0x33c2f0, sampled 0
6eae6cd050:    	add	w22, w21, #0x18  // guest 0x33c2f4, sampled 1
6eae6cd054:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2f4, sampled 0
6eae6cd058:    	and	x16, x16, x22, lsr #7  // guest 0x33c2f4, sampled 0
6eae6cd05c:    	add	x17, x17, x16  // guest 0x33c2f4, sampled 0
6eae6cd060:    	ldp	x17, x16, [x17, #0x8]  // guest 0x33c2f4, sampled 0
6eae6cd064:    	and	w30, w22, #0xfffff007  // guest 0x33c2f4, sampled 0
6eae6cd068:    	cmp	w16, w30  // guest 0x33c2f4, sampled 0
6eae6cd06c:    	b.ne	0x6eae6cd37c <trace+0x53c>  // guest 0x33c2f4, sampled 0
6eae6cd070:    	add	x30, x17, w22, uxtw  // guest 0x33c2f4, sampled 0
6eae6cd074:    	stlr	x24, [x30]  // guest 0x33c2f4, sampled 0
6eae6cd078:    	add	w22, w21, #0x20  // guest 0x33c2f8, sampled 1
6eae6cd07c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2f8, sampled 0
6eae6cd080:    	and	x16, x16, x22, lsr #7  // guest 0x33c2f8, sampled 0
6eae6cd084:    	add	x17, x17, x16  // guest 0x33c2f8, sampled 0
6eae6cd088:    	ldp	x17, x16, [x17, #0x8]  // guest 0x33c2f8, sampled 0
6eae6cd08c:    	and	w30, w22, #0xfffff007  // guest 0x33c2f8, sampled 0
6eae6cd090:    	cmp	w16, w30  // guest 0x33c2f8, sampled 0
6eae6cd094:    	b.ne	0x6eae6cd3a8 <trace+0x568>  // guest 0x33c2f8, sampled 0
6eae6cd098:    	add	x30, x17, w22, uxtw  // guest 0x33c2f8, sampled 1
6eae6cd09c:    	stlr	x25, [x30]  // guest 0x33c2f8, sampled 0
6eae6cd0a0:    	add	w22, w21, #0x28  // guest 0x33c2fc, sampled 0
6eae6cd0a4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c2fc, sampled 0
6eae6cd0a8:    	and	x16, x16, x22, lsr #7  // guest 0x33c2fc, sampled 0
6eae6cd0ac:    	add	x17, x17, x16  // guest 0x33c2fc, sampled 0
6eae6cd0b0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x33c2fc, sampled 0
6eae6cd0b4:    	and	w30, w22, #0xfffff007  // guest 0x33c2fc, sampled 1
6eae6cd0b8:    	cmp	w16, w30  // guest 0x33c2fc, sampled 0
6eae6cd0bc:    	b.ne	0x6eae6cd3d4 <trace+0x594>  // guest 0x33c2fc, sampled 0
6eae6cd0c0:    	add	x30, x17, w22, uxtw  // guest 0x33c2fc, sampled 0
6eae6cd0c4:    	stlr	x26, [x30]  // guest 0x33c2fc, sampled 0
6eae6cd0c8:    	add	w22, w21, #0x30  // guest 0x33c300, sampled 0
6eae6cd0cc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c300, sampled 0
6eae6cd0d0:    	and	x16, x16, x22, lsr #7  // guest 0x33c300, sampled 0
6eae6cd0d4:    	add	x17, x17, x16  // guest 0x33c300, sampled 0
6eae6cd0d8:    	ldp	x17, x16, [x17, #0x8]  // guest 0x33c300, sampled 0
6eae6cd0dc:    	and	w30, w22, #0xfffff007  // guest 0x33c300, sampled 2
6eae6cd0e0:    	cmp	w16, w30  // guest 0x33c300, sampled 0
6eae6cd0e4:    	b.ne	0x6eae6cd400 <trace+0x5c0>  // guest 0x33c300, sampled 0
6eae6cd0e8:    	add	x30, x17, w22, uxtw  // guest 0x33c300, sampled 1
6eae6cd0ec:    	stlr	x27, [x30]  // guest 0x33c300, sampled 0
6eae6cd0f0:    	add	w22, w21, #0x38  // guest 0x33c304, sampled 0
6eae6cd0f4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x33c304, sampled 0
6eae6cd0f8:    	and	x16, x16, x22, lsr #7  // guest 0x33c304, sampled 0
6eae6cd0fc:    	add	x17, x17, x16  // guest 0x33c304, sampled 0
6eae6cd100:    	ldp	x17, x16, [x17, #0x8]  // guest 0x33c304, sampled 0
6eae6cd104:    	and	w30, w22, #0xfffff007  // guest 0x33c304, sampled 0
6eae6cd108:    	cmp	w16, w30  // guest 0x33c304, sampled 0
6eae6cd10c:    	b.ne	0x6eae6cd42c <trace+0x5ec>  // guest 0x33c304, sampled 0
6eae6cd110:    	add	x30, x17, w22, uxtw  // guest 0x33c304, sampled 0
6eae6cd114:    	stlr	x28, [x30]  // guest 0x33c304, sampled 0
6eae6cd118:    	add	w20, w20, #0x40  // guest 0x33c308, sampled 0
6eae6cd11c:    	str	w20, [x19, #0x18]  // guest 0x33c308, sampled 0
6eae6cd120:    	add	w20, w21, #0x40  // guest 0x33c30b, sampled 0
6eae6cd124:    	str	w20, [x19, #0x1c]  // guest 0x33c30b, sampled 0
6eae6cd128:    	ldr	w21, [x19, #0x4]  // guest 0x33c30e, sampled 0
6eae6cd12c:    	sub	w21, w21, #0x1  // guest 0x33c30e, sampled 0
6eae6cd130:    	cmp	w20, #0x40  // guest 0x33c30e, sampled 0
6eae6cd134:    	cset	w20, lo  // guest 0x33c30e, sampled 0
6eae6cd138:    	str	w21, [x19, #0x4]  // guest 0x33c30e, sampled 0
6eae6cd13c:    	str	w21, [x19, #0x28]  // guest 0x33c30e, sampled 0
6eae6cd140:    	str	w20, [x19, #0x2c]  // guest 0x33c30e, sampled 0
6eae6cd144:    	mov	w20, #0x1               // =1  // guest 0x33c30e, sampled 0
6eae6cd148:    	sturb	w20, [x19, #-0xc]  // guest 0x33c30e, sampled 0
6eae6cd14c:    	mov	w20, #0x22              // =34  // guest 0x33c30f, sampled 0
6eae6cd150:    	str	w20, [x19, #0x34]  // guest 0x33c30f, sampled 0
6eae6cd154:    	cbnz	w21, 0x6eae6cd174 <trace+0x334>  // guest 0x33c30f, sampled 0
6eae6cd158:    	b	0x6eae6cd158 <trace+0x318>  // guest 0x33c30f, sampled 0
6eae6cd15c:    	br	x16  // guest 0x33c30f, sampled 0
6eae6cd160:    	mov	w20, #0xc311            // =49937  // guest 0x33c30f, sampled 0
6eae6cd164:    	movk	w20, #0x33, lsl #16  // guest 0x33c30f, sampled 0
6eae6cd168:    	str	w20, [x19, #0x20]  // guest 0x33c30f, sampled 0
6eae6cd16c:    	adr	x0, 0x6eae6ccd81 <trace+0xffffffffffffff41>  // guest 0x33c30f, sampled 0
6eae6cd170:    	b	0x6ea842202c <trace+0xfffffffff9d551ec>  // guest 0x33c30f, sampled 0
6eae6cd174:    	b	0x6eae6cd174 <trace+0x334>  // guest 0x33c30f, sampled 0
6eae6cd178:    	br	x16  // guest 0x33c30f, sampled 0
6eae6cd17c:    	mov	w20, #0xc2c0            // =49856  // guest 0x33c30f, sampled 0
6eae6cd180:    	movk	w20, #0x33, lsl #16  // guest 0x33c30f, sampled 0
6eae6cd184:    	str	w20, [x19, #0x20]  // guest 0x33c30f, sampled 0
6eae6cd188:    	adr	x0, 0x6eae6ccd80 <trace+0xffffffffffffff40>  // guest 0x33c30f, sampled 0
6eae6cd18c:    	b	0x6ea842202c <trace+0xfffffffff9d551ec>  // guest 0x33c30f, sampled 0
6eae6cd190:    	adr	x0, 0x6eae6ccd83 <trace+0xffffffffffffff43>  // guest 0x33c30f, sampled 0
6eae6cd194:    	b	0x6ea842202c <trace+0xfffffffff9d551ec>  // guest 0x33c30f, sampled 0
6eae6cd198:    	mov	w1, w20
6eae6cd19c:    	mov	x0, x19
6eae6cd1a0:    	mov	w2, #0x4065             // =16485
6eae6cd1a4:    	movk	w2, #0x1, lsl #16
6eae6cd1a8:    	adr	x3, 0x6eae6cce7c <trace+0x3c>
6eae6cd1ac:    	adrp	x16, 0x6efc87d000 <trace+0x4e1b0000>
6eae6cd1b0:    	add	x16, x16, #0x2f8
6eae6cd1b4:    	blr	x16
6eae6cd1b8:    	mov	x21, x0
6eae6cd1bc:    	dmb	ishld
6eae6cd1c0:    	b	0x6eae6cce7c <trace+0x3c>
6eae6cd1c4:    	mov	w1, w22
6eae6cd1c8:    	mov	x0, x19
6eae6cd1cc:    	mov	w2, #0x4065             // =16485
6eae6cd1d0:    	movk	w2, #0x1, lsl #16
6eae6cd1d4:    	adr	x3, 0x6eae6cceac <trace+0x6c>
6eae6cd1d8:    	adrp	x16, 0x6efc87d000 <trace+0x4e1b0000>
6eae6cd1dc:    	add	x16, x16, #0x2f8
6eae6cd1e0:    	blr	x16
6eae6cd1e4:    	mov	x22, x0
6eae6cd1e8:    	dmb	ishld
6eae6cd1ec:    	b	0x6eae6cceac <trace+0x6c>
6eae6cd1f0:    	mov	w1, w23
6eae6cd1f4:    	mov	x0, x19
6eae6cd1f8:    	mov	w2, #0x4065             // =16485
6eae6cd1fc:    	movk	w2, #0x1, lsl #16
6eae6cd200:    	adr	x3, 0x6eae6ccedc <trace+0x9c>
6eae6cd204:    	adrp	x16, 0x6efc87d000 <trace+0x4e1b0000>
6eae6cd208:    	add	x16, x16, #0x2f8
6eae6cd20c:    	blr	x16
6eae6cd210:    	mov	x23, x0
6eae6cd214:    	dmb	ishld
6eae6cd218:    	b	0x6eae6ccedc <trace+0x9c>
6eae6cd21c:    	mov	w1, w24
6eae6cd220:    	mov	x0, x19
6eae6cd224:    	mov	w2, #0x4065             // =16485
6eae6cd228:    	movk	w2, #0x1, lsl #16
6eae6cd22c:    	adr	x3, 0x6eae6ccf0c <trace+0xcc>
6eae6cd230:    	adrp	x16, 0x6efc87d000 <trace+0x4e1b0000>
6eae6cd234:    	add	x16, x16, #0x2f8
6eae6cd238:    	blr	x16
6eae6cd23c:    	mov	x24, x0
6eae6cd240:    	dmb	ishld
6eae6cd244:    	b	0x6eae6ccf0c <trace+0xcc>
6eae6cd248:    	mov	w1, w25
6eae6cd24c:    	mov	x0, x19
6eae6cd250:    	mov	w2, #0x4065             // =16485
6eae6cd254:    	movk	w2, #0x1, lsl #16
6eae6cd258:    	adr	x3, 0x6eae6ccf3c <trace+0xfc>
6eae6cd25c:    	adrp	x16, 0x6efc87d000 <trace+0x4e1b0000>
6eae6cd260:    	add	x16, x16, #0x2f8
6eae6cd264:    	blr	x16
6eae6cd268:    	mov	x25, x0
6eae6cd26c:    	dmb	ishld
6eae6cd270:    	b	0x6eae6ccf3c <trace+0xfc>
6eae6cd274:    	mov	w1, w26
6eae6cd278:    	mov	x0, x19
6eae6cd27c:    	mov	w2, #0x4065             // =16485
6eae6cd280:    	movk	w2, #0x1, lsl #16
6eae6cd284:    	adr	x3, 0x6eae6ccf6c <trace+0x12c>
6eae6cd288:    	adrp	x16, 0x6efc87d000 <trace+0x4e1b0000>
6eae6cd28c:    	add	x16, x16, #0x2f8
6eae6cd290:    	blr	x16
6eae6cd294:    	mov	x26, x0
6eae6cd298:    	dmb	ishld
6eae6cd29c:    	b	0x6eae6ccf6c <trace+0x12c>
6eae6cd2a0:    	mov	w1, w27
6eae6cd2a4:    	mov	x0, x19
6eae6cd2a8:    	mov	w2, #0x4065             // =16485
6eae6cd2ac:    	movk	w2, #0x1, lsl #16
6eae6cd2b0:    	adr	x3, 0x6eae6ccf9c <trace+0x15c>
6eae6cd2b4:    	adrp	x16, 0x6efc87d000 <trace+0x4e1b0000>
6eae6cd2b8:    	add	x16, x16, #0x2f8
6eae6cd2bc:    	blr	x16
6eae6cd2c0:    	mov	x27, x0
6eae6cd2c4:    	dmb	ishld
6eae6cd2c8:    	b	0x6eae6ccf9c <trace+0x15c>
6eae6cd2cc:    	mov	w1, w28
6eae6cd2d0:    	mov	x0, x19
6eae6cd2d4:    	mov	w2, #0x4065             // =16485
6eae6cd2d8:    	movk	w2, #0x1, lsl #16
6eae6cd2dc:    	adr	x3, 0x6eae6ccfcc <trace+0x18c>
6eae6cd2e0:    	adrp	x16, 0x6efc87d000 <trace+0x4e1b0000>
6eae6cd2e4:    	add	x16, x16, #0x2f8
6eae6cd2e8:    	blr	x16
6eae6cd2ec:    	mov	x28, x0
6eae6cd2f0:    	dmb	ishld
6eae6cd2f4:    	b	0x6eae6ccfcc <trace+0x18c>
6eae6cd2f8:    	mov	w1, w8
6eae6cd2fc:    	mov	x2, x21
6eae6cd300:    	mov	x0, x19
6eae6cd304:    	mov	w3, #0x4065             // =16485
6eae6cd308:    	movk	w3, #0x1, lsl #16
6eae6cd30c:    	adr	x4, 0x6eae6ccffc <trace+0x1bc>
6eae6cd310:    	adrp	x16, 0x6efc87d000 <trace+0x4e1b0000>
6eae6cd314:    	add	x16, x16, #0xf9c
6eae6cd318:    	blr	x16
6eae6cd31c:    	dmb	ishld
6eae6cd320:    	b	0x6eae6ccffc <trace+0x1bc>
6eae6cd324:    	mov	w1, w8
6eae6cd328:    	mov	x2, x22
6eae6cd32c:    	mov	x0, x19
6eae6cd330:    	mov	w3, #0x4065             // =16485
6eae6cd334:    	movk	w3, #0x1, lsl #16
6eae6cd338:    	adr	x4, 0x6eae6cd028 <trace+0x1e8>
6eae6cd33c:    	adrp	x16, 0x6efc87d000 <trace+0x4e1b0000>
6eae6cd340:    	add	x16, x16, #0xf9c
6eae6cd344:    	blr	x16
6eae6cd348:    	dmb	ishld
6eae6cd34c:    	b	0x6eae6cd028 <trace+0x1e8>
6eae6cd350:    	mov	w1, w22
6eae6cd354:    	mov	x2, x23
6eae6cd358:    	mov	x0, x19
6eae6cd35c:    	mov	w3, #0x4065             // =16485
6eae6cd360:    	movk	w3, #0x1, lsl #16
6eae6cd364:    	adr	x4, 0x6eae6cd050 <trace+0x210>
6eae6cd368:    	adrp	x16, 0x6efc87d000 <trace+0x4e1b0000>
6eae6cd36c:    	add	x16, x16, #0xf9c
6eae6cd370:    	blr	x16
6eae6cd374:    	dmb	ishld
6eae6cd378:    	b	0x6eae6cd050 <trace+0x210>
6eae6cd37c:    	mov	w1, w22
6eae6cd380:    	mov	x2, x24
6eae6cd384:    	mov	x0, x19
6eae6cd388:    	mov	w3, #0x4065             // =16485
6eae6cd38c:    	movk	w3, #0x1, lsl #16
6eae6cd390:    	adr	x4, 0x6eae6cd078 <trace+0x238>
6eae6cd394:    	adrp	x16, 0x6efc87d000 <trace+0x4e1b0000>
6eae6cd398:    	add	x16, x16, #0xf9c
6eae6cd39c:    	blr	x16
6eae6cd3a0:    	dmb	ishld
6eae6cd3a4:    	b	0x6eae6cd078 <trace+0x238>
6eae6cd3a8:    	mov	w1, w22
6eae6cd3ac:    	mov	x2, x25
6eae6cd3b0:    	mov	x0, x19
6eae6cd3b4:    	mov	w3, #0x4065             // =16485
6eae6cd3b8:    	movk	w3, #0x1, lsl #16
6eae6cd3bc:    	adr	x4, 0x6eae6cd0a0 <trace+0x260>
6eae6cd3c0:    	adrp	x16, 0x6efc87d000 <trace+0x4e1b0000>
6eae6cd3c4:    	add	x16, x16, #0xf9c
6eae6cd3c8:    	blr	x16
6eae6cd3cc:    	dmb	ishld
6eae6cd3d0:    	b	0x6eae6cd0a0 <trace+0x260>
6eae6cd3d4:    	mov	w1, w22
6eae6cd3d8:    	mov	x2, x26
6eae6cd3dc:    	mov	x0, x19
6eae6cd3e0:    	mov	w3, #0x4065             // =16485
6eae6cd3e4:    	movk	w3, #0x1, lsl #16
6eae6cd3e8:    	adr	x4, 0x6eae6cd0c8 <trace+0x288>
6eae6cd3ec:    	adrp	x16, 0x6efc87d000 <trace+0x4e1b0000>
6eae6cd3f0:    	add	x16, x16, #0xf9c
6eae6cd3f4:    	blr	x16
6eae6cd3f8:    	dmb	ishld
6eae6cd3fc:    	b	0x6eae6cd0c8 <trace+0x288>
6eae6cd400:    	mov	w1, w22
6eae6cd404:    	mov	x2, x27
6eae6cd408:    	mov	x0, x19
6eae6cd40c:    	mov	w3, #0x4065             // =16485
6eae6cd410:    	movk	w3, #0x1, lsl #16
6eae6cd414:    	adr	x4, 0x6eae6cd0f0 <trace+0x2b0>
6eae6cd418:    	adrp	x16, 0x6efc87d000 <trace+0x4e1b0000>
6eae6cd41c:    	add	x16, x16, #0xf9c
6eae6cd420:    	blr	x16
6eae6cd424:    	dmb	ishld
6eae6cd428:    	b	0x6eae6cd0f0 <trace+0x2b0>
6eae6cd42c:    	mov	w1, w22
6eae6cd430:    	mov	x2, x28
6eae6cd434:    	mov	x0, x19
6eae6cd438:    	mov	w3, #0x4065             // =16485
6eae6cd43c:    	movk	w3, #0x1, lsl #16
6eae6cd440:    	adr	x4, 0x6eae6cd118 <trace+0x2d8>
6eae6cd444:    	adrp	x16, 0x6efc87d000 <trace+0x4e1b0000>
6eae6cd448:    	add	x16, x16, #0xf9c
6eae6cd44c:    	blr	x16
6eae6cd450:    	dmb	ishld
6eae6cd454:    	b	0x6eae6cd118 <trace+0x2d8>