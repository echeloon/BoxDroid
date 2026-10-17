
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-15b35e-6ead1f3f40.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006ead1f3f40 <trace>:
6ead1f3f40:    	ldur	w20, [x19, #-0x10]  // guest 0x15b35e, sampled 0
6ead1f3f44:    	tbnz	w20, #0x1f, 0x6ead1f45dc <trace+0x69c>  // guest 0x15b35e, sampled 0
6ead1f3f48:    	sturb	wzr, [x19, #-0xc]  // guest 0x15b35e, sampled 0
6ead1f3f4c:    	ldr	w20, [x19, #0x18]  // guest 0x15b35e, sampled 0
6ead1f3f50:    	add	w21, w20, #0x88  // guest 0x15b35e, sampled 0
6ead1f3f54:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b35e, sampled 0
6ead1f3f58:    	and	x16, x16, x21, lsr #7  // guest 0x15b35e, sampled 0
6ead1f3f5c:    	add	x17, x17, x16  // guest 0x15b35e, sampled 0
6ead1f3f60:    	ldp	x16, x17, [x17]  // guest 0x15b35e, sampled 0
6ead1f3f64:    	and	w30, w21, #0xfffff003  // guest 0x15b35e, sampled 0
6ead1f3f68:    	cmp	w16, w30  // guest 0x15b35e, sampled 0
6ead1f3f6c:    	b.ne	0x6ead1f45e4 <trace+0x6a4>  // guest 0x15b35e, sampled 0
6ead1f3f70:    	add	x30, x17, w21, uxtw  // guest 0x15b35e, sampled 0
6ead1f3f74:    	ldapr	w21, [x30]  // guest 0x15b35e, sampled 0
6ead1f3f78:    	str	w21, [x19, #0x4]  // guest 0x15b35e, sampled 0
6ead1f3f7c:    	ldr	w22, [x19, #0xc]  // guest 0x15b364, sampled 0
6ead1f3f80:    	add	w23, w22, #0x88  // guest 0x15b364, sampled 0
6ead1f3f84:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b364, sampled 0
6ead1f3f88:    	and	x16, x16, x23, lsr #7  // guest 0x15b364, sampled 0
6ead1f3f8c:    	add	x17, x17, x16  // guest 0x15b364, sampled 0
6ead1f3f90:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b364, sampled 0
6ead1f3f94:    	and	w30, w23, #0xfffff003  // guest 0x15b364, sampled 0
6ead1f3f98:    	cmp	w16, w30  // guest 0x15b364, sampled 0
6ead1f3f9c:    	b.ne	0x6ead1f4610 <trace+0x6d0>  // guest 0x15b364, sampled 0
6ead1f3fa0:    	add	x30, x17, w23, uxtw  // guest 0x15b364, sampled 0
6ead1f3fa4:    	stlr	w21, [x30]  // guest 0x15b364, sampled 0
6ead1f3fa8:    	add	w21, w20, #0x8c  // guest 0x15b36a, sampled 0
6ead1f3fac:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b36a, sampled 0
6ead1f3fb0:    	and	x16, x16, x21, lsr #7  // guest 0x15b36a, sampled 0
6ead1f3fb4:    	add	x17, x17, x16  // guest 0x15b36a, sampled 0
6ead1f3fb8:    	ldp	x16, x17, [x17]  // guest 0x15b36a, sampled 0
6ead1f3fbc:    	and	w30, w21, #0xfffff003  // guest 0x15b36a, sampled 0
6ead1f3fc0:    	cmp	w16, w30  // guest 0x15b36a, sampled 0
6ead1f3fc4:    	b.ne	0x6ead1f463c <trace+0x6fc>  // guest 0x15b36a, sampled 0
6ead1f3fc8:    	add	x30, x17, w21, uxtw  // guest 0x15b36a, sampled 0
6ead1f3fcc:    	ldapr	w21, [x30]  // guest 0x15b36a, sampled 0
6ead1f3fd0:    	str	w21, [x19, #0x8]  // guest 0x15b36a, sampled 0
6ead1f3fd4:    	add	w23, w22, #0x8c  // guest 0x15b370, sampled 0
6ead1f3fd8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b370, sampled 0
6ead1f3fdc:    	and	x16, x16, x23, lsr #7  // guest 0x15b370, sampled 0
6ead1f3fe0:    	add	x17, x17, x16  // guest 0x15b370, sampled 0
6ead1f3fe4:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b370, sampled 0
6ead1f3fe8:    	and	w30, w23, #0xfffff003  // guest 0x15b370, sampled 0
6ead1f3fec:    	cmp	w16, w30  // guest 0x15b370, sampled 0
6ead1f3ff0:    	b.ne	0x6ead1f4668 <trace+0x728>  // guest 0x15b370, sampled 0
6ead1f3ff4:    	add	x30, x17, w23, uxtw  // guest 0x15b370, sampled 0
6ead1f3ff8:    	stlr	w21, [x30]  // guest 0x15b370, sampled 0
6ead1f3ffc:    	add	w21, w20, #0x90  // guest 0x15b376, sampled 0
6ead1f4000:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b376, sampled 0
6ead1f4004:    	and	x16, x16, x21, lsr #7  // guest 0x15b376, sampled 0
6ead1f4008:    	add	x17, x17, x16  // guest 0x15b376, sampled 0
6ead1f400c:    	ldp	x16, x17, [x17]  // guest 0x15b376, sampled 0
6ead1f4010:    	and	w30, w21, #0xfffff000  // guest 0x15b376, sampled 0
6ead1f4014:    	cmp	w16, w30  // guest 0x15b376, sampled 0
6ead1f4018:    	b.ne	0x6ead1f4694 <trace+0x754>  // guest 0x15b376, sampled 0
6ead1f401c:    	add	x30, x17, w21, uxtw  // guest 0x15b376, sampled 0
6ead1f4020:    	ldaprb	w21, [x30]  // guest 0x15b376, sampled 0
6ead1f4024:    	ldr	w23, [x19]  // guest 0x15b376, sampled 0
6ead1f4028:    	mov	w16, w21  // guest 0x15b376, sampled 0
6ead1f402c:    	mov	w21, w23  // guest 0x15b376, sampled 0
6ead1f4030:    	bfxil	w21, w16, #0, #8  // guest 0x15b376, sampled 0
6ead1f4034:    	str	w21, [x19]  // guest 0x15b376, sampled 0
6ead1f4038:    	add	w23, w22, #0x90  // guest 0x15b37c, sampled 0
6ead1f403c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b37c, sampled 0
6ead1f4040:    	and	x16, x16, x23, lsr #7  // guest 0x15b37c, sampled 0
6ead1f4044:    	add	x17, x17, x16  // guest 0x15b37c, sampled 0
6ead1f4048:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b37c, sampled 0
6ead1f404c:    	and	w30, w23, #0xfffff000  // guest 0x15b37c, sampled 0
6ead1f4050:    	cmp	w16, w30  // guest 0x15b37c, sampled 0
6ead1f4054:    	b.ne	0x6ead1f46c0 <trace+0x780>  // guest 0x15b37c, sampled 0
6ead1f4058:    	add	x30, x17, w23, uxtw  // guest 0x15b37c, sampled 0
6ead1f405c:    	stlrb	w21, [x30]  // guest 0x15b37c, sampled 0
6ead1f4060:    	add	w21, w20, #0x94  // guest 0x15b382, sampled 0
6ead1f4064:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b382, sampled 0
6ead1f4068:    	and	x16, x16, x21, lsr #7  // guest 0x15b382, sampled 0
6ead1f406c:    	add	x17, x17, x16  // guest 0x15b382, sampled 0
6ead1f4070:    	ldp	x16, x17, [x17]  // guest 0x15b382, sampled 0
6ead1f4074:    	and	w30, w21, #0xfffff003  // guest 0x15b382, sampled 0
6ead1f4078:    	cmp	w16, w30  // guest 0x15b382, sampled 0
6ead1f407c:    	b.ne	0x6ead1f46ec <trace+0x7ac>  // guest 0x15b382, sampled 0
6ead1f4080:    	add	x30, x17, w21, uxtw  // guest 0x15b382, sampled 0
6ead1f4084:    	ldapr	w21, [x30]  // guest 0x15b382, sampled 0
6ead1f4088:    	str	w21, [x19, #0x4]  // guest 0x15b382, sampled 0
6ead1f408c:    	add	w23, w22, #0x94  // guest 0x15b388, sampled 0
6ead1f4090:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b388, sampled 0
6ead1f4094:    	and	x16, x16, x23, lsr #7  // guest 0x15b388, sampled 0
6ead1f4098:    	add	x17, x17, x16  // guest 0x15b388, sampled 0
6ead1f409c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b388, sampled 0
6ead1f40a0:    	and	w30, w23, #0xfffff003  // guest 0x15b388, sampled 0
6ead1f40a4:    	cmp	w16, w30  // guest 0x15b388, sampled 0
6ead1f40a8:    	b.ne	0x6ead1f4718 <trace+0x7d8>  // guest 0x15b388, sampled 0
6ead1f40ac:    	add	x30, x17, w23, uxtw  // guest 0x15b388, sampled 0
6ead1f40b0:    	stlr	w21, [x30]  // guest 0x15b388, sampled 0
6ead1f40b4:    	add	w21, w20, #0x98  // guest 0x15b38e, sampled 0
6ead1f40b8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b38e, sampled 0
6ead1f40bc:    	and	x16, x16, x21, lsr #7  // guest 0x15b38e, sampled 0
6ead1f40c0:    	add	x17, x17, x16  // guest 0x15b38e, sampled 0
6ead1f40c4:    	ldp	x16, x17, [x17]  // guest 0x15b38e, sampled 0
6ead1f40c8:    	and	w30, w21, #0xfffff003  // guest 0x15b38e, sampled 0
6ead1f40cc:    	cmp	w16, w30  // guest 0x15b38e, sampled 0
6ead1f40d0:    	b.ne	0x6ead1f4744 <trace+0x804>  // guest 0x15b38e, sampled 0
6ead1f40d4:    	add	x30, x17, w21, uxtw  // guest 0x15b38e, sampled 0
6ead1f40d8:    	ldapr	w21, [x30]  // guest 0x15b38e, sampled 0
6ead1f40dc:    	str	w21, [x19, #0x8]  // guest 0x15b38e, sampled 0
6ead1f40e0:    	add	w23, w22, #0x98  // guest 0x15b394, sampled 0
6ead1f40e4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b394, sampled 0
6ead1f40e8:    	and	x16, x16, x23, lsr #7  // guest 0x15b394, sampled 0
6ead1f40ec:    	add	x17, x17, x16  // guest 0x15b394, sampled 0
6ead1f40f0:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b394, sampled 0
6ead1f40f4:    	and	w30, w23, #0xfffff003  // guest 0x15b394, sampled 0
6ead1f40f8:    	cmp	w16, w30  // guest 0x15b394, sampled 0
6ead1f40fc:    	b.ne	0x6ead1f4770 <trace+0x830>  // guest 0x15b394, sampled 0
6ead1f4100:    	add	x30, x17, w23, uxtw  // guest 0x15b394, sampled 0
6ead1f4104:    	stlr	w21, [x30]  // guest 0x15b394, sampled 0
6ead1f4108:    	add	w21, w20, #0x9c  // guest 0x15b39a, sampled 0
6ead1f410c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b39a, sampled 0
6ead1f4110:    	and	x16, x16, x21, lsr #7  // guest 0x15b39a, sampled 0
6ead1f4114:    	add	x17, x17, x16  // guest 0x15b39a, sampled 0
6ead1f4118:    	ldp	x16, x17, [x17]  // guest 0x15b39a, sampled 0
6ead1f411c:    	and	w30, w21, #0xfffff003  // guest 0x15b39a, sampled 0
6ead1f4120:    	cmp	w16, w30  // guest 0x15b39a, sampled 0
6ead1f4124:    	b.ne	0x6ead1f479c <trace+0x85c>  // guest 0x15b39a, sampled 0
6ead1f4128:    	add	x30, x17, w21, uxtw  // guest 0x15b39a, sampled 0
6ead1f412c:    	ldapr	w21, [x30]  // guest 0x15b39a, sampled 0
6ead1f4130:    	str	w21, [x19]  // guest 0x15b39a, sampled 0
6ead1f4134:    	add	w23, w22, #0x9c  // guest 0x15b3a0, sampled 0
6ead1f4138:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3a0, sampled 0
6ead1f413c:    	and	x16, x16, x23, lsr #7  // guest 0x15b3a0, sampled 0
6ead1f4140:    	add	x17, x17, x16  // guest 0x15b3a0, sampled 0
6ead1f4144:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b3a0, sampled 0
6ead1f4148:    	and	w30, w23, #0xfffff003  // guest 0x15b3a0, sampled 0
6ead1f414c:    	cmp	w16, w30  // guest 0x15b3a0, sampled 0
6ead1f4150:    	b.ne	0x6ead1f47c8 <trace+0x888>  // guest 0x15b3a0, sampled 0
6ead1f4154:    	add	x30, x17, w23, uxtw  // guest 0x15b3a0, sampled 0
6ead1f4158:    	stlr	w21, [x30]  // guest 0x15b3a0, sampled 0
6ead1f415c:    	add	w21, w20, #0xa0  // guest 0x15b3a6, sampled 0
6ead1f4160:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3a6, sampled 0
6ead1f4164:    	and	x16, x16, x21, lsr #7  // guest 0x15b3a6, sampled 0
6ead1f4168:    	add	x17, x17, x16  // guest 0x15b3a6, sampled 0
6ead1f416c:    	ldp	x16, x17, [x17]  // guest 0x15b3a6, sampled 0
6ead1f4170:    	and	w30, w21, #0xfffff003  // guest 0x15b3a6, sampled 0
6ead1f4174:    	cmp	w16, w30  // guest 0x15b3a6, sampled 0
6ead1f4178:    	b.ne	0x6ead1f47f4 <trace+0x8b4>  // guest 0x15b3a6, sampled 0
6ead1f417c:    	add	x30, x17, w21, uxtw  // guest 0x15b3a6, sampled 0
6ead1f4180:    	ldapr	w21, [x30]  // guest 0x15b3a6, sampled 0
6ead1f4184:    	str	w21, [x19, #0x4]  // guest 0x15b3a6, sampled 0
6ead1f4188:    	add	w23, w22, #0xa0  // guest 0x15b3ac, sampled 0
6ead1f418c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3ac, sampled 0
6ead1f4190:    	and	x16, x16, x23, lsr #7  // guest 0x15b3ac, sampled 0
6ead1f4194:    	add	x17, x17, x16  // guest 0x15b3ac, sampled 0
6ead1f4198:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b3ac, sampled 0
6ead1f419c:    	and	w30, w23, #0xfffff003  // guest 0x15b3ac, sampled 0
6ead1f41a0:    	cmp	w16, w30  // guest 0x15b3ac, sampled 0
6ead1f41a4:    	b.ne	0x6ead1f4820 <trace+0x8e0>  // guest 0x15b3ac, sampled 0
6ead1f41a8:    	add	x30, x17, w23, uxtw  // guest 0x15b3ac, sampled 0
6ead1f41ac:    	stlr	w21, [x30]  // guest 0x15b3ac, sampled 0
6ead1f41b0:    	add	w21, w20, #0xa4  // guest 0x15b3b2, sampled 0
6ead1f41b4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3b2, sampled 0
6ead1f41b8:    	and	x16, x16, x21, lsr #7  // guest 0x15b3b2, sampled 0
6ead1f41bc:    	add	x17, x17, x16  // guest 0x15b3b2, sampled 0
6ead1f41c0:    	ldp	x16, x17, [x17]  // guest 0x15b3b2, sampled 0
6ead1f41c4:    	and	w30, w21, #0xfffff003  // guest 0x15b3b2, sampled 0
6ead1f41c8:    	cmp	w16, w30  // guest 0x15b3b2, sampled 0
6ead1f41cc:    	b.ne	0x6ead1f484c <trace+0x90c>  // guest 0x15b3b2, sampled 0
6ead1f41d0:    	add	x30, x17, w21, uxtw  // guest 0x15b3b2, sampled 0
6ead1f41d4:    	ldapr	w21, [x30]  // guest 0x15b3b2, sampled 0
6ead1f41d8:    	str	w21, [x19, #0x8]  // guest 0x15b3b2, sampled 0
6ead1f41dc:    	add	w23, w22, #0xa4  // guest 0x15b3b8, sampled 0
6ead1f41e0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3b8, sampled 0
6ead1f41e4:    	and	x16, x16, x23, lsr #7  // guest 0x15b3b8, sampled 0
6ead1f41e8:    	add	x17, x17, x16  // guest 0x15b3b8, sampled 0
6ead1f41ec:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b3b8, sampled 0
6ead1f41f0:    	and	w30, w23, #0xfffff003  // guest 0x15b3b8, sampled 0
6ead1f41f4:    	cmp	w16, w30  // guest 0x15b3b8, sampled 0
6ead1f41f8:    	b.ne	0x6ead1f4878 <trace+0x938>  // guest 0x15b3b8, sampled 0
6ead1f41fc:    	add	x30, x17, w23, uxtw  // guest 0x15b3b8, sampled 0
6ead1f4200:    	stlr	w21, [x30]  // guest 0x15b3b8, sampled 0
6ead1f4204:    	add	w21, w20, #0xa8  // guest 0x15b3be, sampled 0
6ead1f4208:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3be, sampled 0
6ead1f420c:    	and	x16, x16, x21, lsr #7  // guest 0x15b3be, sampled 0
6ead1f4210:    	add	x17, x17, x16  // guest 0x15b3be, sampled 0
6ead1f4214:    	ldp	x16, x17, [x17]  // guest 0x15b3be, sampled 0
6ead1f4218:    	and	w30, w21, #0xfffff003  // guest 0x15b3be, sampled 0
6ead1f421c:    	cmp	w16, w30  // guest 0x15b3be, sampled 0
6ead1f4220:    	b.ne	0x6ead1f48a4 <trace+0x964>  // guest 0x15b3be, sampled 0
6ead1f4224:    	add	x30, x17, w21, uxtw  // guest 0x15b3be, sampled 0
6ead1f4228:    	ldapr	w21, [x30]  // guest 0x15b3be, sampled 0
6ead1f422c:    	str	w21, [x19]  // guest 0x15b3be, sampled 0
6ead1f4230:    	add	w23, w22, #0xa8  // guest 0x15b3c4, sampled 0
6ead1f4234:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3c4, sampled 0
6ead1f4238:    	and	x16, x16, x23, lsr #7  // guest 0x15b3c4, sampled 0
6ead1f423c:    	add	x17, x17, x16  // guest 0x15b3c4, sampled 0
6ead1f4240:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b3c4, sampled 0
6ead1f4244:    	and	w30, w23, #0xfffff003  // guest 0x15b3c4, sampled 0
6ead1f4248:    	cmp	w16, w30  // guest 0x15b3c4, sampled 0
6ead1f424c:    	b.ne	0x6ead1f48d0 <trace+0x990>  // guest 0x15b3c4, sampled 0
6ead1f4250:    	add	x30, x17, w23, uxtw  // guest 0x15b3c4, sampled 0
6ead1f4254:    	stlr	w21, [x30]  // guest 0x15b3c4, sampled 0
6ead1f4258:    	add	w21, w20, #0xac  // guest 0x15b3ca, sampled 0
6ead1f425c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3ca, sampled 0
6ead1f4260:    	and	x16, x16, x21, lsr #7  // guest 0x15b3ca, sampled 0
6ead1f4264:    	add	x17, x17, x16  // guest 0x15b3ca, sampled 0
6ead1f4268:    	ldp	x16, x17, [x17]  // guest 0x15b3ca, sampled 0
6ead1f426c:    	and	w30, w21, #0xfffff003  // guest 0x15b3ca, sampled 0
6ead1f4270:    	cmp	w16, w30  // guest 0x15b3ca, sampled 0
6ead1f4274:    	b.ne	0x6ead1f48fc <trace+0x9bc>  // guest 0x15b3ca, sampled 0
6ead1f4278:    	add	x30, x17, w21, uxtw  // guest 0x15b3ca, sampled 0
6ead1f427c:    	ldapr	w21, [x30]  // guest 0x15b3ca, sampled 0
6ead1f4280:    	str	w21, [x19, #0x4]  // guest 0x15b3ca, sampled 0
6ead1f4284:    	add	w23, w22, #0xac  // guest 0x15b3d0, sampled 0
6ead1f4288:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3d0, sampled 0
6ead1f428c:    	and	x16, x16, x23, lsr #7  // guest 0x15b3d0, sampled 0
6ead1f4290:    	add	x17, x17, x16  // guest 0x15b3d0, sampled 0
6ead1f4294:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b3d0, sampled 0
6ead1f4298:    	and	w30, w23, #0xfffff003  // guest 0x15b3d0, sampled 0
6ead1f429c:    	cmp	w16, w30  // guest 0x15b3d0, sampled 0
6ead1f42a0:    	b.ne	0x6ead1f4928 <trace+0x9e8>  // guest 0x15b3d0, sampled 0
6ead1f42a4:    	add	x30, x17, w23, uxtw  // guest 0x15b3d0, sampled 0
6ead1f42a8:    	stlr	w21, [x30]  // guest 0x15b3d0, sampled 0
6ead1f42ac:    	add	w21, w20, #0xb0  // guest 0x15b3d6, sampled 0
6ead1f42b0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3d6, sampled 0
6ead1f42b4:    	and	x16, x16, x21, lsr #7  // guest 0x15b3d6, sampled 0
6ead1f42b8:    	add	x17, x17, x16  // guest 0x15b3d6, sampled 0
6ead1f42bc:    	ldp	x16, x17, [x17]  // guest 0x15b3d6, sampled 0
6ead1f42c0:    	and	w30, w21, #0xfffff003  // guest 0x15b3d6, sampled 0
6ead1f42c4:    	cmp	w16, w30  // guest 0x15b3d6, sampled 0
6ead1f42c8:    	b.ne	0x6ead1f4954 <trace+0xa14>  // guest 0x15b3d6, sampled 0
6ead1f42cc:    	add	x30, x17, w21, uxtw  // guest 0x15b3d6, sampled 0
6ead1f42d0:    	ldapr	w21, [x30]  // guest 0x15b3d6, sampled 0
6ead1f42d4:    	str	w21, [x19, #0x8]  // guest 0x15b3d6, sampled 0
6ead1f42d8:    	add	w23, w22, #0xb0  // guest 0x15b3dc, sampled 0
6ead1f42dc:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3dc, sampled 0
6ead1f42e0:    	and	x16, x16, x23, lsr #7  // guest 0x15b3dc, sampled 0
6ead1f42e4:    	add	x17, x17, x16  // guest 0x15b3dc, sampled 0
6ead1f42e8:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b3dc, sampled 0
6ead1f42ec:    	and	w30, w23, #0xfffff003  // guest 0x15b3dc, sampled 0
6ead1f42f0:    	cmp	w16, w30  // guest 0x15b3dc, sampled 0
6ead1f42f4:    	b.ne	0x6ead1f4980 <trace+0xa40>  // guest 0x15b3dc, sampled 0
6ead1f42f8:    	add	x30, x17, w23, uxtw  // guest 0x15b3dc, sampled 0
6ead1f42fc:    	stlr	w21, [x30]  // guest 0x15b3dc, sampled 0
6ead1f4300:    	add	w21, w20, #0xb4  // guest 0x15b3e2, sampled 0
6ead1f4304:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3e2, sampled 0
6ead1f4308:    	and	x16, x16, x21, lsr #7  // guest 0x15b3e2, sampled 0
6ead1f430c:    	add	x17, x17, x16  // guest 0x15b3e2, sampled 0
6ead1f4310:    	ldp	x16, x17, [x17]  // guest 0x15b3e2, sampled 0
6ead1f4314:    	and	w30, w21, #0xfffff003  // guest 0x15b3e2, sampled 0
6ead1f4318:    	cmp	w16, w30  // guest 0x15b3e2, sampled 0
6ead1f431c:    	b.ne	0x6ead1f49ac <trace+0xa6c>  // guest 0x15b3e2, sampled 0
6ead1f4320:    	add	x30, x17, w21, uxtw  // guest 0x15b3e2, sampled 0
6ead1f4324:    	ldapr	w21, [x30]  // guest 0x15b3e2, sampled 0
6ead1f4328:    	str	w21, [x19]  // guest 0x15b3e2, sampled 0
6ead1f432c:    	add	w23, w22, #0xb4  // guest 0x15b3e8, sampled 0
6ead1f4330:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3e8, sampled 0
6ead1f4334:    	and	x16, x16, x23, lsr #7  // guest 0x15b3e8, sampled 0
6ead1f4338:    	add	x17, x17, x16  // guest 0x15b3e8, sampled 0
6ead1f433c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b3e8, sampled 0
6ead1f4340:    	and	w30, w23, #0xfffff003  // guest 0x15b3e8, sampled 0
6ead1f4344:    	cmp	w16, w30  // guest 0x15b3e8, sampled 0
6ead1f4348:    	b.ne	0x6ead1f49d8 <trace+0xa98>  // guest 0x15b3e8, sampled 0
6ead1f434c:    	add	x30, x17, w23, uxtw  // guest 0x15b3e8, sampled 0
6ead1f4350:    	stlr	w21, [x30]  // guest 0x15b3e8, sampled 0
6ead1f4354:    	add	w21, w20, #0xb8  // guest 0x15b3ee, sampled 0
6ead1f4358:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3ee, sampled 0
6ead1f435c:    	and	x16, x16, x21, lsr #7  // guest 0x15b3ee, sampled 0
6ead1f4360:    	add	x17, x17, x16  // guest 0x15b3ee, sampled 0
6ead1f4364:    	ldp	x16, x17, [x17]  // guest 0x15b3ee, sampled 0
6ead1f4368:    	and	w30, w21, #0xfffff003  // guest 0x15b3ee, sampled 0
6ead1f436c:    	cmp	w16, w30  // guest 0x15b3ee, sampled 0
6ead1f4370:    	b.ne	0x6ead1f4a04 <trace+0xac4>  // guest 0x15b3ee, sampled 0
6ead1f4374:    	add	x30, x17, w21, uxtw  // guest 0x15b3ee, sampled 0
6ead1f4378:    	ldapr	w21, [x30]  // guest 0x15b3ee, sampled 0
6ead1f437c:    	str	w21, [x19, #0x4]  // guest 0x15b3ee, sampled 0
6ead1f4380:    	add	w23, w22, #0xb8  // guest 0x15b3f4, sampled 0
6ead1f4384:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3f4, sampled 0
6ead1f4388:    	and	x16, x16, x23, lsr #7  // guest 0x15b3f4, sampled 0
6ead1f438c:    	add	x17, x17, x16  // guest 0x15b3f4, sampled 0
6ead1f4390:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b3f4, sampled 0
6ead1f4394:    	and	w30, w23, #0xfffff003  // guest 0x15b3f4, sampled 0
6ead1f4398:    	cmp	w16, w30  // guest 0x15b3f4, sampled 0
6ead1f439c:    	b.ne	0x6ead1f4a30 <trace+0xaf0>  // guest 0x15b3f4, sampled 0
6ead1f43a0:    	add	x30, x17, w23, uxtw  // guest 0x15b3f4, sampled 0
6ead1f43a4:    	stlr	w21, [x30]  // guest 0x15b3f4, sampled 0
6ead1f43a8:    	add	w21, w20, #0xbc  // guest 0x15b3fa, sampled 0
6ead1f43ac:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b3fa, sampled 0
6ead1f43b0:    	and	x16, x16, x21, lsr #7  // guest 0x15b3fa, sampled 0
6ead1f43b4:    	add	x17, x17, x16  // guest 0x15b3fa, sampled 0
6ead1f43b8:    	ldp	x16, x17, [x17]  // guest 0x15b3fa, sampled 0
6ead1f43bc:    	and	w30, w21, #0xfffff003  // guest 0x15b3fa, sampled 0
6ead1f43c0:    	cmp	w16, w30  // guest 0x15b3fa, sampled 0
6ead1f43c4:    	b.ne	0x6ead1f4a5c <trace+0xb1c>  // guest 0x15b3fa, sampled 0
6ead1f43c8:    	add	x30, x17, w21, uxtw  // guest 0x15b3fa, sampled 0
6ead1f43cc:    	ldapr	w21, [x30]  // guest 0x15b3fa, sampled 0
6ead1f43d0:    	str	w21, [x19, #0x8]  // guest 0x15b3fa, sampled 0
6ead1f43d4:    	add	w23, w22, #0xbc  // guest 0x15b400, sampled 0
6ead1f43d8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b400, sampled 0
6ead1f43dc:    	and	x16, x16, x23, lsr #7  // guest 0x15b400, sampled 0
6ead1f43e0:    	add	x17, x17, x16  // guest 0x15b400, sampled 0
6ead1f43e4:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b400, sampled 0
6ead1f43e8:    	and	w30, w23, #0xfffff003  // guest 0x15b400, sampled 0
6ead1f43ec:    	cmp	w16, w30  // guest 0x15b400, sampled 0
6ead1f43f0:    	b.ne	0x6ead1f4a88 <trace+0xb48>  // guest 0x15b400, sampled 0
6ead1f43f4:    	add	x30, x17, w23, uxtw  // guest 0x15b400, sampled 0
6ead1f43f8:    	stlr	w21, [x30]  // guest 0x15b400, sampled 0
6ead1f43fc:    	add	w21, w20, #0xc0  // guest 0x15b406, sampled 0
6ead1f4400:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b406, sampled 0
6ead1f4404:    	and	x16, x16, x21, lsr #7  // guest 0x15b406, sampled 0
6ead1f4408:    	add	x17, x17, x16  // guest 0x15b406, sampled 0
6ead1f440c:    	ldp	x16, x17, [x17]  // guest 0x15b406, sampled 0
6ead1f4410:    	and	w30, w21, #0xfffff003  // guest 0x15b406, sampled 0
6ead1f4414:    	cmp	w16, w30  // guest 0x15b406, sampled 0
6ead1f4418:    	b.ne	0x6ead1f4ab4 <trace+0xb74>  // guest 0x15b406, sampled 0
6ead1f441c:    	add	x30, x17, w21, uxtw  // guest 0x15b406, sampled 0
6ead1f4420:    	ldapr	w21, [x30]  // guest 0x15b406, sampled 0
6ead1f4424:    	str	w21, [x19]  // guest 0x15b406, sampled 0
6ead1f4428:    	add	w23, w22, #0xc0  // guest 0x15b40c, sampled 0
6ead1f442c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b40c, sampled 0
6ead1f4430:    	and	x16, x16, x23, lsr #7  // guest 0x15b40c, sampled 0
6ead1f4434:    	add	x17, x17, x16  // guest 0x15b40c, sampled 0
6ead1f4438:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b40c, sampled 0
6ead1f443c:    	and	w30, w23, #0xfffff003  // guest 0x15b40c, sampled 0
6ead1f4440:    	cmp	w16, w30  // guest 0x15b40c, sampled 0
6ead1f4444:    	b.ne	0x6ead1f4ae0 <trace+0xba0>  // guest 0x15b40c, sampled 0
6ead1f4448:    	add	x30, x17, w23, uxtw  // guest 0x15b40c, sampled 0
6ead1f444c:    	stlr	w21, [x30]  // guest 0x15b40c, sampled 0
6ead1f4450:    	add	w20, w20, #0xd0  // guest 0x15b412, sampled 0
6ead1f4454:    	str	w20, [x19, #0x18]  // guest 0x15b412, sampled 0
6ead1f4458:    	str	w20, [x19, #0x28]  // guest 0x15b412, sampled 0
6ead1f445c:    	mov	w20, #0xd0              // =208  // guest 0x15b412, sampled 0
6ead1f4460:    	str	w20, [x19, #0x2c]  // guest 0x15b412, sampled 0
6ead1f4464:    	add	w20, w22, #0xd0  // guest 0x15b418, sampled 0
6ead1f4468:    	str	w20, [sp, #0x80]  // guest 0x15b418, sampled 0
6ead1f446c:    	str	w20, [x19, #0x1c]  // guest 0x15b418, sampled 0
6ead1f4470:    	mov	w20, #0xb0              // =176  // guest 0x15b41e, sampled 0
6ead1f4474:    	str	w20, [sp, #0x84]  // guest 0x15b41e, sampled 0
6ead1f4478:    	mov	w20, #0xb0              // =176  // guest 0x15b41e, sampled 0
6ead1f447c:    	str	w20, [x19, #0x4]  // guest 0x15b41e, sampled 0
6ead1f4480:    	mov	w20, #0x1               // =1  // guest 0x15b41e, sampled 0
6ead1f4484:    	sturb	w20, [x19, #-0xc]  // guest 0x15b41e, sampled 0
6ead1f4488:    	ldr	w20, [x19, #0x38]  // guest 0x15b423, sampled 0
6ead1f448c:    	lsl	w20, w20, #2  // guest 0x15b423, sampled 0
6ead1f4490:    	str	w20, [sp, #0x88]  // guest 0x15b423, sampled 0
6ead1f4494:    	mov	w20, #0xa               // =10  // guest 0x15b423, sampled 0
6ead1f4498:    	str	w20, [x19, #0x34]  // guest 0x15b423, sampled 0
6ead1f449c:    	mov	w20, #0xaf              // =175  // guest 0x15b423, sampled 0
6ead1f44a0:    	str	w20, [sp, #0x8c]  // guest 0x15b423, sampled 0
6ead1f44a4:    	ldr	w20, [x19, #0x18]  // guest 0x15b423, sampled 1
6ead1f44a8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b423, sampled 0
6ead1f44ac:    	and	x16, x16, x20, lsr #7  // guest 0x15b423, sampled 0
6ead1f44b0:    	add	x17, x17, x16  // guest 0x15b423, sampled 0
6ead1f44b4:    	ldp	x16, x17, [x17]  // guest 0x15b423, sampled 0
6ead1f44b8:    	and	w30, w20, #0xfffff003  // guest 0x15b423, sampled 8
6ead1f44bc:    	cmp	w16, w30  // guest 0x15b423, sampled 0
6ead1f44c0:    	b.ne	0x6ead1f4b0c <trace+0xbcc>  // guest 0x15b423, sampled 0
6ead1f44c4:    	add	x30, x17, w20, uxtw  // guest 0x15b423, sampled 4
6ead1f44c8:    	ldapr	w21, [x30]  // guest 0x15b423, sampled 0
6ead1f44cc:    	str	w21, [sp, #0x84]  // guest 0x15b423, sampled 9
6ead1f44d0:    	ldr	w22, [x19, #0x1c]  // guest 0x15b423, sampled 0
6ead1f44d4:    	str	w22, [sp, #0x80]  // guest 0x15b423, sampled 0
6ead1f44d8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b423, sampled 0
6ead1f44dc:    	and	x16, x16, x22, lsr #7  // guest 0x15b423, sampled 0
6ead1f44e0:    	add	x17, x17, x16  // guest 0x15b423, sampled 0
6ead1f44e4:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b423, sampled 0
6ead1f44e8:    	and	w30, w22, #0xfffff003  // guest 0x15b423, sampled 0
6ead1f44ec:    	cmp	w16, w30  // guest 0x15b423, sampled 2
6ead1f44f0:    	b.ne	0x6ead1f4b38 <trace+0xbf8>  // guest 0x15b423, sampled 0
6ead1f44f4:    	add	x30, x17, w22, uxtw  // guest 0x15b423, sampled 0
6ead1f44f8:    	stlr	w21, [x30]  // guest 0x15b423, sampled 0
6ead1f44fc:    	ldr	w21, [sp, #0x88]  // guest 0x15b423, sampled 0
6ead1f4500:    	add	w20, w20, w21  // guest 0x15b423, sampled 1
6ead1f4504:    	str	w20, [x19, #0x18]  // guest 0x15b423, sampled 0
6ead1f4508:    	add	w20, w22, w21  // guest 0x15b423, sampled 0
6ead1f450c:    	str	w20, [x19, #0x1c]  // guest 0x15b423, sampled 0
6ead1f4510:    	ldr	w20, [sp, #0x8c]  // guest 0x15b423, sampled 1
6ead1f4514:    	str	w20, [x19, #0x4]  // guest 0x15b423, sampled 3
6ead1f4518:    	sub	w20, w20, #0x1  // guest 0x15b423, sampled 0
6ead1f451c:    	str	w20, [sp, #0x8c]  // guest 0x15b423, sampled 0
6ead1f4520:    	tst	w20, #0xffff  // guest 0x15b423, sampled 0
6ead1f4524:    	b.ne	0x6ead1f44a4 <trace+0x564>  // guest 0x15b423, sampled 0
6ead1f4528:    	cbz	w20, 0x6ead1f4554 <trace+0x614>  // guest 0x15b423, sampled 0
6ead1f452c:    	ldr	w20, [x19, #0x24]  // guest 0x15b423, sampled 0
6ead1f4530:    	orr	w20, w20, #0x10000  // guest 0x15b423, sampled 0
6ead1f4534:    	str	w20, [x19, #0x24]  // guest 0x15b423, sampled 0
6ead1f4538:    	b	0x6ead1f4538 <trace+0x5f8>  // guest 0x15b423, sampled 0
6ead1f453c:    	br	x16  // guest 0x15b423, sampled 0
6ead1f4540:    	mov	w20, #0xb423            // =46115  // guest 0x15b423, sampled 0
6ead1f4544:    	movk	w20, #0x15, lsl #16  // guest 0x15b423, sampled 0
6ead1f4548:    	str	w20, [x19, #0x20]  // guest 0x15b423, sampled 0
6ead1f454c:    	adr	x0, 0x6ead1f3e80 <trace+0xffffffffffffff40>  // guest 0x15b423, sampled 0
6ead1f4550:    	b	0x6ea842202c <trace+0xfffffffffb22e0ec>  // guest 0x15b423, sampled 0
6ead1f4554:    	ldr	w20, [x19, #0x18]  // guest 0x15b423, sampled 0
6ead1f4558:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b423, sampled 0
6ead1f455c:    	and	x16, x16, x20, lsr #7  // guest 0x15b423, sampled 0
6ead1f4560:    	add	x17, x17, x16  // guest 0x15b423, sampled 0
6ead1f4564:    	ldp	x16, x17, [x17]  // guest 0x15b423, sampled 0
6ead1f4568:    	and	w30, w20, #0xfffff003  // guest 0x15b423, sampled 0
6ead1f456c:    	cmp	w16, w30  // guest 0x15b423, sampled 0
6ead1f4570:    	b.ne	0x6ead1f4b64 <trace+0xc24>  // guest 0x15b423, sampled 0
6ead1f4574:    	add	x30, x17, w20, uxtw  // guest 0x15b423, sampled 0
6ead1f4578:    	ldapr	w21, [x30]  // guest 0x15b423, sampled 0
6ead1f457c:    	ldr	w22, [x19, #0x1c]  // guest 0x15b423, sampled 0
6ead1f4580:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x15b423, sampled 0
6ead1f4584:    	and	x16, x16, x22, lsr #7  // guest 0x15b423, sampled 0
6ead1f4588:    	add	x17, x17, x16  // guest 0x15b423, sampled 0
6ead1f458c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x15b423, sampled 0
6ead1f4590:    	and	w30, w22, #0xfffff003  // guest 0x15b423, sampled 0
6ead1f4594:    	cmp	w16, w30  // guest 0x15b423, sampled 0
6ead1f4598:    	b.ne	0x6ead1f4b90 <trace+0xc50>  // guest 0x15b423, sampled 0
6ead1f459c:    	add	x30, x17, w22, uxtw  // guest 0x15b423, sampled 0
6ead1f45a0:    	stlr	w21, [x30]  // guest 0x15b423, sampled 0
6ead1f45a4:    	ldr	w21, [sp, #0x88]  // guest 0x15b423, sampled 0
6ead1f45a8:    	add	w20, w20, w21  // guest 0x15b423, sampled 0
6ead1f45ac:    	str	w20, [x19, #0x18]  // guest 0x15b423, sampled 0
6ead1f45b0:    	add	w20, w22, w21  // guest 0x15b423, sampled 0
6ead1f45b4:    	str	w20, [x19, #0x1c]  // guest 0x15b423, sampled 0
6ead1f45b8:    	ldr	w20, [sp, #0x8c]  // guest 0x15b423, sampled 0
6ead1f45bc:    	str	w20, [x19, #0x4]  // guest 0x15b423, sampled 0
6ead1f45c0:    	b	0x6ead1f45c0 <trace+0x680>  // guest 0x15b423, sampled 0
6ead1f45c4:    	br	x16  // guest 0x15b423, sampled 0
6ead1f45c8:    	mov	w20, #0xb425            // =46117  // guest 0x15b423, sampled 0
6ead1f45cc:    	movk	w20, #0x15, lsl #16  // guest 0x15b423, sampled 0
6ead1f45d0:    	str	w20, [x19, #0x20]  // guest 0x15b423, sampled 0
6ead1f45d4:    	adr	x0, 0x6ead1f3e81 <trace+0xffffffffffffff41>  // guest 0x15b423, sampled 0
6ead1f45d8:    	b	0x6ea842202c <trace+0xfffffffffb22e0ec>  // guest 0x15b423, sampled 0
6ead1f45dc:    	adr	x0, 0x6ead1f3e83 <trace+0xffffffffffffff43>  // guest 0x15b423, sampled 0
6ead1f45e0:    	b	0x6ea842202c <trace+0xfffffffffb22e0ec>  // guest 0x15b423, sampled 0
6ead1f45e4:    	mov	w1, w21
6ead1f45e8:    	mov	x0, x19
6ead1f45ec:    	mov	w2, #0x4045             // =16453
6ead1f45f0:    	movk	w2, #0x1, lsl #16
6ead1f45f4:    	adr	x3, 0x6ead1f3f78 <trace+0x38>
6ead1f45f8:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f45fc:    	add	x16, x16, #0x58
6ead1f4600:    	blr	x16
6ead1f4604:    	mov	w21, w0
6ead1f4608:    	dmb	ishld
6ead1f460c:    	b	0x6ead1f3f78 <trace+0x38>
6ead1f4610:    	mov	w1, w23
6ead1f4614:    	mov	w2, w21
6ead1f4618:    	mov	x0, x19
6ead1f461c:    	mov	w3, #0x4045             // =16453
6ead1f4620:    	movk	w3, #0x1, lsl #16
6ead1f4624:    	adr	x4, 0x6ead1f3fa8 <trace+0x68>
6ead1f4628:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f462c:    	add	x16, x16, #0xc38
6ead1f4630:    	blr	x16
6ead1f4634:    	dmb	ishld
6ead1f4638:    	b	0x6ead1f3fa8 <trace+0x68>
6ead1f463c:    	mov	w1, w21
6ead1f4640:    	mov	x0, x19
6ead1f4644:    	mov	w2, #0x4045             // =16453
6ead1f4648:    	movk	w2, #0x1, lsl #16
6ead1f464c:    	adr	x3, 0x6ead1f3fd0 <trace+0x90>
6ead1f4650:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f4654:    	add	x16, x16, #0x58
6ead1f4658:    	blr	x16
6ead1f465c:    	mov	w21, w0
6ead1f4660:    	dmb	ishld
6ead1f4664:    	b	0x6ead1f3fd0 <trace+0x90>
6ead1f4668:    	mov	w1, w23
6ead1f466c:    	mov	w2, w21
6ead1f4670:    	mov	x0, x19
6ead1f4674:    	mov	w3, #0x4045             // =16453
6ead1f4678:    	movk	w3, #0x1, lsl #16
6ead1f467c:    	adr	x4, 0x6ead1f3ffc <trace+0xbc>
6ead1f4680:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f4684:    	add	x16, x16, #0xc38
6ead1f4688:    	blr	x16
6ead1f468c:    	dmb	ishld
6ead1f4690:    	b	0x6ead1f3ffc <trace+0xbc>
6ead1f4694:    	mov	w1, w21
6ead1f4698:    	mov	x0, x19
6ead1f469c:    	mov	w2, #0x5c05             // =23557
6ead1f46a0:    	movk	w2, #0x1, lsl #16
6ead1f46a4:    	adr	x3, 0x6ead1f4024 <trace+0xe4>
6ead1f46a8:    	adrp	x16, 0x6efc87c000 <trace+0x4f688000>
6ead1f46ac:    	add	x16, x16, #0xcec
6ead1f46b0:    	blr	x16
6ead1f46b4:    	mov	w21, w0
6ead1f46b8:    	dmb	ishld
6ead1f46bc:    	b	0x6ead1f4024 <trace+0xe4>
6ead1f46c0:    	mov	w1, w23
6ead1f46c4:    	mov	w2, w21
6ead1f46c8:    	mov	x0, x19
6ead1f46cc:    	mov	w3, #0x5c05             // =23557
6ead1f46d0:    	movk	w3, #0x1, lsl #16
6ead1f46d4:    	adr	x4, 0x6ead1f4060 <trace+0x120>
6ead1f46d8:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f46dc:    	add	x16, x16, #0x900
6ead1f46e0:    	blr	x16
6ead1f46e4:    	dmb	ishld
6ead1f46e8:    	b	0x6ead1f4060 <trace+0x120>
6ead1f46ec:    	mov	w1, w21
6ead1f46f0:    	mov	x0, x19
6ead1f46f4:    	mov	w2, #0x4045             // =16453
6ead1f46f8:    	movk	w2, #0x1, lsl #16
6ead1f46fc:    	adr	x3, 0x6ead1f4088 <trace+0x148>
6ead1f4700:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f4704:    	add	x16, x16, #0x58
6ead1f4708:    	blr	x16
6ead1f470c:    	mov	w21, w0
6ead1f4710:    	dmb	ishld
6ead1f4714:    	b	0x6ead1f4088 <trace+0x148>
6ead1f4718:    	mov	w1, w23
6ead1f471c:    	mov	w2, w21
6ead1f4720:    	mov	x0, x19
6ead1f4724:    	mov	w3, #0x4045             // =16453
6ead1f4728:    	movk	w3, #0x1, lsl #16
6ead1f472c:    	adr	x4, 0x6ead1f40b4 <trace+0x174>
6ead1f4730:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f4734:    	add	x16, x16, #0xc38
6ead1f4738:    	blr	x16
6ead1f473c:    	dmb	ishld
6ead1f4740:    	b	0x6ead1f40b4 <trace+0x174>
6ead1f4744:    	mov	w1, w21
6ead1f4748:    	mov	x0, x19
6ead1f474c:    	mov	w2, #0x4045             // =16453
6ead1f4750:    	movk	w2, #0x1, lsl #16
6ead1f4754:    	adr	x3, 0x6ead1f40dc <trace+0x19c>
6ead1f4758:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f475c:    	add	x16, x16, #0x58
6ead1f4760:    	blr	x16
6ead1f4764:    	mov	w21, w0
6ead1f4768:    	dmb	ishld
6ead1f476c:    	b	0x6ead1f40dc <trace+0x19c>
6ead1f4770:    	mov	w1, w23
6ead1f4774:    	mov	w2, w21
6ead1f4778:    	mov	x0, x19
6ead1f477c:    	mov	w3, #0x4045             // =16453
6ead1f4780:    	movk	w3, #0x1, lsl #16
6ead1f4784:    	adr	x4, 0x6ead1f4108 <trace+0x1c8>
6ead1f4788:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f478c:    	add	x16, x16, #0xc38
6ead1f4790:    	blr	x16
6ead1f4794:    	dmb	ishld
6ead1f4798:    	b	0x6ead1f4108 <trace+0x1c8>
6ead1f479c:    	mov	w1, w21
6ead1f47a0:    	mov	x0, x19
6ead1f47a4:    	mov	w2, #0x4045             // =16453
6ead1f47a8:    	movk	w2, #0x1, lsl #16
6ead1f47ac:    	adr	x3, 0x6ead1f4130 <trace+0x1f0>
6ead1f47b0:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f47b4:    	add	x16, x16, #0x58
6ead1f47b8:    	blr	x16
6ead1f47bc:    	mov	w21, w0
6ead1f47c0:    	dmb	ishld
6ead1f47c4:    	b	0x6ead1f4130 <trace+0x1f0>
6ead1f47c8:    	mov	w1, w23
6ead1f47cc:    	mov	w2, w21
6ead1f47d0:    	mov	x0, x19
6ead1f47d4:    	mov	w3, #0x4045             // =16453
6ead1f47d8:    	movk	w3, #0x1, lsl #16
6ead1f47dc:    	adr	x4, 0x6ead1f415c <trace+0x21c>
6ead1f47e0:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f47e4:    	add	x16, x16, #0xc38
6ead1f47e8:    	blr	x16
6ead1f47ec:    	dmb	ishld
6ead1f47f0:    	b	0x6ead1f415c <trace+0x21c>
6ead1f47f4:    	mov	w1, w21
6ead1f47f8:    	mov	x0, x19
6ead1f47fc:    	mov	w2, #0x4045             // =16453
6ead1f4800:    	movk	w2, #0x1, lsl #16
6ead1f4804:    	adr	x3, 0x6ead1f4184 <trace+0x244>
6ead1f4808:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f480c:    	add	x16, x16, #0x58
6ead1f4810:    	blr	x16
6ead1f4814:    	mov	w21, w0
6ead1f4818:    	dmb	ishld
6ead1f481c:    	b	0x6ead1f4184 <trace+0x244>
6ead1f4820:    	mov	w1, w23
6ead1f4824:    	mov	w2, w21
6ead1f4828:    	mov	x0, x19
6ead1f482c:    	mov	w3, #0x4045             // =16453
6ead1f4830:    	movk	w3, #0x1, lsl #16
6ead1f4834:    	adr	x4, 0x6ead1f41b0 <trace+0x270>
6ead1f4838:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f483c:    	add	x16, x16, #0xc38
6ead1f4840:    	blr	x16
6ead1f4844:    	dmb	ishld
6ead1f4848:    	b	0x6ead1f41b0 <trace+0x270>
6ead1f484c:    	mov	w1, w21
6ead1f4850:    	mov	x0, x19
6ead1f4854:    	mov	w2, #0x4045             // =16453
6ead1f4858:    	movk	w2, #0x1, lsl #16
6ead1f485c:    	adr	x3, 0x6ead1f41d8 <trace+0x298>
6ead1f4860:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f4864:    	add	x16, x16, #0x58
6ead1f4868:    	blr	x16
6ead1f486c:    	mov	w21, w0
6ead1f4870:    	dmb	ishld
6ead1f4874:    	b	0x6ead1f41d8 <trace+0x298>
6ead1f4878:    	mov	w1, w23
6ead1f487c:    	mov	w2, w21
6ead1f4880:    	mov	x0, x19
6ead1f4884:    	mov	w3, #0x4045             // =16453
6ead1f4888:    	movk	w3, #0x1, lsl #16
6ead1f488c:    	adr	x4, 0x6ead1f4204 <trace+0x2c4>
6ead1f4890:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f4894:    	add	x16, x16, #0xc38
6ead1f4898:    	blr	x16
6ead1f489c:    	dmb	ishld
6ead1f48a0:    	b	0x6ead1f4204 <trace+0x2c4>
6ead1f48a4:    	mov	w1, w21
6ead1f48a8:    	mov	x0, x19
6ead1f48ac:    	mov	w2, #0x4045             // =16453
6ead1f48b0:    	movk	w2, #0x1, lsl #16
6ead1f48b4:    	adr	x3, 0x6ead1f422c <trace+0x2ec>
6ead1f48b8:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f48bc:    	add	x16, x16, #0x58
6ead1f48c0:    	blr	x16
6ead1f48c4:    	mov	w21, w0
6ead1f48c8:    	dmb	ishld
6ead1f48cc:    	b	0x6ead1f422c <trace+0x2ec>
6ead1f48d0:    	mov	w1, w23
6ead1f48d4:    	mov	w2, w21
6ead1f48d8:    	mov	x0, x19
6ead1f48dc:    	mov	w3, #0x4045             // =16453
6ead1f48e0:    	movk	w3, #0x1, lsl #16
6ead1f48e4:    	adr	x4, 0x6ead1f4258 <trace+0x318>
6ead1f48e8:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f48ec:    	add	x16, x16, #0xc38
6ead1f48f0:    	blr	x16
6ead1f48f4:    	dmb	ishld
6ead1f48f8:    	b	0x6ead1f4258 <trace+0x318>
6ead1f48fc:    	mov	w1, w21
6ead1f4900:    	mov	x0, x19
6ead1f4904:    	mov	w2, #0x4045             // =16453
6ead1f4908:    	movk	w2, #0x1, lsl #16
6ead1f490c:    	adr	x3, 0x6ead1f4280 <trace+0x340>
6ead1f4910:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f4914:    	add	x16, x16, #0x58
6ead1f4918:    	blr	x16
6ead1f491c:    	mov	w21, w0
6ead1f4920:    	dmb	ishld
6ead1f4924:    	b	0x6ead1f4280 <trace+0x340>
6ead1f4928:    	mov	w1, w23
6ead1f492c:    	mov	w2, w21
6ead1f4930:    	mov	x0, x19
6ead1f4934:    	mov	w3, #0x4045             // =16453
6ead1f4938:    	movk	w3, #0x1, lsl #16
6ead1f493c:    	adr	x4, 0x6ead1f42ac <trace+0x36c>
6ead1f4940:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f4944:    	add	x16, x16, #0xc38
6ead1f4948:    	blr	x16
6ead1f494c:    	dmb	ishld
6ead1f4950:    	b	0x6ead1f42ac <trace+0x36c>
6ead1f4954:    	mov	w1, w21
6ead1f4958:    	mov	x0, x19
6ead1f495c:    	mov	w2, #0x4045             // =16453
6ead1f4960:    	movk	w2, #0x1, lsl #16
6ead1f4964:    	adr	x3, 0x6ead1f42d4 <trace+0x394>
6ead1f4968:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f496c:    	add	x16, x16, #0x58
6ead1f4970:    	blr	x16
6ead1f4974:    	mov	w21, w0
6ead1f4978:    	dmb	ishld
6ead1f497c:    	b	0x6ead1f42d4 <trace+0x394>
6ead1f4980:    	mov	w1, w23
6ead1f4984:    	mov	w2, w21
6ead1f4988:    	mov	x0, x19
6ead1f498c:    	mov	w3, #0x4045             // =16453
6ead1f4990:    	movk	w3, #0x1, lsl #16
6ead1f4994:    	adr	x4, 0x6ead1f4300 <trace+0x3c0>
6ead1f4998:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f499c:    	add	x16, x16, #0xc38
6ead1f49a0:    	blr	x16
6ead1f49a4:    	dmb	ishld
6ead1f49a8:    	b	0x6ead1f4300 <trace+0x3c0>
6ead1f49ac:    	mov	w1, w21
6ead1f49b0:    	mov	x0, x19
6ead1f49b4:    	mov	w2, #0x4045             // =16453
6ead1f49b8:    	movk	w2, #0x1, lsl #16
6ead1f49bc:    	adr	x3, 0x6ead1f4328 <trace+0x3e8>
6ead1f49c0:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f49c4:    	add	x16, x16, #0x58
6ead1f49c8:    	blr	x16
6ead1f49cc:    	mov	w21, w0
6ead1f49d0:    	dmb	ishld
6ead1f49d4:    	b	0x6ead1f4328 <trace+0x3e8>
6ead1f49d8:    	mov	w1, w23
6ead1f49dc:    	mov	w2, w21
6ead1f49e0:    	mov	x0, x19
6ead1f49e4:    	mov	w3, #0x4045             // =16453
6ead1f49e8:    	movk	w3, #0x1, lsl #16
6ead1f49ec:    	adr	x4, 0x6ead1f4354 <trace+0x414>
6ead1f49f0:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f49f4:    	add	x16, x16, #0xc38
6ead1f49f8:    	blr	x16
6ead1f49fc:    	dmb	ishld
6ead1f4a00:    	b	0x6ead1f4354 <trace+0x414>
6ead1f4a04:    	mov	w1, w21
6ead1f4a08:    	mov	x0, x19
6ead1f4a0c:    	mov	w2, #0x4045             // =16453
6ead1f4a10:    	movk	w2, #0x1, lsl #16
6ead1f4a14:    	adr	x3, 0x6ead1f437c <trace+0x43c>
6ead1f4a18:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f4a1c:    	add	x16, x16, #0x58
6ead1f4a20:    	blr	x16
6ead1f4a24:    	mov	w21, w0
6ead1f4a28:    	dmb	ishld
6ead1f4a2c:    	b	0x6ead1f437c <trace+0x43c>
6ead1f4a30:    	mov	w1, w23
6ead1f4a34:    	mov	w2, w21
6ead1f4a38:    	mov	x0, x19
6ead1f4a3c:    	mov	w3, #0x4045             // =16453
6ead1f4a40:    	movk	w3, #0x1, lsl #16
6ead1f4a44:    	adr	x4, 0x6ead1f43a8 <trace+0x468>
6ead1f4a48:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f4a4c:    	add	x16, x16, #0xc38
6ead1f4a50:    	blr	x16
6ead1f4a54:    	dmb	ishld
6ead1f4a58:    	b	0x6ead1f43a8 <trace+0x468>
6ead1f4a5c:    	mov	w1, w21
6ead1f4a60:    	mov	x0, x19
6ead1f4a64:    	mov	w2, #0x4045             // =16453
6ead1f4a68:    	movk	w2, #0x1, lsl #16
6ead1f4a6c:    	adr	x3, 0x6ead1f43d0 <trace+0x490>
6ead1f4a70:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f4a74:    	add	x16, x16, #0x58
6ead1f4a78:    	blr	x16
6ead1f4a7c:    	mov	w21, w0
6ead1f4a80:    	dmb	ishld
6ead1f4a84:    	b	0x6ead1f43d0 <trace+0x490>
6ead1f4a88:    	mov	w1, w23
6ead1f4a8c:    	mov	w2, w21
6ead1f4a90:    	mov	x0, x19
6ead1f4a94:    	mov	w3, #0x4045             // =16453
6ead1f4a98:    	movk	w3, #0x1, lsl #16
6ead1f4a9c:    	adr	x4, 0x6ead1f43fc <trace+0x4bc>
6ead1f4aa0:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f4aa4:    	add	x16, x16, #0xc38
6ead1f4aa8:    	blr	x16
6ead1f4aac:    	dmb	ishld
6ead1f4ab0:    	b	0x6ead1f43fc <trace+0x4bc>
6ead1f4ab4:    	mov	w1, w21
6ead1f4ab8:    	mov	x0, x19
6ead1f4abc:    	mov	w2, #0x4045             // =16453
6ead1f4ac0:    	movk	w2, #0x1, lsl #16
6ead1f4ac4:    	adr	x3, 0x6ead1f4424 <trace+0x4e4>
6ead1f4ac8:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f4acc:    	add	x16, x16, #0x58
6ead1f4ad0:    	blr	x16
6ead1f4ad4:    	mov	w21, w0
6ead1f4ad8:    	dmb	ishld
6ead1f4adc:    	b	0x6ead1f4424 <trace+0x4e4>
6ead1f4ae0:    	mov	w1, w23
6ead1f4ae4:    	mov	w2, w21
6ead1f4ae8:    	mov	x0, x19
6ead1f4aec:    	mov	w3, #0x4045             // =16453
6ead1f4af0:    	movk	w3, #0x1, lsl #16
6ead1f4af4:    	adr	x4, 0x6ead1f4450 <trace+0x510>
6ead1f4af8:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f4afc:    	add	x16, x16, #0xc38
6ead1f4b00:    	blr	x16
6ead1f4b04:    	dmb	ishld
6ead1f4b08:    	b	0x6ead1f4450 <trace+0x510>
6ead1f4b0c:    	mov	w1, w20
6ead1f4b10:    	mov	x0, x19
6ead1f4b14:    	mov	w2, #0x4045             // =16453
6ead1f4b18:    	movk	w2, #0x1, lsl #16
6ead1f4b1c:    	adr	x3, 0x6ead1f44cc <trace+0x58c>
6ead1f4b20:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f4b24:    	add	x16, x16, #0x58
6ead1f4b28:    	blr	x16
6ead1f4b2c:    	mov	w21, w0
6ead1f4b30:    	dmb	ishld
6ead1f4b34:    	b	0x6ead1f44cc <trace+0x58c>
6ead1f4b38:    	mov	w1, w22
6ead1f4b3c:    	mov	w2, w21
6ead1f4b40:    	mov	x0, x19
6ead1f4b44:    	mov	w3, #0x4045             // =16453
6ead1f4b48:    	movk	w3, #0x1, lsl #16
6ead1f4b4c:    	adr	x4, 0x6ead1f44fc <trace+0x5bc>
6ead1f4b50:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f4b54:    	add	x16, x16, #0xc38
6ead1f4b58:    	blr	x16
6ead1f4b5c:    	dmb	ishld
6ead1f4b60:    	b	0x6ead1f44fc <trace+0x5bc>
6ead1f4b64:    	mov	w1, w20
6ead1f4b68:    	mov	x0, x19
6ead1f4b6c:    	mov	w2, #0x4045             // =16453
6ead1f4b70:    	movk	w2, #0x1, lsl #16
6ead1f4b74:    	adr	x3, 0x6ead1f457c <trace+0x63c>
6ead1f4b78:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f4b7c:    	add	x16, x16, #0x58
6ead1f4b80:    	blr	x16
6ead1f4b84:    	mov	w21, w0
6ead1f4b88:    	dmb	ishld
6ead1f4b8c:    	b	0x6ead1f457c <trace+0x63c>
6ead1f4b90:    	mov	w1, w22
6ead1f4b94:    	mov	w2, w21
6ead1f4b98:    	mov	x0, x19
6ead1f4b9c:    	mov	w3, #0x4045             // =16453
6ead1f4ba0:    	movk	w3, #0x1, lsl #16
6ead1f4ba4:    	adr	x4, 0x6ead1f45a4 <trace+0x664>
6ead1f4ba8:    	adrp	x16, 0x6efc87d000 <trace+0x4f689000>
6ead1f4bac:    	add	x16, x16, #0xc38
6ead1f4bb0:    	blr	x16
6ead1f4bb4:    	dmb	ishld
6ead1f4bb8:    	b	0x6ead1f45a4 <trace+0x664>