
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-15f23b-6ead0f2040.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006ead0f2040 <trace>:
6ead0f2040:    	ldur	w20, [x19, #-0x10]  // guest 0x15f23b, sampled 0
6ead0f2044:    	tbnz	w20, #0x1f, 0x6ead0f2210 <trace+0x1d0>  // guest 0x15f23b, sampled 0
6ead0f2048:    	sturb	wzr, [x19, #-0xc]  // guest 0x15f23b, sampled 0
6ead0f204c:    	ldr	w20, [x19, #0xc]  // guest 0x15f23b, sampled 0
6ead0f2050:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15f23b, sampled 0
6ead0f2054:    	and	x16, x16, x20, lsr #7  // guest 0x15f23b, sampled 0
6ead0f2058:    	add	x17, x17, x16  // guest 0x15f23b, sampled 0
6ead0f205c:    	ldp	x16, x17, [x17]  // guest 0x15f23b, sampled 0
6ead0f2060:    	and	w30, w20, #0xfffff003  // guest 0x15f23b, sampled 0
6ead0f2064:    	cmp	w16, w30  // guest 0x15f23b, sampled 0
6ead0f2068:    	b.ne	0x6ead0f2218 <trace+0x1d8>  // guest 0x15f23b, sampled 0
6ead0f206c:    	add	x30, x17, w20, uxtw  // guest 0x15f23b, sampled 0
6ead0f2070:    	ldapr	w20, [x30]  // guest 0x15f23b, sampled 0
6ead0f2074:    	ldr	w21, [x19, #0x1c]  // guest 0x15f23d, sampled 0
6ead0f2078:    	sxtw	x21, w21  // guest 0x15f23d, sampled 0
6ead0f207c:    	mov	w22, #0xf30             // =3888  // guest 0x15f23d, sampled 0
6ead0f2080:    	mul	x21, x21, x22  // guest 0x15f23d, sampled 0
6ead0f2084:    	add	w21, w21, w20  // guest 0x15f243, sampled 0
6ead0f2088:    	str	w21, [x19, #0x1c]  // guest 0x15f243, sampled 0
6ead0f208c:    	str	w21, [x19, #0x28]  // guest 0x15f243, sampled 0
6ead0f2090:    	str	w20, [x19, #0x2c]  // guest 0x15f243, sampled 0
6ead0f2094:    	ldr	w20, [x19, #0x14]  // guest 0x15f245, sampled 0
6ead0f2098:    	add	w20, w20, #0x30  // guest 0x15f245, sampled 0
6ead0f209c:    	str	w20, [sp, #0x80]  // guest 0x15f245, sampled 0
6ead0f20a0:    	str	w20, [x19, #0x18]  // guest 0x15f245, sampled 0
6ead0f20a4:    	mov	w20, #0x3cc             // =972  // guest 0x15f248, sampled 0
6ead0f20a8:    	str	w20, [sp, #0x84]  // guest 0x15f248, sampled 0
6ead0f20ac:    	mov	w20, #0x3cc             // =972  // guest 0x15f248, sampled 0
6ead0f20b0:    	str	w20, [x19, #0x4]  // guest 0x15f248, sampled 0
6ead0f20b4:    	mov	w20, #0x1               // =1  // guest 0x15f248, sampled 0
6ead0f20b8:    	sturb	w20, [x19, #-0xc]  // guest 0x15f248, sampled 0
6ead0f20bc:    	ldr	w20, [x19, #0x38]  // guest 0x15f24d, sampled 0
6ead0f20c0:    	lsl	w20, w20, #2  // guest 0x15f24d, sampled 0
6ead0f20c4:    	str	w20, [sp, #0x88]  // guest 0x15f24d, sampled 0
6ead0f20c8:    	mov	w20, #0xa               // =10  // guest 0x15f24d, sampled 0
6ead0f20cc:    	str	w20, [x19, #0x34]  // guest 0x15f24d, sampled 0
6ead0f20d0:    	mov	w20, #0x3cb             // =971  // guest 0x15f24d, sampled 0
6ead0f20d4:    	str	w20, [sp, #0x8c]  // guest 0x15f24d, sampled 0
6ead0f20d8:    	ldr	w20, [x19, #0x18]  // guest 0x15f24d, sampled 4
6ead0f20dc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15f24d, sampled 2
6ead0f20e0:    	and	x16, x16, x20, lsr #7  // guest 0x15f24d, sampled 0
6ead0f20e4:    	add	x17, x17, x16  // guest 0x15f24d, sampled 0
6ead0f20e8:    	ldp	x16, x17, [x17]  // guest 0x15f24d, sampled 0
6ead0f20ec:    	and	w30, w20, #0xfffff003  // guest 0x15f24d, sampled 6
6ead0f20f0:    	cmp	w16, w30  // guest 0x15f24d, sampled 0
6ead0f20f4:    	b.ne	0x6ead0f2244 <trace+0x204>  // guest 0x15f24d, sampled 0
6ead0f20f8:    	add	x30, x17, w20, uxtw  // guest 0x15f24d, sampled 1
6ead0f20fc:    	ldapr	w21, [x30]  // guest 0x15f24d, sampled 0
6ead0f2100:    	str	w21, [sp, #0x84]  // guest 0x15f24d, sampled 22
6ead0f2104:    	ldr	w22, [x19, #0x1c]  // guest 0x15f24d, sampled 0
6ead0f2108:    	str	w22, [sp, #0x80]  // guest 0x15f24d, sampled 0
6ead0f210c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15f24d, sampled 0
6ead0f2110:    	and	x16, x16, x22, lsr #7  // guest 0x15f24d, sampled 0
6ead0f2114:    	add	x17, x17, x16  // guest 0x15f24d, sampled 0
6ead0f2118:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15f24d, sampled 0
6ead0f211c:    	and	w30, w22, #0xfffff003  // guest 0x15f24d, sampled 0
6ead0f2120:    	cmp	w16, w30  // guest 0x15f24d, sampled 2
6ead0f2124:    	b.ne	0x6ead0f2270 <trace+0x230>  // guest 0x15f24d, sampled 0
6ead0f2128:    	add	x30, x17, w22, uxtw  // guest 0x15f24d, sampled 0
6ead0f212c:    	stlr	w21, [x30]  // guest 0x15f24d, sampled 0
6ead0f2130:    	ldr	w21, [sp, #0x88]  // guest 0x15f24d, sampled 0
6ead0f2134:    	add	w20, w20, w21  // guest 0x15f24d, sampled 0
6ead0f2138:    	str	w20, [x19, #0x18]  // guest 0x15f24d, sampled 0
6ead0f213c:    	add	w20, w22, w21  // guest 0x15f24d, sampled 0
6ead0f2140:    	str	w20, [x19, #0x1c]  // guest 0x15f24d, sampled 0
6ead0f2144:    	ldr	w20, [sp, #0x8c]  // guest 0x15f24d, sampled 1
6ead0f2148:    	str	w20, [x19, #0x4]  // guest 0x15f24d, sampled 2
6ead0f214c:    	sub	w20, w20, #0x1  // guest 0x15f24d, sampled 0
6ead0f2150:    	str	w20, [sp, #0x8c]  // guest 0x15f24d, sampled 0
6ead0f2154:    	tst	w20, #0xffff  // guest 0x15f24d, sampled 1
6ead0f2158:    	b.ne	0x6ead0f20d8 <trace+0x98>  // guest 0x15f24d, sampled 0
6ead0f215c:    	cbz	w20, 0x6ead0f2188 <trace+0x148>  // guest 0x15f24d, sampled 0
6ead0f2160:    	ldr	w20, [x19, #0x24]  // guest 0x15f24d, sampled 0
6ead0f2164:    	orr	w20, w20, #0x10000  // guest 0x15f24d, sampled 0
6ead0f2168:    	str	w20, [x19, #0x24]  // guest 0x15f24d, sampled 0
6ead0f216c:    	b	0x6ead0f216c <trace+0x12c>  // guest 0x15f24d, sampled 0
6ead0f2170:    	br	x16  // guest 0x15f24d, sampled 0
6ead0f2174:    	mov	w20, #0xf24d            // =62029  // guest 0x15f24d, sampled 0
6ead0f2178:    	movk	w20, #0x15, lsl #16  // guest 0x15f24d, sampled 0
6ead0f217c:    	str	w20, [x19, #0x20]  // guest 0x15f24d, sampled 0
6ead0f2180:    	adr	x0, 0x6ead0f1f80 <trace+0xffffffffffffff40>  // guest 0x15f24d, sampled 0
6ead0f2184:    	b	0x6ea842202c <trace+0xfffffffffb32ffec>  // guest 0x15f24d, sampled 0
6ead0f2188:    	ldr	w20, [x19, #0x18]  // guest 0x15f24d, sampled 0
6ead0f218c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15f24d, sampled 0
6ead0f2190:    	and	x16, x16, x20, lsr #7  // guest 0x15f24d, sampled 0
6ead0f2194:    	add	x17, x17, x16  // guest 0x15f24d, sampled 0
6ead0f2198:    	ldp	x16, x17, [x17]  // guest 0x15f24d, sampled 0
6ead0f219c:    	and	w30, w20, #0xfffff003  // guest 0x15f24d, sampled 0
6ead0f21a0:    	cmp	w16, w30  // guest 0x15f24d, sampled 0
6ead0f21a4:    	b.ne	0x6ead0f229c <trace+0x25c>  // guest 0x15f24d, sampled 0
6ead0f21a8:    	add	x30, x17, w20, uxtw  // guest 0x15f24d, sampled 0
6ead0f21ac:    	ldapr	w21, [x30]  // guest 0x15f24d, sampled 0
6ead0f21b0:    	ldr	w22, [x19, #0x1c]  // guest 0x15f24d, sampled 0
6ead0f21b4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15f24d, sampled 0
6ead0f21b8:    	and	x16, x16, x22, lsr #7  // guest 0x15f24d, sampled 0
6ead0f21bc:    	add	x17, x17, x16  // guest 0x15f24d, sampled 0
6ead0f21c0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15f24d, sampled 0
6ead0f21c4:    	and	w30, w22, #0xfffff003  // guest 0x15f24d, sampled 0
6ead0f21c8:    	cmp	w16, w30  // guest 0x15f24d, sampled 0
6ead0f21cc:    	b.ne	0x6ead0f22c8 <trace+0x288>  // guest 0x15f24d, sampled 0
6ead0f21d0:    	add	x30, x17, w22, uxtw  // guest 0x15f24d, sampled 0
6ead0f21d4:    	stlr	w21, [x30]  // guest 0x15f24d, sampled 0
6ead0f21d8:    	ldr	w21, [sp, #0x88]  // guest 0x15f24d, sampled 0
6ead0f21dc:    	add	w20, w20, w21  // guest 0x15f24d, sampled 0
6ead0f21e0:    	str	w20, [x19, #0x18]  // guest 0x15f24d, sampled 0
6ead0f21e4:    	add	w20, w22, w21  // guest 0x15f24d, sampled 0
6ead0f21e8:    	str	w20, [x19, #0x1c]  // guest 0x15f24d, sampled 0
6ead0f21ec:    	ldr	w20, [sp, #0x8c]  // guest 0x15f24d, sampled 0
6ead0f21f0:    	str	w20, [x19, #0x4]  // guest 0x15f24d, sampled 0
6ead0f21f4:    	b	0x6ead0f21f4 <trace+0x1b4>  // guest 0x15f24d, sampled 0
6ead0f21f8:    	br	x16  // guest 0x15f24d, sampled 0
6ead0f21fc:    	mov	w20, #0xf24f            // =62031  // guest 0x15f24d, sampled 0
6ead0f2200:    	movk	w20, #0x15, lsl #16  // guest 0x15f24d, sampled 0
6ead0f2204:    	str	w20, [x19, #0x20]  // guest 0x15f24d, sampled 0
6ead0f2208:    	adr	x0, 0x6ead0f1f81 <trace+0xffffffffffffff41>  // guest 0x15f24d, sampled 0
6ead0f220c:    	b	0x6ea842202c <trace+0xfffffffffb32ffec>  // guest 0x15f24d, sampled 0
6ead0f2210:    	adr	x0, 0x6ead0f1f83 <trace+0xffffffffffffff43>  // guest 0x15f24d, sampled 0
6ead0f2214:    	b	0x6ea842202c <trace+0xfffffffffb32ffec>  // guest 0x15f24d, sampled 0
6ead0f2218:    	mov	w1, w20
6ead0f221c:    	mov	x0, x19
6ead0f2220:    	mov	w2, #0x4045             // =16453
6ead0f2224:    	movk	w2, #0x1, lsl #16
6ead0f2228:    	adr	x3, 0x6ead0f2074 <trace+0x34>
6ead0f222c:    	adrp	x16, 0x6efc87d000 <trace+0x4f78b000>
6ead0f2230:    	add	x16, x16, #0x58
6ead0f2234:    	blr	x16
6ead0f2238:    	mov	w20, w0
6ead0f223c:    	dmb	ishld
6ead0f2240:    	b	0x6ead0f2074 <trace+0x34>
6ead0f2244:    	mov	w1, w20
6ead0f2248:    	mov	x0, x19
6ead0f224c:    	mov	w2, #0x4045             // =16453
6ead0f2250:    	movk	w2, #0x1, lsl #16
6ead0f2254:    	adr	x3, 0x6ead0f2100 <trace+0xc0>
6ead0f2258:    	adrp	x16, 0x6efc87d000 <trace+0x4f78b000>
6ead0f225c:    	add	x16, x16, #0x58
6ead0f2260:    	blr	x16
6ead0f2264:    	mov	w21, w0
6ead0f2268:    	dmb	ishld
6ead0f226c:    	b	0x6ead0f2100 <trace+0xc0>
6ead0f2270:    	mov	w1, w22
6ead0f2274:    	mov	w2, w21
6ead0f2278:    	mov	x0, x19
6ead0f227c:    	mov	w3, #0x4045             // =16453
6ead0f2280:    	movk	w3, #0x1, lsl #16
6ead0f2284:    	adr	x4, 0x6ead0f2130 <trace+0xf0>
6ead0f2288:    	adrp	x16, 0x6efc87d000 <trace+0x4f78b000>
6ead0f228c:    	add	x16, x16, #0xc38
6ead0f2290:    	blr	x16
6ead0f2294:    	dmb	ishld
6ead0f2298:    	b	0x6ead0f2130 <trace+0xf0>
6ead0f229c:    	mov	w1, w20
6ead0f22a0:    	mov	x0, x19
6ead0f22a4:    	mov	w2, #0x4045             // =16453
6ead0f22a8:    	movk	w2, #0x1, lsl #16
6ead0f22ac:    	adr	x3, 0x6ead0f21b0 <trace+0x170>
6ead0f22b0:    	adrp	x16, 0x6efc87d000 <trace+0x4f78b000>
6ead0f22b4:    	add	x16, x16, #0x58
6ead0f22b8:    	blr	x16
6ead0f22bc:    	mov	w21, w0
6ead0f22c0:    	dmb	ishld
6ead0f22c4:    	b	0x6ead0f21b0 <trace+0x170>
6ead0f22c8:    	mov	w1, w22
6ead0f22cc:    	mov	w2, w21
6ead0f22d0:    	mov	x0, x19
6ead0f22d4:    	mov	w3, #0x4045             // =16453
6ead0f22d8:    	movk	w3, #0x1, lsl #16
6ead0f22dc:    	adr	x4, 0x6ead0f21d8 <trace+0x198>
6ead0f22e0:    	adrp	x16, 0x6efc87d000 <trace+0x4f78b000>
6ead0f22e4:    	add	x16, x16, #0xc38
6ead0f22e8:    	blr	x16
6ead0f22ec:    	dmb	ishld
6ead0f22f0:    	b	0x6ead0f21d8 <trace+0x198>