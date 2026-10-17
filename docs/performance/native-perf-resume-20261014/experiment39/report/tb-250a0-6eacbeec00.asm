
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-250a0-6eacbeec00.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006eacbeec00 <trace>:
6eacbeec00:    	ldur	w20, [x19, #-0x10]  // guest 0x250a0, sampled 2
6eacbeec04:    	tbnz	w20, #0x1f, 0x6eacbefdc8 <trace+0x11c8>  // guest 0x250a0, sampled 0
6eacbeec08:    	sturb	wzr, [x19, #-0xc]  // guest 0x250a0, sampled 0
6eacbeec0c:    	ldr	w20, [x19, #0x10]  // guest 0x250a0, sampled 0
6eacbeec10:    	sub	w20, w20, #0x4  // guest 0x250a0, sampled 0
6eacbeec14:    	mov	w21, w20  // guest 0x250a0, sampled 0
6eacbeec18:    	ldr	w22, [x19, #0x18]  // guest 0x250a0, sampled 0
6eacbeec1c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250a0, sampled 0
6eacbeec20:    	and	x16, x16, x21, lsr #7  // guest 0x250a0, sampled 0
6eacbeec24:    	add	x17, x17, x16  // guest 0x250a0, sampled 0
6eacbeec28:    	ldp	x17, x16, [x17, #0x8]  // guest 0x250a0, sampled 0
6eacbeec2c:    	and	w30, w21, #0xfffff003  // guest 0x250a0, sampled 0
6eacbeec30:    	cmp	w16, w30  // guest 0x250a0, sampled 0
6eacbeec34:    	b.ne	0x6eacbefdd0 <trace+0x11d0>  // guest 0x250a0, sampled 0
6eacbeec38:    	add	x30, x17, w21, uxtw  // guest 0x250a0, sampled 0
6eacbeec3c:    	stlr	w22, [x30]  // guest 0x250a0, sampled 0
6eacbeec40:    	str	w20, [x19, #0x10]  // guest 0x250a0, sampled 1
6eacbeec44:    	sub	w20, w20, #0x4  // guest 0x250a1, sampled 0
6eacbeec48:    	mov	w21, w20  // guest 0x250a1, sampled 0
6eacbeec4c:    	ldr	w22, [x19, #0x1c]  // guest 0x250a1, sampled 0
6eacbeec50:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250a1, sampled 0
6eacbeec54:    	and	x16, x16, x21, lsr #7  // guest 0x250a1, sampled 0
6eacbeec58:    	add	x17, x17, x16  // guest 0x250a1, sampled 0
6eacbeec5c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x250a1, sampled 0
6eacbeec60:    	and	w30, w21, #0xfffff003  // guest 0x250a1, sampled 1
6eacbeec64:    	cmp	w16, w30  // guest 0x250a1, sampled 0
6eacbeec68:    	b.ne	0x6eacbefdfc <trace+0x11fc>  // guest 0x250a1, sampled 0
6eacbeec6c:    	add	x30, x17, w21, uxtw  // guest 0x250a1, sampled 0
6eacbeec70:    	stlr	w22, [x30]  // guest 0x250a1, sampled 0
6eacbeec74:    	str	w20, [x19, #0x10]  // guest 0x250a1, sampled 0
6eacbeec78:    	add	w21, w20, #0x10  // guest 0x250a2, sampled 0
6eacbeec7c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250a2, sampled 0
6eacbeec80:    	and	x16, x16, x21, lsr #7  // guest 0x250a2, sampled 0
6eacbeec84:    	add	x17, x17, x16  // guest 0x250a2, sampled 0
6eacbeec88:    	ldp	x16, x17, [x17]  // guest 0x250a2, sampled 0
6eacbeec8c:    	and	w30, w21, #0xfffff003  // guest 0x250a2, sampled 0
6eacbeec90:    	cmp	w16, w30  // guest 0x250a2, sampled 0
6eacbeec94:    	b.ne	0x6eacbefe28 <trace+0x1228>  // guest 0x250a2, sampled 0
6eacbeec98:    	add	x30, x17, w21, uxtw  // guest 0x250a2, sampled 0
6eacbeec9c:    	ldapr	w21, [x30]  // guest 0x250a2, sampled 0
6eacbeeca0:    	str	w21, [x19, #0x18]  // guest 0x250a2, sampled 0
6eacbeeca4:    	add	w22, w20, #0xc  // guest 0x250a6, sampled 0
6eacbeeca8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250a6, sampled 0
6eacbeecac:    	and	x16, x16, x22, lsr #7  // guest 0x250a6, sampled 0
6eacbeecb0:    	add	x17, x17, x16  // guest 0x250a6, sampled 0
6eacbeecb4:    	ldp	x16, x17, [x17]  // guest 0x250a6, sampled 0
6eacbeecb8:    	and	w30, w22, #0xfffff003  // guest 0x250a6, sampled 0
6eacbeecbc:    	cmp	w16, w30  // guest 0x250a6, sampled 0
6eacbeecc0:    	b.ne	0x6eacbefe54 <trace+0x1254>  // guest 0x250a6, sampled 1
6eacbeecc4:    	add	x30, x17, w22, uxtw  // guest 0x250a6, sampled 0
6eacbeecc8:    	ldapr	w22, [x30]  // guest 0x250a6, sampled 0
6eacbeeccc:    	str	w22, [x19, #0x8]  // guest 0x250a6, sampled 1
6eacbeecd0:    	add	w20, w20, #0x14  // guest 0x250aa, sampled 0
6eacbeecd4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250aa, sampled 0
6eacbeecd8:    	and	x16, x16, x20, lsr #7  // guest 0x250aa, sampled 0
6eacbeecdc:    	add	x17, x17, x16  // guest 0x250aa, sampled 0
6eacbeece0:    	ldp	x16, x17, [x17]  // guest 0x250aa, sampled 0
6eacbeece4:    	and	w30, w20, #0xfffff003  // guest 0x250aa, sampled 0
6eacbeece8:    	cmp	w16, w30  // guest 0x250aa, sampled 0
6eacbeecec:    	b.ne	0x6eacbefe80 <trace+0x1280>  // guest 0x250aa, sampled 0
6eacbeecf0:    	add	x30, x17, w20, uxtw  // guest 0x250aa, sampled 0
6eacbeecf4:    	ldapr	w20, [x30]  // guest 0x250aa, sampled 0
6eacbeecf8:    	str	w20, [x19, #0x1c]  // guest 0x250aa, sampled 0
6eacbeecfc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250ae, sampled 0
6eacbeed00:    	and	x16, x16, x21, lsr #7  // guest 0x250ae, sampled 0
6eacbeed04:    	add	x17, x17, x16  // guest 0x250ae, sampled 0
6eacbeed08:    	ldp	x16, x17, [x17]  // guest 0x250ae, sampled 0
6eacbeed0c:    	and	w30, w21, #0xfffff003  // guest 0x250ae, sampled 0
6eacbeed10:    	cmp	w16, w30  // guest 0x250ae, sampled 0
6eacbeed14:    	b.ne	0x6eacbefeac <trace+0x12ac>  // guest 0x250ae, sampled 0
6eacbeed18:    	add	x30, x17, w21, uxtw  // guest 0x250ae, sampled 0
6eacbeed1c:    	ldapr	w2, [x30]  // guest 0x250ae, sampled 0
6eacbeed20:    	ldr	w20, [x19, #0x188]  // guest 0x250ae, sampled 0
6eacbeed24:    	add	w22, w20, #0x7  // guest 0x250ae, sampled 0
6eacbeed28:    	and	w22, w22, #0x7  // guest 0x250ae, sampled 0
6eacbeed2c:    	lsl	w22, w22, #4  // guest 0x250ae, sampled 0
6eacbeed30:    	add	w22, w22, #0x1a0  // guest 0x250ae, sampled 0
6eacbeed34:    	sxtw	x22, w22  // guest 0x250ae, sampled 0
6eacbeed38:    	add	x1, x22, x19  // guest 0x250ae, sampled 0
6eacbeed3c:    	mov	x0, x19  // guest 0x250ae, sampled 0
6eacbeed40:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcbc000>  // guest 0x250ae, sampled 0
6eacbeed44:    	add	x16, x16, #0x484  // guest 0x250ae, sampled 0
6eacbeed48:    	blr	x16  // guest 0x250ae, sampled 0
6eacbeed4c:    	sub	w20, w20, #0x1  // guest 0x250ae, sampled 0
6eacbeed50:    	and	w20, w20, #0x7  // guest 0x250ae, sampled 0
6eacbeed54:    	str	w20, [x19, #0x188]  // guest 0x250ae, sampled 0
6eacbeed58:    	sxtw	x22, w20  // guest 0x250ae, sampled 0
6eacbeed5c:    	add	x22, x22, x19  // guest 0x250ae, sampled 0
6eacbeed60:    	strb	wzr, [x22, #0x190]  // guest 0x250ae, sampled 0
6eacbeed64:    	ldr	w22, [x19, #0x74]  // guest 0x250ae, sampled 0
6eacbeed68:    	strh	w22, [x19, #0x224]  // guest 0x250ae, sampled 0
6eacbeed6c:    	str	w21, [x19, #0x230]  // guest 0x250ae, sampled 0
6eacbeed70:    	ldr	w22, [x19, #0x54]  // guest 0x250ae, sampled 0
6eacbeed74:    	strh	w22, [x19, #0x222]  // guest 0x250ae, sampled 0
6eacbeed78:    	mov	w22, #0x50ae            // =20654  // guest 0x250ae, sampled 0
6eacbeed7c:    	movk	w22, #0x2, lsl #16  // guest 0x250ae, sampled 0
6eacbeed80:    	str	w22, [x19, #0x228]  // guest 0x250ae, sampled 0
6eacbeed84:    	add	w22, w21, #0x4  // guest 0x250b0, sampled 0
6eacbeed88:    	mov	w23, w22  // guest 0x250b0, sampled 0
6eacbeed8c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250b0, sampled 0
6eacbeed90:    	and	x16, x16, x22, lsr #7  // guest 0x250b0, sampled 0
6eacbeed94:    	add	x17, x17, x16  // guest 0x250b0, sampled 0
6eacbeed98:    	ldp	x16, x17, [x17]  // guest 0x250b0, sampled 0
6eacbeed9c:    	and	w30, w22, #0xfffff003  // guest 0x250b0, sampled 0
6eacbeeda0:    	cmp	w16, w30  // guest 0x250b0, sampled 0
6eacbeeda4:    	b.ne	0x6eacbefed8 <trace+0x12d8>  // guest 0x250b0, sampled 0
6eacbeeda8:    	add	x30, x17, w22, uxtw  // guest 0x250b0, sampled 0
6eacbeedac:    	ldapr	w2, [x30]  // guest 0x250b0, sampled 0
6eacbeedb0:    	add	w22, w20, #0x7  // guest 0x250b0, sampled 1
6eacbeedb4:    	and	w22, w22, #0x7  // guest 0x250b0, sampled 0
6eacbeedb8:    	lsl	w22, w22, #4  // guest 0x250b0, sampled 0
6eacbeedbc:    	add	w22, w22, #0x1a0  // guest 0x250b0, sampled 1
6eacbeedc0:    	sxtw	x22, w22  // guest 0x250b0, sampled 0
6eacbeedc4:    	add	x1, x22, x19  // guest 0x250b0, sampled 0
6eacbeedc8:    	mov	x0, x19  // guest 0x250b0, sampled 0
6eacbeedcc:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcbc000>  // guest 0x250b0, sampled 0
6eacbeedd0:    	add	x16, x16, #0x484  // guest 0x250b0, sampled 0
6eacbeedd4:    	blr	x16  // guest 0x250b0, sampled 0
6eacbeedd8:    	sub	w20, w20, #0x1  // guest 0x250b0, sampled 0
6eacbeeddc:    	and	w20, w20, #0x7  // guest 0x250b0, sampled 0
6eacbeede0:    	str	w20, [x19, #0x188]  // guest 0x250b0, sampled 0
6eacbeede4:    	sxtw	x22, w20  // guest 0x250b0, sampled 0
6eacbeede8:    	add	x22, x22, x19  // guest 0x250b0, sampled 0
6eacbeedec:    	strb	wzr, [x22, #0x190]  // guest 0x250b0, sampled 0
6eacbeedf0:    	ldr	w22, [x19, #0x74]  // guest 0x250b0, sampled 0
6eacbeedf4:    	strh	w22, [x19, #0x224]  // guest 0x250b0, sampled 0
6eacbeedf8:    	str	w23, [x19, #0x230]  // guest 0x250b0, sampled 0
6eacbeedfc:    	ldr	w22, [x19, #0x54]  // guest 0x250b0, sampled 0
6eacbeee00:    	strh	w22, [x19, #0x222]  // guest 0x250b0, sampled 0
6eacbeee04:    	mov	w22, #0x50b0            // =20656  // guest 0x250b0, sampled 0
6eacbeee08:    	movk	w22, #0x2, lsl #16  // guest 0x250b0, sampled 0
6eacbeee0c:    	str	w22, [x19, #0x228]  // guest 0x250b0, sampled 0
6eacbeee10:    	add	w21, w21, #0x8  // guest 0x250b3, sampled 0
6eacbeee14:    	mov	w22, w21  // guest 0x250b3, sampled 0
6eacbeee18:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250b3, sampled 0
6eacbeee1c:    	and	x16, x16, x21, lsr #7  // guest 0x250b3, sampled 0
6eacbeee20:    	add	x17, x17, x16  // guest 0x250b3, sampled 0
6eacbeee24:    	ldp	x16, x17, [x17]  // guest 0x250b3, sampled 0
6eacbeee28:    	and	w30, w21, #0xfffff003  // guest 0x250b3, sampled 0
6eacbeee2c:    	cmp	w16, w30  // guest 0x250b3, sampled 0
6eacbeee30:    	b.ne	0x6eacbeff04 <trace+0x1304>  // guest 0x250b3, sampled 0
6eacbeee34:    	add	x30, x17, w21, uxtw  // guest 0x250b3, sampled 0
6eacbeee38:    	ldapr	w2, [x30]  // guest 0x250b3, sampled 0
6eacbeee3c:    	add	w21, w20, #0x7  // guest 0x250b3, sampled 0
6eacbeee40:    	and	w21, w21, #0x7  // guest 0x250b3, sampled 0
6eacbeee44:    	lsl	w21, w21, #4  // guest 0x250b3, sampled 0
6eacbeee48:    	add	w21, w21, #0x1a0  // guest 0x250b3, sampled 0
6eacbeee4c:    	sxtw	x21, w21  // guest 0x250b3, sampled 0
6eacbeee50:    	add	x1, x21, x19  // guest 0x250b3, sampled 0
6eacbeee54:    	mov	x0, x19  // guest 0x250b3, sampled 0
6eacbeee58:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcbc000>  // guest 0x250b3, sampled 0
6eacbeee5c:    	add	x16, x16, #0x484  // guest 0x250b3, sampled 0
6eacbeee60:    	blr	x16  // guest 0x250b3, sampled 0
6eacbeee64:    	sub	w20, w20, #0x1  // guest 0x250b3, sampled 0
6eacbeee68:    	and	w20, w20, #0x7  // guest 0x250b3, sampled 0
6eacbeee6c:    	str	w20, [x19, #0x188]  // guest 0x250b3, sampled 0
6eacbeee70:    	sxtw	x20, w20  // guest 0x250b3, sampled 0
6eacbeee74:    	add	x20, x20, x19  // guest 0x250b3, sampled 0
6eacbeee78:    	strb	wzr, [x20, #0x190]  // guest 0x250b3, sampled 0
6eacbeee7c:    	ldr	w20, [x19, #0x74]  // guest 0x250b3, sampled 0
6eacbeee80:    	strh	w20, [x19, #0x224]  // guest 0x250b3, sampled 0
6eacbeee84:    	str	w22, [x19, #0x230]  // guest 0x250b3, sampled 0
6eacbeee88:    	ldr	w20, [x19, #0x54]  // guest 0x250b3, sampled 0
6eacbeee8c:    	strh	w20, [x19, #0x222]  // guest 0x250b3, sampled 0
6eacbeee90:    	mov	w20, #0x50b3            // =20659  // guest 0x250b3, sampled 0
6eacbeee94:    	movk	w20, #0x2, lsl #16  // guest 0x250b3, sampled 0
6eacbeee98:    	str	w20, [x19, #0x228]  // guest 0x250b3, sampled 0
6eacbeee9c:    	mov	w1, #0x2                // =2  // guest 0x250b6, sampled 0
6eacbeeea0:    	mov	x0, x19  // guest 0x250b6, sampled 0
6eacbeeea4:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbd000>  // guest 0x250b6, sampled 0
6eacbeeea8:    	add	x16, x16, #0x5a0  // guest 0x250b6, sampled 0
6eacbeeeac:    	blr	x16  // guest 0x250b6, sampled 0
6eacbeeeb0:    	ldr	w20, [x19, #0x54]  // guest 0x250b6, sampled 0
6eacbeeeb4:    	strh	w20, [x19, #0x222]  // guest 0x250b6, sampled 0
6eacbeeeb8:    	mov	w20, #0x50b6            // =20662  // guest 0x250b6, sampled 0
6eacbeeebc:    	movk	w20, #0x2, lsl #16  // guest 0x250b6, sampled 0
6eacbeeec0:    	str	w20, [x19, #0x228]  // guest 0x250b6, sampled 0
6eacbeeec4:    	ldr	w20, [x19, #0x8]  // guest 0x250b8, sampled 0
6eacbeeec8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250b8, sampled 0
6eacbeeecc:    	and	x16, x16, x20, lsr #7  // guest 0x250b8, sampled 0
6eacbeeed0:    	add	x17, x17, x16  // guest 0x250b8, sampled 0
6eacbeeed4:    	ldp	x16, x17, [x17]  // guest 0x250b8, sampled 0
6eacbeeed8:    	and	w30, w20, #0xfffff003  // guest 0x250b8, sampled 0
6eacbeeedc:    	cmp	w16, w30  // guest 0x250b8, sampled 0
6eacbeeee0:    	b.ne	0x6eacbeff30 <trace+0x1330>  // guest 0x250b8, sampled 0
6eacbeeee4:    	add	x30, x17, w20, uxtw  // guest 0x250b8, sampled 0
6eacbeeee8:    	ldapr	w2, [x30]  // guest 0x250b8, sampled 0
6eacbeeeec:    	add	x1, x19, #0x258  // guest 0x250b8, sampled 2
6eacbeeef0:    	mov	x0, x19  // guest 0x250b8, sampled 0
6eacbeeef4:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcbc000>  // guest 0x250b8, sampled 0
6eacbeeef8:    	add	x16, x16, #0x484  // guest 0x250b8, sampled 0
6eacbeeefc:    	blr	x16  // guest 0x250b8, sampled 0
6eacbeef00:    	ldr	w21, [x19, #0x188]  // guest 0x250b8, sampled 0
6eacbeef04:    	lsl	w21, w21, #4  // guest 0x250b8, sampled 0
6eacbeef08:    	add	w21, w21, #0x1a0  // guest 0x250b8, sampled 0
6eacbeef0c:    	sxtw	x21, w21  // guest 0x250b8, sampled 0
6eacbeef10:    	add	x1, x21, x19  // guest 0x250b8, sampled 0
6eacbeef14:    	add	x2, x19, #0x258  // guest 0x250b8, sampled 0
6eacbeef18:    	mov	x0, x19  // guest 0x250b8, sampled 0
6eacbeef1c:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbd000>  // guest 0x250b8, sampled 0
6eacbeef20:    	add	x16, x16, #0xc20  // guest 0x250b8, sampled 0
6eacbeef24:    	blr	x16  // guest 0x250b8, sampled 0
6eacbeef28:    	ldr	w21, [x19, #0x74]  // guest 0x250b8, sampled 0
6eacbeef2c:    	strh	w21, [x19, #0x224]  // guest 0x250b8, sampled 0
6eacbeef30:    	str	w20, [x19, #0x230]  // guest 0x250b8, sampled 0
6eacbeef34:    	ldr	w20, [x19, #0x54]  // guest 0x250b8, sampled 0
6eacbeef38:    	strh	w20, [x19, #0x222]  // guest 0x250b8, sampled 0
6eacbeef3c:    	mov	w20, #0x50b8            // =20664  // guest 0x250b8, sampled 0
6eacbeef40:    	movk	w20, #0x2, lsl #16  // guest 0x250b8, sampled 0
6eacbeef44:    	str	w20, [x19, #0x228]  // guest 0x250b8, sampled 0
6eacbeef48:    	mov	w1, #0x1                // =1  // guest 0x250ba, sampled 0
6eacbeef4c:    	mov	x0, x19  // guest 0x250ba, sampled 0
6eacbeef50:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbd000>  // guest 0x250ba, sampled 0
6eacbeef54:    	add	x16, x16, #0x5a0  // guest 0x250ba, sampled 0
6eacbeef58:    	blr	x16  // guest 0x250ba, sampled 0
6eacbeef5c:    	ldr	w20, [x19, #0x54]  // guest 0x250ba, sampled 0
6eacbeef60:    	strh	w20, [x19, #0x222]  // guest 0x250ba, sampled 0
6eacbeef64:    	mov	w20, #0x50ba            // =20666  // guest 0x250ba, sampled 0
6eacbeef68:    	movk	w20, #0x2, lsl #16  // guest 0x250ba, sampled 0
6eacbeef6c:    	str	w20, [x19, #0x228]  // guest 0x250ba, sampled 0
6eacbeef70:    	ldr	w20, [x19, #0x8]  // guest 0x250bc, sampled 0
6eacbeef74:    	add	w20, w20, #0x4  // guest 0x250bc, sampled 0
6eacbeef78:    	mov	w21, w20  // guest 0x250bc, sampled 0
6eacbeef7c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250bc, sampled 0
6eacbeef80:    	and	x16, x16, x20, lsr #7  // guest 0x250bc, sampled 0
6eacbeef84:    	add	x17, x17, x16  // guest 0x250bc, sampled 0
6eacbeef88:    	ldp	x16, x17, [x17]  // guest 0x250bc, sampled 0
6eacbeef8c:    	and	w30, w20, #0xfffff003  // guest 0x250bc, sampled 0
6eacbeef90:    	cmp	w16, w30  // guest 0x250bc, sampled 0
6eacbeef94:    	b.ne	0x6eacbeff5c <trace+0x135c>  // guest 0x250bc, sampled 0
6eacbeef98:    	add	x30, x17, w20, uxtw  // guest 0x250bc, sampled 0
6eacbeef9c:    	ldapr	w2, [x30]  // guest 0x250bc, sampled 0
6eacbeefa0:    	add	x1, x19, #0x258  // guest 0x250bc, sampled 0
6eacbeefa4:    	mov	x0, x19  // guest 0x250bc, sampled 0
6eacbeefa8:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcbc000>  // guest 0x250bc, sampled 0
6eacbeefac:    	add	x16, x16, #0x484  // guest 0x250bc, sampled 0
6eacbeefb0:    	blr	x16  // guest 0x250bc, sampled 0
6eacbeefb4:    	ldr	w20, [x19, #0x188]  // guest 0x250bc, sampled 0
6eacbeefb8:    	lsl	w20, w20, #4  // guest 0x250bc, sampled 0
6eacbeefbc:    	add	w20, w20, #0x1a0  // guest 0x250bc, sampled 0
6eacbeefc0:    	sxtw	x20, w20  // guest 0x250bc, sampled 0
6eacbeefc4:    	add	x1, x20, x19  // guest 0x250bc, sampled 0
6eacbeefc8:    	add	x2, x19, #0x258  // guest 0x250bc, sampled 0
6eacbeefcc:    	mov	x0, x19  // guest 0x250bc, sampled 0
6eacbeefd0:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbd000>  // guest 0x250bc, sampled 0
6eacbeefd4:    	add	x16, x16, #0xc20  // guest 0x250bc, sampled 0
6eacbeefd8:    	blr	x16  // guest 0x250bc, sampled 0
6eacbeefdc:    	ldr	w20, [x19, #0x74]  // guest 0x250bc, sampled 0
6eacbeefe0:    	strh	w20, [x19, #0x224]  // guest 0x250bc, sampled 0
6eacbeefe4:    	str	w21, [x19, #0x230]  // guest 0x250bc, sampled 0
6eacbeefe8:    	ldr	w20, [x19, #0x54]  // guest 0x250bc, sampled 0
6eacbeefec:    	strh	w20, [x19, #0x222]  // guest 0x250bc, sampled 0
6eacbeeff0:    	mov	w20, #0x50bc            // =20668  // guest 0x250bc, sampled 0
6eacbeeff4:    	movk	w20, #0x2, lsl #16  // guest 0x250bc, sampled 0
6eacbeeff8:    	str	w20, [x19, #0x228]  // guest 0x250bc, sampled 0
6eacbeeffc:    	mov	w1, #0x2                // =2  // guest 0x250bf, sampled 0
6eacbef000:    	mov	x0, x19  // guest 0x250bf, sampled 0
6eacbef004:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x250bf, sampled 0
6eacbef008:    	add	x16, x16, #0x5a0  // guest 0x250bf, sampled 0
6eacbef00c:    	blr	x16  // guest 0x250bf, sampled 0
6eacbef010:    	ldr	w20, [x19, #0x54]  // guest 0x250bf, sampled 0
6eacbef014:    	strh	w20, [x19, #0x222]  // guest 0x250bf, sampled 0
6eacbef018:    	mov	w20, #0x50bf            // =20671  // guest 0x250bf, sampled 0
6eacbef01c:    	movk	w20, #0x2, lsl #16  // guest 0x250bf, sampled 0
6eacbef020:    	str	w20, [x19, #0x228]  // guest 0x250bf, sampled 0
6eacbef024:    	ldr	w20, [x19, #0x8]  // guest 0x250c1, sampled 0
6eacbef028:    	add	w20, w20, #0x8  // guest 0x250c1, sampled 0
6eacbef02c:    	mov	w21, w20  // guest 0x250c1, sampled 0
6eacbef030:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250c1, sampled 0
6eacbef034:    	and	x16, x16, x20, lsr #7  // guest 0x250c1, sampled 0
6eacbef038:    	add	x17, x17, x16  // guest 0x250c1, sampled 0
6eacbef03c:    	ldp	x16, x17, [x17]  // guest 0x250c1, sampled 0
6eacbef040:    	and	w30, w20, #0xfffff003  // guest 0x250c1, sampled 0
6eacbef044:    	cmp	w16, w30  // guest 0x250c1, sampled 0
6eacbef048:    	b.ne	0x6eacbeff88 <trace+0x1388>  // guest 0x250c1, sampled 0
6eacbef04c:    	add	x30, x17, w20, uxtw  // guest 0x250c1, sampled 0
6eacbef050:    	ldapr	w2, [x30]  // guest 0x250c1, sampled 0
6eacbef054:    	add	x1, x19, #0x258  // guest 0x250c1, sampled 0
6eacbef058:    	mov	x0, x19  // guest 0x250c1, sampled 0
6eacbef05c:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcbb000>  // guest 0x250c1, sampled 0
6eacbef060:    	add	x16, x16, #0x484  // guest 0x250c1, sampled 0
6eacbef064:    	blr	x16  // guest 0x250c1, sampled 0
6eacbef068:    	ldr	w20, [x19, #0x188]  // guest 0x250c1, sampled 0
6eacbef06c:    	lsl	w20, w20, #4  // guest 0x250c1, sampled 0
6eacbef070:    	add	w20, w20, #0x1a0  // guest 0x250c1, sampled 0
6eacbef074:    	sxtw	x20, w20  // guest 0x250c1, sampled 0
6eacbef078:    	add	x1, x20, x19  // guest 0x250c1, sampled 0
6eacbef07c:    	add	x2, x19, #0x258  // guest 0x250c1, sampled 0
6eacbef080:    	mov	x0, x19  // guest 0x250c1, sampled 0
6eacbef084:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x250c1, sampled 0
6eacbef088:    	add	x16, x16, #0xc20  // guest 0x250c1, sampled 0
6eacbef08c:    	blr	x16  // guest 0x250c1, sampled 0
6eacbef090:    	ldr	w20, [x19, #0x74]  // guest 0x250c1, sampled 0
6eacbef094:    	strh	w20, [x19, #0x224]  // guest 0x250c1, sampled 0
6eacbef098:    	str	w21, [x19, #0x230]  // guest 0x250c1, sampled 0
6eacbef09c:    	ldr	w20, [x19, #0x54]  // guest 0x250c1, sampled 0
6eacbef0a0:    	strh	w20, [x19, #0x222]  // guest 0x250c1, sampled 0
6eacbef0a4:    	mov	w20, #0x50c1            // =20673  // guest 0x250c1, sampled 0
6eacbef0a8:    	movk	w20, #0x2, lsl #16  // guest 0x250c1, sampled 0
6eacbef0ac:    	str	w20, [x19, #0x228]  // guest 0x250c1, sampled 0
6eacbef0b0:    	mov	w1, #0x1                // =1  // guest 0x250c4, sampled 0
6eacbef0b4:    	mov	x0, x19  // guest 0x250c4, sampled 0
6eacbef0b8:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x250c4, sampled 0
6eacbef0bc:    	add	x16, x16, #0x5a0  // guest 0x250c4, sampled 0
6eacbef0c0:    	blr	x16  // guest 0x250c4, sampled 0
6eacbef0c4:    	ldr	w20, [x19, #0x54]  // guest 0x250c4, sampled 0
6eacbef0c8:    	strh	w20, [x19, #0x222]  // guest 0x250c4, sampled 0
6eacbef0cc:    	mov	w20, #0x50c4            // =20676  // guest 0x250c4, sampled 0
6eacbef0d0:    	movk	w20, #0x2, lsl #16  // guest 0x250c4, sampled 0
6eacbef0d4:    	str	w20, [x19, #0x228]  // guest 0x250c4, sampled 0
6eacbef0d8:    	ldr	w20, [x19, #0x188]  // guest 0x250c6, sampled 0
6eacbef0dc:    	sub	w20, w20, #0x1  // guest 0x250c6, sampled 0
6eacbef0e0:    	and	w20, w20, #0x7  // guest 0x250c6, sampled 0
6eacbef0e4:    	str	w20, [x19, #0x188]  // guest 0x250c6, sampled 0
6eacbef0e8:    	sxtw	x21, w20  // guest 0x250c6, sampled 0
6eacbef0ec:    	add	x21, x21, x19  // guest 0x250c6, sampled 0
6eacbef0f0:    	strb	wzr, [x21, #0x190]  // guest 0x250c6, sampled 0
6eacbef0f4:    	lsl	w21, w20, #4  // guest 0x250c6, sampled 0
6eacbef0f8:    	add	w21, w21, #0x1a0  // guest 0x250c6, sampled 0
6eacbef0fc:    	sxtw	x21, w21  // guest 0x250c6, sampled 0
6eacbef100:    	add	x21, x21, x19  // guest 0x250c6, sampled 0
6eacbef104:    	add	w22, w20, #0x1  // guest 0x250c6, sampled 0
6eacbef108:    	and	w22, w22, #0x7  // guest 0x250c6, sampled 0
6eacbef10c:    	lsl	w22, w22, #4  // guest 0x250c6, sampled 0
6eacbef110:    	add	w22, w22, #0x1a0  // guest 0x250c6, sampled 0
6eacbef114:    	sxtw	x22, w22  // guest 0x250c6, sampled 0
6eacbef118:    	add	x22, x22, x19  // guest 0x250c6, sampled 0
6eacbef11c:    	ldr	x23, [x22]  // guest 0x250c6, sampled 0
6eacbef120:    	ldrh	w22, [x22, #0x8]  // guest 0x250c6, sampled 1
6eacbef124:    	str	x23, [x21]  // guest 0x250c6, sampled 0
6eacbef128:    	strh	w22, [x21, #0x8]  // guest 0x250c6, sampled 0
6eacbef12c:    	ldr	w21, [x19, #0x54]  // guest 0x250c6, sampled 0
6eacbef130:    	strh	w21, [x19, #0x222]  // guest 0x250c6, sampled 0
6eacbef134:    	mov	w21, #0x50c6            // =20678  // guest 0x250c6, sampled 0
6eacbef138:    	movk	w21, #0x2, lsl #16  // guest 0x250c6, sampled 0
6eacbef13c:    	str	w21, [x19, #0x228]  // guest 0x250c6, sampled 0
6eacbef140:    	ldr	w21, [x19, #0x8]  // guest 0x250c8, sampled 0
6eacbef144:    	add	w22, w21, #0xc  // guest 0x250c8, sampled 0
6eacbef148:    	mov	w23, w22  // guest 0x250c8, sampled 0
6eacbef14c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250c8, sampled 0
6eacbef150:    	and	x16, x16, x22, lsr #7  // guest 0x250c8, sampled 0
6eacbef154:    	add	x17, x17, x16  // guest 0x250c8, sampled 0
6eacbef158:    	ldp	x16, x17, [x17]  // guest 0x250c8, sampled 0
6eacbef15c:    	and	w30, w22, #0xfffff003  // guest 0x250c8, sampled 1
6eacbef160:    	cmp	w16, w30  // guest 0x250c8, sampled 0
6eacbef164:    	b.ne	0x6eacbeffb4 <trace+0x13b4>  // guest 0x250c8, sampled 0
6eacbef168:    	add	x30, x17, w22, uxtw  // guest 0x250c8, sampled 0
6eacbef16c:    	ldapr	w2, [x30]  // guest 0x250c8, sampled 0
6eacbef170:    	add	x1, x19, #0x258  // guest 0x250c8, sampled 0
6eacbef174:    	mov	x0, x19  // guest 0x250c8, sampled 0
6eacbef178:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcbb000>  // guest 0x250c8, sampled 0
6eacbef17c:    	add	x16, x16, #0x484  // guest 0x250c8, sampled 0
6eacbef180:    	blr	x16  // guest 0x250c8, sampled 0
6eacbef184:    	lsl	w22, w20, #4  // guest 0x250c8, sampled 0
6eacbef188:    	add	w22, w22, #0x1a0  // guest 0x250c8, sampled 0
6eacbef18c:    	sxtw	x22, w22  // guest 0x250c8, sampled 0
6eacbef190:    	add	x1, x22, x19  // guest 0x250c8, sampled 0
6eacbef194:    	add	x2, x19, #0x258  // guest 0x250c8, sampled 0
6eacbef198:    	mov	x0, x19  // guest 0x250c8, sampled 0
6eacbef19c:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x250c8, sampled 0
6eacbef1a0:    	add	x16, x16, #0xb4c  // guest 0x250c8, sampled 0
6eacbef1a4:    	blr	x16  // guest 0x250c8, sampled 0
6eacbef1a8:    	ldr	w22, [x19, #0x74]  // guest 0x250c8, sampled 0
6eacbef1ac:    	strh	w22, [x19, #0x224]  // guest 0x250c8, sampled 0
6eacbef1b0:    	str	w23, [x19, #0x230]  // guest 0x250c8, sampled 0
6eacbef1b4:    	ldr	w22, [x19, #0x54]  // guest 0x250c8, sampled 0
6eacbef1b8:    	strh	w22, [x19, #0x222]  // guest 0x250c8, sampled 0
6eacbef1bc:    	mov	w22, #0x50c8            // =20680  // guest 0x250c8, sampled 0
6eacbef1c0:    	movk	w22, #0x2, lsl #16  // guest 0x250c8, sampled 0
6eacbef1c4:    	str	w22, [x19, #0x228]  // guest 0x250c8, sampled 0
6eacbef1c8:    	sub	w20, w20, #0x1  // guest 0x250cb, sampled 0
6eacbef1cc:    	and	w20, w20, #0x7  // guest 0x250cb, sampled 0
6eacbef1d0:    	str	w20, [x19, #0x188]  // guest 0x250cb, sampled 0
6eacbef1d4:    	sxtw	x22, w20  // guest 0x250cb, sampled 0
6eacbef1d8:    	add	x22, x22, x19  // guest 0x250cb, sampled 0
6eacbef1dc:    	strb	wzr, [x22, #0x190]  // guest 0x250cb, sampled 0
6eacbef1e0:    	lsl	w22, w20, #4  // guest 0x250cb, sampled 0
6eacbef1e4:    	add	w22, w22, #0x1a0  // guest 0x250cb, sampled 0
6eacbef1e8:    	sxtw	x22, w22  // guest 0x250cb, sampled 0
6eacbef1ec:    	add	x22, x22, x19  // guest 0x250cb, sampled 0
6eacbef1f0:    	add	w23, w20, #0x2  // guest 0x250cb, sampled 0
6eacbef1f4:    	and	w23, w23, #0x7  // guest 0x250cb, sampled 0
6eacbef1f8:    	lsl	w23, w23, #4  // guest 0x250cb, sampled 0
6eacbef1fc:    	add	w23, w23, #0x1a0  // guest 0x250cb, sampled 0
6eacbef200:    	sxtw	x23, w23  // guest 0x250cb, sampled 0
6eacbef204:    	add	x23, x23, x19  // guest 0x250cb, sampled 0
6eacbef208:    	ldr	x24, [x23]  // guest 0x250cb, sampled 0
6eacbef20c:    	ldrh	w23, [x23, #0x8]  // guest 0x250cb, sampled 0
6eacbef210:    	str	x24, [x22]  // guest 0x250cb, sampled 0
6eacbef214:    	strh	w23, [x22, #0x8]  // guest 0x250cb, sampled 0
6eacbef218:    	ldr	w22, [x19, #0x54]  // guest 0x250cb, sampled 0
6eacbef21c:    	strh	w22, [x19, #0x222]  // guest 0x250cb, sampled 0
6eacbef220:    	mov	w22, #0x50cb            // =20683  // guest 0x250cb, sampled 0
6eacbef224:    	movk	w22, #0x2, lsl #16  // guest 0x250cb, sampled 0
6eacbef228:    	str	w22, [x19, #0x228]  // guest 0x250cb, sampled 0
6eacbef22c:    	add	w21, w21, #0x18  // guest 0x250cd, sampled 0
6eacbef230:    	mov	w22, w21  // guest 0x250cd, sampled 0
6eacbef234:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250cd, sampled 0
6eacbef238:    	and	x16, x16, x21, lsr #7  // guest 0x250cd, sampled 0
6eacbef23c:    	add	x17, x17, x16  // guest 0x250cd, sampled 0
6eacbef240:    	ldp	x16, x17, [x17]  // guest 0x250cd, sampled 0
6eacbef244:    	and	w30, w21, #0xfffff003  // guest 0x250cd, sampled 0
6eacbef248:    	cmp	w16, w30  // guest 0x250cd, sampled 0
6eacbef24c:    	b.ne	0x6eacbeffe0 <trace+0x13e0>  // guest 0x250cd, sampled 0
6eacbef250:    	add	x30, x17, w21, uxtw  // guest 0x250cd, sampled 0
6eacbef254:    	ldapr	w2, [x30]  // guest 0x250cd, sampled 0
6eacbef258:    	add	x1, x19, #0x258  // guest 0x250cd, sampled 0
6eacbef25c:    	mov	x0, x19  // guest 0x250cd, sampled 0
6eacbef260:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcbb000>  // guest 0x250cd, sampled 0
6eacbef264:    	add	x16, x16, #0x484  // guest 0x250cd, sampled 0
6eacbef268:    	blr	x16  // guest 0x250cd, sampled 0
6eacbef26c:    	lsl	w20, w20, #4  // guest 0x250cd, sampled 0
6eacbef270:    	add	w20, w20, #0x1a0  // guest 0x250cd, sampled 0
6eacbef274:    	sxtw	x20, w20  // guest 0x250cd, sampled 0
6eacbef278:    	add	x1, x20, x19  // guest 0x250cd, sampled 0
6eacbef27c:    	add	x2, x19, #0x258  // guest 0x250cd, sampled 0
6eacbef280:    	mov	x0, x19  // guest 0x250cd, sampled 0
6eacbef284:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x250cd, sampled 0
6eacbef288:    	add	x16, x16, #0xb4c  // guest 0x250cd, sampled 0
6eacbef28c:    	blr	x16  // guest 0x250cd, sampled 0
6eacbef290:    	ldr	w20, [x19, #0x74]  // guest 0x250cd, sampled 0
6eacbef294:    	strh	w20, [x19, #0x224]  // guest 0x250cd, sampled 0
6eacbef298:    	str	w22, [x19, #0x230]  // guest 0x250cd, sampled 0
6eacbef29c:    	ldr	w20, [x19, #0x54]  // guest 0x250cd, sampled 0
6eacbef2a0:    	strh	w20, [x19, #0x222]  // guest 0x250cd, sampled 0
6eacbef2a4:    	mov	w20, #0x50cd            // =20685  // guest 0x250cd, sampled 0
6eacbef2a8:    	movk	w20, #0x2, lsl #16  // guest 0x250cd, sampled 0
6eacbef2ac:    	str	w20, [x19, #0x228]  // guest 0x250cd, sampled 0
6eacbef2b0:    	mov	w1, #0x2                // =2  // guest 0x250d0, sampled 0
6eacbef2b4:    	mov	x0, x19  // guest 0x250d0, sampled 0
6eacbef2b8:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x250d0, sampled 0
6eacbef2bc:    	add	x16, x16, #0x5a0  // guest 0x250d0, sampled 0
6eacbef2c0:    	blr	x16  // guest 0x250d0, sampled 0
6eacbef2c4:    	ldr	w20, [x19, #0x54]  // guest 0x250d0, sampled 0
6eacbef2c8:    	strh	w20, [x19, #0x222]  // guest 0x250d0, sampled 0
6eacbef2cc:    	mov	w20, #0x50d0            // =20688  // guest 0x250d0, sampled 0
6eacbef2d0:    	movk	w20, #0x2, lsl #16  // guest 0x250d0, sampled 0
6eacbef2d4:    	str	w20, [x19, #0x228]  // guest 0x250d0, sampled 0
6eacbef2d8:    	ldr	w20, [x19, #0x8]  // guest 0x250d2, sampled 0
6eacbef2dc:    	add	w20, w20, #0x24  // guest 0x250d2, sampled 0
6eacbef2e0:    	mov	w21, w20  // guest 0x250d2, sampled 0
6eacbef2e4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250d2, sampled 0
6eacbef2e8:    	and	x16, x16, x20, lsr #7  // guest 0x250d2, sampled 0
6eacbef2ec:    	add	x17, x17, x16  // guest 0x250d2, sampled 0
6eacbef2f0:    	ldp	x16, x17, [x17]  // guest 0x250d2, sampled 0
6eacbef2f4:    	and	w30, w20, #0xfffff003  // guest 0x250d2, sampled 2
6eacbef2f8:    	cmp	w16, w30  // guest 0x250d2, sampled 0
6eacbef2fc:    	b.ne	0x6eacbf000c <trace+0x140c>  // guest 0x250d2, sampled 0
6eacbef300:    	add	x30, x17, w20, uxtw  // guest 0x250d2, sampled 0
6eacbef304:    	ldapr	w2, [x30]  // guest 0x250d2, sampled 0
6eacbef308:    	add	x1, x19, #0x258  // guest 0x250d2, sampled 0
6eacbef30c:    	mov	x0, x19  // guest 0x250d2, sampled 0
6eacbef310:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcbb000>  // guest 0x250d2, sampled 0
6eacbef314:    	add	x16, x16, #0x484  // guest 0x250d2, sampled 0
6eacbef318:    	blr	x16  // guest 0x250d2, sampled 0
6eacbef31c:    	ldr	w20, [x19, #0x188]  // guest 0x250d2, sampled 0
6eacbef320:    	lsl	w20, w20, #4  // guest 0x250d2, sampled 0
6eacbef324:    	add	w20, w20, #0x1a0  // guest 0x250d2, sampled 0
6eacbef328:    	sxtw	x20, w20  // guest 0x250d2, sampled 0
6eacbef32c:    	add	x1, x20, x19  // guest 0x250d2, sampled 0
6eacbef330:    	add	x2, x19, #0x258  // guest 0x250d2, sampled 0
6eacbef334:    	mov	x0, x19  // guest 0x250d2, sampled 0
6eacbef338:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x250d2, sampled 0
6eacbef33c:    	add	x16, x16, #0xb4c  // guest 0x250d2, sampled 0
6eacbef340:    	blr	x16  // guest 0x250d2, sampled 0
6eacbef344:    	ldr	w20, [x19, #0x74]  // guest 0x250d2, sampled 0
6eacbef348:    	strh	w20, [x19, #0x224]  // guest 0x250d2, sampled 0
6eacbef34c:    	str	w21, [x19, #0x230]  // guest 0x250d2, sampled 0
6eacbef350:    	ldr	w20, [x19, #0x54]  // guest 0x250d2, sampled 0
6eacbef354:    	strh	w20, [x19, #0x222]  // guest 0x250d2, sampled 0
6eacbef358:    	mov	w20, #0x50d2            // =20690  // guest 0x250d2, sampled 0
6eacbef35c:    	movk	w20, #0x2, lsl #16  // guest 0x250d2, sampled 0
6eacbef360:    	str	w20, [x19, #0x228]  // guest 0x250d2, sampled 0
6eacbef364:    	mov	w1, #0x4                // =4  // guest 0x250d5, sampled 0
6eacbef368:    	mov	x0, x19  // guest 0x250d5, sampled 0
6eacbef36c:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x250d5, sampled 0
6eacbef370:    	add	x16, x16, #0x5a0  // guest 0x250d5, sampled 0
6eacbef374:    	blr	x16  // guest 0x250d5, sampled 0
6eacbef378:    	ldr	w20, [x19, #0x54]  // guest 0x250d5, sampled 0
6eacbef37c:    	strh	w20, [x19, #0x222]  // guest 0x250d5, sampled 0
6eacbef380:    	mov	w20, #0x50d5            // =20693  // guest 0x250d5, sampled 0
6eacbef384:    	movk	w20, #0x2, lsl #16  // guest 0x250d5, sampled 0
6eacbef388:    	str	w20, [x19, #0x228]  // guest 0x250d5, sampled 0
6eacbef38c:    	ldr	w20, [x19, #0x188]  // guest 0x250d7, sampled 0
6eacbef390:    	sub	w20, w20, #0x1  // guest 0x250d7, sampled 0
6eacbef394:    	and	w20, w20, #0x7  // guest 0x250d7, sampled 0
6eacbef398:    	str	w20, [x19, #0x188]  // guest 0x250d7, sampled 0
6eacbef39c:    	sxtw	x21, w20  // guest 0x250d7, sampled 0
6eacbef3a0:    	add	x21, x21, x19  // guest 0x250d7, sampled 0
6eacbef3a4:    	strb	wzr, [x21, #0x190]  // guest 0x250d7, sampled 0
6eacbef3a8:    	lsl	w21, w20, #4  // guest 0x250d7, sampled 0
6eacbef3ac:    	add	w21, w21, #0x1a0  // guest 0x250d7, sampled 0
6eacbef3b0:    	sxtw	x21, w21  // guest 0x250d7, sampled 0
6eacbef3b4:    	add	x21, x21, x19  // guest 0x250d7, sampled 0
6eacbef3b8:    	add	w22, w20, #0x1  // guest 0x250d7, sampled 0
6eacbef3bc:    	and	w22, w22, #0x7  // guest 0x250d7, sampled 0
6eacbef3c0:    	lsl	w22, w22, #4  // guest 0x250d7, sampled 0
6eacbef3c4:    	add	w22, w22, #0x1a0  // guest 0x250d7, sampled 0
6eacbef3c8:    	sxtw	x22, w22  // guest 0x250d7, sampled 0
6eacbef3cc:    	add	x22, x22, x19  // guest 0x250d7, sampled 0
6eacbef3d0:    	ldr	x23, [x22]  // guest 0x250d7, sampled 0
6eacbef3d4:    	ldrh	w22, [x22, #0x8]  // guest 0x250d7, sampled 0
6eacbef3d8:    	str	x23, [x21]  // guest 0x250d7, sampled 0
6eacbef3dc:    	strh	w22, [x21, #0x8]  // guest 0x250d7, sampled 0
6eacbef3e0:    	ldr	w21, [x19, #0x54]  // guest 0x250d7, sampled 0
6eacbef3e4:    	strh	w21, [x19, #0x222]  // guest 0x250d7, sampled 0
6eacbef3e8:    	mov	w21, #0x50d7            // =20695  // guest 0x250d7, sampled 0
6eacbef3ec:    	movk	w21, #0x2, lsl #16  // guest 0x250d7, sampled 0
6eacbef3f0:    	str	w21, [x19, #0x228]  // guest 0x250d7, sampled 0
6eacbef3f4:    	ldr	w21, [x19, #0x8]  // guest 0x250d9, sampled 0
6eacbef3f8:    	add	w22, w21, #0x10  // guest 0x250d9, sampled 0
6eacbef3fc:    	mov	w23, w22  // guest 0x250d9, sampled 0
6eacbef400:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250d9, sampled 0
6eacbef404:    	and	x16, x16, x22, lsr #7  // guest 0x250d9, sampled 0
6eacbef408:    	add	x17, x17, x16  // guest 0x250d9, sampled 0
6eacbef40c:    	ldp	x16, x17, [x17]  // guest 0x250d9, sampled 0
6eacbef410:    	and	w30, w22, #0xfffff003  // guest 0x250d9, sampled 0
6eacbef414:    	cmp	w16, w30  // guest 0x250d9, sampled 0
6eacbef418:    	b.ne	0x6eacbf0038 <trace+0x1438>  // guest 0x250d9, sampled 0
6eacbef41c:    	add	x30, x17, w22, uxtw  // guest 0x250d9, sampled 0
6eacbef420:    	ldapr	w2, [x30]  // guest 0x250d9, sampled 0
6eacbef424:    	add	x1, x19, #0x258  // guest 0x250d9, sampled 0
6eacbef428:    	mov	x0, x19  // guest 0x250d9, sampled 0
6eacbef42c:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcbb000>  // guest 0x250d9, sampled 0
6eacbef430:    	add	x16, x16, #0x484  // guest 0x250d9, sampled 0
6eacbef434:    	blr	x16  // guest 0x250d9, sampled 0
6eacbef438:    	lsl	w22, w20, #4  // guest 0x250d9, sampled 0
6eacbef43c:    	add	w22, w22, #0x1a0  // guest 0x250d9, sampled 0
6eacbef440:    	sxtw	x22, w22  // guest 0x250d9, sampled 0
6eacbef444:    	add	x1, x22, x19  // guest 0x250d9, sampled 0
6eacbef448:    	add	x2, x19, #0x258  // guest 0x250d9, sampled 0
6eacbef44c:    	mov	x0, x19  // guest 0x250d9, sampled 0
6eacbef450:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x250d9, sampled 0
6eacbef454:    	add	x16, x16, #0xb4c  // guest 0x250d9, sampled 0
6eacbef458:    	blr	x16  // guest 0x250d9, sampled 0
6eacbef45c:    	ldr	w22, [x19, #0x74]  // guest 0x250d9, sampled 0
6eacbef460:    	strh	w22, [x19, #0x224]  // guest 0x250d9, sampled 0
6eacbef464:    	str	w23, [x19, #0x230]  // guest 0x250d9, sampled 0
6eacbef468:    	ldr	w22, [x19, #0x54]  // guest 0x250d9, sampled 0
6eacbef46c:    	strh	w22, [x19, #0x222]  // guest 0x250d9, sampled 0
6eacbef470:    	mov	w22, #0x50d9            // =20697  // guest 0x250d9, sampled 0
6eacbef474:    	movk	w22, #0x2, lsl #16  // guest 0x250d9, sampled 0
6eacbef478:    	str	w22, [x19, #0x228]  // guest 0x250d9, sampled 0
6eacbef47c:    	sub	w20, w20, #0x1  // guest 0x250dc, sampled 0
6eacbef480:    	and	w20, w20, #0x7  // guest 0x250dc, sampled 0
6eacbef484:    	str	w20, [x19, #0x188]  // guest 0x250dc, sampled 0
6eacbef488:    	sxtw	x22, w20  // guest 0x250dc, sampled 0
6eacbef48c:    	add	x22, x22, x19  // guest 0x250dc, sampled 0
6eacbef490:    	strb	wzr, [x22, #0x190]  // guest 0x250dc, sampled 0
6eacbef494:    	lsl	w22, w20, #4  // guest 0x250dc, sampled 0
6eacbef498:    	add	w22, w22, #0x1a0  // guest 0x250dc, sampled 0
6eacbef49c:    	sxtw	x22, w22  // guest 0x250dc, sampled 0
6eacbef4a0:    	add	x22, x22, x19  // guest 0x250dc, sampled 1
6eacbef4a4:    	add	w23, w20, #0x2  // guest 0x250dc, sampled 0
6eacbef4a8:    	and	w23, w23, #0x7  // guest 0x250dc, sampled 0
6eacbef4ac:    	lsl	w23, w23, #4  // guest 0x250dc, sampled 0
6eacbef4b0:    	add	w23, w23, #0x1a0  // guest 0x250dc, sampled 0
6eacbef4b4:    	sxtw	x23, w23  // guest 0x250dc, sampled 0
6eacbef4b8:    	add	x23, x23, x19  // guest 0x250dc, sampled 0
6eacbef4bc:    	ldr	x24, [x23]  // guest 0x250dc, sampled 0
6eacbef4c0:    	ldrh	w23, [x23, #0x8]  // guest 0x250dc, sampled 1
6eacbef4c4:    	str	x24, [x22]  // guest 0x250dc, sampled 0
6eacbef4c8:    	strh	w23, [x22, #0x8]  // guest 0x250dc, sampled 0
6eacbef4cc:    	ldr	w22, [x19, #0x54]  // guest 0x250dc, sampled 0
6eacbef4d0:    	strh	w22, [x19, #0x222]  // guest 0x250dc, sampled 0
6eacbef4d4:    	mov	w22, #0x50dc            // =20700  // guest 0x250dc, sampled 0
6eacbef4d8:    	movk	w22, #0x2, lsl #16  // guest 0x250dc, sampled 0
6eacbef4dc:    	str	w22, [x19, #0x228]  // guest 0x250dc, sampled 0
6eacbef4e0:    	add	w21, w21, #0x1c  // guest 0x250de, sampled 0
6eacbef4e4:    	mov	w22, w21  // guest 0x250de, sampled 0
6eacbef4e8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250de, sampled 0
6eacbef4ec:    	and	x16, x16, x21, lsr #7  // guest 0x250de, sampled 0
6eacbef4f0:    	add	x17, x17, x16  // guest 0x250de, sampled 0
6eacbef4f4:    	ldp	x16, x17, [x17]  // guest 0x250de, sampled 0
6eacbef4f8:    	and	w30, w21, #0xfffff003  // guest 0x250de, sampled 0
6eacbef4fc:    	cmp	w16, w30  // guest 0x250de, sampled 0
6eacbef500:    	b.ne	0x6eacbf0064 <trace+0x1464>  // guest 0x250de, sampled 0
6eacbef504:    	add	x30, x17, w21, uxtw  // guest 0x250de, sampled 1
6eacbef508:    	ldapr	w2, [x30]  // guest 0x250de, sampled 0
6eacbef50c:    	add	x1, x19, #0x258  // guest 0x250de, sampled 0
6eacbef510:    	mov	x0, x19  // guest 0x250de, sampled 0
6eacbef514:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcbb000>  // guest 0x250de, sampled 0
6eacbef518:    	add	x16, x16, #0x484  // guest 0x250de, sampled 0
6eacbef51c:    	blr	x16  // guest 0x250de, sampled 0
6eacbef520:    	lsl	w20, w20, #4  // guest 0x250de, sampled 0
6eacbef524:    	add	w20, w20, #0x1a0  // guest 0x250de, sampled 0
6eacbef528:    	sxtw	x20, w20  // guest 0x250de, sampled 0
6eacbef52c:    	add	x1, x20, x19  // guest 0x250de, sampled 0
6eacbef530:    	add	x2, x19, #0x258  // guest 0x250de, sampled 0
6eacbef534:    	mov	x0, x19  // guest 0x250de, sampled 0
6eacbef538:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x250de, sampled 0
6eacbef53c:    	add	x16, x16, #0xb4c  // guest 0x250de, sampled 0
6eacbef540:    	blr	x16  // guest 0x250de, sampled 0
6eacbef544:    	ldr	w20, [x19, #0x74]  // guest 0x250de, sampled 0
6eacbef548:    	strh	w20, [x19, #0x224]  // guest 0x250de, sampled 0
6eacbef54c:    	str	w22, [x19, #0x230]  // guest 0x250de, sampled 0
6eacbef550:    	ldr	w20, [x19, #0x54]  // guest 0x250de, sampled 0
6eacbef554:    	strh	w20, [x19, #0x222]  // guest 0x250de, sampled 0
6eacbef558:    	mov	w20, #0x50de            // =20702  // guest 0x250de, sampled 0
6eacbef55c:    	movk	w20, #0x2, lsl #16  // guest 0x250de, sampled 0
6eacbef560:    	str	w20, [x19, #0x228]  // guest 0x250de, sampled 0
6eacbef564:    	mov	w1, #0x2                // =2  // guest 0x250e1, sampled 0
6eacbef568:    	mov	x0, x19  // guest 0x250e1, sampled 0
6eacbef56c:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x250e1, sampled 0
6eacbef570:    	add	x16, x16, #0x5a0  // guest 0x250e1, sampled 0
6eacbef574:    	blr	x16  // guest 0x250e1, sampled 0
6eacbef578:    	ldr	w20, [x19, #0x54]  // guest 0x250e1, sampled 0
6eacbef57c:    	strh	w20, [x19, #0x222]  // guest 0x250e1, sampled 1
6eacbef580:    	mov	w20, #0x50e1            // =20705  // guest 0x250e1, sampled 0
6eacbef584:    	movk	w20, #0x2, lsl #16  // guest 0x250e1, sampled 0
6eacbef588:    	str	w20, [x19, #0x228]  // guest 0x250e1, sampled 0
6eacbef58c:    	ldr	w20, [x19, #0x8]  // guest 0x250e3, sampled 0
6eacbef590:    	add	w20, w20, #0x28  // guest 0x250e3, sampled 0
6eacbef594:    	mov	w21, w20  // guest 0x250e3, sampled 0
6eacbef598:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250e3, sampled 0
6eacbef59c:    	and	x16, x16, x20, lsr #7  // guest 0x250e3, sampled 0
6eacbef5a0:    	add	x17, x17, x16  // guest 0x250e3, sampled 0
6eacbef5a4:    	ldp	x16, x17, [x17]  // guest 0x250e3, sampled 0
6eacbef5a8:    	and	w30, w20, #0xfffff003  // guest 0x250e3, sampled 0
6eacbef5ac:    	cmp	w16, w30  // guest 0x250e3, sampled 0
6eacbef5b0:    	b.ne	0x6eacbf0090 <trace+0x1490>  // guest 0x250e3, sampled 0
6eacbef5b4:    	add	x30, x17, w20, uxtw  // guest 0x250e3, sampled 0
6eacbef5b8:    	ldapr	w2, [x30]  // guest 0x250e3, sampled 0
6eacbef5bc:    	add	x1, x19, #0x258  // guest 0x250e3, sampled 0
6eacbef5c0:    	mov	x0, x19  // guest 0x250e3, sampled 0
6eacbef5c4:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcbb000>  // guest 0x250e3, sampled 0
6eacbef5c8:    	add	x16, x16, #0x484  // guest 0x250e3, sampled 0
6eacbef5cc:    	blr	x16  // guest 0x250e3, sampled 0
6eacbef5d0:    	ldr	w20, [x19, #0x188]  // guest 0x250e3, sampled 0
6eacbef5d4:    	lsl	w20, w20, #4  // guest 0x250e3, sampled 0
6eacbef5d8:    	add	w20, w20, #0x1a0  // guest 0x250e3, sampled 0
6eacbef5dc:    	sxtw	x20, w20  // guest 0x250e3, sampled 0
6eacbef5e0:    	add	x1, x20, x19  // guest 0x250e3, sampled 0
6eacbef5e4:    	add	x2, x19, #0x258  // guest 0x250e3, sampled 0
6eacbef5e8:    	mov	x0, x19  // guest 0x250e3, sampled 0
6eacbef5ec:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x250e3, sampled 0
6eacbef5f0:    	add	x16, x16, #0xb4c  // guest 0x250e3, sampled 0
6eacbef5f4:    	blr	x16  // guest 0x250e3, sampled 0
6eacbef5f8:    	ldr	w20, [x19, #0x74]  // guest 0x250e3, sampled 0
6eacbef5fc:    	strh	w20, [x19, #0x224]  // guest 0x250e3, sampled 0
6eacbef600:    	str	w21, [x19, #0x230]  // guest 0x250e3, sampled 0
6eacbef604:    	ldr	w20, [x19, #0x54]  // guest 0x250e3, sampled 0
6eacbef608:    	strh	w20, [x19, #0x222]  // guest 0x250e3, sampled 0
6eacbef60c:    	mov	w20, #0x50e3            // =20707  // guest 0x250e3, sampled 0
6eacbef610:    	movk	w20, #0x2, lsl #16  // guest 0x250e3, sampled 0
6eacbef614:    	str	w20, [x19, #0x228]  // guest 0x250e3, sampled 0
6eacbef618:    	mov	w1, #0x1                // =1  // guest 0x250e6, sampled 0
6eacbef61c:    	mov	x0, x19  // guest 0x250e6, sampled 0
6eacbef620:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x250e6, sampled 0
6eacbef624:    	add	x16, x16, #0x5a0  // guest 0x250e6, sampled 0
6eacbef628:    	blr	x16  // guest 0x250e6, sampled 0
6eacbef62c:    	ldr	w20, [x19, #0x54]  // guest 0x250e6, sampled 0
6eacbef630:    	strh	w20, [x19, #0x222]  // guest 0x250e6, sampled 0
6eacbef634:    	mov	w20, #0x50e6            // =20710  // guest 0x250e6, sampled 0
6eacbef638:    	movk	w20, #0x2, lsl #16  // guest 0x250e6, sampled 0
6eacbef63c:    	str	w20, [x19, #0x228]  // guest 0x250e6, sampled 0
6eacbef640:    	ldr	w20, [x19, #0x188]  // guest 0x250e8, sampled 0
6eacbef644:    	add	w21, w20, #0x3  // guest 0x250e8, sampled 0
6eacbef648:    	and	w21, w21, #0x7  // guest 0x250e8, sampled 0
6eacbef64c:    	lsl	w21, w21, #4  // guest 0x250e8, sampled 0
6eacbef650:    	add	w21, w21, #0x1a0  // guest 0x250e8, sampled 0
6eacbef654:    	sxtw	x21, w21  // guest 0x250e8, sampled 0
6eacbef658:    	add	x1, x21, x19  // guest 0x250e8, sampled 0
6eacbef65c:    	lsl	w21, w20, #4  // guest 0x250e8, sampled 0
6eacbef660:    	add	w21, w21, #0x1a0  // guest 0x250e8, sampled 0
6eacbef664:    	sxtw	x21, w21  // guest 0x250e8, sampled 0
6eacbef668:    	add	x2, x21, x19  // guest 0x250e8, sampled 0
6eacbef66c:    	mov	x0, x19  // guest 0x250e8, sampled 0
6eacbef670:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x250e8, sampled 0
6eacbef674:    	add	x16, x16, #0xa78  // guest 0x250e8, sampled 0
6eacbef678:    	blr	x16  // guest 0x250e8, sampled 0
6eacbef67c:    	sxtw	x21, w20  // guest 0x250e8, sampled 0
6eacbef680:    	add	x21, x21, x19  // guest 0x250e8, sampled 0
6eacbef684:    	mov	w22, #0x1               // =1  // guest 0x250e8, sampled 0
6eacbef688:    	strb	w22, [x21, #0x190]  // guest 0x250e8, sampled 0
6eacbef68c:    	add	w20, w20, w22  // guest 0x250e8, sampled 0
6eacbef690:    	and	w20, w20, #0x7  // guest 0x250e8, sampled 0
6eacbef694:    	ldr	w21, [x19, #0x54]  // guest 0x250e8, sampled 0
6eacbef698:    	strh	w21, [x19, #0x222]  // guest 0x250e8, sampled 0
6eacbef69c:    	mov	w21, #0x50e8            // =20712  // guest 0x250e8, sampled 0
6eacbef6a0:    	movk	w21, #0x2, lsl #16  // guest 0x250e8, sampled 0
6eacbef6a4:    	str	w21, [x19, #0x228]  // guest 0x250e8, sampled 0
6eacbef6a8:    	add	w21, w20, #0x5  // guest 0x250ea, sampled 0
6eacbef6ac:    	and	w21, w21, #0x7  // guest 0x250ea, sampled 0
6eacbef6b0:    	lsl	w21, w21, #4  // guest 0x250ea, sampled 0
6eacbef6b4:    	add	w21, w21, #0x1a0  // guest 0x250ea, sampled 0
6eacbef6b8:    	sxtw	x21, w21  // guest 0x250ea, sampled 0
6eacbef6bc:    	add	x1, x21, x19  // guest 0x250ea, sampled 0
6eacbef6c0:    	lsl	w21, w20, #4  // guest 0x250ea, sampled 0
6eacbef6c4:    	add	w21, w21, #0x1a0  // guest 0x250ea, sampled 0
6eacbef6c8:    	sxtw	x21, w21  // guest 0x250ea, sampled 0
6eacbef6cc:    	add	x2, x21, x19  // guest 0x250ea, sampled 0
6eacbef6d0:    	mov	x0, x19  // guest 0x250ea, sampled 0
6eacbef6d4:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x250ea, sampled 0
6eacbef6d8:    	add	x16, x16, #0xa78  // guest 0x250ea, sampled 0
6eacbef6dc:    	blr	x16  // guest 0x250ea, sampled 0
6eacbef6e0:    	sxtw	x21, w20  // guest 0x250ea, sampled 0
6eacbef6e4:    	add	x21, x21, x19  // guest 0x250ea, sampled 0
6eacbef6e8:    	strb	w22, [x21, #0x190]  // guest 0x250ea, sampled 0
6eacbef6ec:    	add	w20, w20, w22  // guest 0x250ea, sampled 0
6eacbef6f0:    	and	w20, w20, #0x7  // guest 0x250ea, sampled 0
6eacbef6f4:    	ldr	w21, [x19, #0x54]  // guest 0x250ea, sampled 0
6eacbef6f8:    	strh	w21, [x19, #0x222]  // guest 0x250ea, sampled 0
6eacbef6fc:    	mov	w21, #0x50ea            // =20714  // guest 0x250ea, sampled 0
6eacbef700:    	movk	w21, #0x2, lsl #16  // guest 0x250ea, sampled 0
6eacbef704:    	str	w21, [x19, #0x228]  // guest 0x250ea, sampled 0
6eacbef708:    	add	w21, w20, #0x2  // guest 0x250ec, sampled 0
6eacbef70c:    	and	w21, w21, #0x7  // guest 0x250ec, sampled 0
6eacbef710:    	lsl	w21, w21, #4  // guest 0x250ec, sampled 0
6eacbef714:    	add	w21, w21, #0x1a0  // guest 0x250ec, sampled 0
6eacbef718:    	sxtw	x21, w21  // guest 0x250ec, sampled 0
6eacbef71c:    	add	x1, x21, x19  // guest 0x250ec, sampled 0
6eacbef720:    	lsl	w21, w20, #4  // guest 0x250ec, sampled 0
6eacbef724:    	add	w21, w21, #0x1a0  // guest 0x250ec, sampled 0
6eacbef728:    	sxtw	x21, w21  // guest 0x250ec, sampled 0
6eacbef72c:    	add	x2, x21, x19  // guest 0x250ec, sampled 0
6eacbef730:    	mov	x0, x19  // guest 0x250ec, sampled 0
6eacbef734:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x250ec, sampled 0
6eacbef738:    	add	x16, x16, #0xa78  // guest 0x250ec, sampled 0
6eacbef73c:    	blr	x16  // guest 0x250ec, sampled 0
6eacbef740:    	sxtw	x21, w20  // guest 0x250ec, sampled 0
6eacbef744:    	add	x21, x21, x19  // guest 0x250ec, sampled 0
6eacbef748:    	strb	w22, [x21, #0x190]  // guest 0x250ec, sampled 0
6eacbef74c:    	add	w20, w20, w22  // guest 0x250ec, sampled 0
6eacbef750:    	and	w20, w20, #0x7  // guest 0x250ec, sampled 0
6eacbef754:    	str	w20, [x19, #0x188]  // guest 0x250ec, sampled 0
6eacbef758:    	ldr	w20, [x19, #0x54]  // guest 0x250ec, sampled 0
6eacbef75c:    	strh	w20, [x19, #0x222]  // guest 0x250ec, sampled 0
6eacbef760:    	mov	w20, #0x50ec            // =20716  // guest 0x250ec, sampled 0
6eacbef764:    	movk	w20, #0x2, lsl #16  // guest 0x250ec, sampled 0
6eacbef768:    	str	w20, [x19, #0x228]  // guest 0x250ec, sampled 0
6eacbef76c:    	mov	w1, #0x2                // =2  // guest 0x250ee, sampled 0
6eacbef770:    	mov	x0, x19  // guest 0x250ee, sampled 0
6eacbef774:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x250ee, sampled 0
6eacbef778:    	add	x16, x16, #0x5a0  // guest 0x250ee, sampled 0
6eacbef77c:    	blr	x16  // guest 0x250ee, sampled 0
6eacbef780:    	ldr	w20, [x19, #0x54]  // guest 0x250ee, sampled 0
6eacbef784:    	strh	w20, [x19, #0x222]  // guest 0x250ee, sampled 0
6eacbef788:    	mov	w20, #0x50ee            // =20718  // guest 0x250ee, sampled 0
6eacbef78c:    	movk	w20, #0x2, lsl #16  // guest 0x250ee, sampled 0
6eacbef790:    	str	w20, [x19, #0x228]  // guest 0x250ee, sampled 0
6eacbef794:    	ldr	w20, [x19, #0x188]  // guest 0x250f0, sampled 0
6eacbef798:    	sub	w20, w20, #0x1  // guest 0x250f0, sampled 0
6eacbef79c:    	and	w20, w20, #0x7  // guest 0x250f0, sampled 0
6eacbef7a0:    	str	w20, [x19, #0x188]  // guest 0x250f0, sampled 0
6eacbef7a4:    	sxtw	x21, w20  // guest 0x250f0, sampled 0
6eacbef7a8:    	add	x21, x21, x19  // guest 0x250f0, sampled 0
6eacbef7ac:    	strb	wzr, [x21, #0x190]  // guest 0x250f0, sampled 0
6eacbef7b0:    	lsl	w21, w20, #4  // guest 0x250f0, sampled 0
6eacbef7b4:    	add	w21, w21, #0x1a0  // guest 0x250f0, sampled 0
6eacbef7b8:    	sxtw	x21, w21  // guest 0x250f0, sampled 0
6eacbef7bc:    	add	x21, x21, x19  // guest 0x250f0, sampled 0
6eacbef7c0:    	add	w23, w20, w22  // guest 0x250f0, sampled 0
6eacbef7c4:    	and	w23, w23, #0x7  // guest 0x250f0, sampled 0
6eacbef7c8:    	lsl	w23, w23, #4  // guest 0x250f0, sampled 0
6eacbef7cc:    	add	w23, w23, #0x1a0  // guest 0x250f0, sampled 0
6eacbef7d0:    	sxtw	x23, w23  // guest 0x250f0, sampled 0
6eacbef7d4:    	add	x23, x23, x19  // guest 0x250f0, sampled 0
6eacbef7d8:    	ldr	x24, [x23]  // guest 0x250f0, sampled 0
6eacbef7dc:    	ldrh	w23, [x23, #0x8]  // guest 0x250f0, sampled 0
6eacbef7e0:    	str	x24, [x21]  // guest 0x250f0, sampled 0
6eacbef7e4:    	strh	w23, [x21, #0x8]  // guest 0x250f0, sampled 0
6eacbef7e8:    	ldr	w21, [x19, #0x54]  // guest 0x250f0, sampled 0
6eacbef7ec:    	strh	w21, [x19, #0x222]  // guest 0x250f0, sampled 0
6eacbef7f0:    	mov	w21, #0x50f0            // =20720  // guest 0x250f0, sampled 0
6eacbef7f4:    	movk	w21, #0x2, lsl #16  // guest 0x250f0, sampled 0
6eacbef7f8:    	str	w21, [x19, #0x228]  // guest 0x250f0, sampled 0
6eacbef7fc:    	ldr	w21, [x19, #0x8]  // guest 0x250f2, sampled 0
6eacbef800:    	add	w23, w21, #0x14  // guest 0x250f2, sampled 0
6eacbef804:    	mov	w24, w23  // guest 0x250f2, sampled 0
6eacbef808:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250f2, sampled 0
6eacbef80c:    	and	x16, x16, x23, lsr #7  // guest 0x250f2, sampled 0
6eacbef810:    	add	x17, x17, x16  // guest 0x250f2, sampled 0
6eacbef814:    	ldp	x16, x17, [x17]  // guest 0x250f2, sampled 0
6eacbef818:    	and	w30, w23, #0xfffff003  // guest 0x250f2, sampled 0
6eacbef81c:    	cmp	w16, w30  // guest 0x250f2, sampled 0
6eacbef820:    	b.ne	0x6eacbf00bc <trace+0x14bc>  // guest 0x250f2, sampled 0
6eacbef824:    	add	x30, x17, w23, uxtw  // guest 0x250f2, sampled 0
6eacbef828:    	ldapr	w2, [x30]  // guest 0x250f2, sampled 0
6eacbef82c:    	add	x1, x19, #0x258  // guest 0x250f2, sampled 0
6eacbef830:    	mov	x0, x19  // guest 0x250f2, sampled 0
6eacbef834:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcbb000>  // guest 0x250f2, sampled 0
6eacbef838:    	add	x16, x16, #0x484  // guest 0x250f2, sampled 0
6eacbef83c:    	blr	x16  // guest 0x250f2, sampled 0
6eacbef840:    	lsl	w23, w20, #4  // guest 0x250f2, sampled 0
6eacbef844:    	add	w23, w23, #0x1a0  // guest 0x250f2, sampled 0
6eacbef848:    	sxtw	x23, w23  // guest 0x250f2, sampled 0
6eacbef84c:    	add	x1, x23, x19  // guest 0x250f2, sampled 0
6eacbef850:    	add	x2, x19, #0x258  // guest 0x250f2, sampled 0
6eacbef854:    	mov	x0, x19  // guest 0x250f2, sampled 0
6eacbef858:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x250f2, sampled 0
6eacbef85c:    	add	x16, x16, #0xb4c  // guest 0x250f2, sampled 0
6eacbef860:    	blr	x16  // guest 0x250f2, sampled 0
6eacbef864:    	ldr	w23, [x19, #0x74]  // guest 0x250f2, sampled 0
6eacbef868:    	strh	w23, [x19, #0x224]  // guest 0x250f2, sampled 1
6eacbef86c:    	str	w24, [x19, #0x230]  // guest 0x250f2, sampled 0
6eacbef870:    	ldr	w23, [x19, #0x54]  // guest 0x250f2, sampled 0
6eacbef874:    	strh	w23, [x19, #0x222]  // guest 0x250f2, sampled 0
6eacbef878:    	mov	w23, #0x50f2            // =20722  // guest 0x250f2, sampled 0
6eacbef87c:    	movk	w23, #0x2, lsl #16  // guest 0x250f2, sampled 0
6eacbef880:    	str	w23, [x19, #0x228]  // guest 0x250f2, sampled 0
6eacbef884:    	sub	w20, w20, #0x1  // guest 0x250f5, sampled 0
6eacbef888:    	and	w20, w20, #0x7  // guest 0x250f5, sampled 0
6eacbef88c:    	str	w20, [x19, #0x188]  // guest 0x250f5, sampled 0
6eacbef890:    	sxtw	x23, w20  // guest 0x250f5, sampled 0
6eacbef894:    	add	x23, x23, x19  // guest 0x250f5, sampled 0
6eacbef898:    	strb	wzr, [x23, #0x190]  // guest 0x250f5, sampled 0
6eacbef89c:    	lsl	w23, w20, #4  // guest 0x250f5, sampled 0
6eacbef8a0:    	add	w23, w23, #0x1a0  // guest 0x250f5, sampled 0
6eacbef8a4:    	sxtw	x23, w23  // guest 0x250f5, sampled 0
6eacbef8a8:    	add	x23, x23, x19  // guest 0x250f5, sampled 0
6eacbef8ac:    	add	w24, w20, #0x2  // guest 0x250f5, sampled 0
6eacbef8b0:    	and	w24, w24, #0x7  // guest 0x250f5, sampled 0
6eacbef8b4:    	lsl	w24, w24, #4  // guest 0x250f5, sampled 0
6eacbef8b8:    	add	w24, w24, #0x1a0  // guest 0x250f5, sampled 0
6eacbef8bc:    	sxtw	x24, w24  // guest 0x250f5, sampled 0
6eacbef8c0:    	add	x24, x24, x19  // guest 0x250f5, sampled 0
6eacbef8c4:    	ldr	x25, [x24]  // guest 0x250f5, sampled 0
6eacbef8c8:    	ldrh	w24, [x24, #0x8]  // guest 0x250f5, sampled 0
6eacbef8cc:    	str	x25, [x23]  // guest 0x250f5, sampled 0
6eacbef8d0:    	strh	w24, [x23, #0x8]  // guest 0x250f5, sampled 0
6eacbef8d4:    	ldr	w23, [x19, #0x54]  // guest 0x250f5, sampled 0
6eacbef8d8:    	strh	w23, [x19, #0x222]  // guest 0x250f5, sampled 0
6eacbef8dc:    	mov	w23, #0x50f5            // =20725  // guest 0x250f5, sampled 0
6eacbef8e0:    	movk	w23, #0x2, lsl #16  // guest 0x250f5, sampled 0
6eacbef8e4:    	str	w23, [x19, #0x228]  // guest 0x250f5, sampled 0
6eacbef8e8:    	add	w21, w21, #0x20  // guest 0x250f7, sampled 0
6eacbef8ec:    	mov	w23, w21  // guest 0x250f7, sampled 0
6eacbef8f0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250f7, sampled 0
6eacbef8f4:    	and	x16, x16, x21, lsr #7  // guest 0x250f7, sampled 0
6eacbef8f8:    	add	x17, x17, x16  // guest 0x250f7, sampled 0
6eacbef8fc:    	ldp	x16, x17, [x17]  // guest 0x250f7, sampled 0
6eacbef900:    	and	w30, w21, #0xfffff003  // guest 0x250f7, sampled 0
6eacbef904:    	cmp	w16, w30  // guest 0x250f7, sampled 0
6eacbef908:    	b.ne	0x6eacbf00e8 <trace+0x14e8>  // guest 0x250f7, sampled 0
6eacbef90c:    	add	x30, x17, w21, uxtw  // guest 0x250f7, sampled 0
6eacbef910:    	ldapr	w2, [x30]  // guest 0x250f7, sampled 0
6eacbef914:    	add	x1, x19, #0x258  // guest 0x250f7, sampled 0
6eacbef918:    	mov	x0, x19  // guest 0x250f7, sampled 0
6eacbef91c:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcbb000>  // guest 0x250f7, sampled 0
6eacbef920:    	add	x16, x16, #0x484  // guest 0x250f7, sampled 0
6eacbef924:    	blr	x16  // guest 0x250f7, sampled 0
6eacbef928:    	lsl	w20, w20, #4  // guest 0x250f7, sampled 0
6eacbef92c:    	add	w20, w20, #0x1a0  // guest 0x250f7, sampled 0
6eacbef930:    	sxtw	x20, w20  // guest 0x250f7, sampled 0
6eacbef934:    	add	x1, x20, x19  // guest 0x250f7, sampled 0
6eacbef938:    	add	x2, x19, #0x258  // guest 0x250f7, sampled 0
6eacbef93c:    	mov	x0, x19  // guest 0x250f7, sampled 0
6eacbef940:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x250f7, sampled 0
6eacbef944:    	add	x16, x16, #0xb4c  // guest 0x250f7, sampled 0
6eacbef948:    	blr	x16  // guest 0x250f7, sampled 0
6eacbef94c:    	ldr	w20, [x19, #0x74]  // guest 0x250f7, sampled 0
6eacbef950:    	strh	w20, [x19, #0x224]  // guest 0x250f7, sampled 0
6eacbef954:    	str	w23, [x19, #0x230]  // guest 0x250f7, sampled 0
6eacbef958:    	ldr	w20, [x19, #0x54]  // guest 0x250f7, sampled 0
6eacbef95c:    	strh	w20, [x19, #0x222]  // guest 0x250f7, sampled 0
6eacbef960:    	mov	w20, #0x50f7            // =20727  // guest 0x250f7, sampled 0
6eacbef964:    	movk	w20, #0x2, lsl #16  // guest 0x250f7, sampled 0
6eacbef968:    	str	w20, [x19, #0x228]  // guest 0x250f7, sampled 0
6eacbef96c:    	mov	w1, #0x2                // =2  // guest 0x250fa, sampled 0
6eacbef970:    	mov	x0, x19  // guest 0x250fa, sampled 0
6eacbef974:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x250fa, sampled 0
6eacbef978:    	add	x16, x16, #0x5a0  // guest 0x250fa, sampled 0
6eacbef97c:    	blr	x16  // guest 0x250fa, sampled 0
6eacbef980:    	ldr	w20, [x19, #0x54]  // guest 0x250fa, sampled 0
6eacbef984:    	strh	w20, [x19, #0x222]  // guest 0x250fa, sampled 0
6eacbef988:    	mov	w20, #0x50fa            // =20730  // guest 0x250fa, sampled 0
6eacbef98c:    	movk	w20, #0x2, lsl #16  // guest 0x250fa, sampled 0
6eacbef990:    	str	w20, [x19, #0x228]  // guest 0x250fa, sampled 0
6eacbef994:    	ldr	w20, [x19, #0x8]  // guest 0x250fc, sampled 0
6eacbef998:    	add	w20, w20, #0x2c  // guest 0x250fc, sampled 0
6eacbef99c:    	mov	w21, w20  // guest 0x250fc, sampled 0
6eacbef9a0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x250fc, sampled 0
6eacbef9a4:    	and	x16, x16, x20, lsr #7  // guest 0x250fc, sampled 0
6eacbef9a8:    	add	x17, x17, x16  // guest 0x250fc, sampled 0
6eacbef9ac:    	ldp	x16, x17, [x17]  // guest 0x250fc, sampled 0
6eacbef9b0:    	and	w30, w20, #0xfffff003  // guest 0x250fc, sampled 0
6eacbef9b4:    	cmp	w16, w30  // guest 0x250fc, sampled 0
6eacbef9b8:    	b.ne	0x6eacbf0114 <trace+0x1514>  // guest 0x250fc, sampled 0
6eacbef9bc:    	add	x30, x17, w20, uxtw  // guest 0x250fc, sampled 1
6eacbef9c0:    	ldapr	w2, [x30]  // guest 0x250fc, sampled 0
6eacbef9c4:    	add	x1, x19, #0x258  // guest 0x250fc, sampled 0
6eacbef9c8:    	mov	x0, x19  // guest 0x250fc, sampled 0
6eacbef9cc:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcbb000>  // guest 0x250fc, sampled 0
6eacbef9d0:    	add	x16, x16, #0x484  // guest 0x250fc, sampled 0
6eacbef9d4:    	blr	x16  // guest 0x250fc, sampled 0
6eacbef9d8:    	ldr	w20, [x19, #0x188]  // guest 0x250fc, sampled 0
6eacbef9dc:    	lsl	w20, w20, #4  // guest 0x250fc, sampled 0
6eacbef9e0:    	add	w20, w20, #0x1a0  // guest 0x250fc, sampled 0
6eacbef9e4:    	sxtw	x20, w20  // guest 0x250fc, sampled 0
6eacbef9e8:    	add	x1, x20, x19  // guest 0x250fc, sampled 0
6eacbef9ec:    	add	x2, x19, #0x258  // guest 0x250fc, sampled 0
6eacbef9f0:    	mov	x0, x19  // guest 0x250fc, sampled 0
6eacbef9f4:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x250fc, sampled 0
6eacbef9f8:    	add	x16, x16, #0xb4c  // guest 0x250fc, sampled 0
6eacbef9fc:    	blr	x16  // guest 0x250fc, sampled 0
6eacbefa00:    	ldr	w20, [x19, #0x74]  // guest 0x250fc, sampled 0
6eacbefa04:    	strh	w20, [x19, #0x224]  // guest 0x250fc, sampled 0
6eacbefa08:    	str	w21, [x19, #0x230]  // guest 0x250fc, sampled 0
6eacbefa0c:    	ldr	w20, [x19, #0x54]  // guest 0x250fc, sampled 0
6eacbefa10:    	strh	w20, [x19, #0x222]  // guest 0x250fc, sampled 0
6eacbefa14:    	mov	w20, #0x50fc            // =20732  // guest 0x250fc, sampled 0
6eacbefa18:    	movk	w20, #0x2, lsl #16  // guest 0x250fc, sampled 0
6eacbefa1c:    	str	w20, [x19, #0x228]  // guest 0x250fc, sampled 0
6eacbefa20:    	mov	w1, w22  // guest 0x250ff, sampled 0
6eacbefa24:    	mov	x0, x19  // guest 0x250ff, sampled 0
6eacbefa28:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x250ff, sampled 0
6eacbefa2c:    	add	x16, x16, #0x5a0  // guest 0x250ff, sampled 0
6eacbefa30:    	blr	x16  // guest 0x250ff, sampled 0
6eacbefa34:    	ldr	w20, [x19, #0x54]  // guest 0x250ff, sampled 0
6eacbefa38:    	strh	w20, [x19, #0x222]  // guest 0x250ff, sampled 0
6eacbefa3c:    	mov	w20, #0x50ff            // =20735  // guest 0x250ff, sampled 0
6eacbefa40:    	movk	w20, #0x2, lsl #16  // guest 0x250ff, sampled 0
6eacbefa44:    	str	w20, [x19, #0x228]  // guest 0x250ff, sampled 0
6eacbefa48:    	ldr	w20, [x19, #0x188]  // guest 0x25101, sampled 0
6eacbefa4c:    	add	w21, w20, #0x4  // guest 0x25101, sampled 0
6eacbefa50:    	and	w21, w21, #0x7  // guest 0x25101, sampled 0
6eacbefa54:    	lsl	w21, w21, #4  // guest 0x25101, sampled 0
6eacbefa58:    	add	w21, w21, #0x1a0  // guest 0x25101, sampled 0
6eacbefa5c:    	sxtw	x21, w21  // guest 0x25101, sampled 0
6eacbefa60:    	add	x1, x21, x19  // guest 0x25101, sampled 0
6eacbefa64:    	lsl	w21, w20, #4  // guest 0x25101, sampled 0
6eacbefa68:    	add	w21, w21, #0x1a0  // guest 0x25101, sampled 0
6eacbefa6c:    	sxtw	x21, w21  // guest 0x25101, sampled 0
6eacbefa70:    	add	x2, x21, x19  // guest 0x25101, sampled 0
6eacbefa74:    	mov	x0, x19  // guest 0x25101, sampled 0
6eacbefa78:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x25101, sampled 0
6eacbefa7c:    	add	x16, x16, #0xa78  // guest 0x25101, sampled 0
6eacbefa80:    	blr	x16  // guest 0x25101, sampled 0
6eacbefa84:    	sxtw	x21, w20  // guest 0x25101, sampled 0
6eacbefa88:    	add	x21, x21, x19  // guest 0x25101, sampled 0
6eacbefa8c:    	strb	w22, [x21, #0x190]  // guest 0x25101, sampled 0
6eacbefa90:    	add	w20, w20, w22  // guest 0x25101, sampled 0
6eacbefa94:    	and	w20, w20, #0x7  // guest 0x25101, sampled 0
6eacbefa98:    	ldr	w21, [x19, #0x54]  // guest 0x25101, sampled 0
6eacbefa9c:    	strh	w21, [x19, #0x222]  // guest 0x25101, sampled 0
6eacbefaa0:    	mov	w21, #0x5101            // =20737  // guest 0x25101, sampled 0
6eacbefaa4:    	movk	w21, #0x2, lsl #16  // guest 0x25101, sampled 0
6eacbefaa8:    	str	w21, [x19, #0x228]  // guest 0x25101, sampled 0
6eacbefaac:    	add	w21, w20, #0x4  // guest 0x25103, sampled 0
6eacbefab0:    	and	w21, w21, #0x7  // guest 0x25103, sampled 0
6eacbefab4:    	lsl	w21, w21, #4  // guest 0x25103, sampled 0
6eacbefab8:    	add	w21, w21, #0x1a0  // guest 0x25103, sampled 0
6eacbefabc:    	sxtw	x21, w21  // guest 0x25103, sampled 0
6eacbefac0:    	add	x1, x21, x19  // guest 0x25103, sampled 0
6eacbefac4:    	lsl	w21, w20, #4  // guest 0x25103, sampled 0
6eacbefac8:    	add	w21, w21, #0x1a0  // guest 0x25103, sampled 0
6eacbefacc:    	sxtw	x21, w21  // guest 0x25103, sampled 0
6eacbefad0:    	add	x2, x21, x19  // guest 0x25103, sampled 0
6eacbefad4:    	mov	x0, x19  // guest 0x25103, sampled 0
6eacbefad8:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x25103, sampled 0
6eacbefadc:    	add	x16, x16, #0xa78  // guest 0x25103, sampled 0
6eacbefae0:    	blr	x16  // guest 0x25103, sampled 0
6eacbefae4:    	sxtw	x21, w20  // guest 0x25103, sampled 0
6eacbefae8:    	add	x21, x21, x19  // guest 0x25103, sampled 0
6eacbefaec:    	strb	w22, [x21, #0x190]  // guest 0x25103, sampled 0
6eacbefaf0:    	add	w20, w20, w22  // guest 0x25103, sampled 0
6eacbefaf4:    	and	w20, w20, #0x7  // guest 0x25103, sampled 0
6eacbefaf8:    	ldr	w21, [x19, #0x54]  // guest 0x25103, sampled 0
6eacbefafc:    	strh	w21, [x19, #0x222]  // guest 0x25103, sampled 0
6eacbefb00:    	mov	w21, #0x5103            // =20739  // guest 0x25103, sampled 0
6eacbefb04:    	movk	w21, #0x2, lsl #16  // guest 0x25103, sampled 0
6eacbefb08:    	str	w21, [x19, #0x228]  // guest 0x25103, sampled 0
6eacbefb0c:    	add	w21, w20, w22  // guest 0x25105, sampled 0
6eacbefb10:    	and	w21, w21, #0x7  // guest 0x25105, sampled 0
6eacbefb14:    	lsl	w21, w21, #4  // guest 0x25105, sampled 0
6eacbefb18:    	add	w21, w21, #0x1a0  // guest 0x25105, sampled 0
6eacbefb1c:    	sxtw	x21, w21  // guest 0x25105, sampled 0
6eacbefb20:    	add	x1, x21, x19  // guest 0x25105, sampled 0
6eacbefb24:    	lsl	w21, w20, #4  // guest 0x25105, sampled 0
6eacbefb28:    	add	w21, w21, #0x1a0  // guest 0x25105, sampled 0
6eacbefb2c:    	sxtw	x21, w21  // guest 0x25105, sampled 0
6eacbefb30:    	add	x2, x21, x19  // guest 0x25105, sampled 0
6eacbefb34:    	mov	x0, x19  // guest 0x25105, sampled 0
6eacbefb38:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x25105, sampled 0
6eacbefb3c:    	add	x16, x16, #0xa78  // guest 0x25105, sampled 0
6eacbefb40:    	blr	x16  // guest 0x25105, sampled 0
6eacbefb44:    	sxtw	x21, w20  // guest 0x25105, sampled 0
6eacbefb48:    	add	x21, x21, x19  // guest 0x25105, sampled 0
6eacbefb4c:    	strb	w22, [x21, #0x190]  // guest 0x25105, sampled 0
6eacbefb50:    	add	w20, w20, w22  // guest 0x25105, sampled 0
6eacbefb54:    	and	w20, w20, #0x7  // guest 0x25105, sampled 0
6eacbefb58:    	str	w20, [x19, #0x188]  // guest 0x25105, sampled 0
6eacbefb5c:    	ldr	w20, [x19, #0x54]  // guest 0x25105, sampled 0
6eacbefb60:    	strh	w20, [x19, #0x222]  // guest 0x25105, sampled 0
6eacbefb64:    	mov	w20, #0x5105            // =20741  // guest 0x25105, sampled 0
6eacbefb68:    	movk	w20, #0x2, lsl #16  // guest 0x25105, sampled 0
6eacbefb6c:    	str	w20, [x19, #0x228]  // guest 0x25105, sampled 0
6eacbefb70:    	mov	w1, w22  // guest 0x25107, sampled 0
6eacbefb74:    	mov	x0, x19  // guest 0x25107, sampled 0
6eacbefb78:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbc000>  // guest 0x25107, sampled 0
6eacbefb7c:    	add	x16, x16, #0x5a0  // guest 0x25107, sampled 0
6eacbefb80:    	blr	x16  // guest 0x25107, sampled 0
6eacbefb84:    	ldr	w20, [x19, #0x54]  // guest 0x25107, sampled 0
6eacbefb88:    	strh	w20, [x19, #0x222]  // guest 0x25107, sampled 0
6eacbefb8c:    	mov	w20, #0x5107            // =20743  // guest 0x25107, sampled 0
6eacbefb90:    	movk	w20, #0x2, lsl #16  // guest 0x25107, sampled 0
6eacbefb94:    	str	w20, [x19, #0x228]  // guest 0x25107, sampled 0
6eacbefb98:    	ldr	w20, [x19, #0x188]  // guest 0x25109, sampled 0
6eacbefb9c:    	lsl	w21, w20, #4  // guest 0x25109, sampled 0
6eacbefba0:    	add	w21, w21, #0x1a0  // guest 0x25109, sampled 0
6eacbefba4:    	sxtw	x21, w21  // guest 0x25109, sampled 0
6eacbefba8:    	add	x1, x21, x19  // guest 0x25109, sampled 0
6eacbefbac:    	mov	x0, x19  // guest 0x25109, sampled 0
6eacbefbb0:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcbb000>  // guest 0x25109, sampled 0
6eacbefbb4:    	add	x16, x16, #0x5c0  // guest 0x25109, sampled 0
6eacbefbb8:    	blr	x16  // guest 0x25109, sampled 0
6eacbefbbc:    	ldr	w21, [x19, #0x1c]  // guest 0x25109, sampled 0
6eacbefbc0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25109, sampled 0
6eacbefbc4:    	and	x16, x16, x21, lsr #7  // guest 0x25109, sampled 0
6eacbefbc8:    	add	x17, x17, x16  // guest 0x25109, sampled 0
6eacbefbcc:    	ldp	x17, x16, [x17, #0x8]  // guest 0x25109, sampled 0
6eacbefbd0:    	and	w30, w21, #0xfffff003  // guest 0x25109, sampled 0
6eacbefbd4:    	cmp	w16, w30  // guest 0x25109, sampled 0
6eacbefbd8:    	b.ne	0x6eacbf0140 <trace+0x1540>  // guest 0x25109, sampled 0
6eacbefbdc:    	add	x30, x17, w21, uxtw  // guest 0x25109, sampled 0
6eacbefbe0:    	stlr	w0, [x30]  // guest 0x25109, sampled 0
6eacbefbe4:    	sxtw	x23, w20  // guest 0x25109, sampled 0
6eacbefbe8:    	add	x23, x23, x19  // guest 0x25109, sampled 0
6eacbefbec:    	strb	w22, [x23, #0x190]  // guest 0x25109, sampled 0
6eacbefbf0:    	add	w20, w20, w22  // guest 0x25109, sampled 0
6eacbefbf4:    	and	w20, w20, #0x7  // guest 0x25109, sampled 0
6eacbefbf8:    	str	w20, [x19, #0x188]  // guest 0x25109, sampled 0
6eacbefbfc:    	ldr	w23, [x19, #0x74]  // guest 0x25109, sampled 0
6eacbefc00:    	strh	w23, [x19, #0x224]  // guest 0x25109, sampled 0
6eacbefc04:    	str	w21, [x19, #0x230]  // guest 0x25109, sampled 0
6eacbefc08:    	ldr	w23, [x19, #0x54]  // guest 0x25109, sampled 0
6eacbefc0c:    	strh	w23, [x19, #0x222]  // guest 0x25109, sampled 0
6eacbefc10:    	mov	w23, #0x5109            // =20745  // guest 0x25109, sampled 0
6eacbefc14:    	movk	w23, #0x2, lsl #16  // guest 0x25109, sampled 0
6eacbefc18:    	str	w23, [x19, #0x228]  // guest 0x25109, sampled 0
6eacbefc1c:    	add	w23, w21, #0x4  // guest 0x2510b, sampled 0
6eacbefc20:    	mov	w24, w23  // guest 0x2510b, sampled 0
6eacbefc24:    	lsl	w25, w20, #4  // guest 0x2510b, sampled 0
6eacbefc28:    	add	w25, w25, #0x1a0  // guest 0x2510b, sampled 0
6eacbefc2c:    	sxtw	x25, w25  // guest 0x2510b, sampled 0
6eacbefc30:    	add	x1, x25, x19  // guest 0x2510b, sampled 0
6eacbefc34:    	mov	x0, x19  // guest 0x2510b, sampled 0
6eacbefc38:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcbc000>  // guest 0x2510b, sampled 0
6eacbefc3c:    	add	x16, x16, #0x5c0  // guest 0x2510b, sampled 0
6eacbefc40:    	blr	x16  // guest 0x2510b, sampled 0
6eacbefc44:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2510b, sampled 0
6eacbefc48:    	and	x16, x16, x23, lsr #7  // guest 0x2510b, sampled 0
6eacbefc4c:    	add	x17, x17, x16  // guest 0x2510b, sampled 0
6eacbefc50:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2510b, sampled 0
6eacbefc54:    	and	w30, w23, #0xfffff003  // guest 0x2510b, sampled 0
6eacbefc58:    	cmp	w16, w30  // guest 0x2510b, sampled 0
6eacbefc5c:    	b.ne	0x6eacbf016c <trace+0x156c>  // guest 0x2510b, sampled 0
6eacbefc60:    	add	x30, x17, w23, uxtw  // guest 0x2510b, sampled 0
6eacbefc64:    	stlr	w0, [x30]  // guest 0x2510b, sampled 0
6eacbefc68:    	sxtw	x23, w20  // guest 0x2510b, sampled 0
6eacbefc6c:    	add	x23, x23, x19  // guest 0x2510b, sampled 0
6eacbefc70:    	strb	w22, [x23, #0x190]  // guest 0x2510b, sampled 0
6eacbefc74:    	add	w20, w20, w22  // guest 0x2510b, sampled 0
6eacbefc78:    	and	w20, w20, #0x7  // guest 0x2510b, sampled 0
6eacbefc7c:    	str	w20, [x19, #0x188]  // guest 0x2510b, sampled 0
6eacbefc80:    	ldr	w23, [x19, #0x74]  // guest 0x2510b, sampled 0
6eacbefc84:    	strh	w23, [x19, #0x224]  // guest 0x2510b, sampled 0
6eacbefc88:    	str	w24, [x19, #0x230]  // guest 0x2510b, sampled 0
6eacbefc8c:    	ldr	w23, [x19, #0x54]  // guest 0x2510b, sampled 0
6eacbefc90:    	strh	w23, [x19, #0x222]  // guest 0x2510b, sampled 0
6eacbefc94:    	mov	w23, #0x510b            // =20747  // guest 0x2510b, sampled 0
6eacbefc98:    	movk	w23, #0x2, lsl #16  // guest 0x2510b, sampled 0
6eacbefc9c:    	str	w23, [x19, #0x228]  // guest 0x2510b, sampled 0
6eacbefca0:    	add	w21, w21, #0x8  // guest 0x2510e, sampled 0
6eacbefca4:    	mov	w23, w21  // guest 0x2510e, sampled 0
6eacbefca8:    	lsl	w24, w20, #4  // guest 0x2510e, sampled 0
6eacbefcac:    	add	w24, w24, #0x1a0  // guest 0x2510e, sampled 0
6eacbefcb0:    	sxtw	x24, w24  // guest 0x2510e, sampled 0
6eacbefcb4:    	add	x1, x24, x19  // guest 0x2510e, sampled 0
6eacbefcb8:    	mov	x0, x19  // guest 0x2510e, sampled 0
6eacbefcbc:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcbc000>  // guest 0x2510e, sampled 0
6eacbefcc0:    	add	x16, x16, #0x5c0  // guest 0x2510e, sampled 0
6eacbefcc4:    	blr	x16  // guest 0x2510e, sampled 0
6eacbefcc8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2510e, sampled 0
6eacbefccc:    	and	x16, x16, x21, lsr #7  // guest 0x2510e, sampled 0
6eacbefcd0:    	add	x17, x17, x16  // guest 0x2510e, sampled 0
6eacbefcd4:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2510e, sampled 0
6eacbefcd8:    	and	w30, w21, #0xfffff003  // guest 0x2510e, sampled 0
6eacbefcdc:    	cmp	w16, w30  // guest 0x2510e, sampled 0
6eacbefce0:    	b.ne	0x6eacbf0198 <trace+0x1598>  // guest 0x2510e, sampled 0
6eacbefce4:    	add	x30, x17, w21, uxtw  // guest 0x2510e, sampled 1
6eacbefce8:    	stlr	w0, [x30]  // guest 0x2510e, sampled 0
6eacbefcec:    	sxtw	x21, w20  // guest 0x2510e, sampled 0
6eacbefcf0:    	add	x21, x21, x19  // guest 0x2510e, sampled 0
6eacbefcf4:    	strb	w22, [x21, #0x190]  // guest 0x2510e, sampled 0
6eacbefcf8:    	add	w20, w20, w22  // guest 0x2510e, sampled 0
6eacbefcfc:    	and	w20, w20, #0x7  // guest 0x2510e, sampled 0
6eacbefd00:    	str	w20, [x19, #0x188]  // guest 0x2510e, sampled 0
6eacbefd04:    	ldr	w20, [x19, #0x74]  // guest 0x2510e, sampled 0
6eacbefd08:    	strh	w20, [x19, #0x224]  // guest 0x2510e, sampled 1
6eacbefd0c:    	str	w23, [x19, #0x230]  // guest 0x2510e, sampled 0
6eacbefd10:    	ldr	w20, [x19, #0x54]  // guest 0x2510e, sampled 0
6eacbefd14:    	strh	w20, [x19, #0x222]  // guest 0x2510e, sampled 0
6eacbefd18:    	mov	w20, #0x510e            // =20750  // guest 0x2510e, sampled 0
6eacbefd1c:    	movk	w20, #0x2, lsl #16  // guest 0x2510e, sampled 0
6eacbefd20:    	str	w20, [x19, #0x228]  // guest 0x2510e, sampled 0
6eacbefd24:    	ldr	w20, [x19, #0x10]  // guest 0x25111, sampled 0
6eacbefd28:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25111, sampled 0
6eacbefd2c:    	and	x16, x16, x20, lsr #7  // guest 0x25111, sampled 1
6eacbefd30:    	add	x17, x17, x16  // guest 0x25111, sampled 0
6eacbefd34:    	ldp	x16, x17, [x17]  // guest 0x25111, sampled 0
6eacbefd38:    	and	w30, w20, #0xfffff003  // guest 0x25111, sampled 0
6eacbefd3c:    	cmp	w16, w30  // guest 0x25111, sampled 0
6eacbefd40:    	b.ne	0x6eacbf01c4 <trace+0x15c4>  // guest 0x25111, sampled 0
6eacbefd44:    	add	x30, x17, w20, uxtw  // guest 0x25111, sampled 0
6eacbefd48:    	ldapr	w21, [x30]  // guest 0x25111, sampled 0
6eacbefd4c:    	add	w20, w20, #0x4  // guest 0x25111, sampled 0
6eacbefd50:    	str	w20, [x19, #0x10]  // guest 0x25111, sampled 0
6eacbefd54:    	str	w21, [x19, #0x1c]  // guest 0x25111, sampled 0
6eacbefd58:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25112, sampled 0
6eacbefd5c:    	and	x16, x16, x20, lsr #7  // guest 0x25112, sampled 0
6eacbefd60:    	add	x17, x17, x16  // guest 0x25112, sampled 0
6eacbefd64:    	ldp	x16, x17, [x17]  // guest 0x25112, sampled 0
6eacbefd68:    	and	w30, w20, #0xfffff003  // guest 0x25112, sampled 0
6eacbefd6c:    	cmp	w16, w30  // guest 0x25112, sampled 0
6eacbefd70:    	b.ne	0x6eacbf01f0 <trace+0x15f0>  // guest 0x25112, sampled 0
6eacbefd74:    	add	x30, x17, w20, uxtw  // guest 0x25112, sampled 0
6eacbefd78:    	ldapr	w21, [x30]  // guest 0x25112, sampled 0
6eacbefd7c:    	add	w20, w20, #0x4  // guest 0x25112, sampled 0
6eacbefd80:    	str	w20, [x19, #0x10]  // guest 0x25112, sampled 0
6eacbefd84:    	str	w21, [x19, #0x18]  // guest 0x25112, sampled 0
6eacbefd88:    	sturb	w22, [x19, #-0xc]  // guest 0x25112, sampled 0
6eacbefd8c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25113, sampled 0
6eacbefd90:    	and	x16, x16, x20, lsr #7  // guest 0x25113, sampled 0
6eacbefd94:    	add	x17, x17, x16  // guest 0x25113, sampled 0
6eacbefd98:    	ldp	x16, x17, [x17]  // guest 0x25113, sampled 0
6eacbefd9c:    	and	w30, w20, #0xfffff003  // guest 0x25113, sampled 0
6eacbefda0:    	cmp	w16, w30  // guest 0x25113, sampled 0
6eacbefda4:    	b.ne	0x6eacbf021c <trace+0x161c>  // guest 0x25113, sampled 0
6eacbefda8:    	add	x30, x17, w20, uxtw  // guest 0x25113, sampled 0
6eacbefdac:    	ldapr	w21, [x30]  // guest 0x25113, sampled 0
6eacbefdb0:    	add	w20, w20, #0x4  // guest 0x25113, sampled 0
6eacbefdb4:    	str	w20, [x19, #0x10]  // guest 0x25113, sampled 0
6eacbefdb8:    	str	w21, [x19, #0x20]  // guest 0x25113, sampled 0
6eacbefdbc:    	mov	x0, x19  // guest 0x25113, sampled 0
6eacbefdc0:    	bl	0x6ea842253c <trace+0xfffffffffb83393c>  // guest 0x25113, sampled 0
6eacbefdc4:    	br	x0  // guest 0x25113, sampled 0
6eacbefdc8:    	adr	x0, 0x6eacbeeb43 <trace+0xffffffffffffff43>  // guest 0x25113, sampled 0
6eacbefdcc:    	b	0x6ea842202c <trace+0xfffffffffb83342c>  // guest 0x25113, sampled 0
6eacbefdd0:    	mov	w1, w21
6eacbefdd4:    	mov	w2, w22
6eacbefdd8:    	mov	x0, x19
6eacbefddc:    	mov	w3, #0x4045             // =16453
6eacbefde0:    	movk	w3, #0x1, lsl #16
6eacbefde4:    	adr	x4, 0x6eacbeec40 <trace+0x40>
6eacbefde8:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8f000>
6eacbefdec:    	add	x16, x16, #0xc38
6eacbefdf0:    	blr	x16
6eacbefdf4:    	dmb	ishld
6eacbefdf8:    	b	0x6eacbeec40 <trace+0x40>
6eacbefdfc:    	mov	w1, w21
6eacbefe00:    	mov	w2, w22
6eacbefe04:    	mov	x0, x19
6eacbefe08:    	mov	w3, #0x4045             // =16453
6eacbefe0c:    	movk	w3, #0x1, lsl #16
6eacbefe10:    	adr	x4, 0x6eacbeec74 <trace+0x74>
6eacbefe14:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8f000>
6eacbefe18:    	add	x16, x16, #0xc38
6eacbefe1c:    	blr	x16
6eacbefe20:    	dmb	ishld
6eacbefe24:    	b	0x6eacbeec74 <trace+0x74>
6eacbefe28:    	mov	w1, w21
6eacbefe2c:    	mov	x0, x19
6eacbefe30:    	mov	w2, #0x4045             // =16453
6eacbefe34:    	movk	w2, #0x1, lsl #16
6eacbefe38:    	adr	x3, 0x6eacbeeca0 <trace+0xa0>
6eacbefe3c:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8f000>
6eacbefe40:    	add	x16, x16, #0x58
6eacbefe44:    	blr	x16
6eacbefe48:    	mov	w21, w0
6eacbefe4c:    	dmb	ishld
6eacbefe50:    	b	0x6eacbeeca0 <trace+0xa0>
6eacbefe54:    	mov	w1, w22
6eacbefe58:    	mov	x0, x19
6eacbefe5c:    	mov	w2, #0x4045             // =16453
6eacbefe60:    	movk	w2, #0x1, lsl #16
6eacbefe64:    	adr	x3, 0x6eacbeeccc <trace+0xcc>
6eacbefe68:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8f000>
6eacbefe6c:    	add	x16, x16, #0x58
6eacbefe70:    	blr	x16
6eacbefe74:    	mov	w22, w0
6eacbefe78:    	dmb	ishld
6eacbefe7c:    	b	0x6eacbeeccc <trace+0xcc>
6eacbefe80:    	mov	w1, w20
6eacbefe84:    	mov	x0, x19
6eacbefe88:    	mov	w2, #0x4045             // =16453
6eacbefe8c:    	movk	w2, #0x1, lsl #16
6eacbefe90:    	adr	x3, 0x6eacbeecf8 <trace+0xf8>
6eacbefe94:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8f000>
6eacbefe98:    	add	x16, x16, #0x58
6eacbefe9c:    	blr	x16
6eacbefea0:    	mov	w20, w0
6eacbefea4:    	dmb	ishld
6eacbefea8:    	b	0x6eacbeecf8 <trace+0xf8>
6eacbefeac:    	mov	w1, w21
6eacbefeb0:    	mov	x0, x19
6eacbefeb4:    	mov	w2, #0x4045             // =16453
6eacbefeb8:    	movk	w2, #0x1, lsl #16
6eacbefebc:    	adr	x3, 0x6eacbeed20 <trace+0x120>
6eacbefec0:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8f000>
6eacbefec4:    	add	x16, x16, #0x58
6eacbefec8:    	blr	x16
6eacbefecc:    	mov	w2, w0
6eacbefed0:    	dmb	ishld
6eacbefed4:    	b	0x6eacbeed20 <trace+0x120>
6eacbefed8:    	mov	w1, w22
6eacbefedc:    	mov	x0, x19
6eacbefee0:    	mov	w2, #0x4045             // =16453
6eacbefee4:    	movk	w2, #0x1, lsl #16
6eacbefee8:    	adr	x3, 0x6eacbeedb0 <trace+0x1b0>
6eacbefeec:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8f000>
6eacbefef0:    	add	x16, x16, #0x58
6eacbefef4:    	blr	x16
6eacbefef8:    	mov	w2, w0
6eacbefefc:    	dmb	ishld
6eacbeff00:    	b	0x6eacbeedb0 <trace+0x1b0>
6eacbeff04:    	mov	w1, w21
6eacbeff08:    	mov	x0, x19
6eacbeff0c:    	mov	w2, #0x4045             // =16453
6eacbeff10:    	movk	w2, #0x1, lsl #16
6eacbeff14:    	adr	x3, 0x6eacbeee3c <trace+0x23c>
6eacbeff18:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8f000>
6eacbeff1c:    	add	x16, x16, #0x58
6eacbeff20:    	blr	x16
6eacbeff24:    	mov	w2, w0
6eacbeff28:    	dmb	ishld
6eacbeff2c:    	b	0x6eacbeee3c <trace+0x23c>
6eacbeff30:    	mov	w1, w20
6eacbeff34:    	mov	x0, x19
6eacbeff38:    	mov	w2, #0x4045             // =16453
6eacbeff3c:    	movk	w2, #0x1, lsl #16
6eacbeff40:    	adr	x3, 0x6eacbeeeec <trace+0x2ec>
6eacbeff44:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8f000>
6eacbeff48:    	add	x16, x16, #0x58
6eacbeff4c:    	blr	x16
6eacbeff50:    	mov	w2, w0
6eacbeff54:    	dmb	ishld
6eacbeff58:    	b	0x6eacbeeeec <trace+0x2ec>
6eacbeff5c:    	mov	w1, w20
6eacbeff60:    	mov	x0, x19
6eacbeff64:    	mov	w2, #0x4045             // =16453
6eacbeff68:    	movk	w2, #0x1, lsl #16
6eacbeff6c:    	adr	x3, 0x6eacbeefa0 <trace+0x3a0>
6eacbeff70:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8f000>
6eacbeff74:    	add	x16, x16, #0x58
6eacbeff78:    	blr	x16
6eacbeff7c:    	mov	w2, w0
6eacbeff80:    	dmb	ishld
6eacbeff84:    	b	0x6eacbeefa0 <trace+0x3a0>
6eacbeff88:    	mov	w1, w20
6eacbeff8c:    	mov	x0, x19
6eacbeff90:    	mov	w2, #0x4045             // =16453
6eacbeff94:    	movk	w2, #0x1, lsl #16
6eacbeff98:    	adr	x3, 0x6eacbef054 <trace+0x454>
6eacbeff9c:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8f000>
6eacbeffa0:    	add	x16, x16, #0x58
6eacbeffa4:    	blr	x16
6eacbeffa8:    	mov	w2, w0
6eacbeffac:    	dmb	ishld
6eacbeffb0:    	b	0x6eacbef054 <trace+0x454>
6eacbeffb4:    	mov	w1, w22
6eacbeffb8:    	mov	x0, x19
6eacbeffbc:    	mov	w2, #0x4045             // =16453
6eacbeffc0:    	movk	w2, #0x1, lsl #16
6eacbeffc4:    	adr	x3, 0x6eacbef170 <trace+0x570>
6eacbeffc8:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8f000>
6eacbeffcc:    	add	x16, x16, #0x58
6eacbeffd0:    	blr	x16
6eacbeffd4:    	mov	w2, w0
6eacbeffd8:    	dmb	ishld
6eacbeffdc:    	b	0x6eacbef170 <trace+0x570>
6eacbeffe0:    	mov	w1, w21
6eacbeffe4:    	mov	x0, x19
6eacbeffe8:    	mov	w2, #0x4045             // =16453
6eacbeffec:    	movk	w2, #0x1, lsl #16
6eacbefff0:    	adr	x3, 0x6eacbef258 <trace+0x658>
6eacbefff4:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8f000>
6eacbefff8:    	add	x16, x16, #0x58
6eacbefffc:    	blr	x16
6eacbf0000:    	mov	w2, w0
6eacbf0004:    	dmb	ishld
6eacbf0008:    	b	0x6eacbef258 <trace+0x658>
6eacbf000c:    	mov	w1, w20
6eacbf0010:    	mov	x0, x19
6eacbf0014:    	mov	w2, #0x4045             // =16453
6eacbf0018:    	movk	w2, #0x1, lsl #16
6eacbf001c:    	adr	x3, 0x6eacbef308 <trace+0x708>
6eacbf0020:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8e000>
6eacbf0024:    	add	x16, x16, #0x58
6eacbf0028:    	blr	x16
6eacbf002c:    	mov	w2, w0
6eacbf0030:    	dmb	ishld
6eacbf0034:    	b	0x6eacbef308 <trace+0x708>
6eacbf0038:    	mov	w1, w22
6eacbf003c:    	mov	x0, x19
6eacbf0040:    	mov	w2, #0x4045             // =16453
6eacbf0044:    	movk	w2, #0x1, lsl #16
6eacbf0048:    	adr	x3, 0x6eacbef424 <trace+0x824>
6eacbf004c:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8e000>
6eacbf0050:    	add	x16, x16, #0x58
6eacbf0054:    	blr	x16
6eacbf0058:    	mov	w2, w0
6eacbf005c:    	dmb	ishld
6eacbf0060:    	b	0x6eacbef424 <trace+0x824>
6eacbf0064:    	mov	w1, w21
6eacbf0068:    	mov	x0, x19
6eacbf006c:    	mov	w2, #0x4045             // =16453
6eacbf0070:    	movk	w2, #0x1, lsl #16
6eacbf0074:    	adr	x3, 0x6eacbef50c <trace+0x90c>
6eacbf0078:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8e000>
6eacbf007c:    	add	x16, x16, #0x58
6eacbf0080:    	blr	x16
6eacbf0084:    	mov	w2, w0
6eacbf0088:    	dmb	ishld
6eacbf008c:    	b	0x6eacbef50c <trace+0x90c>
6eacbf0090:    	mov	w1, w20
6eacbf0094:    	mov	x0, x19
6eacbf0098:    	mov	w2, #0x4045             // =16453
6eacbf009c:    	movk	w2, #0x1, lsl #16
6eacbf00a0:    	adr	x3, 0x6eacbef5bc <trace+0x9bc>
6eacbf00a4:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8e000>
6eacbf00a8:    	add	x16, x16, #0x58
6eacbf00ac:    	blr	x16
6eacbf00b0:    	mov	w2, w0
6eacbf00b4:    	dmb	ishld
6eacbf00b8:    	b	0x6eacbef5bc <trace+0x9bc>
6eacbf00bc:    	mov	w1, w23
6eacbf00c0:    	mov	x0, x19
6eacbf00c4:    	mov	w2, #0x4045             // =16453
6eacbf00c8:    	movk	w2, #0x1, lsl #16
6eacbf00cc:    	adr	x3, 0x6eacbef82c <trace+0xc2c>
6eacbf00d0:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8e000>
6eacbf00d4:    	add	x16, x16, #0x58
6eacbf00d8:    	blr	x16
6eacbf00dc:    	mov	w2, w0
6eacbf00e0:    	dmb	ishld
6eacbf00e4:    	b	0x6eacbef82c <trace+0xc2c>
6eacbf00e8:    	mov	w1, w21
6eacbf00ec:    	mov	x0, x19
6eacbf00f0:    	mov	w2, #0x4045             // =16453
6eacbf00f4:    	movk	w2, #0x1, lsl #16
6eacbf00f8:    	adr	x3, 0x6eacbef914 <trace+0xd14>
6eacbf00fc:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8e000>
6eacbf0100:    	add	x16, x16, #0x58
6eacbf0104:    	blr	x16
6eacbf0108:    	mov	w2, w0
6eacbf010c:    	dmb	ishld
6eacbf0110:    	b	0x6eacbef914 <trace+0xd14>
6eacbf0114:    	mov	w1, w20
6eacbf0118:    	mov	x0, x19
6eacbf011c:    	mov	w2, #0x4045             // =16453
6eacbf0120:    	movk	w2, #0x1, lsl #16
6eacbf0124:    	adr	x3, 0x6eacbef9c4 <trace+0xdc4>
6eacbf0128:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8e000>
6eacbf012c:    	add	x16, x16, #0x58
6eacbf0130:    	blr	x16
6eacbf0134:    	mov	w2, w0
6eacbf0138:    	dmb	ishld
6eacbf013c:    	b	0x6eacbef9c4 <trace+0xdc4>
6eacbf0140:    	mov	w1, w21
6eacbf0144:    	mov	w2, w0
6eacbf0148:    	mov	x0, x19
6eacbf014c:    	mov	w3, #0x4045             // =16453
6eacbf0150:    	movk	w3, #0x1, lsl #16
6eacbf0154:    	adr	x4, 0x6eacbefbe4 <trace+0xfe4>
6eacbf0158:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8e000>
6eacbf015c:    	add	x16, x16, #0xc38
6eacbf0160:    	blr	x16
6eacbf0164:    	dmb	ishld
6eacbf0168:    	b	0x6eacbefbe4 <trace+0xfe4>
6eacbf016c:    	mov	w1, w23
6eacbf0170:    	mov	w2, w0
6eacbf0174:    	mov	x0, x19
6eacbf0178:    	mov	w3, #0x4045             // =16453
6eacbf017c:    	movk	w3, #0x1, lsl #16
6eacbf0180:    	adr	x4, 0x6eacbefc68 <trace+0x1068>
6eacbf0184:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8e000>
6eacbf0188:    	add	x16, x16, #0xc38
6eacbf018c:    	blr	x16
6eacbf0190:    	dmb	ishld
6eacbf0194:    	b	0x6eacbefc68 <trace+0x1068>
6eacbf0198:    	mov	w1, w21
6eacbf019c:    	mov	w2, w0
6eacbf01a0:    	mov	x0, x19
6eacbf01a4:    	mov	w3, #0x4045             // =16453
6eacbf01a8:    	movk	w3, #0x1, lsl #16
6eacbf01ac:    	adr	x4, 0x6eacbefcec <trace+0x10ec>
6eacbf01b0:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8e000>
6eacbf01b4:    	add	x16, x16, #0xc38
6eacbf01b8:    	blr	x16
6eacbf01bc:    	dmb	ishld
6eacbf01c0:    	b	0x6eacbefcec <trace+0x10ec>
6eacbf01c4:    	mov	w1, w20
6eacbf01c8:    	mov	x0, x19
6eacbf01cc:    	mov	w2, #0x4045             // =16453
6eacbf01d0:    	movk	w2, #0x1, lsl #16
6eacbf01d4:    	adr	x3, 0x6eacbefd4c <trace+0x114c>
6eacbf01d8:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8e000>
6eacbf01dc:    	add	x16, x16, #0x58
6eacbf01e0:    	blr	x16
6eacbf01e4:    	mov	w21, w0
6eacbf01e8:    	dmb	ishld
6eacbf01ec:    	b	0x6eacbefd4c <trace+0x114c>
6eacbf01f0:    	mov	w1, w20
6eacbf01f4:    	mov	x0, x19
6eacbf01f8:    	mov	w2, #0x4045             // =16453
6eacbf01fc:    	movk	w2, #0x1, lsl #16
6eacbf0200:    	adr	x3, 0x6eacbefd7c <trace+0x117c>
6eacbf0204:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8e000>
6eacbf0208:    	add	x16, x16, #0x58
6eacbf020c:    	blr	x16
6eacbf0210:    	mov	w21, w0
6eacbf0214:    	dmb	ishld
6eacbf0218:    	b	0x6eacbefd7c <trace+0x117c>
6eacbf021c:    	mov	w1, w20
6eacbf0220:    	mov	x0, x19
6eacbf0224:    	mov	w2, #0x4045             // =16453
6eacbf0228:    	movk	w2, #0x1, lsl #16
6eacbf022c:    	adr	x3, 0x6eacbefdb0 <trace+0x11b0>
6eacbf0230:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8e000>
6eacbf0234:    	add	x16, x16, #0x58
6eacbf0238:    	blr	x16
6eacbf023c:    	mov	w21, w0
6eacbf0240:    	dmb	ishld
6eacbf0244:    	b	0x6eacbefdb0 <trace+0x11b0>