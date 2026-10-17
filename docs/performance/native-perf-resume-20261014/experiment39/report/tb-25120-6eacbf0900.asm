
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-25120-6eacbf0900.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006eacbf0900 <trace>:
6eacbf0900:    	ldur	w20, [x19, #-0x10]  // guest 0x25120, sampled 0
6eacbf0904:    	tbnz	w20, #0x1f, 0x6eacbf18e4 <trace+0xfe4>  // guest 0x25120, sampled 0
6eacbf0908:    	sturb	wzr, [x19, #-0xc]  // guest 0x25120, sampled 0
6eacbf090c:    	ldr	w20, [x19, #0x10]  // guest 0x25120, sampled 0
6eacbf0910:    	sub	w20, w20, #0x4  // guest 0x25120, sampled 0
6eacbf0914:    	mov	w21, w20  // guest 0x25120, sampled 0
6eacbf0918:    	ldr	w22, [x19, #0x18]  // guest 0x25120, sampled 0
6eacbf091c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25120, sampled 0
6eacbf0920:    	and	x16, x16, x21, lsr #7  // guest 0x25120, sampled 0
6eacbf0924:    	add	x17, x17, x16  // guest 0x25120, sampled 0
6eacbf0928:    	ldp	x17, x16, [x17, #0x8]  // guest 0x25120, sampled 0
6eacbf092c:    	and	w30, w21, #0xfffff003  // guest 0x25120, sampled 0
6eacbf0930:    	cmp	w16, w30  // guest 0x25120, sampled 0
6eacbf0934:    	b.ne	0x6eacbf18ec <trace+0xfec>  // guest 0x25120, sampled 0
6eacbf0938:    	add	x30, x17, w21, uxtw  // guest 0x25120, sampled 0
6eacbf093c:    	stlr	w22, [x30]  // guest 0x25120, sampled 0
6eacbf0940:    	str	w20, [x19, #0x10]  // guest 0x25120, sampled 0
6eacbf0944:    	sub	w20, w20, #0x4  // guest 0x25121, sampled 0
6eacbf0948:    	mov	w21, w20  // guest 0x25121, sampled 0
6eacbf094c:    	ldr	w22, [x19, #0x1c]  // guest 0x25121, sampled 0
6eacbf0950:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25121, sampled 0
6eacbf0954:    	and	x16, x16, x21, lsr #7  // guest 0x25121, sampled 0
6eacbf0958:    	add	x17, x17, x16  // guest 0x25121, sampled 0
6eacbf095c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x25121, sampled 0
6eacbf0960:    	and	w30, w21, #0xfffff003  // guest 0x25121, sampled 0
6eacbf0964:    	cmp	w16, w30  // guest 0x25121, sampled 0
6eacbf0968:    	b.ne	0x6eacbf1918 <trace+0x1018>  // guest 0x25121, sampled 0
6eacbf096c:    	add	x30, x17, w21, uxtw  // guest 0x25121, sampled 0
6eacbf0970:    	stlr	w22, [x30]  // guest 0x25121, sampled 0
6eacbf0974:    	str	w20, [x19, #0x10]  // guest 0x25121, sampled 0
6eacbf0978:    	add	w21, w20, #0x10  // guest 0x25122, sampled 0
6eacbf097c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25122, sampled 0
6eacbf0980:    	and	x16, x16, x21, lsr #7  // guest 0x25122, sampled 0
6eacbf0984:    	add	x17, x17, x16  // guest 0x25122, sampled 0
6eacbf0988:    	ldp	x16, x17, [x17]  // guest 0x25122, sampled 0
6eacbf098c:    	and	w30, w21, #0xfffff003  // guest 0x25122, sampled 0
6eacbf0990:    	cmp	w16, w30  // guest 0x25122, sampled 0
6eacbf0994:    	b.ne	0x6eacbf1944 <trace+0x1044>  // guest 0x25122, sampled 0
6eacbf0998:    	add	x30, x17, w21, uxtw  // guest 0x25122, sampled 0
6eacbf099c:    	ldapr	w21, [x30]  // guest 0x25122, sampled 0
6eacbf09a0:    	str	w21, [x19, #0x18]  // guest 0x25122, sampled 0
6eacbf09a4:    	add	w22, w20, #0xc  // guest 0x25126, sampled 0
6eacbf09a8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25126, sampled 0
6eacbf09ac:    	and	x16, x16, x22, lsr #7  // guest 0x25126, sampled 0
6eacbf09b0:    	add	x17, x17, x16  // guest 0x25126, sampled 0
6eacbf09b4:    	ldp	x16, x17, [x17]  // guest 0x25126, sampled 0
6eacbf09b8:    	and	w30, w22, #0xfffff003  // guest 0x25126, sampled 0
6eacbf09bc:    	cmp	w16, w30  // guest 0x25126, sampled 0
6eacbf09c0:    	b.ne	0x6eacbf1970 <trace+0x1070>  // guest 0x25126, sampled 0
6eacbf09c4:    	add	x30, x17, w22, uxtw  // guest 0x25126, sampled 0
6eacbf09c8:    	ldapr	w22, [x30]  // guest 0x25126, sampled 0
6eacbf09cc:    	str	w22, [x19, #0x8]  // guest 0x25126, sampled 0
6eacbf09d0:    	add	w20, w20, #0x14  // guest 0x2512a, sampled 0
6eacbf09d4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2512a, sampled 0
6eacbf09d8:    	and	x16, x16, x20, lsr #7  // guest 0x2512a, sampled 0
6eacbf09dc:    	add	x17, x17, x16  // guest 0x2512a, sampled 0
6eacbf09e0:    	ldp	x16, x17, [x17]  // guest 0x2512a, sampled 0
6eacbf09e4:    	and	w30, w20, #0xfffff003  // guest 0x2512a, sampled 0
6eacbf09e8:    	cmp	w16, w30  // guest 0x2512a, sampled 0
6eacbf09ec:    	b.ne	0x6eacbf199c <trace+0x109c>  // guest 0x2512a, sampled 0
6eacbf09f0:    	add	x30, x17, w20, uxtw  // guest 0x2512a, sampled 0
6eacbf09f4:    	ldapr	w20, [x30]  // guest 0x2512a, sampled 0
6eacbf09f8:    	str	w20, [x19, #0x1c]  // guest 0x2512a, sampled 1
6eacbf09fc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2512e, sampled 0
6eacbf0a00:    	and	x16, x16, x21, lsr #7  // guest 0x2512e, sampled 0
6eacbf0a04:    	add	x17, x17, x16  // guest 0x2512e, sampled 0
6eacbf0a08:    	ldp	x16, x17, [x17]  // guest 0x2512e, sampled 0
6eacbf0a0c:    	and	w30, w21, #0xfffff003  // guest 0x2512e, sampled 1
6eacbf0a10:    	cmp	w16, w30  // guest 0x2512e, sampled 0
6eacbf0a14:    	b.ne	0x6eacbf19c8 <trace+0x10c8>  // guest 0x2512e, sampled 0
6eacbf0a18:    	add	x30, x17, w21, uxtw  // guest 0x2512e, sampled 1
6eacbf0a1c:    	ldapr	w2, [x30]  // guest 0x2512e, sampled 0
6eacbf0a20:    	ldr	w20, [x19, #0x188]  // guest 0x2512e, sampled 0
6eacbf0a24:    	add	w22, w20, #0x7  // guest 0x2512e, sampled 0
6eacbf0a28:    	and	w22, w22, #0x7  // guest 0x2512e, sampled 0
6eacbf0a2c:    	lsl	w22, w22, #4  // guest 0x2512e, sampled 0
6eacbf0a30:    	add	w22, w22, #0x1a0  // guest 0x2512e, sampled 0
6eacbf0a34:    	sxtw	x22, w22  // guest 0x2512e, sampled 0
6eacbf0a38:    	add	x1, x22, x19  // guest 0x2512e, sampled 0
6eacbf0a3c:    	mov	x0, x19  // guest 0x2512e, sampled 0
6eacbf0a40:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcba000>  // guest 0x2512e, sampled 0
6eacbf0a44:    	add	x16, x16, #0x484  // guest 0x2512e, sampled 0
6eacbf0a48:    	blr	x16  // guest 0x2512e, sampled 0
6eacbf0a4c:    	sub	w20, w20, #0x1  // guest 0x2512e, sampled 0
6eacbf0a50:    	and	w20, w20, #0x7  // guest 0x2512e, sampled 0
6eacbf0a54:    	str	w20, [x19, #0x188]  // guest 0x2512e, sampled 0
6eacbf0a58:    	sxtw	x22, w20  // guest 0x2512e, sampled 0
6eacbf0a5c:    	add	x22, x22, x19  // guest 0x2512e, sampled 0
6eacbf0a60:    	strb	wzr, [x22, #0x190]  // guest 0x2512e, sampled 0
6eacbf0a64:    	ldr	w22, [x19, #0x74]  // guest 0x2512e, sampled 0
6eacbf0a68:    	strh	w22, [x19, #0x224]  // guest 0x2512e, sampled 0
6eacbf0a6c:    	str	w21, [x19, #0x230]  // guest 0x2512e, sampled 0
6eacbf0a70:    	ldr	w22, [x19, #0x54]  // guest 0x2512e, sampled 0
6eacbf0a74:    	strh	w22, [x19, #0x222]  // guest 0x2512e, sampled 0
6eacbf0a78:    	mov	w22, #0x512e            // =20782  // guest 0x2512e, sampled 0
6eacbf0a7c:    	movk	w22, #0x2, lsl #16  // guest 0x2512e, sampled 0
6eacbf0a80:    	str	w22, [x19, #0x228]  // guest 0x2512e, sampled 0
6eacbf0a84:    	add	w21, w21, #0x4  // guest 0x25130, sampled 0
6eacbf0a88:    	mov	w22, w21  // guest 0x25130, sampled 0
6eacbf0a8c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25130, sampled 0
6eacbf0a90:    	and	x16, x16, x21, lsr #7  // guest 0x25130, sampled 0
6eacbf0a94:    	add	x17, x17, x16  // guest 0x25130, sampled 0
6eacbf0a98:    	ldp	x16, x17, [x17]  // guest 0x25130, sampled 0
6eacbf0a9c:    	and	w30, w21, #0xfffff003  // guest 0x25130, sampled 0
6eacbf0aa0:    	cmp	w16, w30  // guest 0x25130, sampled 0
6eacbf0aa4:    	b.ne	0x6eacbf19f4 <trace+0x10f4>  // guest 0x25130, sampled 0
6eacbf0aa8:    	add	x30, x17, w21, uxtw  // guest 0x25130, sampled 0
6eacbf0aac:    	ldapr	w2, [x30]  // guest 0x25130, sampled 0
6eacbf0ab0:    	add	w21, w20, #0x7  // guest 0x25130, sampled 0
6eacbf0ab4:    	and	w21, w21, #0x7  // guest 0x25130, sampled 0
6eacbf0ab8:    	lsl	w21, w21, #4  // guest 0x25130, sampled 0
6eacbf0abc:    	add	w21, w21, #0x1a0  // guest 0x25130, sampled 0
6eacbf0ac0:    	sxtw	x21, w21  // guest 0x25130, sampled 0
6eacbf0ac4:    	add	x1, x21, x19  // guest 0x25130, sampled 0
6eacbf0ac8:    	mov	x0, x19  // guest 0x25130, sampled 0
6eacbf0acc:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcba000>  // guest 0x25130, sampled 0
6eacbf0ad0:    	add	x16, x16, #0x484  // guest 0x25130, sampled 0
6eacbf0ad4:    	blr	x16  // guest 0x25130, sampled 0
6eacbf0ad8:    	sub	w20, w20, #0x1  // guest 0x25130, sampled 0
6eacbf0adc:    	and	w20, w20, #0x7  // guest 0x25130, sampled 0
6eacbf0ae0:    	str	w20, [x19, #0x188]  // guest 0x25130, sampled 0
6eacbf0ae4:    	sxtw	x20, w20  // guest 0x25130, sampled 0
6eacbf0ae8:    	add	x20, x20, x19  // guest 0x25130, sampled 0
6eacbf0aec:    	strb	wzr, [x20, #0x190]  // guest 0x25130, sampled 0
6eacbf0af0:    	ldr	w20, [x19, #0x74]  // guest 0x25130, sampled 0
6eacbf0af4:    	strh	w20, [x19, #0x224]  // guest 0x25130, sampled 0
6eacbf0af8:    	str	w22, [x19, #0x230]  // guest 0x25130, sampled 0
6eacbf0afc:    	ldr	w20, [x19, #0x54]  // guest 0x25130, sampled 0
6eacbf0b00:    	strh	w20, [x19, #0x222]  // guest 0x25130, sampled 0
6eacbf0b04:    	mov	w20, #0x5130            // =20784  // guest 0x25130, sampled 1
6eacbf0b08:    	movk	w20, #0x2, lsl #16  // guest 0x25130, sampled 0
6eacbf0b0c:    	str	w20, [x19, #0x228]  // guest 0x25130, sampled 0
6eacbf0b10:    	mov	w1, #0x1                // =1  // guest 0x25133, sampled 0
6eacbf0b14:    	mov	x0, x19  // guest 0x25133, sampled 0
6eacbf0b18:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbb000>  // guest 0x25133, sampled 0
6eacbf0b1c:    	add	x16, x16, #0x5a0  // guest 0x25133, sampled 0
6eacbf0b20:    	blr	x16  // guest 0x25133, sampled 0
6eacbf0b24:    	ldr	w20, [x19, #0x54]  // guest 0x25133, sampled 0
6eacbf0b28:    	strh	w20, [x19, #0x222]  // guest 0x25133, sampled 0
6eacbf0b2c:    	mov	w20, #0x5133            // =20787  // guest 0x25133, sampled 0
6eacbf0b30:    	movk	w20, #0x2, lsl #16  // guest 0x25133, sampled 0
6eacbf0b34:    	str	w20, [x19, #0x228]  // guest 0x25133, sampled 0
6eacbf0b38:    	ldr	w20, [x19, #0x18]  // guest 0x25135, sampled 0
6eacbf0b3c:    	add	w20, w20, #0x8  // guest 0x25135, sampled 0
6eacbf0b40:    	mov	w21, w20  // guest 0x25135, sampled 0
6eacbf0b44:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25135, sampled 0
6eacbf0b48:    	and	x16, x16, x20, lsr #7  // guest 0x25135, sampled 0
6eacbf0b4c:    	add	x17, x17, x16  // guest 0x25135, sampled 0
6eacbf0b50:    	ldp	x16, x17, [x17]  // guest 0x25135, sampled 0
6eacbf0b54:    	and	w30, w20, #0xfffff003  // guest 0x25135, sampled 0
6eacbf0b58:    	cmp	w16, w30  // guest 0x25135, sampled 0
6eacbf0b5c:    	b.ne	0x6eacbf1a20 <trace+0x1120>  // guest 0x25135, sampled 0
6eacbf0b60:    	add	x30, x17, w20, uxtw  // guest 0x25135, sampled 0
6eacbf0b64:    	ldapr	w2, [x30]  // guest 0x25135, sampled 0
6eacbf0b68:    	ldr	w20, [x19, #0x188]  // guest 0x25135, sampled 0
6eacbf0b6c:    	add	w22, w20, #0x7  // guest 0x25135, sampled 0
6eacbf0b70:    	and	w22, w22, #0x7  // guest 0x25135, sampled 0
6eacbf0b74:    	lsl	w22, w22, #4  // guest 0x25135, sampled 0
6eacbf0b78:    	add	w22, w22, #0x1a0  // guest 0x25135, sampled 0
6eacbf0b7c:    	sxtw	x22, w22  // guest 0x25135, sampled 0
6eacbf0b80:    	add	x1, x22, x19  // guest 0x25135, sampled 0
6eacbf0b84:    	mov	x0, x19  // guest 0x25135, sampled 0
6eacbf0b88:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcba000>  // guest 0x25135, sampled 0
6eacbf0b8c:    	add	x16, x16, #0x484  // guest 0x25135, sampled 0
6eacbf0b90:    	blr	x16  // guest 0x25135, sampled 0
6eacbf0b94:    	sub	w20, w20, #0x1  // guest 0x25135, sampled 0
6eacbf0b98:    	and	w20, w20, #0x7  // guest 0x25135, sampled 0
6eacbf0b9c:    	str	w20, [x19, #0x188]  // guest 0x25135, sampled 0
6eacbf0ba0:    	sxtw	x20, w20  // guest 0x25135, sampled 0
6eacbf0ba4:    	add	x20, x20, x19  // guest 0x25135, sampled 0
6eacbf0ba8:    	strb	wzr, [x20, #0x190]  // guest 0x25135, sampled 0
6eacbf0bac:    	ldr	w20, [x19, #0x74]  // guest 0x25135, sampled 0
6eacbf0bb0:    	strh	w20, [x19, #0x224]  // guest 0x25135, sampled 0
6eacbf0bb4:    	str	w21, [x19, #0x230]  // guest 0x25135, sampled 0
6eacbf0bb8:    	ldr	w20, [x19, #0x54]  // guest 0x25135, sampled 0
6eacbf0bbc:    	strh	w20, [x19, #0x222]  // guest 0x25135, sampled 0
6eacbf0bc0:    	mov	w20, #0x5135            // =20789  // guest 0x25135, sampled 0
6eacbf0bc4:    	movk	w20, #0x2, lsl #16  // guest 0x25135, sampled 0
6eacbf0bc8:    	str	w20, [x19, #0x228]  // guest 0x25135, sampled 0
6eacbf0bcc:    	mov	w1, #0x1                // =1  // guest 0x25138, sampled 0
6eacbf0bd0:    	mov	x0, x19  // guest 0x25138, sampled 0
6eacbf0bd4:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbb000>  // guest 0x25138, sampled 0
6eacbf0bd8:    	add	x16, x16, #0x5a0  // guest 0x25138, sampled 0
6eacbf0bdc:    	blr	x16  // guest 0x25138, sampled 0
6eacbf0be0:    	ldr	w20, [x19, #0x54]  // guest 0x25138, sampled 0
6eacbf0be4:    	strh	w20, [x19, #0x222]  // guest 0x25138, sampled 0
6eacbf0be8:    	mov	w20, #0x5138            // =20792  // guest 0x25138, sampled 0
6eacbf0bec:    	movk	w20, #0x2, lsl #16  // guest 0x25138, sampled 0
6eacbf0bf0:    	str	w20, [x19, #0x228]  // guest 0x25138, sampled 0
6eacbf0bf4:    	ldr	w20, [x19, #0x188]  // guest 0x2513a, sampled 0
6eacbf0bf8:    	sub	w20, w20, #0x1  // guest 0x2513a, sampled 0
6eacbf0bfc:    	and	w20, w20, #0x7  // guest 0x2513a, sampled 0
6eacbf0c00:    	str	w20, [x19, #0x188]  // guest 0x2513a, sampled 0
6eacbf0c04:    	sxtw	x21, w20  // guest 0x2513a, sampled 0
6eacbf0c08:    	add	x21, x21, x19  // guest 0x2513a, sampled 0
6eacbf0c0c:    	strb	wzr, [x21, #0x190]  // guest 0x2513a, sampled 0
6eacbf0c10:    	lsl	w21, w20, #4  // guest 0x2513a, sampled 0
6eacbf0c14:    	add	w21, w21, #0x1a0  // guest 0x2513a, sampled 0
6eacbf0c18:    	sxtw	x21, w21  // guest 0x2513a, sampled 0
6eacbf0c1c:    	add	x21, x21, x19  // guest 0x2513a, sampled 0
6eacbf0c20:    	add	w22, w20, #0x1  // guest 0x2513a, sampled 0
6eacbf0c24:    	and	w22, w22, #0x7  // guest 0x2513a, sampled 0
6eacbf0c28:    	lsl	w22, w22, #4  // guest 0x2513a, sampled 0
6eacbf0c2c:    	add	w22, w22, #0x1a0  // guest 0x2513a, sampled 0
6eacbf0c30:    	sxtw	x22, w22  // guest 0x2513a, sampled 0
6eacbf0c34:    	add	x22, x22, x19  // guest 0x2513a, sampled 0
6eacbf0c38:    	ldr	x23, [x22]  // guest 0x2513a, sampled 0
6eacbf0c3c:    	ldrh	w22, [x22, #0x8]  // guest 0x2513a, sampled 1
6eacbf0c40:    	str	x23, [x21]  // guest 0x2513a, sampled 0
6eacbf0c44:    	strh	w22, [x21, #0x8]  // guest 0x2513a, sampled 0
6eacbf0c48:    	ldr	w21, [x19, #0x54]  // guest 0x2513a, sampled 0
6eacbf0c4c:    	strh	w21, [x19, #0x222]  // guest 0x2513a, sampled 0
6eacbf0c50:    	mov	w21, #0x513a            // =20794  // guest 0x2513a, sampled 0
6eacbf0c54:    	movk	w21, #0x2, lsl #16  // guest 0x2513a, sampled 0
6eacbf0c58:    	str	w21, [x19, #0x228]  // guest 0x2513a, sampled 0
6eacbf0c5c:    	ldr	w21, [x19, #0x8]  // guest 0x2513c, sampled 0
6eacbf0c60:    	add	w22, w21, #0xc  // guest 0x2513c, sampled 0
6eacbf0c64:    	mov	w23, w22  // guest 0x2513c, sampled 0
6eacbf0c68:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2513c, sampled 0
6eacbf0c6c:    	and	x16, x16, x22, lsr #7  // guest 0x2513c, sampled 0
6eacbf0c70:    	add	x17, x17, x16  // guest 0x2513c, sampled 0
6eacbf0c74:    	ldp	x16, x17, [x17]  // guest 0x2513c, sampled 0
6eacbf0c78:    	and	w30, w22, #0xfffff003  // guest 0x2513c, sampled 0
6eacbf0c7c:    	cmp	w16, w30  // guest 0x2513c, sampled 0
6eacbf0c80:    	b.ne	0x6eacbf1a4c <trace+0x114c>  // guest 0x2513c, sampled 0
6eacbf0c84:    	add	x30, x17, w22, uxtw  // guest 0x2513c, sampled 0
6eacbf0c88:    	ldapr	w2, [x30]  // guest 0x2513c, sampled 0
6eacbf0c8c:    	add	x1, x19, #0x258  // guest 0x2513c, sampled 0
6eacbf0c90:    	mov	x0, x19  // guest 0x2513c, sampled 0
6eacbf0c94:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcba000>  // guest 0x2513c, sampled 0
6eacbf0c98:    	add	x16, x16, #0x484  // guest 0x2513c, sampled 0
6eacbf0c9c:    	blr	x16  // guest 0x2513c, sampled 0
6eacbf0ca0:    	lsl	w22, w20, #4  // guest 0x2513c, sampled 0
6eacbf0ca4:    	add	w22, w22, #0x1a0  // guest 0x2513c, sampled 0
6eacbf0ca8:    	sxtw	x22, w22  // guest 0x2513c, sampled 0
6eacbf0cac:    	add	x1, x22, x19  // guest 0x2513c, sampled 0
6eacbf0cb0:    	add	x2, x19, #0x258  // guest 0x2513c, sampled 0
6eacbf0cb4:    	mov	x0, x19  // guest 0x2513c, sampled 0
6eacbf0cb8:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbb000>  // guest 0x2513c, sampled 0
6eacbf0cbc:    	add	x16, x16, #0xb4c  // guest 0x2513c, sampled 0
6eacbf0cc0:    	blr	x16  // guest 0x2513c, sampled 0
6eacbf0cc4:    	ldr	w22, [x19, #0x74]  // guest 0x2513c, sampled 0
6eacbf0cc8:    	strh	w22, [x19, #0x224]  // guest 0x2513c, sampled 0
6eacbf0ccc:    	str	w23, [x19, #0x230]  // guest 0x2513c, sampled 0
6eacbf0cd0:    	ldr	w22, [x19, #0x54]  // guest 0x2513c, sampled 0
6eacbf0cd4:    	strh	w22, [x19, #0x222]  // guest 0x2513c, sampled 0
6eacbf0cd8:    	mov	w22, #0x513c            // =20796  // guest 0x2513c, sampled 0
6eacbf0cdc:    	movk	w22, #0x2, lsl #16  // guest 0x2513c, sampled 0
6eacbf0ce0:    	str	w22, [x19, #0x228]  // guest 0x2513c, sampled 0
6eacbf0ce4:    	sub	w20, w20, #0x1  // guest 0x2513f, sampled 0
6eacbf0ce8:    	and	w20, w20, #0x7  // guest 0x2513f, sampled 0
6eacbf0cec:    	str	w20, [x19, #0x188]  // guest 0x2513f, sampled 0
6eacbf0cf0:    	sxtw	x22, w20  // guest 0x2513f, sampled 0
6eacbf0cf4:    	add	x22, x22, x19  // guest 0x2513f, sampled 0
6eacbf0cf8:    	strb	wzr, [x22, #0x190]  // guest 0x2513f, sampled 0
6eacbf0cfc:    	lsl	w22, w20, #4  // guest 0x2513f, sampled 0
6eacbf0d00:    	add	w22, w22, #0x1a0  // guest 0x2513f, sampled 0
6eacbf0d04:    	sxtw	x22, w22  // guest 0x2513f, sampled 0
6eacbf0d08:    	add	x22, x22, x19  // guest 0x2513f, sampled 0
6eacbf0d0c:    	add	w23, w20, #0x2  // guest 0x2513f, sampled 0
6eacbf0d10:    	and	w23, w23, #0x7  // guest 0x2513f, sampled 0
6eacbf0d14:    	lsl	w23, w23, #4  // guest 0x2513f, sampled 0
6eacbf0d18:    	add	w23, w23, #0x1a0  // guest 0x2513f, sampled 0
6eacbf0d1c:    	sxtw	x23, w23  // guest 0x2513f, sampled 0
6eacbf0d20:    	add	x23, x23, x19  // guest 0x2513f, sampled 0
6eacbf0d24:    	ldr	x24, [x23]  // guest 0x2513f, sampled 0
6eacbf0d28:    	ldrh	w23, [x23, #0x8]  // guest 0x2513f, sampled 0
6eacbf0d2c:    	str	x24, [x22]  // guest 0x2513f, sampled 0
6eacbf0d30:    	strh	w23, [x22, #0x8]  // guest 0x2513f, sampled 0
6eacbf0d34:    	ldr	w22, [x19, #0x54]  // guest 0x2513f, sampled 0
6eacbf0d38:    	strh	w22, [x19, #0x222]  // guest 0x2513f, sampled 0
6eacbf0d3c:    	mov	w22, #0x513f            // =20799  // guest 0x2513f, sampled 0
6eacbf0d40:    	movk	w22, #0x2, lsl #16  // guest 0x2513f, sampled 0
6eacbf0d44:    	str	w22, [x19, #0x228]  // guest 0x2513f, sampled 0
6eacbf0d48:    	add	w21, w21, #0x18  // guest 0x25141, sampled 0
6eacbf0d4c:    	mov	w22, w21  // guest 0x25141, sampled 0
6eacbf0d50:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25141, sampled 0
6eacbf0d54:    	and	x16, x16, x21, lsr #7  // guest 0x25141, sampled 0
6eacbf0d58:    	add	x17, x17, x16  // guest 0x25141, sampled 0
6eacbf0d5c:    	ldp	x16, x17, [x17]  // guest 0x25141, sampled 0
6eacbf0d60:    	and	w30, w21, #0xfffff003  // guest 0x25141, sampled 0
6eacbf0d64:    	cmp	w16, w30  // guest 0x25141, sampled 0
6eacbf0d68:    	b.ne	0x6eacbf1a78 <trace+0x1178>  // guest 0x25141, sampled 0
6eacbf0d6c:    	add	x30, x17, w21, uxtw  // guest 0x25141, sampled 0
6eacbf0d70:    	ldapr	w2, [x30]  // guest 0x25141, sampled 0
6eacbf0d74:    	add	x1, x19, #0x258  // guest 0x25141, sampled 1
6eacbf0d78:    	mov	x0, x19  // guest 0x25141, sampled 0
6eacbf0d7c:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcba000>  // guest 0x25141, sampled 0
6eacbf0d80:    	add	x16, x16, #0x484  // guest 0x25141, sampled 0
6eacbf0d84:    	blr	x16  // guest 0x25141, sampled 0
6eacbf0d88:    	lsl	w20, w20, #4  // guest 0x25141, sampled 0
6eacbf0d8c:    	add	w20, w20, #0x1a0  // guest 0x25141, sampled 0
6eacbf0d90:    	sxtw	x20, w20  // guest 0x25141, sampled 0
6eacbf0d94:    	add	x1, x20, x19  // guest 0x25141, sampled 0
6eacbf0d98:    	add	x2, x19, #0x258  // guest 0x25141, sampled 0
6eacbf0d9c:    	mov	x0, x19  // guest 0x25141, sampled 0
6eacbf0da0:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbb000>  // guest 0x25141, sampled 0
6eacbf0da4:    	add	x16, x16, #0xb4c  // guest 0x25141, sampled 0
6eacbf0da8:    	blr	x16  // guest 0x25141, sampled 0
6eacbf0dac:    	ldr	w20, [x19, #0x74]  // guest 0x25141, sampled 0
6eacbf0db0:    	strh	w20, [x19, #0x224]  // guest 0x25141, sampled 1
6eacbf0db4:    	str	w22, [x19, #0x230]  // guest 0x25141, sampled 0
6eacbf0db8:    	ldr	w20, [x19, #0x54]  // guest 0x25141, sampled 0
6eacbf0dbc:    	strh	w20, [x19, #0x222]  // guest 0x25141, sampled 0
6eacbf0dc0:    	mov	w20, #0x5141            // =20801  // guest 0x25141, sampled 0
6eacbf0dc4:    	movk	w20, #0x2, lsl #16  // guest 0x25141, sampled 0
6eacbf0dc8:    	str	w20, [x19, #0x228]  // guest 0x25141, sampled 0
6eacbf0dcc:    	mov	w1, #0x2                // =2  // guest 0x25144, sampled 0
6eacbf0dd0:    	mov	x0, x19  // guest 0x25144, sampled 0
6eacbf0dd4:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbb000>  // guest 0x25144, sampled 0
6eacbf0dd8:    	add	x16, x16, #0x5a0  // guest 0x25144, sampled 0
6eacbf0ddc:    	blr	x16  // guest 0x25144, sampled 0
6eacbf0de0:    	ldr	w20, [x19, #0x54]  // guest 0x25144, sampled 0
6eacbf0de4:    	strh	w20, [x19, #0x222]  // guest 0x25144, sampled 0
6eacbf0de8:    	mov	w20, #0x5144            // =20804  // guest 0x25144, sampled 0
6eacbf0dec:    	movk	w20, #0x2, lsl #16  // guest 0x25144, sampled 0
6eacbf0df0:    	str	w20, [x19, #0x228]  // guest 0x25144, sampled 0
6eacbf0df4:    	ldr	w20, [x19, #0x8]  // guest 0x25146, sampled 0
6eacbf0df8:    	add	w20, w20, #0x24  // guest 0x25146, sampled 0
6eacbf0dfc:    	mov	w21, w20  // guest 0x25146, sampled 0
6eacbf0e00:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25146, sampled 0
6eacbf0e04:    	and	x16, x16, x20, lsr #7  // guest 0x25146, sampled 0
6eacbf0e08:    	add	x17, x17, x16  // guest 0x25146, sampled 0
6eacbf0e0c:    	ldp	x16, x17, [x17]  // guest 0x25146, sampled 0
6eacbf0e10:    	and	w30, w20, #0xfffff003  // guest 0x25146, sampled 0
6eacbf0e14:    	cmp	w16, w30  // guest 0x25146, sampled 0
6eacbf0e18:    	b.ne	0x6eacbf1aa4 <trace+0x11a4>  // guest 0x25146, sampled 0
6eacbf0e1c:    	add	x30, x17, w20, uxtw  // guest 0x25146, sampled 0
6eacbf0e20:    	ldapr	w2, [x30]  // guest 0x25146, sampled 0
6eacbf0e24:    	add	x1, x19, #0x258  // guest 0x25146, sampled 1
6eacbf0e28:    	mov	x0, x19  // guest 0x25146, sampled 0
6eacbf0e2c:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcba000>  // guest 0x25146, sampled 0
6eacbf0e30:    	add	x16, x16, #0x484  // guest 0x25146, sampled 0
6eacbf0e34:    	blr	x16  // guest 0x25146, sampled 0
6eacbf0e38:    	ldr	w20, [x19, #0x188]  // guest 0x25146, sampled 0
6eacbf0e3c:    	lsl	w20, w20, #4  // guest 0x25146, sampled 0
6eacbf0e40:    	add	w20, w20, #0x1a0  // guest 0x25146, sampled 0
6eacbf0e44:    	sxtw	x20, w20  // guest 0x25146, sampled 0
6eacbf0e48:    	add	x1, x20, x19  // guest 0x25146, sampled 0
6eacbf0e4c:    	add	x2, x19, #0x258  // guest 0x25146, sampled 0
6eacbf0e50:    	mov	x0, x19  // guest 0x25146, sampled 0
6eacbf0e54:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbb000>  // guest 0x25146, sampled 0
6eacbf0e58:    	add	x16, x16, #0xb4c  // guest 0x25146, sampled 0
6eacbf0e5c:    	blr	x16  // guest 0x25146, sampled 0
6eacbf0e60:    	ldr	w20, [x19, #0x74]  // guest 0x25146, sampled 0
6eacbf0e64:    	strh	w20, [x19, #0x224]  // guest 0x25146, sampled 0
6eacbf0e68:    	str	w21, [x19, #0x230]  // guest 0x25146, sampled 0
6eacbf0e6c:    	ldr	w20, [x19, #0x54]  // guest 0x25146, sampled 0
6eacbf0e70:    	strh	w20, [x19, #0x222]  // guest 0x25146, sampled 0
6eacbf0e74:    	mov	w20, #0x5146            // =20806  // guest 0x25146, sampled 0
6eacbf0e78:    	movk	w20, #0x2, lsl #16  // guest 0x25146, sampled 0
6eacbf0e7c:    	str	w20, [x19, #0x228]  // guest 0x25146, sampled 0
6eacbf0e80:    	mov	w1, #0x4                // =4  // guest 0x25149, sampled 0
6eacbf0e84:    	mov	x0, x19  // guest 0x25149, sampled 0
6eacbf0e88:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbb000>  // guest 0x25149, sampled 0
6eacbf0e8c:    	add	x16, x16, #0x5a0  // guest 0x25149, sampled 0
6eacbf0e90:    	blr	x16  // guest 0x25149, sampled 0
6eacbf0e94:    	ldr	w20, [x19, #0x54]  // guest 0x25149, sampled 0
6eacbf0e98:    	strh	w20, [x19, #0x222]  // guest 0x25149, sampled 0
6eacbf0e9c:    	mov	w20, #0x5149            // =20809  // guest 0x25149, sampled 0
6eacbf0ea0:    	movk	w20, #0x2, lsl #16  // guest 0x25149, sampled 0
6eacbf0ea4:    	str	w20, [x19, #0x228]  // guest 0x25149, sampled 0
6eacbf0ea8:    	ldr	w20, [x19, #0x188]  // guest 0x2514b, sampled 0
6eacbf0eac:    	sub	w20, w20, #0x1  // guest 0x2514b, sampled 0
6eacbf0eb0:    	and	w20, w20, #0x7  // guest 0x2514b, sampled 1
6eacbf0eb4:    	str	w20, [x19, #0x188]  // guest 0x2514b, sampled 0
6eacbf0eb8:    	sxtw	x21, w20  // guest 0x2514b, sampled 0
6eacbf0ebc:    	add	x21, x21, x19  // guest 0x2514b, sampled 0
6eacbf0ec0:    	strb	wzr, [x21, #0x190]  // guest 0x2514b, sampled 0
6eacbf0ec4:    	lsl	w21, w20, #4  // guest 0x2514b, sampled 0
6eacbf0ec8:    	add	w21, w21, #0x1a0  // guest 0x2514b, sampled 0
6eacbf0ecc:    	sxtw	x21, w21  // guest 0x2514b, sampled 0
6eacbf0ed0:    	add	x21, x21, x19  // guest 0x2514b, sampled 0
6eacbf0ed4:    	add	w22, w20, #0x1  // guest 0x2514b, sampled 0
6eacbf0ed8:    	and	w22, w22, #0x7  // guest 0x2514b, sampled 0
6eacbf0edc:    	lsl	w22, w22, #4  // guest 0x2514b, sampled 0
6eacbf0ee0:    	add	w22, w22, #0x1a0  // guest 0x2514b, sampled 0
6eacbf0ee4:    	sxtw	x22, w22  // guest 0x2514b, sampled 0
6eacbf0ee8:    	add	x22, x22, x19  // guest 0x2514b, sampled 0
6eacbf0eec:    	ldr	x23, [x22]  // guest 0x2514b, sampled 0
6eacbf0ef0:    	ldrh	w22, [x22, #0x8]  // guest 0x2514b, sampled 0
6eacbf0ef4:    	str	x23, [x21]  // guest 0x2514b, sampled 0
6eacbf0ef8:    	strh	w22, [x21, #0x8]  // guest 0x2514b, sampled 0
6eacbf0efc:    	ldr	w21, [x19, #0x54]  // guest 0x2514b, sampled 0
6eacbf0f00:    	strh	w21, [x19, #0x222]  // guest 0x2514b, sampled 0
6eacbf0f04:    	mov	w21, #0x514b            // =20811  // guest 0x2514b, sampled 0
6eacbf0f08:    	movk	w21, #0x2, lsl #16  // guest 0x2514b, sampled 0
6eacbf0f0c:    	str	w21, [x19, #0x228]  // guest 0x2514b, sampled 0
6eacbf0f10:    	ldr	w21, [x19, #0x8]  // guest 0x2514d, sampled 0
6eacbf0f14:    	add	w22, w21, #0x10  // guest 0x2514d, sampled 0
6eacbf0f18:    	mov	w23, w22  // guest 0x2514d, sampled 0
6eacbf0f1c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2514d, sampled 0
6eacbf0f20:    	and	x16, x16, x22, lsr #7  // guest 0x2514d, sampled 0
6eacbf0f24:    	add	x17, x17, x16  // guest 0x2514d, sampled 0
6eacbf0f28:    	ldp	x16, x17, [x17]  // guest 0x2514d, sampled 0
6eacbf0f2c:    	and	w30, w22, #0xfffff003  // guest 0x2514d, sampled 1
6eacbf0f30:    	cmp	w16, w30  // guest 0x2514d, sampled 1
6eacbf0f34:    	b.ne	0x6eacbf1ad0 <trace+0x11d0>  // guest 0x2514d, sampled 2
6eacbf0f38:    	add	x30, x17, w22, uxtw  // guest 0x2514d, sampled 1
6eacbf0f3c:    	ldapr	w2, [x30]  // guest 0x2514d, sampled 0
6eacbf0f40:    	add	x1, x19, #0x258  // guest 0x2514d, sampled 0
6eacbf0f44:    	mov	x0, x19  // guest 0x2514d, sampled 0
6eacbf0f48:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcba000>  // guest 0x2514d, sampled 0
6eacbf0f4c:    	add	x16, x16, #0x484  // guest 0x2514d, sampled 0
6eacbf0f50:    	blr	x16  // guest 0x2514d, sampled 0
6eacbf0f54:    	lsl	w22, w20, #4  // guest 0x2514d, sampled 0
6eacbf0f58:    	add	w22, w22, #0x1a0  // guest 0x2514d, sampled 0
6eacbf0f5c:    	sxtw	x22, w22  // guest 0x2514d, sampled 0
6eacbf0f60:    	add	x1, x22, x19  // guest 0x2514d, sampled 0
6eacbf0f64:    	add	x2, x19, #0x258  // guest 0x2514d, sampled 0
6eacbf0f68:    	mov	x0, x19  // guest 0x2514d, sampled 0
6eacbf0f6c:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcbb000>  // guest 0x2514d, sampled 0
6eacbf0f70:    	add	x16, x16, #0xb4c  // guest 0x2514d, sampled 0
6eacbf0f74:    	blr	x16  // guest 0x2514d, sampled 0
6eacbf0f78:    	ldr	w22, [x19, #0x74]  // guest 0x2514d, sampled 0
6eacbf0f7c:    	strh	w22, [x19, #0x224]  // guest 0x2514d, sampled 0
6eacbf0f80:    	str	w23, [x19, #0x230]  // guest 0x2514d, sampled 0
6eacbf0f84:    	ldr	w22, [x19, #0x54]  // guest 0x2514d, sampled 0
6eacbf0f88:    	strh	w22, [x19, #0x222]  // guest 0x2514d, sampled 0
6eacbf0f8c:    	mov	w22, #0x514d            // =20813  // guest 0x2514d, sampled 0
6eacbf0f90:    	movk	w22, #0x2, lsl #16  // guest 0x2514d, sampled 0
6eacbf0f94:    	str	w22, [x19, #0x228]  // guest 0x2514d, sampled 0
6eacbf0f98:    	sub	w20, w20, #0x1  // guest 0x25150, sampled 0
6eacbf0f9c:    	and	w20, w20, #0x7  // guest 0x25150, sampled 0
6eacbf0fa0:    	str	w20, [x19, #0x188]  // guest 0x25150, sampled 0
6eacbf0fa4:    	sxtw	x22, w20  // guest 0x25150, sampled 0
6eacbf0fa8:    	add	x22, x22, x19  // guest 0x25150, sampled 0
6eacbf0fac:    	strb	wzr, [x22, #0x190]  // guest 0x25150, sampled 0
6eacbf0fb0:    	lsl	w22, w20, #4  // guest 0x25150, sampled 0
6eacbf0fb4:    	add	w22, w22, #0x1a0  // guest 0x25150, sampled 0
6eacbf0fb8:    	sxtw	x22, w22  // guest 0x25150, sampled 0
6eacbf0fbc:    	add	x22, x22, x19  // guest 0x25150, sampled 0
6eacbf0fc0:    	add	w23, w20, #0x2  // guest 0x25150, sampled 0
6eacbf0fc4:    	and	w23, w23, #0x7  // guest 0x25150, sampled 0
6eacbf0fc8:    	lsl	w23, w23, #4  // guest 0x25150, sampled 0
6eacbf0fcc:    	add	w23, w23, #0x1a0  // guest 0x25150, sampled 0
6eacbf0fd0:    	sxtw	x23, w23  // guest 0x25150, sampled 0
6eacbf0fd4:    	add	x23, x23, x19  // guest 0x25150, sampled 0
6eacbf0fd8:    	ldr	x24, [x23]  // guest 0x25150, sampled 0
6eacbf0fdc:    	ldrh	w23, [x23, #0x8]  // guest 0x25150, sampled 1
6eacbf0fe0:    	str	x24, [x22]  // guest 0x25150, sampled 0
6eacbf0fe4:    	strh	w23, [x22, #0x8]  // guest 0x25150, sampled 0
6eacbf0fe8:    	ldr	w22, [x19, #0x54]  // guest 0x25150, sampled 0
6eacbf0fec:    	strh	w22, [x19, #0x222]  // guest 0x25150, sampled 0
6eacbf0ff0:    	mov	w22, #0x5150            // =20816  // guest 0x25150, sampled 0
6eacbf0ff4:    	movk	w22, #0x2, lsl #16  // guest 0x25150, sampled 0
6eacbf0ff8:    	str	w22, [x19, #0x228]  // guest 0x25150, sampled 0
6eacbf0ffc:    	add	w21, w21, #0x1c  // guest 0x25152, sampled 0
6eacbf1000:    	mov	w22, w21  // guest 0x25152, sampled 0
6eacbf1004:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25152, sampled 0
6eacbf1008:    	and	x16, x16, x21, lsr #7  // guest 0x25152, sampled 0
6eacbf100c:    	add	x17, x17, x16  // guest 0x25152, sampled 0
6eacbf1010:    	ldp	x16, x17, [x17]  // guest 0x25152, sampled 0
6eacbf1014:    	and	w30, w21, #0xfffff003  // guest 0x25152, sampled 0
6eacbf1018:    	cmp	w16, w30  // guest 0x25152, sampled 0
6eacbf101c:    	b.ne	0x6eacbf1afc <trace+0x11fc>  // guest 0x25152, sampled 0
6eacbf1020:    	add	x30, x17, w21, uxtw  // guest 0x25152, sampled 0
6eacbf1024:    	ldapr	w2, [x30]  // guest 0x25152, sampled 0
6eacbf1028:    	add	x1, x19, #0x258  // guest 0x25152, sampled 1
6eacbf102c:    	mov	x0, x19  // guest 0x25152, sampled 0
6eacbf1030:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcb9000>  // guest 0x25152, sampled 0
6eacbf1034:    	add	x16, x16, #0x484  // guest 0x25152, sampled 0
6eacbf1038:    	blr	x16  // guest 0x25152, sampled 0
6eacbf103c:    	lsl	w20, w20, #4  // guest 0x25152, sampled 0
6eacbf1040:    	add	w20, w20, #0x1a0  // guest 0x25152, sampled 0
6eacbf1044:    	sxtw	x20, w20  // guest 0x25152, sampled 0
6eacbf1048:    	add	x1, x20, x19  // guest 0x25152, sampled 0
6eacbf104c:    	add	x2, x19, #0x258  // guest 0x25152, sampled 0
6eacbf1050:    	mov	x0, x19  // guest 0x25152, sampled 0
6eacbf1054:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcba000>  // guest 0x25152, sampled 0
6eacbf1058:    	add	x16, x16, #0xb4c  // guest 0x25152, sampled 0
6eacbf105c:    	blr	x16  // guest 0x25152, sampled 0
6eacbf1060:    	ldr	w20, [x19, #0x74]  // guest 0x25152, sampled 0
6eacbf1064:    	strh	w20, [x19, #0x224]  // guest 0x25152, sampled 0
6eacbf1068:    	str	w22, [x19, #0x230]  // guest 0x25152, sampled 0
6eacbf106c:    	ldr	w20, [x19, #0x54]  // guest 0x25152, sampled 0
6eacbf1070:    	strh	w20, [x19, #0x222]  // guest 0x25152, sampled 0
6eacbf1074:    	mov	w20, #0x5152            // =20818  // guest 0x25152, sampled 0
6eacbf1078:    	movk	w20, #0x2, lsl #16  // guest 0x25152, sampled 0
6eacbf107c:    	str	w20, [x19, #0x228]  // guest 0x25152, sampled 0
6eacbf1080:    	mov	w1, #0x2                // =2  // guest 0x25155, sampled 0
6eacbf1084:    	mov	x0, x19  // guest 0x25155, sampled 0
6eacbf1088:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcba000>  // guest 0x25155, sampled 0
6eacbf108c:    	add	x16, x16, #0x5a0  // guest 0x25155, sampled 0
6eacbf1090:    	blr	x16  // guest 0x25155, sampled 0
6eacbf1094:    	ldr	w20, [x19, #0x54]  // guest 0x25155, sampled 0
6eacbf1098:    	strh	w20, [x19, #0x222]  // guest 0x25155, sampled 0
6eacbf109c:    	mov	w20, #0x5155            // =20821  // guest 0x25155, sampled 0
6eacbf10a0:    	movk	w20, #0x2, lsl #16  // guest 0x25155, sampled 0
6eacbf10a4:    	str	w20, [x19, #0x228]  // guest 0x25155, sampled 0
6eacbf10a8:    	ldr	w20, [x19, #0x8]  // guest 0x25157, sampled 0
6eacbf10ac:    	add	w20, w20, #0x28  // guest 0x25157, sampled 0
6eacbf10b0:    	mov	w21, w20  // guest 0x25157, sampled 0
6eacbf10b4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25157, sampled 0
6eacbf10b8:    	and	x16, x16, x20, lsr #7  // guest 0x25157, sampled 0
6eacbf10bc:    	add	x17, x17, x16  // guest 0x25157, sampled 0
6eacbf10c0:    	ldp	x16, x17, [x17]  // guest 0x25157, sampled 0
6eacbf10c4:    	and	w30, w20, #0xfffff003  // guest 0x25157, sampled 0
6eacbf10c8:    	cmp	w16, w30  // guest 0x25157, sampled 0
6eacbf10cc:    	b.ne	0x6eacbf1b28 <trace+0x1228>  // guest 0x25157, sampled 0
6eacbf10d0:    	add	x30, x17, w20, uxtw  // guest 0x25157, sampled 0
6eacbf10d4:    	ldapr	w2, [x30]  // guest 0x25157, sampled 0
6eacbf10d8:    	add	x1, x19, #0x258  // guest 0x25157, sampled 0
6eacbf10dc:    	mov	x0, x19  // guest 0x25157, sampled 0
6eacbf10e0:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcb9000>  // guest 0x25157, sampled 0
6eacbf10e4:    	add	x16, x16, #0x484  // guest 0x25157, sampled 0
6eacbf10e8:    	blr	x16  // guest 0x25157, sampled 0
6eacbf10ec:    	ldr	w20, [x19, #0x188]  // guest 0x25157, sampled 0
6eacbf10f0:    	lsl	w20, w20, #4  // guest 0x25157, sampled 0
6eacbf10f4:    	add	w20, w20, #0x1a0  // guest 0x25157, sampled 0
6eacbf10f8:    	sxtw	x20, w20  // guest 0x25157, sampled 0
6eacbf10fc:    	add	x1, x20, x19  // guest 0x25157, sampled 0
6eacbf1100:    	add	x2, x19, #0x258  // guest 0x25157, sampled 0
6eacbf1104:    	mov	x0, x19  // guest 0x25157, sampled 0
6eacbf1108:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcba000>  // guest 0x25157, sampled 0
6eacbf110c:    	add	x16, x16, #0xb4c  // guest 0x25157, sampled 0
6eacbf1110:    	blr	x16  // guest 0x25157, sampled 0
6eacbf1114:    	ldr	w20, [x19, #0x74]  // guest 0x25157, sampled 0
6eacbf1118:    	strh	w20, [x19, #0x224]  // guest 0x25157, sampled 0
6eacbf111c:    	str	w21, [x19, #0x230]  // guest 0x25157, sampled 0
6eacbf1120:    	ldr	w20, [x19, #0x54]  // guest 0x25157, sampled 0
6eacbf1124:    	strh	w20, [x19, #0x222]  // guest 0x25157, sampled 0
6eacbf1128:    	mov	w20, #0x5157            // =20823  // guest 0x25157, sampled 0
6eacbf112c:    	movk	w20, #0x2, lsl #16  // guest 0x25157, sampled 0
6eacbf1130:    	str	w20, [x19, #0x228]  // guest 0x25157, sampled 0
6eacbf1134:    	mov	w1, #0x1                // =1  // guest 0x2515a, sampled 0
6eacbf1138:    	mov	x0, x19  // guest 0x2515a, sampled 0
6eacbf113c:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcba000>  // guest 0x2515a, sampled 0
6eacbf1140:    	add	x16, x16, #0x5a0  // guest 0x2515a, sampled 0
6eacbf1144:    	blr	x16  // guest 0x2515a, sampled 0
6eacbf1148:    	ldr	w20, [x19, #0x54]  // guest 0x2515a, sampled 0
6eacbf114c:    	strh	w20, [x19, #0x222]  // guest 0x2515a, sampled 0
6eacbf1150:    	mov	w20, #0x515a            // =20826  // guest 0x2515a, sampled 0
6eacbf1154:    	movk	w20, #0x2, lsl #16  // guest 0x2515a, sampled 0
6eacbf1158:    	str	w20, [x19, #0x228]  // guest 0x2515a, sampled 0
6eacbf115c:    	ldr	w20, [x19, #0x188]  // guest 0x2515c, sampled 0
6eacbf1160:    	add	w21, w20, #0x3  // guest 0x2515c, sampled 0
6eacbf1164:    	and	w21, w21, #0x7  // guest 0x2515c, sampled 0
6eacbf1168:    	lsl	w21, w21, #4  // guest 0x2515c, sampled 0
6eacbf116c:    	add	w21, w21, #0x1a0  // guest 0x2515c, sampled 0
6eacbf1170:    	sxtw	x21, w21  // guest 0x2515c, sampled 0
6eacbf1174:    	add	x1, x21, x19  // guest 0x2515c, sampled 0
6eacbf1178:    	lsl	w21, w20, #4  // guest 0x2515c, sampled 0
6eacbf117c:    	add	w21, w21, #0x1a0  // guest 0x2515c, sampled 0
6eacbf1180:    	sxtw	x21, w21  // guest 0x2515c, sampled 0
6eacbf1184:    	add	x2, x21, x19  // guest 0x2515c, sampled 0
6eacbf1188:    	mov	x0, x19  // guest 0x2515c, sampled 0
6eacbf118c:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcba000>  // guest 0x2515c, sampled 0
6eacbf1190:    	add	x16, x16, #0xa78  // guest 0x2515c, sampled 0
6eacbf1194:    	blr	x16  // guest 0x2515c, sampled 0
6eacbf1198:    	sxtw	x21, w20  // guest 0x2515c, sampled 0
6eacbf119c:    	add	x21, x21, x19  // guest 0x2515c, sampled 1
6eacbf11a0:    	mov	w22, #0x1               // =1  // guest 0x2515c, sampled 0
6eacbf11a4:    	strb	w22, [x21, #0x190]  // guest 0x2515c, sampled 0
6eacbf11a8:    	add	w20, w20, w22  // guest 0x2515c, sampled 0
6eacbf11ac:    	and	w20, w20, #0x7  // guest 0x2515c, sampled 0
6eacbf11b0:    	ldr	w21, [x19, #0x54]  // guest 0x2515c, sampled 0
6eacbf11b4:    	strh	w21, [x19, #0x222]  // guest 0x2515c, sampled 0
6eacbf11b8:    	mov	w21, #0x515c            // =20828  // guest 0x2515c, sampled 0
6eacbf11bc:    	movk	w21, #0x2, lsl #16  // guest 0x2515c, sampled 0
6eacbf11c0:    	str	w21, [x19, #0x228]  // guest 0x2515c, sampled 0
6eacbf11c4:    	add	w21, w20, #0x5  // guest 0x2515e, sampled 0
6eacbf11c8:    	and	w21, w21, #0x7  // guest 0x2515e, sampled 0
6eacbf11cc:    	lsl	w21, w21, #4  // guest 0x2515e, sampled 0
6eacbf11d0:    	add	w21, w21, #0x1a0  // guest 0x2515e, sampled 0
6eacbf11d4:    	sxtw	x21, w21  // guest 0x2515e, sampled 0
6eacbf11d8:    	add	x1, x21, x19  // guest 0x2515e, sampled 0
6eacbf11dc:    	lsl	w21, w20, #4  // guest 0x2515e, sampled 0
6eacbf11e0:    	add	w21, w21, #0x1a0  // guest 0x2515e, sampled 0
6eacbf11e4:    	sxtw	x21, w21  // guest 0x2515e, sampled 0
6eacbf11e8:    	add	x2, x21, x19  // guest 0x2515e, sampled 0
6eacbf11ec:    	mov	x0, x19  // guest 0x2515e, sampled 0
6eacbf11f0:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcba000>  // guest 0x2515e, sampled 0
6eacbf11f4:    	add	x16, x16, #0xa78  // guest 0x2515e, sampled 0
6eacbf11f8:    	blr	x16  // guest 0x2515e, sampled 0
6eacbf11fc:    	sxtw	x21, w20  // guest 0x2515e, sampled 0
6eacbf1200:    	add	x21, x21, x19  // guest 0x2515e, sampled 0
6eacbf1204:    	strb	w22, [x21, #0x190]  // guest 0x2515e, sampled 0
6eacbf1208:    	add	w20, w20, w22  // guest 0x2515e, sampled 0
6eacbf120c:    	and	w20, w20, #0x7  // guest 0x2515e, sampled 0
6eacbf1210:    	ldr	w21, [x19, #0x54]  // guest 0x2515e, sampled 0
6eacbf1214:    	strh	w21, [x19, #0x222]  // guest 0x2515e, sampled 0
6eacbf1218:    	mov	w21, #0x515e            // =20830  // guest 0x2515e, sampled 0
6eacbf121c:    	movk	w21, #0x2, lsl #16  // guest 0x2515e, sampled 0
6eacbf1220:    	str	w21, [x19, #0x228]  // guest 0x2515e, sampled 0
6eacbf1224:    	add	w21, w20, #0x2  // guest 0x25160, sampled 0
6eacbf1228:    	and	w21, w21, #0x7  // guest 0x25160, sampled 0
6eacbf122c:    	lsl	w21, w21, #4  // guest 0x25160, sampled 0
6eacbf1230:    	add	w21, w21, #0x1a0  // guest 0x25160, sampled 0
6eacbf1234:    	sxtw	x21, w21  // guest 0x25160, sampled 0
6eacbf1238:    	add	x1, x21, x19  // guest 0x25160, sampled 0
6eacbf123c:    	lsl	w21, w20, #4  // guest 0x25160, sampled 0
6eacbf1240:    	add	w21, w21, #0x1a0  // guest 0x25160, sampled 0
6eacbf1244:    	sxtw	x21, w21  // guest 0x25160, sampled 0
6eacbf1248:    	add	x2, x21, x19  // guest 0x25160, sampled 0
6eacbf124c:    	mov	x0, x19  // guest 0x25160, sampled 0
6eacbf1250:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcba000>  // guest 0x25160, sampled 0
6eacbf1254:    	add	x16, x16, #0xa78  // guest 0x25160, sampled 0
6eacbf1258:    	blr	x16  // guest 0x25160, sampled 0
6eacbf125c:    	sxtw	x21, w20  // guest 0x25160, sampled 0
6eacbf1260:    	add	x21, x21, x19  // guest 0x25160, sampled 1
6eacbf1264:    	strb	w22, [x21, #0x190]  // guest 0x25160, sampled 0
6eacbf1268:    	add	w20, w20, w22  // guest 0x25160, sampled 0
6eacbf126c:    	and	w20, w20, #0x7  // guest 0x25160, sampled 0
6eacbf1270:    	str	w20, [x19, #0x188]  // guest 0x25160, sampled 0
6eacbf1274:    	ldr	w20, [x19, #0x54]  // guest 0x25160, sampled 0
6eacbf1278:    	strh	w20, [x19, #0x222]  // guest 0x25160, sampled 0
6eacbf127c:    	mov	w20, #0x5160            // =20832  // guest 0x25160, sampled 0
6eacbf1280:    	movk	w20, #0x2, lsl #16  // guest 0x25160, sampled 0
6eacbf1284:    	str	w20, [x19, #0x228]  // guest 0x25160, sampled 0
6eacbf1288:    	mov	w1, #0x2                // =2  // guest 0x25162, sampled 0
6eacbf128c:    	mov	x0, x19  // guest 0x25162, sampled 0
6eacbf1290:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcba000>  // guest 0x25162, sampled 0
6eacbf1294:    	add	x16, x16, #0x5a0  // guest 0x25162, sampled 0
6eacbf1298:    	blr	x16  // guest 0x25162, sampled 0
6eacbf129c:    	ldr	w20, [x19, #0x54]  // guest 0x25162, sampled 0
6eacbf12a0:    	strh	w20, [x19, #0x222]  // guest 0x25162, sampled 0
6eacbf12a4:    	mov	w20, #0x5162            // =20834  // guest 0x25162, sampled 0
6eacbf12a8:    	movk	w20, #0x2, lsl #16  // guest 0x25162, sampled 0
6eacbf12ac:    	str	w20, [x19, #0x228]  // guest 0x25162, sampled 0
6eacbf12b0:    	ldr	w20, [x19, #0x188]  // guest 0x25164, sampled 0
6eacbf12b4:    	sub	w20, w20, #0x1  // guest 0x25164, sampled 0
6eacbf12b8:    	and	w20, w20, #0x7  // guest 0x25164, sampled 0
6eacbf12bc:    	str	w20, [x19, #0x188]  // guest 0x25164, sampled 0
6eacbf12c0:    	sxtw	x21, w20  // guest 0x25164, sampled 0
6eacbf12c4:    	add	x21, x21, x19  // guest 0x25164, sampled 0
6eacbf12c8:    	strb	wzr, [x21, #0x190]  // guest 0x25164, sampled 0
6eacbf12cc:    	lsl	w21, w20, #4  // guest 0x25164, sampled 0
6eacbf12d0:    	add	w21, w21, #0x1a0  // guest 0x25164, sampled 0
6eacbf12d4:    	sxtw	x21, w21  // guest 0x25164, sampled 0
6eacbf12d8:    	add	x21, x21, x19  // guest 0x25164, sampled 0
6eacbf12dc:    	add	w23, w20, w22  // guest 0x25164, sampled 0
6eacbf12e0:    	and	w23, w23, #0x7  // guest 0x25164, sampled 0
6eacbf12e4:    	lsl	w23, w23, #4  // guest 0x25164, sampled 0
6eacbf12e8:    	add	w23, w23, #0x1a0  // guest 0x25164, sampled 0
6eacbf12ec:    	sxtw	x23, w23  // guest 0x25164, sampled 0
6eacbf12f0:    	add	x23, x23, x19  // guest 0x25164, sampled 0
6eacbf12f4:    	ldr	x24, [x23]  // guest 0x25164, sampled 0
6eacbf12f8:    	ldrh	w23, [x23, #0x8]  // guest 0x25164, sampled 2
6eacbf12fc:    	str	x24, [x21]  // guest 0x25164, sampled 0
6eacbf1300:    	strh	w23, [x21, #0x8]  // guest 0x25164, sampled 0
6eacbf1304:    	ldr	w21, [x19, #0x54]  // guest 0x25164, sampled 0
6eacbf1308:    	strh	w21, [x19, #0x222]  // guest 0x25164, sampled 0
6eacbf130c:    	mov	w21, #0x5164            // =20836  // guest 0x25164, sampled 0
6eacbf1310:    	movk	w21, #0x2, lsl #16  // guest 0x25164, sampled 0
6eacbf1314:    	str	w21, [x19, #0x228]  // guest 0x25164, sampled 0
6eacbf1318:    	ldr	w21, [x19, #0x8]  // guest 0x25166, sampled 1
6eacbf131c:    	add	w23, w21, #0x14  // guest 0x25166, sampled 0
6eacbf1320:    	mov	w24, w23  // guest 0x25166, sampled 0
6eacbf1324:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25166, sampled 0
6eacbf1328:    	and	x16, x16, x23, lsr #7  // guest 0x25166, sampled 0
6eacbf132c:    	add	x17, x17, x16  // guest 0x25166, sampled 0
6eacbf1330:    	ldp	x16, x17, [x17]  // guest 0x25166, sampled 0
6eacbf1334:    	and	w30, w23, #0xfffff003  // guest 0x25166, sampled 0
6eacbf1338:    	cmp	w16, w30  // guest 0x25166, sampled 0
6eacbf133c:    	b.ne	0x6eacbf1b54 <trace+0x1254>  // guest 0x25166, sampled 0
6eacbf1340:    	add	x30, x17, w23, uxtw  // guest 0x25166, sampled 1
6eacbf1344:    	ldapr	w2, [x30]  // guest 0x25166, sampled 0
6eacbf1348:    	add	x1, x19, #0x258  // guest 0x25166, sampled 0
6eacbf134c:    	mov	x0, x19  // guest 0x25166, sampled 0
6eacbf1350:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcb9000>  // guest 0x25166, sampled 0
6eacbf1354:    	add	x16, x16, #0x484  // guest 0x25166, sampled 0
6eacbf1358:    	blr	x16  // guest 0x25166, sampled 0
6eacbf135c:    	lsl	w23, w20, #4  // guest 0x25166, sampled 0
6eacbf1360:    	add	w23, w23, #0x1a0  // guest 0x25166, sampled 0
6eacbf1364:    	sxtw	x23, w23  // guest 0x25166, sampled 0
6eacbf1368:    	add	x1, x23, x19  // guest 0x25166, sampled 0
6eacbf136c:    	add	x2, x19, #0x258  // guest 0x25166, sampled 0
6eacbf1370:    	mov	x0, x19  // guest 0x25166, sampled 0
6eacbf1374:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcba000>  // guest 0x25166, sampled 0
6eacbf1378:    	add	x16, x16, #0xb4c  // guest 0x25166, sampled 0
6eacbf137c:    	blr	x16  // guest 0x25166, sampled 0
6eacbf1380:    	ldr	w23, [x19, #0x74]  // guest 0x25166, sampled 0
6eacbf1384:    	strh	w23, [x19, #0x224]  // guest 0x25166, sampled 0
6eacbf1388:    	str	w24, [x19, #0x230]  // guest 0x25166, sampled 0
6eacbf138c:    	ldr	w23, [x19, #0x54]  // guest 0x25166, sampled 0
6eacbf1390:    	strh	w23, [x19, #0x222]  // guest 0x25166, sampled 0
6eacbf1394:    	mov	w23, #0x5166            // =20838  // guest 0x25166, sampled 0
6eacbf1398:    	movk	w23, #0x2, lsl #16  // guest 0x25166, sampled 0
6eacbf139c:    	str	w23, [x19, #0x228]  // guest 0x25166, sampled 0
6eacbf13a0:    	sub	w20, w20, #0x1  // guest 0x25169, sampled 0
6eacbf13a4:    	and	w20, w20, #0x7  // guest 0x25169, sampled 0
6eacbf13a8:    	str	w20, [x19, #0x188]  // guest 0x25169, sampled 0
6eacbf13ac:    	sxtw	x23, w20  // guest 0x25169, sampled 0
6eacbf13b0:    	add	x23, x23, x19  // guest 0x25169, sampled 0
6eacbf13b4:    	strb	wzr, [x23, #0x190]  // guest 0x25169, sampled 0
6eacbf13b8:    	lsl	w23, w20, #4  // guest 0x25169, sampled 0
6eacbf13bc:    	add	w23, w23, #0x1a0  // guest 0x25169, sampled 0
6eacbf13c0:    	sxtw	x23, w23  // guest 0x25169, sampled 0
6eacbf13c4:    	add	x23, x23, x19  // guest 0x25169, sampled 1
6eacbf13c8:    	add	w24, w20, #0x2  // guest 0x25169, sampled 0
6eacbf13cc:    	and	w24, w24, #0x7  // guest 0x25169, sampled 0
6eacbf13d0:    	lsl	w24, w24, #4  // guest 0x25169, sampled 0
6eacbf13d4:    	add	w24, w24, #0x1a0  // guest 0x25169, sampled 0
6eacbf13d8:    	sxtw	x24, w24  // guest 0x25169, sampled 0
6eacbf13dc:    	add	x24, x24, x19  // guest 0x25169, sampled 0
6eacbf13e0:    	ldr	x25, [x24]  // guest 0x25169, sampled 0
6eacbf13e4:    	ldrh	w24, [x24, #0x8]  // guest 0x25169, sampled 3
6eacbf13e8:    	str	x25, [x23]  // guest 0x25169, sampled 0
6eacbf13ec:    	strh	w24, [x23, #0x8]  // guest 0x25169, sampled 0
6eacbf13f0:    	ldr	w23, [x19, #0x54]  // guest 0x25169, sampled 0
6eacbf13f4:    	strh	w23, [x19, #0x222]  // guest 0x25169, sampled 0
6eacbf13f8:    	mov	w23, #0x5169            // =20841  // guest 0x25169, sampled 0
6eacbf13fc:    	movk	w23, #0x2, lsl #16  // guest 0x25169, sampled 0
6eacbf1400:    	str	w23, [x19, #0x228]  // guest 0x25169, sampled 0
6eacbf1404:    	add	w21, w21, #0x20  // guest 0x2516b, sampled 0
6eacbf1408:    	mov	w23, w21  // guest 0x2516b, sampled 0
6eacbf140c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2516b, sampled 0
6eacbf1410:    	and	x16, x16, x21, lsr #7  // guest 0x2516b, sampled 0
6eacbf1414:    	add	x17, x17, x16  // guest 0x2516b, sampled 0
6eacbf1418:    	ldp	x16, x17, [x17]  // guest 0x2516b, sampled 0
6eacbf141c:    	and	w30, w21, #0xfffff003  // guest 0x2516b, sampled 0
6eacbf1420:    	cmp	w16, w30  // guest 0x2516b, sampled 0
6eacbf1424:    	b.ne	0x6eacbf1b80 <trace+0x1280>  // guest 0x2516b, sampled 0
6eacbf1428:    	add	x30, x17, w21, uxtw  // guest 0x2516b, sampled 0
6eacbf142c:    	ldapr	w2, [x30]  // guest 0x2516b, sampled 0
6eacbf1430:    	add	x1, x19, #0x258  // guest 0x2516b, sampled 1
6eacbf1434:    	mov	x0, x19  // guest 0x2516b, sampled 0
6eacbf1438:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcb9000>  // guest 0x2516b, sampled 0
6eacbf143c:    	add	x16, x16, #0x484  // guest 0x2516b, sampled 0
6eacbf1440:    	blr	x16  // guest 0x2516b, sampled 0
6eacbf1444:    	lsl	w20, w20, #4  // guest 0x2516b, sampled 0
6eacbf1448:    	add	w20, w20, #0x1a0  // guest 0x2516b, sampled 0
6eacbf144c:    	sxtw	x20, w20  // guest 0x2516b, sampled 0
6eacbf1450:    	add	x1, x20, x19  // guest 0x2516b, sampled 0
6eacbf1454:    	add	x2, x19, #0x258  // guest 0x2516b, sampled 0
6eacbf1458:    	mov	x0, x19  // guest 0x2516b, sampled 0
6eacbf145c:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcba000>  // guest 0x2516b, sampled 0
6eacbf1460:    	add	x16, x16, #0xb4c  // guest 0x2516b, sampled 0
6eacbf1464:    	blr	x16  // guest 0x2516b, sampled 0
6eacbf1468:    	ldr	w20, [x19, #0x74]  // guest 0x2516b, sampled 0
6eacbf146c:    	strh	w20, [x19, #0x224]  // guest 0x2516b, sampled 0
6eacbf1470:    	str	w23, [x19, #0x230]  // guest 0x2516b, sampled 0
6eacbf1474:    	ldr	w20, [x19, #0x54]  // guest 0x2516b, sampled 0
6eacbf1478:    	strh	w20, [x19, #0x222]  // guest 0x2516b, sampled 0
6eacbf147c:    	mov	w20, #0x516b            // =20843  // guest 0x2516b, sampled 0
6eacbf1480:    	movk	w20, #0x2, lsl #16  // guest 0x2516b, sampled 0
6eacbf1484:    	str	w20, [x19, #0x228]  // guest 0x2516b, sampled 0
6eacbf1488:    	mov	w1, #0x2                // =2  // guest 0x2516e, sampled 0
6eacbf148c:    	mov	x0, x19  // guest 0x2516e, sampled 0
6eacbf1490:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcba000>  // guest 0x2516e, sampled 0
6eacbf1494:    	add	x16, x16, #0x5a0  // guest 0x2516e, sampled 0
6eacbf1498:    	blr	x16  // guest 0x2516e, sampled 0
6eacbf149c:    	ldr	w20, [x19, #0x54]  // guest 0x2516e, sampled 0
6eacbf14a0:    	strh	w20, [x19, #0x222]  // guest 0x2516e, sampled 0
6eacbf14a4:    	mov	w20, #0x516e            // =20846  // guest 0x2516e, sampled 0
6eacbf14a8:    	movk	w20, #0x2, lsl #16  // guest 0x2516e, sampled 0
6eacbf14ac:    	str	w20, [x19, #0x228]  // guest 0x2516e, sampled 0
6eacbf14b0:    	ldr	w20, [x19, #0x8]  // guest 0x25170, sampled 0
6eacbf14b4:    	add	w20, w20, #0x2c  // guest 0x25170, sampled 0
6eacbf14b8:    	mov	w21, w20  // guest 0x25170, sampled 0
6eacbf14bc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25170, sampled 0
6eacbf14c0:    	and	x16, x16, x20, lsr #7  // guest 0x25170, sampled 0
6eacbf14c4:    	add	x17, x17, x16  // guest 0x25170, sampled 0
6eacbf14c8:    	ldp	x16, x17, [x17]  // guest 0x25170, sampled 0
6eacbf14cc:    	and	w30, w20, #0xfffff003  // guest 0x25170, sampled 2
6eacbf14d0:    	cmp	w16, w30  // guest 0x25170, sampled 0
6eacbf14d4:    	b.ne	0x6eacbf1bac <trace+0x12ac>  // guest 0x25170, sampled 0
6eacbf14d8:    	add	x30, x17, w20, uxtw  // guest 0x25170, sampled 0
6eacbf14dc:    	ldapr	w2, [x30]  // guest 0x25170, sampled 0
6eacbf14e0:    	add	x1, x19, #0x258  // guest 0x25170, sampled 0
6eacbf14e4:    	mov	x0, x19  // guest 0x25170, sampled 0
6eacbf14e8:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcb9000>  // guest 0x25170, sampled 0
6eacbf14ec:    	add	x16, x16, #0x484  // guest 0x25170, sampled 0
6eacbf14f0:    	blr	x16  // guest 0x25170, sampled 0
6eacbf14f4:    	ldr	w20, [x19, #0x188]  // guest 0x25170, sampled 0
6eacbf14f8:    	lsl	w20, w20, #4  // guest 0x25170, sampled 0
6eacbf14fc:    	add	w20, w20, #0x1a0  // guest 0x25170, sampled 0
6eacbf1500:    	sxtw	x20, w20  // guest 0x25170, sampled 0
6eacbf1504:    	add	x1, x20, x19  // guest 0x25170, sampled 0
6eacbf1508:    	add	x2, x19, #0x258  // guest 0x25170, sampled 0
6eacbf150c:    	mov	x0, x19  // guest 0x25170, sampled 0
6eacbf1510:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcba000>  // guest 0x25170, sampled 0
6eacbf1514:    	add	x16, x16, #0xb4c  // guest 0x25170, sampled 0
6eacbf1518:    	blr	x16  // guest 0x25170, sampled 0
6eacbf151c:    	ldr	w20, [x19, #0x74]  // guest 0x25170, sampled 0
6eacbf1520:    	strh	w20, [x19, #0x224]  // guest 0x25170, sampled 0
6eacbf1524:    	str	w21, [x19, #0x230]  // guest 0x25170, sampled 0
6eacbf1528:    	ldr	w20, [x19, #0x54]  // guest 0x25170, sampled 0
6eacbf152c:    	strh	w20, [x19, #0x222]  // guest 0x25170, sampled 0
6eacbf1530:    	mov	w20, #0x5170            // =20848  // guest 0x25170, sampled 0
6eacbf1534:    	movk	w20, #0x2, lsl #16  // guest 0x25170, sampled 0
6eacbf1538:    	str	w20, [x19, #0x228]  // guest 0x25170, sampled 0
6eacbf153c:    	mov	w1, w22  // guest 0x25173, sampled 0
6eacbf1540:    	mov	x0, x19  // guest 0x25173, sampled 0
6eacbf1544:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcba000>  // guest 0x25173, sampled 0
6eacbf1548:    	add	x16, x16, #0x5a0  // guest 0x25173, sampled 0
6eacbf154c:    	blr	x16  // guest 0x25173, sampled 0
6eacbf1550:    	ldr	w20, [x19, #0x54]  // guest 0x25173, sampled 0
6eacbf1554:    	strh	w20, [x19, #0x222]  // guest 0x25173, sampled 0
6eacbf1558:    	mov	w20, #0x5173            // =20851  // guest 0x25173, sampled 0
6eacbf155c:    	movk	w20, #0x2, lsl #16  // guest 0x25173, sampled 0
6eacbf1560:    	str	w20, [x19, #0x228]  // guest 0x25173, sampled 0
6eacbf1564:    	ldr	w20, [x19, #0x188]  // guest 0x25175, sampled 0
6eacbf1568:    	add	w21, w20, #0x4  // guest 0x25175, sampled 0
6eacbf156c:    	and	w21, w21, #0x7  // guest 0x25175, sampled 0
6eacbf1570:    	lsl	w21, w21, #4  // guest 0x25175, sampled 0
6eacbf1574:    	add	w21, w21, #0x1a0  // guest 0x25175, sampled 0
6eacbf1578:    	sxtw	x21, w21  // guest 0x25175, sampled 0
6eacbf157c:    	add	x1, x21, x19  // guest 0x25175, sampled 0
6eacbf1580:    	lsl	w21, w20, #4  // guest 0x25175, sampled 0
6eacbf1584:    	add	w21, w21, #0x1a0  // guest 0x25175, sampled 0
6eacbf1588:    	sxtw	x21, w21  // guest 0x25175, sampled 0
6eacbf158c:    	add	x2, x21, x19  // guest 0x25175, sampled 0
6eacbf1590:    	mov	x0, x19  // guest 0x25175, sampled 0
6eacbf1594:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcba000>  // guest 0x25175, sampled 0
6eacbf1598:    	add	x16, x16, #0xa78  // guest 0x25175, sampled 0
6eacbf159c:    	blr	x16  // guest 0x25175, sampled 0
6eacbf15a0:    	sxtw	x21, w20  // guest 0x25175, sampled 0
6eacbf15a4:    	add	x21, x21, x19  // guest 0x25175, sampled 0
6eacbf15a8:    	strb	w22, [x21, #0x190]  // guest 0x25175, sampled 0
6eacbf15ac:    	add	w20, w20, w22  // guest 0x25175, sampled 0
6eacbf15b0:    	and	w20, w20, #0x7  // guest 0x25175, sampled 0
6eacbf15b4:    	ldr	w21, [x19, #0x54]  // guest 0x25175, sampled 0
6eacbf15b8:    	strh	w21, [x19, #0x222]  // guest 0x25175, sampled 0
6eacbf15bc:    	mov	w21, #0x5175            // =20853  // guest 0x25175, sampled 0
6eacbf15c0:    	movk	w21, #0x2, lsl #16  // guest 0x25175, sampled 0
6eacbf15c4:    	str	w21, [x19, #0x228]  // guest 0x25175, sampled 0
6eacbf15c8:    	add	w21, w20, #0x4  // guest 0x25177, sampled 0
6eacbf15cc:    	and	w21, w21, #0x7  // guest 0x25177, sampled 0
6eacbf15d0:    	lsl	w21, w21, #4  // guest 0x25177, sampled 0
6eacbf15d4:    	add	w21, w21, #0x1a0  // guest 0x25177, sampled 0
6eacbf15d8:    	sxtw	x21, w21  // guest 0x25177, sampled 0
6eacbf15dc:    	add	x1, x21, x19  // guest 0x25177, sampled 0
6eacbf15e0:    	lsl	w21, w20, #4  // guest 0x25177, sampled 0
6eacbf15e4:    	add	w21, w21, #0x1a0  // guest 0x25177, sampled 0
6eacbf15e8:    	sxtw	x21, w21  // guest 0x25177, sampled 0
6eacbf15ec:    	add	x2, x21, x19  // guest 0x25177, sampled 0
6eacbf15f0:    	mov	x0, x19  // guest 0x25177, sampled 0
6eacbf15f4:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcba000>  // guest 0x25177, sampled 0
6eacbf15f8:    	add	x16, x16, #0xa78  // guest 0x25177, sampled 0
6eacbf15fc:    	blr	x16  // guest 0x25177, sampled 0
6eacbf1600:    	sxtw	x21, w20  // guest 0x25177, sampled 0
6eacbf1604:    	add	x21, x21, x19  // guest 0x25177, sampled 0
6eacbf1608:    	strb	w22, [x21, #0x190]  // guest 0x25177, sampled 0
6eacbf160c:    	add	w20, w20, w22  // guest 0x25177, sampled 0
6eacbf1610:    	and	w20, w20, #0x7  // guest 0x25177, sampled 0
6eacbf1614:    	ldr	w21, [x19, #0x54]  // guest 0x25177, sampled 0
6eacbf1618:    	strh	w21, [x19, #0x222]  // guest 0x25177, sampled 0
6eacbf161c:    	mov	w21, #0x5177            // =20855  // guest 0x25177, sampled 0
6eacbf1620:    	movk	w21, #0x2, lsl #16  // guest 0x25177, sampled 0
6eacbf1624:    	str	w21, [x19, #0x228]  // guest 0x25177, sampled 0
6eacbf1628:    	add	w21, w20, w22  // guest 0x25179, sampled 0
6eacbf162c:    	and	w21, w21, #0x7  // guest 0x25179, sampled 0
6eacbf1630:    	lsl	w21, w21, #4  // guest 0x25179, sampled 0
6eacbf1634:    	add	w21, w21, #0x1a0  // guest 0x25179, sampled 0
6eacbf1638:    	sxtw	x21, w21  // guest 0x25179, sampled 0
6eacbf163c:    	add	x1, x21, x19  // guest 0x25179, sampled 0
6eacbf1640:    	lsl	w21, w20, #4  // guest 0x25179, sampled 0
6eacbf1644:    	add	w21, w21, #0x1a0  // guest 0x25179, sampled 0
6eacbf1648:    	sxtw	x21, w21  // guest 0x25179, sampled 0
6eacbf164c:    	add	x2, x21, x19  // guest 0x25179, sampled 0
6eacbf1650:    	mov	x0, x19  // guest 0x25179, sampled 0
6eacbf1654:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcba000>  // guest 0x25179, sampled 0
6eacbf1658:    	add	x16, x16, #0xa78  // guest 0x25179, sampled 0
6eacbf165c:    	blr	x16  // guest 0x25179, sampled 0
6eacbf1660:    	sxtw	x21, w20  // guest 0x25179, sampled 0
6eacbf1664:    	add	x21, x21, x19  // guest 0x25179, sampled 0
6eacbf1668:    	strb	w22, [x21, #0x190]  // guest 0x25179, sampled 0
6eacbf166c:    	add	w20, w20, w22  // guest 0x25179, sampled 0
6eacbf1670:    	and	w20, w20, #0x7  // guest 0x25179, sampled 0
6eacbf1674:    	str	w20, [x19, #0x188]  // guest 0x25179, sampled 0
6eacbf1678:    	ldr	w20, [x19, #0x54]  // guest 0x25179, sampled 0
6eacbf167c:    	strh	w20, [x19, #0x222]  // guest 0x25179, sampled 0
6eacbf1680:    	mov	w20, #0x5179            // =20857  // guest 0x25179, sampled 0
6eacbf1684:    	movk	w20, #0x2, lsl #16  // guest 0x25179, sampled 0
6eacbf1688:    	str	w20, [x19, #0x228]  // guest 0x25179, sampled 0
6eacbf168c:    	mov	w1, w22  // guest 0x2517b, sampled 0
6eacbf1690:    	mov	x0, x19  // guest 0x2517b, sampled 0
6eacbf1694:    	adrp	x16, 0x6efc8ab000 <trace+0x4fcba000>  // guest 0x2517b, sampled 0
6eacbf1698:    	add	x16, x16, #0x5a0  // guest 0x2517b, sampled 0
6eacbf169c:    	blr	x16  // guest 0x2517b, sampled 0
6eacbf16a0:    	ldr	w20, [x19, #0x54]  // guest 0x2517b, sampled 0
6eacbf16a4:    	strh	w20, [x19, #0x222]  // guest 0x2517b, sampled 0
6eacbf16a8:    	mov	w20, #0x517b            // =20859  // guest 0x2517b, sampled 0
6eacbf16ac:    	movk	w20, #0x2, lsl #16  // guest 0x2517b, sampled 0
6eacbf16b0:    	str	w20, [x19, #0x228]  // guest 0x2517b, sampled 0
6eacbf16b4:    	ldr	w20, [x19, #0x188]  // guest 0x2517d, sampled 0
6eacbf16b8:    	lsl	w21, w20, #4  // guest 0x2517d, sampled 0
6eacbf16bc:    	add	w21, w21, #0x1a0  // guest 0x2517d, sampled 0
6eacbf16c0:    	sxtw	x21, w21  // guest 0x2517d, sampled 0
6eacbf16c4:    	add	x1, x21, x19  // guest 0x2517d, sampled 0
6eacbf16c8:    	mov	x0, x19  // guest 0x2517d, sampled 0
6eacbf16cc:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcb9000>  // guest 0x2517d, sampled 0
6eacbf16d0:    	add	x16, x16, #0x5c0  // guest 0x2517d, sampled 0
6eacbf16d4:    	blr	x16  // guest 0x2517d, sampled 0
6eacbf16d8:    	ldr	w21, [x19, #0x1c]  // guest 0x2517d, sampled 0
6eacbf16dc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2517d, sampled 0
6eacbf16e0:    	and	x16, x16, x21, lsr #7  // guest 0x2517d, sampled 0
6eacbf16e4:    	add	x17, x17, x16  // guest 0x2517d, sampled 0
6eacbf16e8:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2517d, sampled 0
6eacbf16ec:    	and	w30, w21, #0xfffff003  // guest 0x2517d, sampled 0
6eacbf16f0:    	cmp	w16, w30  // guest 0x2517d, sampled 0
6eacbf16f4:    	b.ne	0x6eacbf1bd8 <trace+0x12d8>  // guest 0x2517d, sampled 0
6eacbf16f8:    	add	x30, x17, w21, uxtw  // guest 0x2517d, sampled 0
6eacbf16fc:    	stlr	w0, [x30]  // guest 0x2517d, sampled 0
6eacbf1700:    	sxtw	x23, w20  // guest 0x2517d, sampled 0
6eacbf1704:    	add	x23, x23, x19  // guest 0x2517d, sampled 0
6eacbf1708:    	strb	w22, [x23, #0x190]  // guest 0x2517d, sampled 0
6eacbf170c:    	add	w20, w20, w22  // guest 0x2517d, sampled 0
6eacbf1710:    	and	w20, w20, #0x7  // guest 0x2517d, sampled 0
6eacbf1714:    	str	w20, [x19, #0x188]  // guest 0x2517d, sampled 0
6eacbf1718:    	ldr	w23, [x19, #0x74]  // guest 0x2517d, sampled 1
6eacbf171c:    	strh	w23, [x19, #0x224]  // guest 0x2517d, sampled 0
6eacbf1720:    	str	w21, [x19, #0x230]  // guest 0x2517d, sampled 0
6eacbf1724:    	ldr	w23, [x19, #0x54]  // guest 0x2517d, sampled 0
6eacbf1728:    	strh	w23, [x19, #0x222]  // guest 0x2517d, sampled 0
6eacbf172c:    	mov	w23, #0x517d            // =20861  // guest 0x2517d, sampled 0
6eacbf1730:    	movk	w23, #0x2, lsl #16  // guest 0x2517d, sampled 0
6eacbf1734:    	str	w23, [x19, #0x228]  // guest 0x2517d, sampled 0
6eacbf1738:    	add	w23, w21, #0x4  // guest 0x2517f, sampled 0
6eacbf173c:    	mov	w24, w23  // guest 0x2517f, sampled 0
6eacbf1740:    	lsl	w25, w20, #4  // guest 0x2517f, sampled 0
6eacbf1744:    	add	w25, w25, #0x1a0  // guest 0x2517f, sampled 0
6eacbf1748:    	sxtw	x25, w25  // guest 0x2517f, sampled 0
6eacbf174c:    	add	x1, x25, x19  // guest 0x2517f, sampled 0
6eacbf1750:    	mov	x0, x19  // guest 0x2517f, sampled 0
6eacbf1754:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcb9000>  // guest 0x2517f, sampled 0
6eacbf1758:    	add	x16, x16, #0x5c0  // guest 0x2517f, sampled 0
6eacbf175c:    	blr	x16  // guest 0x2517f, sampled 0
6eacbf1760:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2517f, sampled 0
6eacbf1764:    	and	x16, x16, x23, lsr #7  // guest 0x2517f, sampled 1
6eacbf1768:    	add	x17, x17, x16  // guest 0x2517f, sampled 0
6eacbf176c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2517f, sampled 0
6eacbf1770:    	and	w30, w23, #0xfffff003  // guest 0x2517f, sampled 1
6eacbf1774:    	cmp	w16, w30  // guest 0x2517f, sampled 0
6eacbf1778:    	b.ne	0x6eacbf1c04 <trace+0x1304>  // guest 0x2517f, sampled 0
6eacbf177c:    	add	x30, x17, w23, uxtw  // guest 0x2517f, sampled 0
6eacbf1780:    	stlr	w0, [x30]  // guest 0x2517f, sampled 0
6eacbf1784:    	sxtw	x23, w20  // guest 0x2517f, sampled 0
6eacbf1788:    	add	x23, x23, x19  // guest 0x2517f, sampled 0
6eacbf178c:    	strb	w22, [x23, #0x190]  // guest 0x2517f, sampled 0
6eacbf1790:    	add	w20, w20, w22  // guest 0x2517f, sampled 0
6eacbf1794:    	and	w20, w20, #0x7  // guest 0x2517f, sampled 0
6eacbf1798:    	str	w20, [x19, #0x188]  // guest 0x2517f, sampled 0
6eacbf179c:    	ldr	w23, [x19, #0x74]  // guest 0x2517f, sampled 0
6eacbf17a0:    	strh	w23, [x19, #0x224]  // guest 0x2517f, sampled 0
6eacbf17a4:    	str	w24, [x19, #0x230]  // guest 0x2517f, sampled 1
6eacbf17a8:    	ldr	w23, [x19, #0x54]  // guest 0x2517f, sampled 0
6eacbf17ac:    	strh	w23, [x19, #0x222]  // guest 0x2517f, sampled 0
6eacbf17b0:    	mov	w23, #0x517f            // =20863  // guest 0x2517f, sampled 0
6eacbf17b4:    	movk	w23, #0x2, lsl #16  // guest 0x2517f, sampled 0
6eacbf17b8:    	str	w23, [x19, #0x228]  // guest 0x2517f, sampled 0
6eacbf17bc:    	add	w21, w21, #0x8  // guest 0x25182, sampled 0
6eacbf17c0:    	mov	w23, w21  // guest 0x25182, sampled 0
6eacbf17c4:    	lsl	w24, w20, #4  // guest 0x25182, sampled 0
6eacbf17c8:    	add	w24, w24, #0x1a0  // guest 0x25182, sampled 0
6eacbf17cc:    	sxtw	x24, w24  // guest 0x25182, sampled 0
6eacbf17d0:    	add	x1, x24, x19  // guest 0x25182, sampled 0
6eacbf17d4:    	mov	x0, x19  // guest 0x25182, sampled 0
6eacbf17d8:    	adrp	x16, 0x6efc8aa000 <trace+0x4fcb9000>  // guest 0x25182, sampled 0
6eacbf17dc:    	add	x16, x16, #0x5c0  // guest 0x25182, sampled 0
6eacbf17e0:    	blr	x16  // guest 0x25182, sampled 0
6eacbf17e4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25182, sampled 0
6eacbf17e8:    	and	x16, x16, x21, lsr #7  // guest 0x25182, sampled 0
6eacbf17ec:    	add	x17, x17, x16  // guest 0x25182, sampled 0
6eacbf17f0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x25182, sampled 0
6eacbf17f4:    	and	w30, w21, #0xfffff003  // guest 0x25182, sampled 0
6eacbf17f8:    	cmp	w16, w30  // guest 0x25182, sampled 0
6eacbf17fc:    	b.ne	0x6eacbf1c30 <trace+0x1330>  // guest 0x25182, sampled 0
6eacbf1800:    	add	x30, x17, w21, uxtw  // guest 0x25182, sampled 0
6eacbf1804:    	stlr	w0, [x30]  // guest 0x25182, sampled 0
6eacbf1808:    	sxtw	x21, w20  // guest 0x25182, sampled 0
6eacbf180c:    	add	x21, x21, x19  // guest 0x25182, sampled 0
6eacbf1810:    	strb	w22, [x21, #0x190]  // guest 0x25182, sampled 0
6eacbf1814:    	add	w20, w20, w22  // guest 0x25182, sampled 0
6eacbf1818:    	and	w20, w20, #0x7  // guest 0x25182, sampled 0
6eacbf181c:    	str	w20, [x19, #0x188]  // guest 0x25182, sampled 0
6eacbf1820:    	ldr	w20, [x19, #0x74]  // guest 0x25182, sampled 0
6eacbf1824:    	strh	w20, [x19, #0x224]  // guest 0x25182, sampled 0
6eacbf1828:    	str	w23, [x19, #0x230]  // guest 0x25182, sampled 0
6eacbf182c:    	ldr	w20, [x19, #0x54]  // guest 0x25182, sampled 0
6eacbf1830:    	strh	w20, [x19, #0x222]  // guest 0x25182, sampled 0
6eacbf1834:    	mov	w20, #0x5182            // =20866  // guest 0x25182, sampled 0
6eacbf1838:    	movk	w20, #0x2, lsl #16  // guest 0x25182, sampled 0
6eacbf183c:    	str	w20, [x19, #0x228]  // guest 0x25182, sampled 0
6eacbf1840:    	ldr	w20, [x19, #0x10]  // guest 0x25185, sampled 0
6eacbf1844:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25185, sampled 0
6eacbf1848:    	and	x16, x16, x20, lsr #7  // guest 0x25185, sampled 1
6eacbf184c:    	add	x17, x17, x16  // guest 0x25185, sampled 0
6eacbf1850:    	ldp	x16, x17, [x17]  // guest 0x25185, sampled 0
6eacbf1854:    	and	w30, w20, #0xfffff003  // guest 0x25185, sampled 0
6eacbf1858:    	cmp	w16, w30  // guest 0x25185, sampled 0
6eacbf185c:    	b.ne	0x6eacbf1c5c <trace+0x135c>  // guest 0x25185, sampled 0
6eacbf1860:    	add	x30, x17, w20, uxtw  // guest 0x25185, sampled 0
6eacbf1864:    	ldapr	w21, [x30]  // guest 0x25185, sampled 0
6eacbf1868:    	add	w20, w20, #0x4  // guest 0x25185, sampled 0
6eacbf186c:    	str	w20, [x19, #0x10]  // guest 0x25185, sampled 0
6eacbf1870:    	str	w21, [x19, #0x1c]  // guest 0x25185, sampled 0
6eacbf1874:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25186, sampled 0
6eacbf1878:    	and	x16, x16, x20, lsr #7  // guest 0x25186, sampled 0
6eacbf187c:    	add	x17, x17, x16  // guest 0x25186, sampled 0
6eacbf1880:    	ldp	x16, x17, [x17]  // guest 0x25186, sampled 0
6eacbf1884:    	and	w30, w20, #0xfffff003  // guest 0x25186, sampled 0
6eacbf1888:    	cmp	w16, w30  // guest 0x25186, sampled 0
6eacbf188c:    	b.ne	0x6eacbf1c88 <trace+0x1388>  // guest 0x25186, sampled 0
6eacbf1890:    	add	x30, x17, w20, uxtw  // guest 0x25186, sampled 0
6eacbf1894:    	ldapr	w21, [x30]  // guest 0x25186, sampled 0
6eacbf1898:    	add	w20, w20, #0x4  // guest 0x25186, sampled 0
6eacbf189c:    	str	w20, [x19, #0x10]  // guest 0x25186, sampled 0
6eacbf18a0:    	str	w21, [x19, #0x18]  // guest 0x25186, sampled 0
6eacbf18a4:    	sturb	w22, [x19, #-0xc]  // guest 0x25186, sampled 0
6eacbf18a8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x25187, sampled 0
6eacbf18ac:    	and	x16, x16, x20, lsr #7  // guest 0x25187, sampled 0
6eacbf18b0:    	add	x17, x17, x16  // guest 0x25187, sampled 0
6eacbf18b4:    	ldp	x16, x17, [x17]  // guest 0x25187, sampled 0
6eacbf18b8:    	and	w30, w20, #0xfffff003  // guest 0x25187, sampled 0
6eacbf18bc:    	cmp	w16, w30  // guest 0x25187, sampled 0
6eacbf18c0:    	b.ne	0x6eacbf1cb4 <trace+0x13b4>  // guest 0x25187, sampled 0
6eacbf18c4:    	add	x30, x17, w20, uxtw  // guest 0x25187, sampled 0
6eacbf18c8:    	ldapr	w21, [x30]  // guest 0x25187, sampled 0
6eacbf18cc:    	add	w20, w20, #0x4  // guest 0x25187, sampled 0
6eacbf18d0:    	str	w20, [x19, #0x10]  // guest 0x25187, sampled 0
6eacbf18d4:    	str	w21, [x19, #0x20]  // guest 0x25187, sampled 0
6eacbf18d8:    	mov	x0, x19  // guest 0x25187, sampled 0
6eacbf18dc:    	bl	0x6ea842253c <trace+0xfffffffffb831c3c>  // guest 0x25187, sampled 0
6eacbf18e0:    	br	x0  // guest 0x25187, sampled 0
6eacbf18e4:    	adr	x0, 0x6eacbf0843 <trace+0xffffffffffffff43>  // guest 0x25187, sampled 0
6eacbf18e8:    	b	0x6ea842202c <trace+0xfffffffffb83172c>  // guest 0x25187, sampled 0
6eacbf18ec:    	mov	w1, w21
6eacbf18f0:    	mov	w2, w22
6eacbf18f4:    	mov	x0, x19
6eacbf18f8:    	mov	w3, #0x4045             // =16453
6eacbf18fc:    	movk	w3, #0x1, lsl #16
6eacbf1900:    	adr	x4, 0x6eacbf0940 <trace+0x40>
6eacbf1904:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf1908:    	add	x16, x16, #0xc38
6eacbf190c:    	blr	x16
6eacbf1910:    	dmb	ishld
6eacbf1914:    	b	0x6eacbf0940 <trace+0x40>
6eacbf1918:    	mov	w1, w21
6eacbf191c:    	mov	w2, w22
6eacbf1920:    	mov	x0, x19
6eacbf1924:    	mov	w3, #0x4045             // =16453
6eacbf1928:    	movk	w3, #0x1, lsl #16
6eacbf192c:    	adr	x4, 0x6eacbf0974 <trace+0x74>
6eacbf1930:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf1934:    	add	x16, x16, #0xc38
6eacbf1938:    	blr	x16
6eacbf193c:    	dmb	ishld
6eacbf1940:    	b	0x6eacbf0974 <trace+0x74>
6eacbf1944:    	mov	w1, w21
6eacbf1948:    	mov	x0, x19
6eacbf194c:    	mov	w2, #0x4045             // =16453
6eacbf1950:    	movk	w2, #0x1, lsl #16
6eacbf1954:    	adr	x3, 0x6eacbf09a0 <trace+0xa0>
6eacbf1958:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf195c:    	add	x16, x16, #0x58
6eacbf1960:    	blr	x16
6eacbf1964:    	mov	w21, w0
6eacbf1968:    	dmb	ishld
6eacbf196c:    	b	0x6eacbf09a0 <trace+0xa0>
6eacbf1970:    	mov	w1, w22
6eacbf1974:    	mov	x0, x19
6eacbf1978:    	mov	w2, #0x4045             // =16453
6eacbf197c:    	movk	w2, #0x1, lsl #16
6eacbf1980:    	adr	x3, 0x6eacbf09cc <trace+0xcc>
6eacbf1984:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf1988:    	add	x16, x16, #0x58
6eacbf198c:    	blr	x16
6eacbf1990:    	mov	w22, w0
6eacbf1994:    	dmb	ishld
6eacbf1998:    	b	0x6eacbf09cc <trace+0xcc>
6eacbf199c:    	mov	w1, w20
6eacbf19a0:    	mov	x0, x19
6eacbf19a4:    	mov	w2, #0x4045             // =16453
6eacbf19a8:    	movk	w2, #0x1, lsl #16
6eacbf19ac:    	adr	x3, 0x6eacbf09f8 <trace+0xf8>
6eacbf19b0:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf19b4:    	add	x16, x16, #0x58
6eacbf19b8:    	blr	x16
6eacbf19bc:    	mov	w20, w0
6eacbf19c0:    	dmb	ishld
6eacbf19c4:    	b	0x6eacbf09f8 <trace+0xf8>
6eacbf19c8:    	mov	w1, w21
6eacbf19cc:    	mov	x0, x19
6eacbf19d0:    	mov	w2, #0x4045             // =16453
6eacbf19d4:    	movk	w2, #0x1, lsl #16
6eacbf19d8:    	adr	x3, 0x6eacbf0a20 <trace+0x120>
6eacbf19dc:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf19e0:    	add	x16, x16, #0x58
6eacbf19e4:    	blr	x16
6eacbf19e8:    	mov	w2, w0
6eacbf19ec:    	dmb	ishld
6eacbf19f0:    	b	0x6eacbf0a20 <trace+0x120>
6eacbf19f4:    	mov	w1, w21
6eacbf19f8:    	mov	x0, x19
6eacbf19fc:    	mov	w2, #0x4045             // =16453
6eacbf1a00:    	movk	w2, #0x1, lsl #16
6eacbf1a04:    	adr	x3, 0x6eacbf0ab0 <trace+0x1b0>
6eacbf1a08:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf1a0c:    	add	x16, x16, #0x58
6eacbf1a10:    	blr	x16
6eacbf1a14:    	mov	w2, w0
6eacbf1a18:    	dmb	ishld
6eacbf1a1c:    	b	0x6eacbf0ab0 <trace+0x1b0>
6eacbf1a20:    	mov	w1, w20
6eacbf1a24:    	mov	x0, x19
6eacbf1a28:    	mov	w2, #0x4045             // =16453
6eacbf1a2c:    	movk	w2, #0x1, lsl #16
6eacbf1a30:    	adr	x3, 0x6eacbf0b68 <trace+0x268>
6eacbf1a34:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf1a38:    	add	x16, x16, #0x58
6eacbf1a3c:    	blr	x16
6eacbf1a40:    	mov	w2, w0
6eacbf1a44:    	dmb	ishld
6eacbf1a48:    	b	0x6eacbf0b68 <trace+0x268>
6eacbf1a4c:    	mov	w1, w22
6eacbf1a50:    	mov	x0, x19
6eacbf1a54:    	mov	w2, #0x4045             // =16453
6eacbf1a58:    	movk	w2, #0x1, lsl #16
6eacbf1a5c:    	adr	x3, 0x6eacbf0c8c <trace+0x38c>
6eacbf1a60:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf1a64:    	add	x16, x16, #0x58
6eacbf1a68:    	blr	x16
6eacbf1a6c:    	mov	w2, w0
6eacbf1a70:    	dmb	ishld
6eacbf1a74:    	b	0x6eacbf0c8c <trace+0x38c>
6eacbf1a78:    	mov	w1, w21
6eacbf1a7c:    	mov	x0, x19
6eacbf1a80:    	mov	w2, #0x4045             // =16453
6eacbf1a84:    	movk	w2, #0x1, lsl #16
6eacbf1a88:    	adr	x3, 0x6eacbf0d74 <trace+0x474>
6eacbf1a8c:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf1a90:    	add	x16, x16, #0x58
6eacbf1a94:    	blr	x16
6eacbf1a98:    	mov	w2, w0
6eacbf1a9c:    	dmb	ishld
6eacbf1aa0:    	b	0x6eacbf0d74 <trace+0x474>
6eacbf1aa4:    	mov	w1, w20
6eacbf1aa8:    	mov	x0, x19
6eacbf1aac:    	mov	w2, #0x4045             // =16453
6eacbf1ab0:    	movk	w2, #0x1, lsl #16
6eacbf1ab4:    	adr	x3, 0x6eacbf0e24 <trace+0x524>
6eacbf1ab8:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf1abc:    	add	x16, x16, #0x58
6eacbf1ac0:    	blr	x16
6eacbf1ac4:    	mov	w2, w0
6eacbf1ac8:    	dmb	ishld
6eacbf1acc:    	b	0x6eacbf0e24 <trace+0x524>
6eacbf1ad0:    	mov	w1, w22
6eacbf1ad4:    	mov	x0, x19
6eacbf1ad8:    	mov	w2, #0x4045             // =16453
6eacbf1adc:    	movk	w2, #0x1, lsl #16
6eacbf1ae0:    	adr	x3, 0x6eacbf0f40 <trace+0x640>
6eacbf1ae4:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf1ae8:    	add	x16, x16, #0x58
6eacbf1aec:    	blr	x16
6eacbf1af0:    	mov	w2, w0
6eacbf1af4:    	dmb	ishld
6eacbf1af8:    	b	0x6eacbf0f40 <trace+0x640>
6eacbf1afc:    	mov	w1, w21
6eacbf1b00:    	mov	x0, x19
6eacbf1b04:    	mov	w2, #0x4045             // =16453
6eacbf1b08:    	movk	w2, #0x1, lsl #16
6eacbf1b0c:    	adr	x3, 0x6eacbf1028 <trace+0x728>
6eacbf1b10:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf1b14:    	add	x16, x16, #0x58
6eacbf1b18:    	blr	x16
6eacbf1b1c:    	mov	w2, w0
6eacbf1b20:    	dmb	ishld
6eacbf1b24:    	b	0x6eacbf1028 <trace+0x728>
6eacbf1b28:    	mov	w1, w20
6eacbf1b2c:    	mov	x0, x19
6eacbf1b30:    	mov	w2, #0x4045             // =16453
6eacbf1b34:    	movk	w2, #0x1, lsl #16
6eacbf1b38:    	adr	x3, 0x6eacbf10d8 <trace+0x7d8>
6eacbf1b3c:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf1b40:    	add	x16, x16, #0x58
6eacbf1b44:    	blr	x16
6eacbf1b48:    	mov	w2, w0
6eacbf1b4c:    	dmb	ishld
6eacbf1b50:    	b	0x6eacbf10d8 <trace+0x7d8>
6eacbf1b54:    	mov	w1, w23
6eacbf1b58:    	mov	x0, x19
6eacbf1b5c:    	mov	w2, #0x4045             // =16453
6eacbf1b60:    	movk	w2, #0x1, lsl #16
6eacbf1b64:    	adr	x3, 0x6eacbf1348 <trace+0xa48>
6eacbf1b68:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf1b6c:    	add	x16, x16, #0x58
6eacbf1b70:    	blr	x16
6eacbf1b74:    	mov	w2, w0
6eacbf1b78:    	dmb	ishld
6eacbf1b7c:    	b	0x6eacbf1348 <trace+0xa48>
6eacbf1b80:    	mov	w1, w21
6eacbf1b84:    	mov	x0, x19
6eacbf1b88:    	mov	w2, #0x4045             // =16453
6eacbf1b8c:    	movk	w2, #0x1, lsl #16
6eacbf1b90:    	adr	x3, 0x6eacbf1430 <trace+0xb30>
6eacbf1b94:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf1b98:    	add	x16, x16, #0x58
6eacbf1b9c:    	blr	x16
6eacbf1ba0:    	mov	w2, w0
6eacbf1ba4:    	dmb	ishld
6eacbf1ba8:    	b	0x6eacbf1430 <trace+0xb30>
6eacbf1bac:    	mov	w1, w20
6eacbf1bb0:    	mov	x0, x19
6eacbf1bb4:    	mov	w2, #0x4045             // =16453
6eacbf1bb8:    	movk	w2, #0x1, lsl #16
6eacbf1bbc:    	adr	x3, 0x6eacbf14e0 <trace+0xbe0>
6eacbf1bc0:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf1bc4:    	add	x16, x16, #0x58
6eacbf1bc8:    	blr	x16
6eacbf1bcc:    	mov	w2, w0
6eacbf1bd0:    	dmb	ishld
6eacbf1bd4:    	b	0x6eacbf14e0 <trace+0xbe0>
6eacbf1bd8:    	mov	w1, w21
6eacbf1bdc:    	mov	w2, w0
6eacbf1be0:    	mov	x0, x19
6eacbf1be4:    	mov	w3, #0x4045             // =16453
6eacbf1be8:    	movk	w3, #0x1, lsl #16
6eacbf1bec:    	adr	x4, 0x6eacbf1700 <trace+0xe00>
6eacbf1bf0:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf1bf4:    	add	x16, x16, #0xc38
6eacbf1bf8:    	blr	x16
6eacbf1bfc:    	dmb	ishld
6eacbf1c00:    	b	0x6eacbf1700 <trace+0xe00>
6eacbf1c04:    	mov	w1, w23
6eacbf1c08:    	mov	w2, w0
6eacbf1c0c:    	mov	x0, x19
6eacbf1c10:    	mov	w3, #0x4045             // =16453
6eacbf1c14:    	movk	w3, #0x1, lsl #16
6eacbf1c18:    	adr	x4, 0x6eacbf1784 <trace+0xe84>
6eacbf1c1c:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf1c20:    	add	x16, x16, #0xc38
6eacbf1c24:    	blr	x16
6eacbf1c28:    	dmb	ishld
6eacbf1c2c:    	b	0x6eacbf1784 <trace+0xe84>
6eacbf1c30:    	mov	w1, w21
6eacbf1c34:    	mov	w2, w0
6eacbf1c38:    	mov	x0, x19
6eacbf1c3c:    	mov	w3, #0x4045             // =16453
6eacbf1c40:    	movk	w3, #0x1, lsl #16
6eacbf1c44:    	adr	x4, 0x6eacbf1808 <trace+0xf08>
6eacbf1c48:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf1c4c:    	add	x16, x16, #0xc38
6eacbf1c50:    	blr	x16
6eacbf1c54:    	dmb	ishld
6eacbf1c58:    	b	0x6eacbf1808 <trace+0xf08>
6eacbf1c5c:    	mov	w1, w20
6eacbf1c60:    	mov	x0, x19
6eacbf1c64:    	mov	w2, #0x4045             // =16453
6eacbf1c68:    	movk	w2, #0x1, lsl #16
6eacbf1c6c:    	adr	x3, 0x6eacbf1868 <trace+0xf68>
6eacbf1c70:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf1c74:    	add	x16, x16, #0x58
6eacbf1c78:    	blr	x16
6eacbf1c7c:    	mov	w21, w0
6eacbf1c80:    	dmb	ishld
6eacbf1c84:    	b	0x6eacbf1868 <trace+0xf68>
6eacbf1c88:    	mov	w1, w20
6eacbf1c8c:    	mov	x0, x19
6eacbf1c90:    	mov	w2, #0x4045             // =16453
6eacbf1c94:    	movk	w2, #0x1, lsl #16
6eacbf1c98:    	adr	x3, 0x6eacbf1898 <trace+0xf98>
6eacbf1c9c:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf1ca0:    	add	x16, x16, #0x58
6eacbf1ca4:    	blr	x16
6eacbf1ca8:    	mov	w21, w0
6eacbf1cac:    	dmb	ishld
6eacbf1cb0:    	b	0x6eacbf1898 <trace+0xf98>
6eacbf1cb4:    	mov	w1, w20
6eacbf1cb8:    	mov	x0, x19
6eacbf1cbc:    	mov	w2, #0x4045             // =16453
6eacbf1cc0:    	movk	w2, #0x1, lsl #16
6eacbf1cc4:    	adr	x3, 0x6eacbf18cc <trace+0xfcc>
6eacbf1cc8:    	adrp	x16, 0x6efc87d000 <trace+0x4fc8d000>
6eacbf1ccc:    	add	x16, x16, #0x58
6eacbf1cd0:    	blr	x16
6eacbf1cd4:    	mov	w21, w0
6eacbf1cd8:    	dmb	ishld
6eacbf1cdc:    	b	0x6eacbf18cc <trace+0xfcc>