
/Users/maverick/Documents/BoxDroid/BoxDroid/build/native-perf-run/tb-ebc87-6c50fa1100.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000006c50fa1100 <trace>:
6c50fa1100:    	ldur	w20, [x19, #-0x10]  // guest 0xebc87, sampled 0
6c50fa1104:    	tbnz	w20, #0x1f, 0x6c50fa1194 <trace+0x94>  // guest 0xebc87, sampled 0
6c50fa1108:    	sturb	wzr, [x19, #-0xc]  // guest 0xebc87, sampled 0
6c50fa110c:    	ldr	w20, [x19, #0x14]  // guest 0xebc87, sampled 0
6c50fa1110:    	add	w20, w20, #0x140  // guest 0xebc87, sampled 0
6c50fa1114:    	ldp	x16, x17, [x19, #-0x70]  // guest 0xebc87, sampled 0
6c50fa1118:    	and	x16, x16, x20, lsr #7  // guest 0xebc87, sampled 0
6c50fa111c:    	add	x17, x17, x16  // guest 0xebc87, sampled 0
6c50fa1120:    	ldp	x16, x17, [x17]  // guest 0xebc87, sampled 0
6c50fa1124:    	and	w30, w20, #0xfffff003  // guest 0xebc87, sampled 1
6c50fa1128:    	cmp	w16, w30  // guest 0xebc87, sampled 0
6c50fa112c:    	b.ne	0x6c50fa119c <trace+0x9c>  // guest 0xebc87, sampled 0
6c50fa1130:    	add	x30, x17, w20, uxtw  // guest 0xebc87, sampled 0
6c50fa1134:    	ldapr	w20, [x30]  // guest 0xebc87, sampled 0
6c50fa1138:    	str	w20, [x19]  // guest 0xebc87, sampled 15
6c50fa113c:    	str	wzr, [x19, #0x8]  // guest 0xebc8d, sampled 0
6c50fa1140:    	str	w20, [x19, #0x28]  // guest 0xebc8f, sampled 0
6c50fa1144:    	str	wzr, [x19, #0x2c]  // guest 0xebc8f, sampled 0
6c50fa1148:    	mov	w21, #0x1               // =1  // guest 0xebc8f, sampled 0
6c50fa114c:    	sturb	w21, [x19, #-0xc]  // guest 0xebc8f, sampled 0
6c50fa1150:    	mov	w21, #0x12              // =18  // guest 0xebc91, sampled 0
6c50fa1154:    	str	w21, [x19, #0x34]  // guest 0xebc91, sampled 0
6c50fa1158:    	cbz	w20, 0x6c50fa1178 <trace+0x78>  // guest 0xebc91, sampled 0
6c50fa115c:    	b	0x6c50fa115c <trace+0x5c>  // guest 0xebc91, sampled 0
6c50fa1160:    	br	x16  // guest 0xebc91, sampled 0
6c50fa1164:    	mov	w20, #0xbc93            // =48275  // guest 0xebc91, sampled 0
6c50fa1168:    	movk	w20, #0xe, lsl #16  // guest 0xebc91, sampled 0
6c50fa116c:    	str	w20, [x19, #0x20]  // guest 0xebc91, sampled 0
6c50fa1170:    	adr	x0, 0x6c50fa1041 <trace+0xffffffffffffff41>  // guest 0xebc91, sampled 0
6c50fa1174:    	b	0x6c4ae5d02c <trace+0xfffffffff9ebbf2c>  // guest 0xebc91, sampled 0
6c50fa1178:    	b	0x6c50fa1178 <trace+0x78>  // guest 0xebc91, sampled 0
6c50fa117c:    	br	x16  // guest 0xebc91, sampled 0
6c50fa1180:    	mov	w20, #0xbcd2            // =48338  // guest 0xebc91, sampled 0
6c50fa1184:    	movk	w20, #0xe, lsl #16  // guest 0xebc91, sampled 0
6c50fa1188:    	str	w20, [x19, #0x20]  // guest 0xebc91, sampled 0
6c50fa118c:    	adr	x0, 0x6c50fa1040 <trace+0xffffffffffffff40>  // guest 0xebc91, sampled 0
6c50fa1190:    	b	0x6c4ae5d02c <trace+0xfffffffff9ebbf2c>  // guest 0xebc91, sampled 0
6c50fa1194:    	adr	x0, 0x6c50fa1043 <trace+0xffffffffffffff43>  // guest 0xebc91, sampled 0
6c50fa1198:    	b	0x6c4ae5d02c <trace+0xfffffffff9ebbf2c>  // guest 0xebc91, sampled 0
6c50fa119c:    	mov	w1, w20
6c50fa11a0:    	mov	x0, x19
6c50fa11a4:    	mov	w2, #0x4045             // =16453
6c50fa11a8:    	movk	w2, #0x1, lsl #16
6c50fa11ac:    	adr	x3, 0x6c50fa1138 <trace+0x38>
6c50fa11b0:    	adrp	x16, 0x6c97723000 <trace+0x46782000>
6c50fa11b4:    	add	x16, x16, #0xf88
6c50fa11b8:    	blr	x16
6c50fa11bc:    	mov	w20, w0
6c50fa11c0:    	dmb	ishld
6c50fa11c4:    	b	0x6c50fa1138 <trace+0x38>