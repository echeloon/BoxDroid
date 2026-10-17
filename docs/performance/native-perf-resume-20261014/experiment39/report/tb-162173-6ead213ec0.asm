
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-162173-6ead213ec0.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006ead213ec0 <trace>:
6ead213ec0:    	ldur	w20, [x19, #-0x10]  // guest 0x162173, sampled 1
6ead213ec4:    	tbnz	w20, #0x1f, 0x6ead2141dc <trace+0x31c>  // guest 0x162173, sampled 0
6ead213ec8:    	sturb	wzr, [x19, #-0xc]  // guest 0x162173, sampled 0
6ead213ecc:    	ldr	w20, [x19, #0x10]  // guest 0x162173, sampled 0
6ead213ed0:    	add	w21, w20, #0x500  // guest 0x162173, sampled 0
6ead213ed4:    	str	w21, [x19, #0x4]  // guest 0x162173, sampled 0
6ead213ed8:    	ldr	w22, [x19, #0x18]  // guest 0x16217a, sampled 0
6ead213edc:    	add	w22, w22, #0x4a0  // guest 0x16217a, sampled 0
6ead213ee0:    	str	w22, [x19, #0x18]  // guest 0x16217a, sampled 0
6ead213ee4:    	str	w22, [x19, #0x28]  // guest 0x16217a, sampled 0
6ead213ee8:    	mov	w23, #0x4a0             // =1184  // guest 0x16217a, sampled 0
6ead213eec:    	str	w23, [x19, #0x2c]  // guest 0x16217a, sampled 0
6ead213ef0:    	add	w23, w20, #0x1c  // guest 0x162180, sampled 0
6ead213ef4:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x162180, sampled 0
6ead213ef8:    	and	x16, x16, x23, lsr #7  // guest 0x162180, sampled 0
6ead213efc:    	add	x17, x17, x16  // guest 0x162180, sampled 0
6ead213f00:    	ldp	x17, x16, [x17, #0x8]  // guest 0x162180, sampled 0
6ead213f04:    	and	w30, w23, #0xfffff003  // guest 0x162180, sampled 0
6ead213f08:    	cmp	w16, w30  // guest 0x162180, sampled 0
6ead213f0c:    	b.ne	0x6ead2141e4 <trace+0x324>  // guest 0x162180, sampled 0
6ead213f10:    	add	x30, x17, w23, uxtw  // guest 0x162180, sampled 0
6ead213f14:    	stlr	w21, [x30]  // guest 0x162180, sampled 0
6ead213f18:    	add	w23, w20, #0x18  // guest 0x162184, sampled 0
6ead213f1c:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x162184, sampled 0
6ead213f20:    	and	x16, x16, x23, lsr #7  // guest 0x162184, sampled 0
6ead213f24:    	add	x17, x17, x16  // guest 0x162184, sampled 0
6ead213f28:    	ldp	x17, x16, [x17, #0x8]  // guest 0x162184, sampled 0
6ead213f2c:    	and	w30, w23, #0xfffff003  // guest 0x162184, sampled 0
6ead213f30:    	cmp	w16, w30  // guest 0x162184, sampled 0
6ead213f34:    	b.ne	0x6ead214210 <trace+0x350>  // guest 0x162184, sampled 0
6ead213f38:    	add	x30, x17, w23, uxtw  // guest 0x162184, sampled 0
6ead213f3c:    	stlr	w22, [x30]  // guest 0x162184, sampled 0
6ead213f40:    	sub	w20, w20, #0x4  // guest 0x162188, sampled 0
6ead213f44:    	mov	w23, w20  // guest 0x162188, sampled 0
6ead213f48:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x162188, sampled 0
6ead213f4c:    	and	x16, x16, x23, lsr #7  // guest 0x162188, sampled 0
6ead213f50:    	add	x17, x17, x16  // guest 0x162188, sampled 0
6ead213f54:    	ldp	x17, x16, [x17, #0x8]  // guest 0x162188, sampled 0
6ead213f58:    	and	w30, w23, #0xfffff003  // guest 0x162188, sampled 0
6ead213f5c:    	cmp	w16, w30  // guest 0x162188, sampled 0
6ead213f60:    	b.ne	0x6ead21423c <trace+0x37c>  // guest 0x162188, sampled 0
6ead213f64:    	add	x30, x17, w23, uxtw  // guest 0x162188, sampled 0
6ead213f68:    	stlr	w21, [x30]  // guest 0x162188, sampled 0
6ead213f6c:    	str	w20, [x19, #0x10]  // guest 0x162188, sampled 0
6ead213f70:    	sub	w20, w20, #0x4  // guest 0x162189, sampled 0
6ead213f74:    	mov	w21, w20  // guest 0x162189, sampled 0
6ead213f78:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x162189, sampled 0
6ead213f7c:    	and	x16, x16, x21, lsr #7  // guest 0x162189, sampled 0
6ead213f80:    	add	x17, x17, x16  // guest 0x162189, sampled 0
6ead213f84:    	ldp	x17, x16, [x17, #0x8]  // guest 0x162189, sampled 0
6ead213f88:    	and	w30, w21, #0xfffff003  // guest 0x162189, sampled 0
6ead213f8c:    	cmp	w16, w30  // guest 0x162189, sampled 0
6ead213f90:    	b.ne	0x6ead214268 <trace+0x3a8>  // guest 0x162189, sampled 0
6ead213f94:    	add	x30, x17, w21, uxtw  // guest 0x162189, sampled 0
6ead213f98:    	stlr	w22, [x30]  // guest 0x162189, sampled 0
6ead213f9c:    	str	w20, [x19, #0x10]  // guest 0x162189, sampled 0
6ead213fa0:    	sub	w20, w20, #0x4  // guest 0x16218a, sampled 0
6ead213fa4:    	mov	w21, w20  // guest 0x16218a, sampled 0
6ead213fa8:    	ldr	w22, [x19, #0x1c]  // guest 0x16218a, sampled 0
6ead213fac:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x16218a, sampled 0
6ead213fb0:    	and	x16, x16, x21, lsr #7  // guest 0x16218a, sampled 0
6ead213fb4:    	add	x17, x17, x16  // guest 0x16218a, sampled 0
6ead213fb8:    	ldp	x17, x16, [x17, #0x8]  // guest 0x16218a, sampled 0
6ead213fbc:    	and	w30, w21, #0xfffff003  // guest 0x16218a, sampled 0
6ead213fc0:    	cmp	w16, w30  // guest 0x16218a, sampled 0
6ead213fc4:    	b.ne	0x6ead214294 <trace+0x3d4>  // guest 0x16218a, sampled 0
6ead213fc8:    	add	x30, x17, w21, uxtw  // guest 0x16218a, sampled 0
6ead213fcc:    	stlr	w22, [x30]  // guest 0x16218a, sampled 0
6ead213fd0:    	str	w20, [x19, #0x10]  // guest 0x16218a, sampled 0
6ead213fd4:    	sub	w20, w20, #0x4  // guest 0x16218b, sampled 0
6ead213fd8:    	mov	w21, w20  // guest 0x16218b, sampled 0
6ead213fdc:    	ldr	w22, [x19, #0xc]  // guest 0x16218b, sampled 0
6ead213fe0:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x16218b, sampled 0
6ead213fe4:    	and	x16, x16, x21, lsr #7  // guest 0x16218b, sampled 0
6ead213fe8:    	add	x17, x17, x16  // guest 0x16218b, sampled 0
6ead213fec:    	ldp	x17, x16, [x17, #0x8]  // guest 0x16218b, sampled 0
6ead213ff0:    	and	w30, w21, #0xfffff003  // guest 0x16218b, sampled 0
6ead213ff4:    	cmp	w16, w30  // guest 0x16218b, sampled 0
6ead213ff8:    	b.ne	0x6ead2142c0 <trace+0x400>  // guest 0x16218b, sampled 0
6ead213ffc:    	add	x30, x17, w21, uxtw  // guest 0x16218b, sampled 0
6ead214000:    	stlr	w22, [x30]  // guest 0x16218b, sampled 0
6ead214004:    	str	w20, [x19, #0x10]  // guest 0x16218b, sampled 0
6ead214008:    	mov	w21, #0xab0             // =2736  // guest 0x16218c, sampled 0
6ead21400c:    	str	w21, [x19, #0x4]  // guest 0x16218c, sampled 0
6ead214010:    	add	w21, w20, #0x2c  // guest 0x162191, sampled 0
6ead214014:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x162191, sampled 0
6ead214018:    	and	x16, x16, x21, lsr #7  // guest 0x162191, sampled 0
6ead21401c:    	add	x17, x17, x16  // guest 0x162191, sampled 0
6ead214020:    	ldp	x16, x17, [x17]  // guest 0x162191, sampled 0
6ead214024:    	and	w30, w21, #0xfffff003  // guest 0x162191, sampled 0
6ead214028:    	cmp	w16, w30  // guest 0x162191, sampled 0
6ead21402c:    	b.ne	0x6ead2142ec <trace+0x42c>  // guest 0x162191, sampled 0
6ead214030:    	add	x30, x17, w21, uxtw  // guest 0x162191, sampled 0
6ead214034:    	ldapr	w21, [x30]  // guest 0x162191, sampled 0
6ead214038:    	str	w21, [x19, #0x18]  // guest 0x162191, sampled 0
6ead21403c:    	add	w20, w20, #0x28  // guest 0x162195, sampled 0
6ead214040:    	str	w20, [sp, #0x80]  // guest 0x162195, sampled 0
6ead214044:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x162195, sampled 0
6ead214048:    	and	x16, x16, x20, lsr #7  // guest 0x162195, sampled 0
6ead21404c:    	add	x17, x17, x16  // guest 0x162195, sampled 0
6ead214050:    	ldp	x16, x17, [x17]  // guest 0x162195, sampled 0
6ead214054:    	and	w30, w20, #0xfffff003  // guest 0x162195, sampled 0
6ead214058:    	cmp	w16, w30  // guest 0x162195, sampled 0
6ead21405c:    	b.ne	0x6ead214318 <trace+0x458>  // guest 0x162195, sampled 0
6ead214060:    	add	x30, x17, w20, uxtw  // guest 0x162195, sampled 0
6ead214064:    	ldapr	w20, [x30]  // guest 0x162195, sampled 0
6ead214068:    	str	w20, [x19, #0x1c]  // guest 0x162195, sampled 0
6ead21406c:    	mov	w20, #0x2ac             // =684  // guest 0x16219b, sampled 0
6ead214070:    	str	w20, [x19, #0x4]  // guest 0x16219b, sampled 0
6ead214074:    	str	wzr, [sp, #0x84]  // guest 0x16219e, sampled 0
6ead214078:    	str	wzr, [x19, #0xc]  // guest 0x16219e, sampled 0
6ead21407c:    	str	wzr, [x19, #0x28]  // guest 0x16219e, sampled 0
6ead214080:    	mov	w20, #0x1               // =1  // guest 0x16219e, sampled 0
6ead214084:    	sturb	w20, [x19, #-0xc]  // guest 0x16219e, sampled 0
6ead214088:    	ldr	w20, [x19, #0x38]  // guest 0x1621a1, sampled 0
6ead21408c:    	lsl	w20, w20, #2  // guest 0x1621a1, sampled 0
6ead214090:    	str	w20, [sp, #0x88]  // guest 0x1621a1, sampled 0
6ead214094:    	mov	w20, #0x1a              // =26  // guest 0x1621a1, sampled 0
6ead214098:    	str	w20, [x19, #0x34]  // guest 0x1621a1, sampled 0
6ead21409c:    	mov	w20, #0x2ab             // =683  // guest 0x1621a1, sampled 0
6ead2140a0:    	str	w20, [sp, #0x8c]  // guest 0x1621a1, sampled 0
6ead2140a4:    	ldr	w20, [x19, #0x18]  // guest 0x1621a1, sampled 1
6ead2140a8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x1621a1, sampled 0
6ead2140ac:    	and	x16, x16, x20, lsr #7  // guest 0x1621a1, sampled 0
6ead2140b0:    	add	x17, x17, x16  // guest 0x1621a1, sampled 4
6ead2140b4:    	ldp	x16, x17, [x17]  // guest 0x1621a1, sampled 0
6ead2140b8:    	and	w30, w20, #0xfffff003  // guest 0x1621a1, sampled 10
6ead2140bc:    	cmp	w16, w30  // guest 0x1621a1, sampled 0
6ead2140c0:    	b.ne	0x6ead214344 <trace+0x484>  // guest 0x1621a1, sampled 0
6ead2140c4:    	add	x30, x17, w20, uxtw  // guest 0x1621a1, sampled 0
6ead2140c8:    	ldapr	w21, [x30]  // guest 0x1621a1, sampled 0
6ead2140cc:    	str	w21, [sp, #0x84]  // guest 0x1621a1, sampled 12
6ead2140d0:    	ldr	w22, [x19, #0x1c]  // guest 0x1621a1, sampled 0
6ead2140d4:    	str	w22, [sp, #0x80]  // guest 0x1621a1, sampled 0
6ead2140d8:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x1621a1, sampled 0
6ead2140dc:    	and	x16, x16, x22, lsr #7  // guest 0x1621a1, sampled 0
6ead2140e0:    	add	x17, x17, x16  // guest 0x1621a1, sampled 0
6ead2140e4:    	ldp	x17, x16, [x17, #0x8]  // guest 0x1621a1, sampled 0
6ead2140e8:    	and	w30, w22, #0xfffff003  // guest 0x1621a1, sampled 0
6ead2140ec:    	cmp	w16, w30  // guest 0x1621a1, sampled 7
6ead2140f0:    	b.ne	0x6ead214370 <trace+0x4b0>  // guest 0x1621a1, sampled 0
6ead2140f4:    	add	x30, x17, w22, uxtw  // guest 0x1621a1, sampled 0
6ead2140f8:    	stlr	w21, [x30]  // guest 0x1621a1, sampled 0
6ead2140fc:    	ldr	w21, [sp, #0x88]  // guest 0x1621a1, sampled 0
6ead214100:    	add	w20, w20, w21  // guest 0x1621a1, sampled 0
6ead214104:    	str	w20, [x19, #0x18]  // guest 0x1621a1, sampled 0
6ead214108:    	add	w20, w22, w21  // guest 0x1621a1, sampled 0
6ead21410c:    	str	w20, [x19, #0x1c]  // guest 0x1621a1, sampled 0
6ead214110:    	ldr	w20, [sp, #0x8c]  // guest 0x1621a1, sampled 1
6ead214114:    	str	w20, [x19, #0x4]  // guest 0x1621a1, sampled 0
6ead214118:    	sub	w20, w20, #0x1  // guest 0x1621a1, sampled 0
6ead21411c:    	str	w20, [sp, #0x8c]  // guest 0x1621a1, sampled 0
6ead214120:    	tst	w20, #0xffff  // guest 0x1621a1, sampled 0
6ead214124:    	b.ne	0x6ead2140a4 <trace+0x1e4>  // guest 0x1621a1, sampled 0
6ead214128:    	cbz	w20, 0x6ead214154 <trace+0x294>  // guest 0x1621a1, sampled 0
6ead21412c:    	ldr	w20, [x19, #0x24]  // guest 0x1621a1, sampled 0
6ead214130:    	orr	w20, w20, #0x10000  // guest 0x1621a1, sampled 0
6ead214134:    	str	w20, [x19, #0x24]  // guest 0x1621a1, sampled 0
6ead214138:    	b	0x6ead214138 <trace+0x278>  // guest 0x1621a1, sampled 0
6ead21413c:    	br	x16  // guest 0x1621a1, sampled 0
6ead214140:    	mov	w20, #0x21a1            // =8609  // guest 0x1621a1, sampled 0
6ead214144:    	movk	w20, #0x16, lsl #16  // guest 0x1621a1, sampled 0
6ead214148:    	str	w20, [x19, #0x20]  // guest 0x1621a1, sampled 0
6ead21414c:    	adr	x0, 0x6ead213e00 <trace+0xffffffffffffff40>  // guest 0x1621a1, sampled 0
6ead214150:    	b	0x6ea842202c <trace+0xfffffffffb20e16c>  // guest 0x1621a1, sampled 0
6ead214154:    	ldr	w20, [x19, #0x18]  // guest 0x1621a1, sampled 0
6ead214158:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x1621a1, sampled 0
6ead21415c:    	and	x16, x16, x20, lsr #7  // guest 0x1621a1, sampled 0
6ead214160:    	add	x17, x17, x16  // guest 0x1621a1, sampled 0
6ead214164:    	ldp	x16, x17, [x17]  // guest 0x1621a1, sampled 0
6ead214168:    	and	w30, w20, #0xfffff003  // guest 0x1621a1, sampled 0
6ead21416c:    	cmp	w16, w30  // guest 0x1621a1, sampled 0
6ead214170:    	b.ne	0x6ead21439c <trace+0x4dc>  // guest 0x1621a1, sampled 0
6ead214174:    	add	x30, x17, w20, uxtw  // guest 0x1621a1, sampled 0
6ead214178:    	ldapr	w21, [x30]  // guest 0x1621a1, sampled 0
6ead21417c:    	ldr	w22, [x19, #0x1c]  // guest 0x1621a1, sampled 0
6ead214180:    	ldp	x16, x17, [x19, #-0x70]  // guest 0x1621a1, sampled 0
6ead214184:    	and	x16, x16, x22, lsr #7  // guest 0x1621a1, sampled 0
6ead214188:    	add	x17, x17, x16  // guest 0x1621a1, sampled 0
6ead21418c:    	ldp	x17, x16, [x17, #0x8]  // guest 0x1621a1, sampled 0
6ead214190:    	and	w30, w22, #0xfffff003  // guest 0x1621a1, sampled 0
6ead214194:    	cmp	w16, w30  // guest 0x1621a1, sampled 0
6ead214198:    	b.ne	0x6ead2143c8 <trace+0x508>  // guest 0x1621a1, sampled 0
6ead21419c:    	add	x30, x17, w22, uxtw  // guest 0x1621a1, sampled 0
6ead2141a0:    	stlr	w21, [x30]  // guest 0x1621a1, sampled 0
6ead2141a4:    	ldr	w21, [sp, #0x88]  // guest 0x1621a1, sampled 0
6ead2141a8:    	add	w20, w20, w21  // guest 0x1621a1, sampled 0
6ead2141ac:    	str	w20, [x19, #0x18]  // guest 0x1621a1, sampled 0
6ead2141b0:    	add	w20, w22, w21  // guest 0x1621a1, sampled 0
6ead2141b4:    	str	w20, [x19, #0x1c]  // guest 0x1621a1, sampled 0
6ead2141b8:    	ldr	w20, [sp, #0x8c]  // guest 0x1621a1, sampled 0
6ead2141bc:    	str	w20, [x19, #0x4]  // guest 0x1621a1, sampled 0
6ead2141c0:    	b	0x6ead2141c0 <trace+0x300>  // guest 0x1621a1, sampled 0
6ead2141c4:    	br	x16  // guest 0x1621a1, sampled 0
6ead2141c8:    	mov	w20, #0x21a3            // =8611  // guest 0x1621a1, sampled 0
6ead2141cc:    	movk	w20, #0x16, lsl #16  // guest 0x1621a1, sampled 0
6ead2141d0:    	str	w20, [x19, #0x20]  // guest 0x1621a1, sampled 0
6ead2141d4:    	adr	x0, 0x6ead213e01 <trace+0xffffffffffffff41>  // guest 0x1621a1, sampled 0
6ead2141d8:    	b	0x6ea842202c <trace+0xfffffffffb20e16c>  // guest 0x1621a1, sampled 0
6ead2141dc:    	adr	x0, 0x6ead213e03 <trace+0xffffffffffffff43>  // guest 0x1621a1, sampled 0
6ead2141e0:    	b	0x6ea842202c <trace+0xfffffffffb20e16c>  // guest 0x1621a1, sampled 0
6ead2141e4:    	mov	w1, w23
6ead2141e8:    	mov	w2, w21
6ead2141ec:    	mov	x0, x19
6ead2141f0:    	mov	w3, #0x4045             // =16453
6ead2141f4:    	movk	w3, #0x1, lsl #16
6ead2141f8:    	adr	x4, 0x6ead213f18 <trace+0x58>
6ead2141fc:    	adrp	x16, 0x6efc87d000 <trace+0x4f669000>
6ead214200:    	add	x16, x16, #0xc38
6ead214204:    	blr	x16
6ead214208:    	dmb	ishld
6ead21420c:    	b	0x6ead213f18 <trace+0x58>
6ead214210:    	mov	w1, w23
6ead214214:    	mov	w2, w22
6ead214218:    	mov	x0, x19
6ead21421c:    	mov	w3, #0x4045             // =16453
6ead214220:    	movk	w3, #0x1, lsl #16
6ead214224:    	adr	x4, 0x6ead213f40 <trace+0x80>
6ead214228:    	adrp	x16, 0x6efc87d000 <trace+0x4f669000>
6ead21422c:    	add	x16, x16, #0xc38
6ead214230:    	blr	x16
6ead214234:    	dmb	ishld
6ead214238:    	b	0x6ead213f40 <trace+0x80>
6ead21423c:    	mov	w1, w23
6ead214240:    	mov	w2, w21
6ead214244:    	mov	x0, x19
6ead214248:    	mov	w3, #0x4045             // =16453
6ead21424c:    	movk	w3, #0x1, lsl #16
6ead214250:    	adr	x4, 0x6ead213f6c <trace+0xac>
6ead214254:    	adrp	x16, 0x6efc87d000 <trace+0x4f669000>
6ead214258:    	add	x16, x16, #0xc38
6ead21425c:    	blr	x16
6ead214260:    	dmb	ishld
6ead214264:    	b	0x6ead213f6c <trace+0xac>
6ead214268:    	mov	w1, w21
6ead21426c:    	mov	w2, w22
6ead214270:    	mov	x0, x19
6ead214274:    	mov	w3, #0x4045             // =16453
6ead214278:    	movk	w3, #0x1, lsl #16
6ead21427c:    	adr	x4, 0x6ead213f9c <trace+0xdc>
6ead214280:    	adrp	x16, 0x6efc87d000 <trace+0x4f669000>
6ead214284:    	add	x16, x16, #0xc38
6ead214288:    	blr	x16
6ead21428c:    	dmb	ishld
6ead214290:    	b	0x6ead213f9c <trace+0xdc>
6ead214294:    	mov	w1, w21
6ead214298:    	mov	w2, w22
6ead21429c:    	mov	x0, x19
6ead2142a0:    	mov	w3, #0x4045             // =16453
6ead2142a4:    	movk	w3, #0x1, lsl #16
6ead2142a8:    	adr	x4, 0x6ead213fd0 <trace+0x110>
6ead2142ac:    	adrp	x16, 0x6efc87d000 <trace+0x4f669000>
6ead2142b0:    	add	x16, x16, #0xc38
6ead2142b4:    	blr	x16
6ead2142b8:    	dmb	ishld
6ead2142bc:    	b	0x6ead213fd0 <trace+0x110>
6ead2142c0:    	mov	w1, w21
6ead2142c4:    	mov	w2, w22
6ead2142c8:    	mov	x0, x19
6ead2142cc:    	mov	w3, #0x4045             // =16453
6ead2142d0:    	movk	w3, #0x1, lsl #16
6ead2142d4:    	adr	x4, 0x6ead214004 <trace+0x144>
6ead2142d8:    	adrp	x16, 0x6efc87d000 <trace+0x4f669000>
6ead2142dc:    	add	x16, x16, #0xc38
6ead2142e0:    	blr	x16
6ead2142e4:    	dmb	ishld
6ead2142e8:    	b	0x6ead214004 <trace+0x144>
6ead2142ec:    	mov	w1, w21
6ead2142f0:    	mov	x0, x19
6ead2142f4:    	mov	w2, #0x4045             // =16453
6ead2142f8:    	movk	w2, #0x1, lsl #16
6ead2142fc:    	adr	x3, 0x6ead214038 <trace+0x178>
6ead214300:    	adrp	x16, 0x6efc87d000 <trace+0x4f669000>
6ead214304:    	add	x16, x16, #0x58
6ead214308:    	blr	x16
6ead21430c:    	mov	w21, w0
6ead214310:    	dmb	ishld
6ead214314:    	b	0x6ead214038 <trace+0x178>
6ead214318:    	mov	w1, w20
6ead21431c:    	mov	x0, x19
6ead214320:    	mov	w2, #0x4045             // =16453
6ead214324:    	movk	w2, #0x1, lsl #16
6ead214328:    	adr	x3, 0x6ead214068 <trace+0x1a8>
6ead21432c:    	adrp	x16, 0x6efc87d000 <trace+0x4f669000>
6ead214330:    	add	x16, x16, #0x58
6ead214334:    	blr	x16
6ead214338:    	mov	w20, w0
6ead21433c:    	dmb	ishld
6ead214340:    	b	0x6ead214068 <trace+0x1a8>
6ead214344:    	mov	w1, w20
6ead214348:    	mov	x0, x19
6ead21434c:    	mov	w2, #0x4045             // =16453
6ead214350:    	movk	w2, #0x1, lsl #16
6ead214354:    	adr	x3, 0x6ead2140cc <trace+0x20c>
6ead214358:    	adrp	x16, 0x6efc87d000 <trace+0x4f669000>
6ead21435c:    	add	x16, x16, #0x58
6ead214360:    	blr	x16
6ead214364:    	mov	w21, w0
6ead214368:    	dmb	ishld
6ead21436c:    	b	0x6ead2140cc <trace+0x20c>
6ead214370:    	mov	w1, w22
6ead214374:    	mov	w2, w21
6ead214378:    	mov	x0, x19
6ead21437c:    	mov	w3, #0x4045             // =16453
6ead214380:    	movk	w3, #0x1, lsl #16
6ead214384:    	adr	x4, 0x6ead2140fc <trace+0x23c>
6ead214388:    	adrp	x16, 0x6efc87d000 <trace+0x4f669000>
6ead21438c:    	add	x16, x16, #0xc38
6ead214390:    	blr	x16
6ead214394:    	dmb	ishld
6ead214398:    	b	0x6ead2140fc <trace+0x23c>
6ead21439c:    	mov	w1, w20
6ead2143a0:    	mov	x0, x19
6ead2143a4:    	mov	w2, #0x4045             // =16453
6ead2143a8:    	movk	w2, #0x1, lsl #16
6ead2143ac:    	adr	x3, 0x6ead21417c <trace+0x2bc>
6ead2143b0:    	adrp	x16, 0x6efc87d000 <trace+0x4f669000>
6ead2143b4:    	add	x16, x16, #0x58
6ead2143b8:    	blr	x16
6ead2143bc:    	mov	w21, w0
6ead2143c0:    	dmb	ishld
6ead2143c4:    	b	0x6ead21417c <trace+0x2bc>
6ead2143c8:    	mov	w1, w22
6ead2143cc:    	mov	w2, w21
6ead2143d0:    	mov	x0, x19
6ead2143d4:    	mov	w3, #0x4045             // =16453
6ead2143d8:    	movk	w3, #0x1, lsl #16
6ead2143dc:    	adr	x4, 0x6ead2141a4 <trace+0x2e4>
6ead2143e0:    	adrp	x16, 0x6efc87d000 <trace+0x4f669000>
6ead2143e4:    	add	x16, x16, #0xc38
6ead2143e8:    	blr	x16
6ead2143ec:    	dmb	ishld
6ead2143f0:    	b	0x6ead2141a4 <trace+0x2e4>