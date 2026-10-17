
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-2fa4e8-6c4e9870c0.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006c4e9870c0 <trace>:
6c4e9870c0:    	ldur	w20, [x19, #-0x10]  // guest 0x2fa4e8, sampled 1
6c4e9870c4:    	tbnz	w20, #0x1f, 0x6c4e98736c <trace+0x2ac>  // guest 0x2fa4e8, sampled 0
6c4e9870c8:    	sturb	wzr, [x19, #-0xc]  // guest 0x2fa4e8, sampled 0
6c4e9870cc:    	ldr	w20, [x19, #0x10]  // guest 0x2fa4e8, sampled 0
6c4e9870d0:    	sub	w20, w20, #0x4  // guest 0x2fa4e8, sampled 1
6c4e9870d4:    	mov	w21, w20  // guest 0x2fa4e8, sampled 0
6c4e9870d8:    	ldr	w22, [x19, #0x14]  // guest 0x2fa4e8, sampled 0
6c4e9870dc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2fa4e8, sampled 0
6c4e9870e0:    	and	x16, x16, x21, lsr #7  // guest 0x2fa4e8, sampled 0
6c4e9870e4:    	add	x17, x17, x16  // guest 0x2fa4e8, sampled 0
6c4e9870e8:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2fa4e8, sampled 0
6c4e9870ec:    	and	w30, w21, #0xfffff003  // guest 0x2fa4e8, sampled 2
6c4e9870f0:    	cmp	w16, w30  // guest 0x2fa4e8, sampled 0
6c4e9870f4:    	b.ne	0x6c4e987374 <trace+0x2b4>  // guest 0x2fa4e8, sampled 0
6c4e9870f8:    	add	x30, x17, w21, uxtw  // guest 0x2fa4e8, sampled 0
6c4e9870fc:    	stlr	w22, [x30]  // guest 0x2fa4e8, sampled 0
6c4e987100:    	str	w20, [x19, #0x14]  // guest 0x2fa4e9, sampled 0
6c4e987104:    	sub	w20, w20, #0x20  // guest 0x2fa4eb, sampled 0
6c4e987108:    	and	w20, w20, #0xfffffff0  // guest 0x2fa4ee, sampled 0
6c4e98710c:    	str	w20, [x19, #0x10]  // guest 0x2fa4ee, sampled 0
6c4e987110:    	str	w20, [x19, #0x28]  // guest 0x2fa4ee, sampled 0
6c4e987114:    	ldr	w21, [x19, #0x188]  // guest 0x2fa4f1, sampled 0
6c4e987118:    	sub	w21, w21, #0x1  // guest 0x2fa4f1, sampled 0
6c4e98711c:    	and	w21, w21, #0x7  // guest 0x2fa4f1, sampled 0
6c4e987120:    	str	w21, [x19, #0x188]  // guest 0x2fa4f1, sampled 0
6c4e987124:    	sxtw	x22, w21  // guest 0x2fa4f1, sampled 0
6c4e987128:    	add	x22, x22, x19  // guest 0x2fa4f1, sampled 0
6c4e98712c:    	strb	wzr, [x22, #0x190]  // guest 0x2fa4f1, sampled 0
6c4e987130:    	lsl	w22, w21, #4  // guest 0x2fa4f1, sampled 0
6c4e987134:    	add	w22, w22, #0x1a0  // guest 0x2fa4f1, sampled 0
6c4e987138:    	sxtw	x22, w22  // guest 0x2fa4f1, sampled 0
6c4e98713c:    	add	x22, x22, x19  // guest 0x2fa4f1, sampled 0
6c4e987140:    	add	w23, w21, #0x1  // guest 0x2fa4f1, sampled 0
6c4e987144:    	and	w23, w23, #0x7  // guest 0x2fa4f1, sampled 0
6c4e987148:    	lsl	w23, w23, #4  // guest 0x2fa4f1, sampled 0
6c4e98714c:    	add	w23, w23, #0x1a0  // guest 0x2fa4f1, sampled 0
6c4e987150:    	sxtw	x23, w23  // guest 0x2fa4f1, sampled 0
6c4e987154:    	add	x23, x23, x19  // guest 0x2fa4f1, sampled 0
6c4e987158:    	ldr	x24, [x23]  // guest 0x2fa4f1, sampled 0
6c4e98715c:    	ldrh	w23, [x23, #0x8]  // guest 0x2fa4f1, sampled 0
6c4e987160:    	str	x24, [x22]  // guest 0x2fa4f1, sampled 0
6c4e987164:    	strh	w23, [x22, #0x8]  // guest 0x2fa4f1, sampled 0
6c4e987168:    	ldr	w22, [x19, #0x54]  // guest 0x2fa4f1, sampled 0
6c4e98716c:    	strh	w22, [x19, #0x222]  // guest 0x2fa4f1, sampled 0
6c4e987170:    	mov	w22, #0xa4f1            // =42225  // guest 0x2fa4f1, sampled 1
6c4e987174:    	movk	w22, #0x2f, lsl #16  // guest 0x2fa4f1, sampled 0
6c4e987178:    	str	w22, [x19, #0x228]  // guest 0x2fa4f1, sampled 0
6c4e98717c:    	add	w22, w20, #0x18  // guest 0x2fa4f3, sampled 0
6c4e987180:    	mov	w23, w22  // guest 0x2fa4f3, sampled 0
6c4e987184:    	lsl	w21, w21, #4  // guest 0x2fa4f3, sampled 0
6c4e987188:    	add	w21, w21, #0x1a0  // guest 0x2fa4f3, sampled 0
6c4e98718c:    	sxtw	x21, w21  // guest 0x2fa4f3, sampled 0
6c4e987190:    	add	x1, x21, x19  // guest 0x2fa4f3, sampled 0
6c4e987194:    	mov	x0, x19  // guest 0x2fa4f3, sampled 0
6c4e987198:    	adrp	x16, 0x6c97751000 <trace+0x48dca000>  // guest 0x2fa4f3, sampled 0
6c4e98719c:    	add	x16, x16, #0x4f0  // guest 0x2fa4f3, sampled 0
6c4e9871a0:    	blr	x16  // guest 0x2fa4f3, sampled 0
6c4e9871a4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2fa4f3, sampled 0
6c4e9871a8:    	and	x16, x16, x22, lsr #7  // guest 0x2fa4f3, sampled 0
6c4e9871ac:    	add	x17, x17, x16  // guest 0x2fa4f3, sampled 0
6c4e9871b0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2fa4f3, sampled 0
6c4e9871b4:    	and	w30, w22, #0xfffff003  // guest 0x2fa4f3, sampled 1
6c4e9871b8:    	cmp	w16, w30  // guest 0x2fa4f3, sampled 0
6c4e9871bc:    	b.ne	0x6c4e9873a0 <trace+0x2e0>  // guest 0x2fa4f3, sampled 0
6c4e9871c0:    	add	x30, x17, w22, uxtw  // guest 0x2fa4f3, sampled 0
6c4e9871c4:    	stlr	w0, [x30]  // guest 0x2fa4f3, sampled 0
6c4e9871c8:    	ldr	w21, [x19, #0x64]  // guest 0x2fa4f3, sampled 0
6c4e9871cc:    	strh	w21, [x19, #0x224]  // guest 0x2fa4f3, sampled 0
6c4e9871d0:    	str	w23, [x19, #0x230]  // guest 0x2fa4f3, sampled 0
6c4e9871d4:    	ldr	w21, [x19, #0x54]  // guest 0x2fa4f3, sampled 0
6c4e9871d8:    	strh	w21, [x19, #0x222]  // guest 0x2fa4f3, sampled 0
6c4e9871dc:    	mov	w21, #0xa4f3            // =42227  // guest 0x2fa4f3, sampled 0
6c4e9871e0:    	movk	w21, #0x2f, lsl #16  // guest 0x2fa4f3, sampled 1
6c4e9871e4:    	str	w21, [x19, #0x228]  // guest 0x2fa4f3, sampled 0
6c4e9871e8:    	add	w20, w20, #0x10  // guest 0x2fa4f7, sampled 1
6c4e9871ec:    	mov	w21, w20  // guest 0x2fa4f7, sampled 0
6c4e9871f0:    	mov	x0, x19  // guest 0x2fa4f7, sampled 0
6c4e9871f4:    	adrp	x16, 0x6c97751000 <trace+0x48dca000>  // guest 0x2fa4f7, sampled 0
6c4e9871f8:    	add	x16, x16, #0xd8c  // guest 0x2fa4f7, sampled 0
6c4e9871fc:    	blr	x16  // guest 0x2fa4f7, sampled 0
6c4e987200:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2fa4f7, sampled 0
6c4e987204:    	and	x16, x16, x20, lsr #7  // guest 0x2fa4f7, sampled 2
6c4e987208:    	add	x17, x17, x16  // guest 0x2fa4f7, sampled 0
6c4e98720c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2fa4f7, sampled 0
6c4e987210:    	and	w30, w20, #0xfffff007  // guest 0x2fa4f7, sampled 2
6c4e987214:    	cmp	w16, w30  // guest 0x2fa4f7, sampled 0
6c4e987218:    	b.ne	0x6c4e9873cc <trace+0x30c>  // guest 0x2fa4f7, sampled 0
6c4e98721c:    	add	x30, x17, w20, uxtw  // guest 0x2fa4f7, sampled 0
6c4e987220:    	stlr	x0, [x30]  // guest 0x2fa4f7, sampled 0
6c4e987224:    	ldr	w20, [x19, #0x188]  // guest 0x2fa4f7, sampled 1
6c4e987228:    	sxtw	x22, w20  // guest 0x2fa4f7, sampled 0
6c4e98722c:    	add	x22, x22, x19  // guest 0x2fa4f7, sampled 0
6c4e987230:    	mov	w23, #0x1               // =1  // guest 0x2fa4f7, sampled 0
6c4e987234:    	strb	w23, [x22, #0x190]  // guest 0x2fa4f7, sampled 0
6c4e987238:    	add	w20, w20, w23  // guest 0x2fa4f7, sampled 0
6c4e98723c:    	and	w20, w20, #0x7  // guest 0x2fa4f7, sampled 0
6c4e987240:    	str	w20, [x19, #0x188]  // guest 0x2fa4f7, sampled 0
6c4e987244:    	ldr	w20, [x19, #0x64]  // guest 0x2fa4f7, sampled 0
6c4e987248:    	strh	w20, [x19, #0x224]  // guest 0x2fa4f7, sampled 0
6c4e98724c:    	str	w21, [x19, #0x230]  // guest 0x2fa4f7, sampled 0
6c4e987250:    	ldr	w20, [x19, #0x54]  // guest 0x2fa4f7, sampled 0
6c4e987254:    	strh	w20, [x19, #0x222]  // guest 0x2fa4f7, sampled 0
6c4e987258:    	mov	w20, #0xa4f7            // =42231  // guest 0x2fa4f7, sampled 0
6c4e98725c:    	movk	w20, #0x2f, lsl #16  // guest 0x2fa4f7, sampled 0
6c4e987260:    	str	w20, [x19, #0x228]  // guest 0x2fa4f7, sampled 0
6c4e987264:    	ldr	w20, [x19, #0x10]  // guest 0x2fa4fb, sampled 0
6c4e987268:    	add	w20, w20, #0x10  // guest 0x2fa4fb, sampled 0
6c4e98726c:    	mov	w21, w20  // guest 0x2fa4fb, sampled 0
6c4e987270:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2fa4fb, sampled 0
6c4e987274:    	and	x16, x16, x20, lsr #7  // guest 0x2fa4fb, sampled 0
6c4e987278:    	add	x17, x17, x16  // guest 0x2fa4fb, sampled 0
6c4e98727c:    	ldp	x16, x17, [x17]  // guest 0x2fa4fb, sampled 0
6c4e987280:    	and	w30, w20, #0xfffff007  // guest 0x2fa4fb, sampled 0
6c4e987284:    	cmp	w16, w30  // guest 0x2fa4fb, sampled 0
6c4e987288:    	b.ne	0x6c4e9873f8 <trace+0x338>  // guest 0x2fa4fb, sampled 0
6c4e98728c:    	add	x30, x17, w20, uxtw  // guest 0x2fa4fb, sampled 0
6c4e987290:    	ldapr	x1, [x30]  // guest 0x2fa4fb, sampled 0
6c4e987294:    	mov	x0, x19  // guest 0x2fa4fb, sampled 2
6c4e987298:    	adrp	x16, 0x6c97751000 <trace+0x48dca000>  // guest 0x2fa4fb, sampled 0
6c4e98729c:    	add	x16, x16, #0xa7c  // guest 0x2fa4fb, sampled 0
6c4e9872a0:    	blr	x16  // guest 0x2fa4fb, sampled 0
6c4e9872a4:    	ldr	w20, [x19, #0x64]  // guest 0x2fa4fb, sampled 0
6c4e9872a8:    	strh	w20, [x19, #0x224]  // guest 0x2fa4fb, sampled 0
6c4e9872ac:    	str	w21, [x19, #0x230]  // guest 0x2fa4fb, sampled 0
6c4e9872b0:    	ldr	w20, [x19, #0x54]  // guest 0x2fa4fb, sampled 0
6c4e9872b4:    	strh	w20, [x19, #0x222]  // guest 0x2fa4fb, sampled 0
6c4e9872b8:    	mov	w20, #0xa4fb            // =42235  // guest 0x2fa4fb, sampled 0
6c4e9872bc:    	movk	w20, #0x2f, lsl #16  // guest 0x2fa4fb, sampled 0
6c4e9872c0:    	str	w20, [x19, #0x228]  // guest 0x2fa4fb, sampled 0
6c4e9872c4:    	ldr	w20, [x19, #0x10]  // guest 0x2fa4ff, sampled 0
6c4e9872c8:    	add	w21, w20, #0x18  // guest 0x2fa4ff, sampled 1
6c4e9872cc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2fa4ff, sampled 0
6c4e9872d0:    	and	x16, x16, x21, lsr #7  // guest 0x2fa4ff, sampled 0
6c4e9872d4:    	add	x17, x17, x16  // guest 0x2fa4ff, sampled 0
6c4e9872d8:    	ldp	x16, x17, [x17]  // guest 0x2fa4ff, sampled 0
6c4e9872dc:    	and	w30, w21, #0xfffff003  // guest 0x2fa4ff, sampled 0
6c4e9872e0:    	cmp	w16, w30  // guest 0x2fa4ff, sampled 0
6c4e9872e4:    	b.ne	0x6c4e987424 <trace+0x364>  // guest 0x2fa4ff, sampled 0
6c4e9872e8:    	add	x30, x17, w21, uxtw  // guest 0x2fa4ff, sampled 1
6c4e9872ec:    	ldapr	w21, [x30]  // guest 0x2fa4ff, sampled 0
6c4e9872f0:    	str	w21, [x19, #0x8]  // guest 0x2fa4ff, sampled 1
6c4e9872f4:    	add	w20, w20, #0x10  // guest 0x2fa503, sampled 0
6c4e9872f8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2fa503, sampled 0
6c4e9872fc:    	and	x16, x16, x20, lsr #7  // guest 0x2fa503, sampled 0
6c4e987300:    	add	x17, x17, x16  // guest 0x2fa503, sampled 0
6c4e987304:    	ldp	x16, x17, [x17]  // guest 0x2fa503, sampled 0
6c4e987308:    	and	w30, w20, #0xfffff003  // guest 0x2fa503, sampled 0
6c4e98730c:    	cmp	w16, w30  // guest 0x2fa503, sampled 0
6c4e987310:    	b.ne	0x6c4e987450 <trace+0x390>  // guest 0x2fa503, sampled 0
6c4e987314:    	add	x30, x17, w20, uxtw  // guest 0x2fa503, sampled 0
6c4e987318:    	ldapr	w20, [x30]  // guest 0x2fa503, sampled 0
6c4e98731c:    	str	w20, [x19]  // guest 0x2fa503, sampled 0
6c4e987320:    	str	w20, [x19, #0x28]  // guest 0x2fa507, sampled 0
6c4e987324:    	sturb	w23, [x19, #-0xc]  // guest 0x2fa507, sampled 0
6c4e987328:    	mov	w21, #0x1a              // =26  // guest 0x2fa509, sampled 0
6c4e98732c:    	str	w21, [x19, #0x34]  // guest 0x2fa509, sampled 0
6c4e987330:    	cbz	w20, 0x6c4e987350 <trace+0x290>  // guest 0x2fa509, sampled 0
6c4e987334:    	b	0x6c4e987334 <trace+0x274>  // guest 0x2fa509, sampled 0
6c4e987338:    	br	x16  // guest 0x2fa509, sampled 0
6c4e98733c:    	mov	w20, #0xa50b            // =42251  // guest 0x2fa509, sampled 0
6c4e987340:    	movk	w20, #0x2f, lsl #16  // guest 0x2fa509, sampled 0
6c4e987344:    	str	w20, [x19, #0x20]  // guest 0x2fa509, sampled 0
6c4e987348:    	adr	x0, 0x6c4e987001 <trace+0xffffffffffffff41>  // guest 0x2fa509, sampled 0
6c4e98734c:    	b	0x6c4ae5d02c <trace+0xfffffffffc4d5f6c>  // guest 0x2fa509, sampled 0
6c4e987350:    	b	0x6c4e987350 <trace+0x290>  // guest 0x2fa509, sampled 0
6c4e987354:    	br	x16  // guest 0x2fa509, sampled 0
6c4e987358:    	mov	w20, #0xa547            // =42311  // guest 0x2fa509, sampled 0
6c4e98735c:    	movk	w20, #0x2f, lsl #16  // guest 0x2fa509, sampled 0
6c4e987360:    	str	w20, [x19, #0x20]  // guest 0x2fa509, sampled 0
6c4e987364:    	adr	x0, 0x6c4e987000 <trace+0xffffffffffffff40>  // guest 0x2fa509, sampled 0
6c4e987368:    	b	0x6c4ae5d02c <trace+0xfffffffffc4d5f6c>  // guest 0x2fa509, sampled 0
6c4e98736c:    	adr	x0, 0x6c4e987003 <trace+0xffffffffffffff43>  // guest 0x2fa509, sampled 0
6c4e987370:    	b	0x6c4ae5d02c <trace+0xfffffffffc4d5f6c>  // guest 0x2fa509, sampled 0
6c4e987374:    	mov	w1, w21
6c4e987378:    	mov	w2, w22
6c4e98737c:    	mov	x0, x19
6c4e987380:    	mov	w3, #0x4045             // =16453
6c4e987384:    	movk	w3, #0x1, lsl #16
6c4e987388:    	adr	x4, 0x6c4e987100 <trace+0x40>
6c4e98738c:    	adrp	x16, 0x6c97724000 <trace+0x48d9d000>
6c4e987390:    	add	x16, x16, #0xb68
6c4e987394:    	blr	x16
6c4e987398:    	dmb	ishld
6c4e98739c:    	b	0x6c4e987100 <trace+0x40>
6c4e9873a0:    	mov	w1, w22
6c4e9873a4:    	mov	w2, w0
6c4e9873a8:    	mov	x0, x19
6c4e9873ac:    	mov	w3, #0x4045             // =16453
6c4e9873b0:    	movk	w3, #0x1, lsl #16
6c4e9873b4:    	adr	x4, 0x6c4e9871c8 <trace+0x108>
6c4e9873b8:    	adrp	x16, 0x6c97724000 <trace+0x48d9d000>
6c4e9873bc:    	add	x16, x16, #0xb68
6c4e9873c0:    	blr	x16
6c4e9873c4:    	dmb	ishld
6c4e9873c8:    	b	0x6c4e9871c8 <trace+0x108>
6c4e9873cc:    	mov	w1, w20
6c4e9873d0:    	mov	x2, x0
6c4e9873d4:    	mov	x0, x19
6c4e9873d8:    	mov	w3, #0x4065             // =16485
6c4e9873dc:    	movk	w3, #0x1, lsl #16
6c4e9873e0:    	adr	x4, 0x6c4e987224 <trace+0x164>
6c4e9873e4:    	adrp	x16, 0x6c97724000 <trace+0x48d9d000>
6c4e9873e8:    	add	x16, x16, #0xecc
6c4e9873ec:    	blr	x16
6c4e9873f0:    	dmb	ishld
6c4e9873f4:    	b	0x6c4e987224 <trace+0x164>
6c4e9873f8:    	mov	w1, w20
6c4e9873fc:    	mov	x0, x19
6c4e987400:    	mov	w2, #0x4065             // =16485
6c4e987404:    	movk	w2, #0x1, lsl #16
6c4e987408:    	adr	x3, 0x6c4e987294 <trace+0x1d4>
6c4e98740c:    	adrp	x16, 0x6c97724000 <trace+0x48d9d000>
6c4e987410:    	add	x16, x16, #0x228
6c4e987414:    	blr	x16
6c4e987418:    	mov	x1, x0
6c4e98741c:    	dmb	ishld
6c4e987420:    	b	0x6c4e987294 <trace+0x1d4>
6c4e987424:    	mov	w1, w21
6c4e987428:    	mov	x0, x19
6c4e98742c:    	mov	w2, #0x4045             // =16453
6c4e987430:    	movk	w2, #0x1, lsl #16
6c4e987434:    	adr	x3, 0x6c4e9872f0 <trace+0x230>
6c4e987438:    	adrp	x16, 0x6c97723000 <trace+0x48d9c000>
6c4e98743c:    	add	x16, x16, #0xf88
6c4e987440:    	blr	x16
6c4e987444:    	mov	w21, w0
6c4e987448:    	dmb	ishld
6c4e98744c:    	b	0x6c4e9872f0 <trace+0x230>
6c4e987450:    	mov	w1, w20
6c4e987454:    	mov	x0, x19
6c4e987458:    	mov	w2, #0x4045             // =16453
6c4e98745c:    	movk	w2, #0x1, lsl #16
6c4e987460:    	adr	x3, 0x6c4e98731c <trace+0x25c>
6c4e987464:    	adrp	x16, 0x6c97723000 <trace+0x48d9c000>
6c4e987468:    	add	x16, x16, #0xf88
6c4e98746c:    	blr	x16
6c4e987470:    	mov	w20, w0
6c4e987474:    	dmb	ishld
6c4e987478:    	b	0x6c4e98731c <trace+0x25c>