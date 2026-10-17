
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-18d0bf-6eaeb30000.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006eaeb30000 <trace>:
6eaeb30000:    	ldur	w20, [x19, #-0x10]  // guest 0x18d0bf, sampled 0
6eaeb30004:    	tbnz	w20, #0x1f, 0x6eaeb31018 <trace+0x1018>  // guest 0x18d0bf, sampled 0
6eaeb30008:    	sturb	wzr, [x19, #-0xc]  // guest 0x18d0bf, sampled 0
6eaeb3000c:    	ldr	w20, [x19, #0x4]  // guest 0x18d0bf, sampled 1
6eaeb30010:    	add	w20, w20, #0x1  // guest 0x18d0bf, sampled 0
6eaeb30014:    	ldr	w3, [x19, #0x34]  // guest 0x18d0bf, sampled 0
6eaeb30018:    	ldr	w2, [x19, #0x30]  // guest 0x18d0bf, sampled 1
6eaeb3001c:    	ldr	w1, [x19, #0x2c]  // guest 0x18d0bf, sampled 0
6eaeb30020:    	ldr	w0, [x19, #0x28]  // guest 0x18d0bf, sampled 0
6eaeb30024:    	adrp	x16, 0x6efc8a9000 <trace+0x4dd79000>  // guest 0x18d0bf, sampled 0
6eaeb30028:    	add	x16, x16, #0xdc4  // guest 0x18d0bf, sampled 0
6eaeb3002c:    	blr	x16  // guest 0x18d0bf, sampled 0
6eaeb30030:    	str	w20, [x19, #0x4]  // guest 0x18d0bf, sampled 0
6eaeb30034:    	str	w20, [x19, #0x28]  // guest 0x18d0bf, sampled 0
6eaeb30038:    	str	w0, [x19, #0x2c]  // guest 0x18d0bf, sampled 0
6eaeb3003c:    	ldr	w21, [x19, #0x14]  // guest 0x18d0c0, sampled 0
6eaeb30040:    	ldr	w22, [x19, #0x1c]  // guest 0x18d0c0, sampled 0
6eaeb30044:    	add	w21, w21, w22  // guest 0x18d0c0, sampled 0
6eaeb30048:    	mov	w23, #0x5245            // =21061  // guest 0x18d0c0, sampled 0
6eaeb3004c:    	add	w21, w21, w23  // guest 0x18d0c0, sampled 0
6eaeb30050:    	str	w21, [x19, #0x14]  // guest 0x18d0c0, sampled 0
6eaeb30054:    	lsl	w21, w21, #2  // guest 0x18d0c7, sampled 0
6eaeb30058:    	ldr	w24, [x19, #0x18]  // guest 0x18d0c7, sampled 0
6eaeb3005c:    	add	w21, w21, w24  // guest 0x18d0c7, sampled 0
6eaeb30060:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d0c7, sampled 0
6eaeb30064:    	and	x16, x16, x21, lsr #7  // guest 0x18d0c7, sampled 0
6eaeb30068:    	add	x17, x17, x16  // guest 0x18d0c7, sampled 0
6eaeb3006c:    	ldp	x16, x17, [x17]  // guest 0x18d0c7, sampled 0
6eaeb30070:    	and	w30, w21, #0xfffff003  // guest 0x18d0c7, sampled 0
6eaeb30074:    	cmp	w16, w30  // guest 0x18d0c7, sampled 0
6eaeb30078:    	b.ne	0x6eaeb31020 <trace+0x1020>  // guest 0x18d0c7, sampled 0
6eaeb3007c:    	add	x30, x17, w21, uxtw  // guest 0x18d0c7, sampled 0
6eaeb30080:    	ldapr	w21, [x30]  // guest 0x18d0c7, sampled 0
6eaeb30084:    	str	w21, [x19, #0x14]  // guest 0x18d0c7, sampled 1
6eaeb30088:    	lsl	w21, w21, #2  // guest 0x18d0ca, sampled 0
6eaeb3008c:    	add	w21, w21, w24  // guest 0x18d0ca, sampled 0
6eaeb30090:    	mov	w25, #0xc508            // =50440  // guest 0x18d0ca, sampled 0
6eaeb30094:    	add	w21, w21, w25  // guest 0x18d0ca, sampled 0
6eaeb30098:    	mov	w26, w21  // guest 0x18d0ca, sampled 0
6eaeb3009c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d0ca, sampled 0
6eaeb300a0:    	and	x16, x16, x21, lsr #7  // guest 0x18d0ca, sampled 0
6eaeb300a4:    	add	x17, x17, x16  // guest 0x18d0ca, sampled 0
6eaeb300a8:    	ldp	x16, x17, [x17]  // guest 0x18d0ca, sampled 0
6eaeb300ac:    	and	w30, w21, #0xfffff003  // guest 0x18d0ca, sampled 1
6eaeb300b0:    	cmp	w16, w30  // guest 0x18d0ca, sampled 0
6eaeb300b4:    	b.ne	0x6eaeb3104c <trace+0x104c>  // guest 0x18d0ca, sampled 0
6eaeb300b8:    	add	x30, x17, w21, uxtw  // guest 0x18d0ca, sampled 0
6eaeb300bc:    	ldapr	w2, [x30]  // guest 0x18d0ca, sampled 0
6eaeb300c0:    	ldr	w21, [x19, #0x188]  // guest 0x18d0ca, sampled 2
6eaeb300c4:    	add	w27, w21, #0x7  // guest 0x18d0ca, sampled 0
6eaeb300c8:    	and	w27, w27, #0x7  // guest 0x18d0ca, sampled 0
6eaeb300cc:    	lsl	w27, w27, #4  // guest 0x18d0ca, sampled 0
6eaeb300d0:    	add	w27, w27, #0x1a0  // guest 0x18d0ca, sampled 0
6eaeb300d4:    	sxtw	x27, w27  // guest 0x18d0ca, sampled 0
6eaeb300d8:    	add	x1, x27, x19  // guest 0x18d0ca, sampled 0
6eaeb300dc:    	mov	x0, x19  // guest 0x18d0ca, sampled 0
6eaeb300e0:    	adrp	x16, 0x6efc8aa000 <trace+0x4dd7a000>  // guest 0x18d0ca, sampled 0
6eaeb300e4:    	add	x16, x16, #0x484  // guest 0x18d0ca, sampled 0
6eaeb300e8:    	blr	x16  // guest 0x18d0ca, sampled 0
6eaeb300ec:    	sub	w21, w21, #0x1  // guest 0x18d0ca, sampled 0
6eaeb300f0:    	and	w21, w21, #0x7  // guest 0x18d0ca, sampled 0
6eaeb300f4:    	str	w21, [x19, #0x188]  // guest 0x18d0ca, sampled 0
6eaeb300f8:    	sxtw	x27, w21  // guest 0x18d0ca, sampled 0
6eaeb300fc:    	add	x27, x27, x19  // guest 0x18d0ca, sampled 0
6eaeb30100:    	strb	wzr, [x27, #0x190]  // guest 0x18d0ca, sampled 0
6eaeb30104:    	ldr	w27, [x19, #0x74]  // guest 0x18d0ca, sampled 0
6eaeb30108:    	strh	w27, [x19, #0x224]  // guest 0x18d0ca, sampled 0
6eaeb3010c:    	str	w26, [x19, #0x230]  // guest 0x18d0ca, sampled 0
6eaeb30110:    	ldr	w26, [x19, #0x54]  // guest 0x18d0ca, sampled 0
6eaeb30114:    	strh	w26, [x19, #0x222]  // guest 0x18d0ca, sampled 0
6eaeb30118:    	mov	w26, #0xd0ca            // =53450  // guest 0x18d0ca, sampled 0
6eaeb3011c:    	movk	w26, #0x18, lsl #16  // guest 0x18d0ca, sampled 0
6eaeb30120:    	str	w26, [x19, #0x228]  // guest 0x18d0ca, sampled 0
6eaeb30124:    	ldr	w26, [x19, #0x8]  // guest 0x18d0d1, sampled 0
6eaeb30128:    	lsl	w26, w26, #6  // guest 0x18d0d1, sampled 0
6eaeb3012c:    	ldr	w27, [x19]  // guest 0x18d0d4, sampled 0
6eaeb30130:    	add	w26, w26, w27  // guest 0x18d0d4, sampled 0
6eaeb30134:    	str	w26, [x19, #0x8]  // guest 0x18d0d4, sampled 0
6eaeb30138:    	str	w26, [x19, #0x28]  // guest 0x18d0d4, sampled 0
6eaeb3013c:    	str	w27, [x19, #0x2c]  // guest 0x18d0d4, sampled 0
6eaeb30140:    	lsl	w26, w26, #2  // guest 0x18d0d6, sampled 0
6eaeb30144:    	add	w26, w26, w24  // guest 0x18d0d6, sampled 0
6eaeb30148:    	mov	w28, #0x4914            // =18708  // guest 0x18d0d6, sampled 0
6eaeb3014c:    	movk	w28, #0x1, lsl #16  // guest 0x18d0d6, sampled 0
6eaeb30150:    	add	w26, w26, w28  // guest 0x18d0d6, sampled 0
6eaeb30154:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d0d6, sampled 0
6eaeb30158:    	and	x16, x16, x26, lsr #7  // guest 0x18d0d6, sampled 0
6eaeb3015c:    	add	x17, x17, x16  // guest 0x18d0d6, sampled 0
6eaeb30160:    	ldp	x16, x17, [x17]  // guest 0x18d0d6, sampled 0
6eaeb30164:    	and	w30, w26, #0xfffff003  // guest 0x18d0d6, sampled 0
6eaeb30168:    	cmp	w16, w30  // guest 0x18d0d6, sampled 0
6eaeb3016c:    	b.ne	0x6eaeb31078 <trace+0x1078>  // guest 0x18d0d6, sampled 0
6eaeb30170:    	add	x30, x17, w26, uxtw  // guest 0x18d0d6, sampled 0
6eaeb30174:    	ldapr	w26, [x30]  // guest 0x18d0d6, sampled 0
6eaeb30178:    	str	w26, [x19, #0x8]  // guest 0x18d0d6, sampled 0
6eaeb3017c:    	ldr	w8, [x19, #0xc]  // guest 0x18d0dd, sampled 0
6eaeb30180:    	add	w8, w8, w22  // guest 0x18d0dd, sampled 0
6eaeb30184:    	add	w8, w8, w23  // guest 0x18d0dd, sampled 0
6eaeb30188:    	str	w8, [x19, #0xc]  // guest 0x18d0dd, sampled 0
6eaeb3018c:    	lsl	w8, w8, #2  // guest 0x18d0e4, sampled 0
6eaeb30190:    	add	w8, w8, w24  // guest 0x18d0e4, sampled 0
6eaeb30194:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d0e4, sampled 0
6eaeb30198:    	and	x16, x16, x8, lsr #7  // guest 0x18d0e4, sampled 0
6eaeb3019c:    	add	x17, x17, x16  // guest 0x18d0e4, sampled 0
6eaeb301a0:    	ldp	x16, x17, [x17]  // guest 0x18d0e4, sampled 0
6eaeb301a4:    	and	w30, w8, #0xfffff003  // guest 0x18d0e4, sampled 0
6eaeb301a8:    	cmp	w16, w30  // guest 0x18d0e4, sampled 0
6eaeb301ac:    	b.ne	0x6eaeb310a4 <trace+0x10a4>  // guest 0x18d0e4, sampled 0
6eaeb301b0:    	add	x30, x17, w8, uxtw  // guest 0x18d0e4, sampled 0
6eaeb301b4:    	ldapr	w8, [x30]  // guest 0x18d0e4, sampled 0
6eaeb301b8:    	str	w8, [x19, #0xc]  // guest 0x18d0e4, sampled 0
6eaeb301bc:    	lsl	w8, w8, #2  // guest 0x18d0e7, sampled 0
6eaeb301c0:    	add	w8, w8, w24  // guest 0x18d0e7, sampled 0
6eaeb301c4:    	add	w8, w8, w25  // guest 0x18d0e7, sampled 0
6eaeb301c8:    	mov	w9, w8  // guest 0x18d0e7, sampled 0
6eaeb301cc:    	str	w9, [sp, #0x80]  // guest 0x18d0e7, sampled 0
6eaeb301d0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d0e7, sampled 0
6eaeb301d4:    	and	x16, x16, x8, lsr #7  // guest 0x18d0e7, sampled 0
6eaeb301d8:    	add	x17, x17, x16  // guest 0x18d0e7, sampled 0
6eaeb301dc:    	ldp	x16, x17, [x17]  // guest 0x18d0e7, sampled 0
6eaeb301e0:    	and	w30, w8, #0xfffff003  // guest 0x18d0e7, sampled 0
6eaeb301e4:    	cmp	w16, w30  // guest 0x18d0e7, sampled 0
6eaeb301e8:    	b.ne	0x6eaeb310d0 <trace+0x10d0>  // guest 0x18d0e7, sampled 0
6eaeb301ec:    	add	x30, x17, w8, uxtw  // guest 0x18d0e7, sampled 0
6eaeb301f0:    	ldapr	w2, [x30]  // guest 0x18d0e7, sampled 0
6eaeb301f4:    	add	x1, x19, #0x258  // guest 0x18d0e7, sampled 1
6eaeb301f8:    	mov	x0, x19  // guest 0x18d0e7, sampled 0
6eaeb301fc:    	adrp	x16, 0x6efc8aa000 <trace+0x4dd7a000>  // guest 0x18d0e7, sampled 0
6eaeb30200:    	add	x16, x16, #0x484  // guest 0x18d0e7, sampled 0
6eaeb30204:    	blr	x16  // guest 0x18d0e7, sampled 0
6eaeb30208:    	lsl	w8, w21, #4  // guest 0x18d0e7, sampled 0
6eaeb3020c:    	add	w8, w8, #0x1a0  // guest 0x18d0e7, sampled 0
6eaeb30210:    	sxtw	x8, w8  // guest 0x18d0e7, sampled 0
6eaeb30214:    	add	x1, x8, x19  // guest 0x18d0e7, sampled 0
6eaeb30218:    	add	x2, x19, #0x258  // guest 0x18d0e7, sampled 0
6eaeb3021c:    	mov	x0, x19  // guest 0x18d0e7, sampled 1
6eaeb30220:    	adrp	x16, 0x6efc8ab000 <trace+0x4dd7b000>  // guest 0x18d0e7, sampled 0
6eaeb30224:    	add	x16, x16, #0xc20  // guest 0x18d0e7, sampled 0
6eaeb30228:    	blr	x16  // guest 0x18d0e7, sampled 0
6eaeb3022c:    	ldr	w8, [x19, #0x74]  // guest 0x18d0e7, sampled 0
6eaeb30230:    	strh	w8, [x19, #0x224]  // guest 0x18d0e7, sampled 0
6eaeb30234:    	ldr	w8, [sp, #0x80]  // guest 0x18d0e7, sampled 0
6eaeb30238:    	str	w8, [x19, #0x230]  // guest 0x18d0e7, sampled 0
6eaeb3023c:    	ldr	w8, [x19, #0x54]  // guest 0x18d0e7, sampled 0
6eaeb30240:    	strh	w8, [x19, #0x222]  // guest 0x18d0e7, sampled 0
6eaeb30244:    	mov	w8, #0xd0e7             // =53479  // guest 0x18d0e7, sampled 0
6eaeb30248:    	movk	w8, #0x18, lsl #16  // guest 0x18d0e7, sampled 0
6eaeb3024c:    	str	w8, [x19, #0x228]  // guest 0x18d0e7, sampled 0
6eaeb30250:    	lsl	w20, w20, #6  // guest 0x18d0ee, sampled 0
6eaeb30254:    	add	w20, w20, w27  // guest 0x18d0f1, sampled 0
6eaeb30258:    	str	w20, [x19, #0x4]  // guest 0x18d0f1, sampled 0
6eaeb3025c:    	str	w20, [x19, #0x28]  // guest 0x18d0f1, sampled 0
6eaeb30260:    	str	w27, [x19, #0x2c]  // guest 0x18d0f1, sampled 0
6eaeb30264:    	lsl	w20, w20, #2  // guest 0x18d0f3, sampled 0
6eaeb30268:    	add	w20, w20, w24  // guest 0x18d0f3, sampled 0
6eaeb3026c:    	add	w20, w20, w28  // guest 0x18d0f3, sampled 0
6eaeb30270:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d0f3, sampled 0
6eaeb30274:    	and	x16, x16, x20, lsr #7  // guest 0x18d0f3, sampled 0
6eaeb30278:    	add	x17, x17, x16  // guest 0x18d0f3, sampled 0
6eaeb3027c:    	ldp	x16, x17, [x17]  // guest 0x18d0f3, sampled 0
6eaeb30280:    	and	w30, w20, #0xfffff003  // guest 0x18d0f3, sampled 1
6eaeb30284:    	cmp	w16, w30  // guest 0x18d0f3, sampled 0
6eaeb30288:    	b.ne	0x6eaeb310fc <trace+0x10fc>  // guest 0x18d0f3, sampled 0
6eaeb3028c:    	add	x30, x17, w20, uxtw  // guest 0x18d0f3, sampled 1
6eaeb30290:    	ldapr	w20, [x30]  // guest 0x18d0f3, sampled 0
6eaeb30294:    	str	w20, [x19, #0x4]  // guest 0x18d0f3, sampled 0
6eaeb30298:    	add	x28, x19, #0x258  // guest 0x18d0fa, sampled 0
6eaeb3029c:    	add	w8, w21, #0x3  // guest 0x18d0fa, sampled 0
6eaeb302a0:    	and	w8, w8, #0x7  // guest 0x18d0fa, sampled 0
6eaeb302a4:    	lsl	w8, w8, #4  // guest 0x18d0fa, sampled 0
6eaeb302a8:    	add	w8, w8, #0x1a0  // guest 0x18d0fa, sampled 0
6eaeb302ac:    	sxtw	x8, w8  // guest 0x18d0fa, sampled 0
6eaeb302b0:    	add	x8, x8, x19  // guest 0x18d0fa, sampled 0
6eaeb302b4:    	ldr	x9, [x8]  // guest 0x18d0fa, sampled 0
6eaeb302b8:    	ldrh	w8, [x8, #0x8]  // guest 0x18d0fa, sampled 0
6eaeb302bc:    	str	x9, [x28]  // guest 0x18d0fa, sampled 0
6eaeb302c0:    	strh	w8, [x28, #0x8]  // guest 0x18d0fa, sampled 0
6eaeb302c4:    	lsl	w28, w21, #4  // guest 0x18d0fa, sampled 0
6eaeb302c8:    	add	w28, w28, #0x1a0  // guest 0x18d0fa, sampled 0
6eaeb302cc:    	sxtw	x28, w28  // guest 0x18d0fa, sampled 0
6eaeb302d0:    	add	x1, x28, x19  // guest 0x18d0fa, sampled 0
6eaeb302d4:    	add	x2, x19, #0x258  // guest 0x18d0fa, sampled 0
6eaeb302d8:    	mov	x0, x19  // guest 0x18d0fa, sampled 0
6eaeb302dc:    	adrp	x16, 0x6efc8ab000 <trace+0x4dd7b000>  // guest 0x18d0fa, sampled 0
6eaeb302e0:    	add	x16, x16, #0xb4c  // guest 0x18d0fa, sampled 0
6eaeb302e4:    	blr	x16  // guest 0x18d0fa, sampled 0
6eaeb302e8:    	ldr	w28, [x19, #0x54]  // guest 0x18d0fa, sampled 0
6eaeb302ec:    	strh	w28, [x19, #0x222]  // guest 0x18d0fa, sampled 0
6eaeb302f0:    	mov	w28, #0xd0fa            // =53498  // guest 0x18d0fa, sampled 0
6eaeb302f4:    	movk	w28, #0x18, lsl #16  // guest 0x18d0fa, sampled 0
6eaeb302f8:    	str	w28, [x19, #0x228]  // guest 0x18d0fa, sampled 0
6eaeb302fc:    	lsl	w26, w26, #2  // guest 0x18d0fc, sampled 0
6eaeb30300:    	add	w26, w26, w24  // guest 0x18d0fc, sampled 0
6eaeb30304:    	add	w26, w26, w25  // guest 0x18d0fc, sampled 0
6eaeb30308:    	mov	w28, w26  // guest 0x18d0fc, sampled 0
6eaeb3030c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d0fc, sampled 0
6eaeb30310:    	and	x16, x16, x26, lsr #7  // guest 0x18d0fc, sampled 0
6eaeb30314:    	add	x17, x17, x16  // guest 0x18d0fc, sampled 0
6eaeb30318:    	ldp	x16, x17, [x17]  // guest 0x18d0fc, sampled 0
6eaeb3031c:    	and	w30, w26, #0xfffff003  // guest 0x18d0fc, sampled 1
6eaeb30320:    	cmp	w16, w30  // guest 0x18d0fc, sampled 0
6eaeb30324:    	b.ne	0x6eaeb31128 <trace+0x1128>  // guest 0x18d0fc, sampled 0
6eaeb30328:    	add	x30, x17, w26, uxtw  // guest 0x18d0fc, sampled 0
6eaeb3032c:    	ldapr	w2, [x30]  // guest 0x18d0fc, sampled 0
6eaeb30330:    	add	w26, w21, #0x7  // guest 0x18d0fc, sampled 0
6eaeb30334:    	and	w26, w26, #0x7  // guest 0x18d0fc, sampled 0
6eaeb30338:    	lsl	w26, w26, #4  // guest 0x18d0fc, sampled 0
6eaeb3033c:    	add	w26, w26, #0x1a0  // guest 0x18d0fc, sampled 0
6eaeb30340:    	sxtw	x26, w26  // guest 0x18d0fc, sampled 0
6eaeb30344:    	add	x1, x26, x19  // guest 0x18d0fc, sampled 0
6eaeb30348:    	mov	x0, x19  // guest 0x18d0fc, sampled 0
6eaeb3034c:    	adrp	x16, 0x6efc8aa000 <trace+0x4dd7a000>  // guest 0x18d0fc, sampled 0
6eaeb30350:    	add	x16, x16, #0x484  // guest 0x18d0fc, sampled 0
6eaeb30354:    	blr	x16  // guest 0x18d0fc, sampled 0
6eaeb30358:    	sub	w21, w21, #0x1  // guest 0x18d0fc, sampled 0
6eaeb3035c:    	and	w21, w21, #0x7  // guest 0x18d0fc, sampled 0
6eaeb30360:    	str	w21, [x19, #0x188]  // guest 0x18d0fc, sampled 0
6eaeb30364:    	sxtw	x26, w21  // guest 0x18d0fc, sampled 0
6eaeb30368:    	add	x26, x26, x19  // guest 0x18d0fc, sampled 0
6eaeb3036c:    	strb	wzr, [x26, #0x190]  // guest 0x18d0fc, sampled 0
6eaeb30370:    	ldr	w26, [x19, #0x74]  // guest 0x18d0fc, sampled 0
6eaeb30374:    	strh	w26, [x19, #0x224]  // guest 0x18d0fc, sampled 0
6eaeb30378:    	str	w28, [x19, #0x230]  // guest 0x18d0fc, sampled 0
6eaeb3037c:    	ldr	w26, [x19, #0x54]  // guest 0x18d0fc, sampled 0
6eaeb30380:    	strh	w26, [x19, #0x222]  // guest 0x18d0fc, sampled 0
6eaeb30384:    	mov	w26, #0xd0fc            // =53500  // guest 0x18d0fc, sampled 0
6eaeb30388:    	movk	w26, #0x18, lsl #16  // guest 0x18d0fc, sampled 0
6eaeb3038c:    	str	w26, [x19, #0x228]  // guest 0x18d0fc, sampled 0
6eaeb30390:    	ldr	w26, [x19, #0x10]  // guest 0x18d103, sampled 0
6eaeb30394:    	add	w26, w26, #0x20  // guest 0x18d103, sampled 0
6eaeb30398:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d103, sampled 0
6eaeb3039c:    	and	x16, x16, x26, lsr #7  // guest 0x18d103, sampled 0
6eaeb303a0:    	add	x17, x17, x16  // guest 0x18d103, sampled 0
6eaeb303a4:    	ldp	x16, x17, [x17]  // guest 0x18d103, sampled 0
6eaeb303a8:    	and	w30, w26, #0xfffff003  // guest 0x18d103, sampled 0
6eaeb303ac:    	cmp	w16, w30  // guest 0x18d103, sampled 0
6eaeb303b0:    	b.ne	0x6eaeb31154 <trace+0x1154>  // guest 0x18d103, sampled 0
6eaeb303b4:    	add	x30, x17, w26, uxtw  // guest 0x18d103, sampled 0
6eaeb303b8:    	ldapr	w26, [x30]  // guest 0x18d103, sampled 0
6eaeb303bc:    	str	w26, [x19, #0xc]  // guest 0x18d103, sampled 0
6eaeb303c0:    	lsl	w20, w20, #2  // guest 0x18d107, sampled 0
6eaeb303c4:    	add	w20, w20, w24  // guest 0x18d107, sampled 0
6eaeb303c8:    	add	w20, w20, w25  // guest 0x18d107, sampled 0
6eaeb303cc:    	mov	w24, w20  // guest 0x18d107, sampled 0
6eaeb303d0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d107, sampled 0
6eaeb303d4:    	and	x16, x16, x20, lsr #7  // guest 0x18d107, sampled 0
6eaeb303d8:    	add	x17, x17, x16  // guest 0x18d107, sampled 0
6eaeb303dc:    	ldp	x16, x17, [x17]  // guest 0x18d107, sampled 0
6eaeb303e0:    	and	w30, w20, #0xfffff003  // guest 0x18d107, sampled 0
6eaeb303e4:    	cmp	w16, w30  // guest 0x18d107, sampled 0
6eaeb303e8:    	b.ne	0x6eaeb31180 <trace+0x1180>  // guest 0x18d107, sampled 0
6eaeb303ec:    	add	x30, x17, w20, uxtw  // guest 0x18d107, sampled 1
6eaeb303f0:    	ldapr	w2, [x30]  // guest 0x18d107, sampled 0
6eaeb303f4:    	add	x1, x19, #0x258  // guest 0x18d107, sampled 0
6eaeb303f8:    	mov	x0, x19  // guest 0x18d107, sampled 0
6eaeb303fc:    	adrp	x16, 0x6efc8aa000 <trace+0x4dd7a000>  // guest 0x18d107, sampled 0
6eaeb30400:    	add	x16, x16, #0x484  // guest 0x18d107, sampled 0
6eaeb30404:    	blr	x16  // guest 0x18d107, sampled 0
6eaeb30408:    	lsl	w20, w21, #4  // guest 0x18d107, sampled 0
6eaeb3040c:    	add	w20, w20, #0x1a0  // guest 0x18d107, sampled 0
6eaeb30410:    	sxtw	x20, w20  // guest 0x18d107, sampled 0
6eaeb30414:    	add	x1, x20, x19  // guest 0x18d107, sampled 0
6eaeb30418:    	add	x2, x19, #0x258  // guest 0x18d107, sampled 0
6eaeb3041c:    	mov	x0, x19  // guest 0x18d107, sampled 0
6eaeb30420:    	adrp	x16, 0x6efc8ab000 <trace+0x4dd7b000>  // guest 0x18d107, sampled 0
6eaeb30424:    	add	x16, x16, #0xc20  // guest 0x18d107, sampled 0
6eaeb30428:    	blr	x16  // guest 0x18d107, sampled 0
6eaeb3042c:    	ldr	w20, [x19, #0x74]  // guest 0x18d107, sampled 0
6eaeb30430:    	strh	w20, [x19, #0x224]  // guest 0x18d107, sampled 0
6eaeb30434:    	str	w24, [x19, #0x230]  // guest 0x18d107, sampled 0
6eaeb30438:    	ldr	w20, [x19, #0x54]  // guest 0x18d107, sampled 0
6eaeb3043c:    	strh	w20, [x19, #0x222]  // guest 0x18d107, sampled 0
6eaeb30440:    	mov	w20, #0xd107            // =53511  // guest 0x18d107, sampled 0
6eaeb30444:    	movk	w20, #0x18, lsl #16  // guest 0x18d107, sampled 0
6eaeb30448:    	str	w20, [x19, #0x228]  // guest 0x18d107, sampled 0
6eaeb3044c:    	add	w20, w27, w22  // guest 0x18d10e, sampled 0
6eaeb30450:    	lsl	w22, w20, #3  // guest 0x18d111, sampled 0
6eaeb30454:    	add	w20, w22, w20  // guest 0x18d111, sampled 0
6eaeb30458:    	lsl	w20, w20, #2  // guest 0x18d114, sampled 0
6eaeb3045c:    	add	w20, w20, w26  // guest 0x18d114, sampled 0
6eaeb30460:    	str	w20, [x19, #0x4]  // guest 0x18d114, sampled 0
6eaeb30464:    	add	x22, x19, #0x258  // guest 0x18d117, sampled 0
6eaeb30468:    	add	w24, w21, #0x5  // guest 0x18d117, sampled 0
6eaeb3046c:    	and	w24, w24, #0x7  // guest 0x18d117, sampled 0
6eaeb30470:    	lsl	w24, w24, #4  // guest 0x18d117, sampled 0
6eaeb30474:    	add	w24, w24, #0x1a0  // guest 0x18d117, sampled 0
6eaeb30478:    	sxtw	x24, w24  // guest 0x18d117, sampled 0
6eaeb3047c:    	add	x24, x24, x19  // guest 0x18d117, sampled 0
6eaeb30480:    	ldr	x26, [x24]  // guest 0x18d117, sampled 0
6eaeb30484:    	ldrh	w24, [x24, #0x8]  // guest 0x18d117, sampled 2
6eaeb30488:    	str	x26, [x22]  // guest 0x18d117, sampled 0
6eaeb3048c:    	strh	w24, [x22, #0x8]  // guest 0x18d117, sampled 0
6eaeb30490:    	lsl	w22, w21, #4  // guest 0x18d117, sampled 0
6eaeb30494:    	add	w22, w22, #0x1a0  // guest 0x18d117, sampled 0
6eaeb30498:    	sxtw	x22, w22  // guest 0x18d117, sampled 0
6eaeb3049c:    	add	x1, x22, x19  // guest 0x18d117, sampled 0
6eaeb304a0:    	add	x2, x19, #0x258  // guest 0x18d117, sampled 0
6eaeb304a4:    	mov	x0, x19  // guest 0x18d117, sampled 0
6eaeb304a8:    	adrp	x16, 0x6efc8ab000 <trace+0x4dd7b000>  // guest 0x18d117, sampled 0
6eaeb304ac:    	add	x16, x16, #0xb4c  // guest 0x18d117, sampled 0
6eaeb304b0:    	blr	x16  // guest 0x18d117, sampled 0
6eaeb304b4:    	ldr	w22, [x19, #0x54]  // guest 0x18d117, sampled 0
6eaeb304b8:    	strh	w22, [x19, #0x222]  // guest 0x18d117, sampled 0
6eaeb304bc:    	mov	w22, #0xd117            // =53527  // guest 0x18d117, sampled 0
6eaeb304c0:    	movk	w22, #0x18, lsl #16  // guest 0x18d117, sampled 0
6eaeb304c4:    	str	w22, [x19, #0x228]  // guest 0x18d117, sampled 0
6eaeb304c8:    	add	w20, w20, #0x10  // guest 0x18d119, sampled 0
6eaeb304cc:    	str	w20, [x19, #0x8]  // guest 0x18d119, sampled 0
6eaeb304d0:    	sub	w20, w21, #0x1  // guest 0x18d11c, sampled 0
6eaeb304d4:    	and	w20, w20, #0x7  // guest 0x18d11c, sampled 0
6eaeb304d8:    	sxtw	x21, w20  // guest 0x18d11c, sampled 0
6eaeb304dc:    	add	x21, x21, x19  // guest 0x18d11c, sampled 0
6eaeb304e0:    	strb	wzr, [x21, #0x190]  // guest 0x18d11c, sampled 0
6eaeb304e4:    	lsl	w21, w20, #4  // guest 0x18d11c, sampled 0
6eaeb304e8:    	add	w21, w21, #0x1a0  // guest 0x18d11c, sampled 0
6eaeb304ec:    	sxtw	x21, w21  // guest 0x18d11c, sampled 0
6eaeb304f0:    	add	x21, x21, x19  // guest 0x18d11c, sampled 0
6eaeb304f4:    	add	w22, w20, #0x1  // guest 0x18d11c, sampled 0
6eaeb304f8:    	and	w22, w22, #0x7  // guest 0x18d11c, sampled 0
6eaeb304fc:    	lsl	w22, w22, #4  // guest 0x18d11c, sampled 0
6eaeb30500:    	add	w22, w22, #0x1a0  // guest 0x18d11c, sampled 0
6eaeb30504:    	sxtw	x22, w22  // guest 0x18d11c, sampled 0
6eaeb30508:    	add	x22, x22, x19  // guest 0x18d11c, sampled 0
6eaeb3050c:    	ldr	x24, [x22]  // guest 0x18d11c, sampled 0
6eaeb30510:    	ldrh	w22, [x22, #0x8]  // guest 0x18d11c, sampled 0
6eaeb30514:    	str	x24, [x21]  // guest 0x18d11c, sampled 0
6eaeb30518:    	strh	w22, [x21, #0x8]  // guest 0x18d11c, sampled 0
6eaeb3051c:    	ldr	w21, [x19, #0x54]  // guest 0x18d11c, sampled 0
6eaeb30520:    	strh	w21, [x19, #0x222]  // guest 0x18d11c, sampled 0
6eaeb30524:    	mov	w21, #0xd11c            // =53532  // guest 0x18d11c, sampled 0
6eaeb30528:    	movk	w21, #0x18, lsl #16  // guest 0x18d11c, sampled 0
6eaeb3052c:    	str	w21, [x19, #0x228]  // guest 0x18d11c, sampled 0
6eaeb30530:    	add	x21, x19, #0x258  // guest 0x18d11e, sampled 0
6eaeb30534:    	add	w22, w20, #0x1  // guest 0x18d11e, sampled 0
6eaeb30538:    	and	w22, w22, #0x7  // guest 0x18d11e, sampled 0
6eaeb3053c:    	lsl	w22, w22, #4  // guest 0x18d11e, sampled 0
6eaeb30540:    	add	w22, w22, #0x1a0  // guest 0x18d11e, sampled 0
6eaeb30544:    	sxtw	x22, w22  // guest 0x18d11e, sampled 0
6eaeb30548:    	add	x22, x22, x19  // guest 0x18d11e, sampled 0
6eaeb3054c:    	ldr	x24, [x22]  // guest 0x18d11e, sampled 0
6eaeb30550:    	ldrh	w22, [x22, #0x8]  // guest 0x18d11e, sampled 0
6eaeb30554:    	str	x24, [x21]  // guest 0x18d11e, sampled 0
6eaeb30558:    	strh	w22, [x21, #0x8]  // guest 0x18d11e, sampled 0
6eaeb3055c:    	lsl	w21, w20, #4  // guest 0x18d11e, sampled 0
6eaeb30560:    	add	w21, w21, #0x1a0  // guest 0x18d11e, sampled 0
6eaeb30564:    	sxtw	x21, w21  // guest 0x18d11e, sampled 0
6eaeb30568:    	add	x1, x21, x19  // guest 0x18d11e, sampled 0
6eaeb3056c:    	add	x2, x19, #0x258  // guest 0x18d11e, sampled 0
6eaeb30570:    	mov	x0, x19  // guest 0x18d11e, sampled 0
6eaeb30574:    	adrp	x16, 0x6efc8ab000 <trace+0x4dd7b000>  // guest 0x18d11e, sampled 0
6eaeb30578:    	add	x16, x16, #0xb4c  // guest 0x18d11e, sampled 0
6eaeb3057c:    	blr	x16  // guest 0x18d11e, sampled 0
6eaeb30580:    	ldr	w21, [x19, #0x54]  // guest 0x18d11e, sampled 0
6eaeb30584:    	strh	w21, [x19, #0x222]  // guest 0x18d11e, sampled 0
6eaeb30588:    	mov	w21, #0xd11e            // =53534  // guest 0x18d11e, sampled 0
6eaeb3058c:    	movk	w21, #0x18, lsl #16  // guest 0x18d11e, sampled 0
6eaeb30590:    	str	w21, [x19, #0x228]  // guest 0x18d11e, sampled 0
6eaeb30594:    	sub	w20, w20, #0x1  // guest 0x18d120, sampled 0
6eaeb30598:    	and	w20, w20, #0x7  // guest 0x18d120, sampled 0
6eaeb3059c:    	sxtw	x21, w20  // guest 0x18d120, sampled 0
6eaeb305a0:    	add	x21, x21, x19  // guest 0x18d120, sampled 0
6eaeb305a4:    	strb	wzr, [x21, #0x190]  // guest 0x18d120, sampled 0
6eaeb305a8:    	lsl	w21, w20, #4  // guest 0x18d120, sampled 0
6eaeb305ac:    	add	w21, w21, #0x1a0  // guest 0x18d120, sampled 0
6eaeb305b0:    	sxtw	x21, w21  // guest 0x18d120, sampled 0
6eaeb305b4:    	add	x21, x21, x19  // guest 0x18d120, sampled 0
6eaeb305b8:    	add	w22, w20, #0x3  // guest 0x18d120, sampled 0
6eaeb305bc:    	and	w22, w22, #0x7  // guest 0x18d120, sampled 0
6eaeb305c0:    	lsl	w22, w22, #4  // guest 0x18d120, sampled 0
6eaeb305c4:    	add	w22, w22, #0x1a0  // guest 0x18d120, sampled 0
6eaeb305c8:    	sxtw	x22, w22  // guest 0x18d120, sampled 0
6eaeb305cc:    	add	x22, x22, x19  // guest 0x18d120, sampled 0
6eaeb305d0:    	ldr	x24, [x22]  // guest 0x18d120, sampled 0
6eaeb305d4:    	ldrh	w22, [x22, #0x8]  // guest 0x18d120, sampled 0
6eaeb305d8:    	str	x24, [x21]  // guest 0x18d120, sampled 0
6eaeb305dc:    	strh	w22, [x21, #0x8]  // guest 0x18d120, sampled 0
6eaeb305e0:    	ldr	w21, [x19, #0x54]  // guest 0x18d120, sampled 0
6eaeb305e4:    	strh	w21, [x19, #0x222]  // guest 0x18d120, sampled 0
6eaeb305e8:    	mov	w21, #0xd120            // =53536  // guest 0x18d120, sampled 0
6eaeb305ec:    	movk	w21, #0x18, lsl #16  // guest 0x18d120, sampled 0
6eaeb305f0:    	str	w21, [x19, #0x228]  // guest 0x18d120, sampled 0
6eaeb305f4:    	add	x21, x19, #0x258  // guest 0x18d122, sampled 0
6eaeb305f8:    	add	w22, w20, #0x3  // guest 0x18d122, sampled 0
6eaeb305fc:    	and	w22, w22, #0x7  // guest 0x18d122, sampled 0
6eaeb30600:    	lsl	w22, w22, #4  // guest 0x18d122, sampled 0
6eaeb30604:    	add	w22, w22, #0x1a0  // guest 0x18d122, sampled 0
6eaeb30608:    	sxtw	x22, w22  // guest 0x18d122, sampled 0
6eaeb3060c:    	add	x22, x22, x19  // guest 0x18d122, sampled 0
6eaeb30610:    	ldr	x24, [x22]  // guest 0x18d122, sampled 0
6eaeb30614:    	ldrh	w22, [x22, #0x8]  // guest 0x18d122, sampled 1
6eaeb30618:    	str	x24, [x21]  // guest 0x18d122, sampled 0
6eaeb3061c:    	strh	w22, [x21, #0x8]  // guest 0x18d122, sampled 0
6eaeb30620:    	lsl	w21, w20, #4  // guest 0x18d122, sampled 0
6eaeb30624:    	add	w21, w21, #0x1a0  // guest 0x18d122, sampled 0
6eaeb30628:    	sxtw	x21, w21  // guest 0x18d122, sampled 0
6eaeb3062c:    	add	x1, x21, x19  // guest 0x18d122, sampled 0
6eaeb30630:    	add	x2, x19, #0x258  // guest 0x18d122, sampled 0
6eaeb30634:    	mov	x0, x19  // guest 0x18d122, sampled 0
6eaeb30638:    	adrp	x16, 0x6efc8ab000 <trace+0x4dd7b000>  // guest 0x18d122, sampled 1
6eaeb3063c:    	add	x16, x16, #0xb4c  // guest 0x18d122, sampled 0
6eaeb30640:    	blr	x16  // guest 0x18d122, sampled 0
6eaeb30644:    	ldr	w21, [x19, #0x54]  // guest 0x18d122, sampled 0
6eaeb30648:    	strh	w21, [x19, #0x222]  // guest 0x18d122, sampled 0
6eaeb3064c:    	mov	w21, #0xd122            // =53538  // guest 0x18d122, sampled 0
6eaeb30650:    	movk	w21, #0x18, lsl #16  // guest 0x18d122, sampled 0
6eaeb30654:    	str	w21, [x19, #0x228]  // guest 0x18d122, sampled 0
6eaeb30658:    	add	w21, w20, #0x1  // guest 0x18d124, sampled 0
6eaeb3065c:    	and	w21, w21, #0x7  // guest 0x18d124, sampled 0
6eaeb30660:    	lsl	w21, w21, #4  // guest 0x18d124, sampled 0
6eaeb30664:    	add	w21, w21, #0x1a0  // guest 0x18d124, sampled 0
6eaeb30668:    	sxtw	x21, w21  // guest 0x18d124, sampled 0
6eaeb3066c:    	add	x1, x21, x19  // guest 0x18d124, sampled 0
6eaeb30670:    	lsl	w21, w20, #4  // guest 0x18d124, sampled 0
6eaeb30674:    	add	w21, w21, #0x1a0  // guest 0x18d124, sampled 0
6eaeb30678:    	sxtw	x21, w21  // guest 0x18d124, sampled 0
6eaeb3067c:    	add	x2, x21, x19  // guest 0x18d124, sampled 0
6eaeb30680:    	mov	x0, x19  // guest 0x18d124, sampled 0
6eaeb30684:    	adrp	x16, 0x6efc8ab000 <trace+0x4dd7b000>  // guest 0x18d124, sampled 0
6eaeb30688:    	add	x16, x16, #0xa78  // guest 0x18d124, sampled 0
6eaeb3068c:    	blr	x16  // guest 0x18d124, sampled 0
6eaeb30690:    	sxtw	x21, w20  // guest 0x18d124, sampled 0
6eaeb30694:    	add	x21, x21, x19  // guest 0x18d124, sampled 0
6eaeb30698:    	mov	w22, #0x1               // =1  // guest 0x18d124, sampled 0
6eaeb3069c:    	strb	w22, [x21, #0x190]  // guest 0x18d124, sampled 0
6eaeb306a0:    	add	w20, w20, w22  // guest 0x18d124, sampled 0
6eaeb306a4:    	and	w20, w20, #0x7  // guest 0x18d124, sampled 0
6eaeb306a8:    	str	w20, [x19, #0x188]  // guest 0x18d124, sampled 0
6eaeb306ac:    	ldr	w21, [x19, #0x54]  // guest 0x18d124, sampled 0
6eaeb306b0:    	strh	w21, [x19, #0x222]  // guest 0x18d124, sampled 0
6eaeb306b4:    	mov	w21, #0xd124            // =53540  // guest 0x18d124, sampled 0
6eaeb306b8:    	movk	w21, #0x18, lsl #16  // guest 0x18d124, sampled 0
6eaeb306bc:    	str	w21, [x19, #0x228]  // guest 0x18d124, sampled 0
6eaeb306c0:    	add	x21, x19, #0x258  // guest 0x18d126, sampled 0
6eaeb306c4:    	add	w24, w20, #0x3  // guest 0x18d126, sampled 0
6eaeb306c8:    	and	w24, w24, #0x7  // guest 0x18d126, sampled 0
6eaeb306cc:    	lsl	w24, w24, #4  // guest 0x18d126, sampled 0
6eaeb306d0:    	add	w24, w24, #0x1a0  // guest 0x18d126, sampled 0
6eaeb306d4:    	sxtw	x24, w24  // guest 0x18d126, sampled 0
6eaeb306d8:    	add	x24, x24, x19  // guest 0x18d126, sampled 0
6eaeb306dc:    	ldr	x26, [x24]  // guest 0x18d126, sampled 0
6eaeb306e0:    	ldrh	w24, [x24, #0x8]  // guest 0x18d126, sampled 0
6eaeb306e4:    	str	x26, [x21]  // guest 0x18d126, sampled 0
6eaeb306e8:    	strh	w24, [x21, #0x8]  // guest 0x18d126, sampled 0
6eaeb306ec:    	lsl	w20, w20, #4  // guest 0x18d126, sampled 0
6eaeb306f0:    	add	w20, w20, #0x1a0  // guest 0x18d126, sampled 0
6eaeb306f4:    	sxtw	x20, w20  // guest 0x18d126, sampled 0
6eaeb306f8:    	add	x1, x20, x19  // guest 0x18d126, sampled 0
6eaeb306fc:    	add	x2, x19, #0x258  // guest 0x18d126, sampled 0
6eaeb30700:    	mov	x0, x19  // guest 0x18d126, sampled 0
6eaeb30704:    	adrp	x16, 0x6efc8ab000 <trace+0x4dd7b000>  // guest 0x18d126, sampled 0
6eaeb30708:    	add	x16, x16, #0xa78  // guest 0x18d126, sampled 0
6eaeb3070c:    	blr	x16  // guest 0x18d126, sampled 0
6eaeb30710:    	ldr	w20, [x19, #0x54]  // guest 0x18d126, sampled 0
6eaeb30714:    	strh	w20, [x19, #0x222]  // guest 0x18d126, sampled 0
6eaeb30718:    	mov	w20, #0xd126            // =53542  // guest 0x18d126, sampled 0
6eaeb3071c:    	movk	w20, #0x18, lsl #16  // guest 0x18d126, sampled 0
6eaeb30720:    	str	w20, [x19, #0x228]  // guest 0x18d126, sampled 0
6eaeb30724:    	mov	x0, x19  // guest 0x18d128, sampled 0
6eaeb30728:    	adrp	x16, 0x6efc8b0000 <trace+0x4dd80000>  // guest 0x18d128, sampled 0
6eaeb3072c:    	add	x16, x16, #0x4e8  // guest 0x18d128, sampled 0
6eaeb30730:    	blr	x16  // guest 0x18d128, sampled 0
6eaeb30734:    	ldr	w20, [x19, #0x54]  // guest 0x18d128, sampled 0
6eaeb30738:    	strh	w20, [x19, #0x222]  // guest 0x18d128, sampled 0
6eaeb3073c:    	mov	w20, #0xd128            // =53544  // guest 0x18d128, sampled 0
6eaeb30740:    	movk	w20, #0x18, lsl #16  // guest 0x18d128, sampled 0
6eaeb30744:    	str	w20, [x19, #0x228]  // guest 0x18d128, sampled 0
6eaeb30748:    	mov	w20, #0x17cc            // =6092  // guest 0x18d12a, sampled 0
6eaeb3074c:    	movk	w20, #0x3b, lsl #16  // guest 0x18d12a, sampled 0
6eaeb30750:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d12a, sampled 0
6eaeb30754:    	and	x16, x16, x20, lsr #7  // guest 0x18d12a, sampled 0
6eaeb30758:    	add	x17, x17, x16  // guest 0x18d12a, sampled 0
6eaeb3075c:    	ldp	x16, x17, [x17]  // guest 0x18d12a, sampled 0
6eaeb30760:    	and	w30, w20, #0xfffff003  // guest 0x18d12a, sampled 0
6eaeb30764:    	cmp	w16, w30  // guest 0x18d12a, sampled 0
6eaeb30768:    	b.ne	0x6eaeb311ac <trace+0x11ac>  // guest 0x18d12a, sampled 0
6eaeb3076c:    	add	x30, x17, w20, uxtw  // guest 0x18d12a, sampled 0
6eaeb30770:    	ldapr	w2, [x30]  // guest 0x18d12a, sampled 0
6eaeb30774:    	add	x1, x19, #0x258  // guest 0x18d12a, sampled 0
6eaeb30778:    	mov	x0, x19  // guest 0x18d12a, sampled 0
6eaeb3077c:    	adrp	x16, 0x6efc8aa000 <trace+0x4dd7a000>  // guest 0x18d12a, sampled 0
6eaeb30780:    	add	x16, x16, #0x484  // guest 0x18d12a, sampled 0
6eaeb30784:    	blr	x16  // guest 0x18d12a, sampled 0
6eaeb30788:    	ldr	w21, [x19, #0x188]  // guest 0x18d12a, sampled 0
6eaeb3078c:    	lsl	w24, w21, #4  // guest 0x18d12a, sampled 0
6eaeb30790:    	add	w24, w24, #0x1a0  // guest 0x18d12a, sampled 0
6eaeb30794:    	sxtw	x24, w24  // guest 0x18d12a, sampled 0
6eaeb30798:    	add	x1, x24, x19  // guest 0x18d12a, sampled 0
6eaeb3079c:    	add	x2, x19, #0x258  // guest 0x18d12a, sampled 0
6eaeb307a0:    	mov	x0, x19  // guest 0x18d12a, sampled 0
6eaeb307a4:    	adrp	x16, 0x6efc8ab000 <trace+0x4dd7b000>  // guest 0x18d12a, sampled 0
6eaeb307a8:    	add	x16, x16, #0xe98  // guest 0x18d12a, sampled 0
6eaeb307ac:    	blr	x16  // guest 0x18d12a, sampled 0
6eaeb307b0:    	ldr	w24, [x19, #0x74]  // guest 0x18d12a, sampled 0
6eaeb307b4:    	strh	w24, [x19, #0x224]  // guest 0x18d12a, sampled 0
6eaeb307b8:    	str	w20, [x19, #0x230]  // guest 0x18d12a, sampled 0
6eaeb307bc:    	ldr	w20, [x19, #0x54]  // guest 0x18d12a, sampled 0
6eaeb307c0:    	strh	w20, [x19, #0x222]  // guest 0x18d12a, sampled 0
6eaeb307c4:    	mov	w20, #0xd12a            // =53546  // guest 0x18d12a, sampled 0
6eaeb307c8:    	movk	w20, #0x18, lsl #16  // guest 0x18d12a, sampled 0
6eaeb307cc:    	str	w20, [x19, #0x228]  // guest 0x18d12a, sampled 0
6eaeb307d0:    	ldr	w20, [x19, #0x10]  // guest 0x18d130, sampled 0
6eaeb307d4:    	add	w24, w20, #0x18  // guest 0x18d130, sampled 1
6eaeb307d8:    	mov	w26, w24  // guest 0x18d130, sampled 0
6eaeb307dc:    	lsl	w27, w21, #4  // guest 0x18d130, sampled 0
6eaeb307e0:    	add	w27, w27, #0x1a0  // guest 0x18d130, sampled 0
6eaeb307e4:    	sxtw	x27, w27  // guest 0x18d130, sampled 0
6eaeb307e8:    	add	x1, x27, x19  // guest 0x18d130, sampled 0
6eaeb307ec:    	mov	x0, x19  // guest 0x18d130, sampled 0
6eaeb307f0:    	adrp	x16, 0x6efc8aa000 <trace+0x4dd7a000>  // guest 0x18d130, sampled 0
6eaeb307f4:    	add	x16, x16, #0x5c0  // guest 0x18d130, sampled 0
6eaeb307f8:    	blr	x16  // guest 0x18d130, sampled 0
6eaeb307fc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d130, sampled 0
6eaeb30800:    	and	x16, x16, x24, lsr #7  // guest 0x18d130, sampled 0
6eaeb30804:    	add	x17, x17, x16  // guest 0x18d130, sampled 0
6eaeb30808:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18d130, sampled 0
6eaeb3080c:    	and	w30, w24, #0xfffff003  // guest 0x18d130, sampled 0
6eaeb30810:    	cmp	w16, w30  // guest 0x18d130, sampled 0
6eaeb30814:    	b.ne	0x6eaeb311d8 <trace+0x11d8>  // guest 0x18d130, sampled 0
6eaeb30818:    	add	x30, x17, w24, uxtw  // guest 0x18d130, sampled 0
6eaeb3081c:    	stlr	w0, [x30]  // guest 0x18d130, sampled 0
6eaeb30820:    	ldr	w24, [x19, #0x64]  // guest 0x18d130, sampled 0
6eaeb30824:    	strh	w24, [x19, #0x224]  // guest 0x18d130, sampled 0
6eaeb30828:    	str	w26, [x19, #0x230]  // guest 0x18d130, sampled 0
6eaeb3082c:    	ldr	w24, [x19, #0x54]  // guest 0x18d130, sampled 0
6eaeb30830:    	strh	w24, [x19, #0x222]  // guest 0x18d130, sampled 0
6eaeb30834:    	mov	w24, #0xd130            // =53552  // guest 0x18d130, sampled 0
6eaeb30838:    	movk	w24, #0x18, lsl #16  // guest 0x18d130, sampled 0
6eaeb3083c:    	str	w24, [x19, #0x228]  // guest 0x18d130, sampled 0
6eaeb30840:    	add	x24, x19, #0x258  // guest 0x18d134, sampled 0
6eaeb30844:    	add	w26, w21, #0x2  // guest 0x18d134, sampled 0
6eaeb30848:    	and	w26, w26, #0x7  // guest 0x18d134, sampled 0
6eaeb3084c:    	lsl	w26, w26, #4  // guest 0x18d134, sampled 0
6eaeb30850:    	add	w26, w26, #0x1a0  // guest 0x18d134, sampled 0
6eaeb30854:    	sxtw	x26, w26  // guest 0x18d134, sampled 0
6eaeb30858:    	add	x26, x26, x19  // guest 0x18d134, sampled 0
6eaeb3085c:    	ldr	x27, [x26]  // guest 0x18d134, sampled 0
6eaeb30860:    	ldrh	w26, [x26, #0x8]  // guest 0x18d134, sampled 0
6eaeb30864:    	str	x27, [x24]  // guest 0x18d134, sampled 0
6eaeb30868:    	strh	w26, [x24, #0x8]  // guest 0x18d134, sampled 0
6eaeb3086c:    	lsl	w24, w21, #4  // guest 0x18d134, sampled 0
6eaeb30870:    	add	w24, w24, #0x1a0  // guest 0x18d134, sampled 0
6eaeb30874:    	sxtw	x24, w24  // guest 0x18d134, sampled 0
6eaeb30878:    	add	x1, x24, x19  // guest 0x18d134, sampled 0
6eaeb3087c:    	add	x2, x19, #0x258  // guest 0x18d134, sampled 0
6eaeb30880:    	mov	x0, x19  // guest 0x18d134, sampled 0
6eaeb30884:    	adrp	x16, 0x6efc8ab000 <trace+0x4dd7b000>  // guest 0x18d134, sampled 0
6eaeb30888:    	add	x16, x16, #0xb4c  // guest 0x18d134, sampled 0
6eaeb3088c:    	blr	x16  // guest 0x18d134, sampled 0
6eaeb30890:    	ldr	w24, [x19, #0x54]  // guest 0x18d134, sampled 0
6eaeb30894:    	strh	w24, [x19, #0x222]  // guest 0x18d134, sampled 0
6eaeb30898:    	mov	w24, #0xd134            // =53556  // guest 0x18d134, sampled 0
6eaeb3089c:    	movk	w24, #0x18, lsl #16  // guest 0x18d134, sampled 0
6eaeb308a0:    	str	w24, [x19, #0x228]  // guest 0x18d134, sampled 0
6eaeb308a4:    	add	w24, w20, #0x24  // guest 0x18d136, sampled 0
6eaeb308a8:    	mov	w26, w24  // guest 0x18d136, sampled 0
6eaeb308ac:    	lsl	w27, w21, #4  // guest 0x18d136, sampled 0
6eaeb308b0:    	add	w27, w27, #0x1a0  // guest 0x18d136, sampled 0
6eaeb308b4:    	sxtw	x27, w27  // guest 0x18d136, sampled 0
6eaeb308b8:    	add	x1, x27, x19  // guest 0x18d136, sampled 0
6eaeb308bc:    	mov	x0, x19  // guest 0x18d136, sampled 0
6eaeb308c0:    	adrp	x16, 0x6efc8aa000 <trace+0x4dd7a000>  // guest 0x18d136, sampled 0
6eaeb308c4:    	add	x16, x16, #0x5c0  // guest 0x18d136, sampled 0
6eaeb308c8:    	blr	x16  // guest 0x18d136, sampled 0
6eaeb308cc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d136, sampled 0
6eaeb308d0:    	and	x16, x16, x24, lsr #7  // guest 0x18d136, sampled 0
6eaeb308d4:    	add	x17, x17, x16  // guest 0x18d136, sampled 0
6eaeb308d8:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18d136, sampled 0
6eaeb308dc:    	and	w30, w24, #0xfffff003  // guest 0x18d136, sampled 0
6eaeb308e0:    	cmp	w16, w30  // guest 0x18d136, sampled 0
6eaeb308e4:    	b.ne	0x6eaeb31204 <trace+0x1204>  // guest 0x18d136, sampled 0
6eaeb308e8:    	add	x30, x17, w24, uxtw  // guest 0x18d136, sampled 0
6eaeb308ec:    	stlr	w0, [x30]  // guest 0x18d136, sampled 0
6eaeb308f0:    	sxtw	x24, w21  // guest 0x18d136, sampled 0
6eaeb308f4:    	add	x24, x24, x19  // guest 0x18d136, sampled 0
6eaeb308f8:    	strb	w22, [x24, #0x190]  // guest 0x18d136, sampled 0
6eaeb308fc:    	add	w21, w21, w22  // guest 0x18d136, sampled 0
6eaeb30900:    	and	w21, w21, #0x7  // guest 0x18d136, sampled 0
6eaeb30904:    	str	w21, [x19, #0x188]  // guest 0x18d136, sampled 0
6eaeb30908:    	ldr	w24, [x19, #0x64]  // guest 0x18d136, sampled 1
6eaeb3090c:    	strh	w24, [x19, #0x224]  // guest 0x18d136, sampled 0
6eaeb30910:    	str	w26, [x19, #0x230]  // guest 0x18d136, sampled 0
6eaeb30914:    	ldr	w24, [x19, #0x54]  // guest 0x18d136, sampled 0
6eaeb30918:    	strh	w24, [x19, #0x222]  // guest 0x18d136, sampled 0
6eaeb3091c:    	mov	w24, #0xd136            // =53558  // guest 0x18d136, sampled 0
6eaeb30920:    	movk	w24, #0x18, lsl #16  // guest 0x18d136, sampled 0
6eaeb30924:    	str	w24, [x19, #0x228]  // guest 0x18d136, sampled 0
6eaeb30928:    	add	w24, w20, #0x24  // guest 0x18d13a, sampled 0
6eaeb3092c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d13a, sampled 0
6eaeb30930:    	and	x16, x16, x24, lsr #7  // guest 0x18d13a, sampled 1
6eaeb30934:    	add	x17, x17, x16  // guest 0x18d13a, sampled 0
6eaeb30938:    	ldp	x16, x17, [x17]  // guest 0x18d13a, sampled 0
6eaeb3093c:    	and	w30, w24, #0xfffff003  // guest 0x18d13a, sampled 1
6eaeb30940:    	cmp	w16, w30  // guest 0x18d13a, sampled 0
6eaeb30944:    	b.ne	0x6eaeb31230 <trace+0x1230>  // guest 0x18d13a, sampled 0
6eaeb30948:    	add	x30, x17, w24, uxtw  // guest 0x18d13a, sampled 0
6eaeb3094c:    	ldapr	w24, [x30]  // guest 0x18d13a, sampled 0
6eaeb30950:    	str	w24, [x19, #0x14]  // guest 0x18d13a, sampled 1
6eaeb30954:    	add	w26, w20, #0x18  // guest 0x18d13e, sampled 0
6eaeb30958:    	mov	w27, w26  // guest 0x18d13e, sampled 0
6eaeb3095c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d13e, sampled 0
6eaeb30960:    	and	x16, x16, x26, lsr #7  // guest 0x18d13e, sampled 0
6eaeb30964:    	add	x17, x17, x16  // guest 0x18d13e, sampled 0
6eaeb30968:    	ldp	x16, x17, [x17]  // guest 0x18d13e, sampled 0
6eaeb3096c:    	and	w30, w26, #0xfffff003  // guest 0x18d13e, sampled 0
6eaeb30970:    	cmp	w16, w30  // guest 0x18d13e, sampled 0
6eaeb30974:    	b.ne	0x6eaeb3125c <trace+0x125c>  // guest 0x18d13e, sampled 0
6eaeb30978:    	add	x30, x17, w26, uxtw  // guest 0x18d13e, sampled 0
6eaeb3097c:    	ldapr	w2, [x30]  // guest 0x18d13e, sampled 0
6eaeb30980:    	add	w26, w21, #0x7  // guest 0x18d13e, sampled 0
6eaeb30984:    	and	w26, w26, #0x7  // guest 0x18d13e, sampled 0
6eaeb30988:    	lsl	w26, w26, #4  // guest 0x18d13e, sampled 0
6eaeb3098c:    	add	w26, w26, #0x1a0  // guest 0x18d13e, sampled 0
6eaeb30990:    	sxtw	x26, w26  // guest 0x18d13e, sampled 0
6eaeb30994:    	add	x1, x26, x19  // guest 0x18d13e, sampled 0
6eaeb30998:    	mov	x0, x19  // guest 0x18d13e, sampled 0
6eaeb3099c:    	adrp	x16, 0x6efc8aa000 <trace+0x4dd7a000>  // guest 0x18d13e, sampled 0
6eaeb309a0:    	add	x16, x16, #0x484  // guest 0x18d13e, sampled 0
6eaeb309a4:    	blr	x16  // guest 0x18d13e, sampled 0
6eaeb309a8:    	sub	w21, w21, #0x1  // guest 0x18d13e, sampled 0
6eaeb309ac:    	and	w21, w21, #0x7  // guest 0x18d13e, sampled 0
6eaeb309b0:    	str	w21, [x19, #0x188]  // guest 0x18d13e, sampled 0
6eaeb309b4:    	sxtw	x26, w21  // guest 0x18d13e, sampled 0
6eaeb309b8:    	add	x26, x26, x19  // guest 0x18d13e, sampled 0
6eaeb309bc:    	strb	wzr, [x26, #0x190]  // guest 0x18d13e, sampled 0
6eaeb309c0:    	ldr	w26, [x19, #0x64]  // guest 0x18d13e, sampled 0
6eaeb309c4:    	strh	w26, [x19, #0x224]  // guest 0x18d13e, sampled 0
6eaeb309c8:    	str	w27, [x19, #0x230]  // guest 0x18d13e, sampled 0
6eaeb309cc:    	ldr	w26, [x19, #0x54]  // guest 0x18d13e, sampled 0
6eaeb309d0:    	strh	w26, [x19, #0x222]  // guest 0x18d13e, sampled 0
6eaeb309d4:    	mov	w26, #0xd13e            // =53566  // guest 0x18d13e, sampled 0
6eaeb309d8:    	movk	w26, #0x18, lsl #16  // guest 0x18d13e, sampled 0
6eaeb309dc:    	str	w26, [x19, #0x228]  // guest 0x18d13e, sampled 0
6eaeb309e0:    	ldr	w26, [x19, #0x8]  // guest 0x18d142, sampled 0
6eaeb309e4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d142, sampled 0
6eaeb309e8:    	and	x16, x16, x26, lsr #7  // guest 0x18d142, sampled 0
6eaeb309ec:    	add	x17, x17, x16  // guest 0x18d142, sampled 0
6eaeb309f0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18d142, sampled 0
6eaeb309f4:    	and	w30, w26, #0xfffff003  // guest 0x18d142, sampled 1
6eaeb309f8:    	cmp	w16, w30  // guest 0x18d142, sampled 0
6eaeb309fc:    	b.ne	0x6eaeb31288 <trace+0x1288>  // guest 0x18d142, sampled 0
6eaeb30a00:    	add	x30, x17, w26, uxtw  // guest 0x18d142, sampled 0
6eaeb30a04:    	stlr	w24, [x30]  // guest 0x18d142, sampled 0
6eaeb30a08:    	add	x24, x19, #0x258  // guest 0x18d144, sampled 1
6eaeb30a0c:    	add	w27, w21, w22  // guest 0x18d144, sampled 0
6eaeb30a10:    	and	w27, w27, #0x7  // guest 0x18d144, sampled 0
6eaeb30a14:    	lsl	w27, w27, #4  // guest 0x18d144, sampled 0
6eaeb30a18:    	add	w27, w27, #0x1a0  // guest 0x18d144, sampled 0
6eaeb30a1c:    	sxtw	x27, w27  // guest 0x18d144, sampled 0
6eaeb30a20:    	add	x27, x27, x19  // guest 0x18d144, sampled 0
6eaeb30a24:    	ldr	x28, [x27]  // guest 0x18d144, sampled 0
6eaeb30a28:    	ldrh	w27, [x27, #0x8]  // guest 0x18d144, sampled 1
6eaeb30a2c:    	str	x28, [x24]  // guest 0x18d144, sampled 0
6eaeb30a30:    	strh	w27, [x24, #0x8]  // guest 0x18d144, sampled 0
6eaeb30a34:    	lsl	w24, w21, #4  // guest 0x18d144, sampled 0
6eaeb30a38:    	add	w24, w24, #0x1a0  // guest 0x18d144, sampled 0
6eaeb30a3c:    	sxtw	x24, w24  // guest 0x18d144, sampled 0
6eaeb30a40:    	add	x1, x24, x19  // guest 0x18d144, sampled 0
6eaeb30a44:    	add	x2, x19, #0x258  // guest 0x18d144, sampled 0
6eaeb30a48:    	mov	x0, x19  // guest 0x18d144, sampled 0
6eaeb30a4c:    	adrp	x16, 0x6efc8ab000 <trace+0x4dd7b000>  // guest 0x18d144, sampled 0
6eaeb30a50:    	add	x16, x16, #0xb4c  // guest 0x18d144, sampled 0
6eaeb30a54:    	blr	x16  // guest 0x18d144, sampled 0
6eaeb30a58:    	ldr	w24, [x19, #0x54]  // guest 0x18d144, sampled 0
6eaeb30a5c:    	strh	w24, [x19, #0x222]  // guest 0x18d144, sampled 0
6eaeb30a60:    	mov	w24, #0xd144            // =53572  // guest 0x18d144, sampled 0
6eaeb30a64:    	movk	w24, #0x18, lsl #16  // guest 0x18d144, sampled 0
6eaeb30a68:    	str	w24, [x19, #0x228]  // guest 0x18d144, sampled 0
6eaeb30a6c:    	add	w24, w20, #0x28  // guest 0x18d146, sampled 0
6eaeb30a70:    	mov	w27, w24  // guest 0x18d146, sampled 0
6eaeb30a74:    	lsl	w28, w21, #4  // guest 0x18d146, sampled 0
6eaeb30a78:    	add	w28, w28, #0x1a0  // guest 0x18d146, sampled 0
6eaeb30a7c:    	sxtw	x28, w28  // guest 0x18d146, sampled 0
6eaeb30a80:    	add	x1, x28, x19  // guest 0x18d146, sampled 0
6eaeb30a84:    	mov	x0, x19  // guest 0x18d146, sampled 0
6eaeb30a88:    	adrp	x16, 0x6efc8aa000 <trace+0x4dd7a000>  // guest 0x18d146, sampled 0
6eaeb30a8c:    	add	x16, x16, #0x5c0  // guest 0x18d146, sampled 0
6eaeb30a90:    	blr	x16  // guest 0x18d146, sampled 0
6eaeb30a94:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d146, sampled 0
6eaeb30a98:    	and	x16, x16, x24, lsr #7  // guest 0x18d146, sampled 0
6eaeb30a9c:    	add	x17, x17, x16  // guest 0x18d146, sampled 0
6eaeb30aa0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18d146, sampled 0
6eaeb30aa4:    	and	w30, w24, #0xfffff003  // guest 0x18d146, sampled 0
6eaeb30aa8:    	cmp	w16, w30  // guest 0x18d146, sampled 0
6eaeb30aac:    	b.ne	0x6eaeb312b4 <trace+0x12b4>  // guest 0x18d146, sampled 0
6eaeb30ab0:    	add	x30, x17, w24, uxtw  // guest 0x18d146, sampled 0
6eaeb30ab4:    	stlr	w0, [x30]  // guest 0x18d146, sampled 0
6eaeb30ab8:    	sxtw	x24, w21  // guest 0x18d146, sampled 0
6eaeb30abc:    	add	x24, x24, x19  // guest 0x18d146, sampled 0
6eaeb30ac0:    	strb	w22, [x24, #0x190]  // guest 0x18d146, sampled 0
6eaeb30ac4:    	add	w21, w21, w22  // guest 0x18d146, sampled 0
6eaeb30ac8:    	and	w21, w21, #0x7  // guest 0x18d146, sampled 0
6eaeb30acc:    	str	w21, [x19, #0x188]  // guest 0x18d146, sampled 0
6eaeb30ad0:    	ldr	w24, [x19, #0x64]  // guest 0x18d146, sampled 0
6eaeb30ad4:    	strh	w24, [x19, #0x224]  // guest 0x18d146, sampled 0
6eaeb30ad8:    	str	w27, [x19, #0x230]  // guest 0x18d146, sampled 0
6eaeb30adc:    	ldr	w24, [x19, #0x54]  // guest 0x18d146, sampled 0
6eaeb30ae0:    	strh	w24, [x19, #0x222]  // guest 0x18d146, sampled 0
6eaeb30ae4:    	mov	w24, #0xd146            // =53574  // guest 0x18d146, sampled 0
6eaeb30ae8:    	movk	w24, #0x18, lsl #16  // guest 0x18d146, sampled 0
6eaeb30aec:    	str	w24, [x19, #0x228]  // guest 0x18d146, sampled 0
6eaeb30af0:    	add	w24, w20, #0x28  // guest 0x18d14a, sampled 0
6eaeb30af4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d14a, sampled 0
6eaeb30af8:    	and	x16, x16, x24, lsr #7  // guest 0x18d14a, sampled 0
6eaeb30afc:    	add	x17, x17, x16  // guest 0x18d14a, sampled 0
6eaeb30b00:    	ldp	x16, x17, [x17]  // guest 0x18d14a, sampled 0
6eaeb30b04:    	and	w30, w24, #0xfffff003  // guest 0x18d14a, sampled 0
6eaeb30b08:    	cmp	w16, w30  // guest 0x18d14a, sampled 0
6eaeb30b0c:    	b.ne	0x6eaeb312e0 <trace+0x12e0>  // guest 0x18d14a, sampled 0
6eaeb30b10:    	add	x30, x17, w24, uxtw  // guest 0x18d14a, sampled 0
6eaeb30b14:    	ldapr	w24, [x30]  // guest 0x18d14a, sampled 0
6eaeb30b18:    	str	w24, [x19, #0x14]  // guest 0x18d14a, sampled 2
6eaeb30b1c:    	add	w27, w26, #0x4  // guest 0x18d14e, sampled 0
6eaeb30b20:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d14e, sampled 0
6eaeb30b24:    	and	x16, x16, x27, lsr #7  // guest 0x18d14e, sampled 0
6eaeb30b28:    	add	x17, x17, x16  // guest 0x18d14e, sampled 0
6eaeb30b2c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18d14e, sampled 0
6eaeb30b30:    	and	w30, w27, #0xfffff003  // guest 0x18d14e, sampled 1
6eaeb30b34:    	cmp	w16, w30  // guest 0x18d14e, sampled 0
6eaeb30b38:    	b.ne	0x6eaeb3130c <trace+0x130c>  // guest 0x18d14e, sampled 0
6eaeb30b3c:    	add	x30, x17, w27, uxtw  // guest 0x18d14e, sampled 0
6eaeb30b40:    	stlr	w24, [x30]  // guest 0x18d14e, sampled 0
6eaeb30b44:    	lsl	w24, w21, #4  // guest 0x18d151, sampled 0
6eaeb30b48:    	add	w24, w24, #0x1a0  // guest 0x18d151, sampled 0
6eaeb30b4c:    	sxtw	x24, w24  // guest 0x18d151, sampled 0
6eaeb30b50:    	add	x24, x24, x19  // guest 0x18d151, sampled 0
6eaeb30b54:    	lsl	w27, w21, #4  // guest 0x18d151, sampled 0
6eaeb30b58:    	add	w27, w27, #0x1a0  // guest 0x18d151, sampled 0
6eaeb30b5c:    	sxtw	x27, w27  // guest 0x18d151, sampled 0
6eaeb30b60:    	add	x27, x27, x19  // guest 0x18d151, sampled 0
6eaeb30b64:    	ldr	x28, [x27]  // guest 0x18d151, sampled 0
6eaeb30b68:    	ldrh	w27, [x27, #0x8]  // guest 0x18d151, sampled 0
6eaeb30b6c:    	str	x28, [x24]  // guest 0x18d151, sampled 0
6eaeb30b70:    	strh	w27, [x24, #0x8]  // guest 0x18d151, sampled 0
6eaeb30b74:    	sxtw	x24, w21  // guest 0x18d151, sampled 0
6eaeb30b78:    	add	x24, x24, x19  // guest 0x18d151, sampled 0
6eaeb30b7c:    	strb	w22, [x24, #0x190]  // guest 0x18d151, sampled 0
6eaeb30b80:    	add	w21, w21, w22  // guest 0x18d151, sampled 0
6eaeb30b84:    	and	w21, w21, #0x7  // guest 0x18d151, sampled 0
6eaeb30b88:    	ldr	w24, [x19, #0x54]  // guest 0x18d151, sampled 0
6eaeb30b8c:    	strh	w24, [x19, #0x222]  // guest 0x18d151, sampled 0
6eaeb30b90:    	mov	w24, #0xd151            // =53585  // guest 0x18d151, sampled 0
6eaeb30b94:    	movk	w24, #0x18, lsl #16  // guest 0x18d151, sampled 0
6eaeb30b98:    	str	w24, [x19, #0x228]  // guest 0x18d151, sampled 0
6eaeb30b9c:    	lsl	w24, w21, #4  // guest 0x18d153, sampled 0
6eaeb30ba0:    	add	w24, w24, #0x1a0  // guest 0x18d153, sampled 0
6eaeb30ba4:    	sxtw	x24, w24  // guest 0x18d153, sampled 0
6eaeb30ba8:    	add	x24, x24, x19  // guest 0x18d153, sampled 0
6eaeb30bac:    	lsl	w27, w21, #4  // guest 0x18d153, sampled 0
6eaeb30bb0:    	add	w27, w27, #0x1a0  // guest 0x18d153, sampled 0
6eaeb30bb4:    	sxtw	x27, w27  // guest 0x18d153, sampled 0
6eaeb30bb8:    	add	x27, x27, x19  // guest 0x18d153, sampled 0
6eaeb30bbc:    	ldr	x28, [x27]  // guest 0x18d153, sampled 0
6eaeb30bc0:    	ldrh	w27, [x27, #0x8]  // guest 0x18d153, sampled 0
6eaeb30bc4:    	str	x28, [x24]  // guest 0x18d153, sampled 0
6eaeb30bc8:    	strh	w27, [x24, #0x8]  // guest 0x18d153, sampled 0
6eaeb30bcc:    	sxtw	x24, w21  // guest 0x18d153, sampled 0
6eaeb30bd0:    	add	x24, x24, x19  // guest 0x18d153, sampled 0
6eaeb30bd4:    	strb	w22, [x24, #0x190]  // guest 0x18d153, sampled 0
6eaeb30bd8:    	add	w21, w21, w22  // guest 0x18d153, sampled 1
6eaeb30bdc:    	and	w21, w21, #0x7  // guest 0x18d153, sampled 0
6eaeb30be0:    	str	w21, [x19, #0x188]  // guest 0x18d153, sampled 0
6eaeb30be4:    	ldr	w24, [x19, #0x54]  // guest 0x18d153, sampled 0
6eaeb30be8:    	strh	w24, [x19, #0x222]  // guest 0x18d153, sampled 0
6eaeb30bec:    	mov	w24, #0xd153            // =53587  // guest 0x18d153, sampled 0
6eaeb30bf0:    	movk	w24, #0x18, lsl #16  // guest 0x18d153, sampled 0
6eaeb30bf4:    	str	w24, [x19, #0x228]  // guest 0x18d153, sampled 0
6eaeb30bf8:    	add	w24, w20, #0x18  // guest 0x18d155, sampled 0
6eaeb30bfc:    	mov	w27, w24  // guest 0x18d155, sampled 0
6eaeb30c00:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d155, sampled 0
6eaeb30c04:    	and	x16, x16, x24, lsr #7  // guest 0x18d155, sampled 0
6eaeb30c08:    	add	x17, x17, x16  // guest 0x18d155, sampled 0
6eaeb30c0c:    	ldp	x16, x17, [x17]  // guest 0x18d155, sampled 0
6eaeb30c10:    	and	w30, w24, #0xfffff003  // guest 0x18d155, sampled 0
6eaeb30c14:    	cmp	w16, w30  // guest 0x18d155, sampled 0
6eaeb30c18:    	b.ne	0x6eaeb31338 <trace+0x1338>  // guest 0x18d155, sampled 0
6eaeb30c1c:    	add	x30, x17, w24, uxtw  // guest 0x18d155, sampled 0
6eaeb30c20:    	ldapr	w2, [x30]  // guest 0x18d155, sampled 0
6eaeb30c24:    	add	w24, w21, #0x7  // guest 0x18d155, sampled 1
6eaeb30c28:    	and	w24, w24, #0x7  // guest 0x18d155, sampled 0
6eaeb30c2c:    	lsl	w24, w24, #4  // guest 0x18d155, sampled 0
6eaeb30c30:    	add	w24, w24, #0x1a0  // guest 0x18d155, sampled 0
6eaeb30c34:    	sxtw	x24, w24  // guest 0x18d155, sampled 0
6eaeb30c38:    	add	x1, x24, x19  // guest 0x18d155, sampled 0
6eaeb30c3c:    	mov	x0, x19  // guest 0x18d155, sampled 0
6eaeb30c40:    	adrp	x16, 0x6efc8aa000 <trace+0x4dd7a000>  // guest 0x18d155, sampled 0
6eaeb30c44:    	add	x16, x16, #0x484  // guest 0x18d155, sampled 0
6eaeb30c48:    	blr	x16  // guest 0x18d155, sampled 0
6eaeb30c4c:    	sub	w21, w21, #0x1  // guest 0x18d155, sampled 0
6eaeb30c50:    	and	w21, w21, #0x7  // guest 0x18d155, sampled 0
6eaeb30c54:    	str	w21, [x19, #0x188]  // guest 0x18d155, sampled 0
6eaeb30c58:    	sxtw	x24, w21  // guest 0x18d155, sampled 0
6eaeb30c5c:    	add	x24, x24, x19  // guest 0x18d155, sampled 0
6eaeb30c60:    	strb	wzr, [x24, #0x190]  // guest 0x18d155, sampled 0
6eaeb30c64:    	ldr	w24, [x19, #0x64]  // guest 0x18d155, sampled 0
6eaeb30c68:    	strh	w24, [x19, #0x224]  // guest 0x18d155, sampled 0
6eaeb30c6c:    	str	w27, [x19, #0x230]  // guest 0x18d155, sampled 0
6eaeb30c70:    	ldr	w24, [x19, #0x54]  // guest 0x18d155, sampled 0
6eaeb30c74:    	strh	w24, [x19, #0x222]  // guest 0x18d155, sampled 0
6eaeb30c78:    	mov	w24, #0xd155            // =53589  // guest 0x18d155, sampled 0
6eaeb30c7c:    	movk	w24, #0x18, lsl #16  // guest 0x18d155, sampled 0
6eaeb30c80:    	str	w24, [x19, #0x228]  // guest 0x18d155, sampled 0
6eaeb30c84:    	add	x24, x19, #0x258  // guest 0x18d159, sampled 0
6eaeb30c88:    	add	w27, w21, #0x2  // guest 0x18d159, sampled 0
6eaeb30c8c:    	and	w27, w27, #0x7  // guest 0x18d159, sampled 0
6eaeb30c90:    	lsl	w27, w27, #4  // guest 0x18d159, sampled 0
6eaeb30c94:    	add	w27, w27, #0x1a0  // guest 0x18d159, sampled 0
6eaeb30c98:    	sxtw	x27, w27  // guest 0x18d159, sampled 0
6eaeb30c9c:    	add	x27, x27, x19  // guest 0x18d159, sampled 0
6eaeb30ca0:    	ldr	x28, [x27]  // guest 0x18d159, sampled 0
6eaeb30ca4:    	ldrh	w27, [x27, #0x8]  // guest 0x18d159, sampled 0
6eaeb30ca8:    	str	x28, [x24]  // guest 0x18d159, sampled 0
6eaeb30cac:    	strh	w27, [x24, #0x8]  // guest 0x18d159, sampled 0
6eaeb30cb0:    	lsl	w24, w21, #4  // guest 0x18d159, sampled 0
6eaeb30cb4:    	add	w24, w24, #0x1a0  // guest 0x18d159, sampled 0
6eaeb30cb8:    	sxtw	x24, w24  // guest 0x18d159, sampled 0
6eaeb30cbc:    	add	x1, x24, x19  // guest 0x18d159, sampled 0
6eaeb30cc0:    	add	x2, x19, #0x258  // guest 0x18d159, sampled 1
6eaeb30cc4:    	mov	x0, x19  // guest 0x18d159, sampled 0
6eaeb30cc8:    	adrp	x16, 0x6efc8ab000 <trace+0x4dd7b000>  // guest 0x18d159, sampled 0
6eaeb30ccc:    	add	x16, x16, #0xb4c  // guest 0x18d159, sampled 0
6eaeb30cd0:    	blr	x16  // guest 0x18d159, sampled 0
6eaeb30cd4:    	ldr	w24, [x19, #0x54]  // guest 0x18d159, sampled 0
6eaeb30cd8:    	strh	w24, [x19, #0x222]  // guest 0x18d159, sampled 0
6eaeb30cdc:    	mov	w24, #0xd159            // =53593  // guest 0x18d159, sampled 0
6eaeb30ce0:    	movk	w24, #0x18, lsl #16  // guest 0x18d159, sampled 0
6eaeb30ce4:    	str	w24, [x19, #0x228]  // guest 0x18d159, sampled 0
6eaeb30ce8:    	add	w24, w20, #0x2c  // guest 0x18d15b, sampled 0
6eaeb30cec:    	mov	w27, w24  // guest 0x18d15b, sampled 0
6eaeb30cf0:    	lsl	w28, w21, #4  // guest 0x18d15b, sampled 0
6eaeb30cf4:    	add	w28, w28, #0x1a0  // guest 0x18d15b, sampled 0
6eaeb30cf8:    	sxtw	x28, w28  // guest 0x18d15b, sampled 0
6eaeb30cfc:    	add	x1, x28, x19  // guest 0x18d15b, sampled 0
6eaeb30d00:    	mov	x0, x19  // guest 0x18d15b, sampled 0
6eaeb30d04:    	adrp	x16, 0x6efc8aa000 <trace+0x4dd7a000>  // guest 0x18d15b, sampled 0
6eaeb30d08:    	add	x16, x16, #0x5c0  // guest 0x18d15b, sampled 0
6eaeb30d0c:    	blr	x16  // guest 0x18d15b, sampled 0
6eaeb30d10:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d15b, sampled 0
6eaeb30d14:    	and	x16, x16, x24, lsr #7  // guest 0x18d15b, sampled 0
6eaeb30d18:    	add	x17, x17, x16  // guest 0x18d15b, sampled 0
6eaeb30d1c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18d15b, sampled 0
6eaeb30d20:    	and	w30, w24, #0xfffff003  // guest 0x18d15b, sampled 0
6eaeb30d24:    	cmp	w16, w30  // guest 0x18d15b, sampled 0
6eaeb30d28:    	b.ne	0x6eaeb31364 <trace+0x1364>  // guest 0x18d15b, sampled 0
6eaeb30d2c:    	add	x30, x17, w24, uxtw  // guest 0x18d15b, sampled 0
6eaeb30d30:    	stlr	w0, [x30]  // guest 0x18d15b, sampled 0
6eaeb30d34:    	sxtw	x24, w21  // guest 0x18d15b, sampled 1
6eaeb30d38:    	add	x24, x24, x19  // guest 0x18d15b, sampled 0
6eaeb30d3c:    	strb	w22, [x24, #0x190]  // guest 0x18d15b, sampled 0
6eaeb30d40:    	add	w21, w21, w22  // guest 0x18d15b, sampled 0
6eaeb30d44:    	and	w21, w21, #0x7  // guest 0x18d15b, sampled 0
6eaeb30d48:    	str	w21, [x19, #0x188]  // guest 0x18d15b, sampled 0
6eaeb30d4c:    	ldr	w21, [x19, #0x64]  // guest 0x18d15b, sampled 0
6eaeb30d50:    	strh	w21, [x19, #0x224]  // guest 0x18d15b, sampled 0
6eaeb30d54:    	str	w27, [x19, #0x230]  // guest 0x18d15b, sampled 0
6eaeb30d58:    	ldr	w21, [x19, #0x54]  // guest 0x18d15b, sampled 0
6eaeb30d5c:    	strh	w21, [x19, #0x222]  // guest 0x18d15b, sampled 0
6eaeb30d60:    	mov	w21, #0xd15b            // =53595  // guest 0x18d15b, sampled 0
6eaeb30d64:    	movk	w21, #0x18, lsl #16  // guest 0x18d15b, sampled 0
6eaeb30d68:    	str	w21, [x19, #0x228]  // guest 0x18d15b, sampled 0
6eaeb30d6c:    	add	w21, w20, #0x2c  // guest 0x18d15f, sampled 0
6eaeb30d70:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d15f, sampled 0
6eaeb30d74:    	and	x16, x16, x21, lsr #7  // guest 0x18d15f, sampled 0
6eaeb30d78:    	add	x17, x17, x16  // guest 0x18d15f, sampled 0
6eaeb30d7c:    	ldp	x16, x17, [x17]  // guest 0x18d15f, sampled 0
6eaeb30d80:    	and	w30, w21, #0xfffff003  // guest 0x18d15f, sampled 1
6eaeb30d84:    	cmp	w16, w30  // guest 0x18d15f, sampled 0
6eaeb30d88:    	b.ne	0x6eaeb31390 <trace+0x1390>  // guest 0x18d15f, sampled 0
6eaeb30d8c:    	add	x30, x17, w21, uxtw  // guest 0x18d15f, sampled 1
6eaeb30d90:    	ldapr	w21, [x30]  // guest 0x18d15f, sampled 0
6eaeb30d94:    	str	w21, [x19, #0x14]  // guest 0x18d15f, sampled 1
6eaeb30d98:    	add	w24, w26, #0x8  // guest 0x18d163, sampled 0
6eaeb30d9c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d163, sampled 0
6eaeb30da0:    	and	x16, x16, x24, lsr #7  // guest 0x18d163, sampled 0
6eaeb30da4:    	add	x17, x17, x16  // guest 0x18d163, sampled 0
6eaeb30da8:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18d163, sampled 0
6eaeb30dac:    	and	w30, w24, #0xfffff003  // guest 0x18d163, sampled 0
6eaeb30db0:    	cmp	w16, w30  // guest 0x18d163, sampled 0
6eaeb30db4:    	b.ne	0x6eaeb313bc <trace+0x13bc>  // guest 0x18d163, sampled 0
6eaeb30db8:    	add	x30, x17, w24, uxtw  // guest 0x18d163, sampled 0
6eaeb30dbc:    	stlr	w21, [x30]  // guest 0x18d163, sampled 0
6eaeb30dc0:    	ldr	w21, [x19]  // guest 0x18d166, sampled 0
6eaeb30dc4:    	ldr	w24, [x19, #0x1c]  // guest 0x18d166, sampled 0
6eaeb30dc8:    	add	w24, w21, w24  // guest 0x18d166, sampled 0
6eaeb30dcc:    	add	w23, w24, w23  // guest 0x18d166, sampled 0
6eaeb30dd0:    	str	w23, [x19, #0x8]  // guest 0x18d166, sampled 0
6eaeb30dd4:    	lsl	w24, w23, #2  // guest 0x18d16d, sampled 0
6eaeb30dd8:    	ldr	w26, [x19, #0x18]  // guest 0x18d16d, sampled 0
6eaeb30ddc:    	add	w24, w24, w26  // guest 0x18d16d, sampled 0
6eaeb30de0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d16d, sampled 0
6eaeb30de4:    	and	x16, x16, x24, lsr #7  // guest 0x18d16d, sampled 0
6eaeb30de8:    	add	x17, x17, x16  // guest 0x18d16d, sampled 0
6eaeb30dec:    	ldp	x16, x17, [x17]  // guest 0x18d16d, sampled 0
6eaeb30df0:    	and	w30, w24, #0xfffff003  // guest 0x18d16d, sampled 2
6eaeb30df4:    	cmp	w16, w30  // guest 0x18d16d, sampled 1
6eaeb30df8:    	b.ne	0x6eaeb313e8 <trace+0x13e8>  // guest 0x18d16d, sampled 0
6eaeb30dfc:    	add	x30, x17, w24, uxtw  // guest 0x18d16d, sampled 0
6eaeb30e00:    	ldapr	w24, [x30]  // guest 0x18d16d, sampled 0
6eaeb30e04:    	str	w24, [x19, #0x14]  // guest 0x18d16d, sampled 1
6eaeb30e08:    	lsl	w24, w24, #2  // guest 0x18d170, sampled 0
6eaeb30e0c:    	add	w24, w24, w26  // guest 0x18d170, sampled 0
6eaeb30e10:    	mov	w27, #0x8914            // =35092  // guest 0x18d170, sampled 0
6eaeb30e14:    	movk	w27, #0x1, lsl #16  // guest 0x18d170, sampled 0
6eaeb30e18:    	add	w24, w24, w27  // guest 0x18d170, sampled 0
6eaeb30e1c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d170, sampled 0
6eaeb30e20:    	and	x16, x16, x24, lsr #7  // guest 0x18d170, sampled 0
6eaeb30e24:    	add	x17, x17, x16  // guest 0x18d170, sampled 0
6eaeb30e28:    	ldp	x16, x17, [x17]  // guest 0x18d170, sampled 0
6eaeb30e2c:    	and	w30, w24, #0xfffff003  // guest 0x18d170, sampled 1
6eaeb30e30:    	cmp	w16, w30  // guest 0x18d170, sampled 0
6eaeb30e34:    	b.ne	0x6eaeb31414 <trace+0x1414>  // guest 0x18d170, sampled 0
6eaeb30e38:    	add	x30, x17, w24, uxtw  // guest 0x18d170, sampled 0
6eaeb30e3c:    	ldapr	w24, [x30]  // guest 0x18d170, sampled 0
6eaeb30e40:    	str	w24, [x19, #0x14]  // guest 0x18d170, sampled 1
6eaeb30e44:    	lsl	w23, w23, #2  // guest 0x18d177, sampled 0
6eaeb30e48:    	add	w23, w23, w26  // guest 0x18d177, sampled 0
6eaeb30e4c:    	str	w23, [x19, #0x8]  // guest 0x18d177, sampled 0
6eaeb30e50:    	ldr	w27, [x19, #0x4]  // guest 0x18d17a, sampled 0
6eaeb30e54:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d17a, sampled 0
6eaeb30e58:    	and	x16, x16, x27, lsr #7  // guest 0x18d17a, sampled 0
6eaeb30e5c:    	add	x17, x17, x16  // guest 0x18d17a, sampled 0
6eaeb30e60:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18d17a, sampled 1
6eaeb30e64:    	and	w30, w27, #0xfffff003  // guest 0x18d17a, sampled 0
6eaeb30e68:    	cmp	w16, w30  // guest 0x18d17a, sampled 0
6eaeb30e6c:    	b.ne	0x6eaeb31440 <trace+0x1440>  // guest 0x18d17a, sampled 0
6eaeb30e70:    	add	x30, x17, w27, uxtw  // guest 0x18d17a, sampled 0
6eaeb30e74:    	stlr	w24, [x30]  // guest 0x18d17a, sampled 0
6eaeb30e78:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d17c, sampled 0
6eaeb30e7c:    	and	x16, x16, x23, lsr #7  // guest 0x18d17c, sampled 0
6eaeb30e80:    	add	x17, x17, x16  // guest 0x18d17c, sampled 0
6eaeb30e84:    	ldp	x16, x17, [x17]  // guest 0x18d17c, sampled 0
6eaeb30e88:    	and	w30, w23, #0xfffff003  // guest 0x18d17c, sampled 0
6eaeb30e8c:    	cmp	w16, w30  // guest 0x18d17c, sampled 0
6eaeb30e90:    	b.ne	0x6eaeb3146c <trace+0x146c>  // guest 0x18d17c, sampled 0
6eaeb30e94:    	add	x30, x17, w23, uxtw  // guest 0x18d17c, sampled 0
6eaeb30e98:    	ldapr	w24, [x30]  // guest 0x18d17c, sampled 0
6eaeb30e9c:    	str	w24, [x19, #0x14]  // guest 0x18d17c, sampled 0
6eaeb30ea0:    	lsl	w24, w24, #2  // guest 0x18d17e, sampled 0
6eaeb30ea4:    	add	w24, w24, w26  // guest 0x18d17e, sampled 0
6eaeb30ea8:    	mov	w28, #0xcb14            // =51988  // guest 0x18d17e, sampled 0
6eaeb30eac:    	movk	w28, #0x1, lsl #16  // guest 0x18d17e, sampled 0
6eaeb30eb0:    	add	w24, w24, w28  // guest 0x18d17e, sampled 0
6eaeb30eb4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d17e, sampled 0
6eaeb30eb8:    	and	x16, x16, x24, lsr #7  // guest 0x18d17e, sampled 0
6eaeb30ebc:    	add	x17, x17, x16  // guest 0x18d17e, sampled 0
6eaeb30ec0:    	ldp	x16, x17, [x17]  // guest 0x18d17e, sampled 0
6eaeb30ec4:    	and	w30, w24, #0xfffff003  // guest 0x18d17e, sampled 0
6eaeb30ec8:    	cmp	w16, w30  // guest 0x18d17e, sampled 0
6eaeb30ecc:    	b.ne	0x6eaeb31498 <trace+0x1498>  // guest 0x18d17e, sampled 0
6eaeb30ed0:    	add	x30, x17, w24, uxtw  // guest 0x18d17e, sampled 0
6eaeb30ed4:    	ldapr	w24, [x30]  // guest 0x18d17e, sampled 0
6eaeb30ed8:    	str	w24, [x19, #0x14]  // guest 0x18d17e, sampled 1
6eaeb30edc:    	add	w28, w27, #0x4  // guest 0x18d185, sampled 0
6eaeb30ee0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d185, sampled 0
6eaeb30ee4:    	and	x16, x16, x28, lsr #7  // guest 0x18d185, sampled 0
6eaeb30ee8:    	add	x17, x17, x16  // guest 0x18d185, sampled 0
6eaeb30eec:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18d185, sampled 0
6eaeb30ef0:    	and	w30, w28, #0xfffff003  // guest 0x18d185, sampled 0
6eaeb30ef4:    	cmp	w16, w30  // guest 0x18d185, sampled 0
6eaeb30ef8:    	b.ne	0x6eaeb314c4 <trace+0x14c4>  // guest 0x18d185, sampled 0
6eaeb30efc:    	add	x30, x17, w28, uxtw  // guest 0x18d185, sampled 1
6eaeb30f00:    	stlr	w24, [x30]  // guest 0x18d185, sampled 0
6eaeb30f04:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d188, sampled 0
6eaeb30f08:    	and	x16, x16, x23, lsr #7  // guest 0x18d188, sampled 0
6eaeb30f0c:    	add	x17, x17, x16  // guest 0x18d188, sampled 0
6eaeb30f10:    	ldp	x16, x17, [x17]  // guest 0x18d188, sampled 0
6eaeb30f14:    	and	w30, w23, #0xfffff003  // guest 0x18d188, sampled 0
6eaeb30f18:    	cmp	w16, w30  // guest 0x18d188, sampled 0
6eaeb30f1c:    	b.ne	0x6eaeb314f0 <trace+0x14f0>  // guest 0x18d188, sampled 0
6eaeb30f20:    	add	x30, x17, w23, uxtw  // guest 0x18d188, sampled 0
6eaeb30f24:    	ldapr	w23, [x30]  // guest 0x18d188, sampled 0
6eaeb30f28:    	str	w23, [x19, #0x8]  // guest 0x18d188, sampled 0
6eaeb30f2c:    	lsl	w23, w23, #2  // guest 0x18d18a, sampled 0
6eaeb30f30:    	add	w23, w23, w26  // guest 0x18d18a, sampled 0
6eaeb30f34:    	add	w23, w23, w25  // guest 0x18d18a, sampled 0
6eaeb30f38:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d18a, sampled 0
6eaeb30f3c:    	and	x16, x16, x23, lsr #7  // guest 0x18d18a, sampled 0
6eaeb30f40:    	add	x17, x17, x16  // guest 0x18d18a, sampled 0
6eaeb30f44:    	ldp	x16, x17, [x17]  // guest 0x18d18a, sampled 0
6eaeb30f48:    	and	w30, w23, #0xfffff003  // guest 0x18d18a, sampled 0
6eaeb30f4c:    	cmp	w16, w30  // guest 0x18d18a, sampled 0
6eaeb30f50:    	b.ne	0x6eaeb3151c <trace+0x151c>  // guest 0x18d18a, sampled 0
6eaeb30f54:    	add	x30, x17, w23, uxtw  // guest 0x18d18a, sampled 1
6eaeb30f58:    	ldapr	w23, [x30]  // guest 0x18d18a, sampled 0
6eaeb30f5c:    	str	w23, [x19, #0x8]  // guest 0x18d18a, sampled 3
6eaeb30f60:    	add	w21, w21, w22  // guest 0x18d191, sampled 0
6eaeb30f64:    	str	w21, [x19]  // guest 0x18d191, sampled 0
6eaeb30f68:    	sub	w24, w21, #0x3f  // guest 0x18d192, sampled 0
6eaeb30f6c:    	str	w24, [x19, #0x28]  // guest 0x18d192, sampled 0
6eaeb30f70:    	mov	w24, #0x3f              // =63  // guest 0x18d192, sampled 0
6eaeb30f74:    	str	w24, [x19, #0x2c]  // guest 0x18d192, sampled 0
6eaeb30f78:    	add	w24, w27, #0x8  // guest 0x18d195, sampled 0
6eaeb30f7c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d195, sampled 0
6eaeb30f80:    	and	x16, x16, x24, lsr #7  // guest 0x18d195, sampled 0
6eaeb30f84:    	add	x17, x17, x16  // guest 0x18d195, sampled 0
6eaeb30f88:    	ldp	x17, x16, [x17, #0x8]  // guest 0x18d195, sampled 0
6eaeb30f8c:    	and	w30, w24, #0xfffff003  // guest 0x18d195, sampled 0
6eaeb30f90:    	cmp	w16, w30  // guest 0x18d195, sampled 0
6eaeb30f94:    	b.ne	0x6eaeb31548 <trace+0x1548>  // guest 0x18d195, sampled 0
6eaeb30f98:    	add	x30, x17, w24, uxtw  // guest 0x18d195, sampled 0
6eaeb30f9c:    	stlr	w23, [x30]  // guest 0x18d195, sampled 0
6eaeb30fa0:    	add	w20, w20, #0x10  // guest 0x18d198, sampled 0
6eaeb30fa4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x18d198, sampled 0
6eaeb30fa8:    	and	x16, x16, x20, lsr #7  // guest 0x18d198, sampled 0
6eaeb30fac:    	add	x17, x17, x16  // guest 0x18d198, sampled 0
6eaeb30fb0:    	ldp	x16, x17, [x17]  // guest 0x18d198, sampled 0
6eaeb30fb4:    	and	w30, w20, #0xfffff003  // guest 0x18d198, sampled 0
6eaeb30fb8:    	cmp	w16, w30  // guest 0x18d198, sampled 0
6eaeb30fbc:    	b.ne	0x6eaeb31574 <trace+0x1574>  // guest 0x18d198, sampled 0
6eaeb30fc0:    	add	x30, x17, w20, uxtw  // guest 0x18d198, sampled 0
6eaeb30fc4:    	ldapr	w20, [x30]  // guest 0x18d198, sampled 0
6eaeb30fc8:    	str	w20, [x19, #0x4]  // guest 0x18d198, sampled 0
6eaeb30fcc:    	sturb	w22, [x19, #-0xc]  // guest 0x18d198, sampled 0
6eaeb30fd0:    	mov	w20, #0x12              // =18  // guest 0x18d19c, sampled 0
6eaeb30fd4:    	str	w20, [x19, #0x34]  // guest 0x18d19c, sampled 0
6eaeb30fd8:    	cmp	w21, #0x3f  // guest 0x18d19c, sampled 0
6eaeb30fdc:    	b.le	0x6eaeb30ffc <trace+0xffc>  // guest 0x18d19c, sampled 0
6eaeb30fe0:    	b	0x6eaeb30fe0 <trace+0xfe0>  // guest 0x18d19c, sampled 0
6eaeb30fe4:    	br	x16  // guest 0x18d19c, sampled 0
6eaeb30fe8:    	mov	w20, #0xd1a2            // =53666  // guest 0x18d19c, sampled 0
6eaeb30fec:    	movk	w20, #0x18, lsl #16  // guest 0x18d19c, sampled 0
6eaeb30ff0:    	str	w20, [x19, #0x20]  // guest 0x18d19c, sampled 0
6eaeb30ff4:    	adr	x0, 0x6eaeb2ff41 <trace+0xffffffffffffff41>  // guest 0x18d19c, sampled 0
6eaeb30ff8:    	b	0x6ea842202c <trace+0xfffffffff98f202c>  // guest 0x18d19c, sampled 0
6eaeb30ffc:    	b	0x6eaeb30ffc <trace+0xffc>  // guest 0x18d19c, sampled 0
6eaeb31000:    	br	x16  // guest 0x18d19c, sampled 0
6eaeb31004:    	mov	w20, #0xd097            // =53399  // guest 0x18d19c, sampled 0
6eaeb31008:    	movk	w20, #0x18, lsl #16  // guest 0x18d19c, sampled 0
6eaeb3100c:    	str	w20, [x19, #0x20]  // guest 0x18d19c, sampled 0
6eaeb31010:    	adr	x0, 0x6eaeb2ff40 <trace+0xffffffffffffff40>  // guest 0x18d19c, sampled 0
6eaeb31014:    	b	0x6ea842202c <trace+0xfffffffff98f202c>  // guest 0x18d19c, sampled 0
6eaeb31018:    	adr	x0, 0x6eaeb2ff43 <trace+0xffffffffffffff43>  // guest 0x18d19c, sampled 0
6eaeb3101c:    	b	0x6ea842202c <trace+0xfffffffff98f202c>  // guest 0x18d19c, sampled 0
6eaeb31020:    	mov	w1, w21
6eaeb31024:    	mov	x0, x19
6eaeb31028:    	mov	w2, #0x4045             // =16453
6eaeb3102c:    	movk	w2, #0x1, lsl #16
6eaeb31030:    	adr	x3, 0x6eaeb30084 <trace+0x84>
6eaeb31034:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb31038:    	add	x16, x16, #0x58
6eaeb3103c:    	blr	x16
6eaeb31040:    	mov	w21, w0
6eaeb31044:    	dmb	ishld
6eaeb31048:    	b	0x6eaeb30084 <trace+0x84>
6eaeb3104c:    	mov	w1, w21
6eaeb31050:    	mov	x0, x19
6eaeb31054:    	mov	w2, #0x4045             // =16453
6eaeb31058:    	movk	w2, #0x1, lsl #16
6eaeb3105c:    	adr	x3, 0x6eaeb300c0 <trace+0xc0>
6eaeb31060:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb31064:    	add	x16, x16, #0x58
6eaeb31068:    	blr	x16
6eaeb3106c:    	mov	w2, w0
6eaeb31070:    	dmb	ishld
6eaeb31074:    	b	0x6eaeb300c0 <trace+0xc0>
6eaeb31078:    	mov	w1, w26
6eaeb3107c:    	mov	x0, x19
6eaeb31080:    	mov	w2, #0x4045             // =16453
6eaeb31084:    	movk	w2, #0x1, lsl #16
6eaeb31088:    	adr	x3, 0x6eaeb30178 <trace+0x178>
6eaeb3108c:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb31090:    	add	x16, x16, #0x58
6eaeb31094:    	blr	x16
6eaeb31098:    	mov	w26, w0
6eaeb3109c:    	dmb	ishld
6eaeb310a0:    	b	0x6eaeb30178 <trace+0x178>
6eaeb310a4:    	mov	w1, w8
6eaeb310a8:    	mov	x0, x19
6eaeb310ac:    	mov	w2, #0x4045             // =16453
6eaeb310b0:    	movk	w2, #0x1, lsl #16
6eaeb310b4:    	adr	x3, 0x6eaeb301b8 <trace+0x1b8>
6eaeb310b8:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb310bc:    	add	x16, x16, #0x58
6eaeb310c0:    	blr	x16
6eaeb310c4:    	mov	w8, w0
6eaeb310c8:    	dmb	ishld
6eaeb310cc:    	b	0x6eaeb301b8 <trace+0x1b8>
6eaeb310d0:    	mov	w1, w8
6eaeb310d4:    	mov	x0, x19
6eaeb310d8:    	mov	w2, #0x4045             // =16453
6eaeb310dc:    	movk	w2, #0x1, lsl #16
6eaeb310e0:    	adr	x3, 0x6eaeb301f4 <trace+0x1f4>
6eaeb310e4:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb310e8:    	add	x16, x16, #0x58
6eaeb310ec:    	blr	x16
6eaeb310f0:    	mov	w2, w0
6eaeb310f4:    	dmb	ishld
6eaeb310f8:    	b	0x6eaeb301f4 <trace+0x1f4>
6eaeb310fc:    	mov	w1, w20
6eaeb31100:    	mov	x0, x19
6eaeb31104:    	mov	w2, #0x4045             // =16453
6eaeb31108:    	movk	w2, #0x1, lsl #16
6eaeb3110c:    	adr	x3, 0x6eaeb30294 <trace+0x294>
6eaeb31110:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb31114:    	add	x16, x16, #0x58
6eaeb31118:    	blr	x16
6eaeb3111c:    	mov	w20, w0
6eaeb31120:    	dmb	ishld
6eaeb31124:    	b	0x6eaeb30294 <trace+0x294>
6eaeb31128:    	mov	w1, w26
6eaeb3112c:    	mov	x0, x19
6eaeb31130:    	mov	w2, #0x4045             // =16453
6eaeb31134:    	movk	w2, #0x1, lsl #16
6eaeb31138:    	adr	x3, 0x6eaeb30330 <trace+0x330>
6eaeb3113c:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb31140:    	add	x16, x16, #0x58
6eaeb31144:    	blr	x16
6eaeb31148:    	mov	w2, w0
6eaeb3114c:    	dmb	ishld
6eaeb31150:    	b	0x6eaeb30330 <trace+0x330>
6eaeb31154:    	mov	w1, w26
6eaeb31158:    	mov	x0, x19
6eaeb3115c:    	mov	w2, #0x4045             // =16453
6eaeb31160:    	movk	w2, #0x1, lsl #16
6eaeb31164:    	adr	x3, 0x6eaeb303bc <trace+0x3bc>
6eaeb31168:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb3116c:    	add	x16, x16, #0x58
6eaeb31170:    	blr	x16
6eaeb31174:    	mov	w26, w0
6eaeb31178:    	dmb	ishld
6eaeb3117c:    	b	0x6eaeb303bc <trace+0x3bc>
6eaeb31180:    	mov	w1, w20
6eaeb31184:    	mov	x0, x19
6eaeb31188:    	mov	w2, #0x4045             // =16453
6eaeb3118c:    	movk	w2, #0x1, lsl #16
6eaeb31190:    	adr	x3, 0x6eaeb303f4 <trace+0x3f4>
6eaeb31194:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb31198:    	add	x16, x16, #0x58
6eaeb3119c:    	blr	x16
6eaeb311a0:    	mov	w2, w0
6eaeb311a4:    	dmb	ishld
6eaeb311a8:    	b	0x6eaeb303f4 <trace+0x3f4>
6eaeb311ac:    	mov	w1, w20
6eaeb311b0:    	mov	x0, x19
6eaeb311b4:    	mov	w2, #0x4045             // =16453
6eaeb311b8:    	movk	w2, #0x1, lsl #16
6eaeb311bc:    	adr	x3, 0x6eaeb30774 <trace+0x774>
6eaeb311c0:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb311c4:    	add	x16, x16, #0x58
6eaeb311c8:    	blr	x16
6eaeb311cc:    	mov	w2, w0
6eaeb311d0:    	dmb	ishld
6eaeb311d4:    	b	0x6eaeb30774 <trace+0x774>
6eaeb311d8:    	mov	w1, w24
6eaeb311dc:    	mov	w2, w0
6eaeb311e0:    	mov	x0, x19
6eaeb311e4:    	mov	w3, #0x4045             // =16453
6eaeb311e8:    	movk	w3, #0x1, lsl #16
6eaeb311ec:    	adr	x4, 0x6eaeb30820 <trace+0x820>
6eaeb311f0:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb311f4:    	add	x16, x16, #0xc38
6eaeb311f8:    	blr	x16
6eaeb311fc:    	dmb	ishld
6eaeb31200:    	b	0x6eaeb30820 <trace+0x820>
6eaeb31204:    	mov	w1, w24
6eaeb31208:    	mov	w2, w0
6eaeb3120c:    	mov	x0, x19
6eaeb31210:    	mov	w3, #0x4045             // =16453
6eaeb31214:    	movk	w3, #0x1, lsl #16
6eaeb31218:    	adr	x4, 0x6eaeb308f0 <trace+0x8f0>
6eaeb3121c:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb31220:    	add	x16, x16, #0xc38
6eaeb31224:    	blr	x16
6eaeb31228:    	dmb	ishld
6eaeb3122c:    	b	0x6eaeb308f0 <trace+0x8f0>
6eaeb31230:    	mov	w1, w24
6eaeb31234:    	mov	x0, x19
6eaeb31238:    	mov	w2, #0x4045             // =16453
6eaeb3123c:    	movk	w2, #0x1, lsl #16
6eaeb31240:    	adr	x3, 0x6eaeb30950 <trace+0x950>
6eaeb31244:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb31248:    	add	x16, x16, #0x58
6eaeb3124c:    	blr	x16
6eaeb31250:    	mov	w24, w0
6eaeb31254:    	dmb	ishld
6eaeb31258:    	b	0x6eaeb30950 <trace+0x950>
6eaeb3125c:    	mov	w1, w26
6eaeb31260:    	mov	x0, x19
6eaeb31264:    	mov	w2, #0x4045             // =16453
6eaeb31268:    	movk	w2, #0x1, lsl #16
6eaeb3126c:    	adr	x3, 0x6eaeb30980 <trace+0x980>
6eaeb31270:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb31274:    	add	x16, x16, #0x58
6eaeb31278:    	blr	x16
6eaeb3127c:    	mov	w2, w0
6eaeb31280:    	dmb	ishld
6eaeb31284:    	b	0x6eaeb30980 <trace+0x980>
6eaeb31288:    	mov	w1, w26
6eaeb3128c:    	mov	w2, w24
6eaeb31290:    	mov	x0, x19
6eaeb31294:    	mov	w3, #0x4045             // =16453
6eaeb31298:    	movk	w3, #0x1, lsl #16
6eaeb3129c:    	adr	x4, 0x6eaeb30a08 <trace+0xa08>
6eaeb312a0:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb312a4:    	add	x16, x16, #0xc38
6eaeb312a8:    	blr	x16
6eaeb312ac:    	dmb	ishld
6eaeb312b0:    	b	0x6eaeb30a08 <trace+0xa08>
6eaeb312b4:    	mov	w1, w24
6eaeb312b8:    	mov	w2, w0
6eaeb312bc:    	mov	x0, x19
6eaeb312c0:    	mov	w3, #0x4045             // =16453
6eaeb312c4:    	movk	w3, #0x1, lsl #16
6eaeb312c8:    	adr	x4, 0x6eaeb30ab8 <trace+0xab8>
6eaeb312cc:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb312d0:    	add	x16, x16, #0xc38
6eaeb312d4:    	blr	x16
6eaeb312d8:    	dmb	ishld
6eaeb312dc:    	b	0x6eaeb30ab8 <trace+0xab8>
6eaeb312e0:    	mov	w1, w24
6eaeb312e4:    	mov	x0, x19
6eaeb312e8:    	mov	w2, #0x4045             // =16453
6eaeb312ec:    	movk	w2, #0x1, lsl #16
6eaeb312f0:    	adr	x3, 0x6eaeb30b18 <trace+0xb18>
6eaeb312f4:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb312f8:    	add	x16, x16, #0x58
6eaeb312fc:    	blr	x16
6eaeb31300:    	mov	w24, w0
6eaeb31304:    	dmb	ishld
6eaeb31308:    	b	0x6eaeb30b18 <trace+0xb18>
6eaeb3130c:    	mov	w1, w27
6eaeb31310:    	mov	w2, w24
6eaeb31314:    	mov	x0, x19
6eaeb31318:    	mov	w3, #0x4045             // =16453
6eaeb3131c:    	movk	w3, #0x1, lsl #16
6eaeb31320:    	adr	x4, 0x6eaeb30b44 <trace+0xb44>
6eaeb31324:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb31328:    	add	x16, x16, #0xc38
6eaeb3132c:    	blr	x16
6eaeb31330:    	dmb	ishld
6eaeb31334:    	b	0x6eaeb30b44 <trace+0xb44>
6eaeb31338:    	mov	w1, w24
6eaeb3133c:    	mov	x0, x19
6eaeb31340:    	mov	w2, #0x4045             // =16453
6eaeb31344:    	movk	w2, #0x1, lsl #16
6eaeb31348:    	adr	x3, 0x6eaeb30c24 <trace+0xc24>
6eaeb3134c:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb31350:    	add	x16, x16, #0x58
6eaeb31354:    	blr	x16
6eaeb31358:    	mov	w2, w0
6eaeb3135c:    	dmb	ishld
6eaeb31360:    	b	0x6eaeb30c24 <trace+0xc24>
6eaeb31364:    	mov	w1, w24
6eaeb31368:    	mov	w2, w0
6eaeb3136c:    	mov	x0, x19
6eaeb31370:    	mov	w3, #0x4045             // =16453
6eaeb31374:    	movk	w3, #0x1, lsl #16
6eaeb31378:    	adr	x4, 0x6eaeb30d34 <trace+0xd34>
6eaeb3137c:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb31380:    	add	x16, x16, #0xc38
6eaeb31384:    	blr	x16
6eaeb31388:    	dmb	ishld
6eaeb3138c:    	b	0x6eaeb30d34 <trace+0xd34>
6eaeb31390:    	mov	w1, w21
6eaeb31394:    	mov	x0, x19
6eaeb31398:    	mov	w2, #0x4045             // =16453
6eaeb3139c:    	movk	w2, #0x1, lsl #16
6eaeb313a0:    	adr	x3, 0x6eaeb30d94 <trace+0xd94>
6eaeb313a4:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb313a8:    	add	x16, x16, #0x58
6eaeb313ac:    	blr	x16
6eaeb313b0:    	mov	w21, w0
6eaeb313b4:    	dmb	ishld
6eaeb313b8:    	b	0x6eaeb30d94 <trace+0xd94>
6eaeb313bc:    	mov	w1, w24
6eaeb313c0:    	mov	w2, w21
6eaeb313c4:    	mov	x0, x19
6eaeb313c8:    	mov	w3, #0x4045             // =16453
6eaeb313cc:    	movk	w3, #0x1, lsl #16
6eaeb313d0:    	adr	x4, 0x6eaeb30dc0 <trace+0xdc0>
6eaeb313d4:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb313d8:    	add	x16, x16, #0xc38
6eaeb313dc:    	blr	x16
6eaeb313e0:    	dmb	ishld
6eaeb313e4:    	b	0x6eaeb30dc0 <trace+0xdc0>
6eaeb313e8:    	mov	w1, w24
6eaeb313ec:    	mov	x0, x19
6eaeb313f0:    	mov	w2, #0x4045             // =16453
6eaeb313f4:    	movk	w2, #0x1, lsl #16
6eaeb313f8:    	adr	x3, 0x6eaeb30e04 <trace+0xe04>
6eaeb313fc:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb31400:    	add	x16, x16, #0x58
6eaeb31404:    	blr	x16
6eaeb31408:    	mov	w24, w0
6eaeb3140c:    	dmb	ishld
6eaeb31410:    	b	0x6eaeb30e04 <trace+0xe04>
6eaeb31414:    	mov	w1, w24
6eaeb31418:    	mov	x0, x19
6eaeb3141c:    	mov	w2, #0x4045             // =16453
6eaeb31420:    	movk	w2, #0x1, lsl #16
6eaeb31424:    	adr	x3, 0x6eaeb30e40 <trace+0xe40>
6eaeb31428:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb3142c:    	add	x16, x16, #0x58
6eaeb31430:    	blr	x16
6eaeb31434:    	mov	w24, w0
6eaeb31438:    	dmb	ishld
6eaeb3143c:    	b	0x6eaeb30e40 <trace+0xe40>
6eaeb31440:    	mov	w1, w27
6eaeb31444:    	mov	w2, w24
6eaeb31448:    	mov	x0, x19
6eaeb3144c:    	mov	w3, #0x4045             // =16453
6eaeb31450:    	movk	w3, #0x1, lsl #16
6eaeb31454:    	adr	x4, 0x6eaeb30e78 <trace+0xe78>
6eaeb31458:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb3145c:    	add	x16, x16, #0xc38
6eaeb31460:    	blr	x16
6eaeb31464:    	dmb	ishld
6eaeb31468:    	b	0x6eaeb30e78 <trace+0xe78>
6eaeb3146c:    	mov	w1, w23
6eaeb31470:    	mov	x0, x19
6eaeb31474:    	mov	w2, #0x4045             // =16453
6eaeb31478:    	movk	w2, #0x1, lsl #16
6eaeb3147c:    	adr	x3, 0x6eaeb30e9c <trace+0xe9c>
6eaeb31480:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb31484:    	add	x16, x16, #0x58
6eaeb31488:    	blr	x16
6eaeb3148c:    	mov	w24, w0
6eaeb31490:    	dmb	ishld
6eaeb31494:    	b	0x6eaeb30e9c <trace+0xe9c>
6eaeb31498:    	mov	w1, w24
6eaeb3149c:    	mov	x0, x19
6eaeb314a0:    	mov	w2, #0x4045             // =16453
6eaeb314a4:    	movk	w2, #0x1, lsl #16
6eaeb314a8:    	adr	x3, 0x6eaeb30ed8 <trace+0xed8>
6eaeb314ac:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb314b0:    	add	x16, x16, #0x58
6eaeb314b4:    	blr	x16
6eaeb314b8:    	mov	w24, w0
6eaeb314bc:    	dmb	ishld
6eaeb314c0:    	b	0x6eaeb30ed8 <trace+0xed8>
6eaeb314c4:    	mov	w1, w28
6eaeb314c8:    	mov	w2, w24
6eaeb314cc:    	mov	x0, x19
6eaeb314d0:    	mov	w3, #0x4045             // =16453
6eaeb314d4:    	movk	w3, #0x1, lsl #16
6eaeb314d8:    	adr	x4, 0x6eaeb30f04 <trace+0xf04>
6eaeb314dc:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb314e0:    	add	x16, x16, #0xc38
6eaeb314e4:    	blr	x16
6eaeb314e8:    	dmb	ishld
6eaeb314ec:    	b	0x6eaeb30f04 <trace+0xf04>
6eaeb314f0:    	mov	w1, w23
6eaeb314f4:    	mov	x0, x19
6eaeb314f8:    	mov	w2, #0x4045             // =16453
6eaeb314fc:    	movk	w2, #0x1, lsl #16
6eaeb31500:    	adr	x3, 0x6eaeb30f28 <trace+0xf28>
6eaeb31504:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb31508:    	add	x16, x16, #0x58
6eaeb3150c:    	blr	x16
6eaeb31510:    	mov	w23, w0
6eaeb31514:    	dmb	ishld
6eaeb31518:    	b	0x6eaeb30f28 <trace+0xf28>
6eaeb3151c:    	mov	w1, w23
6eaeb31520:    	mov	x0, x19
6eaeb31524:    	mov	w2, #0x4045             // =16453
6eaeb31528:    	movk	w2, #0x1, lsl #16
6eaeb3152c:    	adr	x3, 0x6eaeb30f5c <trace+0xf5c>
6eaeb31530:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb31534:    	add	x16, x16, #0x58
6eaeb31538:    	blr	x16
6eaeb3153c:    	mov	w23, w0
6eaeb31540:    	dmb	ishld
6eaeb31544:    	b	0x6eaeb30f5c <trace+0xf5c>
6eaeb31548:    	mov	w1, w24
6eaeb3154c:    	mov	w2, w23
6eaeb31550:    	mov	x0, x19
6eaeb31554:    	mov	w3, #0x4045             // =16453
6eaeb31558:    	movk	w3, #0x1, lsl #16
6eaeb3155c:    	adr	x4, 0x6eaeb30fa0 <trace+0xfa0>
6eaeb31560:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb31564:    	add	x16, x16, #0xc38
6eaeb31568:    	blr	x16
6eaeb3156c:    	dmb	ishld
6eaeb31570:    	b	0x6eaeb30fa0 <trace+0xfa0>
6eaeb31574:    	mov	w1, w20
6eaeb31578:    	mov	x0, x19
6eaeb3157c:    	mov	w2, #0x4045             // =16453
6eaeb31580:    	movk	w2, #0x1, lsl #16
6eaeb31584:    	adr	x3, 0x6eaeb30fc8 <trace+0xfc8>
6eaeb31588:    	adrp	x16, 0x6efc87d000 <trace+0x4dd4d000>
6eaeb3158c:    	add	x16, x16, #0x58
6eaeb31590:    	blr	x16
6eaeb31594:    	mov	w20, w0
6eaeb31598:    	dmb	ishld
6eaeb3159c:    	b	0x6eaeb30fc8 <trace+0xfc8>