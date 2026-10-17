
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-2fa4e8-6eabf7fe00.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006eabf7fe00 <trace>:
6eabf7fe00:    	ldur	w20, [x19, #-0x10]  // guest 0x2fa4e8, sampled 0
6eabf7fe04:    	tbnz	w20, #0x1f, 0x6eabf800ac <trace+0x2ac>  // guest 0x2fa4e8, sampled 1
6eabf7fe08:    	sturb	wzr, [x19, #-0xc]  // guest 0x2fa4e8, sampled 0
6eabf7fe0c:    	ldr	w20, [x19, #0x10]  // guest 0x2fa4e8, sampled 0
6eabf7fe10:    	sub	w20, w20, #0x4  // guest 0x2fa4e8, sampled 0
6eabf7fe14:    	mov	w21, w20  // guest 0x2fa4e8, sampled 0
6eabf7fe18:    	ldr	w22, [x19, #0x14]  // guest 0x2fa4e8, sampled 0
6eabf7fe1c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2fa4e8, sampled 0
6eabf7fe20:    	and	x16, x16, x21, lsr #7  // guest 0x2fa4e8, sampled 0
6eabf7fe24:    	add	x17, x17, x16  // guest 0x2fa4e8, sampled 0
6eabf7fe28:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2fa4e8, sampled 0
6eabf7fe2c:    	and	w30, w21, #0xfffff003  // guest 0x2fa4e8, sampled 2
6eabf7fe30:    	cmp	w16, w30  // guest 0x2fa4e8, sampled 0
6eabf7fe34:    	b.ne	0x6eabf800b4 <trace+0x2b4>  // guest 0x2fa4e8, sampled 0
6eabf7fe38:    	add	x30, x17, w21, uxtw  // guest 0x2fa4e8, sampled 1
6eabf7fe3c:    	stlr	w22, [x30]  // guest 0x2fa4e8, sampled 0
6eabf7fe40:    	str	w20, [x19, #0x14]  // guest 0x2fa4e9, sampled 0
6eabf7fe44:    	sub	w20, w20, #0x20  // guest 0x2fa4eb, sampled 0
6eabf7fe48:    	and	w20, w20, #0xfffffff0  // guest 0x2fa4ee, sampled 0
6eabf7fe4c:    	str	w20, [x19, #0x10]  // guest 0x2fa4ee, sampled 0
6eabf7fe50:    	str	w20, [x19, #0x28]  // guest 0x2fa4ee, sampled 0
6eabf7fe54:    	ldr	w21, [x19, #0x188]  // guest 0x2fa4f1, sampled 0
6eabf7fe58:    	sub	w21, w21, #0x1  // guest 0x2fa4f1, sampled 0
6eabf7fe5c:    	and	w21, w21, #0x7  // guest 0x2fa4f1, sampled 0
6eabf7fe60:    	str	w21, [x19, #0x188]  // guest 0x2fa4f1, sampled 1
6eabf7fe64:    	sxtw	x22, w21  // guest 0x2fa4f1, sampled 0
6eabf7fe68:    	add	x22, x22, x19  // guest 0x2fa4f1, sampled 0
6eabf7fe6c:    	strb	wzr, [x22, #0x190]  // guest 0x2fa4f1, sampled 0
6eabf7fe70:    	lsl	w22, w21, #4  // guest 0x2fa4f1, sampled 0
6eabf7fe74:    	add	w22, w22, #0x1a0  // guest 0x2fa4f1, sampled 0
6eabf7fe78:    	sxtw	x22, w22  // guest 0x2fa4f1, sampled 0
6eabf7fe7c:    	add	x22, x22, x19  // guest 0x2fa4f1, sampled 0
6eabf7fe80:    	add	w23, w21, #0x1  // guest 0x2fa4f1, sampled 0
6eabf7fe84:    	and	w23, w23, #0x7  // guest 0x2fa4f1, sampled 0
6eabf7fe88:    	lsl	w23, w23, #4  // guest 0x2fa4f1, sampled 1
6eabf7fe8c:    	add	w23, w23, #0x1a0  // guest 0x2fa4f1, sampled 0
6eabf7fe90:    	sxtw	x23, w23  // guest 0x2fa4f1, sampled 1
6eabf7fe94:    	add	x23, x23, x19  // guest 0x2fa4f1, sampled 0
6eabf7fe98:    	ldr	x24, [x23]  // guest 0x2fa4f1, sampled 0
6eabf7fe9c:    	ldrh	w23, [x23, #0x8]  // guest 0x2fa4f1, sampled 2
6eabf7fea0:    	str	x24, [x22]  // guest 0x2fa4f1, sampled 0
6eabf7fea4:    	strh	w23, [x22, #0x8]  // guest 0x2fa4f1, sampled 0
6eabf7fea8:    	ldr	w22, [x19, #0x54]  // guest 0x2fa4f1, sampled 0
6eabf7feac:    	strh	w22, [x19, #0x222]  // guest 0x2fa4f1, sampled 0
6eabf7feb0:    	mov	w22, #0xa4f1            // =42225  // guest 0x2fa4f1, sampled 0
6eabf7feb4:    	movk	w22, #0x2f, lsl #16  // guest 0x2fa4f1, sampled 0
6eabf7feb8:    	str	w22, [x19, #0x228]  // guest 0x2fa4f1, sampled 0
6eabf7febc:    	add	w22, w20, #0x18  // guest 0x2fa4f3, sampled 0
6eabf7fec0:    	mov	w23, w22  // guest 0x2fa4f3, sampled 0
6eabf7fec4:    	lsl	w21, w21, #4  // guest 0x2fa4f3, sampled 0
6eabf7fec8:    	add	w21, w21, #0x1a0  // guest 0x2fa4f3, sampled 0
6eabf7fecc:    	sxtw	x21, w21  // guest 0x2fa4f3, sampled 0
6eabf7fed0:    	add	x1, x21, x19  // guest 0x2fa4f3, sampled 0
6eabf7fed4:    	mov	x0, x19  // guest 0x2fa4f3, sampled 0
6eabf7fed8:    	adrp	x16, 0x6efc8aa000 <trace+0x5092b000>  // guest 0x2fa4f3, sampled 0
6eabf7fedc:    	add	x16, x16, #0x5c0  // guest 0x2fa4f3, sampled 0
6eabf7fee0:    	blr	x16  // guest 0x2fa4f3, sampled 0
6eabf7fee4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2fa4f3, sampled 1
6eabf7fee8:    	and	x16, x16, x22, lsr #7  // guest 0x2fa4f3, sampled 0
6eabf7feec:    	add	x17, x17, x16  // guest 0x2fa4f3, sampled 0
6eabf7fef0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2fa4f3, sampled 0
6eabf7fef4:    	and	w30, w22, #0xfffff003  // guest 0x2fa4f3, sampled 0
6eabf7fef8:    	cmp	w16, w30  // guest 0x2fa4f3, sampled 0
6eabf7fefc:    	b.ne	0x6eabf800e0 <trace+0x2e0>  // guest 0x2fa4f3, sampled 0
6eabf7ff00:    	add	x30, x17, w22, uxtw  // guest 0x2fa4f3, sampled 0
6eabf7ff04:    	stlr	w0, [x30]  // guest 0x2fa4f3, sampled 0
6eabf7ff08:    	ldr	w21, [x19, #0x64]  // guest 0x2fa4f3, sampled 0
6eabf7ff0c:    	strh	w21, [x19, #0x224]  // guest 0x2fa4f3, sampled 0
6eabf7ff10:    	str	w23, [x19, #0x230]  // guest 0x2fa4f3, sampled 0
6eabf7ff14:    	ldr	w21, [x19, #0x54]  // guest 0x2fa4f3, sampled 0
6eabf7ff18:    	strh	w21, [x19, #0x222]  // guest 0x2fa4f3, sampled 0
6eabf7ff1c:    	mov	w21, #0xa4f3            // =42227  // guest 0x2fa4f3, sampled 0
6eabf7ff20:    	movk	w21, #0x2f, lsl #16  // guest 0x2fa4f3, sampled 0
6eabf7ff24:    	str	w21, [x19, #0x228]  // guest 0x2fa4f3, sampled 0
6eabf7ff28:    	add	w20, w20, #0x10  // guest 0x2fa4f7, sampled 1
6eabf7ff2c:    	mov	w21, w20  // guest 0x2fa4f7, sampled 0
6eabf7ff30:    	mov	x0, x19  // guest 0x2fa4f7, sampled 0
6eabf7ff34:    	adrp	x16, 0x6efc8aa000 <trace+0x5092b000>  // guest 0x2fa4f7, sampled 0
6eabf7ff38:    	add	x16, x16, #0xe5c  // guest 0x2fa4f7, sampled 0
6eabf7ff3c:    	blr	x16  // guest 0x2fa4f7, sampled 0
6eabf7ff40:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2fa4f7, sampled 0
6eabf7ff44:    	and	x16, x16, x20, lsr #7  // guest 0x2fa4f7, sampled 0
6eabf7ff48:    	add	x17, x17, x16  // guest 0x2fa4f7, sampled 0
6eabf7ff4c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2fa4f7, sampled 0
6eabf7ff50:    	and	w30, w20, #0xfffff007  // guest 0x2fa4f7, sampled 2
6eabf7ff54:    	cmp	w16, w30  // guest 0x2fa4f7, sampled 0
6eabf7ff58:    	b.ne	0x6eabf8010c <trace+0x30c>  // guest 0x2fa4f7, sampled 0
6eabf7ff5c:    	add	x30, x17, w20, uxtw  // guest 0x2fa4f7, sampled 0
6eabf7ff60:    	stlr	x0, [x30]  // guest 0x2fa4f7, sampled 0
6eabf7ff64:    	ldr	w20, [x19, #0x188]  // guest 0x2fa4f7, sampled 0
6eabf7ff68:    	sxtw	x22, w20  // guest 0x2fa4f7, sampled 0
6eabf7ff6c:    	add	x22, x22, x19  // guest 0x2fa4f7, sampled 0
6eabf7ff70:    	mov	w23, #0x1               // =1  // guest 0x2fa4f7, sampled 0
6eabf7ff74:    	strb	w23, [x22, #0x190]  // guest 0x2fa4f7, sampled 0
6eabf7ff78:    	add	w20, w20, w23  // guest 0x2fa4f7, sampled 0
6eabf7ff7c:    	and	w20, w20, #0x7  // guest 0x2fa4f7, sampled 0
6eabf7ff80:    	str	w20, [x19, #0x188]  // guest 0x2fa4f7, sampled 0
6eabf7ff84:    	ldr	w20, [x19, #0x64]  // guest 0x2fa4f7, sampled 1
6eabf7ff88:    	strh	w20, [x19, #0x224]  // guest 0x2fa4f7, sampled 0
6eabf7ff8c:    	str	w21, [x19, #0x230]  // guest 0x2fa4f7, sampled 0
6eabf7ff90:    	ldr	w20, [x19, #0x54]  // guest 0x2fa4f7, sampled 0
6eabf7ff94:    	strh	w20, [x19, #0x222]  // guest 0x2fa4f7, sampled 1
6eabf7ff98:    	mov	w20, #0xa4f7            // =42231  // guest 0x2fa4f7, sampled 0
6eabf7ff9c:    	movk	w20, #0x2f, lsl #16  // guest 0x2fa4f7, sampled 0
6eabf7ffa0:    	str	w20, [x19, #0x228]  // guest 0x2fa4f7, sampled 0
6eabf7ffa4:    	ldr	w20, [x19, #0x10]  // guest 0x2fa4fb, sampled 0
6eabf7ffa8:    	add	w20, w20, #0x10  // guest 0x2fa4fb, sampled 0
6eabf7ffac:    	mov	w21, w20  // guest 0x2fa4fb, sampled 0
6eabf7ffb0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2fa4fb, sampled 0
6eabf7ffb4:    	and	x16, x16, x20, lsr #7  // guest 0x2fa4fb, sampled 0
6eabf7ffb8:    	add	x17, x17, x16  // guest 0x2fa4fb, sampled 0
6eabf7ffbc:    	ldp	x16, x17, [x17]  // guest 0x2fa4fb, sampled 0
6eabf7ffc0:    	and	w30, w20, #0xfffff007  // guest 0x2fa4fb, sampled 0
6eabf7ffc4:    	cmp	w16, w30  // guest 0x2fa4fb, sampled 0
6eabf7ffc8:    	b.ne	0x6eabf80138 <trace+0x338>  // guest 0x2fa4fb, sampled 0
6eabf7ffcc:    	add	x30, x17, w20, uxtw  // guest 0x2fa4fb, sampled 1
6eabf7ffd0:    	ldapr	x1, [x30]  // guest 0x2fa4fb, sampled 0
6eabf7ffd4:    	mov	x0, x19  // guest 0x2fa4fb, sampled 1
6eabf7ffd8:    	adrp	x16, 0x6efc8aa000 <trace+0x5092b000>  // guest 0x2fa4fb, sampled 0
6eabf7ffdc:    	add	x16, x16, #0xb4c  // guest 0x2fa4fb, sampled 0
6eabf7ffe0:    	blr	x16  // guest 0x2fa4fb, sampled 0
6eabf7ffe4:    	ldr	w20, [x19, #0x64]  // guest 0x2fa4fb, sampled 0
6eabf7ffe8:    	strh	w20, [x19, #0x224]  // guest 0x2fa4fb, sampled 0
6eabf7ffec:    	str	w21, [x19, #0x230]  // guest 0x2fa4fb, sampled 0
6eabf7fff0:    	ldr	w20, [x19, #0x54]  // guest 0x2fa4fb, sampled 0
6eabf7fff4:    	strh	w20, [x19, #0x222]  // guest 0x2fa4fb, sampled 0
6eabf7fff8:    	mov	w20, #0xa4fb            // =42235  // guest 0x2fa4fb, sampled 0
6eabf7fffc:    	movk	w20, #0x2f, lsl #16  // guest 0x2fa4fb, sampled 0
6eabf80000:    	str	w20, [x19, #0x228]  // guest 0x2fa4fb, sampled 0
6eabf80004:    	ldr	w20, [x19, #0x10]  // guest 0x2fa4ff, sampled 0
6eabf80008:    	add	w21, w20, #0x18  // guest 0x2fa4ff, sampled 2
6eabf8000c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2fa4ff, sampled 0
6eabf80010:    	and	x16, x16, x21, lsr #7  // guest 0x2fa4ff, sampled 0
6eabf80014:    	add	x17, x17, x16  // guest 0x2fa4ff, sampled 0
6eabf80018:    	ldp	x16, x17, [x17]  // guest 0x2fa4ff, sampled 0
6eabf8001c:    	and	w30, w21, #0xfffff003  // guest 0x2fa4ff, sampled 1
6eabf80020:    	cmp	w16, w30  // guest 0x2fa4ff, sampled 0
6eabf80024:    	b.ne	0x6eabf80164 <trace+0x364>  // guest 0x2fa4ff, sampled 0
6eabf80028:    	add	x30, x17, w21, uxtw  // guest 0x2fa4ff, sampled 0
6eabf8002c:    	ldapr	w21, [x30]  // guest 0x2fa4ff, sampled 0
6eabf80030:    	str	w21, [x19, #0x8]  // guest 0x2fa4ff, sampled 0
6eabf80034:    	add	w20, w20, #0x10  // guest 0x2fa503, sampled 0
6eabf80038:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2fa503, sampled 0
6eabf8003c:    	and	x16, x16, x20, lsr #7  // guest 0x2fa503, sampled 0
6eabf80040:    	add	x17, x17, x16  // guest 0x2fa503, sampled 0
6eabf80044:    	ldp	x16, x17, [x17]  // guest 0x2fa503, sampled 0
6eabf80048:    	and	w30, w20, #0xfffff003  // guest 0x2fa503, sampled 0
6eabf8004c:    	cmp	w16, w30  // guest 0x2fa503, sampled 0
6eabf80050:    	b.ne	0x6eabf80190 <trace+0x390>  // guest 0x2fa503, sampled 0
6eabf80054:    	add	x30, x17, w20, uxtw  // guest 0x2fa503, sampled 0
6eabf80058:    	ldapr	w20, [x30]  // guest 0x2fa503, sampled 0
6eabf8005c:    	str	w20, [x19]  // guest 0x2fa503, sampled 0
6eabf80060:    	str	w20, [x19, #0x28]  // guest 0x2fa507, sampled 0
6eabf80064:    	sturb	w23, [x19, #-0xc]  // guest 0x2fa507, sampled 0
6eabf80068:    	mov	w21, #0x1a              // =26  // guest 0x2fa509, sampled 0
6eabf8006c:    	str	w21, [x19, #0x34]  // guest 0x2fa509, sampled 0
6eabf80070:    	cbz	w20, 0x6eabf80090 <trace+0x290>  // guest 0x2fa509, sampled 0
6eabf80074:    	b	0x6eabf80074 <trace+0x274>  // guest 0x2fa509, sampled 0
6eabf80078:    	br	x16  // guest 0x2fa509, sampled 0
6eabf8007c:    	mov	w20, #0xa50b            // =42251  // guest 0x2fa509, sampled 0
6eabf80080:    	movk	w20, #0x2f, lsl #16  // guest 0x2fa509, sampled 0
6eabf80084:    	str	w20, [x19, #0x20]  // guest 0x2fa509, sampled 0
6eabf80088:    	adr	x0, 0x6eabf7fd41 <trace+0xffffffffffffff41>  // guest 0x2fa509, sampled 0
6eabf8008c:    	b	0x6ea842202c <trace+0xfffffffffc4a222c>  // guest 0x2fa509, sampled 0
6eabf80090:    	b	0x6eabf80090 <trace+0x290>  // guest 0x2fa509, sampled 0
6eabf80094:    	br	x16  // guest 0x2fa509, sampled 0
6eabf80098:    	mov	w20, #0xa547            // =42311  // guest 0x2fa509, sampled 0
6eabf8009c:    	movk	w20, #0x2f, lsl #16  // guest 0x2fa509, sampled 0
6eabf800a0:    	str	w20, [x19, #0x20]  // guest 0x2fa509, sampled 0
6eabf800a4:    	adr	x0, 0x6eabf7fd40 <trace+0xffffffffffffff40>  // guest 0x2fa509, sampled 0
6eabf800a8:    	b	0x6ea842202c <trace+0xfffffffffc4a222c>  // guest 0x2fa509, sampled 0
6eabf800ac:    	adr	x0, 0x6eabf7fd43 <trace+0xffffffffffffff43>  // guest 0x2fa509, sampled 0
6eabf800b0:    	b	0x6ea842202c <trace+0xfffffffffc4a222c>  // guest 0x2fa509, sampled 0
6eabf800b4:    	mov	w1, w21
6eabf800b8:    	mov	w2, w22
6eabf800bc:    	mov	x0, x19
6eabf800c0:    	mov	w3, #0x4045             // =16453
6eabf800c4:    	movk	w3, #0x1, lsl #16
6eabf800c8:    	adr	x4, 0x6eabf7fe40 <trace+0x40>
6eabf800cc:    	adrp	x16, 0x6efc87d000 <trace+0x508fd000>
6eabf800d0:    	add	x16, x16, #0xc38
6eabf800d4:    	blr	x16
6eabf800d8:    	dmb	ishld
6eabf800dc:    	b	0x6eabf7fe40 <trace+0x40>
6eabf800e0:    	mov	w1, w22
6eabf800e4:    	mov	w2, w0
6eabf800e8:    	mov	x0, x19
6eabf800ec:    	mov	w3, #0x4045             // =16453
6eabf800f0:    	movk	w3, #0x1, lsl #16
6eabf800f4:    	adr	x4, 0x6eabf7ff08 <trace+0x108>
6eabf800f8:    	adrp	x16, 0x6efc87d000 <trace+0x508fd000>
6eabf800fc:    	add	x16, x16, #0xc38
6eabf80100:    	blr	x16
6eabf80104:    	dmb	ishld
6eabf80108:    	b	0x6eabf7ff08 <trace+0x108>
6eabf8010c:    	mov	w1, w20
6eabf80110:    	mov	x2, x0
6eabf80114:    	mov	x0, x19
6eabf80118:    	mov	w3, #0x4065             // =16485
6eabf8011c:    	movk	w3, #0x1, lsl #16
6eabf80120:    	adr	x4, 0x6eabf7ff64 <trace+0x164>
6eabf80124:    	adrp	x16, 0x6efc87d000 <trace+0x508fd000>
6eabf80128:    	add	x16, x16, #0xf9c
6eabf8012c:    	blr	x16
6eabf80130:    	dmb	ishld
6eabf80134:    	b	0x6eabf7ff64 <trace+0x164>
6eabf80138:    	mov	w1, w20
6eabf8013c:    	mov	x0, x19
6eabf80140:    	mov	w2, #0x4065             // =16485
6eabf80144:    	movk	w2, #0x1, lsl #16
6eabf80148:    	adr	x3, 0x6eabf7ffd4 <trace+0x1d4>
6eabf8014c:    	adrp	x16, 0x6efc87d000 <trace+0x508fd000>
6eabf80150:    	add	x16, x16, #0x2f8
6eabf80154:    	blr	x16
6eabf80158:    	mov	x1, x0
6eabf8015c:    	dmb	ishld
6eabf80160:    	b	0x6eabf7ffd4 <trace+0x1d4>
6eabf80164:    	mov	w1, w21
6eabf80168:    	mov	x0, x19
6eabf8016c:    	mov	w2, #0x4045             // =16453
6eabf80170:    	movk	w2, #0x1, lsl #16
6eabf80174:    	adr	x3, 0x6eabf80030 <trace+0x230>
6eabf80178:    	adrp	x16, 0x6efc87d000 <trace+0x508fd000>
6eabf8017c:    	add	x16, x16, #0x58
6eabf80180:    	blr	x16
6eabf80184:    	mov	w21, w0
6eabf80188:    	dmb	ishld
6eabf8018c:    	b	0x6eabf80030 <trace+0x230>
6eabf80190:    	mov	w1, w20
6eabf80194:    	mov	x0, x19
6eabf80198:    	mov	w2, #0x4045             // =16453
6eabf8019c:    	movk	w2, #0x1, lsl #16
6eabf801a0:    	adr	x3, 0x6eabf8005c <trace+0x25c>
6eabf801a4:    	adrp	x16, 0x6efc87d000 <trace+0x508fd000>
6eabf801a8:    	add	x16, x16, #0x58
6eabf801ac:    	blr	x16
6eabf801b0:    	mov	w20, w0
6eabf801b4:    	dmb	ishld
6eabf801b8:    	b	0x6eabf8005c <trace+0x25c>