
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-10b236-6c513b5840.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006c513b5840 <trace>:
6c513b5840:    	ldur	w20, [x19, #-0x10]  // guest 0x10b236, sampled 0
6c513b5844:    	tbnz	w20, #0x1f, 0x6c513b7a00 <trace+0x21c0>  // guest 0x10b236, sampled 0
6c513b5848:    	sturb	wzr, [x19, #-0xc]  // guest 0x10b236, sampled 0
6c513b584c:    	mov	w20, #0x62a8            // =25256  // guest 0x10b236, sampled 0
6c513b5850:    	movk	w20, #0x4f, lsl #16  // guest 0x10b236, sampled 0
6c513b5854:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b236, sampled 0
6c513b5858:    	and	x16, x16, x20, lsr #7  // guest 0x10b236, sampled 0
6c513b585c:    	add	x17, x17, x16  // guest 0x10b236, sampled 0
6c513b5860:    	ldp	x16, x17, [x17]  // guest 0x10b236, sampled 0
6c513b5864:    	and	w30, w20, #0xfffff003  // guest 0x10b236, sampled 0
6c513b5868:    	cmp	w16, w30  // guest 0x10b236, sampled 0
6c513b586c:    	b.ne	0x6c513b7a08 <trace+0x21c8>  // guest 0x10b236, sampled 0
6c513b5870:    	add	x30, x17, w20, uxtw  // guest 0x10b236, sampled 0
6c513b5874:    	ldapr	w20, [x30]  // guest 0x10b236, sampled 0
6c513b5878:    	str	w20, [x19, #0x8]  // guest 0x10b236, sampled 0
6c513b587c:    	ldr	w21, [x19]  // guest 0x10b23c, sampled 0
6c513b5880:    	lsl	w22, w21, #1  // guest 0x10b23c, sampled 0
6c513b5884:    	add	w21, w22, w21  // guest 0x10b23c, sampled 0
6c513b5888:    	lsl	w22, w21, #3  // guest 0x10b23f, sampled 0
6c513b588c:    	lsl	w21, w21, #4  // guest 0x10b23f, sampled 0
6c513b5890:    	str	w21, [x19, #0x4]  // guest 0x10b23f, sampled 0
6c513b5894:    	str	w21, [x19, #0x28]  // guest 0x10b23f, sampled 0
6c513b5898:    	str	w22, [x19, #0x2c]  // guest 0x10b23f, sampled 0
6c513b589c:    	add	w20, w20, w21  // guest 0x10b242, sampled 0
6c513b58a0:    	str	w20, [x19]  // guest 0x10b242, sampled 0
6c513b58a4:    	ldr	w21, [x19, #0xc]  // guest 0x10b245, sampled 0
6c513b58a8:    	add	w22, w21, #0x10c  // guest 0x10b245, sampled 0
6c513b58ac:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b245, sampled 0
6c513b58b0:    	and	x16, x16, x22, lsr #7  // guest 0x10b245, sampled 0
6c513b58b4:    	add	x17, x17, x16  // guest 0x10b245, sampled 0
6c513b58b8:    	ldp	x16, x17, [x17]  // guest 0x10b245, sampled 0
6c513b58bc:    	and	w30, w22, #0xfffff003  // guest 0x10b245, sampled 0
6c513b58c0:    	cmp	w16, w30  // guest 0x10b245, sampled 0
6c513b58c4:    	b.ne	0x6c513b7a34 <trace+0x21f4>  // guest 0x10b245, sampled 0
6c513b58c8:    	add	x30, x17, w22, uxtw  // guest 0x10b245, sampled 0
6c513b58cc:    	ldapr	w22, [x30]  // guest 0x10b245, sampled 0
6c513b58d0:    	str	w22, [x19, #0x4]  // guest 0x10b245, sampled 0
6c513b58d4:    	add	w23, w20, #0x10  // guest 0x10b24b, sampled 0
6c513b58d8:    	mov	w24, w23  // guest 0x10b24b, sampled 0
6c513b58dc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b24b, sampled 0
6c513b58e0:    	and	x16, x16, x23, lsr #7  // guest 0x10b24b, sampled 0
6c513b58e4:    	add	x17, x17, x16  // guest 0x10b24b, sampled 0
6c513b58e8:    	ldp	x16, x17, [x17]  // guest 0x10b24b, sampled 0
6c513b58ec:    	and	w30, w23, #0xfffff003  // guest 0x10b24b, sampled 0
6c513b58f0:    	cmp	w16, w30  // guest 0x10b24b, sampled 0
6c513b58f4:    	b.ne	0x6c513b7a60 <trace+0x2220>  // guest 0x10b24b, sampled 0
6c513b58f8:    	add	x30, x17, w23, uxtw  // guest 0x10b24b, sampled 0
6c513b58fc:    	ldapr	w2, [x30]  // guest 0x10b24b, sampled 0
6c513b5900:    	ldr	w23, [x19, #0x188]  // guest 0x10b24b, sampled 0
6c513b5904:    	add	w25, w23, #0x7  // guest 0x10b24b, sampled 0
6c513b5908:    	and	w25, w25, #0x7  // guest 0x10b24b, sampled 0
6c513b590c:    	lsl	w25, w25, #4  // guest 0x10b24b, sampled 0
6c513b5910:    	add	w25, w25, #0x1a0  // guest 0x10b24b, sampled 0
6c513b5914:    	sxtw	x25, w25  // guest 0x10b24b, sampled 0
6c513b5918:    	add	x1, x25, x19  // guest 0x10b24b, sampled 0
6c513b591c:    	mov	x0, x19  // guest 0x10b24b, sampled 0
6c513b5920:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b24b, sampled 0
6c513b5924:    	add	x16, x16, #0x3b4  // guest 0x10b24b, sampled 0
6c513b5928:    	blr	x16  // guest 0x10b24b, sampled 0
6c513b592c:    	sub	w23, w23, #0x1  // guest 0x10b24b, sampled 0
6c513b5930:    	and	w23, w23, #0x7  // guest 0x10b24b, sampled 0
6c513b5934:    	str	w23, [x19, #0x188]  // guest 0x10b24b, sampled 0
6c513b5938:    	sxtw	x25, w23  // guest 0x10b24b, sampled 0
6c513b593c:    	add	x25, x25, x19  // guest 0x10b24b, sampled 0
6c513b5940:    	strb	wzr, [x25, #0x190]  // guest 0x10b24b, sampled 0
6c513b5944:    	ldr	w25, [x19, #0x74]  // guest 0x10b24b, sampled 0
6c513b5948:    	strh	w25, [x19, #0x224]  // guest 0x10b24b, sampled 0
6c513b594c:    	str	w24, [x19, #0x230]  // guest 0x10b24b, sampled 0
6c513b5950:    	ldr	w24, [x19, #0x54]  // guest 0x10b24b, sampled 0
6c513b5954:    	strh	w24, [x19, #0x222]  // guest 0x10b24b, sampled 0
6c513b5958:    	mov	w24, #0xb24b            // =45643  // guest 0x10b24b, sampled 0
6c513b595c:    	movk	w24, #0x10, lsl #16  // guest 0x10b24b, sampled 0
6c513b5960:    	str	w24, [x19, #0x228]  // guest 0x10b24b, sampled 0
6c513b5964:    	ldr	w24, [x19, #0x18]  // guest 0x10b24e, sampled 0
6c513b5968:    	lsl	w25, w24, #1  // guest 0x10b24e, sampled 0
6c513b596c:    	add	w24, w25, w24  // guest 0x10b24e, sampled 0
6c513b5970:    	lsl	w25, w24, #1  // guest 0x10b251, sampled 0
6c513b5974:    	lsl	w24, w24, #2  // guest 0x10b251, sampled 0
6c513b5978:    	str	w24, [x19, #0x8]  // guest 0x10b251, sampled 0
6c513b597c:    	mov	w26, w24  // guest 0x10b251, sampled 0
6c513b5980:    	str	w26, [x19, #0x28]  // guest 0x10b251, sampled 0
6c513b5984:    	str	w25, [x19, #0x2c]  // guest 0x10b251, sampled 0
6c513b5988:    	add	w25, w24, w22  // guest 0x10b254, sampled 0
6c513b598c:    	add	w25, w25, #0x4  // guest 0x10b254, sampled 0
6c513b5990:    	mov	w27, w25  // guest 0x10b254, sampled 0
6c513b5994:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b254, sampled 0
6c513b5998:    	and	x16, x16, x25, lsr #7  // guest 0x10b254, sampled 0
6c513b599c:    	add	x17, x17, x16  // guest 0x10b254, sampled 0
6c513b59a0:    	ldp	x16, x17, [x17]  // guest 0x10b254, sampled 0
6c513b59a4:    	and	w30, w25, #0xfffff003  // guest 0x10b254, sampled 0
6c513b59a8:    	cmp	w16, w30  // guest 0x10b254, sampled 0
6c513b59ac:    	b.ne	0x6c513b7a8c <trace+0x224c>  // guest 0x10b254, sampled 0
6c513b59b0:    	add	x30, x17, w25, uxtw  // guest 0x10b254, sampled 0
6c513b59b4:    	ldapr	w2, [x30]  // guest 0x10b254, sampled 0
6c513b59b8:    	add	x1, x19, #0x258  // guest 0x10b254, sampled 0
6c513b59bc:    	mov	x0, x19  // guest 0x10b254, sampled 0
6c513b59c0:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b254, sampled 0
6c513b59c4:    	add	x16, x16, #0x3b4  // guest 0x10b254, sampled 0
6c513b59c8:    	blr	x16  // guest 0x10b254, sampled 0
6c513b59cc:    	lsl	w25, w23, #4  // guest 0x10b254, sampled 0
6c513b59d0:    	add	w25, w25, #0x1a0  // guest 0x10b254, sampled 0
6c513b59d4:    	sxtw	x25, w25  // guest 0x10b254, sampled 0
6c513b59d8:    	add	x1, x25, x19  // guest 0x10b254, sampled 0
6c513b59dc:    	add	x2, x19, #0x258  // guest 0x10b254, sampled 0
6c513b59e0:    	mov	x0, x19  // guest 0x10b254, sampled 0
6c513b59e4:    	adrp	x16, 0x6c97752000 <trace+0x4639d000>  // guest 0x10b254, sampled 0
6c513b59e8:    	add	x16, x16, #0xa7c  // guest 0x10b254, sampled 0
6c513b59ec:    	blr	x16  // guest 0x10b254, sampled 0
6c513b59f0:    	ldr	w25, [x19, #0x74]  // guest 0x10b254, sampled 0
6c513b59f4:    	strh	w25, [x19, #0x224]  // guest 0x10b254, sampled 0
6c513b59f8:    	str	w27, [x19, #0x230]  // guest 0x10b254, sampled 0
6c513b59fc:    	ldr	w25, [x19, #0x54]  // guest 0x10b254, sampled 0
6c513b5a00:    	strh	w25, [x19, #0x222]  // guest 0x10b254, sampled 0
6c513b5a04:    	mov	w25, #0xb254            // =45652  // guest 0x10b254, sampled 0
6c513b5a08:    	movk	w25, #0x10, lsl #16  // guest 0x10b254, sampled 0
6c513b5a0c:    	str	w25, [x19, #0x228]  // guest 0x10b254, sampled 0
6c513b5a10:    	add	w22, w22, w26  // guest 0x10b258, sampled 0
6c513b5a14:    	str	w22, [x19, #0x4]  // guest 0x10b258, sampled 0
6c513b5a18:    	mov	w25, w22  // guest 0x10b258, sampled 0
6c513b5a1c:    	str	w25, [x19, #0x28]  // guest 0x10b258, sampled 0
6c513b5a20:    	str	w24, [x19, #0x2c]  // guest 0x10b258, sampled 0
6c513b5a24:    	add	w26, w20, #0x14  // guest 0x10b25a, sampled 0
6c513b5a28:    	mov	w27, w26  // guest 0x10b25a, sampled 0
6c513b5a2c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b25a, sampled 0
6c513b5a30:    	and	x16, x16, x26, lsr #7  // guest 0x10b25a, sampled 0
6c513b5a34:    	add	x17, x17, x16  // guest 0x10b25a, sampled 0
6c513b5a38:    	ldp	x16, x17, [x17]  // guest 0x10b25a, sampled 0
6c513b5a3c:    	and	w30, w26, #0xfffff003  // guest 0x10b25a, sampled 0
6c513b5a40:    	cmp	w16, w30  // guest 0x10b25a, sampled 0
6c513b5a44:    	b.ne	0x6c513b7ab8 <trace+0x2278>  // guest 0x10b25a, sampled 0
6c513b5a48:    	add	x30, x17, w26, uxtw  // guest 0x10b25a, sampled 0
6c513b5a4c:    	ldapr	w2, [x30]  // guest 0x10b25a, sampled 0
6c513b5a50:    	add	w26, w23, #0x7  // guest 0x10b25a, sampled 0
6c513b5a54:    	and	w26, w26, #0x7  // guest 0x10b25a, sampled 0
6c513b5a58:    	lsl	w26, w26, #4  // guest 0x10b25a, sampled 0
6c513b5a5c:    	add	w26, w26, #0x1a0  // guest 0x10b25a, sampled 0
6c513b5a60:    	sxtw	x26, w26  // guest 0x10b25a, sampled 0
6c513b5a64:    	add	x1, x26, x19  // guest 0x10b25a, sampled 0
6c513b5a68:    	mov	x0, x19  // guest 0x10b25a, sampled 0
6c513b5a6c:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b25a, sampled 0
6c513b5a70:    	add	x16, x16, #0x3b4  // guest 0x10b25a, sampled 0
6c513b5a74:    	blr	x16  // guest 0x10b25a, sampled 0
6c513b5a78:    	sub	w23, w23, #0x1  // guest 0x10b25a, sampled 0
6c513b5a7c:    	and	w23, w23, #0x7  // guest 0x10b25a, sampled 0
6c513b5a80:    	str	w23, [x19, #0x188]  // guest 0x10b25a, sampled 0
6c513b5a84:    	sxtw	x26, w23  // guest 0x10b25a, sampled 0
6c513b5a88:    	add	x26, x26, x19  // guest 0x10b25a, sampled 0
6c513b5a8c:    	strb	wzr, [x26, #0x190]  // guest 0x10b25a, sampled 0
6c513b5a90:    	ldr	w26, [x19, #0x74]  // guest 0x10b25a, sampled 0
6c513b5a94:    	strh	w26, [x19, #0x224]  // guest 0x10b25a, sampled 0
6c513b5a98:    	str	w27, [x19, #0x230]  // guest 0x10b25a, sampled 0
6c513b5a9c:    	ldr	w26, [x19, #0x54]  // guest 0x10b25a, sampled 0
6c513b5aa0:    	strh	w26, [x19, #0x222]  // guest 0x10b25a, sampled 0
6c513b5aa4:    	mov	w26, #0xb25a            // =45658  // guest 0x10b25a, sampled 0
6c513b5aa8:    	movk	w26, #0x10, lsl #16  // guest 0x10b25a, sampled 0
6c513b5aac:    	str	w26, [x19, #0x228]  // guest 0x10b25a, sampled 0
6c513b5ab0:    	add	w26, w22, #0x8  // guest 0x10b25d, sampled 0
6c513b5ab4:    	mov	w27, w26  // guest 0x10b25d, sampled 0
6c513b5ab8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b25d, sampled 0
6c513b5abc:    	and	x16, x16, x26, lsr #7  // guest 0x10b25d, sampled 0
6c513b5ac0:    	add	x17, x17, x16  // guest 0x10b25d, sampled 0
6c513b5ac4:    	ldp	x16, x17, [x17]  // guest 0x10b25d, sampled 0
6c513b5ac8:    	and	w30, w26, #0xfffff003  // guest 0x10b25d, sampled 0
6c513b5acc:    	cmp	w16, w30  // guest 0x10b25d, sampled 0
6c513b5ad0:    	b.ne	0x6c513b7ae4 <trace+0x22a4>  // guest 0x10b25d, sampled 0
6c513b5ad4:    	add	x30, x17, w26, uxtw  // guest 0x10b25d, sampled 0
6c513b5ad8:    	ldapr	w2, [x30]  // guest 0x10b25d, sampled 0
6c513b5adc:    	add	x1, x19, #0x258  // guest 0x10b25d, sampled 0
6c513b5ae0:    	mov	x0, x19  // guest 0x10b25d, sampled 0
6c513b5ae4:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b25d, sampled 0
6c513b5ae8:    	add	x16, x16, #0x3b4  // guest 0x10b25d, sampled 0
6c513b5aec:    	blr	x16  // guest 0x10b25d, sampled 0
6c513b5af0:    	lsl	w26, w23, #4  // guest 0x10b25d, sampled 0
6c513b5af4:    	add	w26, w26, #0x1a0  // guest 0x10b25d, sampled 0
6c513b5af8:    	sxtw	x26, w26  // guest 0x10b25d, sampled 0
6c513b5afc:    	add	x1, x26, x19  // guest 0x10b25d, sampled 0
6c513b5b00:    	add	x2, x19, #0x258  // guest 0x10b25d, sampled 0
6c513b5b04:    	mov	x0, x19  // guest 0x10b25d, sampled 0
6c513b5b08:    	adrp	x16, 0x6c97752000 <trace+0x4639d000>  // guest 0x10b25d, sampled 0
6c513b5b0c:    	add	x16, x16, #0xa7c  // guest 0x10b25d, sampled 0
6c513b5b10:    	blr	x16  // guest 0x10b25d, sampled 0
6c513b5b14:    	ldr	w26, [x19, #0x74]  // guest 0x10b25d, sampled 0
6c513b5b18:    	strh	w26, [x19, #0x224]  // guest 0x10b25d, sampled 0
6c513b5b1c:    	str	w27, [x19, #0x230]  // guest 0x10b25d, sampled 0
6c513b5b20:    	ldr	w26, [x19, #0x54]  // guest 0x10b25d, sampled 0
6c513b5b24:    	strh	w26, [x19, #0x222]  // guest 0x10b25d, sampled 0
6c513b5b28:    	mov	w26, #0xb25d            // =45661  // guest 0x10b25d, sampled 0
6c513b5b2c:    	movk	w26, #0x10, lsl #16  // guest 0x10b25d, sampled 0
6c513b5b30:    	str	w26, [x19, #0x228]  // guest 0x10b25d, sampled 0
6c513b5b34:    	add	w26, w23, #0x1  // guest 0x10b260, sampled 0
6c513b5b38:    	and	w26, w26, #0x7  // guest 0x10b260, sampled 0
6c513b5b3c:    	lsl	w26, w26, #4  // guest 0x10b260, sampled 0
6c513b5b40:    	add	w26, w26, #0x1a0  // guest 0x10b260, sampled 0
6c513b5b44:    	sxtw	x26, w26  // guest 0x10b260, sampled 0
6c513b5b48:    	add	x1, x26, x19  // guest 0x10b260, sampled 0
6c513b5b4c:    	lsl	w26, w23, #4  // guest 0x10b260, sampled 0
6c513b5b50:    	add	w26, w26, #0x1a0  // guest 0x10b260, sampled 0
6c513b5b54:    	sxtw	x26, w26  // guest 0x10b260, sampled 0
6c513b5b58:    	add	x2, x26, x19  // guest 0x10b260, sampled 0
6c513b5b5c:    	mov	x0, x19  // guest 0x10b260, sampled 0
6c513b5b60:    	adrp	x16, 0x6c97752000 <trace+0x4639d000>  // guest 0x10b260, sampled 0
6c513b5b64:    	add	x16, x16, #0x9a8  // guest 0x10b260, sampled 0
6c513b5b68:    	blr	x16  // guest 0x10b260, sampled 0
6c513b5b6c:    	sxtw	x26, w23  // guest 0x10b260, sampled 0
6c513b5b70:    	add	x26, x26, x19  // guest 0x10b260, sampled 0
6c513b5b74:    	mov	w27, #0x1               // =1  // guest 0x10b260, sampled 0
6c513b5b78:    	strb	w27, [x26, #0x190]  // guest 0x10b260, sampled 0
6c513b5b7c:    	add	w23, w23, w27  // guest 0x10b260, sampled 0
6c513b5b80:    	and	w23, w23, #0x7  // guest 0x10b260, sampled 0
6c513b5b84:    	str	w23, [x19, #0x188]  // guest 0x10b260, sampled 0
6c513b5b88:    	ldr	w26, [x19, #0x54]  // guest 0x10b260, sampled 0
6c513b5b8c:    	strh	w26, [x19, #0x222]  // guest 0x10b260, sampled 0
6c513b5b90:    	mov	w26, #0xb260            // =45664  // guest 0x10b260, sampled 0
6c513b5b94:    	movk	w26, #0x10, lsl #16  // guest 0x10b260, sampled 0
6c513b5b98:    	str	w26, [x19, #0x228]  // guest 0x10b260, sampled 0
6c513b5b9c:    	add	w26, w20, #0xc  // guest 0x10b262, sampled 0
6c513b5ba0:    	mov	w28, w26  // guest 0x10b262, sampled 0
6c513b5ba4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b262, sampled 0
6c513b5ba8:    	and	x16, x16, x26, lsr #7  // guest 0x10b262, sampled 0
6c513b5bac:    	add	x17, x17, x16  // guest 0x10b262, sampled 0
6c513b5bb0:    	ldp	x16, x17, [x17]  // guest 0x10b262, sampled 0
6c513b5bb4:    	and	w30, w26, #0xfffff003  // guest 0x10b262, sampled 0
6c513b5bb8:    	cmp	w16, w30  // guest 0x10b262, sampled 0
6c513b5bbc:    	b.ne	0x6c513b7b10 <trace+0x22d0>  // guest 0x10b262, sampled 0
6c513b5bc0:    	add	x30, x17, w26, uxtw  // guest 0x10b262, sampled 0
6c513b5bc4:    	ldapr	w2, [x30]  // guest 0x10b262, sampled 0
6c513b5bc8:    	add	w26, w23, #0x7  // guest 0x10b262, sampled 1
6c513b5bcc:    	and	w26, w26, #0x7  // guest 0x10b262, sampled 0
6c513b5bd0:    	lsl	w26, w26, #4  // guest 0x10b262, sampled 0
6c513b5bd4:    	add	w26, w26, #0x1a0  // guest 0x10b262, sampled 0
6c513b5bd8:    	sxtw	x26, w26  // guest 0x10b262, sampled 0
6c513b5bdc:    	add	x1, x26, x19  // guest 0x10b262, sampled 0
6c513b5be0:    	mov	x0, x19  // guest 0x10b262, sampled 0
6c513b5be4:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b262, sampled 0
6c513b5be8:    	add	x16, x16, #0x3b4  // guest 0x10b262, sampled 0
6c513b5bec:    	blr	x16  // guest 0x10b262, sampled 0
6c513b5bf0:    	sub	w23, w23, #0x1  // guest 0x10b262, sampled 0
6c513b5bf4:    	and	w23, w23, #0x7  // guest 0x10b262, sampled 0
6c513b5bf8:    	str	w23, [x19, #0x188]  // guest 0x10b262, sampled 0
6c513b5bfc:    	sxtw	x26, w23  // guest 0x10b262, sampled 0
6c513b5c00:    	add	x26, x26, x19  // guest 0x10b262, sampled 0
6c513b5c04:    	strb	wzr, [x26, #0x190]  // guest 0x10b262, sampled 0
6c513b5c08:    	ldr	w26, [x19, #0x74]  // guest 0x10b262, sampled 0
6c513b5c0c:    	strh	w26, [x19, #0x224]  // guest 0x10b262, sampled 0
6c513b5c10:    	str	w28, [x19, #0x230]  // guest 0x10b262, sampled 0
6c513b5c14:    	ldr	w26, [x19, #0x54]  // guest 0x10b262, sampled 0
6c513b5c18:    	strh	w26, [x19, #0x222]  // guest 0x10b262, sampled 0
6c513b5c1c:    	mov	w26, #0xb262            // =45666  // guest 0x10b262, sampled 0
6c513b5c20:    	movk	w26, #0x10, lsl #16  // guest 0x10b262, sampled 0
6c513b5c24:    	str	w26, [x19, #0x228]  // guest 0x10b262, sampled 0
6c513b5c28:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b265, sampled 0
6c513b5c2c:    	and	x16, x16, x25, lsr #7  // guest 0x10b265, sampled 0
6c513b5c30:    	add	x17, x17, x16  // guest 0x10b265, sampled 0
6c513b5c34:    	ldp	x16, x17, [x17]  // guest 0x10b265, sampled 0
6c513b5c38:    	and	w30, w25, #0xfffff003  // guest 0x10b265, sampled 0
6c513b5c3c:    	cmp	w16, w30  // guest 0x10b265, sampled 0
6c513b5c40:    	b.ne	0x6c513b7b3c <trace+0x22fc>  // guest 0x10b265, sampled 0
6c513b5c44:    	add	x30, x17, w25, uxtw  // guest 0x10b265, sampled 0
6c513b5c48:    	ldapr	w2, [x30]  // guest 0x10b265, sampled 0
6c513b5c4c:    	add	x1, x19, #0x258  // guest 0x10b265, sampled 0
6c513b5c50:    	mov	x0, x19  // guest 0x10b265, sampled 0
6c513b5c54:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b265, sampled 0
6c513b5c58:    	add	x16, x16, #0x3b4  // guest 0x10b265, sampled 0
6c513b5c5c:    	blr	x16  // guest 0x10b265, sampled 0
6c513b5c60:    	lsl	w26, w23, #4  // guest 0x10b265, sampled 0
6c513b5c64:    	add	w26, w26, #0x1a0  // guest 0x10b265, sampled 0
6c513b5c68:    	sxtw	x26, w26  // guest 0x10b265, sampled 0
6c513b5c6c:    	add	x1, x26, x19  // guest 0x10b265, sampled 0
6c513b5c70:    	add	x2, x19, #0x258  // guest 0x10b265, sampled 0
6c513b5c74:    	mov	x0, x19  // guest 0x10b265, sampled 0
6c513b5c78:    	adrp	x16, 0x6c97752000 <trace+0x4639d000>  // guest 0x10b265, sampled 0
6c513b5c7c:    	add	x16, x16, #0xa7c  // guest 0x10b265, sampled 0
6c513b5c80:    	blr	x16  // guest 0x10b265, sampled 0
6c513b5c84:    	ldr	w26, [x19, #0x74]  // guest 0x10b265, sampled 0
6c513b5c88:    	strh	w26, [x19, #0x224]  // guest 0x10b265, sampled 0
6c513b5c8c:    	str	w25, [x19, #0x230]  // guest 0x10b265, sampled 0
6c513b5c90:    	ldr	w26, [x19, #0x54]  // guest 0x10b265, sampled 0
6c513b5c94:    	strh	w26, [x19, #0x222]  // guest 0x10b265, sampled 0
6c513b5c98:    	mov	w26, #0xb265            // =45669  // guest 0x10b265, sampled 0
6c513b5c9c:    	movk	w26, #0x10, lsl #16  // guest 0x10b265, sampled 0
6c513b5ca0:    	str	w26, [x19, #0x228]  // guest 0x10b265, sampled 0
6c513b5ca4:    	add	w26, w23, w27  // guest 0x10b267, sampled 0
6c513b5ca8:    	and	w26, w26, #0x7  // guest 0x10b267, sampled 0
6c513b5cac:    	lsl	w26, w26, #4  // guest 0x10b267, sampled 0
6c513b5cb0:    	add	w26, w26, #0x1a0  // guest 0x10b267, sampled 0
6c513b5cb4:    	sxtw	x26, w26  // guest 0x10b267, sampled 0
6c513b5cb8:    	add	x1, x26, x19  // guest 0x10b267, sampled 0
6c513b5cbc:    	lsl	w26, w23, #4  // guest 0x10b267, sampled 0
6c513b5cc0:    	add	w26, w26, #0x1a0  // guest 0x10b267, sampled 0
6c513b5cc4:    	sxtw	x26, w26  // guest 0x10b267, sampled 0
6c513b5cc8:    	add	x2, x26, x19  // guest 0x10b267, sampled 0
6c513b5ccc:    	mov	x0, x19  // guest 0x10b267, sampled 0
6c513b5cd0:    	adrp	x16, 0x6c97752000 <trace+0x4639d000>  // guest 0x10b267, sampled 0
6c513b5cd4:    	add	x16, x16, #0x9a8  // guest 0x10b267, sampled 0
6c513b5cd8:    	blr	x16  // guest 0x10b267, sampled 0
6c513b5cdc:    	sxtw	x26, w23  // guest 0x10b267, sampled 0
6c513b5ce0:    	add	x26, x26, x19  // guest 0x10b267, sampled 0
6c513b5ce4:    	strb	w27, [x26, #0x190]  // guest 0x10b267, sampled 0
6c513b5ce8:    	add	w23, w23, w27  // guest 0x10b267, sampled 0
6c513b5cec:    	and	w23, w23, #0x7  // guest 0x10b267, sampled 0
6c513b5cf0:    	str	w23, [x19, #0x188]  // guest 0x10b267, sampled 0
6c513b5cf4:    	ldr	w26, [x19, #0x54]  // guest 0x10b267, sampled 0
6c513b5cf8:    	strh	w26, [x19, #0x222]  // guest 0x10b267, sampled 0
6c513b5cfc:    	mov	w26, #0xb267            // =45671  // guest 0x10b267, sampled 0
6c513b5d00:    	movk	w26, #0x10, lsl #16  // guest 0x10b267, sampled 0
6c513b5d04:    	str	w26, [x19, #0x228]  // guest 0x10b267, sampled 0
6c513b5d08:    	add	w26, w20, #0x1c  // guest 0x10b269, sampled 0
6c513b5d0c:    	mov	w28, w26  // guest 0x10b269, sampled 0
6c513b5d10:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b269, sampled 0
6c513b5d14:    	and	x16, x16, x26, lsr #7  // guest 0x10b269, sampled 0
6c513b5d18:    	add	x17, x17, x16  // guest 0x10b269, sampled 0
6c513b5d1c:    	ldp	x16, x17, [x17]  // guest 0x10b269, sampled 0
6c513b5d20:    	and	w30, w26, #0xfffff003  // guest 0x10b269, sampled 0
6c513b5d24:    	cmp	w16, w30  // guest 0x10b269, sampled 0
6c513b5d28:    	b.ne	0x6c513b7b68 <trace+0x2328>  // guest 0x10b269, sampled 0
6c513b5d2c:    	add	x30, x17, w26, uxtw  // guest 0x10b269, sampled 0
6c513b5d30:    	ldapr	w2, [x30]  // guest 0x10b269, sampled 0
6c513b5d34:    	add	w26, w23, #0x7  // guest 0x10b269, sampled 1
6c513b5d38:    	and	w26, w26, #0x7  // guest 0x10b269, sampled 0
6c513b5d3c:    	lsl	w26, w26, #4  // guest 0x10b269, sampled 0
6c513b5d40:    	add	w26, w26, #0x1a0  // guest 0x10b269, sampled 0
6c513b5d44:    	sxtw	x26, w26  // guest 0x10b269, sampled 0
6c513b5d48:    	add	x1, x26, x19  // guest 0x10b269, sampled 0
6c513b5d4c:    	mov	x0, x19  // guest 0x10b269, sampled 0
6c513b5d50:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b269, sampled 0
6c513b5d54:    	add	x16, x16, #0x3b4  // guest 0x10b269, sampled 0
6c513b5d58:    	blr	x16  // guest 0x10b269, sampled 0
6c513b5d5c:    	sub	w23, w23, #0x1  // guest 0x10b269, sampled 0
6c513b5d60:    	and	w23, w23, #0x7  // guest 0x10b269, sampled 0
6c513b5d64:    	str	w23, [x19, #0x188]  // guest 0x10b269, sampled 0
6c513b5d68:    	sxtw	x26, w23  // guest 0x10b269, sampled 0
6c513b5d6c:    	add	x26, x26, x19  // guest 0x10b269, sampled 0
6c513b5d70:    	strb	wzr, [x26, #0x190]  // guest 0x10b269, sampled 0
6c513b5d74:    	ldr	w26, [x19, #0x74]  // guest 0x10b269, sampled 0
6c513b5d78:    	strh	w26, [x19, #0x224]  // guest 0x10b269, sampled 0
6c513b5d7c:    	str	w28, [x19, #0x230]  // guest 0x10b269, sampled 0
6c513b5d80:    	ldr	w26, [x19, #0x54]  // guest 0x10b269, sampled 0
6c513b5d84:    	strh	w26, [x19, #0x222]  // guest 0x10b269, sampled 0
6c513b5d88:    	mov	w26, #0xb269            // =45673  // guest 0x10b269, sampled 0
6c513b5d8c:    	movk	w26, #0x10, lsl #16  // guest 0x10b269, sampled 0
6c513b5d90:    	str	w26, [x19, #0x228]  // guest 0x10b269, sampled 0
6c513b5d94:    	add	w26, w22, #0x4  // guest 0x10b26c, sampled 0
6c513b5d98:    	mov	w28, w26  // guest 0x10b26c, sampled 0
6c513b5d9c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b26c, sampled 0
6c513b5da0:    	and	x16, x16, x26, lsr #7  // guest 0x10b26c, sampled 0
6c513b5da4:    	add	x17, x17, x16  // guest 0x10b26c, sampled 0
6c513b5da8:    	ldp	x16, x17, [x17]  // guest 0x10b26c, sampled 0
6c513b5dac:    	and	w30, w26, #0xfffff003  // guest 0x10b26c, sampled 1
6c513b5db0:    	cmp	w16, w30  // guest 0x10b26c, sampled 0
6c513b5db4:    	b.ne	0x6c513b7b94 <trace+0x2354>  // guest 0x10b26c, sampled 0
6c513b5db8:    	add	x30, x17, w26, uxtw  // guest 0x10b26c, sampled 0
6c513b5dbc:    	ldapr	w2, [x30]  // guest 0x10b26c, sampled 0
6c513b5dc0:    	add	x1, x19, #0x258  // guest 0x10b26c, sampled 0
6c513b5dc4:    	mov	x0, x19  // guest 0x10b26c, sampled 0
6c513b5dc8:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b26c, sampled 0
6c513b5dcc:    	add	x16, x16, #0x3b4  // guest 0x10b26c, sampled 0
6c513b5dd0:    	blr	x16  // guest 0x10b26c, sampled 0
6c513b5dd4:    	lsl	w26, w23, #4  // guest 0x10b26c, sampled 0
6c513b5dd8:    	add	w26, w26, #0x1a0  // guest 0x10b26c, sampled 0
6c513b5ddc:    	sxtw	x26, w26  // guest 0x10b26c, sampled 0
6c513b5de0:    	add	x1, x26, x19  // guest 0x10b26c, sampled 0
6c513b5de4:    	add	x2, x19, #0x258  // guest 0x10b26c, sampled 0
6c513b5de8:    	mov	x0, x19  // guest 0x10b26c, sampled 0
6c513b5dec:    	adrp	x16, 0x6c97752000 <trace+0x4639d000>  // guest 0x10b26c, sampled 0
6c513b5df0:    	add	x16, x16, #0xa7c  // guest 0x10b26c, sampled 0
6c513b5df4:    	blr	x16  // guest 0x10b26c, sampled 0
6c513b5df8:    	ldr	w26, [x19, #0x74]  // guest 0x10b26c, sampled 0
6c513b5dfc:    	strh	w26, [x19, #0x224]  // guest 0x10b26c, sampled 0
6c513b5e00:    	str	w28, [x19, #0x230]  // guest 0x10b26c, sampled 0
6c513b5e04:    	ldr	w26, [x19, #0x54]  // guest 0x10b26c, sampled 0
6c513b5e08:    	strh	w26, [x19, #0x222]  // guest 0x10b26c, sampled 0
6c513b5e0c:    	mov	w26, #0xb26c            // =45676  // guest 0x10b26c, sampled 0
6c513b5e10:    	movk	w26, #0x10, lsl #16  // guest 0x10b26c, sampled 0
6c513b5e14:    	str	w26, [x19, #0x228]  // guest 0x10b26c, sampled 0
6c513b5e18:    	add	w26, w20, #0x20  // guest 0x10b26f, sampled 0
6c513b5e1c:    	mov	w28, w26  // guest 0x10b26f, sampled 0
6c513b5e20:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b26f, sampled 0
6c513b5e24:    	and	x16, x16, x26, lsr #7  // guest 0x10b26f, sampled 0
6c513b5e28:    	add	x17, x17, x16  // guest 0x10b26f, sampled 0
6c513b5e2c:    	ldp	x16, x17, [x17]  // guest 0x10b26f, sampled 0
6c513b5e30:    	and	w30, w26, #0xfffff003  // guest 0x10b26f, sampled 0
6c513b5e34:    	cmp	w16, w30  // guest 0x10b26f, sampled 0
6c513b5e38:    	b.ne	0x6c513b7bc0 <trace+0x2380>  // guest 0x10b26f, sampled 0
6c513b5e3c:    	add	x30, x17, w26, uxtw  // guest 0x10b26f, sampled 0
6c513b5e40:    	ldapr	w2, [x30]  // guest 0x10b26f, sampled 0
6c513b5e44:    	add	w26, w23, #0x7  // guest 0x10b26f, sampled 0
6c513b5e48:    	and	w26, w26, #0x7  // guest 0x10b26f, sampled 0
6c513b5e4c:    	lsl	w26, w26, #4  // guest 0x10b26f, sampled 0
6c513b5e50:    	add	w26, w26, #0x1a0  // guest 0x10b26f, sampled 0
6c513b5e54:    	sxtw	x26, w26  // guest 0x10b26f, sampled 0
6c513b5e58:    	add	x1, x26, x19  // guest 0x10b26f, sampled 0
6c513b5e5c:    	mov	x0, x19  // guest 0x10b26f, sampled 0
6c513b5e60:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b26f, sampled 0
6c513b5e64:    	add	x16, x16, #0x3b4  // guest 0x10b26f, sampled 0
6c513b5e68:    	blr	x16  // guest 0x10b26f, sampled 0
6c513b5e6c:    	sub	w23, w23, #0x1  // guest 0x10b26f, sampled 0
6c513b5e70:    	and	w23, w23, #0x7  // guest 0x10b26f, sampled 0
6c513b5e74:    	str	w23, [x19, #0x188]  // guest 0x10b26f, sampled 0
6c513b5e78:    	sxtw	x26, w23  // guest 0x10b26f, sampled 0
6c513b5e7c:    	add	x26, x26, x19  // guest 0x10b26f, sampled 0
6c513b5e80:    	strb	wzr, [x26, #0x190]  // guest 0x10b26f, sampled 0
6c513b5e84:    	ldr	w26, [x19, #0x74]  // guest 0x10b26f, sampled 0
6c513b5e88:    	strh	w26, [x19, #0x224]  // guest 0x10b26f, sampled 0
6c513b5e8c:    	str	w28, [x19, #0x230]  // guest 0x10b26f, sampled 0
6c513b5e90:    	ldr	w26, [x19, #0x54]  // guest 0x10b26f, sampled 0
6c513b5e94:    	strh	w26, [x19, #0x222]  // guest 0x10b26f, sampled 0
6c513b5e98:    	mov	w26, #0xb26f            // =45679  // guest 0x10b26f, sampled 0
6c513b5e9c:    	movk	w26, #0x10, lsl #16  // guest 0x10b26f, sampled 0
6c513b5ea0:    	str	w26, [x19, #0x228]  // guest 0x10b26f, sampled 0
6c513b5ea4:    	add	w26, w22, #0x8  // guest 0x10b272, sampled 0
6c513b5ea8:    	mov	w28, w26  // guest 0x10b272, sampled 0
6c513b5eac:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b272, sampled 0
6c513b5eb0:    	and	x16, x16, x26, lsr #7  // guest 0x10b272, sampled 0
6c513b5eb4:    	add	x17, x17, x16  // guest 0x10b272, sampled 0
6c513b5eb8:    	ldp	x16, x17, [x17]  // guest 0x10b272, sampled 0
6c513b5ebc:    	and	w30, w26, #0xfffff003  // guest 0x10b272, sampled 0
6c513b5ec0:    	cmp	w16, w30  // guest 0x10b272, sampled 0
6c513b5ec4:    	b.ne	0x6c513b7bec <trace+0x23ac>  // guest 0x10b272, sampled 0
6c513b5ec8:    	add	x30, x17, w26, uxtw  // guest 0x10b272, sampled 0
6c513b5ecc:    	ldapr	w2, [x30]  // guest 0x10b272, sampled 0
6c513b5ed0:    	add	x1, x19, #0x258  // guest 0x10b272, sampled 0
6c513b5ed4:    	mov	x0, x19  // guest 0x10b272, sampled 0
6c513b5ed8:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b272, sampled 0
6c513b5edc:    	add	x16, x16, #0x3b4  // guest 0x10b272, sampled 0
6c513b5ee0:    	blr	x16  // guest 0x10b272, sampled 0
6c513b5ee4:    	lsl	w26, w23, #4  // guest 0x10b272, sampled 0
6c513b5ee8:    	add	w26, w26, #0x1a0  // guest 0x10b272, sampled 0
6c513b5eec:    	sxtw	x26, w26  // guest 0x10b272, sampled 0
6c513b5ef0:    	add	x1, x26, x19  // guest 0x10b272, sampled 0
6c513b5ef4:    	add	x2, x19, #0x258  // guest 0x10b272, sampled 0
6c513b5ef8:    	mov	x0, x19  // guest 0x10b272, sampled 0
6c513b5efc:    	adrp	x16, 0x6c97752000 <trace+0x4639d000>  // guest 0x10b272, sampled 0
6c513b5f00:    	add	x16, x16, #0xa7c  // guest 0x10b272, sampled 0
6c513b5f04:    	blr	x16  // guest 0x10b272, sampled 0
6c513b5f08:    	ldr	w26, [x19, #0x74]  // guest 0x10b272, sampled 0
6c513b5f0c:    	strh	w26, [x19, #0x224]  // guest 0x10b272, sampled 0
6c513b5f10:    	str	w28, [x19, #0x230]  // guest 0x10b272, sampled 0
6c513b5f14:    	ldr	w26, [x19, #0x54]  // guest 0x10b272, sampled 0
6c513b5f18:    	strh	w26, [x19, #0x222]  // guest 0x10b272, sampled 0
6c513b5f1c:    	mov	w26, #0xb272            // =45682  // guest 0x10b272, sampled 0
6c513b5f20:    	movk	w26, #0x10, lsl #16  // guest 0x10b272, sampled 0
6c513b5f24:    	str	w26, [x19, #0x228]  // guest 0x10b272, sampled 0
6c513b5f28:    	add	w26, w23, w27  // guest 0x10b275, sampled 0
6c513b5f2c:    	and	w26, w26, #0x7  // guest 0x10b275, sampled 0
6c513b5f30:    	lsl	w26, w26, #4  // guest 0x10b275, sampled 0
6c513b5f34:    	add	w26, w26, #0x1a0  // guest 0x10b275, sampled 0
6c513b5f38:    	sxtw	x26, w26  // guest 0x10b275, sampled 0
6c513b5f3c:    	add	x1, x26, x19  // guest 0x10b275, sampled 0
6c513b5f40:    	lsl	w26, w23, #4  // guest 0x10b275, sampled 0
6c513b5f44:    	add	w26, w26, #0x1a0  // guest 0x10b275, sampled 0
6c513b5f48:    	sxtw	x26, w26  // guest 0x10b275, sampled 0
6c513b5f4c:    	add	x2, x26, x19  // guest 0x10b275, sampled 0
6c513b5f50:    	mov	x0, x19  // guest 0x10b275, sampled 0
6c513b5f54:    	adrp	x16, 0x6c97752000 <trace+0x4639d000>  // guest 0x10b275, sampled 0
6c513b5f58:    	add	x16, x16, #0x9a8  // guest 0x10b275, sampled 0
6c513b5f5c:    	blr	x16  // guest 0x10b275, sampled 0
6c513b5f60:    	sxtw	x26, w23  // guest 0x10b275, sampled 0
6c513b5f64:    	add	x26, x26, x19  // guest 0x10b275, sampled 0
6c513b5f68:    	strb	w27, [x26, #0x190]  // guest 0x10b275, sampled 0
6c513b5f6c:    	add	w23, w23, w27  // guest 0x10b275, sampled 0
6c513b5f70:    	and	w23, w23, #0x7  // guest 0x10b275, sampled 0
6c513b5f74:    	str	w23, [x19, #0x188]  // guest 0x10b275, sampled 0
6c513b5f78:    	ldr	w26, [x19, #0x54]  // guest 0x10b275, sampled 0
6c513b5f7c:    	strh	w26, [x19, #0x222]  // guest 0x10b275, sampled 0
6c513b5f80:    	mov	w26, #0xb275            // =45685  // guest 0x10b275, sampled 0
6c513b5f84:    	movk	w26, #0x10, lsl #16  // guest 0x10b275, sampled 0
6c513b5f88:    	str	w26, [x19, #0x228]  // guest 0x10b275, sampled 0
6c513b5f8c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b277, sampled 0
6c513b5f90:    	and	x16, x16, x25, lsr #7  // guest 0x10b277, sampled 0
6c513b5f94:    	add	x17, x17, x16  // guest 0x10b277, sampled 0
6c513b5f98:    	ldp	x16, x17, [x17]  // guest 0x10b277, sampled 0
6c513b5f9c:    	and	w30, w25, #0xfffff003  // guest 0x10b277, sampled 1
6c513b5fa0:    	cmp	w16, w30  // guest 0x10b277, sampled 0
6c513b5fa4:    	b.ne	0x6c513b7c18 <trace+0x23d8>  // guest 0x10b277, sampled 0
6c513b5fa8:    	add	x30, x17, w25, uxtw  // guest 0x10b277, sampled 0
6c513b5fac:    	ldapr	w2, [x30]  // guest 0x10b277, sampled 0
6c513b5fb0:    	add	w26, w23, #0x7  // guest 0x10b277, sampled 0
6c513b5fb4:    	and	w26, w26, #0x7  // guest 0x10b277, sampled 0
6c513b5fb8:    	lsl	w26, w26, #4  // guest 0x10b277, sampled 0
6c513b5fbc:    	add	w26, w26, #0x1a0  // guest 0x10b277, sampled 0
6c513b5fc0:    	sxtw	x26, w26  // guest 0x10b277, sampled 0
6c513b5fc4:    	add	x1, x26, x19  // guest 0x10b277, sampled 0
6c513b5fc8:    	mov	x0, x19  // guest 0x10b277, sampled 0
6c513b5fcc:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b277, sampled 0
6c513b5fd0:    	add	x16, x16, #0x3b4  // guest 0x10b277, sampled 0
6c513b5fd4:    	blr	x16  // guest 0x10b277, sampled 0
6c513b5fd8:    	sub	w23, w23, #0x1  // guest 0x10b277, sampled 0
6c513b5fdc:    	and	w23, w23, #0x7  // guest 0x10b277, sampled 0
6c513b5fe0:    	str	w23, [x19, #0x188]  // guest 0x10b277, sampled 0
6c513b5fe4:    	sxtw	x26, w23  // guest 0x10b277, sampled 0
6c513b5fe8:    	add	x26, x26, x19  // guest 0x10b277, sampled 0
6c513b5fec:    	strb	wzr, [x26, #0x190]  // guest 0x10b277, sampled 0
6c513b5ff0:    	ldr	w26, [x19, #0x74]  // guest 0x10b277, sampled 0
6c513b5ff4:    	strh	w26, [x19, #0x224]  // guest 0x10b277, sampled 0
6c513b5ff8:    	str	w25, [x19, #0x230]  // guest 0x10b277, sampled 0
6c513b5ffc:    	ldr	w26, [x19, #0x54]  // guest 0x10b277, sampled 0
6c513b6000:    	strh	w26, [x19, #0x222]  // guest 0x10b277, sampled 0
6c513b6004:    	mov	w26, #0xb277            // =45687  // guest 0x10b277, sampled 0
6c513b6008:    	movk	w26, #0x10, lsl #16  // guest 0x10b277, sampled 0
6c513b600c:    	str	w26, [x19, #0x228]  // guest 0x10b277, sampled 1
6c513b6010:    	add	w26, w20, #0x18  // guest 0x10b279, sampled 0
6c513b6014:    	mov	w28, w26  // guest 0x10b279, sampled 0
6c513b6018:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b279, sampled 0
6c513b601c:    	and	x16, x16, x26, lsr #7  // guest 0x10b279, sampled 0
6c513b6020:    	add	x17, x17, x16  // guest 0x10b279, sampled 0
6c513b6024:    	ldp	x16, x17, [x17]  // guest 0x10b279, sampled 0
6c513b6028:    	and	w30, w26, #0xfffff003  // guest 0x10b279, sampled 0
6c513b602c:    	cmp	w16, w30  // guest 0x10b279, sampled 0
6c513b6030:    	b.ne	0x6c513b7c44 <trace+0x2404>  // guest 0x10b279, sampled 0
6c513b6034:    	add	x30, x17, w26, uxtw  // guest 0x10b279, sampled 0
6c513b6038:    	ldapr	w2, [x30]  // guest 0x10b279, sampled 0
6c513b603c:    	add	x1, x19, #0x258  // guest 0x10b279, sampled 0
6c513b6040:    	mov	x0, x19  // guest 0x10b279, sampled 0
6c513b6044:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b279, sampled 0
6c513b6048:    	add	x16, x16, #0x3b4  // guest 0x10b279, sampled 0
6c513b604c:    	blr	x16  // guest 0x10b279, sampled 0
6c513b6050:    	lsl	w26, w23, #4  // guest 0x10b279, sampled 0
6c513b6054:    	add	w26, w26, #0x1a0  // guest 0x10b279, sampled 0
6c513b6058:    	sxtw	x26, w26  // guest 0x10b279, sampled 0
6c513b605c:    	add	x1, x26, x19  // guest 0x10b279, sampled 0
6c513b6060:    	add	x2, x19, #0x258  // guest 0x10b279, sampled 0
6c513b6064:    	mov	x0, x19  // guest 0x10b279, sampled 0
6c513b6068:    	adrp	x16, 0x6c97752000 <trace+0x4639c000>  // guest 0x10b279, sampled 0
6c513b606c:    	add	x16, x16, #0xa7c  // guest 0x10b279, sampled 0
6c513b6070:    	blr	x16  // guest 0x10b279, sampled 0
6c513b6074:    	ldr	w26, [x19, #0x74]  // guest 0x10b279, sampled 0
6c513b6078:    	strh	w26, [x19, #0x224]  // guest 0x10b279, sampled 0
6c513b607c:    	str	w28, [x19, #0x230]  // guest 0x10b279, sampled 0
6c513b6080:    	ldr	w26, [x19, #0x54]  // guest 0x10b279, sampled 0
6c513b6084:    	strh	w26, [x19, #0x222]  // guest 0x10b279, sampled 0
6c513b6088:    	mov	w26, #0xb279            // =45689  // guest 0x10b279, sampled 0
6c513b608c:    	movk	w26, #0x10, lsl #16  // guest 0x10b279, sampled 0
6c513b6090:    	str	w26, [x19, #0x228]  // guest 0x10b279, sampled 0
6c513b6094:    	add	w26, w23, w27  // guest 0x10b27c, sampled 0
6c513b6098:    	and	w26, w26, #0x7  // guest 0x10b27c, sampled 0
6c513b609c:    	lsl	w26, w26, #4  // guest 0x10b27c, sampled 0
6c513b60a0:    	add	w26, w26, #0x1a0  // guest 0x10b27c, sampled 0
6c513b60a4:    	sxtw	x26, w26  // guest 0x10b27c, sampled 0
6c513b60a8:    	add	x1, x26, x19  // guest 0x10b27c, sampled 0
6c513b60ac:    	lsl	w26, w23, #4  // guest 0x10b27c, sampled 0
6c513b60b0:    	add	w26, w26, #0x1a0  // guest 0x10b27c, sampled 0
6c513b60b4:    	sxtw	x26, w26  // guest 0x10b27c, sampled 0
6c513b60b8:    	add	x2, x26, x19  // guest 0x10b27c, sampled 0
6c513b60bc:    	mov	x0, x19  // guest 0x10b27c, sampled 0
6c513b60c0:    	adrp	x16, 0x6c97752000 <trace+0x4639c000>  // guest 0x10b27c, sampled 0
6c513b60c4:    	add	x16, x16, #0x9a8  // guest 0x10b27c, sampled 0
6c513b60c8:    	blr	x16  // guest 0x10b27c, sampled 0
6c513b60cc:    	sxtw	x26, w23  // guest 0x10b27c, sampled 0
6c513b60d0:    	add	x26, x26, x19  // guest 0x10b27c, sampled 0
6c513b60d4:    	strb	w27, [x26, #0x190]  // guest 0x10b27c, sampled 0
6c513b60d8:    	add	w23, w23, w27  // guest 0x10b27c, sampled 0
6c513b60dc:    	and	w23, w23, #0x7  // guest 0x10b27c, sampled 0
6c513b60e0:    	str	w23, [x19, #0x188]  // guest 0x10b27c, sampled 0
6c513b60e4:    	ldr	w26, [x19, #0x54]  // guest 0x10b27c, sampled 0
6c513b60e8:    	strh	w26, [x19, #0x222]  // guest 0x10b27c, sampled 0
6c513b60ec:    	mov	w26, #0xb27c            // =45692  // guest 0x10b27c, sampled 0
6c513b60f0:    	movk	w26, #0x10, lsl #16  // guest 0x10b27c, sampled 0
6c513b60f4:    	str	w26, [x19, #0x228]  // guest 0x10b27c, sampled 0
6c513b60f8:    	add	w26, w20, #0x28  // guest 0x10b27e, sampled 0
6c513b60fc:    	mov	w28, w26  // guest 0x10b27e, sampled 0
6c513b6100:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b27e, sampled 0
6c513b6104:    	and	x16, x16, x26, lsr #7  // guest 0x10b27e, sampled 0
6c513b6108:    	add	x17, x17, x16  // guest 0x10b27e, sampled 0
6c513b610c:    	ldp	x16, x17, [x17]  // guest 0x10b27e, sampled 0
6c513b6110:    	and	w30, w26, #0xfffff003  // guest 0x10b27e, sampled 0
6c513b6114:    	cmp	w16, w30  // guest 0x10b27e, sampled 0
6c513b6118:    	b.ne	0x6c513b7c70 <trace+0x2430>  // guest 0x10b27e, sampled 0
6c513b611c:    	add	x30, x17, w26, uxtw  // guest 0x10b27e, sampled 0
6c513b6120:    	ldapr	w2, [x30]  // guest 0x10b27e, sampled 0
6c513b6124:    	add	w26, w23, #0x7  // guest 0x10b27e, sampled 0
6c513b6128:    	and	w26, w26, #0x7  // guest 0x10b27e, sampled 0
6c513b612c:    	lsl	w26, w26, #4  // guest 0x10b27e, sampled 0
6c513b6130:    	add	w26, w26, #0x1a0  // guest 0x10b27e, sampled 0
6c513b6134:    	sxtw	x26, w26  // guest 0x10b27e, sampled 0
6c513b6138:    	add	x1, x26, x19  // guest 0x10b27e, sampled 0
6c513b613c:    	mov	x0, x19  // guest 0x10b27e, sampled 0
6c513b6140:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b27e, sampled 0
6c513b6144:    	add	x16, x16, #0x3b4  // guest 0x10b27e, sampled 0
6c513b6148:    	blr	x16  // guest 0x10b27e, sampled 0
6c513b614c:    	sub	w23, w23, #0x1  // guest 0x10b27e, sampled 0
6c513b6150:    	and	w23, w23, #0x7  // guest 0x10b27e, sampled 0
6c513b6154:    	str	w23, [x19, #0x188]  // guest 0x10b27e, sampled 0
6c513b6158:    	sxtw	x26, w23  // guest 0x10b27e, sampled 0
6c513b615c:    	add	x26, x26, x19  // guest 0x10b27e, sampled 0
6c513b6160:    	strb	wzr, [x26, #0x190]  // guest 0x10b27e, sampled 0
6c513b6164:    	ldr	w26, [x19, #0x74]  // guest 0x10b27e, sampled 0
6c513b6168:    	strh	w26, [x19, #0x224]  // guest 0x10b27e, sampled 0
6c513b616c:    	str	w28, [x19, #0x230]  // guest 0x10b27e, sampled 0
6c513b6170:    	ldr	w26, [x19, #0x54]  // guest 0x10b27e, sampled 0
6c513b6174:    	strh	w26, [x19, #0x222]  // guest 0x10b27e, sampled 0
6c513b6178:    	mov	w26, #0xb27e            // =45694  // guest 0x10b27e, sampled 0
6c513b617c:    	movk	w26, #0x10, lsl #16  // guest 0x10b27e, sampled 0
6c513b6180:    	str	w26, [x19, #0x228]  // guest 0x10b27e, sampled 0
6c513b6184:    	add	w26, w22, #0x4  // guest 0x10b281, sampled 0
6c513b6188:    	mov	w28, w26  // guest 0x10b281, sampled 0
6c513b618c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b281, sampled 0
6c513b6190:    	and	x16, x16, x26, lsr #7  // guest 0x10b281, sampled 0
6c513b6194:    	add	x17, x17, x16  // guest 0x10b281, sampled 0
6c513b6198:    	ldp	x16, x17, [x17]  // guest 0x10b281, sampled 0
6c513b619c:    	and	w30, w26, #0xfffff003  // guest 0x10b281, sampled 0
6c513b61a0:    	cmp	w16, w30  // guest 0x10b281, sampled 0
6c513b61a4:    	b.ne	0x6c513b7c9c <trace+0x245c>  // guest 0x10b281, sampled 0
6c513b61a8:    	add	x30, x17, w26, uxtw  // guest 0x10b281, sampled 0
6c513b61ac:    	ldapr	w2, [x30]  // guest 0x10b281, sampled 0
6c513b61b0:    	add	x1, x19, #0x258  // guest 0x10b281, sampled 0
6c513b61b4:    	mov	x0, x19  // guest 0x10b281, sampled 0
6c513b61b8:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b281, sampled 0
6c513b61bc:    	add	x16, x16, #0x3b4  // guest 0x10b281, sampled 0
6c513b61c0:    	blr	x16  // guest 0x10b281, sampled 0
6c513b61c4:    	lsl	w26, w23, #4  // guest 0x10b281, sampled 0
6c513b61c8:    	add	w26, w26, #0x1a0  // guest 0x10b281, sampled 0
6c513b61cc:    	sxtw	x26, w26  // guest 0x10b281, sampled 0
6c513b61d0:    	add	x1, x26, x19  // guest 0x10b281, sampled 0
6c513b61d4:    	add	x2, x19, #0x258  // guest 0x10b281, sampled 0
6c513b61d8:    	mov	x0, x19  // guest 0x10b281, sampled 0
6c513b61dc:    	adrp	x16, 0x6c97752000 <trace+0x4639c000>  // guest 0x10b281, sampled 0
6c513b61e0:    	add	x16, x16, #0xa7c  // guest 0x10b281, sampled 0
6c513b61e4:    	blr	x16  // guest 0x10b281, sampled 0
6c513b61e8:    	ldr	w26, [x19, #0x74]  // guest 0x10b281, sampled 0
6c513b61ec:    	strh	w26, [x19, #0x224]  // guest 0x10b281, sampled 0
6c513b61f0:    	str	w28, [x19, #0x230]  // guest 0x10b281, sampled 0
6c513b61f4:    	ldr	w26, [x19, #0x54]  // guest 0x10b281, sampled 0
6c513b61f8:    	strh	w26, [x19, #0x222]  // guest 0x10b281, sampled 0
6c513b61fc:    	mov	w26, #0xb281            // =45697  // guest 0x10b281, sampled 0
6c513b6200:    	movk	w26, #0x10, lsl #16  // guest 0x10b281, sampled 0
6c513b6204:    	str	w26, [x19, #0x228]  // guest 0x10b281, sampled 0
6c513b6208:    	add	w26, w20, #0x2c  // guest 0x10b284, sampled 0
6c513b620c:    	mov	w28, w26  // guest 0x10b284, sampled 0
6c513b6210:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b284, sampled 0
6c513b6214:    	and	x16, x16, x26, lsr #7  // guest 0x10b284, sampled 0
6c513b6218:    	add	x17, x17, x16  // guest 0x10b284, sampled 0
6c513b621c:    	ldp	x16, x17, [x17]  // guest 0x10b284, sampled 0
6c513b6220:    	and	w30, w26, #0xfffff003  // guest 0x10b284, sampled 0
6c513b6224:    	cmp	w16, w30  // guest 0x10b284, sampled 0
6c513b6228:    	b.ne	0x6c513b7cc8 <trace+0x2488>  // guest 0x10b284, sampled 0
6c513b622c:    	add	x30, x17, w26, uxtw  // guest 0x10b284, sampled 0
6c513b6230:    	ldapr	w2, [x30]  // guest 0x10b284, sampled 0
6c513b6234:    	add	w26, w23, #0x7  // guest 0x10b284, sampled 0
6c513b6238:    	and	w26, w26, #0x7  // guest 0x10b284, sampled 0
6c513b623c:    	lsl	w26, w26, #4  // guest 0x10b284, sampled 0
6c513b6240:    	add	w26, w26, #0x1a0  // guest 0x10b284, sampled 0
6c513b6244:    	sxtw	x26, w26  // guest 0x10b284, sampled 0
6c513b6248:    	add	x1, x26, x19  // guest 0x10b284, sampled 0
6c513b624c:    	mov	x0, x19  // guest 0x10b284, sampled 0
6c513b6250:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b284, sampled 0
6c513b6254:    	add	x16, x16, #0x3b4  // guest 0x10b284, sampled 0
6c513b6258:    	blr	x16  // guest 0x10b284, sampled 0
6c513b625c:    	sub	w23, w23, #0x1  // guest 0x10b284, sampled 0
6c513b6260:    	and	w23, w23, #0x7  // guest 0x10b284, sampled 0
6c513b6264:    	str	w23, [x19, #0x188]  // guest 0x10b284, sampled 0
6c513b6268:    	sxtw	x26, w23  // guest 0x10b284, sampled 0
6c513b626c:    	add	x26, x26, x19  // guest 0x10b284, sampled 0
6c513b6270:    	strb	wzr, [x26, #0x190]  // guest 0x10b284, sampled 0
6c513b6274:    	ldr	w26, [x19, #0x74]  // guest 0x10b284, sampled 0
6c513b6278:    	strh	w26, [x19, #0x224]  // guest 0x10b284, sampled 0
6c513b627c:    	str	w28, [x19, #0x230]  // guest 0x10b284, sampled 0
6c513b6280:    	ldr	w26, [x19, #0x54]  // guest 0x10b284, sampled 0
6c513b6284:    	strh	w26, [x19, #0x222]  // guest 0x10b284, sampled 0
6c513b6288:    	mov	w26, #0xb284            // =45700  // guest 0x10b284, sampled 0
6c513b628c:    	movk	w26, #0x10, lsl #16  // guest 0x10b284, sampled 0
6c513b6290:    	str	w26, [x19, #0x228]  // guest 0x10b284, sampled 0
6c513b6294:    	add	w22, w22, #0x8  // guest 0x10b287, sampled 0
6c513b6298:    	mov	w26, w22  // guest 0x10b287, sampled 0
6c513b629c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b287, sampled 0
6c513b62a0:    	and	x16, x16, x22, lsr #7  // guest 0x10b287, sampled 0
6c513b62a4:    	add	x17, x17, x16  // guest 0x10b287, sampled 0
6c513b62a8:    	ldp	x16, x17, [x17]  // guest 0x10b287, sampled 0
6c513b62ac:    	and	w30, w22, #0xfffff003  // guest 0x10b287, sampled 0
6c513b62b0:    	cmp	w16, w30  // guest 0x10b287, sampled 0
6c513b62b4:    	b.ne	0x6c513b7cf4 <trace+0x24b4>  // guest 0x10b287, sampled 0
6c513b62b8:    	add	x30, x17, w22, uxtw  // guest 0x10b287, sampled 0
6c513b62bc:    	ldapr	w2, [x30]  // guest 0x10b287, sampled 0
6c513b62c0:    	add	x1, x19, #0x258  // guest 0x10b287, sampled 0
6c513b62c4:    	mov	x0, x19  // guest 0x10b287, sampled 0
6c513b62c8:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b287, sampled 0
6c513b62cc:    	add	x16, x16, #0x3b4  // guest 0x10b287, sampled 0
6c513b62d0:    	blr	x16  // guest 0x10b287, sampled 0
6c513b62d4:    	lsl	w22, w23, #4  // guest 0x10b287, sampled 0
6c513b62d8:    	add	w22, w22, #0x1a0  // guest 0x10b287, sampled 0
6c513b62dc:    	sxtw	x22, w22  // guest 0x10b287, sampled 0
6c513b62e0:    	add	x1, x22, x19  // guest 0x10b287, sampled 0
6c513b62e4:    	add	x2, x19, #0x258  // guest 0x10b287, sampled 0
6c513b62e8:    	mov	x0, x19  // guest 0x10b287, sampled 0
6c513b62ec:    	adrp	x16, 0x6c97752000 <trace+0x4639c000>  // guest 0x10b287, sampled 0
6c513b62f0:    	add	x16, x16, #0xa7c  // guest 0x10b287, sampled 0
6c513b62f4:    	blr	x16  // guest 0x10b287, sampled 0
6c513b62f8:    	ldr	w22, [x19, #0x74]  // guest 0x10b287, sampled 0
6c513b62fc:    	strh	w22, [x19, #0x224]  // guest 0x10b287, sampled 0
6c513b6300:    	str	w26, [x19, #0x230]  // guest 0x10b287, sampled 0
6c513b6304:    	ldr	w22, [x19, #0x54]  // guest 0x10b287, sampled 0
6c513b6308:    	strh	w22, [x19, #0x222]  // guest 0x10b287, sampled 0
6c513b630c:    	mov	w22, #0xb287            // =45703  // guest 0x10b287, sampled 0
6c513b6310:    	movk	w22, #0x10, lsl #16  // guest 0x10b287, sampled 0
6c513b6314:    	str	w22, [x19, #0x228]  // guest 0x10b287, sampled 0
6c513b6318:    	add	w22, w23, w27  // guest 0x10b28a, sampled 0
6c513b631c:    	and	w22, w22, #0x7  // guest 0x10b28a, sampled 0
6c513b6320:    	lsl	w22, w22, #4  // guest 0x10b28a, sampled 0
6c513b6324:    	add	w22, w22, #0x1a0  // guest 0x10b28a, sampled 0
6c513b6328:    	sxtw	x22, w22  // guest 0x10b28a, sampled 0
6c513b632c:    	add	x1, x22, x19  // guest 0x10b28a, sampled 0
6c513b6330:    	lsl	w22, w23, #4  // guest 0x10b28a, sampled 0
6c513b6334:    	add	w22, w22, #0x1a0  // guest 0x10b28a, sampled 0
6c513b6338:    	sxtw	x22, w22  // guest 0x10b28a, sampled 0
6c513b633c:    	add	x2, x22, x19  // guest 0x10b28a, sampled 0
6c513b6340:    	mov	x0, x19  // guest 0x10b28a, sampled 0
6c513b6344:    	adrp	x16, 0x6c97752000 <trace+0x4639c000>  // guest 0x10b28a, sampled 0
6c513b6348:    	add	x16, x16, #0x9a8  // guest 0x10b28a, sampled 0
6c513b634c:    	blr	x16  // guest 0x10b28a, sampled 0
6c513b6350:    	sxtw	x22, w23  // guest 0x10b28a, sampled 0
6c513b6354:    	add	x22, x22, x19  // guest 0x10b28a, sampled 0
6c513b6358:    	strb	w27, [x22, #0x190]  // guest 0x10b28a, sampled 0
6c513b635c:    	add	w22, w23, w27  // guest 0x10b28a, sampled 0
6c513b6360:    	and	w22, w22, #0x7  // guest 0x10b28a, sampled 0
6c513b6364:    	str	w22, [x19, #0x188]  // guest 0x10b28a, sampled 0
6c513b6368:    	ldr	w23, [x19, #0x54]  // guest 0x10b28a, sampled 0
6c513b636c:    	strh	w23, [x19, #0x222]  // guest 0x10b28a, sampled 0
6c513b6370:    	mov	w23, #0xb28a            // =45706  // guest 0x10b28a, sampled 0
6c513b6374:    	movk	w23, #0x10, lsl #16  // guest 0x10b28a, sampled 0
6c513b6378:    	str	w23, [x19, #0x228]  // guest 0x10b28a, sampled 0
6c513b637c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b28c, sampled 0
6c513b6380:    	and	x16, x16, x25, lsr #7  // guest 0x10b28c, sampled 0
6c513b6384:    	add	x17, x17, x16  // guest 0x10b28c, sampled 0
6c513b6388:    	ldp	x16, x17, [x17]  // guest 0x10b28c, sampled 0
6c513b638c:    	and	w30, w25, #0xfffff003  // guest 0x10b28c, sampled 1
6c513b6390:    	cmp	w16, w30  // guest 0x10b28c, sampled 0
6c513b6394:    	b.ne	0x6c513b7d20 <trace+0x24e0>  // guest 0x10b28c, sampled 0
6c513b6398:    	add	x30, x17, w25, uxtw  // guest 0x10b28c, sampled 0
6c513b639c:    	ldapr	w2, [x30]  // guest 0x10b28c, sampled 0
6c513b63a0:    	add	w23, w22, #0x7  // guest 0x10b28c, sampled 0
6c513b63a4:    	and	w23, w23, #0x7  // guest 0x10b28c, sampled 0
6c513b63a8:    	lsl	w23, w23, #4  // guest 0x10b28c, sampled 0
6c513b63ac:    	add	w23, w23, #0x1a0  // guest 0x10b28c, sampled 0
6c513b63b0:    	sxtw	x23, w23  // guest 0x10b28c, sampled 0
6c513b63b4:    	add	x1, x23, x19  // guest 0x10b28c, sampled 0
6c513b63b8:    	mov	x0, x19  // guest 0x10b28c, sampled 0
6c513b63bc:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b28c, sampled 0
6c513b63c0:    	add	x16, x16, #0x3b4  // guest 0x10b28c, sampled 0
6c513b63c4:    	blr	x16  // guest 0x10b28c, sampled 0
6c513b63c8:    	sub	w22, w22, #0x1  // guest 0x10b28c, sampled 0
6c513b63cc:    	and	w22, w22, #0x7  // guest 0x10b28c, sampled 0
6c513b63d0:    	str	w22, [x19, #0x188]  // guest 0x10b28c, sampled 0
6c513b63d4:    	sxtw	x23, w22  // guest 0x10b28c, sampled 0
6c513b63d8:    	add	x23, x23, x19  // guest 0x10b28c, sampled 0
6c513b63dc:    	strb	wzr, [x23, #0x190]  // guest 0x10b28c, sampled 0
6c513b63e0:    	ldr	w23, [x19, #0x74]  // guest 0x10b28c, sampled 0
6c513b63e4:    	strh	w23, [x19, #0x224]  // guest 0x10b28c, sampled 0
6c513b63e8:    	str	w25, [x19, #0x230]  // guest 0x10b28c, sampled 0
6c513b63ec:    	ldr	w23, [x19, #0x54]  // guest 0x10b28c, sampled 0
6c513b63f0:    	strh	w23, [x19, #0x222]  // guest 0x10b28c, sampled 0
6c513b63f4:    	mov	w23, #0xb28c            // =45708  // guest 0x10b28c, sampled 0
6c513b63f8:    	movk	w23, #0x10, lsl #16  // guest 0x10b28c, sampled 0
6c513b63fc:    	str	w23, [x19, #0x228]  // guest 0x10b28c, sampled 0
6c513b6400:    	add	w21, w21, #0x118  // guest 0x10b28e, sampled 0
6c513b6404:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b28e, sampled 0
6c513b6408:    	and	x16, x16, x21, lsr #7  // guest 0x10b28e, sampled 0
6c513b640c:    	add	x17, x17, x16  // guest 0x10b28e, sampled 0
6c513b6410:    	ldp	x16, x17, [x17]  // guest 0x10b28e, sampled 0
6c513b6414:    	and	w30, w21, #0xfffff003  // guest 0x10b28e, sampled 0
6c513b6418:    	cmp	w16, w30  // guest 0x10b28e, sampled 0
6c513b641c:    	b.ne	0x6c513b7d4c <trace+0x250c>  // guest 0x10b28e, sampled 0
6c513b6420:    	add	x30, x17, w21, uxtw  // guest 0x10b28e, sampled 0
6c513b6424:    	ldapr	w21, [x30]  // guest 0x10b28e, sampled 0
6c513b6428:    	str	w21, [x19, #0x4]  // guest 0x10b28e, sampled 0
6c513b642c:    	add	w20, w20, #0x24  // guest 0x10b294, sampled 0
6c513b6430:    	mov	w23, w20  // guest 0x10b294, sampled 0
6c513b6434:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b294, sampled 0
6c513b6438:    	and	x16, x16, x20, lsr #7  // guest 0x10b294, sampled 0
6c513b643c:    	add	x17, x17, x16  // guest 0x10b294, sampled 0
6c513b6440:    	ldp	x16, x17, [x17]  // guest 0x10b294, sampled 0
6c513b6444:    	and	w30, w20, #0xfffff003  // guest 0x10b294, sampled 0
6c513b6448:    	cmp	w16, w30  // guest 0x10b294, sampled 0
6c513b644c:    	b.ne	0x6c513b7d78 <trace+0x2538>  // guest 0x10b294, sampled 0
6c513b6450:    	add	x30, x17, w20, uxtw  // guest 0x10b294, sampled 0
6c513b6454:    	ldapr	w2, [x30]  // guest 0x10b294, sampled 0
6c513b6458:    	add	x1, x19, #0x258  // guest 0x10b294, sampled 0
6c513b645c:    	mov	x0, x19  // guest 0x10b294, sampled 0
6c513b6460:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b294, sampled 0
6c513b6464:    	add	x16, x16, #0x3b4  // guest 0x10b294, sampled 0
6c513b6468:    	blr	x16  // guest 0x10b294, sampled 0
6c513b646c:    	lsl	w20, w22, #4  // guest 0x10b294, sampled 0
6c513b6470:    	add	w20, w20, #0x1a0  // guest 0x10b294, sampled 0
6c513b6474:    	sxtw	x20, w20  // guest 0x10b294, sampled 0
6c513b6478:    	add	x1, x20, x19  // guest 0x10b294, sampled 0
6c513b647c:    	add	x2, x19, #0x258  // guest 0x10b294, sampled 0
6c513b6480:    	mov	x0, x19  // guest 0x10b294, sampled 0
6c513b6484:    	adrp	x16, 0x6c97752000 <trace+0x4639c000>  // guest 0x10b294, sampled 0
6c513b6488:    	add	x16, x16, #0xa7c  // guest 0x10b294, sampled 0
6c513b648c:    	blr	x16  // guest 0x10b294, sampled 0
6c513b6490:    	ldr	w20, [x19, #0x74]  // guest 0x10b294, sampled 0
6c513b6494:    	strh	w20, [x19, #0x224]  // guest 0x10b294, sampled 0
6c513b6498:    	str	w23, [x19, #0x230]  // guest 0x10b294, sampled 0
6c513b649c:    	ldr	w20, [x19, #0x54]  // guest 0x10b294, sampled 0
6c513b64a0:    	strh	w20, [x19, #0x222]  // guest 0x10b294, sampled 0
6c513b64a4:    	mov	w20, #0xb294            // =45716  // guest 0x10b294, sampled 0
6c513b64a8:    	movk	w20, #0x10, lsl #16  // guest 0x10b294, sampled 0
6c513b64ac:    	str	w20, [x19, #0x228]  // guest 0x10b294, sampled 0
6c513b64b0:    	add	w20, w21, w24  // guest 0x10b297, sampled 0
6c513b64b4:    	str	w20, [x19, #0x4]  // guest 0x10b297, sampled 0
6c513b64b8:    	str	w20, [x19, #0x28]  // guest 0x10b297, sampled 0
6c513b64bc:    	add	w20, w22, w27  // guest 0x10b299, sampled 0
6c513b64c0:    	and	w20, w20, #0x7  // guest 0x10b299, sampled 0
6c513b64c4:    	lsl	w20, w20, #4  // guest 0x10b299, sampled 0
6c513b64c8:    	add	w20, w20, #0x1a0  // guest 0x10b299, sampled 0
6c513b64cc:    	sxtw	x20, w20  // guest 0x10b299, sampled 0
6c513b64d0:    	add	x1, x20, x19  // guest 0x10b299, sampled 0
6c513b64d4:    	lsl	w20, w22, #4  // guest 0x10b299, sampled 0
6c513b64d8:    	add	w20, w20, #0x1a0  // guest 0x10b299, sampled 0
6c513b64dc:    	sxtw	x20, w20  // guest 0x10b299, sampled 0
6c513b64e0:    	add	x2, x20, x19  // guest 0x10b299, sampled 0
6c513b64e4:    	mov	x0, x19  // guest 0x10b299, sampled 0
6c513b64e8:    	adrp	x16, 0x6c97752000 <trace+0x4639c000>  // guest 0x10b299, sampled 0
6c513b64ec:    	add	x16, x16, #0x9a8  // guest 0x10b299, sampled 0
6c513b64f0:    	blr	x16  // guest 0x10b299, sampled 0
6c513b64f4:    	sxtw	x20, w22  // guest 0x10b299, sampled 0
6c513b64f8:    	add	x20, x20, x19  // guest 0x10b299, sampled 0
6c513b64fc:    	strb	w27, [x20, #0x190]  // guest 0x10b299, sampled 0
6c513b6500:    	add	w20, w22, w27  // guest 0x10b299, sampled 0
6c513b6504:    	and	w20, w20, #0x7  // guest 0x10b299, sampled 0
6c513b6508:    	str	w20, [x19, #0x188]  // guest 0x10b299, sampled 0
6c513b650c:    	ldr	w21, [x19, #0x54]  // guest 0x10b299, sampled 0
6c513b6510:    	strh	w21, [x19, #0x222]  // guest 0x10b299, sampled 0
6c513b6514:    	mov	w21, #0xb299            // =45721  // guest 0x10b299, sampled 0
6c513b6518:    	movk	w21, #0x10, lsl #16  // guest 0x10b299, sampled 0
6c513b651c:    	str	w21, [x19, #0x228]  // guest 0x10b299, sampled 0
6c513b6520:    	ldr	w21, [x19, #0x10]  // guest 0x10b29b, sampled 0
6c513b6524:    	add	w21, w21, #0xdc  // guest 0x10b29b, sampled 0
6c513b6528:    	mov	w22, w21  // guest 0x10b29b, sampled 0
6c513b652c:    	lsl	w23, w20, #4  // guest 0x10b29b, sampled 0
6c513b6530:    	add	w23, w23, #0x1a0  // guest 0x10b29b, sampled 0
6c513b6534:    	sxtw	x23, w23  // guest 0x10b29b, sampled 0
6c513b6538:    	add	x1, x23, x19  // guest 0x10b29b, sampled 0
6c513b653c:    	mov	x0, x19  // guest 0x10b29b, sampled 0
6c513b6540:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b29b, sampled 0
6c513b6544:    	add	x16, x16, #0x4f0  // guest 0x10b29b, sampled 0
6c513b6548:    	blr	x16  // guest 0x10b29b, sampled 0
6c513b654c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b29b, sampled 0
6c513b6550:    	and	x16, x16, x21, lsr #7  // guest 0x10b29b, sampled 0
6c513b6554:    	add	x17, x17, x16  // guest 0x10b29b, sampled 0
6c513b6558:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b29b, sampled 0
6c513b655c:    	and	w30, w21, #0xfffff003  // guest 0x10b29b, sampled 0
6c513b6560:    	cmp	w16, w30  // guest 0x10b29b, sampled 0
6c513b6564:    	b.ne	0x6c513b7da4 <trace+0x2564>  // guest 0x10b29b, sampled 0
6c513b6568:    	add	x30, x17, w21, uxtw  // guest 0x10b29b, sampled 0
6c513b656c:    	stlr	w0, [x30]  // guest 0x10b29b, sampled 0
6c513b6570:    	sxtw	x21, w20  // guest 0x10b29b, sampled 0
6c513b6574:    	add	x21, x21, x19  // guest 0x10b29b, sampled 0
6c513b6578:    	strb	w27, [x21, #0x190]  // guest 0x10b29b, sampled 0
6c513b657c:    	add	w20, w20, w27  // guest 0x10b29b, sampled 0
6c513b6580:    	and	w20, w20, #0x7  // guest 0x10b29b, sampled 0
6c513b6584:    	str	w20, [x19, #0x188]  // guest 0x10b29b, sampled 0
6c513b6588:    	ldr	w20, [x19, #0x64]  // guest 0x10b29b, sampled 0
6c513b658c:    	strh	w20, [x19, #0x224]  // guest 0x10b29b, sampled 0
6c513b6590:    	str	w22, [x19, #0x230]  // guest 0x10b29b, sampled 0
6c513b6594:    	ldr	w20, [x19, #0x54]  // guest 0x10b29b, sampled 0
6c513b6598:    	strh	w20, [x19, #0x222]  // guest 0x10b29b, sampled 0
6c513b659c:    	mov	w20, #0xb29b            // =45723  // guest 0x10b29b, sampled 0
6c513b65a0:    	movk	w20, #0x10, lsl #16  // guest 0x10b29b, sampled 0
6c513b65a4:    	str	w20, [x19, #0x228]  // guest 0x10b29b, sampled 0
6c513b65a8:    	mov	w1, w27  // guest 0x10b2a2, sampled 0
6c513b65ac:    	mov	x0, x19  // guest 0x10b2a2, sampled 0
6c513b65b0:    	adrp	x16, 0x6c97752000 <trace+0x4639c000>  // guest 0x10b2a2, sampled 0
6c513b65b4:    	add	x16, x16, #0x4d0  // guest 0x10b2a2, sampled 0
6c513b65b8:    	blr	x16  // guest 0x10b2a2, sampled 0
6c513b65bc:    	ldr	w20, [x19, #0x54]  // guest 0x10b2a2, sampled 0
6c513b65c0:    	strh	w20, [x19, #0x222]  // guest 0x10b2a2, sampled 0
6c513b65c4:    	mov	w20, #0xb2a2            // =45730  // guest 0x10b2a2, sampled 0
6c513b65c8:    	movk	w20, #0x10, lsl #16  // guest 0x10b2a2, sampled 0
6c513b65cc:    	str	w20, [x19, #0x228]  // guest 0x10b2a2, sampled 0
6c513b65d0:    	ldr	w20, [x19]  // guest 0x10b2a4, sampled 0
6c513b65d4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2a4, sampled 0
6c513b65d8:    	and	x16, x16, x20, lsr #7  // guest 0x10b2a4, sampled 0
6c513b65dc:    	add	x17, x17, x16  // guest 0x10b2a4, sampled 0
6c513b65e0:    	ldp	x16, x17, [x17]  // guest 0x10b2a4, sampled 0
6c513b65e4:    	and	w30, w20, #0xfffff003  // guest 0x10b2a4, sampled 0
6c513b65e8:    	cmp	w16, w30  // guest 0x10b2a4, sampled 0
6c513b65ec:    	b.ne	0x6c513b7dd0 <trace+0x2590>  // guest 0x10b2a4, sampled 0
6c513b65f0:    	add	x30, x17, w20, uxtw  // guest 0x10b2a4, sampled 0
6c513b65f4:    	ldapr	w2, [x30]  // guest 0x10b2a4, sampled 0
6c513b65f8:    	add	x1, x19, #0x258  // guest 0x10b2a4, sampled 0
6c513b65fc:    	mov	x0, x19  // guest 0x10b2a4, sampled 0
6c513b6600:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b2a4, sampled 0
6c513b6604:    	add	x16, x16, #0x3b4  // guest 0x10b2a4, sampled 0
6c513b6608:    	blr	x16  // guest 0x10b2a4, sampled 0
6c513b660c:    	ldr	w21, [x19, #0x188]  // guest 0x10b2a4, sampled 0
6c513b6610:    	lsl	w22, w21, #4  // guest 0x10b2a4, sampled 0
6c513b6614:    	add	w22, w22, #0x1a0  // guest 0x10b2a4, sampled 0
6c513b6618:    	sxtw	x22, w22  // guest 0x10b2a4, sampled 0
6c513b661c:    	add	x1, x22, x19  // guest 0x10b2a4, sampled 0
6c513b6620:    	add	x2, x19, #0x258  // guest 0x10b2a4, sampled 0
6c513b6624:    	mov	x0, x19  // guest 0x10b2a4, sampled 0
6c513b6628:    	adrp	x16, 0x6c97752000 <trace+0x4639c000>  // guest 0x10b2a4, sampled 0
6c513b662c:    	add	x16, x16, #0x9a8  // guest 0x10b2a4, sampled 0
6c513b6630:    	blr	x16  // guest 0x10b2a4, sampled 0
6c513b6634:    	ldr	w22, [x19, #0x74]  // guest 0x10b2a4, sampled 0
6c513b6638:    	strh	w22, [x19, #0x224]  // guest 0x10b2a4, sampled 0
6c513b663c:    	str	w20, [x19, #0x230]  // guest 0x10b2a4, sampled 0
6c513b6640:    	ldr	w22, [x19, #0x54]  // guest 0x10b2a4, sampled 0
6c513b6644:    	strh	w22, [x19, #0x222]  // guest 0x10b2a4, sampled 0
6c513b6648:    	mov	w22, #0xb2a4            // =45732  // guest 0x10b2a4, sampled 0
6c513b664c:    	movk	w22, #0x10, lsl #16  // guest 0x10b2a4, sampled 0
6c513b6650:    	str	w22, [x19, #0x228]  // guest 0x10b2a4, sampled 0
6c513b6654:    	ldr	w22, [x19, #0x10]  // guest 0x10b2a6, sampled 0
6c513b6658:    	add	w23, w22, #0x44  // guest 0x10b2a6, sampled 0
6c513b665c:    	mov	w24, w23  // guest 0x10b2a6, sampled 0
6c513b6660:    	lsl	w25, w21, #4  // guest 0x10b2a6, sampled 0
6c513b6664:    	add	w25, w25, #0x1a0  // guest 0x10b2a6, sampled 0
6c513b6668:    	sxtw	x25, w25  // guest 0x10b2a6, sampled 0
6c513b666c:    	add	x1, x25, x19  // guest 0x10b2a6, sampled 0
6c513b6670:    	mov	x0, x19  // guest 0x10b2a6, sampled 0
6c513b6674:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b2a6, sampled 0
6c513b6678:    	add	x16, x16, #0x4f0  // guest 0x10b2a6, sampled 0
6c513b667c:    	blr	x16  // guest 0x10b2a6, sampled 0
6c513b6680:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2a6, sampled 0
6c513b6684:    	and	x16, x16, x23, lsr #7  // guest 0x10b2a6, sampled 0
6c513b6688:    	add	x17, x17, x16  // guest 0x10b2a6, sampled 0
6c513b668c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b2a6, sampled 0
6c513b6690:    	and	w30, w23, #0xfffff003  // guest 0x10b2a6, sampled 0
6c513b6694:    	cmp	w16, w30  // guest 0x10b2a6, sampled 0
6c513b6698:    	b.ne	0x6c513b7dfc <trace+0x25bc>  // guest 0x10b2a6, sampled 0
6c513b669c:    	add	x30, x17, w23, uxtw  // guest 0x10b2a6, sampled 0
6c513b66a0:    	stlr	w0, [x30]  // guest 0x10b2a6, sampled 0
6c513b66a4:    	sxtw	x23, w21  // guest 0x10b2a6, sampled 0
6c513b66a8:    	add	x23, x23, x19  // guest 0x10b2a6, sampled 0
6c513b66ac:    	strb	w27, [x23, #0x190]  // guest 0x10b2a6, sampled 0
6c513b66b0:    	add	w21, w21, w27  // guest 0x10b2a6, sampled 0
6c513b66b4:    	and	w21, w21, #0x7  // guest 0x10b2a6, sampled 0
6c513b66b8:    	str	w21, [x19, #0x188]  // guest 0x10b2a6, sampled 0
6c513b66bc:    	ldr	w23, [x19, #0x64]  // guest 0x10b2a6, sampled 0
6c513b66c0:    	strh	w23, [x19, #0x224]  // guest 0x10b2a6, sampled 0
6c513b66c4:    	str	w24, [x19, #0x230]  // guest 0x10b2a6, sampled 0
6c513b66c8:    	ldr	w23, [x19, #0x54]  // guest 0x10b2a6, sampled 0
6c513b66cc:    	strh	w23, [x19, #0x222]  // guest 0x10b2a6, sampled 0
6c513b66d0:    	mov	w23, #0xb2a6            // =45734  // guest 0x10b2a6, sampled 0
6c513b66d4:    	movk	w23, #0x10, lsl #16  // guest 0x10b2a6, sampled 0
6c513b66d8:    	str	w23, [x19, #0x228]  // guest 0x10b2a6, sampled 0
6c513b66dc:    	add	w23, w20, #0x4  // guest 0x10b2aa, sampled 0
6c513b66e0:    	mov	w24, w23  // guest 0x10b2aa, sampled 0
6c513b66e4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2aa, sampled 0
6c513b66e8:    	and	x16, x16, x23, lsr #7  // guest 0x10b2aa, sampled 0
6c513b66ec:    	add	x17, x17, x16  // guest 0x10b2aa, sampled 0
6c513b66f0:    	ldp	x16, x17, [x17]  // guest 0x10b2aa, sampled 0
6c513b66f4:    	and	w30, w23, #0xfffff003  // guest 0x10b2aa, sampled 0
6c513b66f8:    	cmp	w16, w30  // guest 0x10b2aa, sampled 0
6c513b66fc:    	b.ne	0x6c513b7e28 <trace+0x25e8>  // guest 0x10b2aa, sampled 0
6c513b6700:    	add	x30, x17, w23, uxtw  // guest 0x10b2aa, sampled 0
6c513b6704:    	ldapr	w2, [x30]  // guest 0x10b2aa, sampled 0
6c513b6708:    	add	x1, x19, #0x258  // guest 0x10b2aa, sampled 0
6c513b670c:    	mov	x0, x19  // guest 0x10b2aa, sampled 0
6c513b6710:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b2aa, sampled 0
6c513b6714:    	add	x16, x16, #0x3b4  // guest 0x10b2aa, sampled 0
6c513b6718:    	blr	x16  // guest 0x10b2aa, sampled 0
6c513b671c:    	lsl	w23, w21, #4  // guest 0x10b2aa, sampled 0
6c513b6720:    	add	w23, w23, #0x1a0  // guest 0x10b2aa, sampled 0
6c513b6724:    	sxtw	x23, w23  // guest 0x10b2aa, sampled 0
6c513b6728:    	add	x1, x23, x19  // guest 0x10b2aa, sampled 0
6c513b672c:    	add	x2, x19, #0x258  // guest 0x10b2aa, sampled 0
6c513b6730:    	mov	x0, x19  // guest 0x10b2aa, sampled 0
6c513b6734:    	adrp	x16, 0x6c97752000 <trace+0x4639c000>  // guest 0x10b2aa, sampled 0
6c513b6738:    	add	x16, x16, #0x9a8  // guest 0x10b2aa, sampled 0
6c513b673c:    	blr	x16  // guest 0x10b2aa, sampled 0
6c513b6740:    	ldr	w23, [x19, #0x74]  // guest 0x10b2aa, sampled 0
6c513b6744:    	strh	w23, [x19, #0x224]  // guest 0x10b2aa, sampled 0
6c513b6748:    	str	w24, [x19, #0x230]  // guest 0x10b2aa, sampled 0
6c513b674c:    	ldr	w23, [x19, #0x54]  // guest 0x10b2aa, sampled 0
6c513b6750:    	strh	w23, [x19, #0x222]  // guest 0x10b2aa, sampled 1
6c513b6754:    	mov	w23, #0xb2aa            // =45738  // guest 0x10b2aa, sampled 0
6c513b6758:    	movk	w23, #0x10, lsl #16  // guest 0x10b2aa, sampled 0
6c513b675c:    	str	w23, [x19, #0x228]  // guest 0x10b2aa, sampled 0
6c513b6760:    	add	w23, w22, #0x48  // guest 0x10b2ad, sampled 0
6c513b6764:    	mov	w24, w23  // guest 0x10b2ad, sampled 0
6c513b6768:    	lsl	w25, w21, #4  // guest 0x10b2ad, sampled 0
6c513b676c:    	add	w25, w25, #0x1a0  // guest 0x10b2ad, sampled 0
6c513b6770:    	sxtw	x25, w25  // guest 0x10b2ad, sampled 0
6c513b6774:    	add	x1, x25, x19  // guest 0x10b2ad, sampled 0
6c513b6778:    	mov	x0, x19  // guest 0x10b2ad, sampled 0
6c513b677c:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b2ad, sampled 0
6c513b6780:    	add	x16, x16, #0x4f0  // guest 0x10b2ad, sampled 0
6c513b6784:    	blr	x16  // guest 0x10b2ad, sampled 0
6c513b6788:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2ad, sampled 0
6c513b678c:    	and	x16, x16, x23, lsr #7  // guest 0x10b2ad, sampled 0
6c513b6790:    	add	x17, x17, x16  // guest 0x10b2ad, sampled 0
6c513b6794:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b2ad, sampled 0
6c513b6798:    	and	w30, w23, #0xfffff003  // guest 0x10b2ad, sampled 0
6c513b679c:    	cmp	w16, w30  // guest 0x10b2ad, sampled 0
6c513b67a0:    	b.ne	0x6c513b7e54 <trace+0x2614>  // guest 0x10b2ad, sampled 0
6c513b67a4:    	add	x30, x17, w23, uxtw  // guest 0x10b2ad, sampled 0
6c513b67a8:    	stlr	w0, [x30]  // guest 0x10b2ad, sampled 0
6c513b67ac:    	sxtw	x23, w21  // guest 0x10b2ad, sampled 0
6c513b67b0:    	add	x23, x23, x19  // guest 0x10b2ad, sampled 0
6c513b67b4:    	strb	w27, [x23, #0x190]  // guest 0x10b2ad, sampled 0
6c513b67b8:    	add	w21, w21, w27  // guest 0x10b2ad, sampled 0
6c513b67bc:    	and	w21, w21, #0x7  // guest 0x10b2ad, sampled 0
6c513b67c0:    	str	w21, [x19, #0x188]  // guest 0x10b2ad, sampled 0
6c513b67c4:    	ldr	w23, [x19, #0x64]  // guest 0x10b2ad, sampled 0
6c513b67c8:    	strh	w23, [x19, #0x224]  // guest 0x10b2ad, sampled 0
6c513b67cc:    	str	w24, [x19, #0x230]  // guest 0x10b2ad, sampled 0
6c513b67d0:    	ldr	w23, [x19, #0x54]  // guest 0x10b2ad, sampled 0
6c513b67d4:    	strh	w23, [x19, #0x222]  // guest 0x10b2ad, sampled 0
6c513b67d8:    	mov	w23, #0xb2ad            // =45741  // guest 0x10b2ad, sampled 0
6c513b67dc:    	movk	w23, #0x10, lsl #16  // guest 0x10b2ad, sampled 0
6c513b67e0:    	str	w23, [x19, #0x228]  // guest 0x10b2ad, sampled 0
6c513b67e4:    	add	w23, w22, #0xdc  // guest 0x10b2b1, sampled 0
6c513b67e8:    	mov	w24, w23  // guest 0x10b2b1, sampled 0
6c513b67ec:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2b1, sampled 1
6c513b67f0:    	and	x16, x16, x23, lsr #7  // guest 0x10b2b1, sampled 0
6c513b67f4:    	add	x17, x17, x16  // guest 0x10b2b1, sampled 0
6c513b67f8:    	ldp	x16, x17, [x17]  // guest 0x10b2b1, sampled 0
6c513b67fc:    	and	w30, w23, #0xfffff003  // guest 0x10b2b1, sampled 0
6c513b6800:    	cmp	w16, w30  // guest 0x10b2b1, sampled 0
6c513b6804:    	b.ne	0x6c513b7e80 <trace+0x2640>  // guest 0x10b2b1, sampled 0
6c513b6808:    	add	x30, x17, w23, uxtw  // guest 0x10b2b1, sampled 0
6c513b680c:    	ldapr	w2, [x30]  // guest 0x10b2b1, sampled 0
6c513b6810:    	add	w23, w21, #0x7  // guest 0x10b2b1, sampled 0
6c513b6814:    	and	w23, w23, #0x7  // guest 0x10b2b1, sampled 0
6c513b6818:    	lsl	w23, w23, #4  // guest 0x10b2b1, sampled 0
6c513b681c:    	add	w23, w23, #0x1a0  // guest 0x10b2b1, sampled 0
6c513b6820:    	sxtw	x23, w23  // guest 0x10b2b1, sampled 0
6c513b6824:    	add	x1, x23, x19  // guest 0x10b2b1, sampled 0
6c513b6828:    	mov	x0, x19  // guest 0x10b2b1, sampled 0
6c513b682c:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b2b1, sampled 0
6c513b6830:    	add	x16, x16, #0x3b4  // guest 0x10b2b1, sampled 0
6c513b6834:    	blr	x16  // guest 0x10b2b1, sampled 0
6c513b6838:    	sub	w21, w21, #0x1  // guest 0x10b2b1, sampled 0
6c513b683c:    	and	w21, w21, #0x7  // guest 0x10b2b1, sampled 0
6c513b6840:    	str	w21, [x19, #0x188]  // guest 0x10b2b1, sampled 0
6c513b6844:    	sxtw	x23, w21  // guest 0x10b2b1, sampled 0
6c513b6848:    	add	x23, x23, x19  // guest 0x10b2b1, sampled 0
6c513b684c:    	strb	wzr, [x23, #0x190]  // guest 0x10b2b1, sampled 0
6c513b6850:    	ldr	w23, [x19, #0x64]  // guest 0x10b2b1, sampled 0
6c513b6854:    	strh	w23, [x19, #0x224]  // guest 0x10b2b1, sampled 0
6c513b6858:    	str	w24, [x19, #0x230]  // guest 0x10b2b1, sampled 0
6c513b685c:    	ldr	w23, [x19, #0x54]  // guest 0x10b2b1, sampled 0
6c513b6860:    	strh	w23, [x19, #0x222]  // guest 0x10b2b1, sampled 0
6c513b6864:    	mov	w23, #0xb2b1            // =45745  // guest 0x10b2b1, sampled 0
6c513b6868:    	movk	w23, #0x10, lsl #16  // guest 0x10b2b1, sampled 0
6c513b686c:    	str	w23, [x19, #0x228]  // guest 0x10b2b1, sampled 0
6c513b6870:    	add	w23, w20, #0x8  // guest 0x10b2b8, sampled 0
6c513b6874:    	mov	w24, w23  // guest 0x10b2b8, sampled 0
6c513b6878:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2b8, sampled 0
6c513b687c:    	and	x16, x16, x23, lsr #7  // guest 0x10b2b8, sampled 0
6c513b6880:    	add	x17, x17, x16  // guest 0x10b2b8, sampled 0
6c513b6884:    	ldp	x16, x17, [x17]  // guest 0x10b2b8, sampled 0
6c513b6888:    	and	w30, w23, #0xfffff003  // guest 0x10b2b8, sampled 0
6c513b688c:    	cmp	w16, w30  // guest 0x10b2b8, sampled 0
6c513b6890:    	b.ne	0x6c513b7eac <trace+0x266c>  // guest 0x10b2b8, sampled 0
6c513b6894:    	add	x30, x17, w23, uxtw  // guest 0x10b2b8, sampled 0
6c513b6898:    	ldapr	w2, [x30]  // guest 0x10b2b8, sampled 0
6c513b689c:    	add	x1, x19, #0x258  // guest 0x10b2b8, sampled 0
6c513b68a0:    	mov	x0, x19  // guest 0x10b2b8, sampled 0
6c513b68a4:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b2b8, sampled 0
6c513b68a8:    	add	x16, x16, #0x3b4  // guest 0x10b2b8, sampled 0
6c513b68ac:    	blr	x16  // guest 0x10b2b8, sampled 0
6c513b68b0:    	lsl	w23, w21, #4  // guest 0x10b2b8, sampled 0
6c513b68b4:    	add	w23, w23, #0x1a0  // guest 0x10b2b8, sampled 0
6c513b68b8:    	sxtw	x23, w23  // guest 0x10b2b8, sampled 0
6c513b68bc:    	add	x1, x23, x19  // guest 0x10b2b8, sampled 0
6c513b68c0:    	add	x2, x19, #0x258  // guest 0x10b2b8, sampled 0
6c513b68c4:    	mov	x0, x19  // guest 0x10b2b8, sampled 0
6c513b68c8:    	adrp	x16, 0x6c97752000 <trace+0x4639d000>  // guest 0x10b2b8, sampled 0
6c513b68cc:    	add	x16, x16, #0x9a8  // guest 0x10b2b8, sampled 0
6c513b68d0:    	blr	x16  // guest 0x10b2b8, sampled 0
6c513b68d4:    	ldr	w23, [x19, #0x74]  // guest 0x10b2b8, sampled 0
6c513b68d8:    	strh	w23, [x19, #0x224]  // guest 0x10b2b8, sampled 0
6c513b68dc:    	str	w24, [x19, #0x230]  // guest 0x10b2b8, sampled 0
6c513b68e0:    	ldr	w23, [x19, #0x54]  // guest 0x10b2b8, sampled 0
6c513b68e4:    	strh	w23, [x19, #0x222]  // guest 0x10b2b8, sampled 0
6c513b68e8:    	mov	w23, #0xb2b8            // =45752  // guest 0x10b2b8, sampled 0
6c513b68ec:    	movk	w23, #0x10, lsl #16  // guest 0x10b2b8, sampled 0
6c513b68f0:    	str	w23, [x19, #0x228]  // guest 0x10b2b8, sampled 0
6c513b68f4:    	add	w23, w22, #0x4c  // guest 0x10b2bb, sampled 0
6c513b68f8:    	mov	w24, w23  // guest 0x10b2bb, sampled 0
6c513b68fc:    	lsl	w25, w21, #4  // guest 0x10b2bb, sampled 0
6c513b6900:    	add	w25, w25, #0x1a0  // guest 0x10b2bb, sampled 0
6c513b6904:    	sxtw	x25, w25  // guest 0x10b2bb, sampled 0
6c513b6908:    	add	x1, x25, x19  // guest 0x10b2bb, sampled 0
6c513b690c:    	mov	x0, x19  // guest 0x10b2bb, sampled 0
6c513b6910:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b2bb, sampled 0
6c513b6914:    	add	x16, x16, #0x4f0  // guest 0x10b2bb, sampled 0
6c513b6918:    	blr	x16  // guest 0x10b2bb, sampled 0
6c513b691c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2bb, sampled 0
6c513b6920:    	and	x16, x16, x23, lsr #7  // guest 0x10b2bb, sampled 0
6c513b6924:    	add	x17, x17, x16  // guest 0x10b2bb, sampled 0
6c513b6928:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b2bb, sampled 0
6c513b692c:    	and	w30, w23, #0xfffff003  // guest 0x10b2bb, sampled 0
6c513b6930:    	cmp	w16, w30  // guest 0x10b2bb, sampled 0
6c513b6934:    	b.ne	0x6c513b7ed8 <trace+0x2698>  // guest 0x10b2bb, sampled 0
6c513b6938:    	add	x30, x17, w23, uxtw  // guest 0x10b2bb, sampled 0
6c513b693c:    	stlr	w0, [x30]  // guest 0x10b2bb, sampled 0
6c513b6940:    	sxtw	x23, w21  // guest 0x10b2bb, sampled 0
6c513b6944:    	add	x23, x23, x19  // guest 0x10b2bb, sampled 0
6c513b6948:    	strb	w27, [x23, #0x190]  // guest 0x10b2bb, sampled 0
6c513b694c:    	add	w21, w21, w27  // guest 0x10b2bb, sampled 0
6c513b6950:    	and	w21, w21, #0x7  // guest 0x10b2bb, sampled 0
6c513b6954:    	str	w21, [x19, #0x188]  // guest 0x10b2bb, sampled 0
6c513b6958:    	ldr	w23, [x19, #0x64]  // guest 0x10b2bb, sampled 0
6c513b695c:    	strh	w23, [x19, #0x224]  // guest 0x10b2bb, sampled 0
6c513b6960:    	str	w24, [x19, #0x230]  // guest 0x10b2bb, sampled 0
6c513b6964:    	ldr	w23, [x19, #0x54]  // guest 0x10b2bb, sampled 0
6c513b6968:    	strh	w23, [x19, #0x222]  // guest 0x10b2bb, sampled 0
6c513b696c:    	mov	w23, #0xb2bb            // =45755  // guest 0x10b2bb, sampled 0
6c513b6970:    	movk	w23, #0x10, lsl #16  // guest 0x10b2bb, sampled 0
6c513b6974:    	str	w23, [x19, #0x228]  // guest 0x10b2bb, sampled 0
6c513b6978:    	add	w23, w20, #0x14  // guest 0x10b2bf, sampled 0
6c513b697c:    	mov	w24, w23  // guest 0x10b2bf, sampled 0
6c513b6980:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2bf, sampled 0
6c513b6984:    	and	x16, x16, x23, lsr #7  // guest 0x10b2bf, sampled 0
6c513b6988:    	add	x17, x17, x16  // guest 0x10b2bf, sampled 0
6c513b698c:    	ldp	x16, x17, [x17]  // guest 0x10b2bf, sampled 0
6c513b6990:    	and	w30, w23, #0xfffff003  // guest 0x10b2bf, sampled 0
6c513b6994:    	cmp	w16, w30  // guest 0x10b2bf, sampled 0
6c513b6998:    	b.ne	0x6c513b7f04 <trace+0x26c4>  // guest 0x10b2bf, sampled 0
6c513b699c:    	add	x30, x17, w23, uxtw  // guest 0x10b2bf, sampled 0
6c513b69a0:    	ldapr	w2, [x30]  // guest 0x10b2bf, sampled 0
6c513b69a4:    	add	w23, w21, #0x7  // guest 0x10b2bf, sampled 0
6c513b69a8:    	and	w23, w23, #0x7  // guest 0x10b2bf, sampled 0
6c513b69ac:    	lsl	w23, w23, #4  // guest 0x10b2bf, sampled 0
6c513b69b0:    	add	w23, w23, #0x1a0  // guest 0x10b2bf, sampled 0
6c513b69b4:    	sxtw	x23, w23  // guest 0x10b2bf, sampled 0
6c513b69b8:    	add	x1, x23, x19  // guest 0x10b2bf, sampled 0
6c513b69bc:    	mov	x0, x19  // guest 0x10b2bf, sampled 0
6c513b69c0:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b2bf, sampled 0
6c513b69c4:    	add	x16, x16, #0x3b4  // guest 0x10b2bf, sampled 0
6c513b69c8:    	blr	x16  // guest 0x10b2bf, sampled 0
6c513b69cc:    	sub	w21, w21, #0x1  // guest 0x10b2bf, sampled 0
6c513b69d0:    	and	w21, w21, #0x7  // guest 0x10b2bf, sampled 0
6c513b69d4:    	str	w21, [x19, #0x188]  // guest 0x10b2bf, sampled 0
6c513b69d8:    	sxtw	x23, w21  // guest 0x10b2bf, sampled 0
6c513b69dc:    	add	x23, x23, x19  // guest 0x10b2bf, sampled 0
6c513b69e0:    	strb	wzr, [x23, #0x190]  // guest 0x10b2bf, sampled 0
6c513b69e4:    	ldr	w23, [x19, #0x74]  // guest 0x10b2bf, sampled 0
6c513b69e8:    	strh	w23, [x19, #0x224]  // guest 0x10b2bf, sampled 0
6c513b69ec:    	str	w24, [x19, #0x230]  // guest 0x10b2bf, sampled 0
6c513b69f0:    	ldr	w23, [x19, #0x54]  // guest 0x10b2bf, sampled 0
6c513b69f4:    	strh	w23, [x19, #0x222]  // guest 0x10b2bf, sampled 0
6c513b69f8:    	mov	w23, #0xb2bf            // =45759  // guest 0x10b2bf, sampled 0
6c513b69fc:    	movk	w23, #0x10, lsl #16  // guest 0x10b2bf, sampled 0
6c513b6a00:    	str	w23, [x19, #0x228]  // guest 0x10b2bf, sampled 0
6c513b6a04:    	ldr	w23, [x19, #0x4]  // guest 0x10b2c2, sampled 0
6c513b6a08:    	add	w24, w23, #0x8  // guest 0x10b2c2, sampled 0
6c513b6a0c:    	mov	w25, w24  // guest 0x10b2c2, sampled 0
6c513b6a10:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2c2, sampled 0
6c513b6a14:    	and	x16, x16, x24, lsr #7  // guest 0x10b2c2, sampled 0
6c513b6a18:    	add	x17, x17, x16  // guest 0x10b2c2, sampled 0
6c513b6a1c:    	ldp	x16, x17, [x17]  // guest 0x10b2c2, sampled 0
6c513b6a20:    	and	w30, w24, #0xfffff003  // guest 0x10b2c2, sampled 0
6c513b6a24:    	cmp	w16, w30  // guest 0x10b2c2, sampled 0
6c513b6a28:    	b.ne	0x6c513b7f30 <trace+0x26f0>  // guest 0x10b2c2, sampled 0
6c513b6a2c:    	add	x30, x17, w24, uxtw  // guest 0x10b2c2, sampled 0
6c513b6a30:    	ldapr	w2, [x30]  // guest 0x10b2c2, sampled 0
6c513b6a34:    	add	x1, x19, #0x258  // guest 0x10b2c2, sampled 0
6c513b6a38:    	mov	x0, x19  // guest 0x10b2c2, sampled 0
6c513b6a3c:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b2c2, sampled 0
6c513b6a40:    	add	x16, x16, #0x3b4  // guest 0x10b2c2, sampled 0
6c513b6a44:    	blr	x16  // guest 0x10b2c2, sampled 0
6c513b6a48:    	lsl	w24, w21, #4  // guest 0x10b2c2, sampled 0
6c513b6a4c:    	add	w24, w24, #0x1a0  // guest 0x10b2c2, sampled 0
6c513b6a50:    	sxtw	x24, w24  // guest 0x10b2c2, sampled 0
6c513b6a54:    	add	x1, x24, x19  // guest 0x10b2c2, sampled 0
6c513b6a58:    	add	x2, x19, #0x258  // guest 0x10b2c2, sampled 0
6c513b6a5c:    	mov	x0, x19  // guest 0x10b2c2, sampled 0
6c513b6a60:    	adrp	x16, 0x6c97752000 <trace+0x4639d000>  // guest 0x10b2c2, sampled 0
6c513b6a64:    	add	x16, x16, #0xa7c  // guest 0x10b2c2, sampled 0
6c513b6a68:    	blr	x16  // guest 0x10b2c2, sampled 0
6c513b6a6c:    	ldr	w24, [x19, #0x74]  // guest 0x10b2c2, sampled 0
6c513b6a70:    	strh	w24, [x19, #0x224]  // guest 0x10b2c2, sampled 0
6c513b6a74:    	str	w25, [x19, #0x230]  // guest 0x10b2c2, sampled 0
6c513b6a78:    	ldr	w24, [x19, #0x54]  // guest 0x10b2c2, sampled 0
6c513b6a7c:    	strh	w24, [x19, #0x222]  // guest 0x10b2c2, sampled 0
6c513b6a80:    	mov	w24, #0xb2c2            // =45762  // guest 0x10b2c2, sampled 0
6c513b6a84:    	movk	w24, #0x10, lsl #16  // guest 0x10b2c2, sampled 0
6c513b6a88:    	str	w24, [x19, #0x228]  // guest 0x10b2c2, sampled 0
6c513b6a8c:    	add	w24, w20, #0x10  // guest 0x10b2c5, sampled 0
6c513b6a90:    	mov	w25, w24  // guest 0x10b2c5, sampled 0
6c513b6a94:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2c5, sampled 0
6c513b6a98:    	and	x16, x16, x24, lsr #7  // guest 0x10b2c5, sampled 0
6c513b6a9c:    	add	x17, x17, x16  // guest 0x10b2c5, sampled 0
6c513b6aa0:    	ldp	x16, x17, [x17]  // guest 0x10b2c5, sampled 0
6c513b6aa4:    	and	w30, w24, #0xfffff003  // guest 0x10b2c5, sampled 0
6c513b6aa8:    	cmp	w16, w30  // guest 0x10b2c5, sampled 0
6c513b6aac:    	b.ne	0x6c513b7f5c <trace+0x271c>  // guest 0x10b2c5, sampled 0
6c513b6ab0:    	add	x30, x17, w24, uxtw  // guest 0x10b2c5, sampled 0
6c513b6ab4:    	ldapr	w2, [x30]  // guest 0x10b2c5, sampled 0
6c513b6ab8:    	add	w24, w21, #0x7  // guest 0x10b2c5, sampled 0
6c513b6abc:    	and	w24, w24, #0x7  // guest 0x10b2c5, sampled 0
6c513b6ac0:    	lsl	w24, w24, #4  // guest 0x10b2c5, sampled 0
6c513b6ac4:    	add	w24, w24, #0x1a0  // guest 0x10b2c5, sampled 0
6c513b6ac8:    	sxtw	x24, w24  // guest 0x10b2c5, sampled 0
6c513b6acc:    	add	x1, x24, x19  // guest 0x10b2c5, sampled 0
6c513b6ad0:    	mov	x0, x19  // guest 0x10b2c5, sampled 0
6c513b6ad4:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b2c5, sampled 0
6c513b6ad8:    	add	x16, x16, #0x3b4  // guest 0x10b2c5, sampled 0
6c513b6adc:    	blr	x16  // guest 0x10b2c5, sampled 0
6c513b6ae0:    	sub	w21, w21, #0x1  // guest 0x10b2c5, sampled 0
6c513b6ae4:    	and	w21, w21, #0x7  // guest 0x10b2c5, sampled 0
6c513b6ae8:    	str	w21, [x19, #0x188]  // guest 0x10b2c5, sampled 0
6c513b6aec:    	sxtw	x24, w21  // guest 0x10b2c5, sampled 0
6c513b6af0:    	add	x24, x24, x19  // guest 0x10b2c5, sampled 0
6c513b6af4:    	strb	wzr, [x24, #0x190]  // guest 0x10b2c5, sampled 0
6c513b6af8:    	ldr	w24, [x19, #0x74]  // guest 0x10b2c5, sampled 0
6c513b6afc:    	strh	w24, [x19, #0x224]  // guest 0x10b2c5, sampled 0
6c513b6b00:    	str	w25, [x19, #0x230]  // guest 0x10b2c5, sampled 0
6c513b6b04:    	ldr	w24, [x19, #0x54]  // guest 0x10b2c5, sampled 0
6c513b6b08:    	strh	w24, [x19, #0x222]  // guest 0x10b2c5, sampled 0
6c513b6b0c:    	mov	w24, #0xb2c5            // =45765  // guest 0x10b2c5, sampled 0
6c513b6b10:    	movk	w24, #0x10, lsl #16  // guest 0x10b2c5, sampled 0
6c513b6b14:    	str	w24, [x19, #0x228]  // guest 0x10b2c5, sampled 0
6c513b6b18:    	add	w24, w23, #0x4  // guest 0x10b2c8, sampled 0
6c513b6b1c:    	mov	w25, w24  // guest 0x10b2c8, sampled 0
6c513b6b20:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2c8, sampled 0
6c513b6b24:    	and	x16, x16, x24, lsr #7  // guest 0x10b2c8, sampled 0
6c513b6b28:    	add	x17, x17, x16  // guest 0x10b2c8, sampled 0
6c513b6b2c:    	ldp	x16, x17, [x17]  // guest 0x10b2c8, sampled 0
6c513b6b30:    	and	w30, w24, #0xfffff003  // guest 0x10b2c8, sampled 0
6c513b6b34:    	cmp	w16, w30  // guest 0x10b2c8, sampled 0
6c513b6b38:    	b.ne	0x6c513b7f88 <trace+0x2748>  // guest 0x10b2c8, sampled 0
6c513b6b3c:    	add	x30, x17, w24, uxtw  // guest 0x10b2c8, sampled 0
6c513b6b40:    	ldapr	w2, [x30]  // guest 0x10b2c8, sampled 0
6c513b6b44:    	add	x1, x19, #0x258  // guest 0x10b2c8, sampled 0
6c513b6b48:    	mov	x0, x19  // guest 0x10b2c8, sampled 0
6c513b6b4c:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b2c8, sampled 0
6c513b6b50:    	add	x16, x16, #0x3b4  // guest 0x10b2c8, sampled 0
6c513b6b54:    	blr	x16  // guest 0x10b2c8, sampled 0
6c513b6b58:    	lsl	w24, w21, #4  // guest 0x10b2c8, sampled 0
6c513b6b5c:    	add	w24, w24, #0x1a0  // guest 0x10b2c8, sampled 0
6c513b6b60:    	sxtw	x24, w24  // guest 0x10b2c8, sampled 0
6c513b6b64:    	add	x1, x24, x19  // guest 0x10b2c8, sampled 0
6c513b6b68:    	add	x2, x19, #0x258  // guest 0x10b2c8, sampled 0
6c513b6b6c:    	mov	x0, x19  // guest 0x10b2c8, sampled 0
6c513b6b70:    	adrp	x16, 0x6c97752000 <trace+0x4639d000>  // guest 0x10b2c8, sampled 0
6c513b6b74:    	add	x16, x16, #0xa7c  // guest 0x10b2c8, sampled 0
6c513b6b78:    	blr	x16  // guest 0x10b2c8, sampled 0
6c513b6b7c:    	ldr	w24, [x19, #0x74]  // guest 0x10b2c8, sampled 0
6c513b6b80:    	strh	w24, [x19, #0x224]  // guest 0x10b2c8, sampled 0
6c513b6b84:    	str	w25, [x19, #0x230]  // guest 0x10b2c8, sampled 0
6c513b6b88:    	ldr	w24, [x19, #0x54]  // guest 0x10b2c8, sampled 0
6c513b6b8c:    	strh	w24, [x19, #0x222]  // guest 0x10b2c8, sampled 0
6c513b6b90:    	mov	w24, #0xb2c8            // =45768  // guest 0x10b2c8, sampled 0
6c513b6b94:    	movk	w24, #0x10, lsl #16  // guest 0x10b2c8, sampled 0
6c513b6b98:    	str	w24, [x19, #0x228]  // guest 0x10b2c8, sampled 0
6c513b6b9c:    	add	w24, w21, w27  // guest 0x10b2cb, sampled 0
6c513b6ba0:    	and	w24, w24, #0x7  // guest 0x10b2cb, sampled 0
6c513b6ba4:    	lsl	w24, w24, #4  // guest 0x10b2cb, sampled 0
6c513b6ba8:    	add	w24, w24, #0x1a0  // guest 0x10b2cb, sampled 0
6c513b6bac:    	sxtw	x24, w24  // guest 0x10b2cb, sampled 0
6c513b6bb0:    	add	x1, x24, x19  // guest 0x10b2cb, sampled 0
6c513b6bb4:    	lsl	w24, w21, #4  // guest 0x10b2cb, sampled 0
6c513b6bb8:    	add	w24, w24, #0x1a0  // guest 0x10b2cb, sampled 0
6c513b6bbc:    	sxtw	x24, w24  // guest 0x10b2cb, sampled 0
6c513b6bc0:    	add	x2, x24, x19  // guest 0x10b2cb, sampled 0
6c513b6bc4:    	mov	x0, x19  // guest 0x10b2cb, sampled 0
6c513b6bc8:    	adrp	x16, 0x6c97752000 <trace+0x4639d000>  // guest 0x10b2cb, sampled 0
6c513b6bcc:    	add	x16, x16, #0x9a8  // guest 0x10b2cb, sampled 0
6c513b6bd0:    	blr	x16  // guest 0x10b2cb, sampled 0
6c513b6bd4:    	sxtw	x24, w21  // guest 0x10b2cb, sampled 0
6c513b6bd8:    	add	x24, x24, x19  // guest 0x10b2cb, sampled 0
6c513b6bdc:    	strb	w27, [x24, #0x190]  // guest 0x10b2cb, sampled 0
6c513b6be0:    	add	w21, w21, w27  // guest 0x10b2cb, sampled 0
6c513b6be4:    	and	w21, w21, #0x7  // guest 0x10b2cb, sampled 0
6c513b6be8:    	str	w21, [x19, #0x188]  // guest 0x10b2cb, sampled 0
6c513b6bec:    	ldr	w24, [x19, #0x54]  // guest 0x10b2cb, sampled 0
6c513b6bf0:    	strh	w24, [x19, #0x222]  // guest 0x10b2cb, sampled 0
6c513b6bf4:    	mov	w24, #0xb2cb            // =45771  // guest 0x10b2cb, sampled 0
6c513b6bf8:    	movk	w24, #0x10, lsl #16  // guest 0x10b2cb, sampled 0
6c513b6bfc:    	str	w24, [x19, #0x228]  // guest 0x10b2cb, sampled 0
6c513b6c00:    	add	w24, w20, #0xc  // guest 0x10b2cd, sampled 0
6c513b6c04:    	mov	w25, w24  // guest 0x10b2cd, sampled 0
6c513b6c08:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2cd, sampled 0
6c513b6c0c:    	and	x16, x16, x24, lsr #7  // guest 0x10b2cd, sampled 0
6c513b6c10:    	add	x17, x17, x16  // guest 0x10b2cd, sampled 0
6c513b6c14:    	ldp	x16, x17, [x17]  // guest 0x10b2cd, sampled 0
6c513b6c18:    	and	w30, w24, #0xfffff003  // guest 0x10b2cd, sampled 0
6c513b6c1c:    	cmp	w16, w30  // guest 0x10b2cd, sampled 0
6c513b6c20:    	b.ne	0x6c513b7fb4 <trace+0x2774>  // guest 0x10b2cd, sampled 0
6c513b6c24:    	add	x30, x17, w24, uxtw  // guest 0x10b2cd, sampled 0
6c513b6c28:    	ldapr	w2, [x30]  // guest 0x10b2cd, sampled 0
6c513b6c2c:    	add	w24, w21, #0x7  // guest 0x10b2cd, sampled 0
6c513b6c30:    	and	w24, w24, #0x7  // guest 0x10b2cd, sampled 0
6c513b6c34:    	lsl	w24, w24, #4  // guest 0x10b2cd, sampled 0
6c513b6c38:    	add	w24, w24, #0x1a0  // guest 0x10b2cd, sampled 0
6c513b6c3c:    	sxtw	x24, w24  // guest 0x10b2cd, sampled 0
6c513b6c40:    	add	x1, x24, x19  // guest 0x10b2cd, sampled 0
6c513b6c44:    	mov	x0, x19  // guest 0x10b2cd, sampled 0
6c513b6c48:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b2cd, sampled 0
6c513b6c4c:    	add	x16, x16, #0x3b4  // guest 0x10b2cd, sampled 0
6c513b6c50:    	blr	x16  // guest 0x10b2cd, sampled 0
6c513b6c54:    	sub	w21, w21, #0x1  // guest 0x10b2cd, sampled 0
6c513b6c58:    	and	w21, w21, #0x7  // guest 0x10b2cd, sampled 0
6c513b6c5c:    	str	w21, [x19, #0x188]  // guest 0x10b2cd, sampled 0
6c513b6c60:    	sxtw	x24, w21  // guest 0x10b2cd, sampled 0
6c513b6c64:    	add	x24, x24, x19  // guest 0x10b2cd, sampled 0
6c513b6c68:    	strb	wzr, [x24, #0x190]  // guest 0x10b2cd, sampled 0
6c513b6c6c:    	ldr	w24, [x19, #0x74]  // guest 0x10b2cd, sampled 0
6c513b6c70:    	strh	w24, [x19, #0x224]  // guest 0x10b2cd, sampled 0
6c513b6c74:    	str	w25, [x19, #0x230]  // guest 0x10b2cd, sampled 0
6c513b6c78:    	ldr	w24, [x19, #0x54]  // guest 0x10b2cd, sampled 0
6c513b6c7c:    	strh	w24, [x19, #0x222]  // guest 0x10b2cd, sampled 0
6c513b6c80:    	mov	w24, #0xb2cd            // =45773  // guest 0x10b2cd, sampled 0
6c513b6c84:    	movk	w24, #0x10, lsl #16  // guest 0x10b2cd, sampled 0
6c513b6c88:    	str	w24, [x19, #0x228]  // guest 0x10b2cd, sampled 0
6c513b6c8c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2d0, sampled 0
6c513b6c90:    	and	x16, x16, x23, lsr #7  // guest 0x10b2d0, sampled 0
6c513b6c94:    	add	x17, x17, x16  // guest 0x10b2d0, sampled 0
6c513b6c98:    	ldp	x16, x17, [x17]  // guest 0x10b2d0, sampled 0
6c513b6c9c:    	and	w30, w23, #0xfffff003  // guest 0x10b2d0, sampled 0
6c513b6ca0:    	cmp	w16, w30  // guest 0x10b2d0, sampled 0
6c513b6ca4:    	b.ne	0x6c513b7fe0 <trace+0x27a0>  // guest 0x10b2d0, sampled 0
6c513b6ca8:    	add	x30, x17, w23, uxtw  // guest 0x10b2d0, sampled 0
6c513b6cac:    	ldapr	w2, [x30]  // guest 0x10b2d0, sampled 0
6c513b6cb0:    	add	x1, x19, #0x258  // guest 0x10b2d0, sampled 0
6c513b6cb4:    	mov	x0, x19  // guest 0x10b2d0, sampled 0
6c513b6cb8:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b2d0, sampled 0
6c513b6cbc:    	add	x16, x16, #0x3b4  // guest 0x10b2d0, sampled 0
6c513b6cc0:    	blr	x16  // guest 0x10b2d0, sampled 0
6c513b6cc4:    	lsl	w24, w21, #4  // guest 0x10b2d0, sampled 0
6c513b6cc8:    	add	w24, w24, #0x1a0  // guest 0x10b2d0, sampled 0
6c513b6ccc:    	sxtw	x24, w24  // guest 0x10b2d0, sampled 0
6c513b6cd0:    	add	x1, x24, x19  // guest 0x10b2d0, sampled 0
6c513b6cd4:    	add	x2, x19, #0x258  // guest 0x10b2d0, sampled 0
6c513b6cd8:    	mov	x0, x19  // guest 0x10b2d0, sampled 0
6c513b6cdc:    	adrp	x16, 0x6c97752000 <trace+0x4639d000>  // guest 0x10b2d0, sampled 0
6c513b6ce0:    	add	x16, x16, #0xa7c  // guest 0x10b2d0, sampled 0
6c513b6ce4:    	blr	x16  // guest 0x10b2d0, sampled 0
6c513b6ce8:    	ldr	w24, [x19, #0x74]  // guest 0x10b2d0, sampled 0
6c513b6cec:    	strh	w24, [x19, #0x224]  // guest 0x10b2d0, sampled 0
6c513b6cf0:    	str	w23, [x19, #0x230]  // guest 0x10b2d0, sampled 0
6c513b6cf4:    	ldr	w24, [x19, #0x54]  // guest 0x10b2d0, sampled 0
6c513b6cf8:    	strh	w24, [x19, #0x222]  // guest 0x10b2d0, sampled 0
6c513b6cfc:    	mov	w24, #0xb2d0            // =45776  // guest 0x10b2d0, sampled 0
6c513b6d00:    	movk	w24, #0x10, lsl #16  // guest 0x10b2d0, sampled 0
6c513b6d04:    	str	w24, [x19, #0x228]  // guest 0x10b2d0, sampled 0
6c513b6d08:    	add	w24, w21, w27  // guest 0x10b2d2, sampled 0
6c513b6d0c:    	and	w24, w24, #0x7  // guest 0x10b2d2, sampled 0
6c513b6d10:    	lsl	w24, w24, #4  // guest 0x10b2d2, sampled 0
6c513b6d14:    	add	w24, w24, #0x1a0  // guest 0x10b2d2, sampled 0
6c513b6d18:    	sxtw	x24, w24  // guest 0x10b2d2, sampled 0
6c513b6d1c:    	add	x1, x24, x19  // guest 0x10b2d2, sampled 0
6c513b6d20:    	lsl	w24, w21, #4  // guest 0x10b2d2, sampled 0
6c513b6d24:    	add	w24, w24, #0x1a0  // guest 0x10b2d2, sampled 0
6c513b6d28:    	sxtw	x24, w24  // guest 0x10b2d2, sampled 0
6c513b6d2c:    	add	x2, x24, x19  // guest 0x10b2d2, sampled 0
6c513b6d30:    	mov	x0, x19  // guest 0x10b2d2, sampled 0
6c513b6d34:    	adrp	x16, 0x6c97752000 <trace+0x4639d000>  // guest 0x10b2d2, sampled 0
6c513b6d38:    	add	x16, x16, #0x9a8  // guest 0x10b2d2, sampled 0
6c513b6d3c:    	blr	x16  // guest 0x10b2d2, sampled 0
6c513b6d40:    	sxtw	x24, w21  // guest 0x10b2d2, sampled 0
6c513b6d44:    	add	x24, x24, x19  // guest 0x10b2d2, sampled 0
6c513b6d48:    	strb	w27, [x24, #0x190]  // guest 0x10b2d2, sampled 0
6c513b6d4c:    	add	w21, w21, w27  // guest 0x10b2d2, sampled 0
6c513b6d50:    	and	w21, w21, #0x7  // guest 0x10b2d2, sampled 0
6c513b6d54:    	str	w21, [x19, #0x188]  // guest 0x10b2d2, sampled 0
6c513b6d58:    	ldr	w24, [x19, #0x54]  // guest 0x10b2d2, sampled 0
6c513b6d5c:    	strh	w24, [x19, #0x222]  // guest 0x10b2d2, sampled 0
6c513b6d60:    	mov	w24, #0xb2d2            // =45778  // guest 0x10b2d2, sampled 0
6c513b6d64:    	movk	w24, #0x10, lsl #16  // guest 0x10b2d2, sampled 0
6c513b6d68:    	str	w24, [x19, #0x228]  // guest 0x10b2d2, sampled 0
6c513b6d6c:    	add	w24, w22, #0x5c  // guest 0x10b2d4, sampled 0
6c513b6d70:    	mov	w25, w24  // guest 0x10b2d4, sampled 0
6c513b6d74:    	lsl	w26, w21, #4  // guest 0x10b2d4, sampled 0
6c513b6d78:    	add	w26, w26, #0x1a0  // guest 0x10b2d4, sampled 0
6c513b6d7c:    	sxtw	x26, w26  // guest 0x10b2d4, sampled 0
6c513b6d80:    	add	x1, x26, x19  // guest 0x10b2d4, sampled 0
6c513b6d84:    	mov	x0, x19  // guest 0x10b2d4, sampled 0
6c513b6d88:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b2d4, sampled 0
6c513b6d8c:    	add	x16, x16, #0x4f0  // guest 0x10b2d4, sampled 0
6c513b6d90:    	blr	x16  // guest 0x10b2d4, sampled 0
6c513b6d94:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2d4, sampled 0
6c513b6d98:    	and	x16, x16, x24, lsr #7  // guest 0x10b2d4, sampled 0
6c513b6d9c:    	add	x17, x17, x16  // guest 0x10b2d4, sampled 0
6c513b6da0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b2d4, sampled 0
6c513b6da4:    	and	w30, w24, #0xfffff003  // guest 0x10b2d4, sampled 0
6c513b6da8:    	cmp	w16, w30  // guest 0x10b2d4, sampled 0
6c513b6dac:    	b.ne	0x6c513b800c <trace+0x27cc>  // guest 0x10b2d4, sampled 0
6c513b6db0:    	add	x30, x17, w24, uxtw  // guest 0x10b2d4, sampled 1
6c513b6db4:    	stlr	w0, [x30]  // guest 0x10b2d4, sampled 0
6c513b6db8:    	sxtw	x24, w21  // guest 0x10b2d4, sampled 0
6c513b6dbc:    	add	x24, x24, x19  // guest 0x10b2d4, sampled 0
6c513b6dc0:    	strb	w27, [x24, #0x190]  // guest 0x10b2d4, sampled 0
6c513b6dc4:    	add	w21, w21, w27  // guest 0x10b2d4, sampled 0
6c513b6dc8:    	and	w21, w21, #0x7  // guest 0x10b2d4, sampled 0
6c513b6dcc:    	str	w21, [x19, #0x188]  // guest 0x10b2d4, sampled 0
6c513b6dd0:    	ldr	w24, [x19, #0x64]  // guest 0x10b2d4, sampled 0
6c513b6dd4:    	strh	w24, [x19, #0x224]  // guest 0x10b2d4, sampled 0
6c513b6dd8:    	str	w25, [x19, #0x230]  // guest 0x10b2d4, sampled 0
6c513b6ddc:    	ldr	w24, [x19, #0x54]  // guest 0x10b2d4, sampled 0
6c513b6de0:    	strh	w24, [x19, #0x222]  // guest 0x10b2d4, sampled 0
6c513b6de4:    	mov	w24, #0xb2d4            // =45780  // guest 0x10b2d4, sampled 0
6c513b6de8:    	movk	w24, #0x10, lsl #16  // guest 0x10b2d4, sampled 0
6c513b6dec:    	str	w24, [x19, #0x228]  // guest 0x10b2d4, sampled 0
6c513b6df0:    	add	w24, w20, #0x20  // guest 0x10b2d8, sampled 0
6c513b6df4:    	mov	w25, w24  // guest 0x10b2d8, sampled 0
6c513b6df8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2d8, sampled 0
6c513b6dfc:    	and	x16, x16, x24, lsr #7  // guest 0x10b2d8, sampled 0
6c513b6e00:    	add	x17, x17, x16  // guest 0x10b2d8, sampled 0
6c513b6e04:    	ldp	x16, x17, [x17]  // guest 0x10b2d8, sampled 0
6c513b6e08:    	and	w30, w24, #0xfffff003  // guest 0x10b2d8, sampled 0
6c513b6e0c:    	cmp	w16, w30  // guest 0x10b2d8, sampled 0
6c513b6e10:    	b.ne	0x6c513b8038 <trace+0x27f8>  // guest 0x10b2d8, sampled 0
6c513b6e14:    	add	x30, x17, w24, uxtw  // guest 0x10b2d8, sampled 0
6c513b6e18:    	ldapr	w2, [x30]  // guest 0x10b2d8, sampled 0
6c513b6e1c:    	add	w24, w21, #0x7  // guest 0x10b2d8, sampled 0
6c513b6e20:    	and	w24, w24, #0x7  // guest 0x10b2d8, sampled 0
6c513b6e24:    	lsl	w24, w24, #4  // guest 0x10b2d8, sampled 0
6c513b6e28:    	add	w24, w24, #0x1a0  // guest 0x10b2d8, sampled 0
6c513b6e2c:    	sxtw	x24, w24  // guest 0x10b2d8, sampled 0
6c513b6e30:    	add	x1, x24, x19  // guest 0x10b2d8, sampled 0
6c513b6e34:    	mov	x0, x19  // guest 0x10b2d8, sampled 0
6c513b6e38:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b2d8, sampled 0
6c513b6e3c:    	add	x16, x16, #0x3b4  // guest 0x10b2d8, sampled 0
6c513b6e40:    	blr	x16  // guest 0x10b2d8, sampled 0
6c513b6e44:    	sub	w21, w21, #0x1  // guest 0x10b2d8, sampled 0
6c513b6e48:    	and	w21, w21, #0x7  // guest 0x10b2d8, sampled 0
6c513b6e4c:    	str	w21, [x19, #0x188]  // guest 0x10b2d8, sampled 0
6c513b6e50:    	sxtw	x24, w21  // guest 0x10b2d8, sampled 0
6c513b6e54:    	add	x24, x24, x19  // guest 0x10b2d8, sampled 0
6c513b6e58:    	strb	wzr, [x24, #0x190]  // guest 0x10b2d8, sampled 0
6c513b6e5c:    	ldr	w24, [x19, #0x74]  // guest 0x10b2d8, sampled 0
6c513b6e60:    	strh	w24, [x19, #0x224]  // guest 0x10b2d8, sampled 0
6c513b6e64:    	str	w25, [x19, #0x230]  // guest 0x10b2d8, sampled 0
6c513b6e68:    	ldr	w24, [x19, #0x54]  // guest 0x10b2d8, sampled 0
6c513b6e6c:    	strh	w24, [x19, #0x222]  // guest 0x10b2d8, sampled 0
6c513b6e70:    	mov	w24, #0xb2d8            // =45784  // guest 0x10b2d8, sampled 0
6c513b6e74:    	movk	w24, #0x10, lsl #16  // guest 0x10b2d8, sampled 0
6c513b6e78:    	str	w24, [x19, #0x228]  // guest 0x10b2d8, sampled 0
6c513b6e7c:    	add	w24, w23, #0x8  // guest 0x10b2db, sampled 0
6c513b6e80:    	mov	w25, w24  // guest 0x10b2db, sampled 0
6c513b6e84:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2db, sampled 0
6c513b6e88:    	and	x16, x16, x24, lsr #7  // guest 0x10b2db, sampled 0
6c513b6e8c:    	add	x17, x17, x16  // guest 0x10b2db, sampled 0
6c513b6e90:    	ldp	x16, x17, [x17]  // guest 0x10b2db, sampled 0
6c513b6e94:    	and	w30, w24, #0xfffff003  // guest 0x10b2db, sampled 1
6c513b6e98:    	cmp	w16, w30  // guest 0x10b2db, sampled 0
6c513b6e9c:    	b.ne	0x6c513b8064 <trace+0x2824>  // guest 0x10b2db, sampled 0
6c513b6ea0:    	add	x30, x17, w24, uxtw  // guest 0x10b2db, sampled 0
6c513b6ea4:    	ldapr	w2, [x30]  // guest 0x10b2db, sampled 0
6c513b6ea8:    	add	x1, x19, #0x258  // guest 0x10b2db, sampled 0
6c513b6eac:    	mov	x0, x19  // guest 0x10b2db, sampled 0
6c513b6eb0:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b2db, sampled 0
6c513b6eb4:    	add	x16, x16, #0x3b4  // guest 0x10b2db, sampled 0
6c513b6eb8:    	blr	x16  // guest 0x10b2db, sampled 0
6c513b6ebc:    	lsl	w24, w21, #4  // guest 0x10b2db, sampled 0
6c513b6ec0:    	add	w24, w24, #0x1a0  // guest 0x10b2db, sampled 0
6c513b6ec4:    	sxtw	x24, w24  // guest 0x10b2db, sampled 0
6c513b6ec8:    	add	x1, x24, x19  // guest 0x10b2db, sampled 0
6c513b6ecc:    	add	x2, x19, #0x258  // guest 0x10b2db, sampled 0
6c513b6ed0:    	mov	x0, x19  // guest 0x10b2db, sampled 0
6c513b6ed4:    	adrp	x16, 0x6c97752000 <trace+0x4639d000>  // guest 0x10b2db, sampled 0
6c513b6ed8:    	add	x16, x16, #0xa7c  // guest 0x10b2db, sampled 0
6c513b6edc:    	blr	x16  // guest 0x10b2db, sampled 0
6c513b6ee0:    	ldr	w24, [x19, #0x74]  // guest 0x10b2db, sampled 0
6c513b6ee4:    	strh	w24, [x19, #0x224]  // guest 0x10b2db, sampled 0
6c513b6ee8:    	str	w25, [x19, #0x230]  // guest 0x10b2db, sampled 0
6c513b6eec:    	ldr	w24, [x19, #0x54]  // guest 0x10b2db, sampled 0
6c513b6ef0:    	strh	w24, [x19, #0x222]  // guest 0x10b2db, sampled 0
6c513b6ef4:    	mov	w24, #0xb2db            // =45787  // guest 0x10b2db, sampled 0
6c513b6ef8:    	movk	w24, #0x10, lsl #16  // guest 0x10b2db, sampled 0
6c513b6efc:    	str	w24, [x19, #0x228]  // guest 0x10b2db, sampled 0
6c513b6f00:    	add	w24, w20, #0x1c  // guest 0x10b2de, sampled 0
6c513b6f04:    	mov	w25, w24  // guest 0x10b2de, sampled 0
6c513b6f08:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2de, sampled 0
6c513b6f0c:    	and	x16, x16, x24, lsr #7  // guest 0x10b2de, sampled 0
6c513b6f10:    	add	x17, x17, x16  // guest 0x10b2de, sampled 0
6c513b6f14:    	ldp	x16, x17, [x17]  // guest 0x10b2de, sampled 0
6c513b6f18:    	and	w30, w24, #0xfffff003  // guest 0x10b2de, sampled 0
6c513b6f1c:    	cmp	w16, w30  // guest 0x10b2de, sampled 0
6c513b6f20:    	b.ne	0x6c513b8090 <trace+0x2850>  // guest 0x10b2de, sampled 0
6c513b6f24:    	add	x30, x17, w24, uxtw  // guest 0x10b2de, sampled 1
6c513b6f28:    	ldapr	w2, [x30]  // guest 0x10b2de, sampled 0
6c513b6f2c:    	add	w24, w21, #0x7  // guest 0x10b2de, sampled 0
6c513b6f30:    	and	w24, w24, #0x7  // guest 0x10b2de, sampled 0
6c513b6f34:    	lsl	w24, w24, #4  // guest 0x10b2de, sampled 0
6c513b6f38:    	add	w24, w24, #0x1a0  // guest 0x10b2de, sampled 0
6c513b6f3c:    	sxtw	x24, w24  // guest 0x10b2de, sampled 0
6c513b6f40:    	add	x1, x24, x19  // guest 0x10b2de, sampled 0
6c513b6f44:    	mov	x0, x19  // guest 0x10b2de, sampled 0
6c513b6f48:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b2de, sampled 0
6c513b6f4c:    	add	x16, x16, #0x3b4  // guest 0x10b2de, sampled 0
6c513b6f50:    	blr	x16  // guest 0x10b2de, sampled 0
6c513b6f54:    	sub	w21, w21, #0x1  // guest 0x10b2de, sampled 0
6c513b6f58:    	and	w21, w21, #0x7  // guest 0x10b2de, sampled 0
6c513b6f5c:    	str	w21, [x19, #0x188]  // guest 0x10b2de, sampled 0
6c513b6f60:    	sxtw	x24, w21  // guest 0x10b2de, sampled 0
6c513b6f64:    	add	x24, x24, x19  // guest 0x10b2de, sampled 0
6c513b6f68:    	strb	wzr, [x24, #0x190]  // guest 0x10b2de, sampled 0
6c513b6f6c:    	ldr	w24, [x19, #0x74]  // guest 0x10b2de, sampled 0
6c513b6f70:    	strh	w24, [x19, #0x224]  // guest 0x10b2de, sampled 0
6c513b6f74:    	str	w25, [x19, #0x230]  // guest 0x10b2de, sampled 0
6c513b6f78:    	ldr	w24, [x19, #0x54]  // guest 0x10b2de, sampled 0
6c513b6f7c:    	strh	w24, [x19, #0x222]  // guest 0x10b2de, sampled 0
6c513b6f80:    	mov	w24, #0xb2de            // =45790  // guest 0x10b2de, sampled 0
6c513b6f84:    	movk	w24, #0x10, lsl #16  // guest 0x10b2de, sampled 0
6c513b6f88:    	str	w24, [x19, #0x228]  // guest 0x10b2de, sampled 0
6c513b6f8c:    	add	w24, w23, #0x4  // guest 0x10b2e1, sampled 0
6c513b6f90:    	mov	w25, w24  // guest 0x10b2e1, sampled 0
6c513b6f94:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2e1, sampled 0
6c513b6f98:    	and	x16, x16, x24, lsr #7  // guest 0x10b2e1, sampled 0
6c513b6f9c:    	add	x17, x17, x16  // guest 0x10b2e1, sampled 0
6c513b6fa0:    	ldp	x16, x17, [x17]  // guest 0x10b2e1, sampled 0
6c513b6fa4:    	and	w30, w24, #0xfffff003  // guest 0x10b2e1, sampled 0
6c513b6fa8:    	cmp	w16, w30  // guest 0x10b2e1, sampled 0
6c513b6fac:    	b.ne	0x6c513b80bc <trace+0x287c>  // guest 0x10b2e1, sampled 0
6c513b6fb0:    	add	x30, x17, w24, uxtw  // guest 0x10b2e1, sampled 0
6c513b6fb4:    	ldapr	w2, [x30]  // guest 0x10b2e1, sampled 0
6c513b6fb8:    	add	x1, x19, #0x258  // guest 0x10b2e1, sampled 0
6c513b6fbc:    	mov	x0, x19  // guest 0x10b2e1, sampled 0
6c513b6fc0:    	adrp	x16, 0x6c97751000 <trace+0x4639c000>  // guest 0x10b2e1, sampled 0
6c513b6fc4:    	add	x16, x16, #0x3b4  // guest 0x10b2e1, sampled 0
6c513b6fc8:    	blr	x16  // guest 0x10b2e1, sampled 0
6c513b6fcc:    	lsl	w24, w21, #4  // guest 0x10b2e1, sampled 0
6c513b6fd0:    	add	w24, w24, #0x1a0  // guest 0x10b2e1, sampled 0
6c513b6fd4:    	sxtw	x24, w24  // guest 0x10b2e1, sampled 0
6c513b6fd8:    	add	x1, x24, x19  // guest 0x10b2e1, sampled 0
6c513b6fdc:    	add	x2, x19, #0x258  // guest 0x10b2e1, sampled 0
6c513b6fe0:    	mov	x0, x19  // guest 0x10b2e1, sampled 0
6c513b6fe4:    	adrp	x16, 0x6c97752000 <trace+0x4639d000>  // guest 0x10b2e1, sampled 0
6c513b6fe8:    	add	x16, x16, #0xa7c  // guest 0x10b2e1, sampled 0
6c513b6fec:    	blr	x16  // guest 0x10b2e1, sampled 0
6c513b6ff0:    	ldr	w24, [x19, #0x74]  // guest 0x10b2e1, sampled 0
6c513b6ff4:    	strh	w24, [x19, #0x224]  // guest 0x10b2e1, sampled 0
6c513b6ff8:    	str	w25, [x19, #0x230]  // guest 0x10b2e1, sampled 0
6c513b6ffc:    	ldr	w24, [x19, #0x54]  // guest 0x10b2e1, sampled 0
6c513b7000:    	strh	w24, [x19, #0x222]  // guest 0x10b2e1, sampled 0
6c513b7004:    	mov	w24, #0xb2e1            // =45793  // guest 0x10b2e1, sampled 0
6c513b7008:    	movk	w24, #0x10, lsl #16  // guest 0x10b2e1, sampled 0
6c513b700c:    	str	w24, [x19, #0x228]  // guest 0x10b2e1, sampled 0
6c513b7010:    	add	w24, w21, w27  // guest 0x10b2e4, sampled 0
6c513b7014:    	and	w24, w24, #0x7  // guest 0x10b2e4, sampled 0
6c513b7018:    	lsl	w24, w24, #4  // guest 0x10b2e4, sampled 0
6c513b701c:    	add	w24, w24, #0x1a0  // guest 0x10b2e4, sampled 0
6c513b7020:    	sxtw	x24, w24  // guest 0x10b2e4, sampled 0
6c513b7024:    	add	x1, x24, x19  // guest 0x10b2e4, sampled 0
6c513b7028:    	lsl	w24, w21, #4  // guest 0x10b2e4, sampled 0
6c513b702c:    	add	w24, w24, #0x1a0  // guest 0x10b2e4, sampled 0
6c513b7030:    	sxtw	x24, w24  // guest 0x10b2e4, sampled 0
6c513b7034:    	add	x2, x24, x19  // guest 0x10b2e4, sampled 0
6c513b7038:    	mov	x0, x19  // guest 0x10b2e4, sampled 0
6c513b703c:    	adrp	x16, 0x6c97752000 <trace+0x4639c000>  // guest 0x10b2e4, sampled 0
6c513b7040:    	add	x16, x16, #0x9a8  // guest 0x10b2e4, sampled 0
6c513b7044:    	blr	x16  // guest 0x10b2e4, sampled 0
6c513b7048:    	sxtw	x24, w21  // guest 0x10b2e4, sampled 0
6c513b704c:    	add	x24, x24, x19  // guest 0x10b2e4, sampled 0
6c513b7050:    	strb	w27, [x24, #0x190]  // guest 0x10b2e4, sampled 0
6c513b7054:    	add	w21, w21, w27  // guest 0x10b2e4, sampled 0
6c513b7058:    	and	w21, w21, #0x7  // guest 0x10b2e4, sampled 0
6c513b705c:    	str	w21, [x19, #0x188]  // guest 0x10b2e4, sampled 0
6c513b7060:    	ldr	w24, [x19, #0x54]  // guest 0x10b2e4, sampled 0
6c513b7064:    	strh	w24, [x19, #0x222]  // guest 0x10b2e4, sampled 0
6c513b7068:    	mov	w24, #0xb2e4            // =45796  // guest 0x10b2e4, sampled 0
6c513b706c:    	movk	w24, #0x10, lsl #16  // guest 0x10b2e4, sampled 0
6c513b7070:    	str	w24, [x19, #0x228]  // guest 0x10b2e4, sampled 0
6c513b7074:    	add	w24, w20, #0x18  // guest 0x10b2e6, sampled 0
6c513b7078:    	mov	w25, w24  // guest 0x10b2e6, sampled 0
6c513b707c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2e6, sampled 0
6c513b7080:    	and	x16, x16, x24, lsr #7  // guest 0x10b2e6, sampled 0
6c513b7084:    	add	x17, x17, x16  // guest 0x10b2e6, sampled 0
6c513b7088:    	ldp	x16, x17, [x17]  // guest 0x10b2e6, sampled 0
6c513b708c:    	and	w30, w24, #0xfffff003  // guest 0x10b2e6, sampled 0
6c513b7090:    	cmp	w16, w30  // guest 0x10b2e6, sampled 0
6c513b7094:    	b.ne	0x6c513b80e8 <trace+0x28a8>  // guest 0x10b2e6, sampled 0
6c513b7098:    	add	x30, x17, w24, uxtw  // guest 0x10b2e6, sampled 0
6c513b709c:    	ldapr	w2, [x30]  // guest 0x10b2e6, sampled 0
6c513b70a0:    	add	w24, w21, #0x7  // guest 0x10b2e6, sampled 1
6c513b70a4:    	and	w24, w24, #0x7  // guest 0x10b2e6, sampled 0
6c513b70a8:    	lsl	w24, w24, #4  // guest 0x10b2e6, sampled 0
6c513b70ac:    	add	w24, w24, #0x1a0  // guest 0x10b2e6, sampled 0
6c513b70b0:    	sxtw	x24, w24  // guest 0x10b2e6, sampled 0
6c513b70b4:    	add	x1, x24, x19  // guest 0x10b2e6, sampled 0
6c513b70b8:    	mov	x0, x19  // guest 0x10b2e6, sampled 0
6c513b70bc:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b2e6, sampled 0
6c513b70c0:    	add	x16, x16, #0x3b4  // guest 0x10b2e6, sampled 0
6c513b70c4:    	blr	x16  // guest 0x10b2e6, sampled 0
6c513b70c8:    	sub	w21, w21, #0x1  // guest 0x10b2e6, sampled 0
6c513b70cc:    	and	w21, w21, #0x7  // guest 0x10b2e6, sampled 0
6c513b70d0:    	str	w21, [x19, #0x188]  // guest 0x10b2e6, sampled 0
6c513b70d4:    	sxtw	x24, w21  // guest 0x10b2e6, sampled 0
6c513b70d8:    	add	x24, x24, x19  // guest 0x10b2e6, sampled 0
6c513b70dc:    	strb	wzr, [x24, #0x190]  // guest 0x10b2e6, sampled 0
6c513b70e0:    	ldr	w24, [x19, #0x74]  // guest 0x10b2e6, sampled 0
6c513b70e4:    	strh	w24, [x19, #0x224]  // guest 0x10b2e6, sampled 0
6c513b70e8:    	str	w25, [x19, #0x230]  // guest 0x10b2e6, sampled 0
6c513b70ec:    	ldr	w24, [x19, #0x54]  // guest 0x10b2e6, sampled 0
6c513b70f0:    	strh	w24, [x19, #0x222]  // guest 0x10b2e6, sampled 0
6c513b70f4:    	mov	w24, #0xb2e6            // =45798  // guest 0x10b2e6, sampled 0
6c513b70f8:    	movk	w24, #0x10, lsl #16  // guest 0x10b2e6, sampled 0
6c513b70fc:    	str	w24, [x19, #0x228]  // guest 0x10b2e6, sampled 0
6c513b7100:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2e9, sampled 0
6c513b7104:    	and	x16, x16, x23, lsr #7  // guest 0x10b2e9, sampled 0
6c513b7108:    	add	x17, x17, x16  // guest 0x10b2e9, sampled 0
6c513b710c:    	ldp	x16, x17, [x17]  // guest 0x10b2e9, sampled 0
6c513b7110:    	and	w30, w23, #0xfffff003  // guest 0x10b2e9, sampled 0
6c513b7114:    	cmp	w16, w30  // guest 0x10b2e9, sampled 0
6c513b7118:    	b.ne	0x6c513b8114 <trace+0x28d4>  // guest 0x10b2e9, sampled 0
6c513b711c:    	add	x30, x17, w23, uxtw  // guest 0x10b2e9, sampled 0
6c513b7120:    	ldapr	w2, [x30]  // guest 0x10b2e9, sampled 0
6c513b7124:    	add	x1, x19, #0x258  // guest 0x10b2e9, sampled 0
6c513b7128:    	mov	x0, x19  // guest 0x10b2e9, sampled 0
6c513b712c:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b2e9, sampled 0
6c513b7130:    	add	x16, x16, #0x3b4  // guest 0x10b2e9, sampled 0
6c513b7134:    	blr	x16  // guest 0x10b2e9, sampled 0
6c513b7138:    	lsl	w24, w21, #4  // guest 0x10b2e9, sampled 0
6c513b713c:    	add	w24, w24, #0x1a0  // guest 0x10b2e9, sampled 0
6c513b7140:    	sxtw	x24, w24  // guest 0x10b2e9, sampled 0
6c513b7144:    	add	x1, x24, x19  // guest 0x10b2e9, sampled 0
6c513b7148:    	add	x2, x19, #0x258  // guest 0x10b2e9, sampled 0
6c513b714c:    	mov	x0, x19  // guest 0x10b2e9, sampled 0
6c513b7150:    	adrp	x16, 0x6c97752000 <trace+0x4639c000>  // guest 0x10b2e9, sampled 0
6c513b7154:    	add	x16, x16, #0xa7c  // guest 0x10b2e9, sampled 0
6c513b7158:    	blr	x16  // guest 0x10b2e9, sampled 0
6c513b715c:    	ldr	w24, [x19, #0x74]  // guest 0x10b2e9, sampled 0
6c513b7160:    	strh	w24, [x19, #0x224]  // guest 0x10b2e9, sampled 0
6c513b7164:    	str	w23, [x19, #0x230]  // guest 0x10b2e9, sampled 0
6c513b7168:    	ldr	w24, [x19, #0x54]  // guest 0x10b2e9, sampled 0
6c513b716c:    	strh	w24, [x19, #0x222]  // guest 0x10b2e9, sampled 0
6c513b7170:    	mov	w24, #0xb2e9            // =45801  // guest 0x10b2e9, sampled 0
6c513b7174:    	movk	w24, #0x10, lsl #16  // guest 0x10b2e9, sampled 0
6c513b7178:    	str	w24, [x19, #0x228]  // guest 0x10b2e9, sampled 0
6c513b717c:    	add	w24, w21, w27  // guest 0x10b2eb, sampled 0
6c513b7180:    	and	w24, w24, #0x7  // guest 0x10b2eb, sampled 0
6c513b7184:    	lsl	w24, w24, #4  // guest 0x10b2eb, sampled 0
6c513b7188:    	add	w24, w24, #0x1a0  // guest 0x10b2eb, sampled 0
6c513b718c:    	sxtw	x24, w24  // guest 0x10b2eb, sampled 0
6c513b7190:    	add	x1, x24, x19  // guest 0x10b2eb, sampled 0
6c513b7194:    	lsl	w24, w21, #4  // guest 0x10b2eb, sampled 0
6c513b7198:    	add	w24, w24, #0x1a0  // guest 0x10b2eb, sampled 0
6c513b719c:    	sxtw	x24, w24  // guest 0x10b2eb, sampled 0
6c513b71a0:    	add	x2, x24, x19  // guest 0x10b2eb, sampled 0
6c513b71a4:    	mov	x0, x19  // guest 0x10b2eb, sampled 0
6c513b71a8:    	adrp	x16, 0x6c97752000 <trace+0x4639c000>  // guest 0x10b2eb, sampled 0
6c513b71ac:    	add	x16, x16, #0x9a8  // guest 0x10b2eb, sampled 0
6c513b71b0:    	blr	x16  // guest 0x10b2eb, sampled 0
6c513b71b4:    	sxtw	x24, w21  // guest 0x10b2eb, sampled 0
6c513b71b8:    	add	x24, x24, x19  // guest 0x10b2eb, sampled 0
6c513b71bc:    	strb	w27, [x24, #0x190]  // guest 0x10b2eb, sampled 0
6c513b71c0:    	add	w21, w21, w27  // guest 0x10b2eb, sampled 0
6c513b71c4:    	and	w21, w21, #0x7  // guest 0x10b2eb, sampled 0
6c513b71c8:    	str	w21, [x19, #0x188]  // guest 0x10b2eb, sampled 0
6c513b71cc:    	ldr	w24, [x19, #0x54]  // guest 0x10b2eb, sampled 0
6c513b71d0:    	strh	w24, [x19, #0x222]  // guest 0x10b2eb, sampled 0
6c513b71d4:    	mov	w24, #0xb2eb            // =45803  // guest 0x10b2eb, sampled 0
6c513b71d8:    	movk	w24, #0x10, lsl #16  // guest 0x10b2eb, sampled 0
6c513b71dc:    	str	w24, [x19, #0x228]  // guest 0x10b2eb, sampled 0
6c513b71e0:    	add	w24, w22, #0x60  // guest 0x10b2ed, sampled 0
6c513b71e4:    	mov	w25, w24  // guest 0x10b2ed, sampled 0
6c513b71e8:    	lsl	w26, w21, #4  // guest 0x10b2ed, sampled 0
6c513b71ec:    	add	w26, w26, #0x1a0  // guest 0x10b2ed, sampled 0
6c513b71f0:    	sxtw	x26, w26  // guest 0x10b2ed, sampled 0
6c513b71f4:    	add	x1, x26, x19  // guest 0x10b2ed, sampled 0
6c513b71f8:    	mov	x0, x19  // guest 0x10b2ed, sampled 0
6c513b71fc:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b2ed, sampled 0
6c513b7200:    	add	x16, x16, #0x4f0  // guest 0x10b2ed, sampled 0
6c513b7204:    	blr	x16  // guest 0x10b2ed, sampled 0
6c513b7208:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2ed, sampled 0
6c513b720c:    	and	x16, x16, x24, lsr #7  // guest 0x10b2ed, sampled 0
6c513b7210:    	add	x17, x17, x16  // guest 0x10b2ed, sampled 0
6c513b7214:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b2ed, sampled 0
6c513b7218:    	and	w30, w24, #0xfffff003  // guest 0x10b2ed, sampled 1
6c513b721c:    	cmp	w16, w30  // guest 0x10b2ed, sampled 0
6c513b7220:    	b.ne	0x6c513b8140 <trace+0x2900>  // guest 0x10b2ed, sampled 0
6c513b7224:    	add	x30, x17, w24, uxtw  // guest 0x10b2ed, sampled 0
6c513b7228:    	stlr	w0, [x30]  // guest 0x10b2ed, sampled 0
6c513b722c:    	sxtw	x24, w21  // guest 0x10b2ed, sampled 0
6c513b7230:    	add	x24, x24, x19  // guest 0x10b2ed, sampled 0
6c513b7234:    	strb	w27, [x24, #0x190]  // guest 0x10b2ed, sampled 0
6c513b7238:    	add	w21, w21, w27  // guest 0x10b2ed, sampled 0
6c513b723c:    	and	w21, w21, #0x7  // guest 0x10b2ed, sampled 0
6c513b7240:    	str	w21, [x19, #0x188]  // guest 0x10b2ed, sampled 0
6c513b7244:    	ldr	w24, [x19, #0x64]  // guest 0x10b2ed, sampled 0
6c513b7248:    	strh	w24, [x19, #0x224]  // guest 0x10b2ed, sampled 0
6c513b724c:    	str	w25, [x19, #0x230]  // guest 0x10b2ed, sampled 0
6c513b7250:    	ldr	w24, [x19, #0x54]  // guest 0x10b2ed, sampled 0
6c513b7254:    	strh	w24, [x19, #0x222]  // guest 0x10b2ed, sampled 0
6c513b7258:    	mov	w24, #0xb2ed            // =45805  // guest 0x10b2ed, sampled 0
6c513b725c:    	movk	w24, #0x10, lsl #16  // guest 0x10b2ed, sampled 0
6c513b7260:    	str	w24, [x19, #0x228]  // guest 0x10b2ed, sampled 0
6c513b7264:    	add	w24, w20, #0x2c  // guest 0x10b2f1, sampled 0
6c513b7268:    	mov	w25, w24  // guest 0x10b2f1, sampled 0
6c513b726c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2f1, sampled 0
6c513b7270:    	and	x16, x16, x24, lsr #7  // guest 0x10b2f1, sampled 0
6c513b7274:    	add	x17, x17, x16  // guest 0x10b2f1, sampled 0
6c513b7278:    	ldp	x16, x17, [x17]  // guest 0x10b2f1, sampled 0
6c513b727c:    	and	w30, w24, #0xfffff003  // guest 0x10b2f1, sampled 0
6c513b7280:    	cmp	w16, w30  // guest 0x10b2f1, sampled 0
6c513b7284:    	b.ne	0x6c513b816c <trace+0x292c>  // guest 0x10b2f1, sampled 0
6c513b7288:    	add	x30, x17, w24, uxtw  // guest 0x10b2f1, sampled 0
6c513b728c:    	ldapr	w2, [x30]  // guest 0x10b2f1, sampled 0
6c513b7290:    	add	w24, w21, #0x7  // guest 0x10b2f1, sampled 0
6c513b7294:    	and	w24, w24, #0x7  // guest 0x10b2f1, sampled 0
6c513b7298:    	lsl	w24, w24, #4  // guest 0x10b2f1, sampled 0
6c513b729c:    	add	w24, w24, #0x1a0  // guest 0x10b2f1, sampled 0
6c513b72a0:    	sxtw	x24, w24  // guest 0x10b2f1, sampled 0
6c513b72a4:    	add	x1, x24, x19  // guest 0x10b2f1, sampled 0
6c513b72a8:    	mov	x0, x19  // guest 0x10b2f1, sampled 0
6c513b72ac:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b2f1, sampled 0
6c513b72b0:    	add	x16, x16, #0x3b4  // guest 0x10b2f1, sampled 0
6c513b72b4:    	blr	x16  // guest 0x10b2f1, sampled 0
6c513b72b8:    	sub	w21, w21, #0x1  // guest 0x10b2f1, sampled 0
6c513b72bc:    	and	w21, w21, #0x7  // guest 0x10b2f1, sampled 0
6c513b72c0:    	str	w21, [x19, #0x188]  // guest 0x10b2f1, sampled 0
6c513b72c4:    	sxtw	x24, w21  // guest 0x10b2f1, sampled 0
6c513b72c8:    	add	x24, x24, x19  // guest 0x10b2f1, sampled 0
6c513b72cc:    	strb	wzr, [x24, #0x190]  // guest 0x10b2f1, sampled 0
6c513b72d0:    	ldr	w24, [x19, #0x74]  // guest 0x10b2f1, sampled 0
6c513b72d4:    	strh	w24, [x19, #0x224]  // guest 0x10b2f1, sampled 0
6c513b72d8:    	str	w25, [x19, #0x230]  // guest 0x10b2f1, sampled 0
6c513b72dc:    	ldr	w24, [x19, #0x54]  // guest 0x10b2f1, sampled 0
6c513b72e0:    	strh	w24, [x19, #0x222]  // guest 0x10b2f1, sampled 0
6c513b72e4:    	mov	w24, #0xb2f1            // =45809  // guest 0x10b2f1, sampled 0
6c513b72e8:    	movk	w24, #0x10, lsl #16  // guest 0x10b2f1, sampled 0
6c513b72ec:    	str	w24, [x19, #0x228]  // guest 0x10b2f1, sampled 0
6c513b72f0:    	add	w24, w23, #0x8  // guest 0x10b2f4, sampled 0
6c513b72f4:    	mov	w25, w24  // guest 0x10b2f4, sampled 0
6c513b72f8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2f4, sampled 0
6c513b72fc:    	and	x16, x16, x24, lsr #7  // guest 0x10b2f4, sampled 0
6c513b7300:    	add	x17, x17, x16  // guest 0x10b2f4, sampled 0
6c513b7304:    	ldp	x16, x17, [x17]  // guest 0x10b2f4, sampled 0
6c513b7308:    	and	w30, w24, #0xfffff003  // guest 0x10b2f4, sampled 0
6c513b730c:    	cmp	w16, w30  // guest 0x10b2f4, sampled 0
6c513b7310:    	b.ne	0x6c513b8198 <trace+0x2958>  // guest 0x10b2f4, sampled 0
6c513b7314:    	add	x30, x17, w24, uxtw  // guest 0x10b2f4, sampled 0
6c513b7318:    	ldapr	w2, [x30]  // guest 0x10b2f4, sampled 0
6c513b731c:    	add	x1, x19, #0x258  // guest 0x10b2f4, sampled 0
6c513b7320:    	mov	x0, x19  // guest 0x10b2f4, sampled 0
6c513b7324:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b2f4, sampled 0
6c513b7328:    	add	x16, x16, #0x3b4  // guest 0x10b2f4, sampled 0
6c513b732c:    	blr	x16  // guest 0x10b2f4, sampled 0
6c513b7330:    	lsl	w24, w21, #4  // guest 0x10b2f4, sampled 0
6c513b7334:    	add	w24, w24, #0x1a0  // guest 0x10b2f4, sampled 0
6c513b7338:    	sxtw	x24, w24  // guest 0x10b2f4, sampled 0
6c513b733c:    	add	x1, x24, x19  // guest 0x10b2f4, sampled 0
6c513b7340:    	add	x2, x19, #0x258  // guest 0x10b2f4, sampled 0
6c513b7344:    	mov	x0, x19  // guest 0x10b2f4, sampled 0
6c513b7348:    	adrp	x16, 0x6c97752000 <trace+0x4639c000>  // guest 0x10b2f4, sampled 0
6c513b734c:    	add	x16, x16, #0xa7c  // guest 0x10b2f4, sampled 0
6c513b7350:    	blr	x16  // guest 0x10b2f4, sampled 0
6c513b7354:    	ldr	w24, [x19, #0x74]  // guest 0x10b2f4, sampled 0
6c513b7358:    	strh	w24, [x19, #0x224]  // guest 0x10b2f4, sampled 0
6c513b735c:    	str	w25, [x19, #0x230]  // guest 0x10b2f4, sampled 0
6c513b7360:    	ldr	w24, [x19, #0x54]  // guest 0x10b2f4, sampled 0
6c513b7364:    	strh	w24, [x19, #0x222]  // guest 0x10b2f4, sampled 0
6c513b7368:    	mov	w24, #0xb2f4            // =45812  // guest 0x10b2f4, sampled 0
6c513b736c:    	movk	w24, #0x10, lsl #16  // guest 0x10b2f4, sampled 0
6c513b7370:    	str	w24, [x19, #0x228]  // guest 0x10b2f4, sampled 0
6c513b7374:    	add	w24, w20, #0x28  // guest 0x10b2f7, sampled 0
6c513b7378:    	mov	w25, w24  // guest 0x10b2f7, sampled 0
6c513b737c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2f7, sampled 0
6c513b7380:    	and	x16, x16, x24, lsr #7  // guest 0x10b2f7, sampled 0
6c513b7384:    	add	x17, x17, x16  // guest 0x10b2f7, sampled 0
6c513b7388:    	ldp	x16, x17, [x17]  // guest 0x10b2f7, sampled 0
6c513b738c:    	and	w30, w24, #0xfffff003  // guest 0x10b2f7, sampled 0
6c513b7390:    	cmp	w16, w30  // guest 0x10b2f7, sampled 0
6c513b7394:    	b.ne	0x6c513b81c4 <trace+0x2984>  // guest 0x10b2f7, sampled 0
6c513b7398:    	add	x30, x17, w24, uxtw  // guest 0x10b2f7, sampled 0
6c513b739c:    	ldapr	w2, [x30]  // guest 0x10b2f7, sampled 0
6c513b73a0:    	add	w24, w21, #0x7  // guest 0x10b2f7, sampled 0
6c513b73a4:    	and	w24, w24, #0x7  // guest 0x10b2f7, sampled 0
6c513b73a8:    	lsl	w24, w24, #4  // guest 0x10b2f7, sampled 0
6c513b73ac:    	add	w24, w24, #0x1a0  // guest 0x10b2f7, sampled 0
6c513b73b0:    	sxtw	x24, w24  // guest 0x10b2f7, sampled 0
6c513b73b4:    	add	x1, x24, x19  // guest 0x10b2f7, sampled 0
6c513b73b8:    	mov	x0, x19  // guest 0x10b2f7, sampled 0
6c513b73bc:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b2f7, sampled 0
6c513b73c0:    	add	x16, x16, #0x3b4  // guest 0x10b2f7, sampled 1
6c513b73c4:    	blr	x16  // guest 0x10b2f7, sampled 0
6c513b73c8:    	sub	w21, w21, #0x1  // guest 0x10b2f7, sampled 0
6c513b73cc:    	and	w21, w21, #0x7  // guest 0x10b2f7, sampled 0
6c513b73d0:    	str	w21, [x19, #0x188]  // guest 0x10b2f7, sampled 0
6c513b73d4:    	sxtw	x24, w21  // guest 0x10b2f7, sampled 0
6c513b73d8:    	add	x24, x24, x19  // guest 0x10b2f7, sampled 0
6c513b73dc:    	strb	wzr, [x24, #0x190]  // guest 0x10b2f7, sampled 0
6c513b73e0:    	ldr	w24, [x19, #0x74]  // guest 0x10b2f7, sampled 0
6c513b73e4:    	strh	w24, [x19, #0x224]  // guest 0x10b2f7, sampled 0
6c513b73e8:    	str	w25, [x19, #0x230]  // guest 0x10b2f7, sampled 0
6c513b73ec:    	ldr	w24, [x19, #0x54]  // guest 0x10b2f7, sampled 0
6c513b73f0:    	strh	w24, [x19, #0x222]  // guest 0x10b2f7, sampled 0
6c513b73f4:    	mov	w24, #0xb2f7            // =45815  // guest 0x10b2f7, sampled 0
6c513b73f8:    	movk	w24, #0x10, lsl #16  // guest 0x10b2f7, sampled 0
6c513b73fc:    	str	w24, [x19, #0x228]  // guest 0x10b2f7, sampled 0
6c513b7400:    	add	w24, w23, #0x4  // guest 0x10b2fa, sampled 0
6c513b7404:    	mov	w25, w24  // guest 0x10b2fa, sampled 0
6c513b7408:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2fa, sampled 0
6c513b740c:    	and	x16, x16, x24, lsr #7  // guest 0x10b2fa, sampled 0
6c513b7410:    	add	x17, x17, x16  // guest 0x10b2fa, sampled 0
6c513b7414:    	ldp	x16, x17, [x17]  // guest 0x10b2fa, sampled 0
6c513b7418:    	and	w30, w24, #0xfffff003  // guest 0x10b2fa, sampled 0
6c513b741c:    	cmp	w16, w30  // guest 0x10b2fa, sampled 0
6c513b7420:    	b.ne	0x6c513b81f0 <trace+0x29b0>  // guest 0x10b2fa, sampled 0
6c513b7424:    	add	x30, x17, w24, uxtw  // guest 0x10b2fa, sampled 0
6c513b7428:    	ldapr	w2, [x30]  // guest 0x10b2fa, sampled 0
6c513b742c:    	add	x1, x19, #0x258  // guest 0x10b2fa, sampled 0
6c513b7430:    	mov	x0, x19  // guest 0x10b2fa, sampled 0
6c513b7434:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b2fa, sampled 0
6c513b7438:    	add	x16, x16, #0x3b4  // guest 0x10b2fa, sampled 0
6c513b743c:    	blr	x16  // guest 0x10b2fa, sampled 0
6c513b7440:    	lsl	w24, w21, #4  // guest 0x10b2fa, sampled 0
6c513b7444:    	add	w24, w24, #0x1a0  // guest 0x10b2fa, sampled 0
6c513b7448:    	sxtw	x24, w24  // guest 0x10b2fa, sampled 0
6c513b744c:    	add	x1, x24, x19  // guest 0x10b2fa, sampled 0
6c513b7450:    	add	x2, x19, #0x258  // guest 0x10b2fa, sampled 0
6c513b7454:    	mov	x0, x19  // guest 0x10b2fa, sampled 0
6c513b7458:    	adrp	x16, 0x6c97752000 <trace+0x4639c000>  // guest 0x10b2fa, sampled 0
6c513b745c:    	add	x16, x16, #0xa7c  // guest 0x10b2fa, sampled 0
6c513b7460:    	blr	x16  // guest 0x10b2fa, sampled 0
6c513b7464:    	ldr	w24, [x19, #0x74]  // guest 0x10b2fa, sampled 0
6c513b7468:    	strh	w24, [x19, #0x224]  // guest 0x10b2fa, sampled 0
6c513b746c:    	str	w25, [x19, #0x230]  // guest 0x10b2fa, sampled 0
6c513b7470:    	ldr	w24, [x19, #0x54]  // guest 0x10b2fa, sampled 0
6c513b7474:    	strh	w24, [x19, #0x222]  // guest 0x10b2fa, sampled 0
6c513b7478:    	mov	w24, #0xb2fa            // =45818  // guest 0x10b2fa, sampled 0
6c513b747c:    	movk	w24, #0x10, lsl #16  // guest 0x10b2fa, sampled 0
6c513b7480:    	str	w24, [x19, #0x228]  // guest 0x10b2fa, sampled 0
6c513b7484:    	add	w24, w21, w27  // guest 0x10b2fd, sampled 0
6c513b7488:    	and	w24, w24, #0x7  // guest 0x10b2fd, sampled 0
6c513b748c:    	lsl	w24, w24, #4  // guest 0x10b2fd, sampled 0
6c513b7490:    	add	w24, w24, #0x1a0  // guest 0x10b2fd, sampled 0
6c513b7494:    	sxtw	x24, w24  // guest 0x10b2fd, sampled 0
6c513b7498:    	add	x1, x24, x19  // guest 0x10b2fd, sampled 0
6c513b749c:    	lsl	w24, w21, #4  // guest 0x10b2fd, sampled 0
6c513b74a0:    	add	w24, w24, #0x1a0  // guest 0x10b2fd, sampled 0
6c513b74a4:    	sxtw	x24, w24  // guest 0x10b2fd, sampled 0
6c513b74a8:    	add	x2, x24, x19  // guest 0x10b2fd, sampled 0
6c513b74ac:    	mov	x0, x19  // guest 0x10b2fd, sampled 0
6c513b74b0:    	adrp	x16, 0x6c97752000 <trace+0x4639c000>  // guest 0x10b2fd, sampled 0
6c513b74b4:    	add	x16, x16, #0x9a8  // guest 0x10b2fd, sampled 0
6c513b74b8:    	blr	x16  // guest 0x10b2fd, sampled 0
6c513b74bc:    	sxtw	x24, w21  // guest 0x10b2fd, sampled 0
6c513b74c0:    	add	x24, x24, x19  // guest 0x10b2fd, sampled 0
6c513b74c4:    	strb	w27, [x24, #0x190]  // guest 0x10b2fd, sampled 0
6c513b74c8:    	add	w21, w21, w27  // guest 0x10b2fd, sampled 0
6c513b74cc:    	and	w21, w21, #0x7  // guest 0x10b2fd, sampled 0
6c513b74d0:    	str	w21, [x19, #0x188]  // guest 0x10b2fd, sampled 0
6c513b74d4:    	ldr	w24, [x19, #0x54]  // guest 0x10b2fd, sampled 0
6c513b74d8:    	strh	w24, [x19, #0x222]  // guest 0x10b2fd, sampled 0
6c513b74dc:    	mov	w24, #0xb2fd            // =45821  // guest 0x10b2fd, sampled 0
6c513b74e0:    	movk	w24, #0x10, lsl #16  // guest 0x10b2fd, sampled 0
6c513b74e4:    	str	w24, [x19, #0x228]  // guest 0x10b2fd, sampled 0
6c513b74e8:    	add	w20, w20, #0x24  // guest 0x10b2ff, sampled 0
6c513b74ec:    	mov	w24, w20  // guest 0x10b2ff, sampled 0
6c513b74f0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b2ff, sampled 0
6c513b74f4:    	and	x16, x16, x20, lsr #7  // guest 0x10b2ff, sampled 0
6c513b74f8:    	add	x17, x17, x16  // guest 0x10b2ff, sampled 0
6c513b74fc:    	ldp	x16, x17, [x17]  // guest 0x10b2ff, sampled 0
6c513b7500:    	and	w30, w20, #0xfffff003  // guest 0x10b2ff, sampled 0
6c513b7504:    	cmp	w16, w30  // guest 0x10b2ff, sampled 0
6c513b7508:    	b.ne	0x6c513b821c <trace+0x29dc>  // guest 0x10b2ff, sampled 0
6c513b750c:    	add	x30, x17, w20, uxtw  // guest 0x10b2ff, sampled 0
6c513b7510:    	ldapr	w2, [x30]  // guest 0x10b2ff, sampled 0
6c513b7514:    	add	w20, w21, #0x7  // guest 0x10b2ff, sampled 0
6c513b7518:    	and	w20, w20, #0x7  // guest 0x10b2ff, sampled 0
6c513b751c:    	lsl	w20, w20, #4  // guest 0x10b2ff, sampled 0
6c513b7520:    	add	w20, w20, #0x1a0  // guest 0x10b2ff, sampled 0
6c513b7524:    	sxtw	x20, w20  // guest 0x10b2ff, sampled 0
6c513b7528:    	add	x1, x20, x19  // guest 0x10b2ff, sampled 0
6c513b752c:    	mov	x0, x19  // guest 0x10b2ff, sampled 0
6c513b7530:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b2ff, sampled 0
6c513b7534:    	add	x16, x16, #0x3b4  // guest 0x10b2ff, sampled 0
6c513b7538:    	blr	x16  // guest 0x10b2ff, sampled 0
6c513b753c:    	sub	w20, w21, #0x1  // guest 0x10b2ff, sampled 0
6c513b7540:    	and	w20, w20, #0x7  // guest 0x10b2ff, sampled 0
6c513b7544:    	str	w20, [x19, #0x188]  // guest 0x10b2ff, sampled 0
6c513b7548:    	sxtw	x21, w20  // guest 0x10b2ff, sampled 0
6c513b754c:    	add	x21, x21, x19  // guest 0x10b2ff, sampled 0
6c513b7550:    	strb	wzr, [x21, #0x190]  // guest 0x10b2ff, sampled 0
6c513b7554:    	ldr	w21, [x19, #0x74]  // guest 0x10b2ff, sampled 0
6c513b7558:    	strh	w21, [x19, #0x224]  // guest 0x10b2ff, sampled 0
6c513b755c:    	str	w24, [x19, #0x230]  // guest 0x10b2ff, sampled 0
6c513b7560:    	ldr	w21, [x19, #0x54]  // guest 0x10b2ff, sampled 0
6c513b7564:    	strh	w21, [x19, #0x222]  // guest 0x10b2ff, sampled 0
6c513b7568:    	mov	w21, #0xb2ff            // =45823  // guest 0x10b2ff, sampled 0
6c513b756c:    	movk	w21, #0x10, lsl #16  // guest 0x10b2ff, sampled 0
6c513b7570:    	str	w21, [x19, #0x228]  // guest 0x10b2ff, sampled 0
6c513b7574:    	ldr	w21, [x19, #0x18]  // guest 0x10b302, sampled 0
6c513b7578:    	lsl	w24, w21, w27  // guest 0x10b302, sampled 0
6c513b757c:    	add	w21, w24, w21  // guest 0x10b302, sampled 0
6c513b7580:    	str	w21, [x19]  // guest 0x10b302, sampled 0
6c513b7584:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b305, sampled 0
6c513b7588:    	and	x16, x16, x23, lsr #7  // guest 0x10b305, sampled 0
6c513b758c:    	add	x17, x17, x16  // guest 0x10b305, sampled 0
6c513b7590:    	ldp	x16, x17, [x17]  // guest 0x10b305, sampled 0
6c513b7594:    	and	w30, w23, #0xfffff003  // guest 0x10b305, sampled 0
6c513b7598:    	cmp	w16, w30  // guest 0x10b305, sampled 0
6c513b759c:    	b.ne	0x6c513b8248 <trace+0x2a08>  // guest 0x10b305, sampled 0
6c513b75a0:    	add	x30, x17, w23, uxtw  // guest 0x10b305, sampled 0
6c513b75a4:    	ldapr	w2, [x30]  // guest 0x10b305, sampled 0
6c513b75a8:    	add	x1, x19, #0x258  // guest 0x10b305, sampled 0
6c513b75ac:    	mov	x0, x19  // guest 0x10b305, sampled 0
6c513b75b0:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b305, sampled 0
6c513b75b4:    	add	x16, x16, #0x3b4  // guest 0x10b305, sampled 0
6c513b75b8:    	blr	x16  // guest 0x10b305, sampled 0
6c513b75bc:    	lsl	w24, w20, #4  // guest 0x10b305, sampled 0
6c513b75c0:    	add	w24, w24, #0x1a0  // guest 0x10b305, sampled 0
6c513b75c4:    	sxtw	x24, w24  // guest 0x10b305, sampled 0
6c513b75c8:    	add	x1, x24, x19  // guest 0x10b305, sampled 0
6c513b75cc:    	add	x2, x19, #0x258  // guest 0x10b305, sampled 0
6c513b75d0:    	mov	x0, x19  // guest 0x10b305, sampled 0
6c513b75d4:    	adrp	x16, 0x6c97752000 <trace+0x4639c000>  // guest 0x10b305, sampled 0
6c513b75d8:    	add	x16, x16, #0xa7c  // guest 0x10b305, sampled 0
6c513b75dc:    	blr	x16  // guest 0x10b305, sampled 0
6c513b75e0:    	ldr	w24, [x19, #0x74]  // guest 0x10b305, sampled 0
6c513b75e4:    	strh	w24, [x19, #0x224]  // guest 0x10b305, sampled 0
6c513b75e8:    	str	w23, [x19, #0x230]  // guest 0x10b305, sampled 0
6c513b75ec:    	ldr	w23, [x19, #0x54]  // guest 0x10b305, sampled 0
6c513b75f0:    	strh	w23, [x19, #0x222]  // guest 0x10b305, sampled 0
6c513b75f4:    	mov	w23, #0xb305            // =45829  // guest 0x10b305, sampled 0
6c513b75f8:    	movk	w23, #0x10, lsl #16  // guest 0x10b305, sampled 0
6c513b75fc:    	str	w23, [x19, #0x228]  // guest 0x10b305, sampled 0
6c513b7600:    	mov	w23, #0x629c            // =25244  // guest 0x10b307, sampled 0
6c513b7604:    	movk	w23, #0x4f, lsl #16  // guest 0x10b307, sampled 0
6c513b7608:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b307, sampled 0
6c513b760c:    	and	x16, x16, x23, lsr #7  // guest 0x10b307, sampled 0
6c513b7610:    	add	x17, x17, x16  // guest 0x10b307, sampled 0
6c513b7614:    	ldp	x16, x17, [x17]  // guest 0x10b307, sampled 0
6c513b7618:    	and	w30, w23, #0xfffff003  // guest 0x10b307, sampled 0
6c513b761c:    	cmp	w16, w30  // guest 0x10b307, sampled 0
6c513b7620:    	b.ne	0x6c513b8274 <trace+0x2a34>  // guest 0x10b307, sampled 0
6c513b7624:    	add	x30, x17, w23, uxtw  // guest 0x10b307, sampled 0
6c513b7628:    	ldapr	w24, [x30]  // guest 0x10b307, sampled 0
6c513b762c:    	str	w24, [x19, #0x4]  // guest 0x10b307, sampled 0
6c513b7630:    	lsl	w25, w21, #2  // guest 0x10b30d, sampled 0
6c513b7634:    	lsl	w21, w21, #3  // guest 0x10b30d, sampled 0
6c513b7638:    	str	w21, [x19]  // guest 0x10b30d, sampled 0
6c513b763c:    	str	w21, [x19, #0x28]  // guest 0x10b30d, sampled 0
6c513b7640:    	str	w25, [x19, #0x2c]  // guest 0x10b30d, sampled 0
6c513b7644:    	add	w24, w24, w21  // guest 0x10b310, sampled 0
6c513b7648:    	str	w24, [x19, #0x8]  // guest 0x10b310, sampled 0
6c513b764c:    	add	w25, w22, #0x44  // guest 0x10b313, sampled 0
6c513b7650:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b313, sampled 0
6c513b7654:    	and	x16, x16, x25, lsr #7  // guest 0x10b313, sampled 0
6c513b7658:    	add	x17, x17, x16  // guest 0x10b313, sampled 0
6c513b765c:    	ldp	x16, x17, [x17]  // guest 0x10b313, sampled 0
6c513b7660:    	and	w30, w25, #0xfffff003  // guest 0x10b313, sampled 0
6c513b7664:    	cmp	w16, w30  // guest 0x10b313, sampled 0
6c513b7668:    	b.ne	0x6c513b82a0 <trace+0x2a60>  // guest 0x10b313, sampled 0
6c513b766c:    	add	x30, x17, w25, uxtw  // guest 0x10b313, sampled 0
6c513b7670:    	ldapr	w25, [x30]  // guest 0x10b313, sampled 0
6c513b7674:    	str	w25, [x19, #0x4]  // guest 0x10b313, sampled 0
6c513b7678:    	add	w26, w20, w27  // guest 0x10b317, sampled 0
6c513b767c:    	and	w26, w26, #0x7  // guest 0x10b317, sampled 0
6c513b7680:    	lsl	w26, w26, #4  // guest 0x10b317, sampled 0
6c513b7684:    	add	w26, w26, #0x1a0  // guest 0x10b317, sampled 0
6c513b7688:    	sxtw	x26, w26  // guest 0x10b317, sampled 0
6c513b768c:    	add	x1, x26, x19  // guest 0x10b317, sampled 0
6c513b7690:    	lsl	w26, w20, #4  // guest 0x10b317, sampled 0
6c513b7694:    	add	w26, w26, #0x1a0  // guest 0x10b317, sampled 0
6c513b7698:    	sxtw	x26, w26  // guest 0x10b317, sampled 0
6c513b769c:    	add	x2, x26, x19  // guest 0x10b317, sampled 0
6c513b76a0:    	mov	x0, x19  // guest 0x10b317, sampled 0
6c513b76a4:    	adrp	x16, 0x6c97752000 <trace+0x4639c000>  // guest 0x10b317, sampled 0
6c513b76a8:    	add	x16, x16, #0x9a8  // guest 0x10b317, sampled 0
6c513b76ac:    	blr	x16  // guest 0x10b317, sampled 0
6c513b76b0:    	sxtw	x26, w20  // guest 0x10b317, sampled 0
6c513b76b4:    	add	x26, x26, x19  // guest 0x10b317, sampled 1
6c513b76b8:    	strb	w27, [x26, #0x190]  // guest 0x10b317, sampled 0
6c513b76bc:    	add	w20, w20, w27  // guest 0x10b317, sampled 0
6c513b76c0:    	and	w20, w20, #0x7  // guest 0x10b317, sampled 0
6c513b76c4:    	str	w20, [x19, #0x188]  // guest 0x10b317, sampled 0
6c513b76c8:    	ldr	w26, [x19, #0x54]  // guest 0x10b317, sampled 0
6c513b76cc:    	strh	w26, [x19, #0x222]  // guest 0x10b317, sampled 0
6c513b76d0:    	mov	w26, #0xb317            // =45847  // guest 0x10b317, sampled 0
6c513b76d4:    	movk	w26, #0x10, lsl #16  // guest 0x10b317, sampled 0
6c513b76d8:    	str	w26, [x19, #0x228]  // guest 0x10b317, sampled 0
6c513b76dc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b319, sampled 0
6c513b76e0:    	and	x16, x16, x24, lsr #7  // guest 0x10b319, sampled 0
6c513b76e4:    	add	x17, x17, x16  // guest 0x10b319, sampled 0
6c513b76e8:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b319, sampled 0
6c513b76ec:    	and	w30, w24, #0xfffff003  // guest 0x10b319, sampled 0
6c513b76f0:    	cmp	w16, w30  // guest 0x10b319, sampled 0
6c513b76f4:    	b.ne	0x6c513b82cc <trace+0x2a8c>  // guest 0x10b319, sampled 0
6c513b76f8:    	add	x30, x17, w24, uxtw  // guest 0x10b319, sampled 0
6c513b76fc:    	stlr	w25, [x30]  // guest 0x10b319, sampled 0
6c513b7700:    	add	w25, w22, #0x48  // guest 0x10b31b, sampled 0
6c513b7704:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b31b, sampled 0
6c513b7708:    	and	x16, x16, x25, lsr #7  // guest 0x10b31b, sampled 0
6c513b770c:    	add	x17, x17, x16  // guest 0x10b31b, sampled 0
6c513b7710:    	ldp	x16, x17, [x17]  // guest 0x10b31b, sampled 0
6c513b7714:    	and	w30, w25, #0xfffff003  // guest 0x10b31b, sampled 0
6c513b7718:    	cmp	w16, w30  // guest 0x10b31b, sampled 0
6c513b771c:    	b.ne	0x6c513b82f8 <trace+0x2ab8>  // guest 0x10b31b, sampled 0
6c513b7720:    	add	x30, x17, w25, uxtw  // guest 0x10b31b, sampled 0
6c513b7724:    	ldapr	w25, [x30]  // guest 0x10b31b, sampled 0
6c513b7728:    	str	w25, [x19, #0x4]  // guest 0x10b31b, sampled 0
6c513b772c:    	add	w26, w24, #0x4  // guest 0x10b31f, sampled 0
6c513b7730:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b31f, sampled 0
6c513b7734:    	and	x16, x16, x26, lsr #7  // guest 0x10b31f, sampled 0
6c513b7738:    	add	x17, x17, x16  // guest 0x10b31f, sampled 0
6c513b773c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b31f, sampled 0
6c513b7740:    	and	w30, w26, #0xfffff003  // guest 0x10b31f, sampled 0
6c513b7744:    	cmp	w16, w30  // guest 0x10b31f, sampled 0
6c513b7748:    	b.ne	0x6c513b8324 <trace+0x2ae4>  // guest 0x10b31f, sampled 0
6c513b774c:    	add	x30, x17, w26, uxtw  // guest 0x10b31f, sampled 0
6c513b7750:    	stlr	w25, [x30]  // guest 0x10b31f, sampled 0
6c513b7754:    	add	w25, w22, #0x64  // guest 0x10b322, sampled 0
6c513b7758:    	mov	w26, w25  // guest 0x10b322, sampled 0
6c513b775c:    	lsl	w28, w20, #4  // guest 0x10b322, sampled 0
6c513b7760:    	add	w28, w28, #0x1a0  // guest 0x10b322, sampled 0
6c513b7764:    	sxtw	x28, w28  // guest 0x10b322, sampled 0
6c513b7768:    	add	x1, x28, x19  // guest 0x10b322, sampled 0
6c513b776c:    	mov	x0, x19  // guest 0x10b322, sampled 0
6c513b7770:    	adrp	x16, 0x6c97751000 <trace+0x4639b000>  // guest 0x10b322, sampled 0
6c513b7774:    	add	x16, x16, #0x4f0  // guest 0x10b322, sampled 0
6c513b7778:    	blr	x16  // guest 0x10b322, sampled 0
6c513b777c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b322, sampled 0
6c513b7780:    	and	x16, x16, x25, lsr #7  // guest 0x10b322, sampled 0
6c513b7784:    	add	x17, x17, x16  // guest 0x10b322, sampled 0
6c513b7788:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b322, sampled 0
6c513b778c:    	and	w30, w25, #0xfffff003  // guest 0x10b322, sampled 0
6c513b7790:    	cmp	w16, w30  // guest 0x10b322, sampled 0
6c513b7794:    	b.ne	0x6c513b8350 <trace+0x2b10>  // guest 0x10b322, sampled 0
6c513b7798:    	add	x30, x17, w25, uxtw  // guest 0x10b322, sampled 0
6c513b779c:    	stlr	w0, [x30]  // guest 0x10b322, sampled 0
6c513b77a0:    	sxtw	x25, w20  // guest 0x10b322, sampled 0
6c513b77a4:    	add	x25, x25, x19  // guest 0x10b322, sampled 0
6c513b77a8:    	strb	w27, [x25, #0x190]  // guest 0x10b322, sampled 0
6c513b77ac:    	add	w20, w20, w27  // guest 0x10b322, sampled 0
6c513b77b0:    	and	w20, w20, #0x7  // guest 0x10b322, sampled 0
6c513b77b4:    	str	w20, [x19, #0x188]  // guest 0x10b322, sampled 0
6c513b77b8:    	ldr	w20, [x19, #0x64]  // guest 0x10b322, sampled 0
6c513b77bc:    	strh	w20, [x19, #0x224]  // guest 0x10b322, sampled 0
6c513b77c0:    	str	w26, [x19, #0x230]  // guest 0x10b322, sampled 0
6c513b77c4:    	ldr	w20, [x19, #0x54]  // guest 0x10b322, sampled 0
6c513b77c8:    	strh	w20, [x19, #0x222]  // guest 0x10b322, sampled 0
6c513b77cc:    	mov	w20, #0xb322            // =45858  // guest 0x10b322, sampled 0
6c513b77d0:    	movk	w20, #0x10, lsl #16  // guest 0x10b322, sampled 0
6c513b77d4:    	str	w20, [x19, #0x228]  // guest 0x10b322, sampled 0
6c513b77d8:    	add	w20, w22, #0x4c  // guest 0x10b326, sampled 0
6c513b77dc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b326, sampled 0
6c513b77e0:    	and	x16, x16, x20, lsr #7  // guest 0x10b326, sampled 0
6c513b77e4:    	add	x17, x17, x16  // guest 0x10b326, sampled 0
6c513b77e8:    	ldp	x16, x17, [x17]  // guest 0x10b326, sampled 0
6c513b77ec:    	and	w30, w20, #0xfffff003  // guest 0x10b326, sampled 0
6c513b77f0:    	cmp	w16, w30  // guest 0x10b326, sampled 0
6c513b77f4:    	b.ne	0x6c513b837c <trace+0x2b3c>  // guest 0x10b326, sampled 0
6c513b77f8:    	add	x30, x17, w20, uxtw  // guest 0x10b326, sampled 0
6c513b77fc:    	ldapr	w20, [x30]  // guest 0x10b326, sampled 0
6c513b7800:    	str	w20, [x19, #0x4]  // guest 0x10b326, sampled 0
6c513b7804:    	add	w24, w24, #0x8  // guest 0x10b32a, sampled 0
6c513b7808:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b32a, sampled 0
6c513b780c:    	and	x16, x16, x24, lsr #7  // guest 0x10b32a, sampled 0
6c513b7810:    	add	x17, x17, x16  // guest 0x10b32a, sampled 0
6c513b7814:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b32a, sampled 0
6c513b7818:    	and	w30, w24, #0xfffff003  // guest 0x10b32a, sampled 0
6c513b781c:    	cmp	w16, w30  // guest 0x10b32a, sampled 0
6c513b7820:    	b.ne	0x6c513b83a8 <trace+0x2b68>  // guest 0x10b32a, sampled 0
6c513b7824:    	add	x30, x17, w24, uxtw  // guest 0x10b32a, sampled 0
6c513b7828:    	stlr	w20, [x30]  // guest 0x10b32a, sampled 0
6c513b782c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b32d, sampled 0
6c513b7830:    	and	x16, x16, x23, lsr #7  // guest 0x10b32d, sampled 0
6c513b7834:    	add	x17, x17, x16  // guest 0x10b32d, sampled 0
6c513b7838:    	ldp	x16, x17, [x17]  // guest 0x10b32d, sampled 0
6c513b783c:    	and	w30, w23, #0xfffff003  // guest 0x10b32d, sampled 0
6c513b7840:    	cmp	w16, w30  // guest 0x10b32d, sampled 0
6c513b7844:    	b.ne	0x6c513b83d4 <trace+0x2b94>  // guest 0x10b32d, sampled 0
6c513b7848:    	add	x30, x17, w23, uxtw  // guest 0x10b32d, sampled 0
6c513b784c:    	ldapr	w20, [x30]  // guest 0x10b32d, sampled 0
6c513b7850:    	str	w20, [x19, #0x8]  // guest 0x10b32d, sampled 0
6c513b7854:    	add	w23, w22, #0x5c  // guest 0x10b333, sampled 0
6c513b7858:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b333, sampled 0
6c513b785c:    	and	x16, x16, x23, lsr #7  // guest 0x10b333, sampled 0
6c513b7860:    	add	x17, x17, x16  // guest 0x10b333, sampled 0
6c513b7864:    	ldp	x16, x17, [x17]  // guest 0x10b333, sampled 0
6c513b7868:    	and	w30, w23, #0xfffff003  // guest 0x10b333, sampled 0
6c513b786c:    	cmp	w16, w30  // guest 0x10b333, sampled 0
6c513b7870:    	b.ne	0x6c513b8400 <trace+0x2bc0>  // guest 0x10b333, sampled 0
6c513b7874:    	add	x30, x17, w23, uxtw  // guest 0x10b333, sampled 0
6c513b7878:    	ldapr	w23, [x30]  // guest 0x10b333, sampled 0
6c513b787c:    	str	w23, [x19, #0x4]  // guest 0x10b333, sampled 0
6c513b7880:    	add	w20, w20, w21  // guest 0x10b337, sampled 0
6c513b7884:    	add	w20, w20, #0xc  // guest 0x10b337, sampled 0
6c513b7888:    	str	w20, [x19]  // guest 0x10b337, sampled 0
6c513b788c:    	add	w21, w22, #0x60  // guest 0x10b33b, sampled 0
6c513b7890:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b33b, sampled 0
6c513b7894:    	and	x16, x16, x21, lsr #7  // guest 0x10b33b, sampled 0
6c513b7898:    	add	x17, x17, x16  // guest 0x10b33b, sampled 0
6c513b789c:    	ldp	x16, x17, [x17]  // guest 0x10b33b, sampled 0
6c513b78a0:    	and	w30, w21, #0xfffff003  // guest 0x10b33b, sampled 0
6c513b78a4:    	cmp	w16, w30  // guest 0x10b33b, sampled 0
6c513b78a8:    	b.ne	0x6c513b842c <trace+0x2bec>  // guest 0x10b33b, sampled 0
6c513b78ac:    	add	x30, x17, w21, uxtw  // guest 0x10b33b, sampled 0
6c513b78b0:    	ldapr	w21, [x30]  // guest 0x10b33b, sampled 0
6c513b78b4:    	str	w21, [x19, #0x8]  // guest 0x10b33b, sampled 0
6c513b78b8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b33f, sampled 0
6c513b78bc:    	and	x16, x16, x20, lsr #7  // guest 0x10b33f, sampled 0
6c513b78c0:    	add	x17, x17, x16  // guest 0x10b33f, sampled 0
6c513b78c4:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b33f, sampled 0
6c513b78c8:    	and	w30, w20, #0xfffff003  // guest 0x10b33f, sampled 0
6c513b78cc:    	cmp	w16, w30  // guest 0x10b33f, sampled 0
6c513b78d0:    	b.ne	0x6c513b8458 <trace+0x2c18>  // guest 0x10b33f, sampled 0
6c513b78d4:    	add	x30, x17, w20, uxtw  // guest 0x10b33f, sampled 0
6c513b78d8:    	stlr	w23, [x30]  // guest 0x10b33f, sampled 0
6c513b78dc:    	add	w23, w22, #0x64  // guest 0x10b341, sampled 0
6c513b78e0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b341, sampled 0
6c513b78e4:    	and	x16, x16, x23, lsr #7  // guest 0x10b341, sampled 0
6c513b78e8:    	add	x17, x17, x16  // guest 0x10b341, sampled 0
6c513b78ec:    	ldp	x16, x17, [x17]  // guest 0x10b341, sampled 0
6c513b78f0:    	and	w30, w23, #0xfffff003  // guest 0x10b341, sampled 0
6c513b78f4:    	cmp	w16, w30  // guest 0x10b341, sampled 0
6c513b78f8:    	b.ne	0x6c513b8484 <trace+0x2c44>  // guest 0x10b341, sampled 0
6c513b78fc:    	add	x30, x17, w23, uxtw  // guest 0x10b341, sampled 0
6c513b7900:    	ldapr	w23, [x30]  // guest 0x10b341, sampled 0
6c513b7904:    	str	w23, [x19, #0x4]  // guest 0x10b341, sampled 0
6c513b7908:    	add	w24, w20, #0x4  // guest 0x10b345, sampled 0
6c513b790c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b345, sampled 0
6c513b7910:    	and	x16, x16, x24, lsr #7  // guest 0x10b345, sampled 0
6c513b7914:    	add	x17, x17, x16  // guest 0x10b345, sampled 0
6c513b7918:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b345, sampled 0
6c513b791c:    	and	w30, w24, #0xfffff003  // guest 0x10b345, sampled 0
6c513b7920:    	cmp	w16, w30  // guest 0x10b345, sampled 0
6c513b7924:    	b.ne	0x6c513b84b0 <trace+0x2c70>  // guest 0x10b345, sampled 0
6c513b7928:    	add	x30, x17, w24, uxtw  // guest 0x10b345, sampled 0
6c513b792c:    	stlr	w21, [x30]  // guest 0x10b345, sampled 0
6c513b7930:    	ldr	w21, [x19, #0x14]  // guest 0x10b348, sampled 0
6c513b7934:    	add	w21, w21, #0x4  // guest 0x10b348, sampled 0
6c513b7938:    	str	w21, [x19, #0x14]  // guest 0x10b348, sampled 0
6c513b793c:    	str	w21, [x19, #0x28]  // guest 0x10b348, sampled 0
6c513b7940:    	mov	w21, #0x4               // =4  // guest 0x10b348, sampled 0
6c513b7944:    	str	w21, [x19, #0x2c]  // guest 0x10b348, sampled 0
6c513b7948:    	add	w20, w20, #0x8  // guest 0x10b34b, sampled 0
6c513b794c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b34b, sampled 0
6c513b7950:    	and	x16, x16, x20, lsr #7  // guest 0x10b34b, sampled 0
6c513b7954:    	add	x17, x17, x16  // guest 0x10b34b, sampled 0
6c513b7958:    	ldp	x17, x16, [x17, #0x8]  // guest 0x10b34b, sampled 0
6c513b795c:    	and	w30, w20, #0xfffff003  // guest 0x10b34b, sampled 0
6c513b7960:    	cmp	w16, w30  // guest 0x10b34b, sampled 0
6c513b7964:    	b.ne	0x6c513b84dc <trace+0x2c9c>  // guest 0x10b34b, sampled 0
6c513b7968:    	add	x30, x17, w20, uxtw  // guest 0x10b34b, sampled 0
6c513b796c:    	stlr	w23, [x30]  // guest 0x10b34b, sampled 0
6c513b7970:    	add	w20, w22, #0x10  // guest 0x10b34e, sampled 0
6c513b7974:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x10b34e, sampled 0
6c513b7978:    	and	x16, x16, x20, lsr #7  // guest 0x10b34e, sampled 0
6c513b797c:    	add	x17, x17, x16  // guest 0x10b34e, sampled 0
6c513b7980:    	ldp	x16, x17, [x17]  // guest 0x10b34e, sampled 0
6c513b7984:    	and	w30, w20, #0xfffff003  // guest 0x10b34e, sampled 0
6c513b7988:    	cmp	w16, w30  // guest 0x10b34e, sampled 0
6c513b798c:    	b.ne	0x6c513b8508 <trace+0x2cc8>  // guest 0x10b34e, sampled 0
6c513b7990:    	add	x30, x17, w20, uxtw  // guest 0x10b34e, sampled 0
6c513b7994:    	ldapr	w20, [x30]  // guest 0x10b34e, sampled 0
6c513b7998:    	str	w20, [x19]  // guest 0x10b34e, sampled 0
6c513b799c:    	ldr	w21, [x19, #0x1c]  // guest 0x10b352, sampled 0
6c513b79a0:    	add	w21, w21, w27  // guest 0x10b352, sampled 0
6c513b79a4:    	str	w21, [x19, #0x1c]  // guest 0x10b352, sampled 0
6c513b79a8:    	sub	w22, w21, w20  // guest 0x10b353, sampled 0
6c513b79ac:    	str	w22, [x19, #0x28]  // guest 0x10b353, sampled 0
6c513b79b0:    	str	w20, [x19, #0x2c]  // guest 0x10b353, sampled 0
6c513b79b4:    	sturb	w27, [x19, #-0xc]  // guest 0x10b353, sampled 0
6c513b79b8:    	mov	w22, #0x12              // =18  // guest 0x10b355, sampled 0
6c513b79bc:    	str	w22, [x19, #0x34]  // guest 0x10b355, sampled 0
6c513b79c0:    	cmp	w21, w20  // guest 0x10b355, sampled 0
6c513b79c4:    	b.lt	0x6c513b79e4 <trace+0x21a4>  // guest 0x10b355, sampled 0
6c513b79c8:    	b	0x6c513b79c8 <trace+0x2188>  // guest 0x10b355, sampled 0
6c513b79cc:    	br	x16  // guest 0x10b355, sampled 0
6c513b79d0:    	mov	w20, #0xb35b            // =45915  // guest 0x10b355, sampled 0
6c513b79d4:    	movk	w20, #0x10, lsl #16  // guest 0x10b355, sampled 0
6c513b79d8:    	str	w20, [x19, #0x20]  // guest 0x10b355, sampled 0
6c513b79dc:    	adr	x0, 0x6c513b5781 <trace+0xffffffffffffff41>  // guest 0x10b355, sampled 0
6c513b79e0:    	b	0x6c4ae5d02c <trace+0xfffffffff9aa77ec>  // guest 0x10b355, sampled 0
6c513b79e4:    	b	0x6c513b79e4 <trace+0x21a4>  // guest 0x10b355, sampled 0
6c513b79e8:    	br	x16  // guest 0x10b355, sampled 0
6c513b79ec:    	mov	w20, #0xb211            // =45585  // guest 0x10b355, sampled 0
6c513b79f0:    	movk	w20, #0x10, lsl #16  // guest 0x10b355, sampled 0
6c513b79f4:    	str	w20, [x19, #0x20]  // guest 0x10b355, sampled 0
6c513b79f8:    	adr	x0, 0x6c513b5780 <trace+0xffffffffffffff40>  // guest 0x10b355, sampled 0
6c513b79fc:    	b	0x6c4ae5d02c <trace+0xfffffffff9aa77ec>  // guest 0x10b355, sampled 0
6c513b7a00:    	adr	x0, 0x6c513b5783 <trace+0xffffffffffffff43>  // guest 0x10b355, sampled 0
6c513b7a04:    	b	0x6c4ae5d02c <trace+0xfffffffff9aa77ec>  // guest 0x10b355, sampled 0
6c513b7a08:    	mov	w1, w20
6c513b7a0c:    	mov	x0, x19
6c513b7a10:    	mov	w2, #0x4045             // =16453
6c513b7a14:    	movk	w2, #0x1, lsl #16
6c513b7a18:    	adr	x3, 0x6c513b5878 <trace+0x38>
6c513b7a1c:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7a20:    	add	x16, x16, #0xf88
6c513b7a24:    	blr	x16
6c513b7a28:    	mov	w20, w0
6c513b7a2c:    	dmb	ishld
6c513b7a30:    	b	0x6c513b5878 <trace+0x38>
6c513b7a34:    	mov	w1, w22
6c513b7a38:    	mov	x0, x19
6c513b7a3c:    	mov	w2, #0x4045             // =16453
6c513b7a40:    	movk	w2, #0x1, lsl #16
6c513b7a44:    	adr	x3, 0x6c513b58d0 <trace+0x90>
6c513b7a48:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7a4c:    	add	x16, x16, #0xf88
6c513b7a50:    	blr	x16
6c513b7a54:    	mov	w22, w0
6c513b7a58:    	dmb	ishld
6c513b7a5c:    	b	0x6c513b58d0 <trace+0x90>
6c513b7a60:    	mov	w1, w23
6c513b7a64:    	mov	x0, x19
6c513b7a68:    	mov	w2, #0x4045             // =16453
6c513b7a6c:    	movk	w2, #0x1, lsl #16
6c513b7a70:    	adr	x3, 0x6c513b5900 <trace+0xc0>
6c513b7a74:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7a78:    	add	x16, x16, #0xf88
6c513b7a7c:    	blr	x16
6c513b7a80:    	mov	w2, w0
6c513b7a84:    	dmb	ishld
6c513b7a88:    	b	0x6c513b5900 <trace+0xc0>
6c513b7a8c:    	mov	w1, w25
6c513b7a90:    	mov	x0, x19
6c513b7a94:    	mov	w2, #0x4045             // =16453
6c513b7a98:    	movk	w2, #0x1, lsl #16
6c513b7a9c:    	adr	x3, 0x6c513b59b8 <trace+0x178>
6c513b7aa0:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7aa4:    	add	x16, x16, #0xf88
6c513b7aa8:    	blr	x16
6c513b7aac:    	mov	w2, w0
6c513b7ab0:    	dmb	ishld
6c513b7ab4:    	b	0x6c513b59b8 <trace+0x178>
6c513b7ab8:    	mov	w1, w26
6c513b7abc:    	mov	x0, x19
6c513b7ac0:    	mov	w2, #0x4045             // =16453
6c513b7ac4:    	movk	w2, #0x1, lsl #16
6c513b7ac8:    	adr	x3, 0x6c513b5a50 <trace+0x210>
6c513b7acc:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7ad0:    	add	x16, x16, #0xf88
6c513b7ad4:    	blr	x16
6c513b7ad8:    	mov	w2, w0
6c513b7adc:    	dmb	ishld
6c513b7ae0:    	b	0x6c513b5a50 <trace+0x210>
6c513b7ae4:    	mov	w1, w26
6c513b7ae8:    	mov	x0, x19
6c513b7aec:    	mov	w2, #0x4045             // =16453
6c513b7af0:    	movk	w2, #0x1, lsl #16
6c513b7af4:    	adr	x3, 0x6c513b5adc <trace+0x29c>
6c513b7af8:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7afc:    	add	x16, x16, #0xf88
6c513b7b00:    	blr	x16
6c513b7b04:    	mov	w2, w0
6c513b7b08:    	dmb	ishld
6c513b7b0c:    	b	0x6c513b5adc <trace+0x29c>
6c513b7b10:    	mov	w1, w26
6c513b7b14:    	mov	x0, x19
6c513b7b18:    	mov	w2, #0x4045             // =16453
6c513b7b1c:    	movk	w2, #0x1, lsl #16
6c513b7b20:    	adr	x3, 0x6c513b5bc8 <trace+0x388>
6c513b7b24:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7b28:    	add	x16, x16, #0xf88
6c513b7b2c:    	blr	x16
6c513b7b30:    	mov	w2, w0
6c513b7b34:    	dmb	ishld
6c513b7b38:    	b	0x6c513b5bc8 <trace+0x388>
6c513b7b3c:    	mov	w1, w25
6c513b7b40:    	mov	x0, x19
6c513b7b44:    	mov	w2, #0x4045             // =16453
6c513b7b48:    	movk	w2, #0x1, lsl #16
6c513b7b4c:    	adr	x3, 0x6c513b5c4c <trace+0x40c>
6c513b7b50:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7b54:    	add	x16, x16, #0xf88
6c513b7b58:    	blr	x16
6c513b7b5c:    	mov	w2, w0
6c513b7b60:    	dmb	ishld
6c513b7b64:    	b	0x6c513b5c4c <trace+0x40c>
6c513b7b68:    	mov	w1, w26
6c513b7b6c:    	mov	x0, x19
6c513b7b70:    	mov	w2, #0x4045             // =16453
6c513b7b74:    	movk	w2, #0x1, lsl #16
6c513b7b78:    	adr	x3, 0x6c513b5d34 <trace+0x4f4>
6c513b7b7c:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7b80:    	add	x16, x16, #0xf88
6c513b7b84:    	blr	x16
6c513b7b88:    	mov	w2, w0
6c513b7b8c:    	dmb	ishld
6c513b7b90:    	b	0x6c513b5d34 <trace+0x4f4>
6c513b7b94:    	mov	w1, w26
6c513b7b98:    	mov	x0, x19
6c513b7b9c:    	mov	w2, #0x4045             // =16453
6c513b7ba0:    	movk	w2, #0x1, lsl #16
6c513b7ba4:    	adr	x3, 0x6c513b5dc0 <trace+0x580>
6c513b7ba8:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7bac:    	add	x16, x16, #0xf88
6c513b7bb0:    	blr	x16
6c513b7bb4:    	mov	w2, w0
6c513b7bb8:    	dmb	ishld
6c513b7bbc:    	b	0x6c513b5dc0 <trace+0x580>
6c513b7bc0:    	mov	w1, w26
6c513b7bc4:    	mov	x0, x19
6c513b7bc8:    	mov	w2, #0x4045             // =16453
6c513b7bcc:    	movk	w2, #0x1, lsl #16
6c513b7bd0:    	adr	x3, 0x6c513b5e44 <trace+0x604>
6c513b7bd4:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7bd8:    	add	x16, x16, #0xf88
6c513b7bdc:    	blr	x16
6c513b7be0:    	mov	w2, w0
6c513b7be4:    	dmb	ishld
6c513b7be8:    	b	0x6c513b5e44 <trace+0x604>
6c513b7bec:    	mov	w1, w26
6c513b7bf0:    	mov	x0, x19
6c513b7bf4:    	mov	w2, #0x4045             // =16453
6c513b7bf8:    	movk	w2, #0x1, lsl #16
6c513b7bfc:    	adr	x3, 0x6c513b5ed0 <trace+0x690>
6c513b7c00:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7c04:    	add	x16, x16, #0xf88
6c513b7c08:    	blr	x16
6c513b7c0c:    	mov	w2, w0
6c513b7c10:    	dmb	ishld
6c513b7c14:    	b	0x6c513b5ed0 <trace+0x690>
6c513b7c18:    	mov	w1, w25
6c513b7c1c:    	mov	x0, x19
6c513b7c20:    	mov	w2, #0x4045             // =16453
6c513b7c24:    	movk	w2, #0x1, lsl #16
6c513b7c28:    	adr	x3, 0x6c513b5fb0 <trace+0x770>
6c513b7c2c:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7c30:    	add	x16, x16, #0xf88
6c513b7c34:    	blr	x16
6c513b7c38:    	mov	w2, w0
6c513b7c3c:    	dmb	ishld
6c513b7c40:    	b	0x6c513b5fb0 <trace+0x770>
6c513b7c44:    	mov	w1, w26
6c513b7c48:    	mov	x0, x19
6c513b7c4c:    	mov	w2, #0x4045             // =16453
6c513b7c50:    	movk	w2, #0x1, lsl #16
6c513b7c54:    	adr	x3, 0x6c513b603c <trace+0x7fc>
6c513b7c58:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7c5c:    	add	x16, x16, #0xf88
6c513b7c60:    	blr	x16
6c513b7c64:    	mov	w2, w0
6c513b7c68:    	dmb	ishld
6c513b7c6c:    	b	0x6c513b603c <trace+0x7fc>
6c513b7c70:    	mov	w1, w26
6c513b7c74:    	mov	x0, x19
6c513b7c78:    	mov	w2, #0x4045             // =16453
6c513b7c7c:    	movk	w2, #0x1, lsl #16
6c513b7c80:    	adr	x3, 0x6c513b6124 <trace+0x8e4>
6c513b7c84:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7c88:    	add	x16, x16, #0xf88
6c513b7c8c:    	blr	x16
6c513b7c90:    	mov	w2, w0
6c513b7c94:    	dmb	ishld
6c513b7c98:    	b	0x6c513b6124 <trace+0x8e4>
6c513b7c9c:    	mov	w1, w26
6c513b7ca0:    	mov	x0, x19
6c513b7ca4:    	mov	w2, #0x4045             // =16453
6c513b7ca8:    	movk	w2, #0x1, lsl #16
6c513b7cac:    	adr	x3, 0x6c513b61b0 <trace+0x970>
6c513b7cb0:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7cb4:    	add	x16, x16, #0xf88
6c513b7cb8:    	blr	x16
6c513b7cbc:    	mov	w2, w0
6c513b7cc0:    	dmb	ishld
6c513b7cc4:    	b	0x6c513b61b0 <trace+0x970>
6c513b7cc8:    	mov	w1, w26
6c513b7ccc:    	mov	x0, x19
6c513b7cd0:    	mov	w2, #0x4045             // =16453
6c513b7cd4:    	movk	w2, #0x1, lsl #16
6c513b7cd8:    	adr	x3, 0x6c513b6234 <trace+0x9f4>
6c513b7cdc:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7ce0:    	add	x16, x16, #0xf88
6c513b7ce4:    	blr	x16
6c513b7ce8:    	mov	w2, w0
6c513b7cec:    	dmb	ishld
6c513b7cf0:    	b	0x6c513b6234 <trace+0x9f4>
6c513b7cf4:    	mov	w1, w22
6c513b7cf8:    	mov	x0, x19
6c513b7cfc:    	mov	w2, #0x4045             // =16453
6c513b7d00:    	movk	w2, #0x1, lsl #16
6c513b7d04:    	adr	x3, 0x6c513b62c0 <trace+0xa80>
6c513b7d08:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7d0c:    	add	x16, x16, #0xf88
6c513b7d10:    	blr	x16
6c513b7d14:    	mov	w2, w0
6c513b7d18:    	dmb	ishld
6c513b7d1c:    	b	0x6c513b62c0 <trace+0xa80>
6c513b7d20:    	mov	w1, w25
6c513b7d24:    	mov	x0, x19
6c513b7d28:    	mov	w2, #0x4045             // =16453
6c513b7d2c:    	movk	w2, #0x1, lsl #16
6c513b7d30:    	adr	x3, 0x6c513b63a0 <trace+0xb60>
6c513b7d34:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7d38:    	add	x16, x16, #0xf88
6c513b7d3c:    	blr	x16
6c513b7d40:    	mov	w2, w0
6c513b7d44:    	dmb	ishld
6c513b7d48:    	b	0x6c513b63a0 <trace+0xb60>
6c513b7d4c:    	mov	w1, w21
6c513b7d50:    	mov	x0, x19
6c513b7d54:    	mov	w2, #0x4045             // =16453
6c513b7d58:    	movk	w2, #0x1, lsl #16
6c513b7d5c:    	adr	x3, 0x6c513b6428 <trace+0xbe8>
6c513b7d60:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7d64:    	add	x16, x16, #0xf88
6c513b7d68:    	blr	x16
6c513b7d6c:    	mov	w21, w0
6c513b7d70:    	dmb	ishld
6c513b7d74:    	b	0x6c513b6428 <trace+0xbe8>
6c513b7d78:    	mov	w1, w20
6c513b7d7c:    	mov	x0, x19
6c513b7d80:    	mov	w2, #0x4045             // =16453
6c513b7d84:    	movk	w2, #0x1, lsl #16
6c513b7d88:    	adr	x3, 0x6c513b6458 <trace+0xc18>
6c513b7d8c:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7d90:    	add	x16, x16, #0xf88
6c513b7d94:    	blr	x16
6c513b7d98:    	mov	w2, w0
6c513b7d9c:    	dmb	ishld
6c513b7da0:    	b	0x6c513b6458 <trace+0xc18>
6c513b7da4:    	mov	w1, w21
6c513b7da8:    	mov	w2, w0
6c513b7dac:    	mov	x0, x19
6c513b7db0:    	mov	w3, #0x4045             // =16453
6c513b7db4:    	movk	w3, #0x1, lsl #16
6c513b7db8:    	adr	x4, 0x6c513b6570 <trace+0xd30>
6c513b7dbc:    	adrp	x16, 0x6c97724000 <trace+0x4636f000>
6c513b7dc0:    	add	x16, x16, #0xb68
6c513b7dc4:    	blr	x16
6c513b7dc8:    	dmb	ishld
6c513b7dcc:    	b	0x6c513b6570 <trace+0xd30>
6c513b7dd0:    	mov	w1, w20
6c513b7dd4:    	mov	x0, x19
6c513b7dd8:    	mov	w2, #0x4045             // =16453
6c513b7ddc:    	movk	w2, #0x1, lsl #16
6c513b7de0:    	adr	x3, 0x6c513b65f8 <trace+0xdb8>
6c513b7de4:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7de8:    	add	x16, x16, #0xf88
6c513b7dec:    	blr	x16
6c513b7df0:    	mov	w2, w0
6c513b7df4:    	dmb	ishld
6c513b7df8:    	b	0x6c513b65f8 <trace+0xdb8>
6c513b7dfc:    	mov	w1, w23
6c513b7e00:    	mov	w2, w0
6c513b7e04:    	mov	x0, x19
6c513b7e08:    	mov	w3, #0x4045             // =16453
6c513b7e0c:    	movk	w3, #0x1, lsl #16
6c513b7e10:    	adr	x4, 0x6c513b66a4 <trace+0xe64>
6c513b7e14:    	adrp	x16, 0x6c97724000 <trace+0x4636f000>
6c513b7e18:    	add	x16, x16, #0xb68
6c513b7e1c:    	blr	x16
6c513b7e20:    	dmb	ishld
6c513b7e24:    	b	0x6c513b66a4 <trace+0xe64>
6c513b7e28:    	mov	w1, w23
6c513b7e2c:    	mov	x0, x19
6c513b7e30:    	mov	w2, #0x4045             // =16453
6c513b7e34:    	movk	w2, #0x1, lsl #16
6c513b7e38:    	adr	x3, 0x6c513b6708 <trace+0xec8>
6c513b7e3c:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7e40:    	add	x16, x16, #0xf88
6c513b7e44:    	blr	x16
6c513b7e48:    	mov	w2, w0
6c513b7e4c:    	dmb	ishld
6c513b7e50:    	b	0x6c513b6708 <trace+0xec8>
6c513b7e54:    	mov	w1, w23
6c513b7e58:    	mov	w2, w0
6c513b7e5c:    	mov	x0, x19
6c513b7e60:    	mov	w3, #0x4045             // =16453
6c513b7e64:    	movk	w3, #0x1, lsl #16
6c513b7e68:    	adr	x4, 0x6c513b67ac <trace+0xf6c>
6c513b7e6c:    	adrp	x16, 0x6c97724000 <trace+0x4636f000>
6c513b7e70:    	add	x16, x16, #0xb68
6c513b7e74:    	blr	x16
6c513b7e78:    	dmb	ishld
6c513b7e7c:    	b	0x6c513b67ac <trace+0xf6c>
6c513b7e80:    	mov	w1, w23
6c513b7e84:    	mov	x0, x19
6c513b7e88:    	mov	w2, #0x4045             // =16453
6c513b7e8c:    	movk	w2, #0x1, lsl #16
6c513b7e90:    	adr	x3, 0x6c513b6810 <trace+0xfd0>
6c513b7e94:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7e98:    	add	x16, x16, #0xf88
6c513b7e9c:    	blr	x16
6c513b7ea0:    	mov	w2, w0
6c513b7ea4:    	dmb	ishld
6c513b7ea8:    	b	0x6c513b6810 <trace+0xfd0>
6c513b7eac:    	mov	w1, w23
6c513b7eb0:    	mov	x0, x19
6c513b7eb4:    	mov	w2, #0x4045             // =16453
6c513b7eb8:    	movk	w2, #0x1, lsl #16
6c513b7ebc:    	adr	x3, 0x6c513b689c <trace+0x105c>
6c513b7ec0:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7ec4:    	add	x16, x16, #0xf88
6c513b7ec8:    	blr	x16
6c513b7ecc:    	mov	w2, w0
6c513b7ed0:    	dmb	ishld
6c513b7ed4:    	b	0x6c513b689c <trace+0x105c>
6c513b7ed8:    	mov	w1, w23
6c513b7edc:    	mov	w2, w0
6c513b7ee0:    	mov	x0, x19
6c513b7ee4:    	mov	w3, #0x4045             // =16453
6c513b7ee8:    	movk	w3, #0x1, lsl #16
6c513b7eec:    	adr	x4, 0x6c513b6940 <trace+0x1100>
6c513b7ef0:    	adrp	x16, 0x6c97724000 <trace+0x4636f000>
6c513b7ef4:    	add	x16, x16, #0xb68
6c513b7ef8:    	blr	x16
6c513b7efc:    	dmb	ishld
6c513b7f00:    	b	0x6c513b6940 <trace+0x1100>
6c513b7f04:    	mov	w1, w23
6c513b7f08:    	mov	x0, x19
6c513b7f0c:    	mov	w2, #0x4045             // =16453
6c513b7f10:    	movk	w2, #0x1, lsl #16
6c513b7f14:    	adr	x3, 0x6c513b69a4 <trace+0x1164>
6c513b7f18:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7f1c:    	add	x16, x16, #0xf88
6c513b7f20:    	blr	x16
6c513b7f24:    	mov	w2, w0
6c513b7f28:    	dmb	ishld
6c513b7f2c:    	b	0x6c513b69a4 <trace+0x1164>
6c513b7f30:    	mov	w1, w24
6c513b7f34:    	mov	x0, x19
6c513b7f38:    	mov	w2, #0x4045             // =16453
6c513b7f3c:    	movk	w2, #0x1, lsl #16
6c513b7f40:    	adr	x3, 0x6c513b6a34 <trace+0x11f4>
6c513b7f44:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7f48:    	add	x16, x16, #0xf88
6c513b7f4c:    	blr	x16
6c513b7f50:    	mov	w2, w0
6c513b7f54:    	dmb	ishld
6c513b7f58:    	b	0x6c513b6a34 <trace+0x11f4>
6c513b7f5c:    	mov	w1, w24
6c513b7f60:    	mov	x0, x19
6c513b7f64:    	mov	w2, #0x4045             // =16453
6c513b7f68:    	movk	w2, #0x1, lsl #16
6c513b7f6c:    	adr	x3, 0x6c513b6ab8 <trace+0x1278>
6c513b7f70:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7f74:    	add	x16, x16, #0xf88
6c513b7f78:    	blr	x16
6c513b7f7c:    	mov	w2, w0
6c513b7f80:    	dmb	ishld
6c513b7f84:    	b	0x6c513b6ab8 <trace+0x1278>
6c513b7f88:    	mov	w1, w24
6c513b7f8c:    	mov	x0, x19
6c513b7f90:    	mov	w2, #0x4045             // =16453
6c513b7f94:    	movk	w2, #0x1, lsl #16
6c513b7f98:    	adr	x3, 0x6c513b6b44 <trace+0x1304>
6c513b7f9c:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7fa0:    	add	x16, x16, #0xf88
6c513b7fa4:    	blr	x16
6c513b7fa8:    	mov	w2, w0
6c513b7fac:    	dmb	ishld
6c513b7fb0:    	b	0x6c513b6b44 <trace+0x1304>
6c513b7fb4:    	mov	w1, w24
6c513b7fb8:    	mov	x0, x19
6c513b7fbc:    	mov	w2, #0x4045             // =16453
6c513b7fc0:    	movk	w2, #0x1, lsl #16
6c513b7fc4:    	adr	x3, 0x6c513b6c2c <trace+0x13ec>
6c513b7fc8:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7fcc:    	add	x16, x16, #0xf88
6c513b7fd0:    	blr	x16
6c513b7fd4:    	mov	w2, w0
6c513b7fd8:    	dmb	ishld
6c513b7fdc:    	b	0x6c513b6c2c <trace+0x13ec>
6c513b7fe0:    	mov	w1, w23
6c513b7fe4:    	mov	x0, x19
6c513b7fe8:    	mov	w2, #0x4045             // =16453
6c513b7fec:    	movk	w2, #0x1, lsl #16
6c513b7ff0:    	adr	x3, 0x6c513b6cb0 <trace+0x1470>
6c513b7ff4:    	adrp	x16, 0x6c97723000 <trace+0x4636e000>
6c513b7ff8:    	add	x16, x16, #0xf88
6c513b7ffc:    	blr	x16
6c513b8000:    	mov	w2, w0
6c513b8004:    	dmb	ishld
6c513b8008:    	b	0x6c513b6cb0 <trace+0x1470>
6c513b800c:    	mov	w1, w24
6c513b8010:    	mov	w2, w0
6c513b8014:    	mov	x0, x19
6c513b8018:    	mov	w3, #0x4045             // =16453
6c513b801c:    	movk	w3, #0x1, lsl #16
6c513b8020:    	adr	x4, 0x6c513b6db8 <trace+0x1578>
6c513b8024:    	adrp	x16, 0x6c97724000 <trace+0x4636e000>
6c513b8028:    	add	x16, x16, #0xb68
6c513b802c:    	blr	x16
6c513b8030:    	dmb	ishld
6c513b8034:    	b	0x6c513b6db8 <trace+0x1578>
6c513b8038:    	mov	w1, w24
6c513b803c:    	mov	x0, x19
6c513b8040:    	mov	w2, #0x4045             // =16453
6c513b8044:    	movk	w2, #0x1, lsl #16
6c513b8048:    	adr	x3, 0x6c513b6e1c <trace+0x15dc>
6c513b804c:    	adrp	x16, 0x6c97723000 <trace+0x4636d000>
6c513b8050:    	add	x16, x16, #0xf88
6c513b8054:    	blr	x16
6c513b8058:    	mov	w2, w0
6c513b805c:    	dmb	ishld
6c513b8060:    	b	0x6c513b6e1c <trace+0x15dc>
6c513b8064:    	mov	w1, w24
6c513b8068:    	mov	x0, x19
6c513b806c:    	mov	w2, #0x4045             // =16453
6c513b8070:    	movk	w2, #0x1, lsl #16
6c513b8074:    	adr	x3, 0x6c513b6ea8 <trace+0x1668>
6c513b8078:    	adrp	x16, 0x6c97723000 <trace+0x4636d000>
6c513b807c:    	add	x16, x16, #0xf88
6c513b8080:    	blr	x16
6c513b8084:    	mov	w2, w0
6c513b8088:    	dmb	ishld
6c513b808c:    	b	0x6c513b6ea8 <trace+0x1668>
6c513b8090:    	mov	w1, w24
6c513b8094:    	mov	x0, x19
6c513b8098:    	mov	w2, #0x4045             // =16453
6c513b809c:    	movk	w2, #0x1, lsl #16
6c513b80a0:    	adr	x3, 0x6c513b6f2c <trace+0x16ec>
6c513b80a4:    	adrp	x16, 0x6c97723000 <trace+0x4636d000>
6c513b80a8:    	add	x16, x16, #0xf88
6c513b80ac:    	blr	x16
6c513b80b0:    	mov	w2, w0
6c513b80b4:    	dmb	ishld
6c513b80b8:    	b	0x6c513b6f2c <trace+0x16ec>
6c513b80bc:    	mov	w1, w24
6c513b80c0:    	mov	x0, x19
6c513b80c4:    	mov	w2, #0x4045             // =16453
6c513b80c8:    	movk	w2, #0x1, lsl #16
6c513b80cc:    	adr	x3, 0x6c513b6fb8 <trace+0x1778>
6c513b80d0:    	adrp	x16, 0x6c97723000 <trace+0x4636d000>
6c513b80d4:    	add	x16, x16, #0xf88
6c513b80d8:    	blr	x16
6c513b80dc:    	mov	w2, w0
6c513b80e0:    	dmb	ishld
6c513b80e4:    	b	0x6c513b6fb8 <trace+0x1778>
6c513b80e8:    	mov	w1, w24
6c513b80ec:    	mov	x0, x19
6c513b80f0:    	mov	w2, #0x4045             // =16453
6c513b80f4:    	movk	w2, #0x1, lsl #16
6c513b80f8:    	adr	x3, 0x6c513b70a0 <trace+0x1860>
6c513b80fc:    	adrp	x16, 0x6c97723000 <trace+0x4636d000>
6c513b8100:    	add	x16, x16, #0xf88
6c513b8104:    	blr	x16
6c513b8108:    	mov	w2, w0
6c513b810c:    	dmb	ishld
6c513b8110:    	b	0x6c513b70a0 <trace+0x1860>
6c513b8114:    	mov	w1, w23
6c513b8118:    	mov	x0, x19
6c513b811c:    	mov	w2, #0x4045             // =16453
6c513b8120:    	movk	w2, #0x1, lsl #16
6c513b8124:    	adr	x3, 0x6c513b7124 <trace+0x18e4>
6c513b8128:    	adrp	x16, 0x6c97723000 <trace+0x4636d000>
6c513b812c:    	add	x16, x16, #0xf88
6c513b8130:    	blr	x16
6c513b8134:    	mov	w2, w0
6c513b8138:    	dmb	ishld
6c513b813c:    	b	0x6c513b7124 <trace+0x18e4>
6c513b8140:    	mov	w1, w24
6c513b8144:    	mov	w2, w0
6c513b8148:    	mov	x0, x19
6c513b814c:    	mov	w3, #0x4045             // =16453
6c513b8150:    	movk	w3, #0x1, lsl #16
6c513b8154:    	adr	x4, 0x6c513b722c <trace+0x19ec>
6c513b8158:    	adrp	x16, 0x6c97724000 <trace+0x4636e000>
6c513b815c:    	add	x16, x16, #0xb68
6c513b8160:    	blr	x16
6c513b8164:    	dmb	ishld
6c513b8168:    	b	0x6c513b722c <trace+0x19ec>
6c513b816c:    	mov	w1, w24
6c513b8170:    	mov	x0, x19
6c513b8174:    	mov	w2, #0x4045             // =16453
6c513b8178:    	movk	w2, #0x1, lsl #16
6c513b817c:    	adr	x3, 0x6c513b7290 <trace+0x1a50>
6c513b8180:    	adrp	x16, 0x6c97723000 <trace+0x4636d000>
6c513b8184:    	add	x16, x16, #0xf88
6c513b8188:    	blr	x16
6c513b818c:    	mov	w2, w0
6c513b8190:    	dmb	ishld
6c513b8194:    	b	0x6c513b7290 <trace+0x1a50>
6c513b8198:    	mov	w1, w24
6c513b819c:    	mov	x0, x19
6c513b81a0:    	mov	w2, #0x4045             // =16453
6c513b81a4:    	movk	w2, #0x1, lsl #16
6c513b81a8:    	adr	x3, 0x6c513b731c <trace+0x1adc>
6c513b81ac:    	adrp	x16, 0x6c97723000 <trace+0x4636d000>
6c513b81b0:    	add	x16, x16, #0xf88
6c513b81b4:    	blr	x16
6c513b81b8:    	mov	w2, w0
6c513b81bc:    	dmb	ishld
6c513b81c0:    	b	0x6c513b731c <trace+0x1adc>
6c513b81c4:    	mov	w1, w24
6c513b81c8:    	mov	x0, x19
6c513b81cc:    	mov	w2, #0x4045             // =16453
6c513b81d0:    	movk	w2, #0x1, lsl #16
6c513b81d4:    	adr	x3, 0x6c513b73a0 <trace+0x1b60>
6c513b81d8:    	adrp	x16, 0x6c97723000 <trace+0x4636d000>
6c513b81dc:    	add	x16, x16, #0xf88
6c513b81e0:    	blr	x16
6c513b81e4:    	mov	w2, w0
6c513b81e8:    	dmb	ishld
6c513b81ec:    	b	0x6c513b73a0 <trace+0x1b60>
6c513b81f0:    	mov	w1, w24
6c513b81f4:    	mov	x0, x19
6c513b81f8:    	mov	w2, #0x4045             // =16453
6c513b81fc:    	movk	w2, #0x1, lsl #16
6c513b8200:    	adr	x3, 0x6c513b742c <trace+0x1bec>
6c513b8204:    	adrp	x16, 0x6c97723000 <trace+0x4636d000>
6c513b8208:    	add	x16, x16, #0xf88
6c513b820c:    	blr	x16
6c513b8210:    	mov	w2, w0
6c513b8214:    	dmb	ishld
6c513b8218:    	b	0x6c513b742c <trace+0x1bec>
6c513b821c:    	mov	w1, w20
6c513b8220:    	mov	x0, x19
6c513b8224:    	mov	w2, #0x4045             // =16453
6c513b8228:    	movk	w2, #0x1, lsl #16
6c513b822c:    	adr	x3, 0x6c513b7514 <trace+0x1cd4>
6c513b8230:    	adrp	x16, 0x6c97723000 <trace+0x4636d000>
6c513b8234:    	add	x16, x16, #0xf88
6c513b8238:    	blr	x16
6c513b823c:    	mov	w2, w0
6c513b8240:    	dmb	ishld
6c513b8244:    	b	0x6c513b7514 <trace+0x1cd4>
6c513b8248:    	mov	w1, w23
6c513b824c:    	mov	x0, x19
6c513b8250:    	mov	w2, #0x4045             // =16453
6c513b8254:    	movk	w2, #0x1, lsl #16
6c513b8258:    	adr	x3, 0x6c513b75a8 <trace+0x1d68>
6c513b825c:    	adrp	x16, 0x6c97723000 <trace+0x4636d000>
6c513b8260:    	add	x16, x16, #0xf88
6c513b8264:    	blr	x16
6c513b8268:    	mov	w2, w0
6c513b826c:    	dmb	ishld
6c513b8270:    	b	0x6c513b75a8 <trace+0x1d68>
6c513b8274:    	mov	w1, w23
6c513b8278:    	mov	x0, x19
6c513b827c:    	mov	w2, #0x4045             // =16453
6c513b8280:    	movk	w2, #0x1, lsl #16
6c513b8284:    	adr	x3, 0x6c513b762c <trace+0x1dec>
6c513b8288:    	adrp	x16, 0x6c97723000 <trace+0x4636d000>
6c513b828c:    	add	x16, x16, #0xf88
6c513b8290:    	blr	x16
6c513b8294:    	mov	w24, w0
6c513b8298:    	dmb	ishld
6c513b829c:    	b	0x6c513b762c <trace+0x1dec>
6c513b82a0:    	mov	w1, w25
6c513b82a4:    	mov	x0, x19
6c513b82a8:    	mov	w2, #0x4045             // =16453
6c513b82ac:    	movk	w2, #0x1, lsl #16
6c513b82b0:    	adr	x3, 0x6c513b7674 <trace+0x1e34>
6c513b82b4:    	adrp	x16, 0x6c97723000 <trace+0x4636d000>
6c513b82b8:    	add	x16, x16, #0xf88
6c513b82bc:    	blr	x16
6c513b82c0:    	mov	w25, w0
6c513b82c4:    	dmb	ishld
6c513b82c8:    	b	0x6c513b7674 <trace+0x1e34>
6c513b82cc:    	mov	w1, w24
6c513b82d0:    	mov	w2, w25
6c513b82d4:    	mov	x0, x19
6c513b82d8:    	mov	w3, #0x4045             // =16453
6c513b82dc:    	movk	w3, #0x1, lsl #16
6c513b82e0:    	adr	x4, 0x6c513b7700 <trace+0x1ec0>
6c513b82e4:    	adrp	x16, 0x6c97724000 <trace+0x4636e000>
6c513b82e8:    	add	x16, x16, #0xb68
6c513b82ec:    	blr	x16
6c513b82f0:    	dmb	ishld
6c513b82f4:    	b	0x6c513b7700 <trace+0x1ec0>
6c513b82f8:    	mov	w1, w25
6c513b82fc:    	mov	x0, x19
6c513b8300:    	mov	w2, #0x4045             // =16453
6c513b8304:    	movk	w2, #0x1, lsl #16
6c513b8308:    	adr	x3, 0x6c513b7728 <trace+0x1ee8>
6c513b830c:    	adrp	x16, 0x6c97723000 <trace+0x4636d000>
6c513b8310:    	add	x16, x16, #0xf88
6c513b8314:    	blr	x16
6c513b8318:    	mov	w25, w0
6c513b831c:    	dmb	ishld
6c513b8320:    	b	0x6c513b7728 <trace+0x1ee8>
6c513b8324:    	mov	w1, w26
6c513b8328:    	mov	w2, w25
6c513b832c:    	mov	x0, x19
6c513b8330:    	mov	w3, #0x4045             // =16453
6c513b8334:    	movk	w3, #0x1, lsl #16
6c513b8338:    	adr	x4, 0x6c513b7754 <trace+0x1f14>
6c513b833c:    	adrp	x16, 0x6c97724000 <trace+0x4636e000>
6c513b8340:    	add	x16, x16, #0xb68
6c513b8344:    	blr	x16
6c513b8348:    	dmb	ishld
6c513b834c:    	b	0x6c513b7754 <trace+0x1f14>
6c513b8350:    	mov	w1, w25
6c513b8354:    	mov	w2, w0
6c513b8358:    	mov	x0, x19
6c513b835c:    	mov	w3, #0x4045             // =16453
6c513b8360:    	movk	w3, #0x1, lsl #16
6c513b8364:    	adr	x4, 0x6c513b77a0 <trace+0x1f60>
6c513b8368:    	adrp	x16, 0x6c97724000 <trace+0x4636e000>
6c513b836c:    	add	x16, x16, #0xb68
6c513b8370:    	blr	x16
6c513b8374:    	dmb	ishld
6c513b8378:    	b	0x6c513b77a0 <trace+0x1f60>
6c513b837c:    	mov	w1, w20
6c513b8380:    	mov	x0, x19
6c513b8384:    	mov	w2, #0x4045             // =16453
6c513b8388:    	movk	w2, #0x1, lsl #16
6c513b838c:    	adr	x3, 0x6c513b7800 <trace+0x1fc0>
6c513b8390:    	adrp	x16, 0x6c97723000 <trace+0x4636d000>
6c513b8394:    	add	x16, x16, #0xf88
6c513b8398:    	blr	x16
6c513b839c:    	mov	w20, w0
6c513b83a0:    	dmb	ishld
6c513b83a4:    	b	0x6c513b7800 <trace+0x1fc0>
6c513b83a8:    	mov	w1, w24
6c513b83ac:    	mov	w2, w20
6c513b83b0:    	mov	x0, x19
6c513b83b4:    	mov	w3, #0x4045             // =16453
6c513b83b8:    	movk	w3, #0x1, lsl #16
6c513b83bc:    	adr	x4, 0x6c513b782c <trace+0x1fec>
6c513b83c0:    	adrp	x16, 0x6c97724000 <trace+0x4636e000>
6c513b83c4:    	add	x16, x16, #0xb68
6c513b83c8:    	blr	x16
6c513b83cc:    	dmb	ishld
6c513b83d0:    	b	0x6c513b782c <trace+0x1fec>
6c513b83d4:    	mov	w1, w23
6c513b83d8:    	mov	x0, x19
6c513b83dc:    	mov	w2, #0x4045             // =16453
6c513b83e0:    	movk	w2, #0x1, lsl #16
6c513b83e4:    	adr	x3, 0x6c513b7850 <trace+0x2010>
6c513b83e8:    	adrp	x16, 0x6c97723000 <trace+0x4636d000>
6c513b83ec:    	add	x16, x16, #0xf88
6c513b83f0:    	blr	x16
6c513b83f4:    	mov	w20, w0
6c513b83f8:    	dmb	ishld
6c513b83fc:    	b	0x6c513b7850 <trace+0x2010>
6c513b8400:    	mov	w1, w23
6c513b8404:    	mov	x0, x19
6c513b8408:    	mov	w2, #0x4045             // =16453
6c513b840c:    	movk	w2, #0x1, lsl #16
6c513b8410:    	adr	x3, 0x6c513b787c <trace+0x203c>
6c513b8414:    	adrp	x16, 0x6c97723000 <trace+0x4636d000>
6c513b8418:    	add	x16, x16, #0xf88
6c513b841c:    	blr	x16
6c513b8420:    	mov	w23, w0
6c513b8424:    	dmb	ishld
6c513b8428:    	b	0x6c513b787c <trace+0x203c>
6c513b842c:    	mov	w1, w21
6c513b8430:    	mov	x0, x19
6c513b8434:    	mov	w2, #0x4045             // =16453
6c513b8438:    	movk	w2, #0x1, lsl #16
6c513b843c:    	adr	x3, 0x6c513b78b4 <trace+0x2074>
6c513b8440:    	adrp	x16, 0x6c97723000 <trace+0x4636d000>
6c513b8444:    	add	x16, x16, #0xf88
6c513b8448:    	blr	x16
6c513b844c:    	mov	w21, w0
6c513b8450:    	dmb	ishld
6c513b8454:    	b	0x6c513b78b4 <trace+0x2074>
6c513b8458:    	mov	w1, w20
6c513b845c:    	mov	w2, w23
6c513b8460:    	mov	x0, x19
6c513b8464:    	mov	w3, #0x4045             // =16453
6c513b8468:    	movk	w3, #0x1, lsl #16
6c513b846c:    	adr	x4, 0x6c513b78dc <trace+0x209c>
6c513b8470:    	adrp	x16, 0x6c97724000 <trace+0x4636e000>
6c513b8474:    	add	x16, x16, #0xb68
6c513b8478:    	blr	x16
6c513b847c:    	dmb	ishld
6c513b8480:    	b	0x6c513b78dc <trace+0x209c>
6c513b8484:    	mov	w1, w23
6c513b8488:    	mov	x0, x19
6c513b848c:    	mov	w2, #0x4045             // =16453
6c513b8490:    	movk	w2, #0x1, lsl #16
6c513b8494:    	adr	x3, 0x6c513b7904 <trace+0x20c4>
6c513b8498:    	adrp	x16, 0x6c97723000 <trace+0x4636d000>
6c513b849c:    	add	x16, x16, #0xf88
6c513b84a0:    	blr	x16
6c513b84a4:    	mov	w23, w0
6c513b84a8:    	dmb	ishld
6c513b84ac:    	b	0x6c513b7904 <trace+0x20c4>
6c513b84b0:    	mov	w1, w24
6c513b84b4:    	mov	w2, w21
6c513b84b8:    	mov	x0, x19
6c513b84bc:    	mov	w3, #0x4045             // =16453
6c513b84c0:    	movk	w3, #0x1, lsl #16
6c513b84c4:    	adr	x4, 0x6c513b7930 <trace+0x20f0>
6c513b84c8:    	adrp	x16, 0x6c97724000 <trace+0x4636e000>
6c513b84cc:    	add	x16, x16, #0xb68
6c513b84d0:    	blr	x16
6c513b84d4:    	dmb	ishld
6c513b84d8:    	b	0x6c513b7930 <trace+0x20f0>
6c513b84dc:    	mov	w1, w20
6c513b84e0:    	mov	w2, w23
6c513b84e4:    	mov	x0, x19
6c513b84e8:    	mov	w3, #0x4045             // =16453
6c513b84ec:    	movk	w3, #0x1, lsl #16
6c513b84f0:    	adr	x4, 0x6c513b7970 <trace+0x2130>
6c513b84f4:    	adrp	x16, 0x6c97724000 <trace+0x4636e000>
6c513b84f8:    	add	x16, x16, #0xb68
6c513b84fc:    	blr	x16
6c513b8500:    	dmb	ishld
6c513b8504:    	b	0x6c513b7970 <trace+0x2130>
6c513b8508:    	mov	w1, w20
6c513b850c:    	mov	x0, x19
6c513b8510:    	mov	w2, #0x4045             // =16453
6c513b8514:    	movk	w2, #0x1, lsl #16
6c513b8518:    	adr	x3, 0x6c513b7998 <trace+0x2158>
6c513b851c:    	adrp	x16, 0x6c97723000 <trace+0x4636d000>
6c513b8520:    	add	x16, x16, #0xf88
6c513b8524:    	blr	x16
6c513b8528:    	mov	w20, w0
6c513b852c:    	dmb	ishld
6c513b8530:    	b	0x6c513b7998 <trace+0x2158>