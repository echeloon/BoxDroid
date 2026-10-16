
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-18c914-6eaea2e840.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006eaea2e840 <trace>:
6eaea2e840:    	ldur	w20, [x19, #-0x10]  // guest 0x18c914, sampled 1
6eaea2e844:    	tbnz	w20, #0x1f, 0x6eaea2f758 <trace+0xf18>  // guest 0x18c914, sampled 0
6eaea2e848:    	sturb	wzr, [x19, #-0xc]  // guest 0x18c914, sampled 0
6eaea2e84c:    	ldr	w20, [x19, #0x188]  // guest 0x18c914, sampled 0
6eaea2e850:    	sub	w20, w20, #0x1  // guest 0x18c914, sampled 0
6eaea2e854:    	and	w20, w20, #0x7  // guest 0x18c914, sampled 0
6eaea2e858:    	str	w20, [x19, #0x188]  // guest 0x18c914, sampled 0
6eaea2e85c:    	sxtw	x21, w20  // guest 0x18c914, sampled 0
6eaea2e860:    	add	x21, x21, x19  // guest 0x18c914, sampled 0
6eaea2e864:    	strb	wzr, [x21, #0x190]  // guest 0x18c914, sampled 0
6eaea2e868:    	lsl	w21, w20, #4  // guest 0x18c914, sampled 0
6eaea2e86c:    	add	w21, w21, #0x1a0  // guest 0x18c914, sampled 0
6eaea2e870:    	sxtw	x21, w21  // guest 0x18c914, sampled 0
6eaea2e874:    	add	x21, x21, x19  // guest 0x18c914, sampled 0
6eaea2e878:    	add	w22, w20, #0x1  // guest 0x18c914, sampled 0
6eaea2e87c:    	and	w22, w22, #0x7  // guest 0x18c914, sampled 0
6eaea2e880:    	lsl	w22, w22, #4  // guest 0x18c914, sampled 0
6eaea2e884:    	add	w22, w22, #0x1a0  // guest 0x18c914, sampled 0
6eaea2e888:    	sxtw	x22, w22  // guest 0x18c914, sampled 0
6eaea2e88c:    	add	x22, x22, x19  // guest 0x18c914, sampled 0
6eaea2e890:    	ldr	x23, [x22]  // guest 0x18c914, sampled 0
6eaea2e894:    	ldrh	w22, [x22, #0x8]  // guest 0x18c914, sampled 0
6eaea2e898:    	str	x23, [x21]  // guest 0x18c914, sampled 0
6eaea2e89c:    	strh	w22, [x21, #0x8]  // guest 0x18c914, sampled 0
6eaea2e8a0:    	ldr	w21, [x19, #0x54]  // guest 0x18c914, sampled 0
6eaea2e8a4:    	strh	w21, [x19, #0x222]  // guest 0x18c914, sampled 0
6eaea2e8a8:    	mov	w21, #0xc914            // =51476  // guest 0x18c914, sampled 0
6eaea2e8ac:    	movk	w21, #0x18, lsl #16  // guest 0x18c914, sampled 0
6eaea2e8b0:    	str	w21, [x19, #0x228]  // guest 0x18c914, sampled 0
6eaea2e8b4:    	ldr	w21, [x19, #0x8]  // guest 0x18c916, sampled 0
6eaea2e8b8:    	add	w21, w21, #0x4  // guest 0x18c916, sampled 0
6eaea2e8bc:    	str	w21, [x19, #0x8]  // guest 0x18c916, sampled 0
6eaea2e8c0:    	str	w21, [x19, #0x28]  // guest 0x18c916, sampled 0
6eaea2e8c4:    	mov	w22, #0x4               // =4  // guest 0x18c916, sampled 0
6eaea2e8c8:    	str	w22, [x19, #0x2c]  // guest 0x18c916, sampled 0
6eaea2e8cc:    	sub	w21, w21, #0x4  // guest 0x18c919, sampled 0
6eaea2e8d0:    	mov	w22, w21  // guest 0x18c919, sampled 0
6eaea2e8d4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c919, sampled 0
6eaea2e8d8:    	and	x16, x16, x21, lsr #7  // guest 0x18c919, sampled 0
6eaea2e8dc:    	add	x17, x17, x16  // guest 0x18c919, sampled 0
6eaea2e8e0:    	ldp	x16, x17, [x17]  // guest 0x18c919, sampled 0
6eaea2e8e4:    	and	w30, w21, #0xfffff003  // guest 0x18c919, sampled 0
6eaea2e8e8:    	cmp	w16, w30  // guest 0x18c919, sampled 0
6eaea2e8ec:    	b.ne	0x6eaea2f760 <trace+0xf20>  // guest 0x18c919, sampled 0
6eaea2e8f0:    	add	x30, x17, w21, uxtw  // guest 0x18c919, sampled 0
6eaea2e8f4:    	ldapr	w2, [x30]  // guest 0x18c919, sampled 0
6eaea2e8f8:    	add	x1, x19, #0x258  // guest 0x18c919, sampled 1
6eaea2e8fc:    	mov	x0, x19  // guest 0x18c919, sampled 0
6eaea2e900:    	adrp	x16, 0x6efc8aa000 <trace+0x4de7c000>  // guest 0x18c919, sampled 0
6eaea2e904:    	add	x16, x16, #0x484  // guest 0x18c919, sampled 0
6eaea2e908:    	blr	x16  // guest 0x18c919, sampled 0
6eaea2e90c:    	lsl	w21, w20, #4  // guest 0x18c919, sampled 0
6eaea2e910:    	add	w21, w21, #0x1a0  // guest 0x18c919, sampled 0
6eaea2e914:    	sxtw	x21, w21  // guest 0x18c919, sampled 0
6eaea2e918:    	add	x1, x21, x19  // guest 0x18c919, sampled 0
6eaea2e91c:    	add	x2, x19, #0x258  // guest 0x18c919, sampled 0
6eaea2e920:    	mov	x0, x19  // guest 0x18c919, sampled 0
6eaea2e924:    	adrp	x16, 0x6efc8ab000 <trace+0x4de7d000>  // guest 0x18c919, sampled 0
6eaea2e928:    	add	x16, x16, #0xb4c  // guest 0x18c919, sampled 0
6eaea2e92c:    	blr	x16  // guest 0x18c919, sampled 0
6eaea2e930:    	ldr	w21, [x19, #0x74]  // guest 0x18c919, sampled 0
6eaea2e934:    	strh	w21, [x19, #0x224]  // guest 0x18c919, sampled 0
6eaea2e938:    	str	w22, [x19, #0x230]  // guest 0x18c919, sampled 0
6eaea2e93c:    	ldr	w21, [x19, #0x54]  // guest 0x18c919, sampled 0
6eaea2e940:    	strh	w21, [x19, #0x222]  // guest 0x18c919, sampled 0
6eaea2e944:    	mov	w21, #0xc919            // =51481  // guest 0x18c919, sampled 0
6eaea2e948:    	movk	w21, #0x18, lsl #16  // guest 0x18c919, sampled 0
6eaea2e94c:    	str	w21, [x19, #0x228]  // guest 0x18c919, sampled 0
6eaea2e950:    	ldr	w21, [x19]  // guest 0x18c91c, sampled 0
6eaea2e954:    	add	w21, w21, #0x8  // guest 0x18c91c, sampled 0
6eaea2e958:    	str	w21, [x19]  // guest 0x18c91c, sampled 0
6eaea2e95c:    	ldr	w21, [x19, #0x4]  // guest 0x18c91f, sampled 0
6eaea2e960:    	mov	w22, w21  // guest 0x18c91f, sampled 0
6eaea2e964:    	sub	w21, w21, #0x8  // guest 0x18c91f, sampled 0
6eaea2e968:    	str	w21, [x19, #0x4]  // guest 0x18c91f, sampled 0
6eaea2e96c:    	ldr	w21, [x19, #0x1c]  // guest 0x18c922, sampled 0
6eaea2e970:    	sub	w21, w21, #0x1  // guest 0x18c922, sampled 0
6eaea2e974:    	cmp	w22, #0x8  // guest 0x18c922, sampled 0
6eaea2e978:    	cset	w22, lo  // guest 0x18c922, sampled 0
6eaea2e97c:    	str	w21, [x19, #0x1c]  // guest 0x18c922, sampled 0
6eaea2e980:    	str	w21, [x19, #0x28]  // guest 0x18c922, sampled 0
6eaea2e984:    	str	w22, [x19, #0x2c]  // guest 0x18c922, sampled 0
6eaea2e988:    	sub	w20, w20, #0x1  // guest 0x18c923, sampled 0
6eaea2e98c:    	and	w20, w20, #0x7  // guest 0x18c923, sampled 0
6eaea2e990:    	str	w20, [x19, #0x188]  // guest 0x18c923, sampled 0
6eaea2e994:    	sxtw	x21, w20  // guest 0x18c923, sampled 0
6eaea2e998:    	add	x21, x21, x19  // guest 0x18c923, sampled 0
6eaea2e99c:    	strb	wzr, [x21, #0x190]  // guest 0x18c923, sampled 0
6eaea2e9a0:    	lsl	w21, w20, #4  // guest 0x18c923, sampled 0
6eaea2e9a4:    	add	w21, w21, #0x1a0  // guest 0x18c923, sampled 0
6eaea2e9a8:    	sxtw	x21, w21  // guest 0x18c923, sampled 0
6eaea2e9ac:    	add	x21, x21, x19  // guest 0x18c923, sampled 0
6eaea2e9b0:    	add	w20, w20, #0x1  // guest 0x18c923, sampled 0
6eaea2e9b4:    	and	w20, w20, #0x7  // guest 0x18c923, sampled 0
6eaea2e9b8:    	lsl	w20, w20, #4  // guest 0x18c923, sampled 0
6eaea2e9bc:    	add	w20, w20, #0x1a0  // guest 0x18c923, sampled 0
6eaea2e9c0:    	sxtw	x20, w20  // guest 0x18c923, sampled 0
6eaea2e9c4:    	add	x20, x20, x19  // guest 0x18c923, sampled 0
6eaea2e9c8:    	ldr	x22, [x20]  // guest 0x18c923, sampled 0
6eaea2e9cc:    	ldrh	w20, [x20, #0x8]  // guest 0x18c923, sampled 0
6eaea2e9d0:    	str	x22, [x21]  // guest 0x18c923, sampled 0
6eaea2e9d4:    	strh	w20, [x21, #0x8]  // guest 0x18c923, sampled 0
6eaea2e9d8:    	ldr	w20, [x19, #0x54]  // guest 0x18c923, sampled 0
6eaea2e9dc:    	strh	w20, [x19, #0x222]  // guest 0x18c923, sampled 0
6eaea2e9e0:    	mov	w20, #0xc923            // =51491  // guest 0x18c923, sampled 0
6eaea2e9e4:    	movk	w20, #0x18, lsl #16  // guest 0x18c923, sampled 0
6eaea2e9e8:    	str	w20, [x19, #0x228]  // guest 0x18c923, sampled 0
6eaea2e9ec:    	mov	x0, x19  // guest 0x18c925, sampled 0
6eaea2e9f0:    	dmb	ish  // guest 0x18c925, sampled 0
6eaea2e9f4:    	adrp	x16, 0x6efc8b0000 <trace+0x4de82000>  // guest 0x18c925, sampled 2
6eaea2e9f8:    	add	x16, x16, #0xba8  // guest 0x18c925, sampled 0
6eaea2e9fc:    	blr	x16  // guest 0x18c925, sampled 0
6eaea2ea00:    	dmb	ishld  // guest 0x18c925, sampled 0
6eaea2ea04:    	ldr	w20, [x19, #0x54]  // guest 0x18c925, sampled 2
6eaea2ea08:    	strh	w20, [x19, #0x222]  // guest 0x18c925, sampled 0
6eaea2ea0c:    	mov	w20, #0xc925            // =51493  // guest 0x18c925, sampled 0
6eaea2ea10:    	movk	w20, #0x18, lsl #16  // guest 0x18c925, sampled 0
6eaea2ea14:    	str	w20, [x19, #0x228]  // guest 0x18c925, sampled 0
6eaea2ea18:    	mov	w1, #0x1                // =1  // guest 0x18c927, sampled 0
6eaea2ea1c:    	mov	x0, x19  // guest 0x18c927, sampled 0
6eaea2ea20:    	adrp	x16, 0x6efc8ab000 <trace+0x4de7d000>  // guest 0x18c927, sampled 0
6eaea2ea24:    	add	x16, x16, #0x5a0  // guest 0x18c927, sampled 0
6eaea2ea28:    	blr	x16  // guest 0x18c927, sampled 0
6eaea2ea2c:    	ldr	w20, [x19, #0x54]  // guest 0x18c927, sampled 0
6eaea2ea30:    	strh	w20, [x19, #0x222]  // guest 0x18c927, sampled 0
6eaea2ea34:    	mov	w20, #0xc927            // =51495  // guest 0x18c927, sampled 0
6eaea2ea38:    	movk	w20, #0x18, lsl #16  // guest 0x18c927, sampled 0
6eaea2ea3c:    	str	w20, [x19, #0x228]  // guest 0x18c927, sampled 0
6eaea2ea40:    	mov	x0, x19  // guest 0x18c929, sampled 0
6eaea2ea44:    	dmb	ish  // guest 0x18c929, sampled 0
6eaea2ea48:    	adrp	x16, 0x6efc8b0000 <trace+0x4de82000>  // guest 0x18c929, sampled 3
6eaea2ea4c:    	add	x16, x16, #0xb18  // guest 0x18c929, sampled 0
6eaea2ea50:    	blr	x16  // guest 0x18c929, sampled 0
6eaea2ea54:    	dmb	ishld  // guest 0x18c929, sampled 0
6eaea2ea58:    	ldr	w20, [x19, #0x54]  // guest 0x18c929, sampled 0
6eaea2ea5c:    	strh	w20, [x19, #0x222]  // guest 0x18c929, sampled 0
6eaea2ea60:    	mov	w20, #0xc929            // =51497  // guest 0x18c929, sampled 0
6eaea2ea64:    	movk	w20, #0x18, lsl #16  // guest 0x18c929, sampled 0
6eaea2ea68:    	str	w20, [x19, #0x228]  // guest 0x18c929, sampled 0
6eaea2ea6c:    	ldr	w20, [x19, #0x188]  // guest 0x18c92b, sampled 0
6eaea2ea70:    	sub	w20, w20, #0x1  // guest 0x18c92b, sampled 0
6eaea2ea74:    	and	w20, w20, #0x7  // guest 0x18c92b, sampled 0
6eaea2ea78:    	str	w20, [x19, #0x188]  // guest 0x18c92b, sampled 0
6eaea2ea7c:    	sxtw	x21, w20  // guest 0x18c92b, sampled 0
6eaea2ea80:    	add	x21, x21, x19  // guest 0x18c92b, sampled 0
6eaea2ea84:    	strb	wzr, [x21, #0x190]  // guest 0x18c92b, sampled 0
6eaea2ea88:    	lsl	w21, w20, #4  // guest 0x18c92b, sampled 0
6eaea2ea8c:    	add	w21, w21, #0x1a0  // guest 0x18c92b, sampled 0
6eaea2ea90:    	sxtw	x21, w21  // guest 0x18c92b, sampled 0
6eaea2ea94:    	add	x21, x21, x19  // guest 0x18c92b, sampled 0
6eaea2ea98:    	add	w22, w20, #0x2  // guest 0x18c92b, sampled 1
6eaea2ea9c:    	and	w22, w22, #0x7  // guest 0x18c92b, sampled 0
6eaea2eaa0:    	lsl	w22, w22, #4  // guest 0x18c92b, sampled 0
6eaea2eaa4:    	add	w22, w22, #0x1a0  // guest 0x18c92b, sampled 0
6eaea2eaa8:    	sxtw	x22, w22  // guest 0x18c92b, sampled 0
6eaea2eaac:    	add	x22, x22, x19  // guest 0x18c92b, sampled 0
6eaea2eab0:    	ldr	x23, [x22]  // guest 0x18c92b, sampled 0
6eaea2eab4:    	ldrh	w22, [x22, #0x8]  // guest 0x18c92b, sampled 0
6eaea2eab8:    	str	x23, [x21]  // guest 0x18c92b, sampled 0
6eaea2eabc:    	strh	w22, [x21, #0x8]  // guest 0x18c92b, sampled 0
6eaea2eac0:    	ldr	w21, [x19, #0x54]  // guest 0x18c92b, sampled 0
6eaea2eac4:    	strh	w21, [x19, #0x222]  // guest 0x18c92b, sampled 0
6eaea2eac8:    	mov	w21, #0xc92b            // =51499  // guest 0x18c92b, sampled 0
6eaea2eacc:    	movk	w21, #0x18, lsl #16  // guest 0x18c92b, sampled 0
6eaea2ead0:    	str	w21, [x19, #0x228]  // guest 0x18c92b, sampled 0
6eaea2ead4:    	ldr	w21, [x19]  // guest 0x18c92d, sampled 0
6eaea2ead8:    	sub	w22, w21, #0xc  // guest 0x18c92d, sampled 0
6eaea2eadc:    	mov	w23, w22  // guest 0x18c92d, sampled 0
6eaea2eae0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c92d, sampled 0
6eaea2eae4:    	and	x16, x16, x22, lsr #7  // guest 0x18c92d, sampled 0
6eaea2eae8:    	add	x17, x17, x16  // guest 0x18c92d, sampled 0
6eaea2eaec:    	ldp	x16, x17, [x17]  // guest 0x18c92d, sampled 0
6eaea2eaf0:    	and	w30, w22, #0xfffff003  // guest 0x18c92d, sampled 0
6eaea2eaf4:    	cmp	w16, w30  // guest 0x18c92d, sampled 0
6eaea2eaf8:    	b.ne	0x6eaea2f78c <trace+0xf4c>  // guest 0x18c92d, sampled 0
6eaea2eafc:    	add	x30, x17, w22, uxtw  // guest 0x18c92d, sampled 0
6eaea2eb00:    	ldapr	w2, [x30]  // guest 0x18c92d, sampled 0
6eaea2eb04:    	add	x1, x19, #0x258  // guest 0x18c92d, sampled 0
6eaea2eb08:    	mov	x0, x19  // guest 0x18c92d, sampled 0
6eaea2eb0c:    	adrp	x16, 0x6efc8aa000 <trace+0x4de7c000>  // guest 0x18c92d, sampled 0
6eaea2eb10:    	add	x16, x16, #0x484  // guest 0x18c92d, sampled 0
6eaea2eb14:    	blr	x16  // guest 0x18c92d, sampled 0
6eaea2eb18:    	lsl	w22, w20, #4  // guest 0x18c92d, sampled 0
6eaea2eb1c:    	add	w22, w22, #0x1a0  // guest 0x18c92d, sampled 0
6eaea2eb20:    	sxtw	x22, w22  // guest 0x18c92d, sampled 1
6eaea2eb24:    	add	x1, x22, x19  // guest 0x18c92d, sampled 0
6eaea2eb28:    	add	x2, x19, #0x258  // guest 0x18c92d, sampled 0
6eaea2eb2c:    	mov	x0, x19  // guest 0x18c92d, sampled 0
6eaea2eb30:    	adrp	x16, 0x6efc8ab000 <trace+0x4de7d000>  // guest 0x18c92d, sampled 0
6eaea2eb34:    	add	x16, x16, #0xb4c  // guest 0x18c92d, sampled 0
6eaea2eb38:    	blr	x16  // guest 0x18c92d, sampled 0
6eaea2eb3c:    	ldr	w22, [x19, #0x74]  // guest 0x18c92d, sampled 0
6eaea2eb40:    	strh	w22, [x19, #0x224]  // guest 0x18c92d, sampled 0
6eaea2eb44:    	str	w23, [x19, #0x230]  // guest 0x18c92d, sampled 0
6eaea2eb48:    	ldr	w22, [x19, #0x54]  // guest 0x18c92d, sampled 0
6eaea2eb4c:    	strh	w22, [x19, #0x222]  // guest 0x18c92d, sampled 0
6eaea2eb50:    	mov	w22, #0xc92d            // =51501  // guest 0x18c92d, sampled 0
6eaea2eb54:    	movk	w22, #0x18, lsl #16  // guest 0x18c92d, sampled 0
6eaea2eb58:    	str	w22, [x19, #0x228]  // guest 0x18c92d, sampled 0
6eaea2eb5c:    	sub	w20, w20, #0x1  // guest 0x18c930, sampled 0
6eaea2eb60:    	and	w20, w20, #0x7  // guest 0x18c930, sampled 0
6eaea2eb64:    	str	w20, [x19, #0x188]  // guest 0x18c930, sampled 0
6eaea2eb68:    	sxtw	x22, w20  // guest 0x18c930, sampled 0
6eaea2eb6c:    	add	x22, x22, x19  // guest 0x18c930, sampled 0
6eaea2eb70:    	strb	wzr, [x22, #0x190]  // guest 0x18c930, sampled 0
6eaea2eb74:    	lsl	w22, w20, #4  // guest 0x18c930, sampled 0
6eaea2eb78:    	add	w22, w22, #0x1a0  // guest 0x18c930, sampled 0
6eaea2eb7c:    	sxtw	x22, w22  // guest 0x18c930, sampled 0
6eaea2eb80:    	add	x22, x22, x19  // guest 0x18c930, sampled 0
6eaea2eb84:    	add	w23, w20, #0x2  // guest 0x18c930, sampled 0
6eaea2eb88:    	and	w23, w23, #0x7  // guest 0x18c930, sampled 0
6eaea2eb8c:    	lsl	w23, w23, #4  // guest 0x18c930, sampled 0
6eaea2eb90:    	add	w23, w23, #0x1a0  // guest 0x18c930, sampled 0
6eaea2eb94:    	sxtw	x23, w23  // guest 0x18c930, sampled 0
6eaea2eb98:    	add	x23, x23, x19  // guest 0x18c930, sampled 0
6eaea2eb9c:    	ldr	x24, [x23]  // guest 0x18c930, sampled 0
6eaea2eba0:    	ldrh	w23, [x23, #0x8]  // guest 0x18c930, sampled 1
6eaea2eba4:    	str	x24, [x22]  // guest 0x18c930, sampled 0
6eaea2eba8:    	strh	w23, [x22, #0x8]  // guest 0x18c930, sampled 0
6eaea2ebac:    	ldr	w22, [x19, #0x54]  // guest 0x18c930, sampled 0
6eaea2ebb0:    	strh	w22, [x19, #0x222]  // guest 0x18c930, sampled 0
6eaea2ebb4:    	mov	w22, #0xc930            // =51504  // guest 0x18c930, sampled 0
6eaea2ebb8:    	movk	w22, #0x18, lsl #16  // guest 0x18c930, sampled 0
6eaea2ebbc:    	str	w22, [x19, #0x228]  // guest 0x18c930, sampled 0
6eaea2ebc0:    	sub	w22, w21, #0x8  // guest 0x18c932, sampled 0
6eaea2ebc4:    	mov	w23, w22  // guest 0x18c932, sampled 0
6eaea2ebc8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c932, sampled 0
6eaea2ebcc:    	and	x16, x16, x22, lsr #7  // guest 0x18c932, sampled 0
6eaea2ebd0:    	add	x17, x17, x16  // guest 0x18c932, sampled 0
6eaea2ebd4:    	ldp	x16, x17, [x17]  // guest 0x18c932, sampled 0
6eaea2ebd8:    	and	w30, w22, #0xfffff003  // guest 0x18c932, sampled 0
6eaea2ebdc:    	cmp	w16, w30  // guest 0x18c932, sampled 0
6eaea2ebe0:    	b.ne	0x6eaea2f7b8 <trace+0xf78>  // guest 0x18c932, sampled 0
6eaea2ebe4:    	add	x30, x17, w22, uxtw  // guest 0x18c932, sampled 1
6eaea2ebe8:    	ldapr	w2, [x30]  // guest 0x18c932, sampled 0
6eaea2ebec:    	add	x1, x19, #0x258  // guest 0x18c932, sampled 0
6eaea2ebf0:    	mov	x0, x19  // guest 0x18c932, sampled 0
6eaea2ebf4:    	adrp	x16, 0x6efc8aa000 <trace+0x4de7c000>  // guest 0x18c932, sampled 0
6eaea2ebf8:    	add	x16, x16, #0x484  // guest 0x18c932, sampled 0
6eaea2ebfc:    	blr	x16  // guest 0x18c932, sampled 0
6eaea2ec00:    	lsl	w22, w20, #4  // guest 0x18c932, sampled 0
6eaea2ec04:    	add	w22, w22, #0x1a0  // guest 0x18c932, sampled 0
6eaea2ec08:    	sxtw	x22, w22  // guest 0x18c932, sampled 0
6eaea2ec0c:    	add	x1, x22, x19  // guest 0x18c932, sampled 0
6eaea2ec10:    	add	x2, x19, #0x258  // guest 0x18c932, sampled 0
6eaea2ec14:    	mov	x0, x19  // guest 0x18c932, sampled 0
6eaea2ec18:    	adrp	x16, 0x6efc8ab000 <trace+0x4de7d000>  // guest 0x18c932, sampled 0
6eaea2ec1c:    	add	x16, x16, #0xb4c  // guest 0x18c932, sampled 0
6eaea2ec20:    	blr	x16  // guest 0x18c932, sampled 0
6eaea2ec24:    	ldr	w22, [x19, #0x74]  // guest 0x18c932, sampled 0
6eaea2ec28:    	strh	w22, [x19, #0x224]  // guest 0x18c932, sampled 0
6eaea2ec2c:    	str	w23, [x19, #0x230]  // guest 0x18c932, sampled 0
6eaea2ec30:    	ldr	w22, [x19, #0x54]  // guest 0x18c932, sampled 0
6eaea2ec34:    	strh	w22, [x19, #0x222]  // guest 0x18c932, sampled 0
6eaea2ec38:    	mov	w22, #0xc932            // =51506  // guest 0x18c932, sampled 0
6eaea2ec3c:    	movk	w22, #0x18, lsl #16  // guest 0x18c932, sampled 0
6eaea2ec40:    	str	w22, [x19, #0x228]  // guest 0x18c932, sampled 0
6eaea2ec44:    	add	w22, w20, #0x1  // guest 0x18c935, sampled 0
6eaea2ec48:    	and	w22, w22, #0x7  // guest 0x18c935, sampled 0
6eaea2ec4c:    	lsl	w22, w22, #4  // guest 0x18c935, sampled 0
6eaea2ec50:    	add	w22, w22, #0x1a0  // guest 0x18c935, sampled 0
6eaea2ec54:    	sxtw	x22, w22  // guest 0x18c935, sampled 1
6eaea2ec58:    	add	x1, x22, x19  // guest 0x18c935, sampled 0
6eaea2ec5c:    	lsl	w22, w20, #4  // guest 0x18c935, sampled 0
6eaea2ec60:    	add	w22, w22, #0x1a0  // guest 0x18c935, sampled 0
6eaea2ec64:    	sxtw	x22, w22  // guest 0x18c935, sampled 0
6eaea2ec68:    	add	x2, x22, x19  // guest 0x18c935, sampled 0
6eaea2ec6c:    	mov	x0, x19  // guest 0x18c935, sampled 0
6eaea2ec70:    	adrp	x16, 0x6efc8ab000 <trace+0x4de7d000>  // guest 0x18c935, sampled 0
6eaea2ec74:    	add	x16, x16, #0xc20  // guest 0x18c935, sampled 0
6eaea2ec78:    	blr	x16  // guest 0x18c935, sampled 0
6eaea2ec7c:    	sxtw	x22, w20  // guest 0x18c935, sampled 0
6eaea2ec80:    	add	x22, x22, x19  // guest 0x18c935, sampled 0
6eaea2ec84:    	mov	w23, #0x1               // =1  // guest 0x18c935, sampled 0
6eaea2ec88:    	strb	w23, [x22, #0x190]  // guest 0x18c935, sampled 0
6eaea2ec8c:    	add	w20, w20, w23  // guest 0x18c935, sampled 0
6eaea2ec90:    	and	w20, w20, #0x7  // guest 0x18c935, sampled 0
6eaea2ec94:    	str	w20, [x19, #0x188]  // guest 0x18c935, sampled 0
6eaea2ec98:    	ldr	w22, [x19, #0x54]  // guest 0x18c935, sampled 0
6eaea2ec9c:    	strh	w22, [x19, #0x222]  // guest 0x18c935, sampled 0
6eaea2eca0:    	mov	w22, #0xc935            // =51509  // guest 0x18c935, sampled 0
6eaea2eca4:    	movk	w22, #0x18, lsl #16  // guest 0x18c935, sampled 0
6eaea2eca8:    	str	w22, [x19, #0x228]  // guest 0x18c935, sampled 0
6eaea2ecac:    	ldr	w22, [x19, #0x10]  // guest 0x18c937, sampled 0
6eaea2ecb0:    	add	w24, w22, #0x48  // guest 0x18c937, sampled 1
6eaea2ecb4:    	mov	w25, w24  // guest 0x18c937, sampled 0
6eaea2ecb8:    	lsl	w26, w20, #4  // guest 0x18c937, sampled 0
6eaea2ecbc:    	add	w26, w26, #0x1a0  // guest 0x18c937, sampled 0
6eaea2ecc0:    	sxtw	x26, w26  // guest 0x18c937, sampled 0
6eaea2ecc4:    	add	x1, x26, x19  // guest 0x18c937, sampled 0
6eaea2ecc8:    	mov	x0, x19  // guest 0x18c937, sampled 0
6eaea2eccc:    	adrp	x16, 0x6efc8aa000 <trace+0x4de7c000>  // guest 0x18c937, sampled 0
6eaea2ecd0:    	add	x16, x16, #0x5c0  // guest 0x18c937, sampled 0
6eaea2ecd4:    	blr	x16  // guest 0x18c937, sampled 0
6eaea2ecd8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c937, sampled 0
6eaea2ecdc:    	and	x16, x16, x24, lsr #7  // guest 0x18c937, sampled 0
6eaea2ece0:    	add	x17, x17, x16  // guest 0x18c937, sampled 0
6eaea2ece4:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18c937, sampled 0
6eaea2ece8:    	and	w30, w24, #0xfffff003  // guest 0x18c937, sampled 0
6eaea2ecec:    	cmp	w16, w30  // guest 0x18c937, sampled 0
6eaea2ecf0:    	b.ne	0x6eaea2f7e4 <trace+0xfa4>  // guest 0x18c937, sampled 0
6eaea2ecf4:    	add	x30, x17, w24, uxtw  // guest 0x18c937, sampled 0
6eaea2ecf8:    	stlr	w0, [x30]  // guest 0x18c937, sampled 0
6eaea2ecfc:    	sxtw	x24, w20  // guest 0x18c937, sampled 0
6eaea2ed00:    	add	x24, x24, x19  // guest 0x18c937, sampled 0
6eaea2ed04:    	strb	w23, [x24, #0x190]  // guest 0x18c937, sampled 0
6eaea2ed08:    	add	w20, w20, w23  // guest 0x18c937, sampled 0
6eaea2ed0c:    	and	w20, w20, #0x7  // guest 0x18c937, sampled 0
6eaea2ed10:    	ldr	w24, [x19, #0x64]  // guest 0x18c937, sampled 0
6eaea2ed14:    	strh	w24, [x19, #0x224]  // guest 0x18c937, sampled 0
6eaea2ed18:    	str	w25, [x19, #0x230]  // guest 0x18c937, sampled 0
6eaea2ed1c:    	ldr	w24, [x19, #0x54]  // guest 0x18c937, sampled 0
6eaea2ed20:    	strh	w24, [x19, #0x222]  // guest 0x18c937, sampled 0
6eaea2ed24:    	mov	w24, #0xc937            // =51511  // guest 0x18c937, sampled 0
6eaea2ed28:    	movk	w24, #0x18, lsl #16  // guest 0x18c937, sampled 0
6eaea2ed2c:    	str	w24, [x19, #0x228]  // guest 0x18c937, sampled 0
6eaea2ed30:    	sub	w20, w20, #0x1  // guest 0x18c93b, sampled 0
6eaea2ed34:    	and	w20, w20, #0x7  // guest 0x18c93b, sampled 0
6eaea2ed38:    	str	w20, [x19, #0x188]  // guest 0x18c93b, sampled 0
6eaea2ed3c:    	sxtw	x24, w20  // guest 0x18c93b, sampled 0
6eaea2ed40:    	add	x24, x24, x19  // guest 0x18c93b, sampled 0
6eaea2ed44:    	strb	wzr, [x24, #0x190]  // guest 0x18c93b, sampled 0
6eaea2ed48:    	lsl	w24, w20, #4  // guest 0x18c93b, sampled 0
6eaea2ed4c:    	add	w24, w24, #0x1a0  // guest 0x18c93b, sampled 0
6eaea2ed50:    	sxtw	x24, w24  // guest 0x18c93b, sampled 0
6eaea2ed54:    	add	x24, x24, x19  // guest 0x18c93b, sampled 0
6eaea2ed58:    	add	w25, w20, w23  // guest 0x18c93b, sampled 0
6eaea2ed5c:    	and	w25, w25, #0x7  // guest 0x18c93b, sampled 0
6eaea2ed60:    	lsl	w25, w25, #4  // guest 0x18c93b, sampled 0
6eaea2ed64:    	add	w25, w25, #0x1a0  // guest 0x18c93b, sampled 0
6eaea2ed68:    	sxtw	x25, w25  // guest 0x18c93b, sampled 0
6eaea2ed6c:    	add	x25, x25, x19  // guest 0x18c93b, sampled 0
6eaea2ed70:    	ldr	x26, [x25]  // guest 0x18c93b, sampled 0
6eaea2ed74:    	ldrh	w25, [x25, #0x8]  // guest 0x18c93b, sampled 0
6eaea2ed78:    	str	x26, [x24]  // guest 0x18c93b, sampled 0
6eaea2ed7c:    	strh	w25, [x24, #0x8]  // guest 0x18c93b, sampled 0
6eaea2ed80:    	ldr	w24, [x19, #0x54]  // guest 0x18c93b, sampled 0
6eaea2ed84:    	strh	w24, [x19, #0x222]  // guest 0x18c93b, sampled 0
6eaea2ed88:    	mov	w24, #0xc93b            // =51515  // guest 0x18c93b, sampled 0
6eaea2ed8c:    	movk	w24, #0x18, lsl #16  // guest 0x18c93b, sampled 0
6eaea2ed90:    	str	w24, [x19, #0x228]  // guest 0x18c93b, sampled 0
6eaea2ed94:    	sub	w24, w21, #0xc  // guest 0x18c93d, sampled 0
6eaea2ed98:    	mov	w25, w24  // guest 0x18c93d, sampled 0
6eaea2ed9c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c93d, sampled 0
6eaea2eda0:    	and	x16, x16, x24, lsr #7  // guest 0x18c93d, sampled 0
6eaea2eda4:    	add	x17, x17, x16  // guest 0x18c93d, sampled 0
6eaea2eda8:    	ldp	x16, x17, [x17]  // guest 0x18c93d, sampled 0
6eaea2edac:    	and	w30, w24, #0xfffff003  // guest 0x18c93d, sampled 0
6eaea2edb0:    	cmp	w16, w30  // guest 0x18c93d, sampled 0
6eaea2edb4:    	b.ne	0x6eaea2f810 <trace+0xfd0>  // guest 0x18c93d, sampled 0
6eaea2edb8:    	add	x30, x17, w24, uxtw  // guest 0x18c93d, sampled 0
6eaea2edbc:    	ldapr	w2, [x30]  // guest 0x18c93d, sampled 0
6eaea2edc0:    	add	x1, x19, #0x258  // guest 0x18c93d, sampled 1
6eaea2edc4:    	mov	x0, x19  // guest 0x18c93d, sampled 0
6eaea2edc8:    	adrp	x16, 0x6efc8aa000 <trace+0x4de7c000>  // guest 0x18c93d, sampled 0
6eaea2edcc:    	add	x16, x16, #0x484  // guest 0x18c93d, sampled 0
6eaea2edd0:    	blr	x16  // guest 0x18c93d, sampled 0
6eaea2edd4:    	lsl	w24, w20, #4  // guest 0x18c93d, sampled 0
6eaea2edd8:    	add	w24, w24, #0x1a0  // guest 0x18c93d, sampled 0
6eaea2eddc:    	sxtw	x24, w24  // guest 0x18c93d, sampled 0
6eaea2ede0:    	add	x1, x24, x19  // guest 0x18c93d, sampled 0
6eaea2ede4:    	add	x2, x19, #0x258  // guest 0x18c93d, sampled 0
6eaea2ede8:    	mov	x0, x19  // guest 0x18c93d, sampled 0
6eaea2edec:    	adrp	x16, 0x6efc8ab000 <trace+0x4de7d000>  // guest 0x18c93d, sampled 0
6eaea2edf0:    	add	x16, x16, #0xb4c  // guest 0x18c93d, sampled 0
6eaea2edf4:    	blr	x16  // guest 0x18c93d, sampled 0
6eaea2edf8:    	ldr	w24, [x19, #0x74]  // guest 0x18c93d, sampled 0
6eaea2edfc:    	strh	w24, [x19, #0x224]  // guest 0x18c93d, sampled 0
6eaea2ee00:    	str	w25, [x19, #0x230]  // guest 0x18c93d, sampled 0
6eaea2ee04:    	ldr	w24, [x19, #0x54]  // guest 0x18c93d, sampled 0
6eaea2ee08:    	strh	w24, [x19, #0x222]  // guest 0x18c93d, sampled 0
6eaea2ee0c:    	mov	w24, #0xc93d            // =51517  // guest 0x18c93d, sampled 0
6eaea2ee10:    	movk	w24, #0x18, lsl #16  // guest 0x18c93d, sampled 0
6eaea2ee14:    	str	w24, [x19, #0x228]  // guest 0x18c93d, sampled 0
6eaea2ee18:    	sub	w20, w20, #0x1  // guest 0x18c940, sampled 0
6eaea2ee1c:    	and	w20, w20, #0x7  // guest 0x18c940, sampled 0
6eaea2ee20:    	str	w20, [x19, #0x188]  // guest 0x18c940, sampled 0
6eaea2ee24:    	sxtw	x24, w20  // guest 0x18c940, sampled 0
6eaea2ee28:    	add	x24, x24, x19  // guest 0x18c940, sampled 0
6eaea2ee2c:    	strb	wzr, [x24, #0x190]  // guest 0x18c940, sampled 0
6eaea2ee30:    	lsl	w24, w20, #4  // guest 0x18c940, sampled 0
6eaea2ee34:    	add	w24, w24, #0x1a0  // guest 0x18c940, sampled 0
6eaea2ee38:    	sxtw	x24, w24  // guest 0x18c940, sampled 0
6eaea2ee3c:    	add	x24, x24, x19  // guest 0x18c940, sampled 0
6eaea2ee40:    	add	w25, w20, #0x3  // guest 0x18c940, sampled 0
6eaea2ee44:    	and	w25, w25, #0x7  // guest 0x18c940, sampled 0
6eaea2ee48:    	lsl	w25, w25, #4  // guest 0x18c940, sampled 0
6eaea2ee4c:    	add	w25, w25, #0x1a0  // guest 0x18c940, sampled 0
6eaea2ee50:    	sxtw	x25, w25  // guest 0x18c940, sampled 0
6eaea2ee54:    	add	x25, x25, x19  // guest 0x18c940, sampled 0
6eaea2ee58:    	ldr	x26, [x25]  // guest 0x18c940, sampled 0
6eaea2ee5c:    	ldrh	w25, [x25, #0x8]  // guest 0x18c940, sampled 0
6eaea2ee60:    	str	x26, [x24]  // guest 0x18c940, sampled 0
6eaea2ee64:    	strh	w25, [x24, #0x8]  // guest 0x18c940, sampled 0
6eaea2ee68:    	ldr	w24, [x19, #0x54]  // guest 0x18c940, sampled 0
6eaea2ee6c:    	strh	w24, [x19, #0x222]  // guest 0x18c940, sampled 0
6eaea2ee70:    	mov	w24, #0xc940            // =51520  // guest 0x18c940, sampled 0
6eaea2ee74:    	movk	w24, #0x18, lsl #16  // guest 0x18c940, sampled 0
6eaea2ee78:    	str	w24, [x19, #0x228]  // guest 0x18c940, sampled 0
6eaea2ee7c:    	sub	w21, w21, #0x8  // guest 0x18c942, sampled 0
6eaea2ee80:    	mov	w24, w21  // guest 0x18c942, sampled 0
6eaea2ee84:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c942, sampled 0
6eaea2ee88:    	and	x16, x16, x21, lsr #7  // guest 0x18c942, sampled 0
6eaea2ee8c:    	add	x17, x17, x16  // guest 0x18c942, sampled 0
6eaea2ee90:    	ldp	x16, x17, [x17]  // guest 0x18c942, sampled 0
6eaea2ee94:    	and	w30, w21, #0xfffff003  // guest 0x18c942, sampled 0
6eaea2ee98:    	cmp	w16, w30  // guest 0x18c942, sampled 0
6eaea2ee9c:    	b.ne	0x6eaea2f83c <trace+0xffc>  // guest 0x18c942, sampled 0
6eaea2eea0:    	add	x30, x17, w21, uxtw  // guest 0x18c942, sampled 0
6eaea2eea4:    	ldapr	w2, [x30]  // guest 0x18c942, sampled 0
6eaea2eea8:    	add	x1, x19, #0x258  // guest 0x18c942, sampled 0
6eaea2eeac:    	mov	x0, x19  // guest 0x18c942, sampled 0
6eaea2eeb0:    	adrp	x16, 0x6efc8aa000 <trace+0x4de7c000>  // guest 0x18c942, sampled 0
6eaea2eeb4:    	add	x16, x16, #0x484  // guest 0x18c942, sampled 0
6eaea2eeb8:    	blr	x16  // guest 0x18c942, sampled 0
6eaea2eebc:    	lsl	w21, w20, #4  // guest 0x18c942, sampled 0
6eaea2eec0:    	add	w21, w21, #0x1a0  // guest 0x18c942, sampled 0
6eaea2eec4:    	sxtw	x21, w21  // guest 0x18c942, sampled 0
6eaea2eec8:    	add	x1, x21, x19  // guest 0x18c942, sampled 0
6eaea2eecc:    	add	x2, x19, #0x258  // guest 0x18c942, sampled 0
6eaea2eed0:    	mov	x0, x19  // guest 0x18c942, sampled 0
6eaea2eed4:    	adrp	x16, 0x6efc8ab000 <trace+0x4de7d000>  // guest 0x18c942, sampled 0
6eaea2eed8:    	add	x16, x16, #0xb4c  // guest 0x18c942, sampled 0
6eaea2eedc:    	blr	x16  // guest 0x18c942, sampled 0
6eaea2eee0:    	ldr	w21, [x19, #0x74]  // guest 0x18c942, sampled 0
6eaea2eee4:    	strh	w21, [x19, #0x224]  // guest 0x18c942, sampled 0
6eaea2eee8:    	str	w24, [x19, #0x230]  // guest 0x18c942, sampled 0
6eaea2eeec:    	ldr	w21, [x19, #0x54]  // guest 0x18c942, sampled 0
6eaea2eef0:    	strh	w21, [x19, #0x222]  // guest 0x18c942, sampled 0
6eaea2eef4:    	mov	w21, #0xc942            // =51522  // guest 0x18c942, sampled 0
6eaea2eef8:    	movk	w21, #0x18, lsl #16  // guest 0x18c942, sampled 0
6eaea2eefc:    	str	w21, [x19, #0x228]  // guest 0x18c942, sampled 0
6eaea2ef00:    	add	w21, w20, w23  // guest 0x18c945, sampled 0
6eaea2ef04:    	and	w21, w21, #0x7  // guest 0x18c945, sampled 0
6eaea2ef08:    	lsl	w21, w21, #4  // guest 0x18c945, sampled 0
6eaea2ef0c:    	add	w21, w21, #0x1a0  // guest 0x18c945, sampled 0
6eaea2ef10:    	sxtw	x21, w21  // guest 0x18c945, sampled 0
6eaea2ef14:    	add	x1, x21, x19  // guest 0x18c945, sampled 0
6eaea2ef18:    	lsl	w21, w20, #4  // guest 0x18c945, sampled 0
6eaea2ef1c:    	add	w21, w21, #0x1a0  // guest 0x18c945, sampled 0
6eaea2ef20:    	sxtw	x21, w21  // guest 0x18c945, sampled 0
6eaea2ef24:    	add	x2, x21, x19  // guest 0x18c945, sampled 0
6eaea2ef28:    	mov	x0, x19  // guest 0x18c945, sampled 0
6eaea2ef2c:    	adrp	x16, 0x6efc8ab000 <trace+0x4de7d000>  // guest 0x18c945, sampled 0
6eaea2ef30:    	add	x16, x16, #0xa78  // guest 0x18c945, sampled 0
6eaea2ef34:    	blr	x16  // guest 0x18c945, sampled 0
6eaea2ef38:    	sxtw	x21, w20  // guest 0x18c945, sampled 0
6eaea2ef3c:    	add	x21, x21, x19  // guest 0x18c945, sampled 0
6eaea2ef40:    	strb	w23, [x21, #0x190]  // guest 0x18c945, sampled 0
6eaea2ef44:    	add	w20, w20, w23  // guest 0x18c945, sampled 0
6eaea2ef48:    	and	w20, w20, #0x7  // guest 0x18c945, sampled 0
6eaea2ef4c:    	str	w20, [x19, #0x188]  // guest 0x18c945, sampled 0
6eaea2ef50:    	ldr	w21, [x19, #0x54]  // guest 0x18c945, sampled 0
6eaea2ef54:    	strh	w21, [x19, #0x222]  // guest 0x18c945, sampled 0
6eaea2ef58:    	mov	w21, #0xc945            // =51525  // guest 0x18c945, sampled 0
6eaea2ef5c:    	movk	w21, #0x18, lsl #16  // guest 0x18c945, sampled 0
6eaea2ef60:    	str	w21, [x19, #0x228]  // guest 0x18c945, sampled 0
6eaea2ef64:    	add	w21, w22, #0x4c  // guest 0x18c947, sampled 0
6eaea2ef68:    	mov	w24, w21  // guest 0x18c947, sampled 0
6eaea2ef6c:    	lsl	w25, w20, #4  // guest 0x18c947, sampled 0
6eaea2ef70:    	add	w25, w25, #0x1a0  // guest 0x18c947, sampled 0
6eaea2ef74:    	sxtw	x25, w25  // guest 0x18c947, sampled 0
6eaea2ef78:    	add	x1, x25, x19  // guest 0x18c947, sampled 0
6eaea2ef7c:    	mov	x0, x19  // guest 0x18c947, sampled 0
6eaea2ef80:    	adrp	x16, 0x6efc8aa000 <trace+0x4de7c000>  // guest 0x18c947, sampled 0
6eaea2ef84:    	add	x16, x16, #0x5c0  // guest 0x18c947, sampled 0
6eaea2ef88:    	blr	x16  // guest 0x18c947, sampled 0
6eaea2ef8c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c947, sampled 0
6eaea2ef90:    	and	x16, x16, x21, lsr #7  // guest 0x18c947, sampled 0
6eaea2ef94:    	add	x17, x17, x16  // guest 0x18c947, sampled 0
6eaea2ef98:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18c947, sampled 0
6eaea2ef9c:    	and	w30, w21, #0xfffff003  // guest 0x18c947, sampled 0
6eaea2efa0:    	cmp	w16, w30  // guest 0x18c947, sampled 0
6eaea2efa4:    	b.ne	0x6eaea2f868 <trace+0x1028>  // guest 0x18c947, sampled 0
6eaea2efa8:    	add	x30, x17, w21, uxtw  // guest 0x18c947, sampled 0
6eaea2efac:    	stlr	w0, [x30]  // guest 0x18c947, sampled 0
6eaea2efb0:    	sxtw	x21, w20  // guest 0x18c947, sampled 1
6eaea2efb4:    	add	x21, x21, x19  // guest 0x18c947, sampled 0
6eaea2efb8:    	strb	w23, [x21, #0x190]  // guest 0x18c947, sampled 0
6eaea2efbc:    	add	w20, w20, w23  // guest 0x18c947, sampled 0
6eaea2efc0:    	and	w20, w20, #0x7  // guest 0x18c947, sampled 0
6eaea2efc4:    	ldr	w21, [x19, #0x64]  // guest 0x18c947, sampled 0
6eaea2efc8:    	strh	w21, [x19, #0x224]  // guest 0x18c947, sampled 0
6eaea2efcc:    	str	w24, [x19, #0x230]  // guest 0x18c947, sampled 0
6eaea2efd0:    	ldr	w21, [x19, #0x54]  // guest 0x18c947, sampled 0
6eaea2efd4:    	strh	w21, [x19, #0x222]  // guest 0x18c947, sampled 0
6eaea2efd8:    	mov	w21, #0xc947            // =51527  // guest 0x18c947, sampled 0
6eaea2efdc:    	movk	w21, #0x18, lsl #16  // guest 0x18c947, sampled 0
6eaea2efe0:    	str	w21, [x19, #0x228]  // guest 0x18c947, sampled 0
6eaea2efe4:    	sub	w20, w20, #0x1  // guest 0x18c94b, sampled 0
6eaea2efe8:    	and	w20, w20, #0x7  // guest 0x18c94b, sampled 0
6eaea2efec:    	str	w20, [x19, #0x188]  // guest 0x18c94b, sampled 0
6eaea2eff0:    	sxtw	x21, w20  // guest 0x18c94b, sampled 0
6eaea2eff4:    	add	x21, x21, x19  // guest 0x18c94b, sampled 0
6eaea2eff8:    	strb	wzr, [x21, #0x190]  // guest 0x18c94b, sampled 0
6eaea2effc:    	lsl	w21, w20, #4  // guest 0x18c94b, sampled 0
6eaea2f000:    	add	w21, w21, #0x1a0  // guest 0x18c94b, sampled 0
6eaea2f004:    	sxtw	x21, w21  // guest 0x18c94b, sampled 0
6eaea2f008:    	add	x21, x21, x19  // guest 0x18c94b, sampled 0
6eaea2f00c:    	add	w24, w20, #0x2  // guest 0x18c94b, sampled 0
6eaea2f010:    	and	w24, w24, #0x7  // guest 0x18c94b, sampled 0
6eaea2f014:    	lsl	w24, w24, #4  // guest 0x18c94b, sampled 0
6eaea2f018:    	add	w24, w24, #0x1a0  // guest 0x18c94b, sampled 0
6eaea2f01c:    	sxtw	x24, w24  // guest 0x18c94b, sampled 0
6eaea2f020:    	add	x24, x24, x19  // guest 0x18c94b, sampled 0
6eaea2f024:    	ldr	x25, [x24]  // guest 0x18c94b, sampled 0
6eaea2f028:    	ldrh	w24, [x24, #0x8]  // guest 0x18c94b, sampled 1
6eaea2f02c:    	str	x25, [x21]  // guest 0x18c94b, sampled 0
6eaea2f030:    	strh	w24, [x21, #0x8]  // guest 0x18c94b, sampled 0
6eaea2f034:    	ldr	w21, [x19, #0x54]  // guest 0x18c94b, sampled 0
6eaea2f038:    	strh	w21, [x19, #0x222]  // guest 0x18c94b, sampled 0
6eaea2f03c:    	mov	w21, #0xc94b            // =51531  // guest 0x18c94b, sampled 0
6eaea2f040:    	movk	w21, #0x18, lsl #16  // guest 0x18c94b, sampled 0
6eaea2f044:    	str	w21, [x19, #0x228]  // guest 0x18c94b, sampled 0
6eaea2f048:    	ldr	w21, [x19, #0x4]  // guest 0x18c94d, sampled 0
6eaea2f04c:    	add	w24, w21, #0x8  // guest 0x18c94d, sampled 0
6eaea2f050:    	mov	w25, w24  // guest 0x18c94d, sampled 0
6eaea2f054:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c94d, sampled 0
6eaea2f058:    	and	x16, x16, x24, lsr #7  // guest 0x18c94d, sampled 0
6eaea2f05c:    	add	x17, x17, x16  // guest 0x18c94d, sampled 0
6eaea2f060:    	ldp	x16, x17, [x17]  // guest 0x18c94d, sampled 0
6eaea2f064:    	and	w30, w24, #0xfffff003  // guest 0x18c94d, sampled 0
6eaea2f068:    	cmp	w16, w30  // guest 0x18c94d, sampled 0
6eaea2f06c:    	b.ne	0x6eaea2f894 <trace+0x1054>  // guest 0x18c94d, sampled 0
6eaea2f070:    	add	x30, x17, w24, uxtw  // guest 0x18c94d, sampled 1
6eaea2f074:    	ldapr	w2, [x30]  // guest 0x18c94d, sampled 0
6eaea2f078:    	add	x1, x19, #0x258  // guest 0x18c94d, sampled 1
6eaea2f07c:    	mov	x0, x19  // guest 0x18c94d, sampled 0
6eaea2f080:    	adrp	x16, 0x6efc8aa000 <trace+0x4de7b000>  // guest 0x18c94d, sampled 0
6eaea2f084:    	add	x16, x16, #0x484  // guest 0x18c94d, sampled 0
6eaea2f088:    	blr	x16  // guest 0x18c94d, sampled 0
6eaea2f08c:    	lsl	w24, w20, #4  // guest 0x18c94d, sampled 0
6eaea2f090:    	add	w24, w24, #0x1a0  // guest 0x18c94d, sampled 0
6eaea2f094:    	sxtw	x24, w24  // guest 0x18c94d, sampled 0
6eaea2f098:    	add	x1, x24, x19  // guest 0x18c94d, sampled 0
6eaea2f09c:    	add	x2, x19, #0x258  // guest 0x18c94d, sampled 0
6eaea2f0a0:    	mov	x0, x19  // guest 0x18c94d, sampled 0
6eaea2f0a4:    	adrp	x16, 0x6efc8ab000 <trace+0x4de7c000>  // guest 0x18c94d, sampled 0
6eaea2f0a8:    	add	x16, x16, #0xb4c  // guest 0x18c94d, sampled 0
6eaea2f0ac:    	blr	x16  // guest 0x18c94d, sampled 0
6eaea2f0b0:    	ldr	w24, [x19, #0x74]  // guest 0x18c94d, sampled 0
6eaea2f0b4:    	strh	w24, [x19, #0x224]  // guest 0x18c94d, sampled 0
6eaea2f0b8:    	str	w25, [x19, #0x230]  // guest 0x18c94d, sampled 0
6eaea2f0bc:    	ldr	w24, [x19, #0x54]  // guest 0x18c94d, sampled 0
6eaea2f0c0:    	strh	w24, [x19, #0x222]  // guest 0x18c94d, sampled 1
6eaea2f0c4:    	mov	w24, #0xc94d            // =51533  // guest 0x18c94d, sampled 0
6eaea2f0c8:    	movk	w24, #0x18, lsl #16  // guest 0x18c94d, sampled 0
6eaea2f0cc:    	str	w24, [x19, #0x228]  // guest 0x18c94d, sampled 0
6eaea2f0d0:    	sub	w20, w20, #0x1  // guest 0x18c950, sampled 0
6eaea2f0d4:    	and	w20, w20, #0x7  // guest 0x18c950, sampled 0
6eaea2f0d8:    	str	w20, [x19, #0x188]  // guest 0x18c950, sampled 0
6eaea2f0dc:    	sxtw	x24, w20  // guest 0x18c950, sampled 0
6eaea2f0e0:    	add	x24, x24, x19  // guest 0x18c950, sampled 0
6eaea2f0e4:    	strb	wzr, [x24, #0x190]  // guest 0x18c950, sampled 0
6eaea2f0e8:    	lsl	w24, w20, #4  // guest 0x18c950, sampled 0
6eaea2f0ec:    	add	w24, w24, #0x1a0  // guest 0x18c950, sampled 0
6eaea2f0f0:    	sxtw	x24, w24  // guest 0x18c950, sampled 0
6eaea2f0f4:    	add	x24, x24, x19  // guest 0x18c950, sampled 0
6eaea2f0f8:    	add	w25, w20, #0x2  // guest 0x18c950, sampled 0
6eaea2f0fc:    	and	w25, w25, #0x7  // guest 0x18c950, sampled 0
6eaea2f100:    	lsl	w25, w25, #4  // guest 0x18c950, sampled 0
6eaea2f104:    	add	w25, w25, #0x1a0  // guest 0x18c950, sampled 0
6eaea2f108:    	sxtw	x25, w25  // guest 0x18c950, sampled 0
6eaea2f10c:    	add	x25, x25, x19  // guest 0x18c950, sampled 0
6eaea2f110:    	ldr	x26, [x25]  // guest 0x18c950, sampled 0
6eaea2f114:    	ldrh	w25, [x25, #0x8]  // guest 0x18c950, sampled 0
6eaea2f118:    	str	x26, [x24]  // guest 0x18c950, sampled 0
6eaea2f11c:    	strh	w25, [x24, #0x8]  // guest 0x18c950, sampled 0
6eaea2f120:    	ldr	w24, [x19, #0x54]  // guest 0x18c950, sampled 0
6eaea2f124:    	strh	w24, [x19, #0x222]  // guest 0x18c950, sampled 0
6eaea2f128:    	mov	w24, #0xc950            // =51536  // guest 0x18c950, sampled 0
6eaea2f12c:    	movk	w24, #0x18, lsl #16  // guest 0x18c950, sampled 0
6eaea2f130:    	str	w24, [x19, #0x228]  // guest 0x18c950, sampled 0
6eaea2f134:    	add	w24, w21, #0xc  // guest 0x18c952, sampled 0
6eaea2f138:    	mov	w25, w24  // guest 0x18c952, sampled 0
6eaea2f13c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c952, sampled 0
6eaea2f140:    	and	x16, x16, x24, lsr #7  // guest 0x18c952, sampled 0
6eaea2f144:    	add	x17, x17, x16  // guest 0x18c952, sampled 0
6eaea2f148:    	ldp	x16, x17, [x17]  // guest 0x18c952, sampled 0
6eaea2f14c:    	and	w30, w24, #0xfffff003  // guest 0x18c952, sampled 0
6eaea2f150:    	cmp	w16, w30  // guest 0x18c952, sampled 0
6eaea2f154:    	b.ne	0x6eaea2f8c0 <trace+0x1080>  // guest 0x18c952, sampled 0
6eaea2f158:    	add	x30, x17, w24, uxtw  // guest 0x18c952, sampled 0
6eaea2f15c:    	ldapr	w2, [x30]  // guest 0x18c952, sampled 0
6eaea2f160:    	add	x1, x19, #0x258  // guest 0x18c952, sampled 1
6eaea2f164:    	mov	x0, x19  // guest 0x18c952, sampled 0
6eaea2f168:    	adrp	x16, 0x6efc8aa000 <trace+0x4de7b000>  // guest 0x18c952, sampled 0
6eaea2f16c:    	add	x16, x16, #0x484  // guest 0x18c952, sampled 0
6eaea2f170:    	blr	x16  // guest 0x18c952, sampled 0
6eaea2f174:    	lsl	w24, w20, #4  // guest 0x18c952, sampled 0
6eaea2f178:    	add	w24, w24, #0x1a0  // guest 0x18c952, sampled 0
6eaea2f17c:    	sxtw	x24, w24  // guest 0x18c952, sampled 0
6eaea2f180:    	add	x1, x24, x19  // guest 0x18c952, sampled 0
6eaea2f184:    	add	x2, x19, #0x258  // guest 0x18c952, sampled 0
6eaea2f188:    	mov	x0, x19  // guest 0x18c952, sampled 0
6eaea2f18c:    	adrp	x16, 0x6efc8ab000 <trace+0x4de7c000>  // guest 0x18c952, sampled 0
6eaea2f190:    	add	x16, x16, #0xb4c  // guest 0x18c952, sampled 0
6eaea2f194:    	blr	x16  // guest 0x18c952, sampled 0
6eaea2f198:    	ldr	w24, [x19, #0x74]  // guest 0x18c952, sampled 0
6eaea2f19c:    	strh	w24, [x19, #0x224]  // guest 0x18c952, sampled 0
6eaea2f1a0:    	str	w25, [x19, #0x230]  // guest 0x18c952, sampled 0
6eaea2f1a4:    	ldr	w24, [x19, #0x54]  // guest 0x18c952, sampled 0
6eaea2f1a8:    	strh	w24, [x19, #0x222]  // guest 0x18c952, sampled 0
6eaea2f1ac:    	mov	w24, #0xc952            // =51538  // guest 0x18c952, sampled 0
6eaea2f1b0:    	movk	w24, #0x18, lsl #16  // guest 0x18c952, sampled 0
6eaea2f1b4:    	str	w24, [x19, #0x228]  // guest 0x18c952, sampled 0
6eaea2f1b8:    	add	w24, w20, w23  // guest 0x18c955, sampled 0
6eaea2f1bc:    	and	w24, w24, #0x7  // guest 0x18c955, sampled 0
6eaea2f1c0:    	lsl	w24, w24, #4  // guest 0x18c955, sampled 0
6eaea2f1c4:    	add	w24, w24, #0x1a0  // guest 0x18c955, sampled 0
6eaea2f1c8:    	sxtw	x24, w24  // guest 0x18c955, sampled 0
6eaea2f1cc:    	add	x1, x24, x19  // guest 0x18c955, sampled 0
6eaea2f1d0:    	lsl	w24, w20, #4  // guest 0x18c955, sampled 0
6eaea2f1d4:    	add	w24, w24, #0x1a0  // guest 0x18c955, sampled 0
6eaea2f1d8:    	sxtw	x24, w24  // guest 0x18c955, sampled 0
6eaea2f1dc:    	add	x2, x24, x19  // guest 0x18c955, sampled 0
6eaea2f1e0:    	mov	x0, x19  // guest 0x18c955, sampled 0
6eaea2f1e4:    	adrp	x16, 0x6efc8ab000 <trace+0x4de7c000>  // guest 0x18c955, sampled 0
6eaea2f1e8:    	add	x16, x16, #0xc20  // guest 0x18c955, sampled 0
6eaea2f1ec:    	blr	x16  // guest 0x18c955, sampled 0
6eaea2f1f0:    	sxtw	x24, w20  // guest 0x18c955, sampled 0
6eaea2f1f4:    	add	x24, x24, x19  // guest 0x18c955, sampled 0
6eaea2f1f8:    	strb	w23, [x24, #0x190]  // guest 0x18c955, sampled 0
6eaea2f1fc:    	add	w20, w20, w23  // guest 0x18c955, sampled 0
6eaea2f200:    	and	w20, w20, #0x7  // guest 0x18c955, sampled 0
6eaea2f204:    	str	w20, [x19, #0x188]  // guest 0x18c955, sampled 0
6eaea2f208:    	ldr	w24, [x19, #0x54]  // guest 0x18c955, sampled 0
6eaea2f20c:    	strh	w24, [x19, #0x222]  // guest 0x18c955, sampled 0
6eaea2f210:    	mov	w24, #0xc955            // =51541  // guest 0x18c955, sampled 0
6eaea2f214:    	movk	w24, #0x18, lsl #16  // guest 0x18c955, sampled 0
6eaea2f218:    	str	w24, [x19, #0x228]  // guest 0x18c955, sampled 0
6eaea2f21c:    	add	w22, w22, #0x3c  // guest 0x18c957, sampled 0
6eaea2f220:    	mov	w24, w22  // guest 0x18c957, sampled 0
6eaea2f224:    	lsl	w25, w20, #4  // guest 0x18c957, sampled 0
6eaea2f228:    	add	w25, w25, #0x1a0  // guest 0x18c957, sampled 0
6eaea2f22c:    	sxtw	x25, w25  // guest 0x18c957, sampled 0
6eaea2f230:    	add	x1, x25, x19  // guest 0x18c957, sampled 0
6eaea2f234:    	mov	x0, x19  // guest 0x18c957, sampled 0
6eaea2f238:    	adrp	x16, 0x6efc8aa000 <trace+0x4de7b000>  // guest 0x18c957, sampled 0
6eaea2f23c:    	add	x16, x16, #0x5c0  // guest 0x18c957, sampled 0
6eaea2f240:    	blr	x16  // guest 0x18c957, sampled 0
6eaea2f244:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c957, sampled 0
6eaea2f248:    	and	x16, x16, x22, lsr #7  // guest 0x18c957, sampled 0
6eaea2f24c:    	add	x17, x17, x16  // guest 0x18c957, sampled 0
6eaea2f250:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18c957, sampled 0
6eaea2f254:    	and	w30, w22, #0xfffff003  // guest 0x18c957, sampled 0
6eaea2f258:    	cmp	w16, w30  // guest 0x18c957, sampled 0
6eaea2f25c:    	b.ne	0x6eaea2f8ec <trace+0x10ac>  // guest 0x18c957, sampled 0
6eaea2f260:    	add	x30, x17, w22, uxtw  // guest 0x18c957, sampled 0
6eaea2f264:    	stlr	w0, [x30]  // guest 0x18c957, sampled 0
6eaea2f268:    	sxtw	x22, w20  // guest 0x18c957, sampled 0
6eaea2f26c:    	add	x22, x22, x19  // guest 0x18c957, sampled 0
6eaea2f270:    	strb	w23, [x22, #0x190]  // guest 0x18c957, sampled 0
6eaea2f274:    	add	w20, w20, w23  // guest 0x18c957, sampled 0
6eaea2f278:    	and	w20, w20, #0x7  // guest 0x18c957, sampled 0
6eaea2f27c:    	str	w20, [x19, #0x188]  // guest 0x18c957, sampled 0
6eaea2f280:    	ldr	w22, [x19, #0x64]  // guest 0x18c957, sampled 0
6eaea2f284:    	strh	w22, [x19, #0x224]  // guest 0x18c957, sampled 0
6eaea2f288:    	str	w24, [x19, #0x230]  // guest 0x18c957, sampled 1
6eaea2f28c:    	ldr	w22, [x19, #0x54]  // guest 0x18c957, sampled 0
6eaea2f290:    	strh	w22, [x19, #0x222]  // guest 0x18c957, sampled 0
6eaea2f294:    	mov	w22, #0xc957            // =51543  // guest 0x18c957, sampled 0
6eaea2f298:    	movk	w22, #0x18, lsl #16  // guest 0x18c957, sampled 0
6eaea2f29c:    	str	w22, [x19, #0x228]  // guest 0x18c957, sampled 0
6eaea2f2a0:    	add	w21, w21, #0x8  // guest 0x18c95b, sampled 0
6eaea2f2a4:    	mov	w22, w21  // guest 0x18c95b, sampled 0
6eaea2f2a8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c95b, sampled 0
6eaea2f2ac:    	and	x16, x16, x21, lsr #7  // guest 0x18c95b, sampled 0
6eaea2f2b0:    	add	x17, x17, x16  // guest 0x18c95b, sampled 0
6eaea2f2b4:    	ldp	x16, x17, [x17]  // guest 0x18c95b, sampled 0
6eaea2f2b8:    	and	w30, w21, #0xfffff003  // guest 0x18c95b, sampled 0
6eaea2f2bc:    	cmp	w16, w30  // guest 0x18c95b, sampled 0
6eaea2f2c0:    	b.ne	0x6eaea2f918 <trace+0x10d8>  // guest 0x18c95b, sampled 0
6eaea2f2c4:    	add	x30, x17, w21, uxtw  // guest 0x18c95b, sampled 0
6eaea2f2c8:    	ldapr	w2, [x30]  // guest 0x18c95b, sampled 0
6eaea2f2cc:    	add	x1, x19, #0x258  // guest 0x18c95b, sampled 1
6eaea2f2d0:    	mov	x0, x19  // guest 0x18c95b, sampled 0
6eaea2f2d4:    	adrp	x16, 0x6efc8aa000 <trace+0x4de7b000>  // guest 0x18c95b, sampled 0
6eaea2f2d8:    	add	x16, x16, #0x484  // guest 0x18c95b, sampled 0
6eaea2f2dc:    	blr	x16  // guest 0x18c95b, sampled 0
6eaea2f2e0:    	lsl	w20, w20, #4  // guest 0x18c95b, sampled 0
6eaea2f2e4:    	add	w20, w20, #0x1a0  // guest 0x18c95b, sampled 0
6eaea2f2e8:    	sxtw	x20, w20  // guest 0x18c95b, sampled 0
6eaea2f2ec:    	add	x1, x20, x19  // guest 0x18c95b, sampled 0
6eaea2f2f0:    	add	x2, x19, #0x258  // guest 0x18c95b, sampled 0
6eaea2f2f4:    	mov	x0, x19  // guest 0x18c95b, sampled 0
6eaea2f2f8:    	adrp	x16, 0x6efc8ab000 <trace+0x4de7c000>  // guest 0x18c95b, sampled 0
6eaea2f2fc:    	add	x16, x16, #0xb4c  // guest 0x18c95b, sampled 0
6eaea2f300:    	blr	x16  // guest 0x18c95b, sampled 0
6eaea2f304:    	ldr	w20, [x19, #0x74]  // guest 0x18c95b, sampled 0
6eaea2f308:    	strh	w20, [x19, #0x224]  // guest 0x18c95b, sampled 0
6eaea2f30c:    	str	w22, [x19, #0x230]  // guest 0x18c95b, sampled 0
6eaea2f310:    	ldr	w20, [x19, #0x54]  // guest 0x18c95b, sampled 0
6eaea2f314:    	strh	w20, [x19, #0x222]  // guest 0x18c95b, sampled 0
6eaea2f318:    	mov	w20, #0xc95b            // =51547  // guest 0x18c95b, sampled 0
6eaea2f31c:    	movk	w20, #0x18, lsl #16  // guest 0x18c95b, sampled 0
6eaea2f320:    	str	w20, [x19, #0x228]  // guest 0x18c95b, sampled 0
6eaea2f324:    	mov	x0, x19  // guest 0x18c95e, sampled 0
6eaea2f328:    	adrp	x16, 0x6efc8ac000 <trace+0x4de7d000>  // guest 0x18c95e, sampled 0
6eaea2f32c:    	add	x16, x16, #0xb8c  // guest 0x18c95e, sampled 0
6eaea2f330:    	blr	x16  // guest 0x18c95e, sampled 0
6eaea2f334:    	ldr	w20, [x19, #0x54]  // guest 0x18c95e, sampled 0
6eaea2f338:    	strh	w20, [x19, #0x222]  // guest 0x18c95e, sampled 0
6eaea2f33c:    	mov	w20, #0xc95e            // =51550  // guest 0x18c95e, sampled 0
6eaea2f340:    	movk	w20, #0x18, lsl #16  // guest 0x18c95e, sampled 0
6eaea2f344:    	str	w20, [x19, #0x228]  // guest 0x18c95e, sampled 0
6eaea2f348:    	mov	w1, w23  // guest 0x18c960, sampled 0
6eaea2f34c:    	mov	x0, x19  // guest 0x18c960, sampled 0
6eaea2f350:    	adrp	x16, 0x6efc8ab000 <trace+0x4de7c000>  // guest 0x18c960, sampled 0
6eaea2f354:    	add	x16, x16, #0x5a0  // guest 0x18c960, sampled 0
6eaea2f358:    	blr	x16  // guest 0x18c960, sampled 0
6eaea2f35c:    	ldr	w20, [x19, #0x54]  // guest 0x18c960, sampled 0
6eaea2f360:    	strh	w20, [x19, #0x222]  // guest 0x18c960, sampled 0
6eaea2f364:    	mov	w20, #0xc960            // =51552  // guest 0x18c960, sampled 0
6eaea2f368:    	movk	w20, #0x18, lsl #16  // guest 0x18c960, sampled 0
6eaea2f36c:    	str	w20, [x19, #0x228]  // guest 0x18c960, sampled 0
6eaea2f370:    	ldr	w20, [x19, #0x4]  // guest 0x18c962, sampled 0
6eaea2f374:    	add	w20, w20, #0xc  // guest 0x18c962, sampled 0
6eaea2f378:    	mov	w21, w20  // guest 0x18c962, sampled 0
6eaea2f37c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c962, sampled 0
6eaea2f380:    	and	x16, x16, x20, lsr #7  // guest 0x18c962, sampled 0
6eaea2f384:    	add	x17, x17, x16  // guest 0x18c962, sampled 0
6eaea2f388:    	ldp	x16, x17, [x17]  // guest 0x18c962, sampled 0
6eaea2f38c:    	and	w30, w20, #0xfffff003  // guest 0x18c962, sampled 0
6eaea2f390:    	cmp	w16, w30  // guest 0x18c962, sampled 0
6eaea2f394:    	b.ne	0x6eaea2f944 <trace+0x1104>  // guest 0x18c962, sampled 0
6eaea2f398:    	add	x30, x17, w20, uxtw  // guest 0x18c962, sampled 0
6eaea2f39c:    	ldapr	w2, [x30]  // guest 0x18c962, sampled 0
6eaea2f3a0:    	add	x1, x19, #0x258  // guest 0x18c962, sampled 1
6eaea2f3a4:    	mov	x0, x19  // guest 0x18c962, sampled 0
6eaea2f3a8:    	adrp	x16, 0x6efc8aa000 <trace+0x4de7b000>  // guest 0x18c962, sampled 0
6eaea2f3ac:    	add	x16, x16, #0x484  // guest 0x18c962, sampled 0
6eaea2f3b0:    	blr	x16  // guest 0x18c962, sampled 0
6eaea2f3b4:    	ldr	w20, [x19, #0x188]  // guest 0x18c962, sampled 0
6eaea2f3b8:    	lsl	w22, w20, #4  // guest 0x18c962, sampled 0
6eaea2f3bc:    	add	w22, w22, #0x1a0  // guest 0x18c962, sampled 0
6eaea2f3c0:    	sxtw	x22, w22  // guest 0x18c962, sampled 0
6eaea2f3c4:    	add	x1, x22, x19  // guest 0x18c962, sampled 0
6eaea2f3c8:    	add	x2, x19, #0x258  // guest 0x18c962, sampled 0
6eaea2f3cc:    	mov	x0, x19  // guest 0x18c962, sampled 0
6eaea2f3d0:    	adrp	x16, 0x6efc8ab000 <trace+0x4de7c000>  // guest 0x18c962, sampled 0
6eaea2f3d4:    	add	x16, x16, #0xb4c  // guest 0x18c962, sampled 0
6eaea2f3d8:    	blr	x16  // guest 0x18c962, sampled 0
6eaea2f3dc:    	ldr	w22, [x19, #0x74]  // guest 0x18c962, sampled 0
6eaea2f3e0:    	strh	w22, [x19, #0x224]  // guest 0x18c962, sampled 0
6eaea2f3e4:    	str	w21, [x19, #0x230]  // guest 0x18c962, sampled 0
6eaea2f3e8:    	ldr	w21, [x19, #0x54]  // guest 0x18c962, sampled 0
6eaea2f3ec:    	strh	w21, [x19, #0x222]  // guest 0x18c962, sampled 0
6eaea2f3f0:    	mov	w21, #0xc962            // =51554  // guest 0x18c962, sampled 0
6eaea2f3f4:    	movk	w21, #0x18, lsl #16  // guest 0x18c962, sampled 0
6eaea2f3f8:    	str	w21, [x19, #0x228]  // guest 0x18c962, sampled 0
6eaea2f3fc:    	add	w21, w20, w23  // guest 0x18c965, sampled 0
6eaea2f400:    	and	w21, w21, #0x7  // guest 0x18c965, sampled 0
6eaea2f404:    	lsl	w21, w21, #4  // guest 0x18c965, sampled 0
6eaea2f408:    	add	w21, w21, #0x1a0  // guest 0x18c965, sampled 0
6eaea2f40c:    	sxtw	x21, w21  // guest 0x18c965, sampled 0
6eaea2f410:    	add	x1, x21, x19  // guest 0x18c965, sampled 0
6eaea2f414:    	lsl	w21, w20, #4  // guest 0x18c965, sampled 0
6eaea2f418:    	add	w21, w21, #0x1a0  // guest 0x18c965, sampled 0
6eaea2f41c:    	sxtw	x21, w21  // guest 0x18c965, sampled 0
6eaea2f420:    	add	x2, x21, x19  // guest 0x18c965, sampled 0
6eaea2f424:    	mov	x0, x19  // guest 0x18c965, sampled 0
6eaea2f428:    	adrp	x16, 0x6efc8ab000 <trace+0x4de7c000>  // guest 0x18c965, sampled 0
6eaea2f42c:    	add	x16, x16, #0xc20  // guest 0x18c965, sampled 0
6eaea2f430:    	blr	x16  // guest 0x18c965, sampled 0
6eaea2f434:    	sxtw	x21, w20  // guest 0x18c965, sampled 0
6eaea2f438:    	add	x21, x21, x19  // guest 0x18c965, sampled 0
6eaea2f43c:    	strb	w23, [x21, #0x190]  // guest 0x18c965, sampled 0
6eaea2f440:    	add	w20, w20, w23  // guest 0x18c965, sampled 0
6eaea2f444:    	and	w20, w20, #0x7  // guest 0x18c965, sampled 0
6eaea2f448:    	str	w20, [x19, #0x188]  // guest 0x18c965, sampled 0
6eaea2f44c:    	ldr	w21, [x19, #0x54]  // guest 0x18c965, sampled 0
6eaea2f450:    	strh	w21, [x19, #0x222]  // guest 0x18c965, sampled 0
6eaea2f454:    	mov	w21, #0xc965            // =51557  // guest 0x18c965, sampled 0
6eaea2f458:    	movk	w21, #0x18, lsl #16  // guest 0x18c965, sampled 0
6eaea2f45c:    	str	w21, [x19, #0x228]  // guest 0x18c965, sampled 0
6eaea2f460:    	ldr	w21, [x19, #0x10]  // guest 0x18c967, sampled 0
6eaea2f464:    	add	w22, w21, #0x3c  // guest 0x18c967, sampled 0
6eaea2f468:    	mov	w24, w22  // guest 0x18c967, sampled 0
6eaea2f46c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c967, sampled 0
6eaea2f470:    	and	x16, x16, x22, lsr #7  // guest 0x18c967, sampled 0
6eaea2f474:    	add	x17, x17, x16  // guest 0x18c967, sampled 0
6eaea2f478:    	ldp	x16, x17, [x17]  // guest 0x18c967, sampled 0
6eaea2f47c:    	and	w30, w22, #0xfffff003  // guest 0x18c967, sampled 1
6eaea2f480:    	cmp	w16, w30  // guest 0x18c967, sampled 0
6eaea2f484:    	b.ne	0x6eaea2f970 <trace+0x1130>  // guest 0x18c967, sampled 0
6eaea2f488:    	add	x30, x17, w22, uxtw  // guest 0x18c967, sampled 0
6eaea2f48c:    	ldapr	w2, [x30]  // guest 0x18c967, sampled 0
6eaea2f490:    	add	w22, w20, #0x7  // guest 0x18c967, sampled 1
6eaea2f494:    	and	w22, w22, #0x7  // guest 0x18c967, sampled 0
6eaea2f498:    	lsl	w22, w22, #4  // guest 0x18c967, sampled 0
6eaea2f49c:    	add	w22, w22, #0x1a0  // guest 0x18c967, sampled 0
6eaea2f4a0:    	sxtw	x22, w22  // guest 0x18c967, sampled 0
6eaea2f4a4:    	add	x1, x22, x19  // guest 0x18c967, sampled 0
6eaea2f4a8:    	mov	x0, x19  // guest 0x18c967, sampled 0
6eaea2f4ac:    	adrp	x16, 0x6efc8aa000 <trace+0x4de7b000>  // guest 0x18c967, sampled 0
6eaea2f4b0:    	add	x16, x16, #0x484  // guest 0x18c967, sampled 0
6eaea2f4b4:    	blr	x16  // guest 0x18c967, sampled 0
6eaea2f4b8:    	sub	w20, w20, #0x1  // guest 0x18c967, sampled 0
6eaea2f4bc:    	and	w20, w20, #0x7  // guest 0x18c967, sampled 0
6eaea2f4c0:    	str	w20, [x19, #0x188]  // guest 0x18c967, sampled 0
6eaea2f4c4:    	sxtw	x22, w20  // guest 0x18c967, sampled 0
6eaea2f4c8:    	add	x22, x22, x19  // guest 0x18c967, sampled 0
6eaea2f4cc:    	strb	wzr, [x22, #0x190]  // guest 0x18c967, sampled 0
6eaea2f4d0:    	ldr	w22, [x19, #0x64]  // guest 0x18c967, sampled 0
6eaea2f4d4:    	strh	w22, [x19, #0x224]  // guest 0x18c967, sampled 0
6eaea2f4d8:    	str	w24, [x19, #0x230]  // guest 0x18c967, sampled 0
6eaea2f4dc:    	ldr	w22, [x19, #0x54]  // guest 0x18c967, sampled 0
6eaea2f4e0:    	strh	w22, [x19, #0x222]  // guest 0x18c967, sampled 0
6eaea2f4e4:    	mov	w22, #0xc967            // =51559  // guest 0x18c967, sampled 0
6eaea2f4e8:    	movk	w22, #0x18, lsl #16  // guest 0x18c967, sampled 0
6eaea2f4ec:    	str	w22, [x19, #0x228]  // guest 0x18c967, sampled 0
6eaea2f4f0:    	add	w22, w21, #0x48  // guest 0x18c96b, sampled 0
6eaea2f4f4:    	mov	w24, w22  // guest 0x18c96b, sampled 0
6eaea2f4f8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c96b, sampled 0
6eaea2f4fc:    	and	x16, x16, x22, lsr #7  // guest 0x18c96b, sampled 0
6eaea2f500:    	add	x17, x17, x16  // guest 0x18c96b, sampled 0
6eaea2f504:    	ldp	x16, x17, [x17]  // guest 0x18c96b, sampled 0
6eaea2f508:    	and	w30, w22, #0xfffff003  // guest 0x18c96b, sampled 0
6eaea2f50c:    	cmp	w16, w30  // guest 0x18c96b, sampled 0
6eaea2f510:    	b.ne	0x6eaea2f99c <trace+0x115c>  // guest 0x18c96b, sampled 0
6eaea2f514:    	add	x30, x17, w22, uxtw  // guest 0x18c96b, sampled 0
6eaea2f518:    	ldapr	w2, [x30]  // guest 0x18c96b, sampled 0
6eaea2f51c:    	add	x1, x19, #0x258  // guest 0x18c96b, sampled 0
6eaea2f520:    	mov	x0, x19  // guest 0x18c96b, sampled 0
6eaea2f524:    	adrp	x16, 0x6efc8aa000 <trace+0x4de7b000>  // guest 0x18c96b, sampled 0
6eaea2f528:    	add	x16, x16, #0x484  // guest 0x18c96b, sampled 0
6eaea2f52c:    	blr	x16  // guest 0x18c96b, sampled 0
6eaea2f530:    	lsl	w22, w20, #4  // guest 0x18c96b, sampled 0
6eaea2f534:    	add	w22, w22, #0x1a0  // guest 0x18c96b, sampled 0
6eaea2f538:    	sxtw	x22, w22  // guest 0x18c96b, sampled 0
6eaea2f53c:    	add	x1, x22, x19  // guest 0x18c96b, sampled 0
6eaea2f540:    	add	x2, x19, #0x258  // guest 0x18c96b, sampled 0
6eaea2f544:    	mov	x0, x19  // guest 0x18c96b, sampled 0
6eaea2f548:    	adrp	x16, 0x6efc8ab000 <trace+0x4de7c000>  // guest 0x18c96b, sampled 0
6eaea2f54c:    	add	x16, x16, #0xa78  // guest 0x18c96b, sampled 0
6eaea2f550:    	blr	x16  // guest 0x18c96b, sampled 0
6eaea2f554:    	ldr	w22, [x19, #0x64]  // guest 0x18c96b, sampled 0
6eaea2f558:    	strh	w22, [x19, #0x224]  // guest 0x18c96b, sampled 0
6eaea2f55c:    	str	w24, [x19, #0x230]  // guest 0x18c96b, sampled 0
6eaea2f560:    	ldr	w22, [x19, #0x54]  // guest 0x18c96b, sampled 0
6eaea2f564:    	strh	w22, [x19, #0x222]  // guest 0x18c96b, sampled 0
6eaea2f568:    	mov	w22, #0xc96b            // =51563  // guest 0x18c96b, sampled 0
6eaea2f56c:    	movk	w22, #0x18, lsl #16  // guest 0x18c96b, sampled 0
6eaea2f570:    	str	w22, [x19, #0x228]  // guest 0x18c96b, sampled 0
6eaea2f574:    	ldr	w22, [x19]  // guest 0x18c96f, sampled 0
6eaea2f578:    	mov	w24, #0x83fc            // =33788  // guest 0x18c96f, sampled 0
6eaea2f57c:    	add	w24, w22, w24  // guest 0x18c96f, sampled 0
6eaea2f580:    	mov	w25, w24  // guest 0x18c96f, sampled 0
6eaea2f584:    	lsl	w26, w20, #4  // guest 0x18c96f, sampled 0
6eaea2f588:    	add	w26, w26, #0x1a0  // guest 0x18c96f, sampled 0
6eaea2f58c:    	sxtw	x26, w26  // guest 0x18c96f, sampled 0
6eaea2f590:    	add	x1, x26, x19  // guest 0x18c96f, sampled 0
6eaea2f594:    	mov	x0, x19  // guest 0x18c96f, sampled 0
6eaea2f598:    	adrp	x16, 0x6efc8aa000 <trace+0x4de7b000>  // guest 0x18c96f, sampled 0
6eaea2f59c:    	add	x16, x16, #0x5c0  // guest 0x18c96f, sampled 0
6eaea2f5a0:    	blr	x16  // guest 0x18c96f, sampled 0
6eaea2f5a4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c96f, sampled 0
6eaea2f5a8:    	and	x16, x16, x24, lsr #7  // guest 0x18c96f, sampled 0
6eaea2f5ac:    	add	x17, x17, x16  // guest 0x18c96f, sampled 0
6eaea2f5b0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18c96f, sampled 0
6eaea2f5b4:    	and	w30, w24, #0xfffff003  // guest 0x18c96f, sampled 0
6eaea2f5b8:    	cmp	w16, w30  // guest 0x18c96f, sampled 0
6eaea2f5bc:    	b.ne	0x6eaea2f9c8 <trace+0x1188>  // guest 0x18c96f, sampled 0
6eaea2f5c0:    	add	x30, x17, w24, uxtw  // guest 0x18c96f, sampled 0
6eaea2f5c4:    	stlr	w0, [x30]  // guest 0x18c96f, sampled 0
6eaea2f5c8:    	sxtw	x24, w20  // guest 0x18c96f, sampled 1
6eaea2f5cc:    	add	x24, x24, x19  // guest 0x18c96f, sampled 0
6eaea2f5d0:    	strb	w23, [x24, #0x190]  // guest 0x18c96f, sampled 0
6eaea2f5d4:    	add	w20, w20, w23  // guest 0x18c96f, sampled 0
6eaea2f5d8:    	and	w20, w20, #0x7  // guest 0x18c96f, sampled 0
6eaea2f5dc:    	str	w20, [x19, #0x188]  // guest 0x18c96f, sampled 0
6eaea2f5e0:    	ldr	w24, [x19, #0x74]  // guest 0x18c96f, sampled 0
6eaea2f5e4:    	strh	w24, [x19, #0x224]  // guest 0x18c96f, sampled 0
6eaea2f5e8:    	str	w25, [x19, #0x230]  // guest 0x18c96f, sampled 0
6eaea2f5ec:    	ldr	w24, [x19, #0x54]  // guest 0x18c96f, sampled 0
6eaea2f5f0:    	strh	w24, [x19, #0x222]  // guest 0x18c96f, sampled 0
6eaea2f5f4:    	mov	w24, #0xc96f            // =51567  // guest 0x18c96f, sampled 0
6eaea2f5f8:    	movk	w24, #0x18, lsl #16  // guest 0x18c96f, sampled 0
6eaea2f5fc:    	str	w24, [x19, #0x228]  // guest 0x18c96f, sampled 0
6eaea2f600:    	add	w21, w21, #0x4c  // guest 0x18c975, sampled 0
6eaea2f604:    	mov	w24, w21  // guest 0x18c975, sampled 0
6eaea2f608:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c975, sampled 0
6eaea2f60c:    	and	x16, x16, x21, lsr #7  // guest 0x18c975, sampled 0
6eaea2f610:    	add	x17, x17, x16  // guest 0x18c975, sampled 0
6eaea2f614:    	ldp	x16, x17, [x17]  // guest 0x18c975, sampled 0
6eaea2f618:    	and	w30, w21, #0xfffff003  // guest 0x18c975, sampled 0
6eaea2f61c:    	cmp	w16, w30  // guest 0x18c975, sampled 0
6eaea2f620:    	b.ne	0x6eaea2f9f4 <trace+0x11b4>  // guest 0x18c975, sampled 0
6eaea2f624:    	add	x30, x17, w21, uxtw  // guest 0x18c975, sampled 0
6eaea2f628:    	ldapr	w2, [x30]  // guest 0x18c975, sampled 0
6eaea2f62c:    	add	x1, x19, #0x258  // guest 0x18c975, sampled 0
6eaea2f630:    	mov	x0, x19  // guest 0x18c975, sampled 0
6eaea2f634:    	adrp	x16, 0x6efc8aa000 <trace+0x4de7b000>  // guest 0x18c975, sampled 0
6eaea2f638:    	add	x16, x16, #0x484  // guest 0x18c975, sampled 0
6eaea2f63c:    	blr	x16  // guest 0x18c975, sampled 0
6eaea2f640:    	lsl	w21, w20, #4  // guest 0x18c975, sampled 0
6eaea2f644:    	add	w21, w21, #0x1a0  // guest 0x18c975, sampled 0
6eaea2f648:    	sxtw	x21, w21  // guest 0x18c975, sampled 0
6eaea2f64c:    	add	x1, x21, x19  // guest 0x18c975, sampled 0
6eaea2f650:    	add	x2, x19, #0x258  // guest 0x18c975, sampled 0
6eaea2f654:    	mov	x0, x19  // guest 0x18c975, sampled 0
6eaea2f658:    	adrp	x16, 0x6efc8ab000 <trace+0x4de7c000>  // guest 0x18c975, sampled 0
6eaea2f65c:    	add	x16, x16, #0xa78  // guest 0x18c975, sampled 0
6eaea2f660:    	blr	x16  // guest 0x18c975, sampled 0
6eaea2f664:    	ldr	w21, [x19, #0x64]  // guest 0x18c975, sampled 0
6eaea2f668:    	strh	w21, [x19, #0x224]  // guest 0x18c975, sampled 0
6eaea2f66c:    	str	w24, [x19, #0x230]  // guest 0x18c975, sampled 0
6eaea2f670:    	ldr	w21, [x19, #0x54]  // guest 0x18c975, sampled 0
6eaea2f674:    	strh	w21, [x19, #0x222]  // guest 0x18c975, sampled 0
6eaea2f678:    	mov	w21, #0xc975            // =51573  // guest 0x18c975, sampled 0
6eaea2f67c:    	movk	w21, #0x18, lsl #16  // guest 0x18c975, sampled 0
6eaea2f680:    	str	w21, [x19, #0x228]  // guest 0x18c975, sampled 0
6eaea2f684:    	mov	w21, #0x8400            // =33792  // guest 0x18c979, sampled 0
6eaea2f688:    	add	w21, w22, w21  // guest 0x18c979, sampled 0
6eaea2f68c:    	mov	w22, w21  // guest 0x18c979, sampled 0
6eaea2f690:    	lsl	w24, w20, #4  // guest 0x18c979, sampled 0
6eaea2f694:    	add	w24, w24, #0x1a0  // guest 0x18c979, sampled 0
6eaea2f698:    	sxtw	x24, w24  // guest 0x18c979, sampled 0
6eaea2f69c:    	add	x1, x24, x19  // guest 0x18c979, sampled 0
6eaea2f6a0:    	mov	x0, x19  // guest 0x18c979, sampled 0
6eaea2f6a4:    	adrp	x16, 0x6efc8aa000 <trace+0x4de7b000>  // guest 0x18c979, sampled 0
6eaea2f6a8:    	add	x16, x16, #0x5c0  // guest 0x18c979, sampled 0
6eaea2f6ac:    	blr	x16  // guest 0x18c979, sampled 0
6eaea2f6b0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18c979, sampled 0
6eaea2f6b4:    	and	x16, x16, x21, lsr #7  // guest 0x18c979, sampled 0
6eaea2f6b8:    	add	x17, x17, x16  // guest 0x18c979, sampled 0
6eaea2f6bc:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18c979, sampled 0
6eaea2f6c0:    	and	w30, w21, #0xfffff003  // guest 0x18c979, sampled 1
6eaea2f6c4:    	cmp	w16, w30  // guest 0x18c979, sampled 0
6eaea2f6c8:    	b.ne	0x6eaea2fa20 <trace+0x11e0>  // guest 0x18c979, sampled 0
6eaea2f6cc:    	add	x30, x17, w21, uxtw  // guest 0x18c979, sampled 0
6eaea2f6d0:    	stlr	w0, [x30]  // guest 0x18c979, sampled 0
6eaea2f6d4:    	sxtw	x21, w20  // guest 0x18c979, sampled 0
6eaea2f6d8:    	add	x21, x21, x19  // guest 0x18c979, sampled 0
6eaea2f6dc:    	strb	w23, [x21, #0x190]  // guest 0x18c979, sampled 0
6eaea2f6e0:    	add	w20, w20, w23  // guest 0x18c979, sampled 0
6eaea2f6e4:    	and	w20, w20, #0x7  // guest 0x18c979, sampled 0
6eaea2f6e8:    	str	w20, [x19, #0x188]  // guest 0x18c979, sampled 0
6eaea2f6ec:    	ldr	w20, [x19, #0x74]  // guest 0x18c979, sampled 0
6eaea2f6f0:    	strh	w20, [x19, #0x224]  // guest 0x18c979, sampled 0
6eaea2f6f4:    	str	w22, [x19, #0x230]  // guest 0x18c979, sampled 0
6eaea2f6f8:    	ldr	w20, [x19, #0x54]  // guest 0x18c979, sampled 0
6eaea2f6fc:    	strh	w20, [x19, #0x222]  // guest 0x18c979, sampled 0
6eaea2f700:    	mov	w20, #0xc979            // =51577  // guest 0x18c979, sampled 0
6eaea2f704:    	movk	w20, #0x18, lsl #16  // guest 0x18c979, sampled 0
6eaea2f708:    	str	w20, [x19, #0x228]  // guest 0x18c979, sampled 0
6eaea2f70c:    	sturb	w23, [x19, #-0xc]  // guest 0x18c979, sampled 0
6eaea2f710:    	mov	w20, #0x22              // =34  // guest 0x18c97f, sampled 0
6eaea2f714:    	str	w20, [x19, #0x34]  // guest 0x18c97f, sampled 0
6eaea2f718:    	ldr	w20, [x19, #0x28]  // guest 0x18c97f, sampled 0
6eaea2f71c:    	cbnz	w20, 0x6eaea2f73c <trace+0xefc>  // guest 0x18c97f, sampled 0
6eaea2f720:    	b	0x6eaea2f720 <trace+0xee0>  // guest 0x18c97f, sampled 0
6eaea2f724:    	br	x16  // guest 0x18c97f, sampled 0
6eaea2f728:    	mov	w20, #0xc981            // =51585  // guest 0x18c97f, sampled 0
6eaea2f72c:    	movk	w20, #0x18, lsl #16  // guest 0x18c97f, sampled 0
6eaea2f730:    	str	w20, [x19, #0x20]  // guest 0x18c97f, sampled 0
6eaea2f734:    	adr	x0, 0x6eaea2e781 <trace+0xffffffffffffff41>  // guest 0x18c97f, sampled 0
6eaea2f738:    	b	0x6ea842202c <trace+0xfffffffff99f37ec>  // guest 0x18c97f, sampled 0
6eaea2f73c:    	b	0x6eaea2f73c <trace+0xefc>  // guest 0x18c97f, sampled 0
6eaea2f740:    	br	x16  // guest 0x18c97f, sampled 0
6eaea2f744:    	mov	w20, #0xc914            // =51476  // guest 0x18c97f, sampled 0
6eaea2f748:    	movk	w20, #0x18, lsl #16  // guest 0x18c97f, sampled 0
6eaea2f74c:    	str	w20, [x19, #0x20]  // guest 0x18c97f, sampled 0
6eaea2f750:    	adr	x0, 0x6eaea2e780 <trace+0xffffffffffffff40>  // guest 0x18c97f, sampled 0
6eaea2f754:    	b	0x6ea842202c <trace+0xfffffffff99f37ec>  // guest 0x18c97f, sampled 0
6eaea2f758:    	adr	x0, 0x6eaea2e783 <trace+0xffffffffffffff43>  // guest 0x18c97f, sampled 0
6eaea2f75c:    	b	0x6ea842202c <trace+0xfffffffff99f37ec>  // guest 0x18c97f, sampled 0
6eaea2f760:    	mov	w1, w21
6eaea2f764:    	mov	x0, x19
6eaea2f768:    	mov	w2, #0x4045             // =16453
6eaea2f76c:    	movk	w2, #0x1, lsl #16
6eaea2f770:    	adr	x3, 0x6eaea2e8f8 <trace+0xb8>
6eaea2f774:    	adrp	x16, 0x6efc87d000 <trace+0x4de4e000>
6eaea2f778:    	add	x16, x16, #0x58
6eaea2f77c:    	blr	x16
6eaea2f780:    	mov	w2, w0
6eaea2f784:    	dmb	ishld
6eaea2f788:    	b	0x6eaea2e8f8 <trace+0xb8>
6eaea2f78c:    	mov	w1, w22
6eaea2f790:    	mov	x0, x19
6eaea2f794:    	mov	w2, #0x4045             // =16453
6eaea2f798:    	movk	w2, #0x1, lsl #16
6eaea2f79c:    	adr	x3, 0x6eaea2eb04 <trace+0x2c4>
6eaea2f7a0:    	adrp	x16, 0x6efc87d000 <trace+0x4de4e000>
6eaea2f7a4:    	add	x16, x16, #0x58
6eaea2f7a8:    	blr	x16
6eaea2f7ac:    	mov	w2, w0
6eaea2f7b0:    	dmb	ishld
6eaea2f7b4:    	b	0x6eaea2eb04 <trace+0x2c4>
6eaea2f7b8:    	mov	w1, w22
6eaea2f7bc:    	mov	x0, x19
6eaea2f7c0:    	mov	w2, #0x4045             // =16453
6eaea2f7c4:    	movk	w2, #0x1, lsl #16
6eaea2f7c8:    	adr	x3, 0x6eaea2ebec <trace+0x3ac>
6eaea2f7cc:    	adrp	x16, 0x6efc87d000 <trace+0x4de4e000>
6eaea2f7d0:    	add	x16, x16, #0x58
6eaea2f7d4:    	blr	x16
6eaea2f7d8:    	mov	w2, w0
6eaea2f7dc:    	dmb	ishld
6eaea2f7e0:    	b	0x6eaea2ebec <trace+0x3ac>
6eaea2f7e4:    	mov	w1, w24
6eaea2f7e8:    	mov	w2, w0
6eaea2f7ec:    	mov	x0, x19
6eaea2f7f0:    	mov	w3, #0x4045             // =16453
6eaea2f7f4:    	movk	w3, #0x1, lsl #16
6eaea2f7f8:    	adr	x4, 0x6eaea2ecfc <trace+0x4bc>
6eaea2f7fc:    	adrp	x16, 0x6efc87d000 <trace+0x4de4e000>
6eaea2f800:    	add	x16, x16, #0xc38
6eaea2f804:    	blr	x16
6eaea2f808:    	dmb	ishld
6eaea2f80c:    	b	0x6eaea2ecfc <trace+0x4bc>
6eaea2f810:    	mov	w1, w24
6eaea2f814:    	mov	x0, x19
6eaea2f818:    	mov	w2, #0x4045             // =16453
6eaea2f81c:    	movk	w2, #0x1, lsl #16
6eaea2f820:    	adr	x3, 0x6eaea2edc0 <trace+0x580>
6eaea2f824:    	adrp	x16, 0x6efc87d000 <trace+0x4de4e000>
6eaea2f828:    	add	x16, x16, #0x58
6eaea2f82c:    	blr	x16
6eaea2f830:    	mov	w2, w0
6eaea2f834:    	dmb	ishld
6eaea2f838:    	b	0x6eaea2edc0 <trace+0x580>
6eaea2f83c:    	mov	w1, w21
6eaea2f840:    	mov	x0, x19
6eaea2f844:    	mov	w2, #0x4045             // =16453
6eaea2f848:    	movk	w2, #0x1, lsl #16
6eaea2f84c:    	adr	x3, 0x6eaea2eea8 <trace+0x668>
6eaea2f850:    	adrp	x16, 0x6efc87d000 <trace+0x4de4f000>
6eaea2f854:    	add	x16, x16, #0x58
6eaea2f858:    	blr	x16
6eaea2f85c:    	mov	w2, w0
6eaea2f860:    	dmb	ishld
6eaea2f864:    	b	0x6eaea2eea8 <trace+0x668>
6eaea2f868:    	mov	w1, w21
6eaea2f86c:    	mov	w2, w0
6eaea2f870:    	mov	x0, x19
6eaea2f874:    	mov	w3, #0x4045             // =16453
6eaea2f878:    	movk	w3, #0x1, lsl #16
6eaea2f87c:    	adr	x4, 0x6eaea2efb0 <trace+0x770>
6eaea2f880:    	adrp	x16, 0x6efc87d000 <trace+0x4de4f000>
6eaea2f884:    	add	x16, x16, #0xc38
6eaea2f888:    	blr	x16
6eaea2f88c:    	dmb	ishld
6eaea2f890:    	b	0x6eaea2efb0 <trace+0x770>
6eaea2f894:    	mov	w1, w24
6eaea2f898:    	mov	x0, x19
6eaea2f89c:    	mov	w2, #0x4045             // =16453
6eaea2f8a0:    	movk	w2, #0x1, lsl #16
6eaea2f8a4:    	adr	x3, 0x6eaea2f078 <trace+0x838>
6eaea2f8a8:    	adrp	x16, 0x6efc87d000 <trace+0x4de4f000>
6eaea2f8ac:    	add	x16, x16, #0x58
6eaea2f8b0:    	blr	x16
6eaea2f8b4:    	mov	w2, w0
6eaea2f8b8:    	dmb	ishld
6eaea2f8bc:    	b	0x6eaea2f078 <trace+0x838>
6eaea2f8c0:    	mov	w1, w24
6eaea2f8c4:    	mov	x0, x19
6eaea2f8c8:    	mov	w2, #0x4045             // =16453
6eaea2f8cc:    	movk	w2, #0x1, lsl #16
6eaea2f8d0:    	adr	x3, 0x6eaea2f160 <trace+0x920>
6eaea2f8d4:    	adrp	x16, 0x6efc87d000 <trace+0x4de4f000>
6eaea2f8d8:    	add	x16, x16, #0x58
6eaea2f8dc:    	blr	x16
6eaea2f8e0:    	mov	w2, w0
6eaea2f8e4:    	dmb	ishld
6eaea2f8e8:    	b	0x6eaea2f160 <trace+0x920>
6eaea2f8ec:    	mov	w1, w22
6eaea2f8f0:    	mov	w2, w0
6eaea2f8f4:    	mov	x0, x19
6eaea2f8f8:    	mov	w3, #0x4045             // =16453
6eaea2f8fc:    	movk	w3, #0x1, lsl #16
6eaea2f900:    	adr	x4, 0x6eaea2f268 <trace+0xa28>
6eaea2f904:    	adrp	x16, 0x6efc87d000 <trace+0x4de4f000>
6eaea2f908:    	add	x16, x16, #0xc38
6eaea2f90c:    	blr	x16
6eaea2f910:    	dmb	ishld
6eaea2f914:    	b	0x6eaea2f268 <trace+0xa28>
6eaea2f918:    	mov	w1, w21
6eaea2f91c:    	mov	x0, x19
6eaea2f920:    	mov	w2, #0x4045             // =16453
6eaea2f924:    	movk	w2, #0x1, lsl #16
6eaea2f928:    	adr	x3, 0x6eaea2f2cc <trace+0xa8c>
6eaea2f92c:    	adrp	x16, 0x6efc87d000 <trace+0x4de4f000>
6eaea2f930:    	add	x16, x16, #0x58
6eaea2f934:    	blr	x16
6eaea2f938:    	mov	w2, w0
6eaea2f93c:    	dmb	ishld
6eaea2f940:    	b	0x6eaea2f2cc <trace+0xa8c>
6eaea2f944:    	mov	w1, w20
6eaea2f948:    	mov	x0, x19
6eaea2f94c:    	mov	w2, #0x4045             // =16453
6eaea2f950:    	movk	w2, #0x1, lsl #16
6eaea2f954:    	adr	x3, 0x6eaea2f3a0 <trace+0xb60>
6eaea2f958:    	adrp	x16, 0x6efc87d000 <trace+0x4de4f000>
6eaea2f95c:    	add	x16, x16, #0x58
6eaea2f960:    	blr	x16
6eaea2f964:    	mov	w2, w0
6eaea2f968:    	dmb	ishld
6eaea2f96c:    	b	0x6eaea2f3a0 <trace+0xb60>
6eaea2f970:    	mov	w1, w22
6eaea2f974:    	mov	x0, x19
6eaea2f978:    	mov	w2, #0x4045             // =16453
6eaea2f97c:    	movk	w2, #0x1, lsl #16
6eaea2f980:    	adr	x3, 0x6eaea2f490 <trace+0xc50>
6eaea2f984:    	adrp	x16, 0x6efc87d000 <trace+0x4de4f000>
6eaea2f988:    	add	x16, x16, #0x58
6eaea2f98c:    	blr	x16
6eaea2f990:    	mov	w2, w0
6eaea2f994:    	dmb	ishld
6eaea2f998:    	b	0x6eaea2f490 <trace+0xc50>
6eaea2f99c:    	mov	w1, w22
6eaea2f9a0:    	mov	x0, x19
6eaea2f9a4:    	mov	w2, #0x4045             // =16453
6eaea2f9a8:    	movk	w2, #0x1, lsl #16
6eaea2f9ac:    	adr	x3, 0x6eaea2f51c <trace+0xcdc>
6eaea2f9b0:    	adrp	x16, 0x6efc87d000 <trace+0x4de4f000>
6eaea2f9b4:    	add	x16, x16, #0x58
6eaea2f9b8:    	blr	x16
6eaea2f9bc:    	mov	w2, w0
6eaea2f9c0:    	dmb	ishld
6eaea2f9c4:    	b	0x6eaea2f51c <trace+0xcdc>
6eaea2f9c8:    	mov	w1, w24
6eaea2f9cc:    	mov	w2, w0
6eaea2f9d0:    	mov	x0, x19
6eaea2f9d4:    	mov	w3, #0x4045             // =16453
6eaea2f9d8:    	movk	w3, #0x1, lsl #16
6eaea2f9dc:    	adr	x4, 0x6eaea2f5c8 <trace+0xd88>
6eaea2f9e0:    	adrp	x16, 0x6efc87d000 <trace+0x4de4f000>
6eaea2f9e4:    	add	x16, x16, #0xc38
6eaea2f9e8:    	blr	x16
6eaea2f9ec:    	dmb	ishld
6eaea2f9f0:    	b	0x6eaea2f5c8 <trace+0xd88>
6eaea2f9f4:    	mov	w1, w21
6eaea2f9f8:    	mov	x0, x19
6eaea2f9fc:    	mov	w2, #0x4045             // =16453
6eaea2fa00:    	movk	w2, #0x1, lsl #16
6eaea2fa04:    	adr	x3, 0x6eaea2f62c <trace+0xdec>
6eaea2fa08:    	adrp	x16, 0x6efc87d000 <trace+0x4de4f000>
6eaea2fa0c:    	add	x16, x16, #0x58
6eaea2fa10:    	blr	x16
6eaea2fa14:    	mov	w2, w0
6eaea2fa18:    	dmb	ishld
6eaea2fa1c:    	b	0x6eaea2f62c <trace+0xdec>
6eaea2fa20:    	mov	w1, w21
6eaea2fa24:    	mov	w2, w0
6eaea2fa28:    	mov	x0, x19
6eaea2fa2c:    	mov	w3, #0x4045             // =16453
6eaea2fa30:    	movk	w3, #0x1, lsl #16
6eaea2fa34:    	adr	x4, 0x6eaea2f6d4 <trace+0xe94>
6eaea2fa38:    	adrp	x16, 0x6efc87d000 <trace+0x4de4f000>
6eaea2fa3c:    	add	x16, x16, #0xc38
6eaea2fa40:    	blr	x16
6eaea2fa44:    	dmb	ishld
6eaea2fa48:    	b	0x6eaea2f6d4 <trace+0xe94>