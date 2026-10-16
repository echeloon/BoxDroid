
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-ebc87-6eae4ed9c0.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006eae4ed9c0 <trace>:
6eae4ed9c0:    	ldur	w20, [x19, #-0x10]  // guest 0xebc87, sampled 0
6eae4ed9c4:    	tbnz	w20, #0x1f, 0x6eae4eda54 <trace+0x94>  // guest 0xebc87, sampled 0
6eae4ed9c8:    	sturb	wzr, [x19, #-0xc]  // guest 0xebc87, sampled 0
6eae4ed9cc:    	ldr	w20, [x19, #0x14]  // guest 0xebc87, sampled 0
6eae4ed9d0:    	add	w20, w20, #0x140  // guest 0xebc87, sampled 0
6eae4ed9d4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0xebc87, sampled 0
6eae4ed9d8:    	and	x16, x16, x20, lsr #7  // guest 0xebc87, sampled 0
6eae4ed9dc:    	add	x17, x17, x16  // guest 0xebc87, sampled 0
6eae4ed9e0:    	ldp	x16, x17, [x17]  // guest 0xebc87, sampled 0
6eae4ed9e4:    	and	w30, w20, #0xfffff003  // guest 0xebc87, sampled 3
6eae4ed9e8:    	cmp	w16, w30  // guest 0xebc87, sampled 0
6eae4ed9ec:    	b.ne	0x6eae4eda5c <trace+0x9c>  // guest 0xebc87, sampled 0
6eae4ed9f0:    	add	x30, x17, w20, uxtw  // guest 0xebc87, sampled 0
6eae4ed9f4:    	ldapr	w20, [x30]  // guest 0xebc87, sampled 0
6eae4ed9f8:    	str	w20, [x19]  // guest 0xebc87, sampled 23
6eae4ed9fc:    	str	wzr, [x19, #0x8]  // guest 0xebc8d, sampled 0
6eae4eda00:    	str	w20, [x19, #0x28]  // guest 0xebc8f, sampled 0
6eae4eda04:    	str	wzr, [x19, #0x2c]  // guest 0xebc8f, sampled 0
6eae4eda08:    	mov	w21, #0x1               // =1  // guest 0xebc8f, sampled 0
6eae4eda0c:    	sturb	w21, [x19, #-0xc]  // guest 0xebc8f, sampled 0
6eae4eda10:    	mov	w21, #0x12              // =18  // guest 0xebc91, sampled 0
6eae4eda14:    	str	w21, [x19, #0x34]  // guest 0xebc91, sampled 0
6eae4eda18:    	cbz	w20, 0x6eae4eda38 <trace+0x78>  // guest 0xebc91, sampled 0
6eae4eda1c:    	b	0x6eae4eda1c <trace+0x5c>  // guest 0xebc91, sampled 0
6eae4eda20:    	br	x16  // guest 0xebc91, sampled 0
6eae4eda24:    	mov	w20, #0xbc93            // =48275  // guest 0xebc91, sampled 0
6eae4eda28:    	movk	w20, #0xe, lsl #16  // guest 0xebc91, sampled 0
6eae4eda2c:    	str	w20, [x19, #0x20]  // guest 0xebc91, sampled 0
6eae4eda30:    	adr	x0, 0x6eae4ed901 <trace+0xffffffffffffff41>  // guest 0xebc91, sampled 0
6eae4eda34:    	b	0x6ea842202c <trace+0xfffffffff9f3466c>  // guest 0xebc91, sampled 0
6eae4eda38:    	b	0x6eae4eda38 <trace+0x78>  // guest 0xebc91, sampled 0
6eae4eda3c:    	br	x16  // guest 0xebc91, sampled 0
6eae4eda40:    	mov	w20, #0xbcd2            // =48338  // guest 0xebc91, sampled 0
6eae4eda44:    	movk	w20, #0xe, lsl #16  // guest 0xebc91, sampled 0
6eae4eda48:    	str	w20, [x19, #0x20]  // guest 0xebc91, sampled 0
6eae4eda4c:    	adr	x0, 0x6eae4ed900 <trace+0xffffffffffffff40>  // guest 0xebc91, sampled 0
6eae4eda50:    	b	0x6ea842202c <trace+0xfffffffff9f3466c>  // guest 0xebc91, sampled 0
6eae4eda54:    	adr	x0, 0x6eae4ed903 <trace+0xffffffffffffff43>  // guest 0xebc91, sampled 0
6eae4eda58:    	b	0x6ea842202c <trace+0xfffffffff9f3466c>  // guest 0xebc91, sampled 0
6eae4eda5c:    	mov	w1, w20
6eae4eda60:    	mov	x0, x19
6eae4eda64:    	mov	w2, #0x4045             // =16453
6eae4eda68:    	movk	w2, #0x1, lsl #16
6eae4eda6c:    	adr	x3, 0x6eae4ed9f8 <trace+0x38>
6eae4eda70:    	adrp	x16, 0x6efc87d000 <trace+0x4e390000>
6eae4eda74:    	add	x16, x16, #0x58
6eae4eda78:    	blr	x16
6eae4eda7c:    	mov	w20, w0
6eae4eda80:    	dmb	ishld
6eae4eda84:    	b	0x6eae4ed9f8 <trace+0x38>