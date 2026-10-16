
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-4391d-6c4e6697c0.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006c4e6697c0 <trace>:
6c4e6697c0:    	ldur	w20, [x19, #-0x10]  // guest 0x4391d, sampled 0
6c4e6697c4:    	tbnz	w20, #0x1f, 0x6c4e669914 <trace+0x154>  // guest 0x4391d, sampled 0
6c4e6697c8:    	sturb	wzr, [x19, #-0xc]  // guest 0x4391d, sampled 0
6c4e6697cc:    	ldr	w20, [x19, #0x14]  // guest 0x4391d, sampled 2
6c4e6697d0:    	sub	w21, w20, #0x4  // guest 0x4391d, sampled 0
6c4e6697d4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x4391d, sampled 0
6c4e6697d8:    	and	x16, x16, x21, lsr #7  // guest 0x4391d, sampled 0
6c4e6697dc:    	add	x17, x17, x16  // guest 0x4391d, sampled 0
6c4e6697e0:    	ldp	x16, x17, [x17]  // guest 0x4391d, sampled 0
6c4e6697e4:    	and	w30, w21, #0xfffff003  // guest 0x4391d, sampled 0
6c4e6697e8:    	cmp	w16, w30  // guest 0x4391d, sampled 0
6c4e6697ec:    	b.ne	0x6c4e66991c <trace+0x15c>  // guest 0x4391d, sampled 0
6c4e6697f0:    	add	x30, x17, w21, uxtw  // guest 0x4391d, sampled 0
6c4e6697f4:    	ldapr	w21, [x30]  // guest 0x4391d, sampled 0
6c4e6697f8:    	add	w21, w21, #0x1  // guest 0x43920, sampled 0
6c4e6697fc:    	str	w21, [x19, #0x4]  // guest 0x43920, sampled 0
6c4e669800:    	str	w21, [x19, #0x28]  // guest 0x43920, sampled 1
6c4e669804:    	mov	w22, #0x1               // =1  // guest 0x43920, sampled 0
6c4e669808:    	str	w22, [x19, #0x2c]  // guest 0x43920, sampled 0
6c4e66980c:    	sub	w22, w20, #0x4  // guest 0x43923, sampled 0
6c4e669810:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x43923, sampled 0
6c4e669814:    	and	x16, x16, x22, lsr #7  // guest 0x43923, sampled 0
6c4e669818:    	add	x17, x17, x16  // guest 0x43923, sampled 0
6c4e66981c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x43923, sampled 0
6c4e669820:    	and	w30, w22, #0xfffff003  // guest 0x43923, sampled 0
6c4e669824:    	cmp	w16, w30  // guest 0x43923, sampled 0
6c4e669828:    	b.ne	0x6c4e669948 <trace+0x188>  // guest 0x43923, sampled 0
6c4e66982c:    	add	x30, x17, w22, uxtw  // guest 0x43923, sampled 0
6c4e669830:    	stlr	w21, [x30]  // guest 0x43923, sampled 0
6c4e669834:    	add	w21, w20, #0xc  // guest 0x43926, sampled 0
6c4e669838:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x43926, sampled 0
6c4e66983c:    	and	x16, x16, x21, lsr #7  // guest 0x43926, sampled 0
6c4e669840:    	add	x17, x17, x16  // guest 0x43926, sampled 0
6c4e669844:    	ldp	x16, x17, [x17]  // guest 0x43926, sampled 0
6c4e669848:    	and	w30, w21, #0xfffff003  // guest 0x43926, sampled 0
6c4e66984c:    	cmp	w16, w30  // guest 0x43926, sampled 0
6c4e669850:    	b.ne	0x6c4e669974 <trace+0x1b4>  // guest 0x43926, sampled 0
6c4e669854:    	add	x30, x17, w21, uxtw  // guest 0x43926, sampled 0
6c4e669858:    	ldapr	w21, [x30]  // guest 0x43926, sampled 1
6c4e66985c:    	str	w21, [x19, #0x8]  // guest 0x43926, sampled 0
6c4e669860:    	sub	w20, w20, #0x4  // guest 0x43929, sampled 0
6c4e669864:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x43929, sampled 0
6c4e669868:    	and	x16, x16, x20, lsr #7  // guest 0x43929, sampled 0
6c4e66986c:    	add	x17, x17, x16  // guest 0x43929, sampled 0
6c4e669870:    	ldp	x16, x17, [x17]  // guest 0x43929, sampled 0
6c4e669874:    	and	w30, w20, #0xfffff003  // guest 0x43929, sampled 0
6c4e669878:    	cmp	w16, w30  // guest 0x43929, sampled 1
6c4e66987c:    	b.ne	0x6c4e6699a0 <trace+0x1e0>  // guest 0x43929, sampled 0
6c4e669880:    	add	x30, x17, w20, uxtw  // guest 0x43929, sampled 0
6c4e669884:    	ldapr	w20, [x30]  // guest 0x43929, sampled 0
6c4e669888:    	add	w21, w21, w20  // guest 0x43929, sampled 3
6c4e66988c:    	str	w21, [x19, #0x8]  // guest 0x43929, sampled 0
6c4e669890:    	str	w21, [x19, #0x28]  // guest 0x43929, sampled 0
6c4e669894:    	str	w20, [x19, #0x2c]  // guest 0x43929, sampled 0
6c4e669898:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x4392c, sampled 0
6c4e66989c:    	and	x16, x16, x21, lsr #7  // guest 0x4392c, sampled 0
6c4e6698a0:    	add	x17, x17, x16  // guest 0x4392c, sampled 1
6c4e6698a4:    	ldp	x16, x17, [x17]  // guest 0x4392c, sampled 0
6c4e6698a8:    	and	w30, w21, #0xfffff000  // guest 0x4392c, sampled 6
6c4e6698ac:    	cmp	w16, w30  // guest 0x4392c, sampled 0
6c4e6698b0:    	b.ne	0x6c4e6699cc <trace+0x20c>  // guest 0x4392c, sampled 0
6c4e6698b4:    	add	x30, x17, w21, uxtw  // guest 0x4392c, sampled 2
6c4e6698b8:    	ldaprb	w20, [x30]  // guest 0x4392c, sampled 0
6c4e6698bc:    	sxtb	w20, w20  // guest 0x4392c, sampled 5
6c4e6698c0:    	str	w20, [x19]  // guest 0x4392c, sampled 0
6c4e6698c4:    	str	w20, [x19, #0x28]  // guest 0x4392f, sampled 0
6c4e6698c8:    	mov	w21, #0x1               // =1  // guest 0x4392f, sampled 0
6c4e6698cc:    	sturb	w21, [x19, #-0xc]  // guest 0x4392f, sampled 0
6c4e6698d0:    	mov	w21, #0x1a              // =26  // guest 0x43931, sampled 0
6c4e6698d4:    	str	w21, [x19, #0x34]  // guest 0x43931, sampled 0
6c4e6698d8:    	cbz	w20, 0x6c4e6698f8 <trace+0x138>  // guest 0x43931, sampled 0
6c4e6698dc:    	b	0x6c4e6698dc <trace+0x11c>  // guest 0x43931, sampled 1
6c4e6698e0:    	br	x16  // guest 0x43931, sampled 0
6c4e6698e4:    	mov	w20, #0x3933            // =14643  // guest 0x43931, sampled 0
6c4e6698e8:    	movk	w20, #0x4, lsl #16  // guest 0x43931, sampled 0
6c4e6698ec:    	str	w20, [x19, #0x20]  // guest 0x43931, sampled 0
6c4e6698f0:    	adr	x0, 0x6c4e669701 <trace+0xffffffffffffff41>  // guest 0x43931, sampled 0
6c4e6698f4:    	b	0x6c4ae5d02c <trace+0xfffffffffc7f386c>  // guest 0x43931, sampled 0
6c4e6698f8:    	b	0x6c4e6698f8 <trace+0x138>  // guest 0x43931, sampled 0
6c4e6698fc:    	br	x16  // guest 0x43931, sampled 0
6c4e669900:    	mov	w20, #0x3950            // =14672  // guest 0x43931, sampled 0
6c4e669904:    	movk	w20, #0x4, lsl #16  // guest 0x43931, sampled 0
6c4e669908:    	str	w20, [x19, #0x20]  // guest 0x43931, sampled 0
6c4e66990c:    	adr	x0, 0x6c4e669700 <trace+0xffffffffffffff40>  // guest 0x43931, sampled 0
6c4e669910:    	b	0x6c4ae5d02c <trace+0xfffffffffc7f386c>  // guest 0x43931, sampled 0
6c4e669914:    	adr	x0, 0x6c4e669703 <trace+0xffffffffffffff43>  // guest 0x43931, sampled 0
6c4e669918:    	b	0x6c4ae5d02c <trace+0xfffffffffc7f386c>  // guest 0x43931, sampled 0
6c4e66991c:    	mov	w1, w21
6c4e669920:    	mov	x0, x19
6c4e669924:    	mov	w2, #0x4045             // =16453
6c4e669928:    	movk	w2, #0x1, lsl #16
6c4e66992c:    	adr	x3, 0x6c4e6697f8 <trace+0x38>
6c4e669930:    	adrp	x16, 0x6c97723000 <trace+0x490ba000>
6c4e669934:    	add	x16, x16, #0xf88
6c4e669938:    	blr	x16
6c4e66993c:    	mov	w21, w0
6c4e669940:    	dmb	ishld
6c4e669944:    	b	0x6c4e6697f8 <trace+0x38>
6c4e669948:    	mov	w1, w22
6c4e66994c:    	mov	w2, w21
6c4e669950:    	mov	x0, x19
6c4e669954:    	mov	w3, #0x4045             // =16453
6c4e669958:    	movk	w3, #0x1, lsl #16
6c4e66995c:    	adr	x4, 0x6c4e669834 <trace+0x74>
6c4e669960:    	adrp	x16, 0x6c97724000 <trace+0x490bb000>
6c4e669964:    	add	x16, x16, #0xb68
6c4e669968:    	blr	x16
6c4e66996c:    	dmb	ishld
6c4e669970:    	b	0x6c4e669834 <trace+0x74>
6c4e669974:    	mov	w1, w21
6c4e669978:    	mov	x0, x19
6c4e66997c:    	mov	w2, #0x4045             // =16453
6c4e669980:    	movk	w2, #0x1, lsl #16
6c4e669984:    	adr	x3, 0x6c4e66985c <trace+0x9c>
6c4e669988:    	adrp	x16, 0x6c97723000 <trace+0x490ba000>
6c4e66998c:    	add	x16, x16, #0xf88
6c4e669990:    	blr	x16
6c4e669994:    	mov	w21, w0
6c4e669998:    	dmb	ishld
6c4e66999c:    	b	0x6c4e66985c <trace+0x9c>
6c4e6699a0:    	mov	w1, w20
6c4e6699a4:    	mov	x0, x19
6c4e6699a8:    	mov	w2, #0x4045             // =16453
6c4e6699ac:    	movk	w2, #0x1, lsl #16
6c4e6699b0:    	adr	x3, 0x6c4e669888 <trace+0xc8>
6c4e6699b4:    	adrp	x16, 0x6c97723000 <trace+0x490ba000>
6c4e6699b8:    	add	x16, x16, #0xf88
6c4e6699bc:    	blr	x16
6c4e6699c0:    	mov	w20, w0
6c4e6699c4:    	dmb	ishld
6c4e6699c8:    	b	0x6c4e669888 <trace+0xc8>
6c4e6699cc:    	mov	w1, w21
6c4e6699d0:    	mov	x0, x19
6c4e6699d4:    	mov	w2, #0x5d05             // =23813
6c4e6699d8:    	movk	w2, #0x1, lsl #16
6c4e6699dc:    	adr	x3, 0x6c4e6698c0 <trace+0x100>
6c4e6699e0:    	adrp	x16, 0x6c97723000 <trace+0x490ba000>
6c4e6699e4:    	add	x16, x16, #0xc1c
6c4e6699e8:    	blr	x16
6c4e6699ec:    	sxtb	w20, w0
6c4e6699f0:    	dmb	ishld
6c4e6699f4:    	b	0x6c4e6698c0 <trace+0x100>