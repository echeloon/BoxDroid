
docs/performance/native-perf-resume-20261014/experiment46/variant-b-test-code.o:	file format elf64-littleaarch64

Disassembly of section .text:

00000074ae1811c0 <test_region>:
74ae1811c0:    	ldur	w20, [x19, #-0x10]
74ae1811c4:    	tbnz	w20, #0x1f, 0x74ae181324 <test_region+0x164>
74ae1811c8:    	sturb	wzr, [x19, #-0xc]
74ae1811cc:    	ldr	w20, [x19, #0x18]
74ae1811d0:    	ldp	x16, x17, [x19, #-0x70]
74ae1811d4:    	and	x16, x16, x20, lsr #7
74ae1811d8:    	add	x17, x17, x16
74ae1811dc:    	ldp	x16, x17, [x17]
74ae1811e0:    	and	w30, w20, #0xfffff003
74ae1811e4:    	cmp	w16, w30
74ae1811e8:    	b.ne	0x74ae18132c <test_region+0x16c>
74ae1811ec:    	add	x30, x17, w20, uxtw
74ae1811f0:    	ldapr	w21, [x30]
74ae1811f4:    	add	w21, w21, #0x1
74ae1811f8:    	ldr	w3, [x19, #0x34]
74ae1811fc:    	ldr	w2, [x19, #0x30]
74ae181200:    	ldr	w1, [x19, #0x2c]
74ae181204:    	ldr	w0, [x19, #0x28]
74ae181208:    	ldr	x16, 0x74ae1813e8 <test_region+0x228>
74ae18120c:    	blr	x16
74ae181210:    	str	w21, [x19]
74ae181214:    	mov	w22, w21
74ae181218:    	str	w22, [x19, #0x28]
74ae18121c:    	str	w0, [x19, #0x2c]
74ae181220:    	ldp	x23, x24, [x19, #-0x70]
74ae181224:    	ldr	w25, [x19, #0x1c]
74ae181228:    	and	x16, x23, x25, lsr #7
74ae18122c:    	add	x17, x24, x16
74ae181230:    	ldp	x17, x16, [x17, #0x8]
74ae181234:    	and	w30, w25, #0xfffff003
74ae181238:    	cmp	w16, w30
74ae18123c:    	b.ne	0x74ae181354 <test_region+0x194>
74ae181240:    	add	x30, x17, w25, uxtw
74ae181244:    	stlr	w21, [x30]
74ae181248:    	add	w21, w20, #0x4
74ae18124c:    	and	x16, x23, x21, lsr #7
74ae181250:    	add	x17, x24, x16
74ae181254:    	ldp	x16, x17, [x17]
74ae181258:    	and	w30, w21, #0xfffff000
74ae18125c:    	cmp	w16, w30
74ae181260:    	b.ne	0x74ae18136c <test_region+0x1ac>
74ae181264:    	add	x30, x17, w21, uxtw
74ae181268:    	ldaprb	w21, [x30]
74ae18126c:    	str	w21, [x19, #0x4]
74ae181270:    	add	w22, w22, w21
74ae181274:    	str	w22, [x19]
74ae181278:    	str	w22, [x19, #0x28]
74ae18127c:    	str	w21, [x19, #0x2c]
74ae181280:    	add	w21, w25, #0x4
74ae181284:    	and	x16, x23, x21, lsr #7
74ae181288:    	add	x17, x24, x16
74ae18128c:    	ldp	x17, x16, [x17, #0x8]
74ae181290:    	and	w30, w21, #0xfffff003
74ae181294:    	cmp	w16, w30
74ae181298:    	b.ne	0x74ae181384 <test_region+0x1c4>
74ae18129c:    	add	x30, x17, w21, uxtw
74ae1812a0:    	stlr	w22, [x30]
74ae1812a4:    	add	w20, w20, #0x6
74ae1812a8:    	and	x16, x23, x20, lsr #7
74ae1812ac:    	add	x17, x24, x16
74ae1812b0:    	ldp	x16, x17, [x17]
74ae1812b4:    	and	w30, w20, #0xfffff001
74ae1812b8:    	cmp	w16, w30
74ae1812bc:    	b.ne	0x74ae18139c <test_region+0x1dc>
74ae1812c0:    	add	x30, x17, w20, uxtw
74ae1812c4:    	ldaprh	w20, [x30]
74ae1812c8:    	sxth	w20, w20
74ae1812cc:    	str	w20, [x19, #0x8]
74ae1812d0:    	add	w21, w25, #0x8
74ae1812d4:    	and	x16, x23, x21, lsr #7
74ae1812d8:    	add	x17, x24, x16
74ae1812dc:    	ldp	x17, x16, [x17, #0x8]
74ae1812e0:    	and	w30, w21, #0xfffff003
74ae1812e4:    	cmp	w16, w30
74ae1812e8:    	b.ne	0x74ae1813b4 <test_region+0x1f4>
74ae1812ec:    	add	x30, x17, w21, uxtw
74ae1812f0:    	stlr	w20, [x30]
74ae1812f4:    	mov	w20, #0x1               // =1
74ae1812f8:    	sturb	w20, [x19, #-0xc]
74ae1812fc:    	mov	w20, #0xa               // =10
74ae181300:    	str	w20, [x19, #0x34]
74ae181304:    	mov	w20, #0x16              // =22
74ae181308:    	movk	w20, #0x1, lsl #16
74ae18130c:    	str	w20, [x19, #0x20]
74ae181310:    	mov	x0, x19
74ae181314:    	dmb	ish
74ae181318:    	ldr	x16, 0x74ae1813d8 <test_region+0x218>
74ae18131c:    	blr	x16
74ae181320:    	dmb	ishld
74ae181324:    	adr	x0, 0x74ae181103 <test_region+0xffffffffffffff43>
74ae181328:    	b	0x74ae18002c <test_region+0xffffffffffffee6c>
74ae18132c:    	mov	w1, w20
74ae181330:    	mov	x0, x19
74ae181334:    	mov	w2, #0x4045             // =16453
74ae181338:    	movk	w2, #0x1, lsl #16
74ae18133c:    	adr	x3, 0x74ae1811f4 <test_region+0x34>
74ae181340:    	ldr	x16, 0x74ae1813e0 <test_region+0x220>
74ae181344:    	blr	x16
74ae181348:    	mov	w21, w0
74ae18134c:    	dmb	ishld
74ae181350:    	b	0x74ae1811f4 <test_region+0x34>
74ae181354:    	adr	x0, 0x74ae181248 <test_region+0x88>
74ae181358:    	ldr	x16, 0x74ae1813d0 <test_region+0x210>
74ae18135c:    	blr	x16
74ae181360:    	dmb	ishld
74ae181364:    	mov	x16, x0
74ae181368:    	br	x16
74ae18136c:    	adr	x0, 0x74ae18126c <test_region+0xac>
74ae181370:    	ldr	x16, 0x74ae1813d0 <test_region+0x210>
74ae181374:    	blr	x16
74ae181378:    	dmb	ishld
74ae18137c:    	mov	x16, x0
74ae181380:    	br	x16
74ae181384:    	adr	x0, 0x74ae1812a4 <test_region+0xe4>
74ae181388:    	ldr	x16, 0x74ae1813d0 <test_region+0x210>
74ae18138c:    	blr	x16
74ae181390:    	dmb	ishld
74ae181394:    	mov	x16, x0
74ae181398:    	br	x16
74ae18139c:    	adr	x0, 0x74ae1812cc <test_region+0x10c>
74ae1813a0:    	ldr	x16, 0x74ae1813d0 <test_region+0x210>
74ae1813a4:    	blr	x16
74ae1813a8:    	dmb	ishld
74ae1813ac:    	mov	x16, x0
74ae1813b0:    	br	x16
74ae1813b4:    	adr	x0, 0x74ae1812f4 <test_region+0x134>
74ae1813b8:    	ldr	x16, 0x74ae1813d0 <test_region+0x210>
74ae1813bc:    	blr	x16
74ae1813c0:    	dmb	ishld
74ae1813c4:    	mov	x16, x0
74ae1813c8:    	br	x16
74ae1813cc:    	nop
74ae1813d0:    	<unknown>
74ae1813d4:    	udf	#0x5e
74ae1813d8:    	<unknown>
74ae1813dc:    	udf	#0x5e
74ae1813e0:    	<unknown>
74ae1813e4:    	udf	#0x5e
74ae1813e8:    	<unknown>
74ae1813ec:    	udf	#0x5e
