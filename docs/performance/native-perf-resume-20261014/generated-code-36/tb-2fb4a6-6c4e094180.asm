
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-2fb4a6-6c4e094180.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006c4e094180 <trace>:
6c4e094180:    	ldur	w20, [x19, #-0x10]  // guest 0x2fb4a6, sampled 0
6c4e094184:    	tbnz	w20, #0x1f, 0x6c4e09421c <trace+0x9c>  // guest 0x2fb4a6, sampled 0
6c4e094188:    	sturb	wzr, [x19, #-0xc]  // guest 0x2fb4a6, sampled 0
6c4e09418c:    	ldr	w20, [x19, #0x4]  // guest 0x2fb4a6, sampled 0
6c4e094190:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2fb4a6, sampled 1
6c4e094194:    	and	x16, x16, x20, lsr #7  // guest 0x2fb4a6, sampled 0
6c4e094198:    	add	x17, x17, x16  // guest 0x2fb4a6, sampled 0
6c4e09419c:    	ldp	x16, x17, [x17]  // guest 0x2fb4a6, sampled 0
6c4e0941a0:    	and	w30, w20, #0xfffff001  // guest 0x2fb4a6, sampled 4
6c4e0941a4:    	cmp	w16, w30  // guest 0x2fb4a6, sampled 0
6c4e0941a8:    	b.ne	0x6c4e094224 <trace+0xa4>  // guest 0x2fb4a6, sampled 0
6c4e0941ac:    	add	x30, x17, w20, uxtw  // guest 0x2fb4a6, sampled 2
6c4e0941b0:    	ldaprh	w20, [x30]  // guest 0x2fb4a6, sampled 0
6c4e0941b4:    	ldr	w21, [x19, #0x8]  // guest 0x2fb4a6, sampled 7
6c4e0941b8:    	mov	w16, w20  // guest 0x2fb4a6, sampled 0
6c4e0941bc:    	mov	w20, w21  // guest 0x2fb4a6, sampled 0
6c4e0941c0:    	bfxil	w20, w16, #0, #16  // guest 0x2fb4a6, sampled 0
6c4e0941c4:    	str	w20, [x19, #0x8]  // guest 0x2fb4a6, sampled 0
6c4e0941c8:    	str	w20, [x19, #0x28]  // guest 0x2fb4a9, sampled 0
6c4e0941cc:    	mov	w21, #0x1               // =1  // guest 0x2fb4a9, sampled 0
6c4e0941d0:    	sturb	w21, [x19, #-0xc]  // guest 0x2fb4a9, sampled 0
6c4e0941d4:    	mov	w21, #0x19              // =25  // guest 0x2fb4ac, sampled 0
6c4e0941d8:    	str	w21, [x19, #0x34]  // guest 0x2fb4ac, sampled 0
6c4e0941dc:    	tst	w20, #0xffff  // guest 0x2fb4ac, sampled 0
6c4e0941e0:    	b.eq	0x6c4e094200 <trace+0x80>  // guest 0x2fb4ac, sampled 0
6c4e0941e4:    	b	0x6c4e0941e4 <trace+0x64>  // guest 0x2fb4ac, sampled 0
6c4e0941e8:    	br	x16  // guest 0x2fb4ac, sampled 0
6c4e0941ec:    	mov	w20, #0xb4ae            // =46254  // guest 0x2fb4ac, sampled 0
6c4e0941f0:    	movk	w20, #0x2f, lsl #16  // guest 0x2fb4ac, sampled 0
6c4e0941f4:    	str	w20, [x19, #0x20]  // guest 0x2fb4ac, sampled 0
6c4e0941f8:    	adr	x0, 0x6c4e0940c1 <trace+0xffffffffffffff41>  // guest 0x2fb4ac, sampled 0
6c4e0941fc:    	b	0x6c4ae5d02c <trace+0xfffffffffcdc8eac>  // guest 0x2fb4ac, sampled 0
6c4e094200:    	b	0x6c4e094200 <trace+0x80>  // guest 0x2fb4ac, sampled 0
6c4e094204:    	br	x16  // guest 0x2fb4ac, sampled 0
6c4e094208:    	mov	w20, #0xb4d9            // =46297  // guest 0x2fb4ac, sampled 0
6c4e09420c:    	movk	w20, #0x2f, lsl #16  // guest 0x2fb4ac, sampled 0
6c4e094210:    	str	w20, [x19, #0x20]  // guest 0x2fb4ac, sampled 0
6c4e094214:    	adr	x0, 0x6c4e0940c0 <trace+0xffffffffffffff40>  // guest 0x2fb4ac, sampled 0
6c4e094218:    	b	0x6c4ae5d02c <trace+0xfffffffffcdc8eac>  // guest 0x2fb4ac, sampled 0
6c4e09421c:    	adr	x0, 0x6c4e0940c3 <trace+0xffffffffffffff43>  // guest 0x2fb4ac, sampled 0
6c4e094220:    	b	0x6c4ae5d02c <trace+0xfffffffffcdc8eac>  // guest 0x2fb4ac, sampled 0
6c4e094224:    	mov	w1, w20
6c4e094228:    	mov	x0, x19
6c4e09422c:    	mov	w2, #0x4025             // =16421
6c4e094230:    	movk	w2, #0x1, lsl #16
6c4e094234:    	adr	x3, 0x6c4e0941b4 <trace+0x34>
6c4e094238:    	adrp	x16, 0x6c97723000 <trace+0x4968f000>
6c4e09423c:    	add	x16, x16, #0xcec
6c4e094240:    	blr	x16
6c4e094244:    	mov	w20, w0
6c4e094248:    	dmb	ishld
6c4e09424c:    	b	0x6c4e0941b4 <trace+0x34>