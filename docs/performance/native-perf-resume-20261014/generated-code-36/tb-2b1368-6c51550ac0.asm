
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-2b1368-6c51550ac0.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006c51550ac0 <trace>:
6c51550ac0:    	ldur	w20, [x19, #-0x10]  // guest 0x2b1368, sampled 0
6c51550ac4:    	tbnz	w20, #0x1f, 0x6c51551974 <trace+0xeb4>  // guest 0x2b1368, sampled 0
6c51550ac8:    	sturb	wzr, [x19, #-0xc]  // guest 0x2b1368, sampled 0
6c51550acc:    	ldr	w20, [x19]  // guest 0x2b1368, sampled 0
6c51550ad0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b1368, sampled 0
6c51550ad4:    	and	x16, x16, x20, lsr #7  // guest 0x2b1368, sampled 0
6c51550ad8:    	add	x17, x17, x16  // guest 0x2b1368, sampled 0
6c51550adc:    	ldp	x16, x17, [x17]  // guest 0x2b1368, sampled 0
6c51550ae0:    	and	w30, w20, #0xfffff003  // guest 0x2b1368, sampled 0
6c51550ae4:    	cmp	w16, w30  // guest 0x2b1368, sampled 0
6c51550ae8:    	b.ne	0x6c5155197c <trace+0xebc>  // guest 0x2b1368, sampled 0
6c51550aec:    	add	x30, x17, w20, uxtw  // guest 0x2b1368, sampled 0
6c51550af0:    	ldapr	w2, [x30]  // guest 0x2b1368, sampled 0
6c51550af4:    	ldr	w21, [x19, #0x188]  // guest 0x2b1368, sampled 1
6c51550af8:    	add	w22, w21, #0x7  // guest 0x2b1368, sampled 0
6c51550afc:    	and	w22, w22, #0x7  // guest 0x2b1368, sampled 0
6c51550b00:    	lsl	w22, w22, #4  // guest 0x2b1368, sampled 0
6c51550b04:    	add	w22, w22, #0x1a0  // guest 0x2b1368, sampled 0
6c51550b08:    	sxtw	x22, w22  // guest 0x2b1368, sampled 0
6c51550b0c:    	add	x1, x22, x19  // guest 0x2b1368, sampled 0
6c51550b10:    	mov	x0, x19  // guest 0x2b1368, sampled 0
6c51550b14:    	adrp	x16, 0x6c97751000 <trace+0x46201000>  // guest 0x2b1368, sampled 0
6c51550b18:    	add	x16, x16, #0x3b4  // guest 0x2b1368, sampled 0
6c51550b1c:    	blr	x16  // guest 0x2b1368, sampled 0
6c51550b20:    	sub	w21, w21, #0x1  // guest 0x2b1368, sampled 0
6c51550b24:    	and	w21, w21, #0x7  // guest 0x2b1368, sampled 0
6c51550b28:    	str	w21, [x19, #0x188]  // guest 0x2b1368, sampled 0
6c51550b2c:    	sxtw	x22, w21  // guest 0x2b1368, sampled 0
6c51550b30:    	add	x22, x22, x19  // guest 0x2b1368, sampled 0
6c51550b34:    	strb	wzr, [x22, #0x190]  // guest 0x2b1368, sampled 0
6c51550b38:    	ldr	w22, [x19, #0x74]  // guest 0x2b1368, sampled 0
6c51550b3c:    	strh	w22, [x19, #0x224]  // guest 0x2b1368, sampled 0
6c51550b40:    	str	w20, [x19, #0x230]  // guest 0x2b1368, sampled 0
6c51550b44:    	ldr	w22, [x19, #0x54]  // guest 0x2b1368, sampled 0
6c51550b48:    	strh	w22, [x19, #0x222]  // guest 0x2b1368, sampled 0
6c51550b4c:    	mov	w22, #0x1368            // =4968  // guest 0x2b1368, sampled 0
6c51550b50:    	movk	w22, #0x2b, lsl #16  // guest 0x2b1368, sampled 0
6c51550b54:    	str	w22, [x19, #0x228]  // guest 0x2b1368, sampled 0
6c51550b58:    	ldr	w22, [x19, #0x8]  // guest 0x2b136a, sampled 0
6c51550b5c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b136a, sampled 0
6c51550b60:    	and	x16, x16, x22, lsr #7  // guest 0x2b136a, sampled 0
6c51550b64:    	add	x17, x17, x16  // guest 0x2b136a, sampled 0
6c51550b68:    	ldp	x16, x17, [x17]  // guest 0x2b136a, sampled 0
6c51550b6c:    	and	w30, w22, #0xfffff003  // guest 0x2b136a, sampled 0
6c51550b70:    	cmp	w16, w30  // guest 0x2b136a, sampled 0
6c51550b74:    	b.ne	0x6c515519a8 <trace+0xee8>  // guest 0x2b136a, sampled 0
6c51550b78:    	add	x30, x17, w22, uxtw  // guest 0x2b136a, sampled 0
6c51550b7c:    	ldapr	w22, [x30]  // guest 0x2b136a, sampled 0
6c51550b80:    	str	w22, [x19, #0x14]  // guest 0x2b136a, sampled 1
6c51550b84:    	ldr	w23, [x19, #0x18]  // guest 0x2b136c, sampled 0
6c51550b88:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b136c, sampled 0
6c51550b8c:    	and	x16, x16, x23, lsr #7  // guest 0x2b136c, sampled 0
6c51550b90:    	add	x17, x17, x16  // guest 0x2b136c, sampled 0
6c51550b94:    	ldp	x16, x17, [x17]  // guest 0x2b136c, sampled 0
6c51550b98:    	and	w30, w23, #0xfffff003  // guest 0x2b136c, sampled 0
6c51550b9c:    	cmp	w16, w30  // guest 0x2b136c, sampled 0
6c51550ba0:    	b.ne	0x6c515519d4 <trace+0xf14>  // guest 0x2b136c, sampled 0
6c51550ba4:    	add	x30, x17, w23, uxtw  // guest 0x2b136c, sampled 0
6c51550ba8:    	ldapr	w2, [x30]  // guest 0x2b136c, sampled 0
6c51550bac:    	add	w24, w21, #0x7  // guest 0x2b136c, sampled 0
6c51550bb0:    	and	w24, w24, #0x7  // guest 0x2b136c, sampled 0
6c51550bb4:    	lsl	w24, w24, #4  // guest 0x2b136c, sampled 0
6c51550bb8:    	add	w24, w24, #0x1a0  // guest 0x2b136c, sampled 0
6c51550bbc:    	sxtw	x24, w24  // guest 0x2b136c, sampled 0
6c51550bc0:    	add	x1, x24, x19  // guest 0x2b136c, sampled 0
6c51550bc4:    	mov	x0, x19  // guest 0x2b136c, sampled 0
6c51550bc8:    	adrp	x16, 0x6c97751000 <trace+0x46201000>  // guest 0x2b136c, sampled 0
6c51550bcc:    	add	x16, x16, #0x3b4  // guest 0x2b136c, sampled 1
6c51550bd0:    	blr	x16  // guest 0x2b136c, sampled 0
6c51550bd4:    	sub	w21, w21, #0x1  // guest 0x2b136c, sampled 0
6c51550bd8:    	and	w21, w21, #0x7  // guest 0x2b136c, sampled 0
6c51550bdc:    	str	w21, [x19, #0x188]  // guest 0x2b136c, sampled 0
6c51550be0:    	sxtw	x24, w21  // guest 0x2b136c, sampled 0
6c51550be4:    	add	x24, x24, x19  // guest 0x2b136c, sampled 0
6c51550be8:    	strb	wzr, [x24, #0x190]  // guest 0x2b136c, sampled 0
6c51550bec:    	ldr	w24, [x19, #0x74]  // guest 0x2b136c, sampled 0
6c51550bf0:    	strh	w24, [x19, #0x224]  // guest 0x2b136c, sampled 0
6c51550bf4:    	str	w23, [x19, #0x230]  // guest 0x2b136c, sampled 0
6c51550bf8:    	ldr	w24, [x19, #0x54]  // guest 0x2b136c, sampled 0
6c51550bfc:    	strh	w24, [x19, #0x222]  // guest 0x2b136c, sampled 0
6c51550c00:    	mov	w24, #0x136c            // =4972  // guest 0x2b136c, sampled 0
6c51550c04:    	movk	w24, #0x2b, lsl #16  // guest 0x2b136c, sampled 0
6c51550c08:    	str	w24, [x19, #0x228]  // guest 0x2b136c, sampled 0
6c51550c0c:    	ldr	w24, [x19, #0x10]  // guest 0x2b136e, sampled 0
6c51550c10:    	add	w25, w24, #0x20  // guest 0x2b136e, sampled 0
6c51550c14:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b136e, sampled 0
6c51550c18:    	and	x16, x16, x25, lsr #7  // guest 0x2b136e, sampled 0
6c51550c1c:    	add	x17, x17, x16  // guest 0x2b136e, sampled 0
6c51550c20:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2b136e, sampled 0
6c51550c24:    	and	w30, w25, #0xfffff003  // guest 0x2b136e, sampled 0
6c51550c28:    	cmp	w16, w30  // guest 0x2b136e, sampled 0
6c51550c2c:    	b.ne	0x6c51551a00 <trace+0xf40>  // guest 0x2b136e, sampled 0
6c51550c30:    	add	x30, x17, w25, uxtw  // guest 0x2b136e, sampled 0
6c51550c34:    	stlr	w22, [x30]  // guest 0x2b136e, sampled 0
6c51550c38:    	sub	w21, w21, #0x1  // guest 0x2b1372, sampled 0
6c51550c3c:    	and	w21, w21, #0x7  // guest 0x2b1372, sampled 0
6c51550c40:    	str	w21, [x19, #0x188]  // guest 0x2b1372, sampled 0
6c51550c44:    	sxtw	x22, w21  // guest 0x2b1372, sampled 0
6c51550c48:    	add	x22, x22, x19  // guest 0x2b1372, sampled 0
6c51550c4c:    	strb	wzr, [x22, #0x190]  // guest 0x2b1372, sampled 0
6c51550c50:    	lsl	w22, w21, #4  // guest 0x2b1372, sampled 0
6c51550c54:    	add	w22, w22, #0x1a0  // guest 0x2b1372, sampled 0
6c51550c58:    	sxtw	x22, w22  // guest 0x2b1372, sampled 0
6c51550c5c:    	add	x22, x22, x19  // guest 0x2b1372, sampled 0
6c51550c60:    	add	w25, w21, #0x2  // guest 0x2b1372, sampled 0
6c51550c64:    	and	w25, w25, #0x7  // guest 0x2b1372, sampled 0
6c51550c68:    	lsl	w25, w25, #4  // guest 0x2b1372, sampled 0
6c51550c6c:    	add	w25, w25, #0x1a0  // guest 0x2b1372, sampled 0
6c51550c70:    	sxtw	x25, w25  // guest 0x2b1372, sampled 0
6c51550c74:    	add	x25, x25, x19  // guest 0x2b1372, sampled 0
6c51550c78:    	ldr	x26, [x25]  // guest 0x2b1372, sampled 0
6c51550c7c:    	ldrh	w25, [x25, #0x8]  // guest 0x2b1372, sampled 0
6c51550c80:    	str	x26, [x22]  // guest 0x2b1372, sampled 0
6c51550c84:    	strh	w25, [x22, #0x8]  // guest 0x2b1372, sampled 0
6c51550c88:    	ldr	w22, [x19, #0x54]  // guest 0x2b1372, sampled 0
6c51550c8c:    	strh	w22, [x19, #0x222]  // guest 0x2b1372, sampled 0
6c51550c90:    	mov	w22, #0x1372            // =4978  // guest 0x2b1372, sampled 0
6c51550c94:    	movk	w22, #0x2b, lsl #16  // guest 0x2b1372, sampled 0
6c51550c98:    	str	w22, [x19, #0x228]  // guest 0x2b1372, sampled 0
6c51550c9c:    	add	w22, w24, #0x14  // guest 0x2b1374, sampled 0
6c51550ca0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b1374, sampled 0
6c51550ca4:    	and	x16, x16, x22, lsr #7  // guest 0x2b1374, sampled 0
6c51550ca8:    	add	x17, x17, x16  // guest 0x2b1374, sampled 0
6c51550cac:    	ldp	x16, x17, [x17]  // guest 0x2b1374, sampled 0
6c51550cb0:    	and	w30, w22, #0xfffff003  // guest 0x2b1374, sampled 0
6c51550cb4:    	cmp	w16, w30  // guest 0x2b1374, sampled 0
6c51550cb8:    	b.ne	0x6c51551a2c <trace+0xf6c>  // guest 0x2b1374, sampled 0
6c51550cbc:    	add	x30, x17, w22, uxtw  // guest 0x2b1374, sampled 0
6c51550cc0:    	ldapr	w22, [x30]  // guest 0x2b1374, sampled 0
6c51550cc4:    	str	w22, [x19, #0x14]  // guest 0x2b1374, sampled 1
6c51550cc8:    	add	x22, x19, #0x258  // guest 0x2b1378, sampled 0
6c51550ccc:    	add	w25, w21, #0x1  // guest 0x2b1378, sampled 0
6c51550cd0:    	and	w25, w25, #0x7  // guest 0x2b1378, sampled 0
6c51550cd4:    	lsl	w25, w25, #4  // guest 0x2b1378, sampled 0
6c51550cd8:    	add	w25, w25, #0x1a0  // guest 0x2b1378, sampled 0
6c51550cdc:    	sxtw	x25, w25  // guest 0x2b1378, sampled 0
6c51550ce0:    	add	x25, x25, x19  // guest 0x2b1378, sampled 0
6c51550ce4:    	ldr	x26, [x25]  // guest 0x2b1378, sampled 0
6c51550ce8:    	ldrh	w25, [x25, #0x8]  // guest 0x2b1378, sampled 0
6c51550cec:    	str	x26, [x22]  // guest 0x2b1378, sampled 0
6c51550cf0:    	strh	w25, [x22, #0x8]  // guest 0x2b1378, sampled 0
6c51550cf4:    	lsl	w22, w21, #4  // guest 0x2b1378, sampled 0
6c51550cf8:    	add	w22, w22, #0x1a0  // guest 0x2b1378, sampled 0
6c51550cfc:    	sxtw	x22, w22  // guest 0x2b1378, sampled 0
6c51550d00:    	add	x1, x22, x19  // guest 0x2b1378, sampled 0
6c51550d04:    	add	x2, x19, #0x258  // guest 0x2b1378, sampled 0
6c51550d08:    	mov	x0, x19  // guest 0x2b1378, sampled 0
6c51550d0c:    	adrp	x16, 0x6c97752000 <trace+0x46202000>  // guest 0x2b1378, sampled 0
6c51550d10:    	add	x16, x16, #0xb50  // guest 0x2b1378, sampled 0
6c51550d14:    	blr	x16  // guest 0x2b1378, sampled 0
6c51550d18:    	ldr	w22, [x19, #0x54]  // guest 0x2b1378, sampled 0
6c51550d1c:    	strh	w22, [x19, #0x222]  // guest 0x2b1378, sampled 0
6c51550d20:    	mov	w22, #0x1378            // =4984  // guest 0x2b1378, sampled 0
6c51550d24:    	movk	w22, #0x2b, lsl #16  // guest 0x2b1378, sampled 0
6c51550d28:    	str	w22, [x19, #0x228]  // guest 0x2b1378, sampled 0
6c51550d2c:    	ldr	w22, [x19, #0xc]  // guest 0x2b137a, sampled 0
6c51550d30:    	add	w22, w22, #0x8  // guest 0x2b137a, sampled 0
6c51550d34:    	str	w22, [x19, #0xc]  // guest 0x2b137a, sampled 0
6c51550d38:    	str	w22, [x19, #0x28]  // guest 0x2b137a, sampled 0
6c51550d3c:    	mov	w25, #0x8               // =8  // guest 0x2b137a, sampled 0
6c51550d40:    	str	w25, [x19, #0x2c]  // guest 0x2b137a, sampled 1
6c51550d44:    	add	w25, w24, #0x10  // guest 0x2b137d, sampled 0
6c51550d48:    	mov	w26, w25  // guest 0x2b137d, sampled 0
6c51550d4c:    	lsl	w27, w21, #4  // guest 0x2b137d, sampled 0
6c51550d50:    	add	w27, w27, #0x1a0  // guest 0x2b137d, sampled 0
6c51550d54:    	sxtw	x27, w27  // guest 0x2b137d, sampled 0
6c51550d58:    	add	x1, x27, x19  // guest 0x2b137d, sampled 0
6c51550d5c:    	mov	x0, x19  // guest 0x2b137d, sampled 0
6c51550d60:    	adrp	x16, 0x6c97751000 <trace+0x46201000>  // guest 0x2b137d, sampled 0
6c51550d64:    	add	x16, x16, #0x4f0  // guest 0x2b137d, sampled 0
6c51550d68:    	blr	x16  // guest 0x2b137d, sampled 0
6c51550d6c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b137d, sampled 0
6c51550d70:    	and	x16, x16, x25, lsr #7  // guest 0x2b137d, sampled 0
6c51550d74:    	add	x17, x17, x16  // guest 0x2b137d, sampled 0
6c51550d78:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2b137d, sampled 0
6c51550d7c:    	and	w30, w25, #0xfffff003  // guest 0x2b137d, sampled 1
6c51550d80:    	cmp	w16, w30  // guest 0x2b137d, sampled 0
6c51550d84:    	b.ne	0x6c51551a58 <trace+0xf98>  // guest 0x2b137d, sampled 0
6c51550d88:    	add	x30, x17, w25, uxtw  // guest 0x2b137d, sampled 0
6c51550d8c:    	stlr	w0, [x30]  // guest 0x2b137d, sampled 0
6c51550d90:    	sxtw	x25, w21  // guest 0x2b137d, sampled 0
6c51550d94:    	add	x25, x25, x19  // guest 0x2b137d, sampled 0
6c51550d98:    	mov	w27, #0x1               // =1  // guest 0x2b137d, sampled 0
6c51550d9c:    	strb	w27, [x25, #0x190]  // guest 0x2b137d, sampled 0
6c51550da0:    	add	w21, w21, w27  // guest 0x2b137d, sampled 0
6c51550da4:    	and	w21, w21, #0x7  // guest 0x2b137d, sampled 0
6c51550da8:    	str	w21, [x19, #0x188]  // guest 0x2b137d, sampled 0
6c51550dac:    	ldr	w25, [x19, #0x64]  // guest 0x2b137d, sampled 0
6c51550db0:    	strh	w25, [x19, #0x224]  // guest 0x2b137d, sampled 0
6c51550db4:    	str	w26, [x19, #0x230]  // guest 0x2b137d, sampled 0
6c51550db8:    	ldr	w25, [x19, #0x54]  // guest 0x2b137d, sampled 0
6c51550dbc:    	strh	w25, [x19, #0x222]  // guest 0x2b137d, sampled 0
6c51550dc0:    	mov	w25, #0x137d            // =4989  // guest 0x2b137d, sampled 0
6c51550dc4:    	movk	w25, #0x2b, lsl #16  // guest 0x2b137d, sampled 0
6c51550dc8:    	str	w25, [x19, #0x228]  // guest 0x2b137d, sampled 0
6c51550dcc:    	ldr	w25, [x19, #0x4]  // guest 0x2b1381, sampled 0
6c51550dd0:    	add	w26, w20, w25  // guest 0x2b1381, sampled 0
6c51550dd4:    	mov	w28, w26  // guest 0x2b1381, sampled 0
6c51550dd8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b1381, sampled 0
6c51550ddc:    	and	x16, x16, x26, lsr #7  // guest 0x2b1381, sampled 0
6c51550de0:    	add	x17, x17, x16  // guest 0x2b1381, sampled 0
6c51550de4:    	ldp	x16, x17, [x17]  // guest 0x2b1381, sampled 0
6c51550de8:    	and	w30, w26, #0xfffff003  // guest 0x2b1381, sampled 0
6c51550dec:    	cmp	w16, w30  // guest 0x2b1381, sampled 0
6c51550df0:    	b.ne	0x6c51551a84 <trace+0xfc4>  // guest 0x2b1381, sampled 0
6c51550df4:    	add	x30, x17, w26, uxtw  // guest 0x2b1381, sampled 0
6c51550df8:    	ldapr	w2, [x30]  // guest 0x2b1381, sampled 0
6c51550dfc:    	add	w26, w21, #0x7  // guest 0x2b1381, sampled 0
6c51550e00:    	and	w26, w26, #0x7  // guest 0x2b1381, sampled 0
6c51550e04:    	lsl	w26, w26, #4  // guest 0x2b1381, sampled 0
6c51550e08:    	add	w26, w26, #0x1a0  // guest 0x2b1381, sampled 0
6c51550e0c:    	sxtw	x26, w26  // guest 0x2b1381, sampled 0
6c51550e10:    	add	x1, x26, x19  // guest 0x2b1381, sampled 0
6c51550e14:    	mov	x0, x19  // guest 0x2b1381, sampled 0
6c51550e18:    	adrp	x16, 0x6c97751000 <trace+0x46201000>  // guest 0x2b1381, sampled 0
6c51550e1c:    	add	x16, x16, #0x3b4  // guest 0x2b1381, sampled 0
6c51550e20:    	blr	x16  // guest 0x2b1381, sampled 0
6c51550e24:    	sub	w21, w21, #0x1  // guest 0x2b1381, sampled 0
6c51550e28:    	and	w21, w21, #0x7  // guest 0x2b1381, sampled 0
6c51550e2c:    	str	w21, [x19, #0x188]  // guest 0x2b1381, sampled 0
6c51550e30:    	sxtw	x26, w21  // guest 0x2b1381, sampled 0
6c51550e34:    	add	x26, x26, x19  // guest 0x2b1381, sampled 0
6c51550e38:    	strb	wzr, [x26, #0x190]  // guest 0x2b1381, sampled 0
6c51550e3c:    	ldr	w26, [x19, #0x74]  // guest 0x2b1381, sampled 0
6c51550e40:    	strh	w26, [x19, #0x224]  // guest 0x2b1381, sampled 0
6c51550e44:    	str	w28, [x19, #0x230]  // guest 0x2b1381, sampled 0
6c51550e48:    	ldr	w26, [x19, #0x54]  // guest 0x2b1381, sampled 0
6c51550e4c:    	strh	w26, [x19, #0x222]  // guest 0x2b1381, sampled 0
6c51550e50:    	mov	w26, #0x1381            // =4993  // guest 0x2b1381, sampled 0
6c51550e54:    	movk	w26, #0x2b, lsl #16  // guest 0x2b1381, sampled 0
6c51550e58:    	str	w26, [x19, #0x228]  // guest 0x2b1381, sampled 0
6c51550e5c:    	add	w26, w24, #0x28  // guest 0x2b1384, sampled 0
6c51550e60:    	mov	w28, w26  // guest 0x2b1384, sampled 0
6c51550e64:    	lsl	w8, w21, #4  // guest 0x2b1384, sampled 0
6c51550e68:    	add	w8, w8, #0x1a0  // guest 0x2b1384, sampled 0
6c51550e6c:    	sxtw	x8, w8  // guest 0x2b1384, sampled 0
6c51550e70:    	add	x1, x8, x19  // guest 0x2b1384, sampled 0
6c51550e74:    	mov	x0, x19  // guest 0x2b1384, sampled 0
6c51550e78:    	adrp	x16, 0x6c97751000 <trace+0x46201000>  // guest 0x2b1384, sampled 0
6c51550e7c:    	add	x16, x16, #0x4f0  // guest 0x2b1384, sampled 0
6c51550e80:    	blr	x16  // guest 0x2b1384, sampled 0
6c51550e84:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b1384, sampled 0
6c51550e88:    	and	x16, x16, x26, lsr #7  // guest 0x2b1384, sampled 0
6c51550e8c:    	add	x17, x17, x16  // guest 0x2b1384, sampled 0
6c51550e90:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2b1384, sampled 0
6c51550e94:    	and	w30, w26, #0xfffff003  // guest 0x2b1384, sampled 0
6c51550e98:    	cmp	w16, w30  // guest 0x2b1384, sampled 0
6c51550e9c:    	b.ne	0x6c51551ab0 <trace+0xff0>  // guest 0x2b1384, sampled 0
6c51550ea0:    	add	x30, x17, w26, uxtw  // guest 0x2b1384, sampled 0
6c51550ea4:    	stlr	w0, [x30]  // guest 0x2b1384, sampled 0
6c51550ea8:    	ldr	w26, [x19, #0x64]  // guest 0x2b1384, sampled 0
6c51550eac:    	strh	w26, [x19, #0x224]  // guest 0x2b1384, sampled 0
6c51550eb0:    	str	w28, [x19, #0x230]  // guest 0x2b1384, sampled 0
6c51550eb4:    	ldr	w26, [x19, #0x54]  // guest 0x2b1384, sampled 0
6c51550eb8:    	strh	w26, [x19, #0x222]  // guest 0x2b1384, sampled 0
6c51550ebc:    	mov	w26, #0x1384            // =4996  // guest 0x2b1384, sampled 0
6c51550ec0:    	movk	w26, #0x2b, lsl #16  // guest 0x2b1384, sampled 0
6c51550ec4:    	str	w26, [x19, #0x228]  // guest 0x2b1384, sampled 0
6c51550ec8:    	add	w26, w24, #0x20  // guest 0x2b1388, sampled 0
6c51550ecc:    	mov	w28, w26  // guest 0x2b1388, sampled 0
6c51550ed0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b1388, sampled 0
6c51550ed4:    	and	x16, x16, x26, lsr #7  // guest 0x2b1388, sampled 0
6c51550ed8:    	add	x17, x17, x16  // guest 0x2b1388, sampled 0
6c51550edc:    	ldp	x16, x17, [x17]  // guest 0x2b1388, sampled 0
6c51550ee0:    	and	w30, w26, #0xfffff003  // guest 0x2b1388, sampled 0
6c51550ee4:    	cmp	w16, w30  // guest 0x2b1388, sampled 0
6c51550ee8:    	b.ne	0x6c51551adc <trace+0x101c>  // guest 0x2b1388, sampled 0
6c51550eec:    	add	x30, x17, w26, uxtw  // guest 0x2b1388, sampled 0
6c51550ef0:    	ldapr	w2, [x30]  // guest 0x2b1388, sampled 0
6c51550ef4:    	add	x1, x19, #0x258  // guest 0x2b1388, sampled 0
6c51550ef8:    	mov	x0, x19  // guest 0x2b1388, sampled 0
6c51550efc:    	adrp	x16, 0x6c97751000 <trace+0x46201000>  // guest 0x2b1388, sampled 0
6c51550f00:    	add	x16, x16, #0x3b4  // guest 0x2b1388, sampled 0
6c51550f04:    	blr	x16  // guest 0x2b1388, sampled 0
6c51550f08:    	lsl	w26, w21, #4  // guest 0x2b1388, sampled 0
6c51550f0c:    	add	w26, w26, #0x1a0  // guest 0x2b1388, sampled 0
6c51550f10:    	sxtw	x26, w26  // guest 0x2b1388, sampled 0
6c51550f14:    	add	x1, x26, x19  // guest 0x2b1388, sampled 0
6c51550f18:    	add	x2, x19, #0x258  // guest 0x2b1388, sampled 0
6c51550f1c:    	mov	x0, x19  // guest 0x2b1388, sampled 0
6c51550f20:    	adrp	x16, 0x6c97752000 <trace+0x46202000>  // guest 0x2b1388, sampled 0
6c51550f24:    	add	x16, x16, #0x9a8  // guest 0x2b1388, sampled 0
6c51550f28:    	blr	x16  // guest 0x2b1388, sampled 0
6c51550f2c:    	ldr	w26, [x19, #0x64]  // guest 0x2b1388, sampled 0
6c51550f30:    	strh	w26, [x19, #0x224]  // guest 0x2b1388, sampled 0
6c51550f34:    	str	w28, [x19, #0x230]  // guest 0x2b1388, sampled 0
6c51550f38:    	ldr	w26, [x19, #0x54]  // guest 0x2b1388, sampled 0
6c51550f3c:    	strh	w26, [x19, #0x222]  // guest 0x2b1388, sampled 0
6c51550f40:    	mov	w26, #0x1388            // =5000  // guest 0x2b1388, sampled 0
6c51550f44:    	movk	w26, #0x2b, lsl #16  // guest 0x2b1388, sampled 0
6c51550f48:    	str	w26, [x19, #0x228]  // guest 0x2b1388, sampled 0
6c51550f4c:    	add	w26, w24, #0x30  // guest 0x2b138c, sampled 0
6c51550f50:    	mov	w28, w26  // guest 0x2b138c, sampled 0
6c51550f54:    	lsl	w8, w21, #4  // guest 0x2b138c, sampled 0
6c51550f58:    	add	w8, w8, #0x1a0  // guest 0x2b138c, sampled 0
6c51550f5c:    	sxtw	x8, w8  // guest 0x2b138c, sampled 0
6c51550f60:    	add	x1, x8, x19  // guest 0x2b138c, sampled 0
6c51550f64:    	mov	x0, x19  // guest 0x2b138c, sampled 0
6c51550f68:    	adrp	x16, 0x6c97751000 <trace+0x46201000>  // guest 0x2b138c, sampled 0
6c51550f6c:    	add	x16, x16, #0x4f0  // guest 0x2b138c, sampled 0
6c51550f70:    	blr	x16  // guest 0x2b138c, sampled 1
6c51550f74:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b138c, sampled 0
6c51550f78:    	and	x16, x16, x26, lsr #7  // guest 0x2b138c, sampled 0
6c51550f7c:    	add	x17, x17, x16  // guest 0x2b138c, sampled 0
6c51550f80:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2b138c, sampled 0
6c51550f84:    	and	w30, w26, #0xfffff003  // guest 0x2b138c, sampled 0
6c51550f88:    	cmp	w16, w30  // guest 0x2b138c, sampled 0
6c51550f8c:    	b.ne	0x6c51551b08 <trace+0x1048>  // guest 0x2b138c, sampled 0
6c51550f90:    	add	x30, x17, w26, uxtw  // guest 0x2b138c, sampled 0
6c51550f94:    	stlr	w0, [x30]  // guest 0x2b138c, sampled 0
6c51550f98:    	sxtw	x26, w21  // guest 0x2b138c, sampled 0
6c51550f9c:    	add	x26, x26, x19  // guest 0x2b138c, sampled 0
6c51550fa0:    	strb	w27, [x26, #0x190]  // guest 0x2b138c, sampled 0
6c51550fa4:    	add	w21, w21, w27  // guest 0x2b138c, sampled 0
6c51550fa8:    	and	w21, w21, #0x7  // guest 0x2b138c, sampled 0
6c51550fac:    	str	w21, [x19, #0x188]  // guest 0x2b138c, sampled 0
6c51550fb0:    	ldr	w26, [x19, #0x64]  // guest 0x2b138c, sampled 0
6c51550fb4:    	strh	w26, [x19, #0x224]  // guest 0x2b138c, sampled 0
6c51550fb8:    	str	w28, [x19, #0x230]  // guest 0x2b138c, sampled 0
6c51550fbc:    	ldr	w26, [x19, #0x54]  // guest 0x2b138c, sampled 0
6c51550fc0:    	strh	w26, [x19, #0x222]  // guest 0x2b138c, sampled 0
6c51550fc4:    	mov	w26, #0x138c            // =5004  // guest 0x2b138c, sampled 0
6c51550fc8:    	movk	w26, #0x2b, lsl #16  // guest 0x2b138c, sampled 0
6c51550fcc:    	str	w26, [x19, #0x228]  // guest 0x2b138c, sampled 0
6c51550fd0:    	add	x26, x19, #0x258  // guest 0x2b1390, sampled 0
6c51550fd4:    	add	w28, w21, w27  // guest 0x2b1390, sampled 0
6c51550fd8:    	and	w28, w28, #0x7  // guest 0x2b1390, sampled 0
6c51550fdc:    	lsl	w28, w28, #4  // guest 0x2b1390, sampled 0
6c51550fe0:    	add	w28, w28, #0x1a0  // guest 0x2b1390, sampled 0
6c51550fe4:    	sxtw	x28, w28  // guest 0x2b1390, sampled 0
6c51550fe8:    	add	x28, x28, x19  // guest 0x2b1390, sampled 0
6c51550fec:    	ldr	x8, [x28]  // guest 0x2b1390, sampled 0
6c51550ff0:    	ldrh	w28, [x28, #0x8]  // guest 0x2b1390, sampled 1
6c51550ff4:    	str	x8, [x26]  // guest 0x2b1390, sampled 0
6c51550ff8:    	strh	w28, [x26, #0x8]  // guest 0x2b1390, sampled 0
6c51550ffc:    	lsl	w26, w21, #4  // guest 0x2b1390, sampled 0
6c51551000:    	add	w26, w26, #0x1a0  // guest 0x2b1390, sampled 0
6c51551004:    	sxtw	x26, w26  // guest 0x2b1390, sampled 0
6c51551008:    	add	x1, x26, x19  // guest 0x2b1390, sampled 0
6c5155100c:    	add	x2, x19, #0x258  // guest 0x2b1390, sampled 0
6c51551010:    	mov	x0, x19  // guest 0x2b1390, sampled 0
6c51551014:    	adrp	x16, 0x6c97752000 <trace+0x46201000>  // guest 0x2b1390, sampled 0
6c51551018:    	add	x16, x16, #0x9a8  // guest 0x2b1390, sampled 0
6c5155101c:    	blr	x16  // guest 0x2b1390, sampled 0
6c51551020:    	ldr	w26, [x19, #0x54]  // guest 0x2b1390, sampled 0
6c51551024:    	strh	w26, [x19, #0x222]  // guest 0x2b1390, sampled 0
6c51551028:    	mov	w26, #0x1390            // =5008  // guest 0x2b1390, sampled 0
6c5155102c:    	movk	w26, #0x2b, lsl #16  // guest 0x2b1390, sampled 0
6c51551030:    	str	w26, [x19, #0x228]  // guest 0x2b1390, sampled 0
6c51551034:    	lsl	w26, w21, #4  // guest 0x2b1392, sampled 0
6c51551038:    	add	w26, w26, #0x1a0  // guest 0x2b1392, sampled 0
6c5155103c:    	sxtw	x26, w26  // guest 0x2b1392, sampled 0
6c51551040:    	add	x1, x26, x19  // guest 0x2b1392, sampled 0
6c51551044:    	mov	x0, x19  // guest 0x2b1392, sampled 0
6c51551048:    	adrp	x16, 0x6c97751000 <trace+0x46200000>  // guest 0x2b1392, sampled 0
6c5155104c:    	add	x16, x16, #0x4f0  // guest 0x2b1392, sampled 0
6c51551050:    	blr	x16  // guest 0x2b1392, sampled 0
6c51551054:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b1392, sampled 0
6c51551058:    	and	x16, x16, x20, lsr #7  // guest 0x2b1392, sampled 0
6c5155105c:    	add	x17, x17, x16  // guest 0x2b1392, sampled 0
6c51551060:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2b1392, sampled 0
6c51551064:    	and	w30, w20, #0xfffff003  // guest 0x2b1392, sampled 0
6c51551068:    	cmp	w16, w30  // guest 0x2b1392, sampled 0
6c5155106c:    	b.ne	0x6c51551b34 <trace+0x1074>  // guest 0x2b1392, sampled 0
6c51551070:    	add	x30, x17, w20, uxtw  // guest 0x2b1392, sampled 0
6c51551074:    	stlr	w0, [x30]  // guest 0x2b1392, sampled 0
6c51551078:    	sxtw	x26, w21  // guest 0x2b1392, sampled 1
6c5155107c:    	add	x26, x26, x19  // guest 0x2b1392, sampled 0
6c51551080:    	strb	w27, [x26, #0x190]  // guest 0x2b1392, sampled 0
6c51551084:    	add	w21, w21, w27  // guest 0x2b1392, sampled 0
6c51551088:    	and	w21, w21, #0x7  // guest 0x2b1392, sampled 0
6c5155108c:    	ldr	w26, [x19, #0x74]  // guest 0x2b1392, sampled 0
6c51551090:    	strh	w26, [x19, #0x224]  // guest 0x2b1392, sampled 0
6c51551094:    	str	w20, [x19, #0x230]  // guest 0x2b1392, sampled 0
6c51551098:    	ldr	w26, [x19, #0x54]  // guest 0x2b1392, sampled 0
6c5155109c:    	strh	w26, [x19, #0x222]  // guest 0x2b1392, sampled 0
6c515510a0:    	mov	w26, #0x1392            // =5010  // guest 0x2b1392, sampled 0
6c515510a4:    	movk	w26, #0x2b, lsl #16  // guest 0x2b1392, sampled 0
6c515510a8:    	str	w26, [x19, #0x228]  // guest 0x2b1392, sampled 0
6c515510ac:    	lsl	w26, w21, #4  // guest 0x2b1394, sampled 0
6c515510b0:    	add	w26, w26, #0x1a0  // guest 0x2b1394, sampled 0
6c515510b4:    	sxtw	x26, w26  // guest 0x2b1394, sampled 0
6c515510b8:    	add	x26, x26, x19  // guest 0x2b1394, sampled 0
6c515510bc:    	lsl	w28, w21, #4  // guest 0x2b1394, sampled 0
6c515510c0:    	add	w28, w28, #0x1a0  // guest 0x2b1394, sampled 0
6c515510c4:    	sxtw	x28, w28  // guest 0x2b1394, sampled 0
6c515510c8:    	add	x28, x28, x19  // guest 0x2b1394, sampled 0
6c515510cc:    	ldr	x8, [x28]  // guest 0x2b1394, sampled 0
6c515510d0:    	ldrh	w28, [x28, #0x8]  // guest 0x2b1394, sampled 0
6c515510d4:    	str	x8, [x26]  // guest 0x2b1394, sampled 0
6c515510d8:    	strh	w28, [x26, #0x8]  // guest 0x2b1394, sampled 0
6c515510dc:    	sxtw	x26, w21  // guest 0x2b1394, sampled 0
6c515510e0:    	add	x26, x26, x19  // guest 0x2b1394, sampled 0
6c515510e4:    	strb	w27, [x26, #0x190]  // guest 0x2b1394, sampled 0
6c515510e8:    	add	w21, w21, w27  // guest 0x2b1394, sampled 0
6c515510ec:    	and	w21, w21, #0x7  // guest 0x2b1394, sampled 0
6c515510f0:    	str	w21, [x19, #0x188]  // guest 0x2b1394, sampled 0
6c515510f4:    	ldr	w26, [x19, #0x54]  // guest 0x2b1394, sampled 0
6c515510f8:    	strh	w26, [x19, #0x222]  // guest 0x2b1394, sampled 0
6c515510fc:    	mov	w26, #0x1394            // =5012  // guest 0x2b1394, sampled 0
6c51551100:    	movk	w26, #0x2b, lsl #16  // guest 0x2b1394, sampled 0
6c51551104:    	str	w26, [x19, #0x228]  // guest 0x2b1394, sampled 0
6c51551108:    	add	w26, w24, #0x20  // guest 0x2b1396, sampled 0
6c5155110c:    	mov	w28, w26  // guest 0x2b1396, sampled 0
6c51551110:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b1396, sampled 0
6c51551114:    	and	x16, x16, x26, lsr #7  // guest 0x2b1396, sampled 0
6c51551118:    	add	x17, x17, x16  // guest 0x2b1396, sampled 0
6c5155111c:    	ldp	x16, x17, [x17]  // guest 0x2b1396, sampled 0
6c51551120:    	and	w30, w26, #0xfffff003  // guest 0x2b1396, sampled 0
6c51551124:    	cmp	w16, w30  // guest 0x2b1396, sampled 0
6c51551128:    	b.ne	0x6c51551b60 <trace+0x10a0>  // guest 0x2b1396, sampled 0
6c5155112c:    	add	x30, x17, w26, uxtw  // guest 0x2b1396, sampled 0
6c51551130:    	ldapr	w2, [x30]  // guest 0x2b1396, sampled 0
6c51551134:    	add	w26, w21, #0x7  // guest 0x2b1396, sampled 0
6c51551138:    	and	w26, w26, #0x7  // guest 0x2b1396, sampled 0
6c5155113c:    	lsl	w26, w26, #4  // guest 0x2b1396, sampled 0
6c51551140:    	add	w26, w26, #0x1a0  // guest 0x2b1396, sampled 0
6c51551144:    	sxtw	x26, w26  // guest 0x2b1396, sampled 0
6c51551148:    	add	x1, x26, x19  // guest 0x2b1396, sampled 0
6c5155114c:    	mov	x0, x19  // guest 0x2b1396, sampled 0
6c51551150:    	adrp	x16, 0x6c97751000 <trace+0x46200000>  // guest 0x2b1396, sampled 0
6c51551154:    	add	x16, x16, #0x3b4  // guest 0x2b1396, sampled 1
6c51551158:    	blr	x16  // guest 0x2b1396, sampled 0
6c5155115c:    	sub	w21, w21, #0x1  // guest 0x2b1396, sampled 0
6c51551160:    	and	w21, w21, #0x7  // guest 0x2b1396, sampled 0
6c51551164:    	str	w21, [x19, #0x188]  // guest 0x2b1396, sampled 0
6c51551168:    	sxtw	x26, w21  // guest 0x2b1396, sampled 0
6c5155116c:    	add	x26, x26, x19  // guest 0x2b1396, sampled 0
6c51551170:    	strb	wzr, [x26, #0x190]  // guest 0x2b1396, sampled 0
6c51551174:    	ldr	w26, [x19, #0x64]  // guest 0x2b1396, sampled 0
6c51551178:    	strh	w26, [x19, #0x224]  // guest 0x2b1396, sampled 0
6c5155117c:    	str	w28, [x19, #0x230]  // guest 0x2b1396, sampled 0
6c51551180:    	ldr	w26, [x19, #0x54]  // guest 0x2b1396, sampled 0
6c51551184:    	strh	w26, [x19, #0x222]  // guest 0x2b1396, sampled 0
6c51551188:    	mov	w26, #0x1396            // =5014  // guest 0x2b1396, sampled 0
6c5155118c:    	movk	w26, #0x2b, lsl #16  // guest 0x2b1396, sampled 0
6c51551190:    	str	w26, [x19, #0x228]  // guest 0x2b1396, sampled 0
6c51551194:    	add	w26, w24, #0x28  // guest 0x2b139a, sampled 0
6c51551198:    	mov	w28, w26  // guest 0x2b139a, sampled 0
6c5155119c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b139a, sampled 0
6c515511a0:    	and	x16, x16, x26, lsr #7  // guest 0x2b139a, sampled 0
6c515511a4:    	add	x17, x17, x16  // guest 0x2b139a, sampled 0
6c515511a8:    	ldp	x16, x17, [x17]  // guest 0x2b139a, sampled 0
6c515511ac:    	and	w30, w26, #0xfffff003  // guest 0x2b139a, sampled 0
6c515511b0:    	cmp	w16, w30  // guest 0x2b139a, sampled 0
6c515511b4:    	b.ne	0x6c51551b8c <trace+0x10cc>  // guest 0x2b139a, sampled 0
6c515511b8:    	add	x30, x17, w26, uxtw  // guest 0x2b139a, sampled 0
6c515511bc:    	ldapr	w2, [x30]  // guest 0x2b139a, sampled 0
6c515511c0:    	add	x1, x19, #0x258  // guest 0x2b139a, sampled 0
6c515511c4:    	mov	x0, x19  // guest 0x2b139a, sampled 0
6c515511c8:    	adrp	x16, 0x6c97751000 <trace+0x46200000>  // guest 0x2b139a, sampled 0
6c515511cc:    	add	x16, x16, #0x3b4  // guest 0x2b139a, sampled 0
6c515511d0:    	blr	x16  // guest 0x2b139a, sampled 0
6c515511d4:    	lsl	w26, w21, #4  // guest 0x2b139a, sampled 0
6c515511d8:    	add	w26, w26, #0x1a0  // guest 0x2b139a, sampled 0
6c515511dc:    	sxtw	x26, w26  // guest 0x2b139a, sampled 0
6c515511e0:    	add	x1, x26, x19  // guest 0x2b139a, sampled 0
6c515511e4:    	add	x2, x19, #0x258  // guest 0x2b139a, sampled 0
6c515511e8:    	mov	x0, x19  // guest 0x2b139a, sampled 0
6c515511ec:    	adrp	x16, 0x6c97752000 <trace+0x46201000>  // guest 0x2b139a, sampled 0
6c515511f0:    	add	x16, x16, #0xb50  // guest 0x2b139a, sampled 0
6c515511f4:    	blr	x16  // guest 0x2b139a, sampled 0
6c515511f8:    	ldr	w26, [x19, #0x64]  // guest 0x2b139a, sampled 0
6c515511fc:    	strh	w26, [x19, #0x224]  // guest 0x2b139a, sampled 0
6c51551200:    	str	w28, [x19, #0x230]  // guest 0x2b139a, sampled 0
6c51551204:    	ldr	w26, [x19, #0x54]  // guest 0x2b139a, sampled 0
6c51551208:    	strh	w26, [x19, #0x222]  // guest 0x2b139a, sampled 0
6c5155120c:    	mov	w26, #0x139a            // =5018  // guest 0x2b139a, sampled 0
6c51551210:    	movk	w26, #0x2b, lsl #16  // guest 0x2b139a, sampled 0
6c51551214:    	str	w26, [x19, #0x228]  // guest 0x2b139a, sampled 0
6c51551218:    	lsl	w26, w21, #4  // guest 0x2b139e, sampled 0
6c5155121c:    	add	w26, w26, #0x1a0  // guest 0x2b139e, sampled 0
6c51551220:    	sxtw	x26, w26  // guest 0x2b139e, sampled 0
6c51551224:    	add	x1, x26, x19  // guest 0x2b139e, sampled 0
6c51551228:    	mov	x0, x19  // guest 0x2b139e, sampled 0
6c5155122c:    	adrp	x16, 0x6c97751000 <trace+0x46200000>  // guest 0x2b139e, sampled 0
6c51551230:    	add	x16, x16, #0x4f0  // guest 0x2b139e, sampled 0
6c51551234:    	blr	x16  // guest 0x2b139e, sampled 0
6c51551238:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b139e, sampled 0
6c5155123c:    	and	x16, x16, x23, lsr #7  // guest 0x2b139e, sampled 0
6c51551240:    	add	x17, x17, x16  // guest 0x2b139e, sampled 0
6c51551244:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2b139e, sampled 0
6c51551248:    	and	w30, w23, #0xfffff003  // guest 0x2b139e, sampled 1
6c5155124c:    	cmp	w16, w30  // guest 0x2b139e, sampled 0
6c51551250:    	b.ne	0x6c51551bb8 <trace+0x10f8>  // guest 0x2b139e, sampled 0
6c51551254:    	add	x30, x17, w23, uxtw  // guest 0x2b139e, sampled 1
6c51551258:    	stlr	w0, [x30]  // guest 0x2b139e, sampled 0
6c5155125c:    	sxtw	x26, w21  // guest 0x2b139e, sampled 0
6c51551260:    	add	x26, x26, x19  // guest 0x2b139e, sampled 0
6c51551264:    	strb	w27, [x26, #0x190]  // guest 0x2b139e, sampled 0
6c51551268:    	add	w21, w21, w27  // guest 0x2b139e, sampled 0
6c5155126c:    	and	w21, w21, #0x7  // guest 0x2b139e, sampled 0
6c51551270:    	str	w21, [x19, #0x188]  // guest 0x2b139e, sampled 0
6c51551274:    	ldr	w26, [x19, #0x74]  // guest 0x2b139e, sampled 0
6c51551278:    	strh	w26, [x19, #0x224]  // guest 0x2b139e, sampled 0
6c5155127c:    	str	w23, [x19, #0x230]  // guest 0x2b139e, sampled 0
6c51551280:    	ldr	w26, [x19, #0x54]  // guest 0x2b139e, sampled 0
6c51551284:    	strh	w26, [x19, #0x222]  // guest 0x2b139e, sampled 0
6c51551288:    	mov	w26, #0x139e            // =5022  // guest 0x2b139e, sampled 0
6c5155128c:    	movk	w26, #0x2b, lsl #16  // guest 0x2b139e, sampled 0
6c51551290:    	str	w26, [x19, #0x228]  // guest 0x2b139e, sampled 0
6c51551294:    	ldr	w26, [x19, #0x1c]  // guest 0x2b13a0, sampled 0
6c51551298:    	sub	w23, w23, w26  // guest 0x2b13a0, sampled 0
6c5155129c:    	str	w23, [x19, #0x18]  // guest 0x2b13a0, sampled 0
6c515512a0:    	str	w23, [x19, #0x28]  // guest 0x2b13a0, sampled 0
6c515512a4:    	str	w26, [x19, #0x2c]  // guest 0x2b13a0, sampled 0
6c515512a8:    	sub	w23, w22, #0x8  // guest 0x2b13a2, sampled 0
6c515512ac:    	mov	w28, w23  // guest 0x2b13a2, sampled 0
6c515512b0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b13a2, sampled 0
6c515512b4:    	and	x16, x16, x23, lsr #7  // guest 0x2b13a2, sampled 0
6c515512b8:    	add	x17, x17, x16  // guest 0x2b13a2, sampled 0
6c515512bc:    	ldp	x16, x17, [x17]  // guest 0x2b13a2, sampled 0
6c515512c0:    	and	w30, w23, #0xfffff003  // guest 0x2b13a2, sampled 0
6c515512c4:    	cmp	w16, w30  // guest 0x2b13a2, sampled 0
6c515512c8:    	b.ne	0x6c51551be4 <trace+0x1124>  // guest 0x2b13a2, sampled 0
6c515512cc:    	add	x30, x17, w23, uxtw  // guest 0x2b13a2, sampled 0
6c515512d0:    	ldapr	w2, [x30]  // guest 0x2b13a2, sampled 0
6c515512d4:    	add	w23, w21, #0x7  // guest 0x2b13a2, sampled 0
6c515512d8:    	and	w23, w23, #0x7  // guest 0x2b13a2, sampled 0
6c515512dc:    	lsl	w23, w23, #4  // guest 0x2b13a2, sampled 0
6c515512e0:    	add	w23, w23, #0x1a0  // guest 0x2b13a2, sampled 0
6c515512e4:    	sxtw	x23, w23  // guest 0x2b13a2, sampled 0
6c515512e8:    	add	x1, x23, x19  // guest 0x2b13a2, sampled 0
6c515512ec:    	mov	x0, x19  // guest 0x2b13a2, sampled 0
6c515512f0:    	adrp	x16, 0x6c97751000 <trace+0x46200000>  // guest 0x2b13a2, sampled 0
6c515512f4:    	add	x16, x16, #0x3b4  // guest 0x2b13a2, sampled 0
6c515512f8:    	blr	x16  // guest 0x2b13a2, sampled 0
6c515512fc:    	sub	w21, w21, #0x1  // guest 0x2b13a2, sampled 0
6c51551300:    	and	w21, w21, #0x7  // guest 0x2b13a2, sampled 0
6c51551304:    	str	w21, [x19, #0x188]  // guest 0x2b13a2, sampled 0
6c51551308:    	sxtw	x23, w21  // guest 0x2b13a2, sampled 0
6c5155130c:    	add	x23, x23, x19  // guest 0x2b13a2, sampled 0
6c51551310:    	strb	wzr, [x23, #0x190]  // guest 0x2b13a2, sampled 0
6c51551314:    	ldr	w23, [x19, #0x74]  // guest 0x2b13a2, sampled 0
6c51551318:    	strh	w23, [x19, #0x224]  // guest 0x2b13a2, sampled 0
6c5155131c:    	str	w28, [x19, #0x230]  // guest 0x2b13a2, sampled 0
6c51551320:    	ldr	w23, [x19, #0x54]  // guest 0x2b13a2, sampled 0
6c51551324:    	strh	w23, [x19, #0x222]  // guest 0x2b13a2, sampled 0
6c51551328:    	mov	w23, #0x13a2            // =5026  // guest 0x2b13a2, sampled 0
6c5155132c:    	movk	w23, #0x2b, lsl #16  // guest 0x2b13a2, sampled 0
6c51551330:    	str	w23, [x19, #0x228]  // guest 0x2b13a2, sampled 0
6c51551334:    	sub	w22, w22, #0x4  // guest 0x2b13a5, sampled 0
6c51551338:    	mov	w23, w22  // guest 0x2b13a5, sampled 0
6c5155133c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b13a5, sampled 0
6c51551340:    	and	x16, x16, x22, lsr #7  // guest 0x2b13a5, sampled 0
6c51551344:    	add	x17, x17, x16  // guest 0x2b13a5, sampled 0
6c51551348:    	ldp	x16, x17, [x17]  // guest 0x2b13a5, sampled 0
6c5155134c:    	and	w30, w22, #0xfffff003  // guest 0x2b13a5, sampled 0
6c51551350:    	cmp	w16, w30  // guest 0x2b13a5, sampled 0
6c51551354:    	b.ne	0x6c51551c10 <trace+0x1150>  // guest 0x2b13a5, sampled 0
6c51551358:    	add	x30, x17, w22, uxtw  // guest 0x2b13a5, sampled 0
6c5155135c:    	ldapr	w2, [x30]  // guest 0x2b13a5, sampled 0
6c51551360:    	add	w22, w21, #0x7  // guest 0x2b13a5, sampled 1
6c51551364:    	and	w22, w22, #0x7  // guest 0x2b13a5, sampled 0
6c51551368:    	lsl	w22, w22, #4  // guest 0x2b13a5, sampled 0
6c5155136c:    	add	w22, w22, #0x1a0  // guest 0x2b13a5, sampled 0
6c51551370:    	sxtw	x22, w22  // guest 0x2b13a5, sampled 0
6c51551374:    	add	x1, x22, x19  // guest 0x2b13a5, sampled 0
6c51551378:    	mov	x0, x19  // guest 0x2b13a5, sampled 0
6c5155137c:    	adrp	x16, 0x6c97751000 <trace+0x46200000>  // guest 0x2b13a5, sampled 0
6c51551380:    	add	x16, x16, #0x3b4  // guest 0x2b13a5, sampled 0
6c51551384:    	blr	x16  // guest 0x2b13a5, sampled 0
6c51551388:    	sub	w21, w21, #0x1  // guest 0x2b13a5, sampled 0
6c5155138c:    	and	w21, w21, #0x7  // guest 0x2b13a5, sampled 0
6c51551390:    	str	w21, [x19, #0x188]  // guest 0x2b13a5, sampled 0
6c51551394:    	sxtw	x22, w21  // guest 0x2b13a5, sampled 0
6c51551398:    	add	x22, x22, x19  // guest 0x2b13a5, sampled 0
6c5155139c:    	strb	wzr, [x22, #0x190]  // guest 0x2b13a5, sampled 0
6c515513a0:    	ldr	w22, [x19, #0x74]  // guest 0x2b13a5, sampled 0
6c515513a4:    	strh	w22, [x19, #0x224]  // guest 0x2b13a5, sampled 0
6c515513a8:    	str	w23, [x19, #0x230]  // guest 0x2b13a5, sampled 0
6c515513ac:    	ldr	w22, [x19, #0x54]  // guest 0x2b13a5, sampled 0
6c515513b0:    	strh	w22, [x19, #0x222]  // guest 0x2b13a5, sampled 0
6c515513b4:    	mov	w22, #0x13a5            // =5029  // guest 0x2b13a5, sampled 0
6c515513b8:    	movk	w22, #0x2b, lsl #16  // guest 0x2b13a5, sampled 0
6c515513bc:    	str	w22, [x19, #0x228]  // guest 0x2b13a5, sampled 0
6c515513c0:    	add	w22, w24, #0x30  // guest 0x2b13a8, sampled 0
6c515513c4:    	mov	w23, w22  // guest 0x2b13a8, sampled 0
6c515513c8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b13a8, sampled 0
6c515513cc:    	and	x16, x16, x22, lsr #7  // guest 0x2b13a8, sampled 0
6c515513d0:    	add	x17, x17, x16  // guest 0x2b13a8, sampled 0
6c515513d4:    	ldp	x16, x17, [x17]  // guest 0x2b13a8, sampled 0
6c515513d8:    	and	w30, w22, #0xfffff003  // guest 0x2b13a8, sampled 0
6c515513dc:    	cmp	w16, w30  // guest 0x2b13a8, sampled 0
6c515513e0:    	b.ne	0x6c51551c3c <trace+0x117c>  // guest 0x2b13a8, sampled 0
6c515513e4:    	add	x30, x17, w22, uxtw  // guest 0x2b13a8, sampled 0
6c515513e8:    	ldapr	w2, [x30]  // guest 0x2b13a8, sampled 0
6c515513ec:    	add	w22, w21, #0x7  // guest 0x2b13a8, sampled 0
6c515513f0:    	and	w22, w22, #0x7  // guest 0x2b13a8, sampled 0
6c515513f4:    	lsl	w22, w22, #4  // guest 0x2b13a8, sampled 0
6c515513f8:    	add	w22, w22, #0x1a0  // guest 0x2b13a8, sampled 0
6c515513fc:    	sxtw	x22, w22  // guest 0x2b13a8, sampled 0
6c51551400:    	add	x1, x22, x19  // guest 0x2b13a8, sampled 0
6c51551404:    	mov	x0, x19  // guest 0x2b13a8, sampled 0
6c51551408:    	adrp	x16, 0x6c97751000 <trace+0x46200000>  // guest 0x2b13a8, sampled 0
6c5155140c:    	add	x16, x16, #0x3b4  // guest 0x2b13a8, sampled 0
6c51551410:    	blr	x16  // guest 0x2b13a8, sampled 0
6c51551414:    	sub	w21, w21, #0x1  // guest 0x2b13a8, sampled 0
6c51551418:    	and	w21, w21, #0x7  // guest 0x2b13a8, sampled 0
6c5155141c:    	sxtw	x22, w21  // guest 0x2b13a8, sampled 0
6c51551420:    	add	x22, x22, x19  // guest 0x2b13a8, sampled 0
6c51551424:    	strb	wzr, [x22, #0x190]  // guest 0x2b13a8, sampled 0
6c51551428:    	ldr	w22, [x19, #0x64]  // guest 0x2b13a8, sampled 0
6c5155142c:    	strh	w22, [x19, #0x224]  // guest 0x2b13a8, sampled 0
6c51551430:    	str	w23, [x19, #0x230]  // guest 0x2b13a8, sampled 0
6c51551434:    	ldr	w22, [x19, #0x54]  // guest 0x2b13a8, sampled 0
6c51551438:    	strh	w22, [x19, #0x222]  // guest 0x2b13a8, sampled 0
6c5155143c:    	mov	w22, #0x13a8            // =5032  // guest 0x2b13a8, sampled 0
6c51551440:    	movk	w22, #0x2b, lsl #16  // guest 0x2b13a8, sampled 0
6c51551444:    	str	w22, [x19, #0x228]  // guest 0x2b13a8, sampled 0
6c51551448:    	add	x22, x19, #0x258  // guest 0x2b13ac, sampled 0
6c5155144c:    	add	w23, w21, w27  // guest 0x2b13ac, sampled 0
6c51551450:    	and	w23, w23, #0x7  // guest 0x2b13ac, sampled 0
6c51551454:    	lsl	w23, w23, #4  // guest 0x2b13ac, sampled 0
6c51551458:    	add	w23, w23, #0x1a0  // guest 0x2b13ac, sampled 0
6c5155145c:    	sxtw	x23, w23  // guest 0x2b13ac, sampled 0
6c51551460:    	add	x23, x23, x19  // guest 0x2b13ac, sampled 0
6c51551464:    	ldr	x28, [x23]  // guest 0x2b13ac, sampled 0
6c51551468:    	ldrh	w23, [x23, #0x8]  // guest 0x2b13ac, sampled 0
6c5155146c:    	str	x28, [x22]  // guest 0x2b13ac, sampled 0
6c51551470:    	strh	w23, [x22, #0x8]  // guest 0x2b13ac, sampled 0
6c51551474:    	lsl	w22, w21, #4  // guest 0x2b13ac, sampled 0
6c51551478:    	add	w22, w22, #0x1a0  // guest 0x2b13ac, sampled 0
6c5155147c:    	sxtw	x22, w22  // guest 0x2b13ac, sampled 0
6c51551480:    	add	x1, x22, x19  // guest 0x2b13ac, sampled 0
6c51551484:    	add	x2, x19, #0x258  // guest 0x2b13ac, sampled 0
6c51551488:    	mov	x0, x19  // guest 0x2b13ac, sampled 0
6c5155148c:    	adrp	x16, 0x6c97752000 <trace+0x46201000>  // guest 0x2b13ac, sampled 0
6c51551490:    	add	x16, x16, #0xa7c  // guest 0x2b13ac, sampled 0
6c51551494:    	blr	x16  // guest 0x2b13ac, sampled 0
6c51551498:    	ldr	w22, [x19, #0x54]  // guest 0x2b13ac, sampled 0
6c5155149c:    	strh	w22, [x19, #0x222]  // guest 0x2b13ac, sampled 0
6c515514a0:    	mov	w22, #0x13ac            // =5036  // guest 0x2b13ac, sampled 0
6c515514a4:    	movk	w22, #0x2b, lsl #16  // guest 0x2b13ac, sampled 0
6c515514a8:    	str	w22, [x19, #0x228]  // guest 0x2b13ac, sampled 0
6c515514ac:    	sub	w21, w21, #0x1  // guest 0x2b13ae, sampled 0
6c515514b0:    	and	w21, w21, #0x7  // guest 0x2b13ae, sampled 0
6c515514b4:    	str	w21, [x19, #0x188]  // guest 0x2b13ae, sampled 0
6c515514b8:    	sxtw	x22, w21  // guest 0x2b13ae, sampled 0
6c515514bc:    	add	x22, x22, x19  // guest 0x2b13ae, sampled 0
6c515514c0:    	strb	wzr, [x22, #0x190]  // guest 0x2b13ae, sampled 0
6c515514c4:    	lsl	w22, w21, #4  // guest 0x2b13ae, sampled 0
6c515514c8:    	add	w22, w22, #0x1a0  // guest 0x2b13ae, sampled 0
6c515514cc:    	sxtw	x22, w22  // guest 0x2b13ae, sampled 0
6c515514d0:    	add	x22, x22, x19  // guest 0x2b13ae, sampled 0
6c515514d4:    	add	w23, w21, #0x3  // guest 0x2b13ae, sampled 0
6c515514d8:    	and	w23, w23, #0x7  // guest 0x2b13ae, sampled 0
6c515514dc:    	lsl	w23, w23, #4  // guest 0x2b13ae, sampled 0
6c515514e0:    	add	w23, w23, #0x1a0  // guest 0x2b13ae, sampled 0
6c515514e4:    	sxtw	x23, w23  // guest 0x2b13ae, sampled 0
6c515514e8:    	add	x23, x23, x19  // guest 0x2b13ae, sampled 0
6c515514ec:    	ldr	x28, [x23]  // guest 0x2b13ae, sampled 0
6c515514f0:    	ldrh	w23, [x23, #0x8]  // guest 0x2b13ae, sampled 0
6c515514f4:    	str	x28, [x22]  // guest 0x2b13ae, sampled 0
6c515514f8:    	strh	w23, [x22, #0x8]  // guest 0x2b13ae, sampled 0
6c515514fc:    	ldr	w22, [x19, #0x54]  // guest 0x2b13ae, sampled 0
6c51551500:    	strh	w22, [x19, #0x222]  // guest 0x2b13ae, sampled 0
6c51551504:    	mov	w22, #0x13ae            // =5038  // guest 0x2b13ae, sampled 0
6c51551508:    	movk	w22, #0x2b, lsl #16  // guest 0x2b13ae, sampled 0
6c5155150c:    	str	w22, [x19, #0x228]  // guest 0x2b13ae, sampled 0
6c51551510:    	add	w22, w24, #0x10  // guest 0x2b13b0, sampled 0
6c51551514:    	mov	w23, w22  // guest 0x2b13b0, sampled 0
6c51551518:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b13b0, sampled 0
6c5155151c:    	and	x16, x16, x22, lsr #7  // guest 0x2b13b0, sampled 0
6c51551520:    	add	x17, x17, x16  // guest 0x2b13b0, sampled 0
6c51551524:    	ldp	x16, x17, [x17]  // guest 0x2b13b0, sampled 0
6c51551528:    	and	w30, w22, #0xfffff003  // guest 0x2b13b0, sampled 0
6c5155152c:    	cmp	w16, w30  // guest 0x2b13b0, sampled 0
6c51551530:    	b.ne	0x6c51551c68 <trace+0x11a8>  // guest 0x2b13b0, sampled 0
6c51551534:    	add	x30, x17, w22, uxtw  // guest 0x2b13b0, sampled 0
6c51551538:    	ldapr	w2, [x30]  // guest 0x2b13b0, sampled 0
6c5155153c:    	add	x1, x19, #0x258  // guest 0x2b13b0, sampled 0
6c51551540:    	mov	x0, x19  // guest 0x2b13b0, sampled 0
6c51551544:    	adrp	x16, 0x6c97751000 <trace+0x46200000>  // guest 0x2b13b0, sampled 0
6c51551548:    	add	x16, x16, #0x3b4  // guest 0x2b13b0, sampled 0
6c5155154c:    	blr	x16  // guest 0x2b13b0, sampled 0
6c51551550:    	lsl	w22, w21, #4  // guest 0x2b13b0, sampled 0
6c51551554:    	add	w22, w22, #0x1a0  // guest 0x2b13b0, sampled 0
6c51551558:    	sxtw	x22, w22  // guest 0x2b13b0, sampled 0
6c5155155c:    	add	x1, x22, x19  // guest 0x2b13b0, sampled 0
6c51551560:    	add	x2, x19, #0x258  // guest 0x2b13b0, sampled 0
6c51551564:    	mov	x0, x19  // guest 0x2b13b0, sampled 0
6c51551568:    	adrp	x16, 0x6c97752000 <trace+0x46201000>  // guest 0x2b13b0, sampled 0
6c5155156c:    	add	x16, x16, #0xa7c  // guest 0x2b13b0, sampled 0
6c51551570:    	blr	x16  // guest 0x2b13b0, sampled 0
6c51551574:    	ldr	w22, [x19, #0x64]  // guest 0x2b13b0, sampled 0
6c51551578:    	strh	w22, [x19, #0x224]  // guest 0x2b13b0, sampled 1
6c5155157c:    	str	w23, [x19, #0x230]  // guest 0x2b13b0, sampled 0
6c51551580:    	ldr	w22, [x19, #0x54]  // guest 0x2b13b0, sampled 0
6c51551584:    	strh	w22, [x19, #0x222]  // guest 0x2b13b0, sampled 0
6c51551588:    	mov	w22, #0x13b0            // =5040  // guest 0x2b13b0, sampled 0
6c5155158c:    	movk	w22, #0x2b, lsl #16  // guest 0x2b13b0, sampled 0
6c51551590:    	str	w22, [x19, #0x228]  // guest 0x2b13b0, sampled 0
6c51551594:    	add	w22, w21, w27  // guest 0x2b13b4, sampled 0
6c51551598:    	and	w22, w22, #0x7  // guest 0x2b13b4, sampled 0
6c5155159c:    	lsl	w22, w22, #4  // guest 0x2b13b4, sampled 0
6c515515a0:    	add	w22, w22, #0x1a0  // guest 0x2b13b4, sampled 0
6c515515a4:    	sxtw	x22, w22  // guest 0x2b13b4, sampled 0
6c515515a8:    	add	x1, x22, x19  // guest 0x2b13b4, sampled 0
6c515515ac:    	lsl	w22, w21, #4  // guest 0x2b13b4, sampled 0
6c515515b0:    	add	w22, w22, #0x1a0  // guest 0x2b13b4, sampled 0
6c515515b4:    	sxtw	x22, w22  // guest 0x2b13b4, sampled 0
6c515515b8:    	add	x2, x22, x19  // guest 0x2b13b4, sampled 0
6c515515bc:    	mov	x0, x19  // guest 0x2b13b4, sampled 0
6c515515c0:    	adrp	x16, 0x6c97752000 <trace+0x46201000>  // guest 0x2b13b4, sampled 0
6c515515c4:    	add	x16, x16, #0x9a8  // guest 0x2b13b4, sampled 0
6c515515c8:    	blr	x16  // guest 0x2b13b4, sampled 0
6c515515cc:    	sxtw	x22, w21  // guest 0x2b13b4, sampled 0
6c515515d0:    	add	x22, x22, x19  // guest 0x2b13b4, sampled 0
6c515515d4:    	strb	w27, [x22, #0x190]  // guest 0x2b13b4, sampled 0
6c515515d8:    	add	w21, w21, w27  // guest 0x2b13b4, sampled 0
6c515515dc:    	and	w21, w21, #0x7  // guest 0x2b13b4, sampled 0
6c515515e0:    	str	w21, [x19, #0x188]  // guest 0x2b13b4, sampled 0
6c515515e4:    	ldr	w22, [x19, #0x54]  // guest 0x2b13b4, sampled 0
6c515515e8:    	strh	w22, [x19, #0x222]  // guest 0x2b13b4, sampled 0
6c515515ec:    	mov	w22, #0x13b4            // =5044  // guest 0x2b13b4, sampled 0
6c515515f0:    	movk	w22, #0x2b, lsl #16  // guest 0x2b13b4, sampled 0
6c515515f4:    	str	w22, [x19, #0x228]  // guest 0x2b13b4, sampled 0
6c515515f8:    	add	w22, w20, w25  // guest 0x2b13b6, sampled 0
6c515515fc:    	mov	w23, w22  // guest 0x2b13b6, sampled 0
6c51551600:    	lsl	w24, w21, #4  // guest 0x2b13b6, sampled 0
6c51551604:    	add	w24, w24, #0x1a0  // guest 0x2b13b6, sampled 0
6c51551608:    	sxtw	x24, w24  // guest 0x2b13b6, sampled 0
6c5155160c:    	add	x1, x24, x19  // guest 0x2b13b6, sampled 0
6c51551610:    	mov	x0, x19  // guest 0x2b13b6, sampled 0
6c51551614:    	adrp	x16, 0x6c97751000 <trace+0x46200000>  // guest 0x2b13b6, sampled 0
6c51551618:    	add	x16, x16, #0x4f0  // guest 0x2b13b6, sampled 0
6c5155161c:    	blr	x16  // guest 0x2b13b6, sampled 0
6c51551620:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b13b6, sampled 0
6c51551624:    	and	x16, x16, x22, lsr #7  // guest 0x2b13b6, sampled 0
6c51551628:    	add	x17, x17, x16  // guest 0x2b13b6, sampled 0
6c5155162c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2b13b6, sampled 0
6c51551630:    	and	w30, w22, #0xfffff003  // guest 0x2b13b6, sampled 3
6c51551634:    	cmp	w16, w30  // guest 0x2b13b6, sampled 0
6c51551638:    	b.ne	0x6c51551c94 <trace+0x11d4>  // guest 0x2b13b6, sampled 0
6c5155163c:    	add	x30, x17, w22, uxtw  // guest 0x2b13b6, sampled 0
6c51551640:    	stlr	w0, [x30]  // guest 0x2b13b6, sampled 0
6c51551644:    	sxtw	x22, w21  // guest 0x2b13b6, sampled 0
6c51551648:    	add	x22, x22, x19  // guest 0x2b13b6, sampled 0
6c5155164c:    	strb	w27, [x22, #0x190]  // guest 0x2b13b6, sampled 0
6c51551650:    	add	w21, w21, w27  // guest 0x2b13b6, sampled 0
6c51551654:    	and	w21, w21, #0x7  // guest 0x2b13b6, sampled 0
6c51551658:    	str	w21, [x19, #0x188]  // guest 0x2b13b6, sampled 0
6c5155165c:    	ldr	w21, [x19, #0x74]  // guest 0x2b13b6, sampled 0
6c51551660:    	strh	w21, [x19, #0x224]  // guest 0x2b13b6, sampled 0
6c51551664:    	str	w23, [x19, #0x230]  // guest 0x2b13b6, sampled 0
6c51551668:    	ldr	w21, [x19, #0x54]  // guest 0x2b13b6, sampled 0
6c5155166c:    	strh	w21, [x19, #0x222]  // guest 0x2b13b6, sampled 0
6c51551670:    	mov	w21, #0x13b6            // =5046  // guest 0x2b13b6, sampled 0
6c51551674:    	movk	w21, #0x2b, lsl #16  // guest 0x2b13b6, sampled 0
6c51551678:    	str	w21, [x19, #0x228]  // guest 0x2b13b6, sampled 0
6c5155167c:    	add	w20, w20, w26  // guest 0x2b13b9, sampled 0
6c51551680:    	str	w20, [x19]  // guest 0x2b13b9, sampled 0
6c51551684:    	str	w20, [x19, #0x28]  // guest 0x2b13b9, sampled 0
6c51551688:    	mov	w1, w27  // guest 0x2b13bb, sampled 0
6c5155168c:    	mov	x0, x19  // guest 0x2b13bb, sampled 0
6c51551690:    	adrp	x16, 0x6c97752000 <trace+0x46201000>  // guest 0x2b13bb, sampled 0
6c51551694:    	add	x16, x16, #0x4d0  // guest 0x2b13bb, sampled 0
6c51551698:    	blr	x16  // guest 0x2b13bb, sampled 0
6c5155169c:    	ldr	w20, [x19, #0x54]  // guest 0x2b13bb, sampled 0
6c515516a0:    	strh	w20, [x19, #0x222]  // guest 0x2b13bb, sampled 0
6c515516a4:    	mov	w20, #0x13bb            // =5051  // guest 0x2b13bb, sampled 0
6c515516a8:    	movk	w20, #0x2b, lsl #16  // guest 0x2b13bb, sampled 0
6c515516ac:    	str	w20, [x19, #0x228]  // guest 0x2b13bb, sampled 0
6c515516b0:    	ldr	w20, [x19, #0x10]  // guest 0x2b13bd, sampled 0
6c515516b4:    	add	w20, w20, #0x30  // guest 0x2b13bd, sampled 0
6c515516b8:    	mov	w21, w20  // guest 0x2b13bd, sampled 0
6c515516bc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b13bd, sampled 0
6c515516c0:    	and	x16, x16, x20, lsr #7  // guest 0x2b13bd, sampled 0
6c515516c4:    	add	x17, x17, x16  // guest 0x2b13bd, sampled 0
6c515516c8:    	ldp	x16, x17, [x17]  // guest 0x2b13bd, sampled 0
6c515516cc:    	and	w30, w20, #0xfffff003  // guest 0x2b13bd, sampled 0
6c515516d0:    	cmp	w16, w30  // guest 0x2b13bd, sampled 0
6c515516d4:    	b.ne	0x6c51551cc0 <trace+0x1200>  // guest 0x2b13bd, sampled 0
6c515516d8:    	add	x30, x17, w20, uxtw  // guest 0x2b13bd, sampled 0
6c515516dc:    	ldapr	w2, [x30]  // guest 0x2b13bd, sampled 0
6c515516e0:    	add	x1, x19, #0x258  // guest 0x2b13bd, sampled 0
6c515516e4:    	mov	x0, x19  // guest 0x2b13bd, sampled 0
6c515516e8:    	adrp	x16, 0x6c97751000 <trace+0x46200000>  // guest 0x2b13bd, sampled 0
6c515516ec:    	add	x16, x16, #0x3b4  // guest 0x2b13bd, sampled 0
6c515516f0:    	blr	x16  // guest 0x2b13bd, sampled 0
6c515516f4:    	ldr	w20, [x19, #0x188]  // guest 0x2b13bd, sampled 0
6c515516f8:    	lsl	w20, w20, #4  // guest 0x2b13bd, sampled 0
6c515516fc:    	add	w20, w20, #0x1a0  // guest 0x2b13bd, sampled 0
6c51551700:    	sxtw	x20, w20  // guest 0x2b13bd, sampled 0
6c51551704:    	add	x1, x20, x19  // guest 0x2b13bd, sampled 0
6c51551708:    	add	x2, x19, #0x258  // guest 0x2b13bd, sampled 0
6c5155170c:    	mov	x0, x19  // guest 0x2b13bd, sampled 0
6c51551710:    	adrp	x16, 0x6c97752000 <trace+0x46201000>  // guest 0x2b13bd, sampled 0
6c51551714:    	add	x16, x16, #0xa7c  // guest 0x2b13bd, sampled 0
6c51551718:    	blr	x16  // guest 0x2b13bd, sampled 0
6c5155171c:    	ldr	w20, [x19, #0x64]  // guest 0x2b13bd, sampled 0
6c51551720:    	strh	w20, [x19, #0x224]  // guest 0x2b13bd, sampled 0
6c51551724:    	str	w21, [x19, #0x230]  // guest 0x2b13bd, sampled 0
6c51551728:    	ldr	w20, [x19, #0x54]  // guest 0x2b13bd, sampled 0
6c5155172c:    	strh	w20, [x19, #0x222]  // guest 0x2b13bd, sampled 0
6c51551730:    	mov	w20, #0x13bd            // =5053  // guest 0x2b13bd, sampled 0
6c51551734:    	movk	w20, #0x2b, lsl #16  // guest 0x2b13bd, sampled 0
6c51551738:    	str	w20, [x19, #0x228]  // guest 0x2b13bd, sampled 0
6c5155173c:    	mov	w1, w27  // guest 0x2b13c1, sampled 0
6c51551740:    	mov	x0, x19  // guest 0x2b13c1, sampled 0
6c51551744:    	adrp	x16, 0x6c97752000 <trace+0x46201000>  // guest 0x2b13c1, sampled 0
6c51551748:    	add	x16, x16, #0x4d0  // guest 0x2b13c1, sampled 0
6c5155174c:    	blr	x16  // guest 0x2b13c1, sampled 0
6c51551750:    	ldr	w20, [x19, #0x54]  // guest 0x2b13c1, sampled 0
6c51551754:    	strh	w20, [x19, #0x222]  // guest 0x2b13c1, sampled 0
6c51551758:    	mov	w20, #0x13c1            // =5057  // guest 0x2b13c1, sampled 0
6c5155175c:    	movk	w20, #0x2b, lsl #16  // guest 0x2b13c1, sampled 0
6c51551760:    	str	w20, [x19, #0x228]  // guest 0x2b13c1, sampled 0
6c51551764:    	ldr	w20, [x19, #0x10]  // guest 0x2b13c3, sampled 0
6c51551768:    	add	w21, w20, #0x10  // guest 0x2b13c3, sampled 0
6c5155176c:    	mov	w22, w21  // guest 0x2b13c3, sampled 0
6c51551770:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b13c3, sampled 0
6c51551774:    	and	x16, x16, x21, lsr #7  // guest 0x2b13c3, sampled 0
6c51551778:    	add	x17, x17, x16  // guest 0x2b13c3, sampled 0
6c5155177c:    	ldp	x16, x17, [x17]  // guest 0x2b13c3, sampled 0
6c51551780:    	and	w30, w21, #0xfffff003  // guest 0x2b13c3, sampled 0
6c51551784:    	cmp	w16, w30  // guest 0x2b13c3, sampled 0
6c51551788:    	b.ne	0x6c51551cec <trace+0x122c>  // guest 0x2b13c3, sampled 0
6c5155178c:    	add	x30, x17, w21, uxtw  // guest 0x2b13c3, sampled 0
6c51551790:    	ldapr	w2, [x30]  // guest 0x2b13c3, sampled 0
6c51551794:    	add	x1, x19, #0x258  // guest 0x2b13c3, sampled 0
6c51551798:    	mov	x0, x19  // guest 0x2b13c3, sampled 0
6c5155179c:    	adrp	x16, 0x6c97751000 <trace+0x46200000>  // guest 0x2b13c3, sampled 0
6c515517a0:    	add	x16, x16, #0x3b4  // guest 0x2b13c3, sampled 0
6c515517a4:    	blr	x16  // guest 0x2b13c3, sampled 0
6c515517a8:    	ldr	w21, [x19, #0x188]  // guest 0x2b13c3, sampled 0
6c515517ac:    	lsl	w23, w21, #4  // guest 0x2b13c3, sampled 0
6c515517b0:    	add	w23, w23, #0x1a0  // guest 0x2b13c3, sampled 0
6c515517b4:    	sxtw	x23, w23  // guest 0x2b13c3, sampled 0
6c515517b8:    	add	x1, x23, x19  // guest 0x2b13c3, sampled 0
6c515517bc:    	add	x2, x19, #0x258  // guest 0x2b13c3, sampled 0
6c515517c0:    	mov	x0, x19  // guest 0x2b13c3, sampled 0
6c515517c4:    	adrp	x16, 0x6c97752000 <trace+0x46201000>  // guest 0x2b13c3, sampled 0
6c515517c8:    	add	x16, x16, #0xa7c  // guest 0x2b13c3, sampled 0
6c515517cc:    	blr	x16  // guest 0x2b13c3, sampled 0
6c515517d0:    	ldr	w23, [x19, #0x64]  // guest 0x2b13c3, sampled 0
6c515517d4:    	strh	w23, [x19, #0x224]  // guest 0x2b13c3, sampled 0
6c515517d8:    	str	w22, [x19, #0x230]  // guest 0x2b13c3, sampled 0
6c515517dc:    	ldr	w22, [x19, #0x54]  // guest 0x2b13c3, sampled 0
6c515517e0:    	strh	w22, [x19, #0x222]  // guest 0x2b13c3, sampled 0
6c515517e4:    	mov	w22, #0x13c3            // =5059  // guest 0x2b13c3, sampled 0
6c515517e8:    	movk	w22, #0x2b, lsl #16  // guest 0x2b13c3, sampled 0
6c515517ec:    	str	w22, [x19, #0x228]  // guest 0x2b13c3, sampled 0
6c515517f0:    	add	w22, w21, w27  // guest 0x2b13c7, sampled 0
6c515517f4:    	and	w22, w22, #0x7  // guest 0x2b13c7, sampled 0
6c515517f8:    	lsl	w22, w22, #4  // guest 0x2b13c7, sampled 0
6c515517fc:    	add	w22, w22, #0x1a0  // guest 0x2b13c7, sampled 0
6c51551800:    	sxtw	x22, w22  // guest 0x2b13c7, sampled 0
6c51551804:    	add	x1, x22, x19  // guest 0x2b13c7, sampled 0
6c51551808:    	lsl	w22, w21, #4  // guest 0x2b13c7, sampled 0
6c5155180c:    	add	w22, w22, #0x1a0  // guest 0x2b13c7, sampled 0
6c51551810:    	sxtw	x22, w22  // guest 0x2b13c7, sampled 0
6c51551814:    	add	x2, x22, x19  // guest 0x2b13c7, sampled 0
6c51551818:    	mov	x0, x19  // guest 0x2b13c7, sampled 0
6c5155181c:    	adrp	x16, 0x6c97752000 <trace+0x46201000>  // guest 0x2b13c7, sampled 0
6c51551820:    	add	x16, x16, #0xb50  // guest 0x2b13c7, sampled 0
6c51551824:    	blr	x16  // guest 0x2b13c7, sampled 0
6c51551828:    	sxtw	x22, w21  // guest 0x2b13c7, sampled 0
6c5155182c:    	add	x22, x22, x19  // guest 0x2b13c7, sampled 1
6c51551830:    	strb	w27, [x22, #0x190]  // guest 0x2b13c7, sampled 0
6c51551834:    	add	w21, w21, w27  // guest 0x2b13c7, sampled 0
6c51551838:    	and	w21, w21, #0x7  // guest 0x2b13c7, sampled 0
6c5155183c:    	str	w21, [x19, #0x188]  // guest 0x2b13c7, sampled 0
6c51551840:    	ldr	w22, [x19, #0x54]  // guest 0x2b13c7, sampled 0
6c51551844:    	strh	w22, [x19, #0x222]  // guest 0x2b13c7, sampled 0
6c51551848:    	mov	w22, #0x13c7            // =5063  // guest 0x2b13c7, sampled 0
6c5155184c:    	movk	w22, #0x2b, lsl #16  // guest 0x2b13c7, sampled 0
6c51551850:    	str	w22, [x19, #0x228]  // guest 0x2b13c7, sampled 0
6c51551854:    	lsl	w22, w21, #4  // guest 0x2b13c9, sampled 0
6c51551858:    	add	w22, w22, #0x1a0  // guest 0x2b13c9, sampled 0
6c5155185c:    	sxtw	x22, w22  // guest 0x2b13c9, sampled 0
6c51551860:    	add	x1, x22, x19  // guest 0x2b13c9, sampled 0
6c51551864:    	mov	x0, x19  // guest 0x2b13c9, sampled 0
6c51551868:    	adrp	x16, 0x6c97751000 <trace+0x46200000>  // guest 0x2b13c9, sampled 0
6c5155186c:    	add	x16, x16, #0x4f0  // guest 0x2b13c9, sampled 0
6c51551870:    	blr	x16  // guest 0x2b13c9, sampled 0
6c51551874:    	ldr	w22, [x19, #0x8]  // guest 0x2b13c9, sampled 0
6c51551878:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b13c9, sampled 0
6c5155187c:    	and	x16, x16, x22, lsr #7  // guest 0x2b13c9, sampled 0
6c51551880:    	add	x17, x17, x16  // guest 0x2b13c9, sampled 0
6c51551884:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2b13c9, sampled 0
6c51551888:    	and	w30, w22, #0xfffff003  // guest 0x2b13c9, sampled 0
6c5155188c:    	cmp	w16, w30  // guest 0x2b13c9, sampled 0
6c51551890:    	b.ne	0x6c51551d18 <trace+0x1258>  // guest 0x2b13c9, sampled 0
6c51551894:    	add	x30, x17, w22, uxtw  // guest 0x2b13c9, sampled 0
6c51551898:    	stlr	w0, [x30]  // guest 0x2b13c9, sampled 0
6c5155189c:    	sxtw	x23, w21  // guest 0x2b13c9, sampled 0
6c515518a0:    	add	x23, x23, x19  // guest 0x2b13c9, sampled 0
6c515518a4:    	strb	w27, [x23, #0x190]  // guest 0x2b13c9, sampled 0
6c515518a8:    	add	w21, w21, w27  // guest 0x2b13c9, sampled 0
6c515518ac:    	and	w21, w21, #0x7  // guest 0x2b13c9, sampled 0
6c515518b0:    	str	w21, [x19, #0x188]  // guest 0x2b13c9, sampled 0
6c515518b4:    	ldr	w21, [x19, #0x74]  // guest 0x2b13c9, sampled 0
6c515518b8:    	strh	w21, [x19, #0x224]  // guest 0x2b13c9, sampled 0
6c515518bc:    	str	w22, [x19, #0x230]  // guest 0x2b13c9, sampled 0
6c515518c0:    	ldr	w21, [x19, #0x54]  // guest 0x2b13c9, sampled 0
6c515518c4:    	strh	w21, [x19, #0x222]  // guest 0x2b13c9, sampled 0
6c515518c8:    	mov	w21, #0x13c9            // =5065  // guest 0x2b13c9, sampled 0
6c515518cc:    	movk	w21, #0x2b, lsl #16  // guest 0x2b13c9, sampled 0
6c515518d0:    	str	w21, [x19, #0x228]  // guest 0x2b13c9, sampled 0
6c515518d4:    	mov	w21, w22  // guest 0x2b13cb, sampled 0
6c515518d8:    	ldr	w23, [x19, #0x1c]  // guest 0x2b13cb, sampled 0
6c515518dc:    	sub	w22, w22, w23  // guest 0x2b13cb, sampled 0
6c515518e0:    	str	w22, [x19, #0x8]  // guest 0x2b13cb, sampled 0
6c515518e4:    	ldr	w22, [x19, #0x14]  // guest 0x2b13cd, sampled 0
6c515518e8:    	sub	w22, w22, #0x1  // guest 0x2b13cd, sampled 0
6c515518ec:    	cmp	w21, w23  // guest 0x2b13cd, sampled 0
6c515518f0:    	cset	w21, lo  // guest 0x2b13cd, sampled 0
6c515518f4:    	str	w22, [x19, #0x14]  // guest 0x2b13cd, sampled 0
6c515518f8:    	mov	w23, w22  // guest 0x2b13cd, sampled 0
6c515518fc:    	str	w23, [x19, #0x28]  // guest 0x2b13cd, sampled 0
6c51551900:    	str	w21, [x19, #0x2c]  // guest 0x2b13cd, sampled 0
6c51551904:    	add	w20, w20, #0x14  // guest 0x2b13ce, sampled 0
6c51551908:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x2b13ce, sampled 0
6c5155190c:    	and	x16, x16, x20, lsr #7  // guest 0x2b13ce, sampled 0
6c51551910:    	add	x17, x17, x16  // guest 0x2b13ce, sampled 0
6c51551914:    	ldp	x17, x16, [x17, #0x8]  // guest 0x2b13ce, sampled 0
6c51551918:    	and	w30, w20, #0xfffff003  // guest 0x2b13ce, sampled 0
6c5155191c:    	cmp	w16, w30  // guest 0x2b13ce, sampled 0
6c51551920:    	b.ne	0x6c51551d44 <trace+0x1284>  // guest 0x2b13ce, sampled 0
6c51551924:    	add	x30, x17, w20, uxtw  // guest 0x2b13ce, sampled 0
6c51551928:    	stlr	w22, [x30]  // guest 0x2b13ce, sampled 0
6c5155192c:    	sturb	w27, [x19, #-0xc]  // guest 0x2b13ce, sampled 0
6c51551930:    	mov	w20, #0x22              // =34  // guest 0x2b13d2, sampled 0
6c51551934:    	str	w20, [x19, #0x34]  // guest 0x2b13d2, sampled 0
6c51551938:    	cbnz	w23, 0x6c51551958 <trace+0xe98>  // guest 0x2b13d2, sampled 0
6c5155193c:    	b	0x6c5155193c <trace+0xe7c>  // guest 0x2b13d2, sampled 0
6c51551940:    	br	x16  // guest 0x2b13d2, sampled 0
6c51551944:    	mov	w20, #0x13d4            // =5076  // guest 0x2b13d2, sampled 0
6c51551948:    	movk	w20, #0x2b, lsl #16  // guest 0x2b13d2, sampled 0
6c5155194c:    	str	w20, [x19, #0x20]  // guest 0x2b13d2, sampled 0
6c51551950:    	adr	x0, 0x6c51550a01 <trace+0xffffffffffffff41>  // guest 0x2b13d2, sampled 0
6c51551954:    	b	0x6c4ae5d02c <trace+0xfffffffff990c56c>  // guest 0x2b13d2, sampled 0
6c51551958:    	b	0x6c51551958 <trace+0xe98>  // guest 0x2b13d2, sampled 0
6c5155195c:    	br	x16  // guest 0x2b13d2, sampled 0
6c51551960:    	mov	w20, #0x1368            // =4968  // guest 0x2b13d2, sampled 0
6c51551964:    	movk	w20, #0x2b, lsl #16  // guest 0x2b13d2, sampled 0
6c51551968:    	str	w20, [x19, #0x20]  // guest 0x2b13d2, sampled 0
6c5155196c:    	adr	x0, 0x6c51550a00 <trace+0xffffffffffffff40>  // guest 0x2b13d2, sampled 0
6c51551970:    	b	0x6c4ae5d02c <trace+0xfffffffff990c56c>  // guest 0x2b13d2, sampled 0
6c51551974:    	adr	x0, 0x6c51550a03 <trace+0xffffffffffffff43>  // guest 0x2b13d2, sampled 0
6c51551978:    	b	0x6c4ae5d02c <trace+0xfffffffff990c56c>  // guest 0x2b13d2, sampled 0
6c5155197c:    	mov	w1, w20
6c51551980:    	mov	x0, x19
6c51551984:    	mov	w2, #0x4045             // =16453
6c51551988:    	movk	w2, #0x1, lsl #16
6c5155198c:    	adr	x3, 0x6c51550af4 <trace+0x34>
6c51551990:    	adrp	x16, 0x6c97723000 <trace+0x461d2000>
6c51551994:    	add	x16, x16, #0xf88
6c51551998:    	blr	x16
6c5155199c:    	mov	w2, w0
6c515519a0:    	dmb	ishld
6c515519a4:    	b	0x6c51550af4 <trace+0x34>
6c515519a8:    	mov	w1, w22
6c515519ac:    	mov	x0, x19
6c515519b0:    	mov	w2, #0x4045             // =16453
6c515519b4:    	movk	w2, #0x1, lsl #16
6c515519b8:    	adr	x3, 0x6c51550b80 <trace+0xc0>
6c515519bc:    	adrp	x16, 0x6c97723000 <trace+0x461d2000>
6c515519c0:    	add	x16, x16, #0xf88
6c515519c4:    	blr	x16
6c515519c8:    	mov	w22, w0
6c515519cc:    	dmb	ishld
6c515519d0:    	b	0x6c51550b80 <trace+0xc0>
6c515519d4:    	mov	w1, w23
6c515519d8:    	mov	x0, x19
6c515519dc:    	mov	w2, #0x4045             // =16453
6c515519e0:    	movk	w2, #0x1, lsl #16
6c515519e4:    	adr	x3, 0x6c51550bac <trace+0xec>
6c515519e8:    	adrp	x16, 0x6c97723000 <trace+0x461d2000>
6c515519ec:    	add	x16, x16, #0xf88
6c515519f0:    	blr	x16
6c515519f4:    	mov	w2, w0
6c515519f8:    	dmb	ishld
6c515519fc:    	b	0x6c51550bac <trace+0xec>
6c51551a00:    	mov	w1, w25
6c51551a04:    	mov	w2, w22
6c51551a08:    	mov	x0, x19
6c51551a0c:    	mov	w3, #0x4045             // =16453
6c51551a10:    	movk	w3, #0x1, lsl #16
6c51551a14:    	adr	x4, 0x6c51550c38 <trace+0x178>
6c51551a18:    	adrp	x16, 0x6c97724000 <trace+0x461d3000>
6c51551a1c:    	add	x16, x16, #0xb68
6c51551a20:    	blr	x16
6c51551a24:    	dmb	ishld
6c51551a28:    	b	0x6c51550c38 <trace+0x178>
6c51551a2c:    	mov	w1, w22
6c51551a30:    	mov	x0, x19
6c51551a34:    	mov	w2, #0x4045             // =16453
6c51551a38:    	movk	w2, #0x1, lsl #16
6c51551a3c:    	adr	x3, 0x6c51550cc4 <trace+0x204>
6c51551a40:    	adrp	x16, 0x6c97723000 <trace+0x461d2000>
6c51551a44:    	add	x16, x16, #0xf88
6c51551a48:    	blr	x16
6c51551a4c:    	mov	w22, w0
6c51551a50:    	dmb	ishld
6c51551a54:    	b	0x6c51550cc4 <trace+0x204>
6c51551a58:    	mov	w1, w25
6c51551a5c:    	mov	w2, w0
6c51551a60:    	mov	x0, x19
6c51551a64:    	mov	w3, #0x4045             // =16453
6c51551a68:    	movk	w3, #0x1, lsl #16
6c51551a6c:    	adr	x4, 0x6c51550d90 <trace+0x2d0>
6c51551a70:    	adrp	x16, 0x6c97724000 <trace+0x461d3000>
6c51551a74:    	add	x16, x16, #0xb68
6c51551a78:    	blr	x16
6c51551a7c:    	dmb	ishld
6c51551a80:    	b	0x6c51550d90 <trace+0x2d0>
6c51551a84:    	mov	w1, w26
6c51551a88:    	mov	x0, x19
6c51551a8c:    	mov	w2, #0x4045             // =16453
6c51551a90:    	movk	w2, #0x1, lsl #16
6c51551a94:    	adr	x3, 0x6c51550dfc <trace+0x33c>
6c51551a98:    	adrp	x16, 0x6c97723000 <trace+0x461d2000>
6c51551a9c:    	add	x16, x16, #0xf88
6c51551aa0:    	blr	x16
6c51551aa4:    	mov	w2, w0
6c51551aa8:    	dmb	ishld
6c51551aac:    	b	0x6c51550dfc <trace+0x33c>
6c51551ab0:    	mov	w1, w26
6c51551ab4:    	mov	w2, w0
6c51551ab8:    	mov	x0, x19
6c51551abc:    	mov	w3, #0x4045             // =16453
6c51551ac0:    	movk	w3, #0x1, lsl #16
6c51551ac4:    	adr	x4, 0x6c51550ea8 <trace+0x3e8>
6c51551ac8:    	adrp	x16, 0x6c97724000 <trace+0x461d4000>
6c51551acc:    	add	x16, x16, #0xb68
6c51551ad0:    	blr	x16
6c51551ad4:    	dmb	ishld
6c51551ad8:    	b	0x6c51550ea8 <trace+0x3e8>
6c51551adc:    	mov	w1, w26
6c51551ae0:    	mov	x0, x19
6c51551ae4:    	mov	w2, #0x4045             // =16453
6c51551ae8:    	movk	w2, #0x1, lsl #16
6c51551aec:    	adr	x3, 0x6c51550ef4 <trace+0x434>
6c51551af0:    	adrp	x16, 0x6c97723000 <trace+0x461d3000>
6c51551af4:    	add	x16, x16, #0xf88
6c51551af8:    	blr	x16
6c51551afc:    	mov	w2, w0
6c51551b00:    	dmb	ishld
6c51551b04:    	b	0x6c51550ef4 <trace+0x434>
6c51551b08:    	mov	w1, w26
6c51551b0c:    	mov	w2, w0
6c51551b10:    	mov	x0, x19
6c51551b14:    	mov	w3, #0x4045             // =16453
6c51551b18:    	movk	w3, #0x1, lsl #16
6c51551b1c:    	adr	x4, 0x6c51550f98 <trace+0x4d8>
6c51551b20:    	adrp	x16, 0x6c97724000 <trace+0x461d4000>
6c51551b24:    	add	x16, x16, #0xb68
6c51551b28:    	blr	x16
6c51551b2c:    	dmb	ishld
6c51551b30:    	b	0x6c51550f98 <trace+0x4d8>
6c51551b34:    	mov	w1, w20
6c51551b38:    	mov	w2, w0
6c51551b3c:    	mov	x0, x19
6c51551b40:    	mov	w3, #0x4045             // =16453
6c51551b44:    	movk	w3, #0x1, lsl #16
6c51551b48:    	adr	x4, 0x6c51551078 <trace+0x5b8>
6c51551b4c:    	adrp	x16, 0x6c97724000 <trace+0x461d4000>
6c51551b50:    	add	x16, x16, #0xb68
6c51551b54:    	blr	x16
6c51551b58:    	dmb	ishld
6c51551b5c:    	b	0x6c51551078 <trace+0x5b8>
6c51551b60:    	mov	w1, w26
6c51551b64:    	mov	x0, x19
6c51551b68:    	mov	w2, #0x4045             // =16453
6c51551b6c:    	movk	w2, #0x1, lsl #16
6c51551b70:    	adr	x3, 0x6c51551134 <trace+0x674>
6c51551b74:    	adrp	x16, 0x6c97723000 <trace+0x461d3000>
6c51551b78:    	add	x16, x16, #0xf88
6c51551b7c:    	blr	x16
6c51551b80:    	mov	w2, w0
6c51551b84:    	dmb	ishld
6c51551b88:    	b	0x6c51551134 <trace+0x674>
6c51551b8c:    	mov	w1, w26
6c51551b90:    	mov	x0, x19
6c51551b94:    	mov	w2, #0x4045             // =16453
6c51551b98:    	movk	w2, #0x1, lsl #16
6c51551b9c:    	adr	x3, 0x6c515511c0 <trace+0x700>
6c51551ba0:    	adrp	x16, 0x6c97723000 <trace+0x461d3000>
6c51551ba4:    	add	x16, x16, #0xf88
6c51551ba8:    	blr	x16
6c51551bac:    	mov	w2, w0
6c51551bb0:    	dmb	ishld
6c51551bb4:    	b	0x6c515511c0 <trace+0x700>
6c51551bb8:    	mov	w1, w23
6c51551bbc:    	mov	w2, w0
6c51551bc0:    	mov	x0, x19
6c51551bc4:    	mov	w3, #0x4045             // =16453
6c51551bc8:    	movk	w3, #0x1, lsl #16
6c51551bcc:    	adr	x4, 0x6c5155125c <trace+0x79c>
6c51551bd0:    	adrp	x16, 0x6c97724000 <trace+0x461d4000>
6c51551bd4:    	add	x16, x16, #0xb68
6c51551bd8:    	blr	x16
6c51551bdc:    	dmb	ishld
6c51551be0:    	b	0x6c5155125c <trace+0x79c>
6c51551be4:    	mov	w1, w23
6c51551be8:    	mov	x0, x19
6c51551bec:    	mov	w2, #0x4045             // =16453
6c51551bf0:    	movk	w2, #0x1, lsl #16
6c51551bf4:    	adr	x3, 0x6c515512d4 <trace+0x814>
6c51551bf8:    	adrp	x16, 0x6c97723000 <trace+0x461d3000>
6c51551bfc:    	add	x16, x16, #0xf88
6c51551c00:    	blr	x16
6c51551c04:    	mov	w2, w0
6c51551c08:    	dmb	ishld
6c51551c0c:    	b	0x6c515512d4 <trace+0x814>
6c51551c10:    	mov	w1, w22
6c51551c14:    	mov	x0, x19
6c51551c18:    	mov	w2, #0x4045             // =16453
6c51551c1c:    	movk	w2, #0x1, lsl #16
6c51551c20:    	adr	x3, 0x6c51551360 <trace+0x8a0>
6c51551c24:    	adrp	x16, 0x6c97723000 <trace+0x461d3000>
6c51551c28:    	add	x16, x16, #0xf88
6c51551c2c:    	blr	x16
6c51551c30:    	mov	w2, w0
6c51551c34:    	dmb	ishld
6c51551c38:    	b	0x6c51551360 <trace+0x8a0>
6c51551c3c:    	mov	w1, w22
6c51551c40:    	mov	x0, x19
6c51551c44:    	mov	w2, #0x4045             // =16453
6c51551c48:    	movk	w2, #0x1, lsl #16
6c51551c4c:    	adr	x3, 0x6c515513ec <trace+0x92c>
6c51551c50:    	adrp	x16, 0x6c97723000 <trace+0x461d3000>
6c51551c54:    	add	x16, x16, #0xf88
6c51551c58:    	blr	x16
6c51551c5c:    	mov	w2, w0
6c51551c60:    	dmb	ishld
6c51551c64:    	b	0x6c515513ec <trace+0x92c>
6c51551c68:    	mov	w1, w22
6c51551c6c:    	mov	x0, x19
6c51551c70:    	mov	w2, #0x4045             // =16453
6c51551c74:    	movk	w2, #0x1, lsl #16
6c51551c78:    	adr	x3, 0x6c5155153c <trace+0xa7c>
6c51551c7c:    	adrp	x16, 0x6c97723000 <trace+0x461d3000>
6c51551c80:    	add	x16, x16, #0xf88
6c51551c84:    	blr	x16
6c51551c88:    	mov	w2, w0
6c51551c8c:    	dmb	ishld
6c51551c90:    	b	0x6c5155153c <trace+0xa7c>
6c51551c94:    	mov	w1, w22
6c51551c98:    	mov	w2, w0
6c51551c9c:    	mov	x0, x19
6c51551ca0:    	mov	w3, #0x4045             // =16453
6c51551ca4:    	movk	w3, #0x1, lsl #16
6c51551ca8:    	adr	x4, 0x6c51551644 <trace+0xb84>
6c51551cac:    	adrp	x16, 0x6c97724000 <trace+0x461d4000>
6c51551cb0:    	add	x16, x16, #0xb68
6c51551cb4:    	blr	x16
6c51551cb8:    	dmb	ishld
6c51551cbc:    	b	0x6c51551644 <trace+0xb84>
6c51551cc0:    	mov	w1, w20
6c51551cc4:    	mov	x0, x19
6c51551cc8:    	mov	w2, #0x4045             // =16453
6c51551ccc:    	movk	w2, #0x1, lsl #16
6c51551cd0:    	adr	x3, 0x6c515516e0 <trace+0xc20>
6c51551cd4:    	adrp	x16, 0x6c97723000 <trace+0x461d3000>
6c51551cd8:    	add	x16, x16, #0xf88
6c51551cdc:    	blr	x16
6c51551ce0:    	mov	w2, w0
6c51551ce4:    	dmb	ishld
6c51551ce8:    	b	0x6c515516e0 <trace+0xc20>
6c51551cec:    	mov	w1, w21
6c51551cf0:    	mov	x0, x19
6c51551cf4:    	mov	w2, #0x4045             // =16453
6c51551cf8:    	movk	w2, #0x1, lsl #16
6c51551cfc:    	adr	x3, 0x6c51551794 <trace+0xcd4>
6c51551d00:    	adrp	x16, 0x6c97723000 <trace+0x461d3000>
6c51551d04:    	add	x16, x16, #0xf88
6c51551d08:    	blr	x16
6c51551d0c:    	mov	w2, w0
6c51551d10:    	dmb	ishld
6c51551d14:    	b	0x6c51551794 <trace+0xcd4>
6c51551d18:    	mov	w1, w22
6c51551d1c:    	mov	w2, w0
6c51551d20:    	mov	x0, x19
6c51551d24:    	mov	w3, #0x4045             // =16453
6c51551d28:    	movk	w3, #0x1, lsl #16
6c51551d2c:    	adr	x4, 0x6c5155189c <trace+0xddc>
6c51551d30:    	adrp	x16, 0x6c97724000 <trace+0x461d4000>
6c51551d34:    	add	x16, x16, #0xb68
6c51551d38:    	blr	x16
6c51551d3c:    	dmb	ishld
6c51551d40:    	b	0x6c5155189c <trace+0xddc>
6c51551d44:    	mov	w1, w20
6c51551d48:    	mov	w2, w22
6c51551d4c:    	mov	x0, x19
6c51551d50:    	mov	w3, #0x4045             // =16453
6c51551d54:    	movk	w3, #0x1, lsl #16
6c51551d58:    	adr	x4, 0x6c5155192c <trace+0xe6c>
6c51551d5c:    	adrp	x16, 0x6c97724000 <trace+0x461d4000>
6c51551d60:    	add	x16, x16, #0xb68
6c51551d64:    	blr	x16
6c51551d68:    	dmb	ishld
6c51551d6c:    	b	0x6c5155192c <trace+0xe6c>