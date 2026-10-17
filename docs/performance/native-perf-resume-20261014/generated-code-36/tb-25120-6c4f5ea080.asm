
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-25120-6c4f5ea080.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006c4f5ea080 <trace>:
6c4f5ea080:    	ldur	w20, [x19, #-0x10]  // guest 0x25120, sampled 0
6c4f5ea084:    	tbnz	w20, #0x1f, 0x6c4f5eb064 <trace+0xfe4>  // guest 0x25120, sampled 0
6c4f5ea088:    	sturb	wzr, [x19, #-0xc]  // guest 0x25120, sampled 0
6c4f5ea08c:    	ldr	w20, [x19, #0x10]  // guest 0x25120, sampled 0
6c4f5ea090:    	sub	w20, w20, #0x4  // guest 0x25120, sampled 0
6c4f5ea094:    	mov	w21, w20  // guest 0x25120, sampled 0
6c4f5ea098:    	ldr	w22, [x19, #0x18]  // guest 0x25120, sampled 0
6c4f5ea09c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25120, sampled 0
6c4f5ea0a0:    	and	x16, x16, x21, lsr #7  // guest 0x25120, sampled 0
6c4f5ea0a4:    	add	x17, x17, x16  // guest 0x25120, sampled 0
6c4f5ea0a8:    	ldp	x17, x16, [x17, #0x8]  // guest 0x25120, sampled 0
6c4f5ea0ac:    	and	w30, w21, #0xfffff003  // guest 0x25120, sampled 0
6c4f5ea0b0:    	cmp	w16, w30  // guest 0x25120, sampled 0
6c4f5ea0b4:    	b.ne	0x6c4f5eb06c <trace+0xfec>  // guest 0x25120, sampled 0
6c4f5ea0b8:    	add	x30, x17, w21, uxtw  // guest 0x25120, sampled 0
6c4f5ea0bc:    	stlr	w22, [x30]  // guest 0x25120, sampled 0
6c4f5ea0c0:    	str	w20, [x19, #0x10]  // guest 0x25120, sampled 0
6c4f5ea0c4:    	sub	w20, w20, #0x4  // guest 0x25121, sampled 0
6c4f5ea0c8:    	mov	w21, w20  // guest 0x25121, sampled 0
6c4f5ea0cc:    	ldr	w22, [x19, #0x1c]  // guest 0x25121, sampled 0
6c4f5ea0d0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25121, sampled 0
6c4f5ea0d4:    	and	x16, x16, x21, lsr #7  // guest 0x25121, sampled 0
6c4f5ea0d8:    	add	x17, x17, x16  // guest 0x25121, sampled 0
6c4f5ea0dc:    	ldp	x17, x16, [x17, #0x8]  // guest 0x25121, sampled 0
6c4f5ea0e0:    	and	w30, w21, #0xfffff003  // guest 0x25121, sampled 0
6c4f5ea0e4:    	cmp	w16, w30  // guest 0x25121, sampled 0
6c4f5ea0e8:    	b.ne	0x6c4f5eb098 <trace+0x1018>  // guest 0x25121, sampled 0
6c4f5ea0ec:    	add	x30, x17, w21, uxtw  // guest 0x25121, sampled 0
6c4f5ea0f0:    	stlr	w22, [x30]  // guest 0x25121, sampled 0
6c4f5ea0f4:    	str	w20, [x19, #0x10]  // guest 0x25121, sampled 0
6c4f5ea0f8:    	add	w21, w20, #0x10  // guest 0x25122, sampled 0
6c4f5ea0fc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25122, sampled 0
6c4f5ea100:    	and	x16, x16, x21, lsr #7  // guest 0x25122, sampled 0
6c4f5ea104:    	add	x17, x17, x16  // guest 0x25122, sampled 0
6c4f5ea108:    	ldp	x16, x17, [x17]  // guest 0x25122, sampled 0
6c4f5ea10c:    	and	w30, w21, #0xfffff003  // guest 0x25122, sampled 0
6c4f5ea110:    	cmp	w16, w30  // guest 0x25122, sampled 0
6c4f5ea114:    	b.ne	0x6c4f5eb0c4 <trace+0x1044>  // guest 0x25122, sampled 0
6c4f5ea118:    	add	x30, x17, w21, uxtw  // guest 0x25122, sampled 0
6c4f5ea11c:    	ldapr	w21, [x30]  // guest 0x25122, sampled 0
6c4f5ea120:    	str	w21, [x19, #0x18]  // guest 0x25122, sampled 0
6c4f5ea124:    	add	w22, w20, #0xc  // guest 0x25126, sampled 0
6c4f5ea128:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25126, sampled 0
6c4f5ea12c:    	and	x16, x16, x22, lsr #7  // guest 0x25126, sampled 0
6c4f5ea130:    	add	x17, x17, x16  // guest 0x25126, sampled 0
6c4f5ea134:    	ldp	x16, x17, [x17]  // guest 0x25126, sampled 0
6c4f5ea138:    	and	w30, w22, #0xfffff003  // guest 0x25126, sampled 0
6c4f5ea13c:    	cmp	w16, w30  // guest 0x25126, sampled 0
6c4f5ea140:    	b.ne	0x6c4f5eb0f0 <trace+0x1070>  // guest 0x25126, sampled 0
6c4f5ea144:    	add	x30, x17, w22, uxtw  // guest 0x25126, sampled 0
6c4f5ea148:    	ldapr	w22, [x30]  // guest 0x25126, sampled 0
6c4f5ea14c:    	str	w22, [x19, #0x8]  // guest 0x25126, sampled 0
6c4f5ea150:    	add	w20, w20, #0x14  // guest 0x2512a, sampled 0
6c4f5ea154:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2512a, sampled 0
6c4f5ea158:    	and	x16, x16, x20, lsr #7  // guest 0x2512a, sampled 0
6c4f5ea15c:    	add	x17, x17, x16  // guest 0x2512a, sampled 0
6c4f5ea160:    	ldp	x16, x17, [x17]  // guest 0x2512a, sampled 0
6c4f5ea164:    	and	w30, w20, #0xfffff003  // guest 0x2512a, sampled 0
6c4f5ea168:    	cmp	w16, w30  // guest 0x2512a, sampled 0
6c4f5ea16c:    	b.ne	0x6c4f5eb11c <trace+0x109c>  // guest 0x2512a, sampled 0
6c4f5ea170:    	add	x30, x17, w20, uxtw  // guest 0x2512a, sampled 0
6c4f5ea174:    	ldapr	w20, [x30]  // guest 0x2512a, sampled 0
6c4f5ea178:    	str	w20, [x19, #0x1c]  // guest 0x2512a, sampled 0
6c4f5ea17c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2512e, sampled 0
6c4f5ea180:    	and	x16, x16, x21, lsr #7  // guest 0x2512e, sampled 0
6c4f5ea184:    	add	x17, x17, x16  // guest 0x2512e, sampled 0
6c4f5ea188:    	ldp	x16, x17, [x17]  // guest 0x2512e, sampled 0
6c4f5ea18c:    	and	w30, w21, #0xfffff003  // guest 0x2512e, sampled 0
6c4f5ea190:    	cmp	w16, w30  // guest 0x2512e, sampled 0
6c4f5ea194:    	b.ne	0x6c4f5eb148 <trace+0x10c8>  // guest 0x2512e, sampled 0
6c4f5ea198:    	add	x30, x17, w21, uxtw  // guest 0x2512e, sampled 0
6c4f5ea19c:    	ldapr	w2, [x30]  // guest 0x2512e, sampled 0
6c4f5ea1a0:    	ldr	w20, [x19, #0x188]  // guest 0x2512e, sampled 1
6c4f5ea1a4:    	add	w22, w20, #0x7  // guest 0x2512e, sampled 0
6c4f5ea1a8:    	and	w22, w22, #0x7  // guest 0x2512e, sampled 0
6c4f5ea1ac:    	lsl	w22, w22, #4  // guest 0x2512e, sampled 0
6c4f5ea1b0:    	add	w22, w22, #0x1a0  // guest 0x2512e, sampled 0
6c4f5ea1b4:    	sxtw	x22, w22  // guest 0x2512e, sampled 0
6c4f5ea1b8:    	add	x1, x22, x19  // guest 0x2512e, sampled 0
6c4f5ea1bc:    	mov	x0, x19  // guest 0x2512e, sampled 0
6c4f5ea1c0:    	adrp	x16, 0x6c97751000 <trace+0x48167000>  // guest 0x2512e, sampled 0
6c4f5ea1c4:    	add	x16, x16, #0x3b4  // guest 0x2512e, sampled 0
6c4f5ea1c8:    	blr	x16  // guest 0x2512e, sampled 0
6c4f5ea1cc:    	sub	w20, w20, #0x1  // guest 0x2512e, sampled 0
6c4f5ea1d0:    	and	w20, w20, #0x7  // guest 0x2512e, sampled 0
6c4f5ea1d4:    	str	w20, [x19, #0x188]  // guest 0x2512e, sampled 0
6c4f5ea1d8:    	sxtw	x22, w20  // guest 0x2512e, sampled 0
6c4f5ea1dc:    	add	x22, x22, x19  // guest 0x2512e, sampled 0
6c4f5ea1e0:    	strb	wzr, [x22, #0x190]  // guest 0x2512e, sampled 0
6c4f5ea1e4:    	ldr	w22, [x19, #0x74]  // guest 0x2512e, sampled 0
6c4f5ea1e8:    	strh	w22, [x19, #0x224]  // guest 0x2512e, sampled 0
6c4f5ea1ec:    	str	w21, [x19, #0x230]  // guest 0x2512e, sampled 0
6c4f5ea1f0:    	ldr	w22, [x19, #0x54]  // guest 0x2512e, sampled 0
6c4f5ea1f4:    	strh	w22, [x19, #0x222]  // guest 0x2512e, sampled 0
6c4f5ea1f8:    	mov	w22, #0x512e            // =20782  // guest 0x2512e, sampled 0
6c4f5ea1fc:    	movk	w22, #0x2, lsl #16  // guest 0x2512e, sampled 0
6c4f5ea200:    	str	w22, [x19, #0x228]  // guest 0x2512e, sampled 0
6c4f5ea204:    	add	w21, w21, #0x4  // guest 0x25130, sampled 0
6c4f5ea208:    	mov	w22, w21  // guest 0x25130, sampled 0
6c4f5ea20c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25130, sampled 0
6c4f5ea210:    	and	x16, x16, x21, lsr #7  // guest 0x25130, sampled 0
6c4f5ea214:    	add	x17, x17, x16  // guest 0x25130, sampled 0
6c4f5ea218:    	ldp	x16, x17, [x17]  // guest 0x25130, sampled 0
6c4f5ea21c:    	and	w30, w21, #0xfffff003  // guest 0x25130, sampled 0
6c4f5ea220:    	cmp	w16, w30  // guest 0x25130, sampled 0
6c4f5ea224:    	b.ne	0x6c4f5eb174 <trace+0x10f4>  // guest 0x25130, sampled 0
6c4f5ea228:    	add	x30, x17, w21, uxtw  // guest 0x25130, sampled 0
6c4f5ea22c:    	ldapr	w2, [x30]  // guest 0x25130, sampled 0
6c4f5ea230:    	add	w21, w20, #0x7  // guest 0x25130, sampled 0
6c4f5ea234:    	and	w21, w21, #0x7  // guest 0x25130, sampled 0
6c4f5ea238:    	lsl	w21, w21, #4  // guest 0x25130, sampled 0
6c4f5ea23c:    	add	w21, w21, #0x1a0  // guest 0x25130, sampled 0
6c4f5ea240:    	sxtw	x21, w21  // guest 0x25130, sampled 0
6c4f5ea244:    	add	x1, x21, x19  // guest 0x25130, sampled 0
6c4f5ea248:    	mov	x0, x19  // guest 0x25130, sampled 0
6c4f5ea24c:    	adrp	x16, 0x6c97751000 <trace+0x48167000>  // guest 0x25130, sampled 0
6c4f5ea250:    	add	x16, x16, #0x3b4  // guest 0x25130, sampled 0
6c4f5ea254:    	blr	x16  // guest 0x25130, sampled 0
6c4f5ea258:    	sub	w20, w20, #0x1  // guest 0x25130, sampled 0
6c4f5ea25c:    	and	w20, w20, #0x7  // guest 0x25130, sampled 0
6c4f5ea260:    	str	w20, [x19, #0x188]  // guest 0x25130, sampled 0
6c4f5ea264:    	sxtw	x20, w20  // guest 0x25130, sampled 0
6c4f5ea268:    	add	x20, x20, x19  // guest 0x25130, sampled 0
6c4f5ea26c:    	strb	wzr, [x20, #0x190]  // guest 0x25130, sampled 0
6c4f5ea270:    	ldr	w20, [x19, #0x74]  // guest 0x25130, sampled 0
6c4f5ea274:    	strh	w20, [x19, #0x224]  // guest 0x25130, sampled 0
6c4f5ea278:    	str	w22, [x19, #0x230]  // guest 0x25130, sampled 0
6c4f5ea27c:    	ldr	w20, [x19, #0x54]  // guest 0x25130, sampled 0
6c4f5ea280:    	strh	w20, [x19, #0x222]  // guest 0x25130, sampled 0
6c4f5ea284:    	mov	w20, #0x5130            // =20784  // guest 0x25130, sampled 0
6c4f5ea288:    	movk	w20, #0x2, lsl #16  // guest 0x25130, sampled 0
6c4f5ea28c:    	str	w20, [x19, #0x228]  // guest 0x25130, sampled 0
6c4f5ea290:    	mov	w1, #0x1                // =1  // guest 0x25133, sampled 0
6c4f5ea294:    	mov	x0, x19  // guest 0x25133, sampled 0
6c4f5ea298:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x25133, sampled 0
6c4f5ea29c:    	add	x16, x16, #0x4d0  // guest 0x25133, sampled 0
6c4f5ea2a0:    	blr	x16  // guest 0x25133, sampled 0
6c4f5ea2a4:    	ldr	w20, [x19, #0x54]  // guest 0x25133, sampled 0
6c4f5ea2a8:    	strh	w20, [x19, #0x222]  // guest 0x25133, sampled 0
6c4f5ea2ac:    	mov	w20, #0x5133            // =20787  // guest 0x25133, sampled 0
6c4f5ea2b0:    	movk	w20, #0x2, lsl #16  // guest 0x25133, sampled 0
6c4f5ea2b4:    	str	w20, [x19, #0x228]  // guest 0x25133, sampled 0
6c4f5ea2b8:    	ldr	w20, [x19, #0x18]  // guest 0x25135, sampled 0
6c4f5ea2bc:    	add	w20, w20, #0x8  // guest 0x25135, sampled 0
6c4f5ea2c0:    	mov	w21, w20  // guest 0x25135, sampled 0
6c4f5ea2c4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25135, sampled 0
6c4f5ea2c8:    	and	x16, x16, x20, lsr #7  // guest 0x25135, sampled 0
6c4f5ea2cc:    	add	x17, x17, x16  // guest 0x25135, sampled 0
6c4f5ea2d0:    	ldp	x16, x17, [x17]  // guest 0x25135, sampled 0
6c4f5ea2d4:    	and	w30, w20, #0xfffff003  // guest 0x25135, sampled 0
6c4f5ea2d8:    	cmp	w16, w30  // guest 0x25135, sampled 0
6c4f5ea2dc:    	b.ne	0x6c4f5eb1a0 <trace+0x1120>  // guest 0x25135, sampled 0
6c4f5ea2e0:    	add	x30, x17, w20, uxtw  // guest 0x25135, sampled 0
6c4f5ea2e4:    	ldapr	w2, [x30]  // guest 0x25135, sampled 0
6c4f5ea2e8:    	ldr	w20, [x19, #0x188]  // guest 0x25135, sampled 2
6c4f5ea2ec:    	add	w22, w20, #0x7  // guest 0x25135, sampled 0
6c4f5ea2f0:    	and	w22, w22, #0x7  // guest 0x25135, sampled 0
6c4f5ea2f4:    	lsl	w22, w22, #4  // guest 0x25135, sampled 0
6c4f5ea2f8:    	add	w22, w22, #0x1a0  // guest 0x25135, sampled 0
6c4f5ea2fc:    	sxtw	x22, w22  // guest 0x25135, sampled 0
6c4f5ea300:    	add	x1, x22, x19  // guest 0x25135, sampled 0
6c4f5ea304:    	mov	x0, x19  // guest 0x25135, sampled 0
6c4f5ea308:    	adrp	x16, 0x6c97751000 <trace+0x48167000>  // guest 0x25135, sampled 0
6c4f5ea30c:    	add	x16, x16, #0x3b4  // guest 0x25135, sampled 0
6c4f5ea310:    	blr	x16  // guest 0x25135, sampled 0
6c4f5ea314:    	sub	w20, w20, #0x1  // guest 0x25135, sampled 0
6c4f5ea318:    	and	w20, w20, #0x7  // guest 0x25135, sampled 0
6c4f5ea31c:    	str	w20, [x19, #0x188]  // guest 0x25135, sampled 0
6c4f5ea320:    	sxtw	x20, w20  // guest 0x25135, sampled 0
6c4f5ea324:    	add	x20, x20, x19  // guest 0x25135, sampled 0
6c4f5ea328:    	strb	wzr, [x20, #0x190]  // guest 0x25135, sampled 0
6c4f5ea32c:    	ldr	w20, [x19, #0x74]  // guest 0x25135, sampled 0
6c4f5ea330:    	strh	w20, [x19, #0x224]  // guest 0x25135, sampled 0
6c4f5ea334:    	str	w21, [x19, #0x230]  // guest 0x25135, sampled 0
6c4f5ea338:    	ldr	w20, [x19, #0x54]  // guest 0x25135, sampled 0
6c4f5ea33c:    	strh	w20, [x19, #0x222]  // guest 0x25135, sampled 0
6c4f5ea340:    	mov	w20, #0x5135            // =20789  // guest 0x25135, sampled 0
6c4f5ea344:    	movk	w20, #0x2, lsl #16  // guest 0x25135, sampled 0
6c4f5ea348:    	str	w20, [x19, #0x228]  // guest 0x25135, sampled 0
6c4f5ea34c:    	mov	w1, #0x1                // =1  // guest 0x25138, sampled 0
6c4f5ea350:    	mov	x0, x19  // guest 0x25138, sampled 0
6c4f5ea354:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x25138, sampled 0
6c4f5ea358:    	add	x16, x16, #0x4d0  // guest 0x25138, sampled 0
6c4f5ea35c:    	blr	x16  // guest 0x25138, sampled 0
6c4f5ea360:    	ldr	w20, [x19, #0x54]  // guest 0x25138, sampled 0
6c4f5ea364:    	strh	w20, [x19, #0x222]  // guest 0x25138, sampled 0
6c4f5ea368:    	mov	w20, #0x5138            // =20792  // guest 0x25138, sampled 0
6c4f5ea36c:    	movk	w20, #0x2, lsl #16  // guest 0x25138, sampled 0
6c4f5ea370:    	str	w20, [x19, #0x228]  // guest 0x25138, sampled 0
6c4f5ea374:    	ldr	w20, [x19, #0x188]  // guest 0x2513a, sampled 0
6c4f5ea378:    	sub	w20, w20, #0x1  // guest 0x2513a, sampled 0
6c4f5ea37c:    	and	w20, w20, #0x7  // guest 0x2513a, sampled 0
6c4f5ea380:    	str	w20, [x19, #0x188]  // guest 0x2513a, sampled 0
6c4f5ea384:    	sxtw	x21, w20  // guest 0x2513a, sampled 0
6c4f5ea388:    	add	x21, x21, x19  // guest 0x2513a, sampled 0
6c4f5ea38c:    	strb	wzr, [x21, #0x190]  // guest 0x2513a, sampled 0
6c4f5ea390:    	lsl	w21, w20, #4  // guest 0x2513a, sampled 1
6c4f5ea394:    	add	w21, w21, #0x1a0  // guest 0x2513a, sampled 0
6c4f5ea398:    	sxtw	x21, w21  // guest 0x2513a, sampled 0
6c4f5ea39c:    	add	x21, x21, x19  // guest 0x2513a, sampled 0
6c4f5ea3a0:    	add	w22, w20, #0x1  // guest 0x2513a, sampled 0
6c4f5ea3a4:    	and	w22, w22, #0x7  // guest 0x2513a, sampled 0
6c4f5ea3a8:    	lsl	w22, w22, #4  // guest 0x2513a, sampled 0
6c4f5ea3ac:    	add	w22, w22, #0x1a0  // guest 0x2513a, sampled 0
6c4f5ea3b0:    	sxtw	x22, w22  // guest 0x2513a, sampled 0
6c4f5ea3b4:    	add	x22, x22, x19  // guest 0x2513a, sampled 0
6c4f5ea3b8:    	ldr	x23, [x22]  // guest 0x2513a, sampled 0
6c4f5ea3bc:    	ldrh	w22, [x22, #0x8]  // guest 0x2513a, sampled 0
6c4f5ea3c0:    	str	x23, [x21]  // guest 0x2513a, sampled 0
6c4f5ea3c4:    	strh	w22, [x21, #0x8]  // guest 0x2513a, sampled 0
6c4f5ea3c8:    	ldr	w21, [x19, #0x54]  // guest 0x2513a, sampled 0
6c4f5ea3cc:    	strh	w21, [x19, #0x222]  // guest 0x2513a, sampled 0
6c4f5ea3d0:    	mov	w21, #0x513a            // =20794  // guest 0x2513a, sampled 0
6c4f5ea3d4:    	movk	w21, #0x2, lsl #16  // guest 0x2513a, sampled 0
6c4f5ea3d8:    	str	w21, [x19, #0x228]  // guest 0x2513a, sampled 0
6c4f5ea3dc:    	ldr	w21, [x19, #0x8]  // guest 0x2513c, sampled 0
6c4f5ea3e0:    	add	w22, w21, #0xc  // guest 0x2513c, sampled 0
6c4f5ea3e4:    	mov	w23, w22  // guest 0x2513c, sampled 0
6c4f5ea3e8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2513c, sampled 0
6c4f5ea3ec:    	and	x16, x16, x22, lsr #7  // guest 0x2513c, sampled 0
6c4f5ea3f0:    	add	x17, x17, x16  // guest 0x2513c, sampled 0
6c4f5ea3f4:    	ldp	x16, x17, [x17]  // guest 0x2513c, sampled 0
6c4f5ea3f8:    	and	w30, w22, #0xfffff003  // guest 0x2513c, sampled 0
6c4f5ea3fc:    	cmp	w16, w30  // guest 0x2513c, sampled 0
6c4f5ea400:    	b.ne	0x6c4f5eb1cc <trace+0x114c>  // guest 0x2513c, sampled 0
6c4f5ea404:    	add	x30, x17, w22, uxtw  // guest 0x2513c, sampled 0
6c4f5ea408:    	ldapr	w2, [x30]  // guest 0x2513c, sampled 0
6c4f5ea40c:    	add	x1, x19, #0x258  // guest 0x2513c, sampled 0
6c4f5ea410:    	mov	x0, x19  // guest 0x2513c, sampled 0
6c4f5ea414:    	adrp	x16, 0x6c97751000 <trace+0x48167000>  // guest 0x2513c, sampled 0
6c4f5ea418:    	add	x16, x16, #0x3b4  // guest 0x2513c, sampled 0
6c4f5ea41c:    	blr	x16  // guest 0x2513c, sampled 0
6c4f5ea420:    	lsl	w22, w20, #4  // guest 0x2513c, sampled 0
6c4f5ea424:    	add	w22, w22, #0x1a0  // guest 0x2513c, sampled 0
6c4f5ea428:    	sxtw	x22, w22  // guest 0x2513c, sampled 0
6c4f5ea42c:    	add	x1, x22, x19  // guest 0x2513c, sampled 0
6c4f5ea430:    	add	x2, x19, #0x258  // guest 0x2513c, sampled 0
6c4f5ea434:    	mov	x0, x19  // guest 0x2513c, sampled 0
6c4f5ea438:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x2513c, sampled 0
6c4f5ea43c:    	add	x16, x16, #0xa7c  // guest 0x2513c, sampled 0
6c4f5ea440:    	blr	x16  // guest 0x2513c, sampled 0
6c4f5ea444:    	ldr	w22, [x19, #0x74]  // guest 0x2513c, sampled 0
6c4f5ea448:    	strh	w22, [x19, #0x224]  // guest 0x2513c, sampled 0
6c4f5ea44c:    	str	w23, [x19, #0x230]  // guest 0x2513c, sampled 0
6c4f5ea450:    	ldr	w22, [x19, #0x54]  // guest 0x2513c, sampled 0
6c4f5ea454:    	strh	w22, [x19, #0x222]  // guest 0x2513c, sampled 0
6c4f5ea458:    	mov	w22, #0x513c            // =20796  // guest 0x2513c, sampled 0
6c4f5ea45c:    	movk	w22, #0x2, lsl #16  // guest 0x2513c, sampled 0
6c4f5ea460:    	str	w22, [x19, #0x228]  // guest 0x2513c, sampled 0
6c4f5ea464:    	sub	w20, w20, #0x1  // guest 0x2513f, sampled 0
6c4f5ea468:    	and	w20, w20, #0x7  // guest 0x2513f, sampled 0
6c4f5ea46c:    	str	w20, [x19, #0x188]  // guest 0x2513f, sampled 0
6c4f5ea470:    	sxtw	x22, w20  // guest 0x2513f, sampled 0
6c4f5ea474:    	add	x22, x22, x19  // guest 0x2513f, sampled 0
6c4f5ea478:    	strb	wzr, [x22, #0x190]  // guest 0x2513f, sampled 0
6c4f5ea47c:    	lsl	w22, w20, #4  // guest 0x2513f, sampled 0
6c4f5ea480:    	add	w22, w22, #0x1a0  // guest 0x2513f, sampled 0
6c4f5ea484:    	sxtw	x22, w22  // guest 0x2513f, sampled 0
6c4f5ea488:    	add	x22, x22, x19  // guest 0x2513f, sampled 0
6c4f5ea48c:    	add	w23, w20, #0x2  // guest 0x2513f, sampled 0
6c4f5ea490:    	and	w23, w23, #0x7  // guest 0x2513f, sampled 0
6c4f5ea494:    	lsl	w23, w23, #4  // guest 0x2513f, sampled 0
6c4f5ea498:    	add	w23, w23, #0x1a0  // guest 0x2513f, sampled 0
6c4f5ea49c:    	sxtw	x23, w23  // guest 0x2513f, sampled 1
6c4f5ea4a0:    	add	x23, x23, x19  // guest 0x2513f, sampled 0
6c4f5ea4a4:    	ldr	x24, [x23]  // guest 0x2513f, sampled 0
6c4f5ea4a8:    	ldrh	w23, [x23, #0x8]  // guest 0x2513f, sampled 1
6c4f5ea4ac:    	str	x24, [x22]  // guest 0x2513f, sampled 0
6c4f5ea4b0:    	strh	w23, [x22, #0x8]  // guest 0x2513f, sampled 0
6c4f5ea4b4:    	ldr	w22, [x19, #0x54]  // guest 0x2513f, sampled 0
6c4f5ea4b8:    	strh	w22, [x19, #0x222]  // guest 0x2513f, sampled 0
6c4f5ea4bc:    	mov	w22, #0x513f            // =20799  // guest 0x2513f, sampled 0
6c4f5ea4c0:    	movk	w22, #0x2, lsl #16  // guest 0x2513f, sampled 0
6c4f5ea4c4:    	str	w22, [x19, #0x228]  // guest 0x2513f, sampled 0
6c4f5ea4c8:    	add	w21, w21, #0x18  // guest 0x25141, sampled 0
6c4f5ea4cc:    	mov	w22, w21  // guest 0x25141, sampled 0
6c4f5ea4d0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25141, sampled 0
6c4f5ea4d4:    	and	x16, x16, x21, lsr #7  // guest 0x25141, sampled 0
6c4f5ea4d8:    	add	x17, x17, x16  // guest 0x25141, sampled 0
6c4f5ea4dc:    	ldp	x16, x17, [x17]  // guest 0x25141, sampled 0
6c4f5ea4e0:    	and	w30, w21, #0xfffff003  // guest 0x25141, sampled 1
6c4f5ea4e4:    	cmp	w16, w30  // guest 0x25141, sampled 0
6c4f5ea4e8:    	b.ne	0x6c4f5eb1f8 <trace+0x1178>  // guest 0x25141, sampled 0
6c4f5ea4ec:    	add	x30, x17, w21, uxtw  // guest 0x25141, sampled 0
6c4f5ea4f0:    	ldapr	w2, [x30]  // guest 0x25141, sampled 0
6c4f5ea4f4:    	add	x1, x19, #0x258  // guest 0x25141, sampled 0
6c4f5ea4f8:    	mov	x0, x19  // guest 0x25141, sampled 0
6c4f5ea4fc:    	adrp	x16, 0x6c97751000 <trace+0x48167000>  // guest 0x25141, sampled 0
6c4f5ea500:    	add	x16, x16, #0x3b4  // guest 0x25141, sampled 0
6c4f5ea504:    	blr	x16  // guest 0x25141, sampled 0
6c4f5ea508:    	lsl	w20, w20, #4  // guest 0x25141, sampled 0
6c4f5ea50c:    	add	w20, w20, #0x1a0  // guest 0x25141, sampled 0
6c4f5ea510:    	sxtw	x20, w20  // guest 0x25141, sampled 0
6c4f5ea514:    	add	x1, x20, x19  // guest 0x25141, sampled 0
6c4f5ea518:    	add	x2, x19, #0x258  // guest 0x25141, sampled 0
6c4f5ea51c:    	mov	x0, x19  // guest 0x25141, sampled 0
6c4f5ea520:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x25141, sampled 0
6c4f5ea524:    	add	x16, x16, #0xa7c  // guest 0x25141, sampled 0
6c4f5ea528:    	blr	x16  // guest 0x25141, sampled 0
6c4f5ea52c:    	ldr	w20, [x19, #0x74]  // guest 0x25141, sampled 0
6c4f5ea530:    	strh	w20, [x19, #0x224]  // guest 0x25141, sampled 0
6c4f5ea534:    	str	w22, [x19, #0x230]  // guest 0x25141, sampled 0
6c4f5ea538:    	ldr	w20, [x19, #0x54]  // guest 0x25141, sampled 0
6c4f5ea53c:    	strh	w20, [x19, #0x222]  // guest 0x25141, sampled 0
6c4f5ea540:    	mov	w20, #0x5141            // =20801  // guest 0x25141, sampled 0
6c4f5ea544:    	movk	w20, #0x2, lsl #16  // guest 0x25141, sampled 0
6c4f5ea548:    	str	w20, [x19, #0x228]  // guest 0x25141, sampled 0
6c4f5ea54c:    	mov	w1, #0x2                // =2  // guest 0x25144, sampled 0
6c4f5ea550:    	mov	x0, x19  // guest 0x25144, sampled 0
6c4f5ea554:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x25144, sampled 0
6c4f5ea558:    	add	x16, x16, #0x4d0  // guest 0x25144, sampled 0
6c4f5ea55c:    	blr	x16  // guest 0x25144, sampled 0
6c4f5ea560:    	ldr	w20, [x19, #0x54]  // guest 0x25144, sampled 0
6c4f5ea564:    	strh	w20, [x19, #0x222]  // guest 0x25144, sampled 0
6c4f5ea568:    	mov	w20, #0x5144            // =20804  // guest 0x25144, sampled 0
6c4f5ea56c:    	movk	w20, #0x2, lsl #16  // guest 0x25144, sampled 0
6c4f5ea570:    	str	w20, [x19, #0x228]  // guest 0x25144, sampled 0
6c4f5ea574:    	ldr	w20, [x19, #0x8]  // guest 0x25146, sampled 0
6c4f5ea578:    	add	w20, w20, #0x24  // guest 0x25146, sampled 0
6c4f5ea57c:    	mov	w21, w20  // guest 0x25146, sampled 0
6c4f5ea580:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25146, sampled 0
6c4f5ea584:    	and	x16, x16, x20, lsr #7  // guest 0x25146, sampled 0
6c4f5ea588:    	add	x17, x17, x16  // guest 0x25146, sampled 0
6c4f5ea58c:    	ldp	x16, x17, [x17]  // guest 0x25146, sampled 0
6c4f5ea590:    	and	w30, w20, #0xfffff003  // guest 0x25146, sampled 0
6c4f5ea594:    	cmp	w16, w30  // guest 0x25146, sampled 0
6c4f5ea598:    	b.ne	0x6c4f5eb224 <trace+0x11a4>  // guest 0x25146, sampled 0
6c4f5ea59c:    	add	x30, x17, w20, uxtw  // guest 0x25146, sampled 0
6c4f5ea5a0:    	ldapr	w2, [x30]  // guest 0x25146, sampled 0
6c4f5ea5a4:    	add	x1, x19, #0x258  // guest 0x25146, sampled 1
6c4f5ea5a8:    	mov	x0, x19  // guest 0x25146, sampled 0
6c4f5ea5ac:    	adrp	x16, 0x6c97751000 <trace+0x48167000>  // guest 0x25146, sampled 0
6c4f5ea5b0:    	add	x16, x16, #0x3b4  // guest 0x25146, sampled 0
6c4f5ea5b4:    	blr	x16  // guest 0x25146, sampled 0
6c4f5ea5b8:    	ldr	w20, [x19, #0x188]  // guest 0x25146, sampled 0
6c4f5ea5bc:    	lsl	w20, w20, #4  // guest 0x25146, sampled 0
6c4f5ea5c0:    	add	w20, w20, #0x1a0  // guest 0x25146, sampled 0
6c4f5ea5c4:    	sxtw	x20, w20  // guest 0x25146, sampled 0
6c4f5ea5c8:    	add	x1, x20, x19  // guest 0x25146, sampled 0
6c4f5ea5cc:    	add	x2, x19, #0x258  // guest 0x25146, sampled 0
6c4f5ea5d0:    	mov	x0, x19  // guest 0x25146, sampled 0
6c4f5ea5d4:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x25146, sampled 0
6c4f5ea5d8:    	add	x16, x16, #0xa7c  // guest 0x25146, sampled 0
6c4f5ea5dc:    	blr	x16  // guest 0x25146, sampled 0
6c4f5ea5e0:    	ldr	w20, [x19, #0x74]  // guest 0x25146, sampled 0
6c4f5ea5e4:    	strh	w20, [x19, #0x224]  // guest 0x25146, sampled 0
6c4f5ea5e8:    	str	w21, [x19, #0x230]  // guest 0x25146, sampled 0
6c4f5ea5ec:    	ldr	w20, [x19, #0x54]  // guest 0x25146, sampled 0
6c4f5ea5f0:    	strh	w20, [x19, #0x222]  // guest 0x25146, sampled 0
6c4f5ea5f4:    	mov	w20, #0x5146            // =20806  // guest 0x25146, sampled 0
6c4f5ea5f8:    	movk	w20, #0x2, lsl #16  // guest 0x25146, sampled 0
6c4f5ea5fc:    	str	w20, [x19, #0x228]  // guest 0x25146, sampled 0
6c4f5ea600:    	mov	w1, #0x4                // =4  // guest 0x25149, sampled 0
6c4f5ea604:    	mov	x0, x19  // guest 0x25149, sampled 0
6c4f5ea608:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x25149, sampled 0
6c4f5ea60c:    	add	x16, x16, #0x4d0  // guest 0x25149, sampled 0
6c4f5ea610:    	blr	x16  // guest 0x25149, sampled 0
6c4f5ea614:    	ldr	w20, [x19, #0x54]  // guest 0x25149, sampled 0
6c4f5ea618:    	strh	w20, [x19, #0x222]  // guest 0x25149, sampled 0
6c4f5ea61c:    	mov	w20, #0x5149            // =20809  // guest 0x25149, sampled 0
6c4f5ea620:    	movk	w20, #0x2, lsl #16  // guest 0x25149, sampled 0
6c4f5ea624:    	str	w20, [x19, #0x228]  // guest 0x25149, sampled 0
6c4f5ea628:    	ldr	w20, [x19, #0x188]  // guest 0x2514b, sampled 0
6c4f5ea62c:    	sub	w20, w20, #0x1  // guest 0x2514b, sampled 0
6c4f5ea630:    	and	w20, w20, #0x7  // guest 0x2514b, sampled 0
6c4f5ea634:    	str	w20, [x19, #0x188]  // guest 0x2514b, sampled 0
6c4f5ea638:    	sxtw	x21, w20  // guest 0x2514b, sampled 0
6c4f5ea63c:    	add	x21, x21, x19  // guest 0x2514b, sampled 0
6c4f5ea640:    	strb	wzr, [x21, #0x190]  // guest 0x2514b, sampled 0
6c4f5ea644:    	lsl	w21, w20, #4  // guest 0x2514b, sampled 0
6c4f5ea648:    	add	w21, w21, #0x1a0  // guest 0x2514b, sampled 0
6c4f5ea64c:    	sxtw	x21, w21  // guest 0x2514b, sampled 0
6c4f5ea650:    	add	x21, x21, x19  // guest 0x2514b, sampled 0
6c4f5ea654:    	add	w22, w20, #0x1  // guest 0x2514b, sampled 0
6c4f5ea658:    	and	w22, w22, #0x7  // guest 0x2514b, sampled 0
6c4f5ea65c:    	lsl	w22, w22, #4  // guest 0x2514b, sampled 0
6c4f5ea660:    	add	w22, w22, #0x1a0  // guest 0x2514b, sampled 0
6c4f5ea664:    	sxtw	x22, w22  // guest 0x2514b, sampled 0
6c4f5ea668:    	add	x22, x22, x19  // guest 0x2514b, sampled 0
6c4f5ea66c:    	ldr	x23, [x22]  // guest 0x2514b, sampled 0
6c4f5ea670:    	ldrh	w22, [x22, #0x8]  // guest 0x2514b, sampled 0
6c4f5ea674:    	str	x23, [x21]  // guest 0x2514b, sampled 0
6c4f5ea678:    	strh	w22, [x21, #0x8]  // guest 0x2514b, sampled 0
6c4f5ea67c:    	ldr	w21, [x19, #0x54]  // guest 0x2514b, sampled 0
6c4f5ea680:    	strh	w21, [x19, #0x222]  // guest 0x2514b, sampled 0
6c4f5ea684:    	mov	w21, #0x514b            // =20811  // guest 0x2514b, sampled 0
6c4f5ea688:    	movk	w21, #0x2, lsl #16  // guest 0x2514b, sampled 0
6c4f5ea68c:    	str	w21, [x19, #0x228]  // guest 0x2514b, sampled 0
6c4f5ea690:    	ldr	w21, [x19, #0x8]  // guest 0x2514d, sampled 0
6c4f5ea694:    	add	w22, w21, #0x10  // guest 0x2514d, sampled 0
6c4f5ea698:    	mov	w23, w22  // guest 0x2514d, sampled 0
6c4f5ea69c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2514d, sampled 0
6c4f5ea6a0:    	and	x16, x16, x22, lsr #7  // guest 0x2514d, sampled 0
6c4f5ea6a4:    	add	x17, x17, x16  // guest 0x2514d, sampled 0
6c4f5ea6a8:    	ldp	x16, x17, [x17]  // guest 0x2514d, sampled 0
6c4f5ea6ac:    	and	w30, w22, #0xfffff003  // guest 0x2514d, sampled 0
6c4f5ea6b0:    	cmp	w16, w30  // guest 0x2514d, sampled 0
6c4f5ea6b4:    	b.ne	0x6c4f5eb250 <trace+0x11d0>  // guest 0x2514d, sampled 0
6c4f5ea6b8:    	add	x30, x17, w22, uxtw  // guest 0x2514d, sampled 0
6c4f5ea6bc:    	ldapr	w2, [x30]  // guest 0x2514d, sampled 0
6c4f5ea6c0:    	add	x1, x19, #0x258  // guest 0x2514d, sampled 0
6c4f5ea6c4:    	mov	x0, x19  // guest 0x2514d, sampled 0
6c4f5ea6c8:    	adrp	x16, 0x6c97751000 <trace+0x48167000>  // guest 0x2514d, sampled 0
6c4f5ea6cc:    	add	x16, x16, #0x3b4  // guest 0x2514d, sampled 0
6c4f5ea6d0:    	blr	x16  // guest 0x2514d, sampled 0
6c4f5ea6d4:    	lsl	w22, w20, #4  // guest 0x2514d, sampled 0
6c4f5ea6d8:    	add	w22, w22, #0x1a0  // guest 0x2514d, sampled 0
6c4f5ea6dc:    	sxtw	x22, w22  // guest 0x2514d, sampled 0
6c4f5ea6e0:    	add	x1, x22, x19  // guest 0x2514d, sampled 0
6c4f5ea6e4:    	add	x2, x19, #0x258  // guest 0x2514d, sampled 0
6c4f5ea6e8:    	mov	x0, x19  // guest 0x2514d, sampled 0
6c4f5ea6ec:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x2514d, sampled 0
6c4f5ea6f0:    	add	x16, x16, #0xa7c  // guest 0x2514d, sampled 0
6c4f5ea6f4:    	blr	x16  // guest 0x2514d, sampled 0
6c4f5ea6f8:    	ldr	w22, [x19, #0x74]  // guest 0x2514d, sampled 0
6c4f5ea6fc:    	strh	w22, [x19, #0x224]  // guest 0x2514d, sampled 0
6c4f5ea700:    	str	w23, [x19, #0x230]  // guest 0x2514d, sampled 0
6c4f5ea704:    	ldr	w22, [x19, #0x54]  // guest 0x2514d, sampled 0
6c4f5ea708:    	strh	w22, [x19, #0x222]  // guest 0x2514d, sampled 0
6c4f5ea70c:    	mov	w22, #0x514d            // =20813  // guest 0x2514d, sampled 0
6c4f5ea710:    	movk	w22, #0x2, lsl #16  // guest 0x2514d, sampled 0
6c4f5ea714:    	str	w22, [x19, #0x228]  // guest 0x2514d, sampled 0
6c4f5ea718:    	sub	w20, w20, #0x1  // guest 0x25150, sampled 0
6c4f5ea71c:    	and	w20, w20, #0x7  // guest 0x25150, sampled 0
6c4f5ea720:    	str	w20, [x19, #0x188]  // guest 0x25150, sampled 0
6c4f5ea724:    	sxtw	x22, w20  // guest 0x25150, sampled 0
6c4f5ea728:    	add	x22, x22, x19  // guest 0x25150, sampled 0
6c4f5ea72c:    	strb	wzr, [x22, #0x190]  // guest 0x25150, sampled 0
6c4f5ea730:    	lsl	w22, w20, #4  // guest 0x25150, sampled 0
6c4f5ea734:    	add	w22, w22, #0x1a0  // guest 0x25150, sampled 0
6c4f5ea738:    	sxtw	x22, w22  // guest 0x25150, sampled 0
6c4f5ea73c:    	add	x22, x22, x19  // guest 0x25150, sampled 0
6c4f5ea740:    	add	w23, w20, #0x2  // guest 0x25150, sampled 0
6c4f5ea744:    	and	w23, w23, #0x7  // guest 0x25150, sampled 0
6c4f5ea748:    	lsl	w23, w23, #4  // guest 0x25150, sampled 0
6c4f5ea74c:    	add	w23, w23, #0x1a0  // guest 0x25150, sampled 0
6c4f5ea750:    	sxtw	x23, w23  // guest 0x25150, sampled 0
6c4f5ea754:    	add	x23, x23, x19  // guest 0x25150, sampled 0
6c4f5ea758:    	ldr	x24, [x23]  // guest 0x25150, sampled 0
6c4f5ea75c:    	ldrh	w23, [x23, #0x8]  // guest 0x25150, sampled 0
6c4f5ea760:    	str	x24, [x22]  // guest 0x25150, sampled 0
6c4f5ea764:    	strh	w23, [x22, #0x8]  // guest 0x25150, sampled 0
6c4f5ea768:    	ldr	w22, [x19, #0x54]  // guest 0x25150, sampled 0
6c4f5ea76c:    	strh	w22, [x19, #0x222]  // guest 0x25150, sampled 0
6c4f5ea770:    	mov	w22, #0x5150            // =20816  // guest 0x25150, sampled 0
6c4f5ea774:    	movk	w22, #0x2, lsl #16  // guest 0x25150, sampled 0
6c4f5ea778:    	str	w22, [x19, #0x228]  // guest 0x25150, sampled 0
6c4f5ea77c:    	add	w21, w21, #0x1c  // guest 0x25152, sampled 0
6c4f5ea780:    	mov	w22, w21  // guest 0x25152, sampled 0
6c4f5ea784:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25152, sampled 0
6c4f5ea788:    	and	x16, x16, x21, lsr #7  // guest 0x25152, sampled 0
6c4f5ea78c:    	add	x17, x17, x16  // guest 0x25152, sampled 0
6c4f5ea790:    	ldp	x16, x17, [x17]  // guest 0x25152, sampled 0
6c4f5ea794:    	and	w30, w21, #0xfffff003  // guest 0x25152, sampled 0
6c4f5ea798:    	cmp	w16, w30  // guest 0x25152, sampled 0
6c4f5ea79c:    	b.ne	0x6c4f5eb27c <trace+0x11fc>  // guest 0x25152, sampled 0
6c4f5ea7a0:    	add	x30, x17, w21, uxtw  // guest 0x25152, sampled 0
6c4f5ea7a4:    	ldapr	w2, [x30]  // guest 0x25152, sampled 0
6c4f5ea7a8:    	add	x1, x19, #0x258  // guest 0x25152, sampled 1
6c4f5ea7ac:    	mov	x0, x19  // guest 0x25152, sampled 0
6c4f5ea7b0:    	adrp	x16, 0x6c97751000 <trace+0x48167000>  // guest 0x25152, sampled 0
6c4f5ea7b4:    	add	x16, x16, #0x3b4  // guest 0x25152, sampled 0
6c4f5ea7b8:    	blr	x16  // guest 0x25152, sampled 0
6c4f5ea7bc:    	lsl	w20, w20, #4  // guest 0x25152, sampled 0
6c4f5ea7c0:    	add	w20, w20, #0x1a0  // guest 0x25152, sampled 0
6c4f5ea7c4:    	sxtw	x20, w20  // guest 0x25152, sampled 0
6c4f5ea7c8:    	add	x1, x20, x19  // guest 0x25152, sampled 0
6c4f5ea7cc:    	add	x2, x19, #0x258  // guest 0x25152, sampled 0
6c4f5ea7d0:    	mov	x0, x19  // guest 0x25152, sampled 0
6c4f5ea7d4:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x25152, sampled 0
6c4f5ea7d8:    	add	x16, x16, #0xa7c  // guest 0x25152, sampled 0
6c4f5ea7dc:    	blr	x16  // guest 0x25152, sampled 0
6c4f5ea7e0:    	ldr	w20, [x19, #0x74]  // guest 0x25152, sampled 0
6c4f5ea7e4:    	strh	w20, [x19, #0x224]  // guest 0x25152, sampled 0
6c4f5ea7e8:    	str	w22, [x19, #0x230]  // guest 0x25152, sampled 0
6c4f5ea7ec:    	ldr	w20, [x19, #0x54]  // guest 0x25152, sampled 0
6c4f5ea7f0:    	strh	w20, [x19, #0x222]  // guest 0x25152, sampled 0
6c4f5ea7f4:    	mov	w20, #0x5152            // =20818  // guest 0x25152, sampled 0
6c4f5ea7f8:    	movk	w20, #0x2, lsl #16  // guest 0x25152, sampled 0
6c4f5ea7fc:    	str	w20, [x19, #0x228]  // guest 0x25152, sampled 0
6c4f5ea800:    	mov	w1, #0x2                // =2  // guest 0x25155, sampled 0
6c4f5ea804:    	mov	x0, x19  // guest 0x25155, sampled 0
6c4f5ea808:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x25155, sampled 0
6c4f5ea80c:    	add	x16, x16, #0x4d0  // guest 0x25155, sampled 0
6c4f5ea810:    	blr	x16  // guest 0x25155, sampled 0
6c4f5ea814:    	ldr	w20, [x19, #0x54]  // guest 0x25155, sampled 0
6c4f5ea818:    	strh	w20, [x19, #0x222]  // guest 0x25155, sampled 0
6c4f5ea81c:    	mov	w20, #0x5155            // =20821  // guest 0x25155, sampled 0
6c4f5ea820:    	movk	w20, #0x2, lsl #16  // guest 0x25155, sampled 0
6c4f5ea824:    	str	w20, [x19, #0x228]  // guest 0x25155, sampled 0
6c4f5ea828:    	ldr	w20, [x19, #0x8]  // guest 0x25157, sampled 0
6c4f5ea82c:    	add	w20, w20, #0x28  // guest 0x25157, sampled 0
6c4f5ea830:    	mov	w21, w20  // guest 0x25157, sampled 0
6c4f5ea834:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25157, sampled 0
6c4f5ea838:    	and	x16, x16, x20, lsr #7  // guest 0x25157, sampled 0
6c4f5ea83c:    	add	x17, x17, x16  // guest 0x25157, sampled 0
6c4f5ea840:    	ldp	x16, x17, [x17]  // guest 0x25157, sampled 0
6c4f5ea844:    	and	w30, w20, #0xfffff003  // guest 0x25157, sampled 0
6c4f5ea848:    	cmp	w16, w30  // guest 0x25157, sampled 0
6c4f5ea84c:    	b.ne	0x6c4f5eb2a8 <trace+0x1228>  // guest 0x25157, sampled 0
6c4f5ea850:    	add	x30, x17, w20, uxtw  // guest 0x25157, sampled 0
6c4f5ea854:    	ldapr	w2, [x30]  // guest 0x25157, sampled 0
6c4f5ea858:    	add	x1, x19, #0x258  // guest 0x25157, sampled 0
6c4f5ea85c:    	mov	x0, x19  // guest 0x25157, sampled 0
6c4f5ea860:    	adrp	x16, 0x6c97751000 <trace+0x48167000>  // guest 0x25157, sampled 0
6c4f5ea864:    	add	x16, x16, #0x3b4  // guest 0x25157, sampled 0
6c4f5ea868:    	blr	x16  // guest 0x25157, sampled 0
6c4f5ea86c:    	ldr	w20, [x19, #0x188]  // guest 0x25157, sampled 0
6c4f5ea870:    	lsl	w20, w20, #4  // guest 0x25157, sampled 0
6c4f5ea874:    	add	w20, w20, #0x1a0  // guest 0x25157, sampled 0
6c4f5ea878:    	sxtw	x20, w20  // guest 0x25157, sampled 0
6c4f5ea87c:    	add	x1, x20, x19  // guest 0x25157, sampled 0
6c4f5ea880:    	add	x2, x19, #0x258  // guest 0x25157, sampled 0
6c4f5ea884:    	mov	x0, x19  // guest 0x25157, sampled 0
6c4f5ea888:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x25157, sampled 0
6c4f5ea88c:    	add	x16, x16, #0xa7c  // guest 0x25157, sampled 0
6c4f5ea890:    	blr	x16  // guest 0x25157, sampled 0
6c4f5ea894:    	ldr	w20, [x19, #0x74]  // guest 0x25157, sampled 0
6c4f5ea898:    	strh	w20, [x19, #0x224]  // guest 0x25157, sampled 0
6c4f5ea89c:    	str	w21, [x19, #0x230]  // guest 0x25157, sampled 0
6c4f5ea8a0:    	ldr	w20, [x19, #0x54]  // guest 0x25157, sampled 0
6c4f5ea8a4:    	strh	w20, [x19, #0x222]  // guest 0x25157, sampled 0
6c4f5ea8a8:    	mov	w20, #0x5157            // =20823  // guest 0x25157, sampled 0
6c4f5ea8ac:    	movk	w20, #0x2, lsl #16  // guest 0x25157, sampled 0
6c4f5ea8b0:    	str	w20, [x19, #0x228]  // guest 0x25157, sampled 0
6c4f5ea8b4:    	mov	w1, #0x1                // =1  // guest 0x2515a, sampled 0
6c4f5ea8b8:    	mov	x0, x19  // guest 0x2515a, sampled 0
6c4f5ea8bc:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x2515a, sampled 0
6c4f5ea8c0:    	add	x16, x16, #0x4d0  // guest 0x2515a, sampled 0
6c4f5ea8c4:    	blr	x16  // guest 0x2515a, sampled 0
6c4f5ea8c8:    	ldr	w20, [x19, #0x54]  // guest 0x2515a, sampled 0
6c4f5ea8cc:    	strh	w20, [x19, #0x222]  // guest 0x2515a, sampled 0
6c4f5ea8d0:    	mov	w20, #0x515a            // =20826  // guest 0x2515a, sampled 0
6c4f5ea8d4:    	movk	w20, #0x2, lsl #16  // guest 0x2515a, sampled 0
6c4f5ea8d8:    	str	w20, [x19, #0x228]  // guest 0x2515a, sampled 0
6c4f5ea8dc:    	ldr	w20, [x19, #0x188]  // guest 0x2515c, sampled 0
6c4f5ea8e0:    	add	w21, w20, #0x3  // guest 0x2515c, sampled 0
6c4f5ea8e4:    	and	w21, w21, #0x7  // guest 0x2515c, sampled 0
6c4f5ea8e8:    	lsl	w21, w21, #4  // guest 0x2515c, sampled 0
6c4f5ea8ec:    	add	w21, w21, #0x1a0  // guest 0x2515c, sampled 0
6c4f5ea8f0:    	sxtw	x21, w21  // guest 0x2515c, sampled 0
6c4f5ea8f4:    	add	x1, x21, x19  // guest 0x2515c, sampled 0
6c4f5ea8f8:    	lsl	w21, w20, #4  // guest 0x2515c, sampled 0
6c4f5ea8fc:    	add	w21, w21, #0x1a0  // guest 0x2515c, sampled 0
6c4f5ea900:    	sxtw	x21, w21  // guest 0x2515c, sampled 1
6c4f5ea904:    	add	x2, x21, x19  // guest 0x2515c, sampled 0
6c4f5ea908:    	mov	x0, x19  // guest 0x2515c, sampled 0
6c4f5ea90c:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x2515c, sampled 0
6c4f5ea910:    	add	x16, x16, #0x9a8  // guest 0x2515c, sampled 0
6c4f5ea914:    	blr	x16  // guest 0x2515c, sampled 0
6c4f5ea918:    	sxtw	x21, w20  // guest 0x2515c, sampled 0
6c4f5ea91c:    	add	x21, x21, x19  // guest 0x2515c, sampled 0
6c4f5ea920:    	mov	w22, #0x1               // =1  // guest 0x2515c, sampled 0
6c4f5ea924:    	strb	w22, [x21, #0x190]  // guest 0x2515c, sampled 0
6c4f5ea928:    	add	w20, w20, w22  // guest 0x2515c, sampled 0
6c4f5ea92c:    	and	w20, w20, #0x7  // guest 0x2515c, sampled 0
6c4f5ea930:    	ldr	w21, [x19, #0x54]  // guest 0x2515c, sampled 0
6c4f5ea934:    	strh	w21, [x19, #0x222]  // guest 0x2515c, sampled 0
6c4f5ea938:    	mov	w21, #0x515c            // =20828  // guest 0x2515c, sampled 0
6c4f5ea93c:    	movk	w21, #0x2, lsl #16  // guest 0x2515c, sampled 0
6c4f5ea940:    	str	w21, [x19, #0x228]  // guest 0x2515c, sampled 0
6c4f5ea944:    	add	w21, w20, #0x5  // guest 0x2515e, sampled 0
6c4f5ea948:    	and	w21, w21, #0x7  // guest 0x2515e, sampled 0
6c4f5ea94c:    	lsl	w21, w21, #4  // guest 0x2515e, sampled 0
6c4f5ea950:    	add	w21, w21, #0x1a0  // guest 0x2515e, sampled 0
6c4f5ea954:    	sxtw	x21, w21  // guest 0x2515e, sampled 0
6c4f5ea958:    	add	x1, x21, x19  // guest 0x2515e, sampled 0
6c4f5ea95c:    	lsl	w21, w20, #4  // guest 0x2515e, sampled 0
6c4f5ea960:    	add	w21, w21, #0x1a0  // guest 0x2515e, sampled 0
6c4f5ea964:    	sxtw	x21, w21  // guest 0x2515e, sampled 0
6c4f5ea968:    	add	x2, x21, x19  // guest 0x2515e, sampled 0
6c4f5ea96c:    	mov	x0, x19  // guest 0x2515e, sampled 0
6c4f5ea970:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x2515e, sampled 0
6c4f5ea974:    	add	x16, x16, #0x9a8  // guest 0x2515e, sampled 0
6c4f5ea978:    	blr	x16  // guest 0x2515e, sampled 0
6c4f5ea97c:    	sxtw	x21, w20  // guest 0x2515e, sampled 0
6c4f5ea980:    	add	x21, x21, x19  // guest 0x2515e, sampled 0
6c4f5ea984:    	strb	w22, [x21, #0x190]  // guest 0x2515e, sampled 0
6c4f5ea988:    	add	w20, w20, w22  // guest 0x2515e, sampled 0
6c4f5ea98c:    	and	w20, w20, #0x7  // guest 0x2515e, sampled 0
6c4f5ea990:    	ldr	w21, [x19, #0x54]  // guest 0x2515e, sampled 0
6c4f5ea994:    	strh	w21, [x19, #0x222]  // guest 0x2515e, sampled 0
6c4f5ea998:    	mov	w21, #0x515e            // =20830  // guest 0x2515e, sampled 0
6c4f5ea99c:    	movk	w21, #0x2, lsl #16  // guest 0x2515e, sampled 0
6c4f5ea9a0:    	str	w21, [x19, #0x228]  // guest 0x2515e, sampled 0
6c4f5ea9a4:    	add	w21, w20, #0x2  // guest 0x25160, sampled 0
6c4f5ea9a8:    	and	w21, w21, #0x7  // guest 0x25160, sampled 0
6c4f5ea9ac:    	lsl	w21, w21, #4  // guest 0x25160, sampled 0
6c4f5ea9b0:    	add	w21, w21, #0x1a0  // guest 0x25160, sampled 0
6c4f5ea9b4:    	sxtw	x21, w21  // guest 0x25160, sampled 0
6c4f5ea9b8:    	add	x1, x21, x19  // guest 0x25160, sampled 0
6c4f5ea9bc:    	lsl	w21, w20, #4  // guest 0x25160, sampled 0
6c4f5ea9c0:    	add	w21, w21, #0x1a0  // guest 0x25160, sampled 0
6c4f5ea9c4:    	sxtw	x21, w21  // guest 0x25160, sampled 1
6c4f5ea9c8:    	add	x2, x21, x19  // guest 0x25160, sampled 0
6c4f5ea9cc:    	mov	x0, x19  // guest 0x25160, sampled 0
6c4f5ea9d0:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x25160, sampled 0
6c4f5ea9d4:    	add	x16, x16, #0x9a8  // guest 0x25160, sampled 0
6c4f5ea9d8:    	blr	x16  // guest 0x25160, sampled 0
6c4f5ea9dc:    	sxtw	x21, w20  // guest 0x25160, sampled 0
6c4f5ea9e0:    	add	x21, x21, x19  // guest 0x25160, sampled 0
6c4f5ea9e4:    	strb	w22, [x21, #0x190]  // guest 0x25160, sampled 0
6c4f5ea9e8:    	add	w20, w20, w22  // guest 0x25160, sampled 0
6c4f5ea9ec:    	and	w20, w20, #0x7  // guest 0x25160, sampled 0
6c4f5ea9f0:    	str	w20, [x19, #0x188]  // guest 0x25160, sampled 0
6c4f5ea9f4:    	ldr	w20, [x19, #0x54]  // guest 0x25160, sampled 0
6c4f5ea9f8:    	strh	w20, [x19, #0x222]  // guest 0x25160, sampled 0
6c4f5ea9fc:    	mov	w20, #0x5160            // =20832  // guest 0x25160, sampled 0
6c4f5eaa00:    	movk	w20, #0x2, lsl #16  // guest 0x25160, sampled 0
6c4f5eaa04:    	str	w20, [x19, #0x228]  // guest 0x25160, sampled 0
6c4f5eaa08:    	mov	w1, #0x2                // =2  // guest 0x25162, sampled 0
6c4f5eaa0c:    	mov	x0, x19  // guest 0x25162, sampled 0
6c4f5eaa10:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x25162, sampled 0
6c4f5eaa14:    	add	x16, x16, #0x4d0  // guest 0x25162, sampled 0
6c4f5eaa18:    	blr	x16  // guest 0x25162, sampled 0
6c4f5eaa1c:    	ldr	w20, [x19, #0x54]  // guest 0x25162, sampled 0
6c4f5eaa20:    	strh	w20, [x19, #0x222]  // guest 0x25162, sampled 0
6c4f5eaa24:    	mov	w20, #0x5162            // =20834  // guest 0x25162, sampled 0
6c4f5eaa28:    	movk	w20, #0x2, lsl #16  // guest 0x25162, sampled 0
6c4f5eaa2c:    	str	w20, [x19, #0x228]  // guest 0x25162, sampled 0
6c4f5eaa30:    	ldr	w20, [x19, #0x188]  // guest 0x25164, sampled 0
6c4f5eaa34:    	sub	w20, w20, #0x1  // guest 0x25164, sampled 0
6c4f5eaa38:    	and	w20, w20, #0x7  // guest 0x25164, sampled 0
6c4f5eaa3c:    	str	w20, [x19, #0x188]  // guest 0x25164, sampled 0
6c4f5eaa40:    	sxtw	x21, w20  // guest 0x25164, sampled 0
6c4f5eaa44:    	add	x21, x21, x19  // guest 0x25164, sampled 0
6c4f5eaa48:    	strb	wzr, [x21, #0x190]  // guest 0x25164, sampled 0
6c4f5eaa4c:    	lsl	w21, w20, #4  // guest 0x25164, sampled 0
6c4f5eaa50:    	add	w21, w21, #0x1a0  // guest 0x25164, sampled 0
6c4f5eaa54:    	sxtw	x21, w21  // guest 0x25164, sampled 0
6c4f5eaa58:    	add	x21, x21, x19  // guest 0x25164, sampled 0
6c4f5eaa5c:    	add	w23, w20, w22  // guest 0x25164, sampled 0
6c4f5eaa60:    	and	w23, w23, #0x7  // guest 0x25164, sampled 0
6c4f5eaa64:    	lsl	w23, w23, #4  // guest 0x25164, sampled 0
6c4f5eaa68:    	add	w23, w23, #0x1a0  // guest 0x25164, sampled 0
6c4f5eaa6c:    	sxtw	x23, w23  // guest 0x25164, sampled 0
6c4f5eaa70:    	add	x23, x23, x19  // guest 0x25164, sampled 0
6c4f5eaa74:    	ldr	x24, [x23]  // guest 0x25164, sampled 0
6c4f5eaa78:    	ldrh	w23, [x23, #0x8]  // guest 0x25164, sampled 0
6c4f5eaa7c:    	str	x24, [x21]  // guest 0x25164, sampled 0
6c4f5eaa80:    	strh	w23, [x21, #0x8]  // guest 0x25164, sampled 0
6c4f5eaa84:    	ldr	w21, [x19, #0x54]  // guest 0x25164, sampled 0
6c4f5eaa88:    	strh	w21, [x19, #0x222]  // guest 0x25164, sampled 0
6c4f5eaa8c:    	mov	w21, #0x5164            // =20836  // guest 0x25164, sampled 0
6c4f5eaa90:    	movk	w21, #0x2, lsl #16  // guest 0x25164, sampled 0
6c4f5eaa94:    	str	w21, [x19, #0x228]  // guest 0x25164, sampled 0
6c4f5eaa98:    	ldr	w21, [x19, #0x8]  // guest 0x25166, sampled 0
6c4f5eaa9c:    	add	w23, w21, #0x14  // guest 0x25166, sampled 0
6c4f5eaaa0:    	mov	w24, w23  // guest 0x25166, sampled 0
6c4f5eaaa4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25166, sampled 0
6c4f5eaaa8:    	and	x16, x16, x23, lsr #7  // guest 0x25166, sampled 0
6c4f5eaaac:    	add	x17, x17, x16  // guest 0x25166, sampled 0
6c4f5eaab0:    	ldp	x16, x17, [x17]  // guest 0x25166, sampled 0
6c4f5eaab4:    	and	w30, w23, #0xfffff003  // guest 0x25166, sampled 0
6c4f5eaab8:    	cmp	w16, w30  // guest 0x25166, sampled 0
6c4f5eaabc:    	b.ne	0x6c4f5eb2d4 <trace+0x1254>  // guest 0x25166, sampled 0
6c4f5eaac0:    	add	x30, x17, w23, uxtw  // guest 0x25166, sampled 1
6c4f5eaac4:    	ldapr	w2, [x30]  // guest 0x25166, sampled 0
6c4f5eaac8:    	add	x1, x19, #0x258  // guest 0x25166, sampled 1
6c4f5eaacc:    	mov	x0, x19  // guest 0x25166, sampled 0
6c4f5eaad0:    	adrp	x16, 0x6c97751000 <trace+0x48167000>  // guest 0x25166, sampled 0
6c4f5eaad4:    	add	x16, x16, #0x3b4  // guest 0x25166, sampled 0
6c4f5eaad8:    	blr	x16  // guest 0x25166, sampled 0
6c4f5eaadc:    	lsl	w23, w20, #4  // guest 0x25166, sampled 0
6c4f5eaae0:    	add	w23, w23, #0x1a0  // guest 0x25166, sampled 0
6c4f5eaae4:    	sxtw	x23, w23  // guest 0x25166, sampled 0
6c4f5eaae8:    	add	x1, x23, x19  // guest 0x25166, sampled 0
6c4f5eaaec:    	add	x2, x19, #0x258  // guest 0x25166, sampled 0
6c4f5eaaf0:    	mov	x0, x19  // guest 0x25166, sampled 0
6c4f5eaaf4:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x25166, sampled 0
6c4f5eaaf8:    	add	x16, x16, #0xa7c  // guest 0x25166, sampled 0
6c4f5eaafc:    	blr	x16  // guest 0x25166, sampled 0
6c4f5eab00:    	ldr	w23, [x19, #0x74]  // guest 0x25166, sampled 0
6c4f5eab04:    	strh	w23, [x19, #0x224]  // guest 0x25166, sampled 0
6c4f5eab08:    	str	w24, [x19, #0x230]  // guest 0x25166, sampled 0
6c4f5eab0c:    	ldr	w23, [x19, #0x54]  // guest 0x25166, sampled 0
6c4f5eab10:    	strh	w23, [x19, #0x222]  // guest 0x25166, sampled 0
6c4f5eab14:    	mov	w23, #0x5166            // =20838  // guest 0x25166, sampled 0
6c4f5eab18:    	movk	w23, #0x2, lsl #16  // guest 0x25166, sampled 0
6c4f5eab1c:    	str	w23, [x19, #0x228]  // guest 0x25166, sampled 0
6c4f5eab20:    	sub	w20, w20, #0x1  // guest 0x25169, sampled 0
6c4f5eab24:    	and	w20, w20, #0x7  // guest 0x25169, sampled 0
6c4f5eab28:    	str	w20, [x19, #0x188]  // guest 0x25169, sampled 0
6c4f5eab2c:    	sxtw	x23, w20  // guest 0x25169, sampled 0
6c4f5eab30:    	add	x23, x23, x19  // guest 0x25169, sampled 0
6c4f5eab34:    	strb	wzr, [x23, #0x190]  // guest 0x25169, sampled 0
6c4f5eab38:    	lsl	w23, w20, #4  // guest 0x25169, sampled 0
6c4f5eab3c:    	add	w23, w23, #0x1a0  // guest 0x25169, sampled 0
6c4f5eab40:    	sxtw	x23, w23  // guest 0x25169, sampled 0
6c4f5eab44:    	add	x23, x23, x19  // guest 0x25169, sampled 0
6c4f5eab48:    	add	w24, w20, #0x2  // guest 0x25169, sampled 0
6c4f5eab4c:    	and	w24, w24, #0x7  // guest 0x25169, sampled 0
6c4f5eab50:    	lsl	w24, w24, #4  // guest 0x25169, sampled 0
6c4f5eab54:    	add	w24, w24, #0x1a0  // guest 0x25169, sampled 0
6c4f5eab58:    	sxtw	x24, w24  // guest 0x25169, sampled 0
6c4f5eab5c:    	add	x24, x24, x19  // guest 0x25169, sampled 0
6c4f5eab60:    	ldr	x25, [x24]  // guest 0x25169, sampled 0
6c4f5eab64:    	ldrh	w24, [x24, #0x8]  // guest 0x25169, sampled 2
6c4f5eab68:    	str	x25, [x23]  // guest 0x25169, sampled 0
6c4f5eab6c:    	strh	w24, [x23, #0x8]  // guest 0x25169, sampled 0
6c4f5eab70:    	ldr	w23, [x19, #0x54]  // guest 0x25169, sampled 0
6c4f5eab74:    	strh	w23, [x19, #0x222]  // guest 0x25169, sampled 0
6c4f5eab78:    	mov	w23, #0x5169            // =20841  // guest 0x25169, sampled 0
6c4f5eab7c:    	movk	w23, #0x2, lsl #16  // guest 0x25169, sampled 0
6c4f5eab80:    	str	w23, [x19, #0x228]  // guest 0x25169, sampled 0
6c4f5eab84:    	add	w21, w21, #0x20  // guest 0x2516b, sampled 0
6c4f5eab88:    	mov	w23, w21  // guest 0x2516b, sampled 0
6c4f5eab8c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2516b, sampled 0
6c4f5eab90:    	and	x16, x16, x21, lsr #7  // guest 0x2516b, sampled 0
6c4f5eab94:    	add	x17, x17, x16  // guest 0x2516b, sampled 0
6c4f5eab98:    	ldp	x16, x17, [x17]  // guest 0x2516b, sampled 0
6c4f5eab9c:    	and	w30, w21, #0xfffff003  // guest 0x2516b, sampled 0
6c4f5eaba0:    	cmp	w16, w30  // guest 0x2516b, sampled 0
6c4f5eaba4:    	b.ne	0x6c4f5eb300 <trace+0x1280>  // guest 0x2516b, sampled 0
6c4f5eaba8:    	add	x30, x17, w21, uxtw  // guest 0x2516b, sampled 0
6c4f5eabac:    	ldapr	w2, [x30]  // guest 0x2516b, sampled 0
6c4f5eabb0:    	add	x1, x19, #0x258  // guest 0x2516b, sampled 0
6c4f5eabb4:    	mov	x0, x19  // guest 0x2516b, sampled 0
6c4f5eabb8:    	adrp	x16, 0x6c97751000 <trace+0x48167000>  // guest 0x2516b, sampled 0
6c4f5eabbc:    	add	x16, x16, #0x3b4  // guest 0x2516b, sampled 0
6c4f5eabc0:    	blr	x16  // guest 0x2516b, sampled 0
6c4f5eabc4:    	lsl	w20, w20, #4  // guest 0x2516b, sampled 0
6c4f5eabc8:    	add	w20, w20, #0x1a0  // guest 0x2516b, sampled 0
6c4f5eabcc:    	sxtw	x20, w20  // guest 0x2516b, sampled 0
6c4f5eabd0:    	add	x1, x20, x19  // guest 0x2516b, sampled 0
6c4f5eabd4:    	add	x2, x19, #0x258  // guest 0x2516b, sampled 0
6c4f5eabd8:    	mov	x0, x19  // guest 0x2516b, sampled 0
6c4f5eabdc:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x2516b, sampled 0
6c4f5eabe0:    	add	x16, x16, #0xa7c  // guest 0x2516b, sampled 0
6c4f5eabe4:    	blr	x16  // guest 0x2516b, sampled 0
6c4f5eabe8:    	ldr	w20, [x19, #0x74]  // guest 0x2516b, sampled 0
6c4f5eabec:    	strh	w20, [x19, #0x224]  // guest 0x2516b, sampled 0
6c4f5eabf0:    	str	w23, [x19, #0x230]  // guest 0x2516b, sampled 0
6c4f5eabf4:    	ldr	w20, [x19, #0x54]  // guest 0x2516b, sampled 0
6c4f5eabf8:    	strh	w20, [x19, #0x222]  // guest 0x2516b, sampled 0
6c4f5eabfc:    	mov	w20, #0x516b            // =20843  // guest 0x2516b, sampled 0
6c4f5eac00:    	movk	w20, #0x2, lsl #16  // guest 0x2516b, sampled 0
6c4f5eac04:    	str	w20, [x19, #0x228]  // guest 0x2516b, sampled 0
6c4f5eac08:    	mov	w1, #0x2                // =2  // guest 0x2516e, sampled 0
6c4f5eac0c:    	mov	x0, x19  // guest 0x2516e, sampled 0
6c4f5eac10:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x2516e, sampled 0
6c4f5eac14:    	add	x16, x16, #0x4d0  // guest 0x2516e, sampled 0
6c4f5eac18:    	blr	x16  // guest 0x2516e, sampled 0
6c4f5eac1c:    	ldr	w20, [x19, #0x54]  // guest 0x2516e, sampled 0
6c4f5eac20:    	strh	w20, [x19, #0x222]  // guest 0x2516e, sampled 0
6c4f5eac24:    	mov	w20, #0x516e            // =20846  // guest 0x2516e, sampled 0
6c4f5eac28:    	movk	w20, #0x2, lsl #16  // guest 0x2516e, sampled 0
6c4f5eac2c:    	str	w20, [x19, #0x228]  // guest 0x2516e, sampled 0
6c4f5eac30:    	ldr	w20, [x19, #0x8]  // guest 0x25170, sampled 0
6c4f5eac34:    	add	w20, w20, #0x2c  // guest 0x25170, sampled 0
6c4f5eac38:    	mov	w21, w20  // guest 0x25170, sampled 0
6c4f5eac3c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25170, sampled 0
6c4f5eac40:    	and	x16, x16, x20, lsr #7  // guest 0x25170, sampled 0
6c4f5eac44:    	add	x17, x17, x16  // guest 0x25170, sampled 0
6c4f5eac48:    	ldp	x16, x17, [x17]  // guest 0x25170, sampled 0
6c4f5eac4c:    	and	w30, w20, #0xfffff003  // guest 0x25170, sampled 0
6c4f5eac50:    	cmp	w16, w30  // guest 0x25170, sampled 0
6c4f5eac54:    	b.ne	0x6c4f5eb32c <trace+0x12ac>  // guest 0x25170, sampled 0
6c4f5eac58:    	add	x30, x17, w20, uxtw  // guest 0x25170, sampled 0
6c4f5eac5c:    	ldapr	w2, [x30]  // guest 0x25170, sampled 0
6c4f5eac60:    	add	x1, x19, #0x258  // guest 0x25170, sampled 0
6c4f5eac64:    	mov	x0, x19  // guest 0x25170, sampled 0
6c4f5eac68:    	adrp	x16, 0x6c97751000 <trace+0x48167000>  // guest 0x25170, sampled 0
6c4f5eac6c:    	add	x16, x16, #0x3b4  // guest 0x25170, sampled 0
6c4f5eac70:    	blr	x16  // guest 0x25170, sampled 0
6c4f5eac74:    	ldr	w20, [x19, #0x188]  // guest 0x25170, sampled 0
6c4f5eac78:    	lsl	w20, w20, #4  // guest 0x25170, sampled 0
6c4f5eac7c:    	add	w20, w20, #0x1a0  // guest 0x25170, sampled 0
6c4f5eac80:    	sxtw	x20, w20  // guest 0x25170, sampled 0
6c4f5eac84:    	add	x1, x20, x19  // guest 0x25170, sampled 0
6c4f5eac88:    	add	x2, x19, #0x258  // guest 0x25170, sampled 0
6c4f5eac8c:    	mov	x0, x19  // guest 0x25170, sampled 0
6c4f5eac90:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x25170, sampled 0
6c4f5eac94:    	add	x16, x16, #0xa7c  // guest 0x25170, sampled 0
6c4f5eac98:    	blr	x16  // guest 0x25170, sampled 0
6c4f5eac9c:    	ldr	w20, [x19, #0x74]  // guest 0x25170, sampled 0
6c4f5eaca0:    	strh	w20, [x19, #0x224]  // guest 0x25170, sampled 0
6c4f5eaca4:    	str	w21, [x19, #0x230]  // guest 0x25170, sampled 0
6c4f5eaca8:    	ldr	w20, [x19, #0x54]  // guest 0x25170, sampled 0
6c4f5eacac:    	strh	w20, [x19, #0x222]  // guest 0x25170, sampled 0
6c4f5eacb0:    	mov	w20, #0x5170            // =20848  // guest 0x25170, sampled 0
6c4f5eacb4:    	movk	w20, #0x2, lsl #16  // guest 0x25170, sampled 0
6c4f5eacb8:    	str	w20, [x19, #0x228]  // guest 0x25170, sampled 0
6c4f5eacbc:    	mov	w1, w22  // guest 0x25173, sampled 0
6c4f5eacc0:    	mov	x0, x19  // guest 0x25173, sampled 0
6c4f5eacc4:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x25173, sampled 0
6c4f5eacc8:    	add	x16, x16, #0x4d0  // guest 0x25173, sampled 0
6c4f5eaccc:    	blr	x16  // guest 0x25173, sampled 0
6c4f5eacd0:    	ldr	w20, [x19, #0x54]  // guest 0x25173, sampled 0
6c4f5eacd4:    	strh	w20, [x19, #0x222]  // guest 0x25173, sampled 0
6c4f5eacd8:    	mov	w20, #0x5173            // =20851  // guest 0x25173, sampled 0
6c4f5eacdc:    	movk	w20, #0x2, lsl #16  // guest 0x25173, sampled 0
6c4f5eace0:    	str	w20, [x19, #0x228]  // guest 0x25173, sampled 0
6c4f5eace4:    	ldr	w20, [x19, #0x188]  // guest 0x25175, sampled 0
6c4f5eace8:    	add	w21, w20, #0x4  // guest 0x25175, sampled 0
6c4f5eacec:    	and	w21, w21, #0x7  // guest 0x25175, sampled 0
6c4f5eacf0:    	lsl	w21, w21, #4  // guest 0x25175, sampled 0
6c4f5eacf4:    	add	w21, w21, #0x1a0  // guest 0x25175, sampled 0
6c4f5eacf8:    	sxtw	x21, w21  // guest 0x25175, sampled 0
6c4f5eacfc:    	add	x1, x21, x19  // guest 0x25175, sampled 0
6c4f5ead00:    	lsl	w21, w20, #4  // guest 0x25175, sampled 0
6c4f5ead04:    	add	w21, w21, #0x1a0  // guest 0x25175, sampled 0
6c4f5ead08:    	sxtw	x21, w21  // guest 0x25175, sampled 0
6c4f5ead0c:    	add	x2, x21, x19  // guest 0x25175, sampled 0
6c4f5ead10:    	mov	x0, x19  // guest 0x25175, sampled 0
6c4f5ead14:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x25175, sampled 0
6c4f5ead18:    	add	x16, x16, #0x9a8  // guest 0x25175, sampled 0
6c4f5ead1c:    	blr	x16  // guest 0x25175, sampled 0
6c4f5ead20:    	sxtw	x21, w20  // guest 0x25175, sampled 0
6c4f5ead24:    	add	x21, x21, x19  // guest 0x25175, sampled 1
6c4f5ead28:    	strb	w22, [x21, #0x190]  // guest 0x25175, sampled 0
6c4f5ead2c:    	add	w20, w20, w22  // guest 0x25175, sampled 0
6c4f5ead30:    	and	w20, w20, #0x7  // guest 0x25175, sampled 0
6c4f5ead34:    	ldr	w21, [x19, #0x54]  // guest 0x25175, sampled 0
6c4f5ead38:    	strh	w21, [x19, #0x222]  // guest 0x25175, sampled 0
6c4f5ead3c:    	mov	w21, #0x5175            // =20853  // guest 0x25175, sampled 0
6c4f5ead40:    	movk	w21, #0x2, lsl #16  // guest 0x25175, sampled 0
6c4f5ead44:    	str	w21, [x19, #0x228]  // guest 0x25175, sampled 0
6c4f5ead48:    	add	w21, w20, #0x4  // guest 0x25177, sampled 0
6c4f5ead4c:    	and	w21, w21, #0x7  // guest 0x25177, sampled 0
6c4f5ead50:    	lsl	w21, w21, #4  // guest 0x25177, sampled 0
6c4f5ead54:    	add	w21, w21, #0x1a0  // guest 0x25177, sampled 0
6c4f5ead58:    	sxtw	x21, w21  // guest 0x25177, sampled 0
6c4f5ead5c:    	add	x1, x21, x19  // guest 0x25177, sampled 0
6c4f5ead60:    	lsl	w21, w20, #4  // guest 0x25177, sampled 0
6c4f5ead64:    	add	w21, w21, #0x1a0  // guest 0x25177, sampled 0
6c4f5ead68:    	sxtw	x21, w21  // guest 0x25177, sampled 0
6c4f5ead6c:    	add	x2, x21, x19  // guest 0x25177, sampled 0
6c4f5ead70:    	mov	x0, x19  // guest 0x25177, sampled 0
6c4f5ead74:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x25177, sampled 0
6c4f5ead78:    	add	x16, x16, #0x9a8  // guest 0x25177, sampled 0
6c4f5ead7c:    	blr	x16  // guest 0x25177, sampled 0
6c4f5ead80:    	sxtw	x21, w20  // guest 0x25177, sampled 0
6c4f5ead84:    	add	x21, x21, x19  // guest 0x25177, sampled 0
6c4f5ead88:    	strb	w22, [x21, #0x190]  // guest 0x25177, sampled 1
6c4f5ead8c:    	add	w20, w20, w22  // guest 0x25177, sampled 0
6c4f5ead90:    	and	w20, w20, #0x7  // guest 0x25177, sampled 0
6c4f5ead94:    	ldr	w21, [x19, #0x54]  // guest 0x25177, sampled 0
6c4f5ead98:    	strh	w21, [x19, #0x222]  // guest 0x25177, sampled 0
6c4f5ead9c:    	mov	w21, #0x5177            // =20855  // guest 0x25177, sampled 0
6c4f5eada0:    	movk	w21, #0x2, lsl #16  // guest 0x25177, sampled 0
6c4f5eada4:    	str	w21, [x19, #0x228]  // guest 0x25177, sampled 0
6c4f5eada8:    	add	w21, w20, w22  // guest 0x25179, sampled 0
6c4f5eadac:    	and	w21, w21, #0x7  // guest 0x25179, sampled 0
6c4f5eadb0:    	lsl	w21, w21, #4  // guest 0x25179, sampled 0
6c4f5eadb4:    	add	w21, w21, #0x1a0  // guest 0x25179, sampled 0
6c4f5eadb8:    	sxtw	x21, w21  // guest 0x25179, sampled 0
6c4f5eadbc:    	add	x1, x21, x19  // guest 0x25179, sampled 0
6c4f5eadc0:    	lsl	w21, w20, #4  // guest 0x25179, sampled 0
6c4f5eadc4:    	add	w21, w21, #0x1a0  // guest 0x25179, sampled 0
6c4f5eadc8:    	sxtw	x21, w21  // guest 0x25179, sampled 0
6c4f5eadcc:    	add	x2, x21, x19  // guest 0x25179, sampled 0
6c4f5eadd0:    	mov	x0, x19  // guest 0x25179, sampled 0
6c4f5eadd4:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x25179, sampled 0
6c4f5eadd8:    	add	x16, x16, #0x9a8  // guest 0x25179, sampled 0
6c4f5eaddc:    	blr	x16  // guest 0x25179, sampled 0
6c4f5eade0:    	sxtw	x21, w20  // guest 0x25179, sampled 0
6c4f5eade4:    	add	x21, x21, x19  // guest 0x25179, sampled 0
6c4f5eade8:    	strb	w22, [x21, #0x190]  // guest 0x25179, sampled 0
6c4f5eadec:    	add	w20, w20, w22  // guest 0x25179, sampled 0
6c4f5eadf0:    	and	w20, w20, #0x7  // guest 0x25179, sampled 0
6c4f5eadf4:    	str	w20, [x19, #0x188]  // guest 0x25179, sampled 0
6c4f5eadf8:    	ldr	w20, [x19, #0x54]  // guest 0x25179, sampled 0
6c4f5eadfc:    	strh	w20, [x19, #0x222]  // guest 0x25179, sampled 0
6c4f5eae00:    	mov	w20, #0x5179            // =20857  // guest 0x25179, sampled 0
6c4f5eae04:    	movk	w20, #0x2, lsl #16  // guest 0x25179, sampled 0
6c4f5eae08:    	str	w20, [x19, #0x228]  // guest 0x25179, sampled 0
6c4f5eae0c:    	mov	w1, w22  // guest 0x2517b, sampled 0
6c4f5eae10:    	mov	x0, x19  // guest 0x2517b, sampled 0
6c4f5eae14:    	adrp	x16, 0x6c97752000 <trace+0x48168000>  // guest 0x2517b, sampled 0
6c4f5eae18:    	add	x16, x16, #0x4d0  // guest 0x2517b, sampled 0
6c4f5eae1c:    	blr	x16  // guest 0x2517b, sampled 0
6c4f5eae20:    	ldr	w20, [x19, #0x54]  // guest 0x2517b, sampled 0
6c4f5eae24:    	strh	w20, [x19, #0x222]  // guest 0x2517b, sampled 0
6c4f5eae28:    	mov	w20, #0x517b            // =20859  // guest 0x2517b, sampled 0
6c4f5eae2c:    	movk	w20, #0x2, lsl #16  // guest 0x2517b, sampled 0
6c4f5eae30:    	str	w20, [x19, #0x228]  // guest 0x2517b, sampled 0
6c4f5eae34:    	ldr	w20, [x19, #0x188]  // guest 0x2517d, sampled 0
6c4f5eae38:    	lsl	w21, w20, #4  // guest 0x2517d, sampled 0
6c4f5eae3c:    	add	w21, w21, #0x1a0  // guest 0x2517d, sampled 0
6c4f5eae40:    	sxtw	x21, w21  // guest 0x2517d, sampled 0
6c4f5eae44:    	add	x1, x21, x19  // guest 0x2517d, sampled 0
6c4f5eae48:    	mov	x0, x19  // guest 0x2517d, sampled 0
6c4f5eae4c:    	adrp	x16, 0x6c97751000 <trace+0x48167000>  // guest 0x2517d, sampled 0
6c4f5eae50:    	add	x16, x16, #0x4f0  // guest 0x2517d, sampled 0
6c4f5eae54:    	blr	x16  // guest 0x2517d, sampled 0
6c4f5eae58:    	ldr	w21, [x19, #0x1c]  // guest 0x2517d, sampled 0
6c4f5eae5c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2517d, sampled 0
6c4f5eae60:    	and	x16, x16, x21, lsr #7  // guest 0x2517d, sampled 0
6c4f5eae64:    	add	x17, x17, x16  // guest 0x2517d, sampled 0
6c4f5eae68:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2517d, sampled 0
6c4f5eae6c:    	and	w30, w21, #0xfffff003  // guest 0x2517d, sampled 0
6c4f5eae70:    	cmp	w16, w30  // guest 0x2517d, sampled 0
6c4f5eae74:    	b.ne	0x6c4f5eb358 <trace+0x12d8>  // guest 0x2517d, sampled 0
6c4f5eae78:    	add	x30, x17, w21, uxtw  // guest 0x2517d, sampled 0
6c4f5eae7c:    	stlr	w0, [x30]  // guest 0x2517d, sampled 0
6c4f5eae80:    	sxtw	x23, w20  // guest 0x2517d, sampled 0
6c4f5eae84:    	add	x23, x23, x19  // guest 0x2517d, sampled 0
6c4f5eae88:    	strb	w22, [x23, #0x190]  // guest 0x2517d, sampled 0
6c4f5eae8c:    	add	w20, w20, w22  // guest 0x2517d, sampled 0
6c4f5eae90:    	and	w20, w20, #0x7  // guest 0x2517d, sampled 0
6c4f5eae94:    	str	w20, [x19, #0x188]  // guest 0x2517d, sampled 0
6c4f5eae98:    	ldr	w23, [x19, #0x74]  // guest 0x2517d, sampled 0
6c4f5eae9c:    	strh	w23, [x19, #0x224]  // guest 0x2517d, sampled 0
6c4f5eaea0:    	str	w21, [x19, #0x230]  // guest 0x2517d, sampled 0
6c4f5eaea4:    	ldr	w23, [x19, #0x54]  // guest 0x2517d, sampled 0
6c4f5eaea8:    	strh	w23, [x19, #0x222]  // guest 0x2517d, sampled 0
6c4f5eaeac:    	mov	w23, #0x517d            // =20861  // guest 0x2517d, sampled 0
6c4f5eaeb0:    	movk	w23, #0x2, lsl #16  // guest 0x2517d, sampled 0
6c4f5eaeb4:    	str	w23, [x19, #0x228]  // guest 0x2517d, sampled 0
6c4f5eaeb8:    	add	w23, w21, #0x4  // guest 0x2517f, sampled 0
6c4f5eaebc:    	mov	w24, w23  // guest 0x2517f, sampled 0
6c4f5eaec0:    	lsl	w25, w20, #4  // guest 0x2517f, sampled 0
6c4f5eaec4:    	add	w25, w25, #0x1a0  // guest 0x2517f, sampled 0
6c4f5eaec8:    	sxtw	x25, w25  // guest 0x2517f, sampled 0
6c4f5eaecc:    	add	x1, x25, x19  // guest 0x2517f, sampled 0
6c4f5eaed0:    	mov	x0, x19  // guest 0x2517f, sampled 0
6c4f5eaed4:    	adrp	x16, 0x6c97751000 <trace+0x48167000>  // guest 0x2517f, sampled 0
6c4f5eaed8:    	add	x16, x16, #0x4f0  // guest 0x2517f, sampled 0
6c4f5eaedc:    	blr	x16  // guest 0x2517f, sampled 0
6c4f5eaee0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2517f, sampled 0
6c4f5eaee4:    	and	x16, x16, x23, lsr #7  // guest 0x2517f, sampled 0
6c4f5eaee8:    	add	x17, x17, x16  // guest 0x2517f, sampled 0
6c4f5eaeec:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2517f, sampled 0
6c4f5eaef0:    	and	w30, w23, #0xfffff003  // guest 0x2517f, sampled 0
6c4f5eaef4:    	cmp	w16, w30  // guest 0x2517f, sampled 0
6c4f5eaef8:    	b.ne	0x6c4f5eb384 <trace+0x1304>  // guest 0x2517f, sampled 0
6c4f5eaefc:    	add	x30, x17, w23, uxtw  // guest 0x2517f, sampled 1
6c4f5eaf00:    	stlr	w0, [x30]  // guest 0x2517f, sampled 0
6c4f5eaf04:    	sxtw	x23, w20  // guest 0x2517f, sampled 1
6c4f5eaf08:    	add	x23, x23, x19  // guest 0x2517f, sampled 0
6c4f5eaf0c:    	strb	w22, [x23, #0x190]  // guest 0x2517f, sampled 0
6c4f5eaf10:    	add	w20, w20, w22  // guest 0x2517f, sampled 0
6c4f5eaf14:    	and	w20, w20, #0x7  // guest 0x2517f, sampled 0
6c4f5eaf18:    	str	w20, [x19, #0x188]  // guest 0x2517f, sampled 0
6c4f5eaf1c:    	ldr	w23, [x19, #0x74]  // guest 0x2517f, sampled 0
6c4f5eaf20:    	strh	w23, [x19, #0x224]  // guest 0x2517f, sampled 0
6c4f5eaf24:    	str	w24, [x19, #0x230]  // guest 0x2517f, sampled 0
6c4f5eaf28:    	ldr	w23, [x19, #0x54]  // guest 0x2517f, sampled 0
6c4f5eaf2c:    	strh	w23, [x19, #0x222]  // guest 0x2517f, sampled 0
6c4f5eaf30:    	mov	w23, #0x517f            // =20863  // guest 0x2517f, sampled 0
6c4f5eaf34:    	movk	w23, #0x2, lsl #16  // guest 0x2517f, sampled 0
6c4f5eaf38:    	str	w23, [x19, #0x228]  // guest 0x2517f, sampled 0
6c4f5eaf3c:    	add	w21, w21, #0x8  // guest 0x25182, sampled 0
6c4f5eaf40:    	mov	w23, w21  // guest 0x25182, sampled 0
6c4f5eaf44:    	lsl	w24, w20, #4  // guest 0x25182, sampled 0
6c4f5eaf48:    	add	w24, w24, #0x1a0  // guest 0x25182, sampled 0
6c4f5eaf4c:    	sxtw	x24, w24  // guest 0x25182, sampled 0
6c4f5eaf50:    	add	x1, x24, x19  // guest 0x25182, sampled 0
6c4f5eaf54:    	mov	x0, x19  // guest 0x25182, sampled 0
6c4f5eaf58:    	adrp	x16, 0x6c97751000 <trace+0x48167000>  // guest 0x25182, sampled 0
6c4f5eaf5c:    	add	x16, x16, #0x4f0  // guest 0x25182, sampled 0
6c4f5eaf60:    	blr	x16  // guest 0x25182, sampled 0
6c4f5eaf64:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25182, sampled 0
6c4f5eaf68:    	and	x16, x16, x21, lsr #7  // guest 0x25182, sampled 0
6c4f5eaf6c:    	add	x17, x17, x16  // guest 0x25182, sampled 0
6c4f5eaf70:    	ldp	x17, x16, [x17, #0x8]  // guest 0x25182, sampled 0
6c4f5eaf74:    	and	w30, w21, #0xfffff003  // guest 0x25182, sampled 0
6c4f5eaf78:    	cmp	w16, w30  // guest 0x25182, sampled 0
6c4f5eaf7c:    	b.ne	0x6c4f5eb3b0 <trace+0x1330>  // guest 0x25182, sampled 0
6c4f5eaf80:    	add	x30, x17, w21, uxtw  // guest 0x25182, sampled 0
6c4f5eaf84:    	stlr	w0, [x30]  // guest 0x25182, sampled 0
6c4f5eaf88:    	sxtw	x21, w20  // guest 0x25182, sampled 0
6c4f5eaf8c:    	add	x21, x21, x19  // guest 0x25182, sampled 0
6c4f5eaf90:    	strb	w22, [x21, #0x190]  // guest 0x25182, sampled 0
6c4f5eaf94:    	add	w20, w20, w22  // guest 0x25182, sampled 0
6c4f5eaf98:    	and	w20, w20, #0x7  // guest 0x25182, sampled 0
6c4f5eaf9c:    	str	w20, [x19, #0x188]  // guest 0x25182, sampled 0
6c4f5eafa0:    	ldr	w20, [x19, #0x74]  // guest 0x25182, sampled 0
6c4f5eafa4:    	strh	w20, [x19, #0x224]  // guest 0x25182, sampled 0
6c4f5eafa8:    	str	w23, [x19, #0x230]  // guest 0x25182, sampled 0
6c4f5eafac:    	ldr	w20, [x19, #0x54]  // guest 0x25182, sampled 0
6c4f5eafb0:    	strh	w20, [x19, #0x222]  // guest 0x25182, sampled 0
6c4f5eafb4:    	mov	w20, #0x5182            // =20866  // guest 0x25182, sampled 0
6c4f5eafb8:    	movk	w20, #0x2, lsl #16  // guest 0x25182, sampled 0
6c4f5eafbc:    	str	w20, [x19, #0x228]  // guest 0x25182, sampled 0
6c4f5eafc0:    	ldr	w20, [x19, #0x10]  // guest 0x25185, sampled 0
6c4f5eafc4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25185, sampled 0
6c4f5eafc8:    	and	x16, x16, x20, lsr #7  // guest 0x25185, sampled 0
6c4f5eafcc:    	add	x17, x17, x16  // guest 0x25185, sampled 0
6c4f5eafd0:    	ldp	x16, x17, [x17]  // guest 0x25185, sampled 0
6c4f5eafd4:    	and	w30, w20, #0xfffff003  // guest 0x25185, sampled 0
6c4f5eafd8:    	cmp	w16, w30  // guest 0x25185, sampled 0
6c4f5eafdc:    	b.ne	0x6c4f5eb3dc <trace+0x135c>  // guest 0x25185, sampled 0
6c4f5eafe0:    	add	x30, x17, w20, uxtw  // guest 0x25185, sampled 0
6c4f5eafe4:    	ldapr	w21, [x30]  // guest 0x25185, sampled 0
6c4f5eafe8:    	add	w20, w20, #0x4  // guest 0x25185, sampled 0
6c4f5eafec:    	str	w20, [x19, #0x10]  // guest 0x25185, sampled 0
6c4f5eaff0:    	str	w21, [x19, #0x1c]  // guest 0x25185, sampled 0
6c4f5eaff4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25186, sampled 0
6c4f5eaff8:    	and	x16, x16, x20, lsr #7  // guest 0x25186, sampled 0
6c4f5eaffc:    	add	x17, x17, x16  // guest 0x25186, sampled 0
6c4f5eb000:    	ldp	x16, x17, [x17]  // guest 0x25186, sampled 0
6c4f5eb004:    	and	w30, w20, #0xfffff003  // guest 0x25186, sampled 0
6c4f5eb008:    	cmp	w16, w30  // guest 0x25186, sampled 0
6c4f5eb00c:    	b.ne	0x6c4f5eb408 <trace+0x1388>  // guest 0x25186, sampled 0
6c4f5eb010:    	add	x30, x17, w20, uxtw  // guest 0x25186, sampled 0
6c4f5eb014:    	ldapr	w21, [x30]  // guest 0x25186, sampled 0
6c4f5eb018:    	add	w20, w20, #0x4  // guest 0x25186, sampled 0
6c4f5eb01c:    	str	w20, [x19, #0x10]  // guest 0x25186, sampled 0
6c4f5eb020:    	str	w21, [x19, #0x18]  // guest 0x25186, sampled 0
6c4f5eb024:    	sturb	w22, [x19, #-0xc]  // guest 0x25186, sampled 0
6c4f5eb028:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25187, sampled 0
6c4f5eb02c:    	and	x16, x16, x20, lsr #7  // guest 0x25187, sampled 0
6c4f5eb030:    	add	x17, x17, x16  // guest 0x25187, sampled 0
6c4f5eb034:    	ldp	x16, x17, [x17]  // guest 0x25187, sampled 0
6c4f5eb038:    	and	w30, w20, #0xfffff003  // guest 0x25187, sampled 0
6c4f5eb03c:    	cmp	w16, w30  // guest 0x25187, sampled 0
6c4f5eb040:    	b.ne	0x6c4f5eb434 <trace+0x13b4>  // guest 0x25187, sampled 0
6c4f5eb044:    	add	x30, x17, w20, uxtw  // guest 0x25187, sampled 0
6c4f5eb048:    	ldapr	w21, [x30]  // guest 0x25187, sampled 0
6c4f5eb04c:    	add	w20, w20, #0x4  // guest 0x25187, sampled 0
6c4f5eb050:    	str	w20, [x19, #0x10]  // guest 0x25187, sampled 0
6c4f5eb054:    	str	w21, [x19, #0x20]  // guest 0x25187, sampled 0
6c4f5eb058:    	mov	x0, x19  // guest 0x25187, sampled 0
6c4f5eb05c:    	bl	0x6c4ae5d53c <trace+0xfffffffffb8734bc>  // guest 0x25187, sampled 0
6c4f5eb060:    	br	x0  // guest 0x25187, sampled 0
6c4f5eb064:    	adr	x0, 0x6c4f5e9fc3 <trace+0xffffffffffffff43>  // guest 0x25187, sampled 0
6c4f5eb068:    	b	0x6c4ae5d02c <trace+0xfffffffffb872fac>  // guest 0x25187, sampled 0
6c4f5eb06c:    	mov	w1, w21
6c4f5eb070:    	mov	w2, w22
6c4f5eb074:    	mov	x0, x19
6c4f5eb078:    	mov	w3, #0x4045             // =16453
6c4f5eb07c:    	movk	w3, #0x1, lsl #16
6c4f5eb080:    	adr	x4, 0x6c4f5ea0c0 <trace+0x40>
6c4f5eb084:    	adrp	x16, 0x6c97724000 <trace+0x4813a000>
6c4f5eb088:    	add	x16, x16, #0xb68
6c4f5eb08c:    	blr	x16
6c4f5eb090:    	dmb	ishld
6c4f5eb094:    	b	0x6c4f5ea0c0 <trace+0x40>
6c4f5eb098:    	mov	w1, w21
6c4f5eb09c:    	mov	w2, w22
6c4f5eb0a0:    	mov	x0, x19
6c4f5eb0a4:    	mov	w3, #0x4045             // =16453
6c4f5eb0a8:    	movk	w3, #0x1, lsl #16
6c4f5eb0ac:    	adr	x4, 0x6c4f5ea0f4 <trace+0x74>
6c4f5eb0b0:    	adrp	x16, 0x6c97724000 <trace+0x4813a000>
6c4f5eb0b4:    	add	x16, x16, #0xb68
6c4f5eb0b8:    	blr	x16
6c4f5eb0bc:    	dmb	ishld
6c4f5eb0c0:    	b	0x6c4f5ea0f4 <trace+0x74>
6c4f5eb0c4:    	mov	w1, w21
6c4f5eb0c8:    	mov	x0, x19
6c4f5eb0cc:    	mov	w2, #0x4045             // =16453
6c4f5eb0d0:    	movk	w2, #0x1, lsl #16
6c4f5eb0d4:    	adr	x3, 0x6c4f5ea120 <trace+0xa0>
6c4f5eb0d8:    	adrp	x16, 0x6c97723000 <trace+0x48139000>
6c4f5eb0dc:    	add	x16, x16, #0xf88
6c4f5eb0e0:    	blr	x16
6c4f5eb0e4:    	mov	w21, w0
6c4f5eb0e8:    	dmb	ishld
6c4f5eb0ec:    	b	0x6c4f5ea120 <trace+0xa0>
6c4f5eb0f0:    	mov	w1, w22
6c4f5eb0f4:    	mov	x0, x19
6c4f5eb0f8:    	mov	w2, #0x4045             // =16453
6c4f5eb0fc:    	movk	w2, #0x1, lsl #16
6c4f5eb100:    	adr	x3, 0x6c4f5ea14c <trace+0xcc>
6c4f5eb104:    	adrp	x16, 0x6c97723000 <trace+0x48139000>
6c4f5eb108:    	add	x16, x16, #0xf88
6c4f5eb10c:    	blr	x16
6c4f5eb110:    	mov	w22, w0
6c4f5eb114:    	dmb	ishld
6c4f5eb118:    	b	0x6c4f5ea14c <trace+0xcc>
6c4f5eb11c:    	mov	w1, w20
6c4f5eb120:    	mov	x0, x19
6c4f5eb124:    	mov	w2, #0x4045             // =16453
6c4f5eb128:    	movk	w2, #0x1, lsl #16
6c4f5eb12c:    	adr	x3, 0x6c4f5ea178 <trace+0xf8>
6c4f5eb130:    	adrp	x16, 0x6c97723000 <trace+0x48139000>
6c4f5eb134:    	add	x16, x16, #0xf88
6c4f5eb138:    	blr	x16
6c4f5eb13c:    	mov	w20, w0
6c4f5eb140:    	dmb	ishld
6c4f5eb144:    	b	0x6c4f5ea178 <trace+0xf8>
6c4f5eb148:    	mov	w1, w21
6c4f5eb14c:    	mov	x0, x19
6c4f5eb150:    	mov	w2, #0x4045             // =16453
6c4f5eb154:    	movk	w2, #0x1, lsl #16
6c4f5eb158:    	adr	x3, 0x6c4f5ea1a0 <trace+0x120>
6c4f5eb15c:    	adrp	x16, 0x6c97723000 <trace+0x48139000>
6c4f5eb160:    	add	x16, x16, #0xf88
6c4f5eb164:    	blr	x16
6c4f5eb168:    	mov	w2, w0
6c4f5eb16c:    	dmb	ishld
6c4f5eb170:    	b	0x6c4f5ea1a0 <trace+0x120>
6c4f5eb174:    	mov	w1, w21
6c4f5eb178:    	mov	x0, x19
6c4f5eb17c:    	mov	w2, #0x4045             // =16453
6c4f5eb180:    	movk	w2, #0x1, lsl #16
6c4f5eb184:    	adr	x3, 0x6c4f5ea230 <trace+0x1b0>
6c4f5eb188:    	adrp	x16, 0x6c97723000 <trace+0x48139000>
6c4f5eb18c:    	add	x16, x16, #0xf88
6c4f5eb190:    	blr	x16
6c4f5eb194:    	mov	w2, w0
6c4f5eb198:    	dmb	ishld
6c4f5eb19c:    	b	0x6c4f5ea230 <trace+0x1b0>
6c4f5eb1a0:    	mov	w1, w20
6c4f5eb1a4:    	mov	x0, x19
6c4f5eb1a8:    	mov	w2, #0x4045             // =16453
6c4f5eb1ac:    	movk	w2, #0x1, lsl #16
6c4f5eb1b0:    	adr	x3, 0x6c4f5ea2e8 <trace+0x268>
6c4f5eb1b4:    	adrp	x16, 0x6c97723000 <trace+0x48139000>
6c4f5eb1b8:    	add	x16, x16, #0xf88
6c4f5eb1bc:    	blr	x16
6c4f5eb1c0:    	mov	w2, w0
6c4f5eb1c4:    	dmb	ishld
6c4f5eb1c8:    	b	0x6c4f5ea2e8 <trace+0x268>
6c4f5eb1cc:    	mov	w1, w22
6c4f5eb1d0:    	mov	x0, x19
6c4f5eb1d4:    	mov	w2, #0x4045             // =16453
6c4f5eb1d8:    	movk	w2, #0x1, lsl #16
6c4f5eb1dc:    	adr	x3, 0x6c4f5ea40c <trace+0x38c>
6c4f5eb1e0:    	adrp	x16, 0x6c97723000 <trace+0x48139000>
6c4f5eb1e4:    	add	x16, x16, #0xf88
6c4f5eb1e8:    	blr	x16
6c4f5eb1ec:    	mov	w2, w0
6c4f5eb1f0:    	dmb	ishld
6c4f5eb1f4:    	b	0x6c4f5ea40c <trace+0x38c>
6c4f5eb1f8:    	mov	w1, w21
6c4f5eb1fc:    	mov	x0, x19
6c4f5eb200:    	mov	w2, #0x4045             // =16453
6c4f5eb204:    	movk	w2, #0x1, lsl #16
6c4f5eb208:    	adr	x3, 0x6c4f5ea4f4 <trace+0x474>
6c4f5eb20c:    	adrp	x16, 0x6c97723000 <trace+0x48139000>
6c4f5eb210:    	add	x16, x16, #0xf88
6c4f5eb214:    	blr	x16
6c4f5eb218:    	mov	w2, w0
6c4f5eb21c:    	dmb	ishld
6c4f5eb220:    	b	0x6c4f5ea4f4 <trace+0x474>
6c4f5eb224:    	mov	w1, w20
6c4f5eb228:    	mov	x0, x19
6c4f5eb22c:    	mov	w2, #0x4045             // =16453
6c4f5eb230:    	movk	w2, #0x1, lsl #16
6c4f5eb234:    	adr	x3, 0x6c4f5ea5a4 <trace+0x524>
6c4f5eb238:    	adrp	x16, 0x6c97723000 <trace+0x48139000>
6c4f5eb23c:    	add	x16, x16, #0xf88
6c4f5eb240:    	blr	x16
6c4f5eb244:    	mov	w2, w0
6c4f5eb248:    	dmb	ishld
6c4f5eb24c:    	b	0x6c4f5ea5a4 <trace+0x524>
6c4f5eb250:    	mov	w1, w22
6c4f5eb254:    	mov	x0, x19
6c4f5eb258:    	mov	w2, #0x4045             // =16453
6c4f5eb25c:    	movk	w2, #0x1, lsl #16
6c4f5eb260:    	adr	x3, 0x6c4f5ea6c0 <trace+0x640>
6c4f5eb264:    	adrp	x16, 0x6c97723000 <trace+0x48139000>
6c4f5eb268:    	add	x16, x16, #0xf88
6c4f5eb26c:    	blr	x16
6c4f5eb270:    	mov	w2, w0
6c4f5eb274:    	dmb	ishld
6c4f5eb278:    	b	0x6c4f5ea6c0 <trace+0x640>
6c4f5eb27c:    	mov	w1, w21
6c4f5eb280:    	mov	x0, x19
6c4f5eb284:    	mov	w2, #0x4045             // =16453
6c4f5eb288:    	movk	w2, #0x1, lsl #16
6c4f5eb28c:    	adr	x3, 0x6c4f5ea7a8 <trace+0x728>
6c4f5eb290:    	adrp	x16, 0x6c97723000 <trace+0x48139000>
6c4f5eb294:    	add	x16, x16, #0xf88
6c4f5eb298:    	blr	x16
6c4f5eb29c:    	mov	w2, w0
6c4f5eb2a0:    	dmb	ishld
6c4f5eb2a4:    	b	0x6c4f5ea7a8 <trace+0x728>
6c4f5eb2a8:    	mov	w1, w20
6c4f5eb2ac:    	mov	x0, x19
6c4f5eb2b0:    	mov	w2, #0x4045             // =16453
6c4f5eb2b4:    	movk	w2, #0x1, lsl #16
6c4f5eb2b8:    	adr	x3, 0x6c4f5ea858 <trace+0x7d8>
6c4f5eb2bc:    	adrp	x16, 0x6c97723000 <trace+0x48139000>
6c4f5eb2c0:    	add	x16, x16, #0xf88
6c4f5eb2c4:    	blr	x16
6c4f5eb2c8:    	mov	w2, w0
6c4f5eb2cc:    	dmb	ishld
6c4f5eb2d0:    	b	0x6c4f5ea858 <trace+0x7d8>
6c4f5eb2d4:    	mov	w1, w23
6c4f5eb2d8:    	mov	x0, x19
6c4f5eb2dc:    	mov	w2, #0x4045             // =16453
6c4f5eb2e0:    	movk	w2, #0x1, lsl #16
6c4f5eb2e4:    	adr	x3, 0x6c4f5eaac8 <trace+0xa48>
6c4f5eb2e8:    	adrp	x16, 0x6c97723000 <trace+0x48139000>
6c4f5eb2ec:    	add	x16, x16, #0xf88
6c4f5eb2f0:    	blr	x16
6c4f5eb2f4:    	mov	w2, w0
6c4f5eb2f8:    	dmb	ishld
6c4f5eb2fc:    	b	0x6c4f5eaac8 <trace+0xa48>
6c4f5eb300:    	mov	w1, w21
6c4f5eb304:    	mov	x0, x19
6c4f5eb308:    	mov	w2, #0x4045             // =16453
6c4f5eb30c:    	movk	w2, #0x1, lsl #16
6c4f5eb310:    	adr	x3, 0x6c4f5eabb0 <trace+0xb30>
6c4f5eb314:    	adrp	x16, 0x6c97723000 <trace+0x48139000>
6c4f5eb318:    	add	x16, x16, #0xf88
6c4f5eb31c:    	blr	x16
6c4f5eb320:    	mov	w2, w0
6c4f5eb324:    	dmb	ishld
6c4f5eb328:    	b	0x6c4f5eabb0 <trace+0xb30>
6c4f5eb32c:    	mov	w1, w20
6c4f5eb330:    	mov	x0, x19
6c4f5eb334:    	mov	w2, #0x4045             // =16453
6c4f5eb338:    	movk	w2, #0x1, lsl #16
6c4f5eb33c:    	adr	x3, 0x6c4f5eac60 <trace+0xbe0>
6c4f5eb340:    	adrp	x16, 0x6c97723000 <trace+0x48139000>
6c4f5eb344:    	add	x16, x16, #0xf88
6c4f5eb348:    	blr	x16
6c4f5eb34c:    	mov	w2, w0
6c4f5eb350:    	dmb	ishld
6c4f5eb354:    	b	0x6c4f5eac60 <trace+0xbe0>
6c4f5eb358:    	mov	w1, w21
6c4f5eb35c:    	mov	w2, w0
6c4f5eb360:    	mov	x0, x19
6c4f5eb364:    	mov	w3, #0x4045             // =16453
6c4f5eb368:    	movk	w3, #0x1, lsl #16
6c4f5eb36c:    	adr	x4, 0x6c4f5eae80 <trace+0xe00>
6c4f5eb370:    	adrp	x16, 0x6c97724000 <trace+0x4813a000>
6c4f5eb374:    	add	x16, x16, #0xb68
6c4f5eb378:    	blr	x16
6c4f5eb37c:    	dmb	ishld
6c4f5eb380:    	b	0x6c4f5eae80 <trace+0xe00>
6c4f5eb384:    	mov	w1, w23
6c4f5eb388:    	mov	w2, w0
6c4f5eb38c:    	mov	x0, x19
6c4f5eb390:    	mov	w3, #0x4045             // =16453
6c4f5eb394:    	movk	w3, #0x1, lsl #16
6c4f5eb398:    	adr	x4, 0x6c4f5eaf04 <trace+0xe84>
6c4f5eb39c:    	adrp	x16, 0x6c97724000 <trace+0x4813a000>
6c4f5eb3a0:    	add	x16, x16, #0xb68
6c4f5eb3a4:    	blr	x16
6c4f5eb3a8:    	dmb	ishld
6c4f5eb3ac:    	b	0x6c4f5eaf04 <trace+0xe84>
6c4f5eb3b0:    	mov	w1, w21
6c4f5eb3b4:    	mov	w2, w0
6c4f5eb3b8:    	mov	x0, x19
6c4f5eb3bc:    	mov	w3, #0x4045             // =16453
6c4f5eb3c0:    	movk	w3, #0x1, lsl #16
6c4f5eb3c4:    	adr	x4, 0x6c4f5eaf88 <trace+0xf08>
6c4f5eb3c8:    	adrp	x16, 0x6c97724000 <trace+0x4813a000>
6c4f5eb3cc:    	add	x16, x16, #0xb68
6c4f5eb3d0:    	blr	x16
6c4f5eb3d4:    	dmb	ishld
6c4f5eb3d8:    	b	0x6c4f5eaf88 <trace+0xf08>
6c4f5eb3dc:    	mov	w1, w20
6c4f5eb3e0:    	mov	x0, x19
6c4f5eb3e4:    	mov	w2, #0x4045             // =16453
6c4f5eb3e8:    	movk	w2, #0x1, lsl #16
6c4f5eb3ec:    	adr	x3, 0x6c4f5eafe8 <trace+0xf68>
6c4f5eb3f0:    	adrp	x16, 0x6c97723000 <trace+0x48139000>
6c4f5eb3f4:    	add	x16, x16, #0xf88
6c4f5eb3f8:    	blr	x16
6c4f5eb3fc:    	mov	w21, w0
6c4f5eb400:    	dmb	ishld
6c4f5eb404:    	b	0x6c4f5eafe8 <trace+0xf68>
6c4f5eb408:    	mov	w1, w20
6c4f5eb40c:    	mov	x0, x19
6c4f5eb410:    	mov	w2, #0x4045             // =16453
6c4f5eb414:    	movk	w2, #0x1, lsl #16
6c4f5eb418:    	adr	x3, 0x6c4f5eb018 <trace+0xf98>
6c4f5eb41c:    	adrp	x16, 0x6c97723000 <trace+0x48139000>
6c4f5eb420:    	add	x16, x16, #0xf88
6c4f5eb424:    	blr	x16
6c4f5eb428:    	mov	w21, w0
6c4f5eb42c:    	dmb	ishld
6c4f5eb430:    	b	0x6c4f5eb018 <trace+0xf98>
6c4f5eb434:    	mov	w1, w20
6c4f5eb438:    	mov	x0, x19
6c4f5eb43c:    	mov	w2, #0x4045             // =16453
6c4f5eb440:    	movk	w2, #0x1, lsl #16
6c4f5eb444:    	adr	x3, 0x6c4f5eb04c <trace+0xfcc>
6c4f5eb448:    	adrp	x16, 0x6c97723000 <trace+0x48139000>
6c4f5eb44c:    	add	x16, x16, #0xf88
6c4f5eb450:    	blr	x16
6c4f5eb454:    	mov	w21, w0
6c4f5eb458:    	dmb	ishld
6c4f5eb45c:    	b	0x6c4f5eb04c <trace+0xfcc>