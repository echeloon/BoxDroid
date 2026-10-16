
build/native-perf-run/guest39-opcode-cost-detailed/sampled-opcodes.o:	file format elf64-littleaarch64

Disassembly of section .text:

0000000000000000 <sampled_opcodes>:
       0:      	stlrb	w21, [x30]
       4:      	and	w7, w7, w8
       8:      	and	w20, w20, w22
       c:      	add	w21, w21, w20
      10:      	add	w20, w20, w21
      14:      	add	w20, w22, w21
      18:      	add	w20, w20, w22
      1c:      	add	w21, w21, w22
      20:      	add	w21, w21, w23
      24:      	add	w23, w24, w23
      28:      	add	w20, w20, w24
      2c:      	add	w21, w21, w24
      30:      	add	w20, w20, w27
      34:      	add	w20, w20, #0x1
      38:      	add	w22, w20, #0x1
      3c:      	add	w21, w21, #0x1
      40:      	add	w22, w22, #0x1
      44:      	add	w22, w20, #0x2
      48:      	add	w21, w21, #0x2
      4c:      	add	w20, w20, #0x4
      50:      	add	w21, w21, #0x4
      54:      	add	w24, w23, #0x4
      58:      	add	w25, w24, #0x4
      5c:      	add	w21, w20, #0x7
      60:      	add	w22, w20, #0x7
      64:      	add	w20, w21, #0x7
      68:      	add	w22, w21, #0x7
      6c:      	add	w23, w21, #0x7
      70:      	add	w24, w21, #0x7
      74:      	add	w25, w21, #0x7
      78:      	add	w23, w22, #0x7
      7c:      	add	w24, w22, #0x7
      80:      	add	w24, w23, #0x7
      84:      	add	w25, w23, #0x7
      88:      	add	w26, w23, #0x7
      8c:      	add	w20, w20, #0x8
      90:      	add	w21, w20, #0x8
      94:      	add	w22, w21, #0x8
      98:      	add	w20, w20, #0xc
      9c:      	add	w21, w20, #0xc
      a0:      	add	w21, w21, #0xc
      a4:      	add	w21, w22, #0xc
      a8:      	add	w22, w22, #0xc
      ac:      	add	w20, w20, #0x10
      b0:      	add	w22, w20, #0x10
      b4:      	add	w23, w20, #0x10
      b8:      	add	w21, w21, #0x10
      bc:      	add	w22, w21, #0x10
      c0:      	add	w22, w24, #0x10
      c4:      	add	w20, w21, #0x14
      c8:      	add	w23, w21, #0x14
      cc:      	add	w20, w20, #0x18
      d0:      	add	w21, w20, #0x18
      d4:      	add	w24, w20, #0x18
      d8:      	add	w22, w21, #0x18
      dc:      	add	w21, w20, #0x1c
      e0:      	add	w21, w20, #0x20
      e4:      	add	w22, w21, #0x20
      e8:      	add	w20, w20, #0x24
      ec:      	add	w23, w22, #0x28
      f0:      	add	w21, w20, #0x2c
      f4:      	add	w23, w20, #0x2c
      f8:      	add	w21, w20, #0x30
      fc:      	add	w21, w21, #0x30
     100:      	add	w23, w21, #0x30
     104:      	add	w23, w22, #0x30
     108:      	add	w21, w20, #0x3c
     10c:      	add	w24, w20, #0x3c
     110:      	add	w21, w21, #0x3c
     114:      	add	w20, w20, #0x44
     118:      	add	w24, w22, #0x48
     11c:      	add	w21, w20, #0x4c
     120:      	add	w21, w20, #0x50
     124:      	add	w20, w20, #0x58
     128:      	add	w21, w20, #0x68
     12c:      	add	w20, w23, #0x98
     130:      	add	w20, w21, #0x9c
     134:      	add	w22, w22, #0x114
     138:      	add	w20, w20, #0x1a0
     13c:      	add	w22, w22, #0x1a0
     140:      	add	w25, w25, #0x1a0
     144:      	add	w26, w26, #0x1a0
     148:      	add	w27, w27, #0x1a0
     14c:      	add	w21, w21, #0x1d0
     150:      	add	w20, w20, #0x394
     154:      	add	w25, w24, #0x534
     158:      	add	w20, w22, #0x644
     15c:      	add	w20, w20, #0x7a4
     160:      	add	w20, w20, #0xc64
     164:      	add	w21, w20, #0x8, lsl #12 // =0x8000
     168:      	add	w21, w21, #0x80, lsl #12 // =0x80000
     16c:      	and	w20, w20, #0x1
     170:      	and	w20, w20, #0x3
     174:      	and	w20, w20, #0x7
     178:      	and	w21, w21, #0x7
     17c:      	and	w23, w23, #0x7
     180:      	and	w24, w24, #0x7
     184:      	and	w25, w25, #0x7
     188:      	and	w26, w26, #0x7
     18c:      	and	w7, w7, #0x7f
     190:      	and	w21, w21, #0xff
     194:      	and	w21, w21, #0xffff
     198:      	and	w20, w20, #0x20000000
     19c:      	and	w20, w20, #0x100000
     1a0:      	and	w20, w20, #0x20000
     1a4:      	and	w30, w20, #0xfffff000
     1a8:      	and	w30, w21, #0xfffff000
     1ac:      	and	w30, w22, #0xfffff000
     1b0:      	and	w30, w23, #0xfffff000
     1b4:      	and	w30, w30, #0xfffff000
     1b8:      	and	w30, w20, #0xfffff001
     1bc:      	and	w30, w21, #0xfffff001
     1c0:      	and	w30, w23, #0xfffff001
     1c4:      	and	w30, w24, #0xfffff001
     1c8:      	and	w30, w8, #0xfffff003
     1cc:      	and	w30, w20, #0xfffff003
     1d0:      	and	w30, w21, #0xfffff003
     1d4:      	and	w30, w22, #0xfffff003
     1d8:      	and	w30, w23, #0xfffff003
     1dc:      	and	w30, w24, #0xfffff003
     1e0:      	and	w30, w25, #0xfffff003
     1e4:      	and	w30, w26, #0xfffff003
     1e8:      	and	w30, w27, #0xfffff003
     1ec:      	and	w30, w28, #0xfffff003
     1f0:      	and	w30, w8, #0xfffff007
     1f4:      	and	w30, w20, #0xfffff007
     1f8:      	and	w30, w22, #0xfffff007
     1fc:      	and	w30, w23, #0xfffff007
     200:      	and	w30, w26, #0xfffff007
     204:      	and	w30, w21, #0xfffff00f
     208:      	and	w20, w20, #0x40
     20c:      	and	w21, w21, #0xffffffdf
     210:      	and	w20, w20, #0x10
     214:      	and	w20, w20, #0x8
     218:      	and	w20, w20, #0x4
     21c:      	and	w20, w20, #0x2
     220:      	mov	w21, #-0x7fff           // =-32767
     224:      	sxtb	w20, w20
     228:      	sxtb	w22, w22
     22c:      	sxth	w21, w21
     230:      	b	0x230 <sampled_opcodes+0x230>
     234:      	b	0xfffffffffffff690 <sampled_opcodes+0xfffffffffffff690>
     238:      	b	0xfffffffffffff89c <sampled_opcodes+0xfffffffffffff89c>
     23c:      	b	0xfffffffffffffb58 <sampled_opcodes+0xfffffffffffffb58>
     240:      	b	0xfffffffffffffb70 <sampled_opcodes+0xfffffffffffffb70>
     244:      	b	0xfffffffffffffb9c <sampled_opcodes+0xfffffffffffffb9c>
     248:      	b	0xffffffffffffff04 <sampled_opcodes+0xffffffffffffff04>
     24c:      	b	0xffffffffffffff10 <sampled_opcodes+0xffffffffffffff10>
     250:      	b	0xffffffffffffff1c <sampled_opcodes+0xffffffffffffff1c>
     254:      	b	0xffffffffffffff24 <sampled_opcodes+0xffffffffffffff24>
     258:      	b	0xffffffffffffff2c <sampled_opcodes+0xffffffffffffff2c>
     25c:      	b	0xffffffffffffff34 <sampled_opcodes+0xffffffffffffff34>
     260:      	b	0xffffffffffffff3c <sampled_opcodes+0xffffffffffffff3c>
     264:      	b	0xffffffffffffffa0 <sampled_opcodes+0xffffffffffffffa0>
     268:      	b	0x44 <sampled_opcodes+0x44>
     26c:      	b	0x188 <sampled_opcodes+0x188>
     270:      	b	0x1e4 <sampled_opcodes+0x1e4>
     274:      	b	0x1f0 <sampled_opcodes+0x1f0>
     278:      	b	0x230 <sampled_opcodes+0x230>
     27c:      	csel	w20, w25, w26, eq
     280:      	lsl	w26, w24, w25
     284:      	mov	w1, w2
     288:      	orr	w5, w5, w7
     28c:      	orr	w7, w7, w8
     290:      	mov	w1, w20
     294:      	mov	w3, w20
     298:      	mov	w21, w20
     29c:      	mov	w22, w20
     2a0:      	mov	w23, w20
     2a4:      	mov	w1, w21
     2a8:      	mov	w16, w21
     2ac:      	mov	w20, w21
     2b0:      	mov	w22, w21
     2b4:      	mov	w24, w21
     2b8:      	mov	w1, w22
     2bc:      	mov	w21, w22
     2c0:      	mov	w23, w22
     2c4:      	mov	w1, w23
     2c8:      	mov	w25, w23
     2cc:      	mov	w26, w23
     2d0:      	mov	w1, w24
     2d4:      	mov	w24, w24
     2d8:      	mov	w25, w24
     2dc:      	mov	w1, w25
     2e0:      	mov	w28, w26
     2e4:      	orr	w7, wzr, #0x40000
     2e8:      	orr	w21, w21, #0x800
     2ec:      	bfxil	w20, w21, #0, #8
     2f0:      	bfxil	w21, w23, #0, #8
     2f4:      	cbz	w20, 0x314 <sampled_opcodes+0x314>
     2f8:      	cbz	w21, 0x318 <sampled_opcodes+0x318>
     2fc:      	cbnz	w20, 0x31c <sampled_opcodes+0x31c>
     300:      	cbnz	w21, 0x320 <sampled_opcodes+0x320>
     304:      	cbnz	w22, 0x324 <sampled_opcodes+0x324>
     308:      	cbnz	w7, 0x3dc <sampled_opcodes+0x3dc>
     30c:      	cbnz	w7, 0x410 <sampled_opcodes+0x410>
     310:      	cbnz	w7, 0x444 <sampled_opcodes+0x444>
     314:      	tbz	w20, #0x1f, 0x334 <sampled_opcodes+0x334>
     318:      	tbnz	w20, #0x1f, 0x340 <sampled_opcodes+0x340>
     31c:      	tbnz	w20, #0x1f, 0x350 <sampled_opcodes+0x350>
     320:      	tbnz	w20, #0x1f, 0x36c <sampled_opcodes+0x36c>
     324:      	tbnz	w20, #0x1f, 0x380 <sampled_opcodes+0x380>
     328:      	tbnz	w20, #0x1f, 0x388 <sampled_opcodes+0x388>
     32c:      	tbnz	w20, #0x1f, 0x394 <sampled_opcodes+0x394>
     330:      	tbnz	w20, #0x1f, 0x39c <sampled_opcodes+0x39c>
     334:      	tbnz	w20, #0x1f, 0x3a4 <sampled_opcodes+0x3a4>
     338:      	tbnz	w20, #0x1f, 0x3b0 <sampled_opcodes+0x3b0>
     33c:      	tbnz	w20, #0x1f, 0x3bc <sampled_opcodes+0x3bc>
     340:      	tbnz	w20, #0x1f, 0x3c8 <sampled_opcodes+0x3c8>
     344:      	tbnz	w20, #0x1f, 0x3d0 <sampled_opcodes+0x3d0>
     348:      	tbnz	w20, #0x1f, 0x3dc <sampled_opcodes+0x3dc>
     34c:      	tbnz	w20, #0x1f, 0x3e4 <sampled_opcodes+0x3e4>
     350:      	tbnz	w20, #0x1f, 0x3ec <sampled_opcodes+0x3ec>
     354:      	tbnz	w20, #0x1f, 0x3f4 <sampled_opcodes+0x3f4>
     358:      	tbnz	w20, #0x1f, 0x400 <sampled_opcodes+0x400>
     35c:      	tbnz	w20, #0x1f, 0x40c <sampled_opcodes+0x40c>
     360:      	tbnz	w20, #0x1f, 0x414 <sampled_opcodes+0x414>
     364:      	tbnz	w20, #0x1f, 0x41c <sampled_opcodes+0x41c>
     368:      	tbnz	w20, #0x1f, 0x424 <sampled_opcodes+0x424>
     36c:      	tbnz	w20, #0x1f, 0x42c <sampled_opcodes+0x42c>
     370:      	tbnz	w20, #0x1f, 0x43c <sampled_opcodes+0x43c>
     374:      	tbnz	w20, #0x1f, 0x444 <sampled_opcodes+0x444>
     378:      	tbnz	w20, #0x1f, 0x460 <sampled_opcodes+0x460>
     37c:      	tbnz	w20, #0x1f, 0x468 <sampled_opcodes+0x468>
     380:      	tbnz	w20, #0x1f, 0x470 <sampled_opcodes+0x470>
     384:      	tbnz	w20, #0x1f, 0x480 <sampled_opcodes+0x480>
     388:      	tbnz	w20, #0x1f, 0x488 <sampled_opcodes+0x488>
     38c:      	tbnz	w20, #0x1f, 0x490 <sampled_opcodes+0x490>
     390:      	tbnz	w20, #0x1f, 0x498 <sampled_opcodes+0x498>
     394:      	tbnz	w20, #0x1f, 0x4a4 <sampled_opcodes+0x4a4>
     398:      	tbnz	w20, #0x1f, 0x4ac <sampled_opcodes+0x4ac>
     39c:      	tbnz	w20, #0x1f, 0x4cc <sampled_opcodes+0x4cc>
     3a0:      	tbnz	w20, #0x1f, 0x4e0 <sampled_opcodes+0x4e0>
     3a4:      	tbnz	w20, #0x1f, 0x4e8 <sampled_opcodes+0x4e8>
     3a8:      	tbnz	w20, #0x1f, 0x4fc <sampled_opcodes+0x4fc>
     3ac:      	tbnz	w20, #0x1f, 0x504 <sampled_opcodes+0x504>
     3b0:      	tbnz	w20, #0x1f, 0x510 <sampled_opcodes+0x510>
     3b4:      	tbnz	w20, #0x1f, 0x518 <sampled_opcodes+0x518>
     3b8:      	tbnz	w20, #0x1f, 0x524 <sampled_opcodes+0x524>
     3bc:      	tbnz	w20, #0x1f, 0x534 <sampled_opcodes+0x534>
     3c0:      	tbnz	w20, #0x1f, 0x53c <sampled_opcodes+0x53c>
     3c4:      	tbnz	w20, #0x1f, 0x548 <sampled_opcodes+0x548>
     3c8:      	tbnz	w20, #0x1f, 0x570 <sampled_opcodes+0x570>
     3cc:      	tbnz	w20, #0x1f, 0x590 <sampled_opcodes+0x590>
     3d0:      	tbnz	w20, #0x1f, 0x598 <sampled_opcodes+0x598>
     3d4:      	tbnz	w20, #0x1f, 0x5ac <sampled_opcodes+0x5ac>
     3d8:      	tbnz	w20, #0x1f, 0x5cc <sampled_opcodes+0x5cc>
     3dc:      	tbnz	w20, #0x1f, 0x5dc <sampled_opcodes+0x5dc>
     3e0:      	tbnz	w20, #0x1f, 0x5e8 <sampled_opcodes+0x5e8>
     3e4:      	tbnz	w20, #0x1f, 0x5f4 <sampled_opcodes+0x5f4>
     3e8:      	tbnz	w20, #0x1f, 0x63c <sampled_opcodes+0x63c>
     3ec:      	tbnz	w20, #0x1f, 0x648 <sampled_opcodes+0x648>
     3f0:      	tbnz	w20, #0x1f, 0x67c <sampled_opcodes+0x67c>
     3f4:      	tbnz	w20, #0x1f, 0x68c <sampled_opcodes+0x68c>
     3f8:      	tbnz	w20, #0x1f, 0x6a0 <sampled_opcodes+0x6a0>
     3fc:      	tbnz	w20, #0x1f, 0x758 <sampled_opcodes+0x758>
     400:      	tbnz	w20, #0x1f, 0x768 <sampled_opcodes+0x768>
     404:      	tbnz	w20, #0x1f, 0x7f4 <sampled_opcodes+0x7f4>
     408:      	tbnz	w20, #0x1f, 0x9a4 <sampled_opcodes+0x9a4>
     40c:      	tbnz	w20, #0x1f, 0xa70 <sampled_opcodes+0xa70>
     410:      	tbnz	w20, #0x1f, 0xd08 <sampled_opcodes+0xd08>
     414:      	tbnz	w20, #0x1f, 0xe44 <sampled_opcodes+0xe44>
     418:      	tbnz	w20, #0x1f, 0x13a0 <sampled_opcodes+0x13a0>
     41c:      	tbnz	w20, #0x1f, 0x1600 <sampled_opcodes+0x1600>
     420:      	sturb	w20, [x19, #-0xc]
     424:      	sturb	w21, [x19, #-0xc]
     428:      	sturb	w22, [x19, #-0xc]
     42c:      	sturb	wzr, [x19, #-0xc]
     430:      	strb	w7, [x1, x16]
     434:      	strb	wzr, [x21, #0x190]
     438:      	strb	w23, [x22, #0x190]
     43c:      	strb	wzr, [x22, #0x190]
     440:      	strb	wzr, [x23, #0x190]
     444:      	strb	wzr, [x24, #0x190]
     448:      	ldrb	w7, [x7]
     44c:      	str	q1, [x19, #0x2f0]
     450:      	str	q1, [x19, #0x370]
     454:      	eor	w7, w7, w4
     458:      	sub	w21, w21, w20
     45c:      	sub	w22, w21, w20
     460:      	sub	w20, w20, w21
     464:      	sub	w22, w20, w21
     468:      	sub	w22, w22, w23
     46c:      	movi	v0.16b, #0x0
     470:      	sub	w20, w20, #0x1
     474:      	sub	w21, w21, #0x1
     478:      	sub	w22, w22, #0x1
     47c:      	sub	w20, w20, #0x2
     480:      	sub	w20, w20, #0x4
     484:      	sub	w21, w20, #0x4
     488:      	sub	w21, w21, #0x4
     48c:      	sub	w21, w22, #0x4
     490:      	sub	w22, w22, #0x4
     494:      	sub	w21, w23, #0x4
     498:      	sub	w21, w20, #0x8
     49c:      	sub	w22, w23, #0x8
     4a0:      	sub	w22, w20, #0x38
     4a4:      	sub	w21, w20, #0x58
     4a8:      	sub	w21, w21, #0x80, lsl #12 // =0x80000
     4ac:      	mov	w7, #0x1                // =1
     4b0:      	mov	w20, #0x1               // =1
     4b4:      	mov	w21, #0x1               // =1
     4b8:      	mov	w23, #0x1               // =1
     4bc:      	mov	w20, #0xa               // =10
     4c0:      	mov	w16, #0x10              // =16
     4c4:      	mov	w20, #0x10              // =16
     4c8:      	mov	w20, #0x12              // =18
     4cc:      	mov	w21, #0x12              // =18
     4d0:      	mov	w22, #0x12              // =18
     4d4:      	mov	w20, #0x19              // =25
     4d8:      	mov	w21, #0x19              // =25
     4dc:      	mov	w21, #0x1a              // =26
     4e0:      	mov	w24, #0x40              // =64
     4e4:      	mov	w20, #0x44              // =68
     4e8:      	mov	w26, #0x7c              // =124
     4ec:      	mov	w21, #0x186c            // =6252
     4f0:      	mov	w22, #0x1d80            // =7552
     4f4:      	mov	w21, #0x2000            // =8192
     4f8:      	mov	w8, #0x2120             // =8480
     4fc:      	mov	w20, #0x3064            // =12388
     500:      	mov	w8, #0x3100             // =12544
     504:      	mov	w25, #0x3703            // =14083
     508:      	mov	w16, #0x3b44            // =15172
     50c:      	mov	w20, #0x4556            // =17750
     510:      	mov	w20, #0x46a7            // =18087
     514:      	mov	w23, #0x512f            // =20783
     518:      	mov	w20, #0x5130            // =20784
     51c:      	mov	w20, #0x6350            // =25424
     520:      	mov	w7, #0x8090             // =32912
     524:      	mov	w20, #0xa50b            // =42251
     528:      	mov	w24, #0xa8a8            // =43176
     52c:      	mov	w21, #0xb09b            // =45211
     530:      	mov	w23, #0xb398            // =45976
     534:      	mov	w21, #0xc430            // =50224
     538:      	mov	w27, #0xc49a            // =50330
     53c:      	mov	w22, #0xea57            // =59991
     540:      	lsr	w20, w20, #1
     544:      	lsr	w20, w20, #2
     548:      	lsr	w7, w4, #5
     54c:      	lsr	w8, w7, #5
     550:      	lsr	w20, w20, #8
     554:      	lsl	w23, w22, #17
     558:      	lsl	w22, w22, #8
     55c:      	lsl	w21, w21, #5
     560:      	lsl	w20, w20, #4
     564:      	lsl	w21, w20, #4
     568:      	lsl	w21, w21, #4
     56c:      	lsl	w22, w21, #4
     570:      	lsl	w23, w21, #4
     574:      	lsl	w24, w21, #4
     578:      	lsl	w23, w23, #4
     57c:      	lsl	w24, w24, #4
     580:      	lsl	w25, w25, #4
     584:      	lsl	w20, w20, #2
     588:      	lsl	w21, w21, #2
     58c:      	lsl	w22, w22, #2
     590:      	lsl	w23, w22, #2
     594:      	lsl	w22, w21, #1
     598:      	b.ne	0x5b8 <sampled_opcodes+0x5b8>
     59c:      	b.lo	0x5bc <sampled_opcodes+0x5bc>
     5a0:      	b.ne	0x5d0 <sampled_opcodes+0x5d0>
     5a4:      	b.ne	0x600 <sampled_opcodes+0x600>
     5a8:      	b.ne	0x608 <sampled_opcodes+0x608>
     5ac:      	b.ne	0x62c <sampled_opcodes+0x62c>
     5b0:      	b.ne	0x660 <sampled_opcodes+0x660>
     5b4:      	b.ne	0x688 <sampled_opcodes+0x688>
     5b8:      	b.ne	0x690 <sampled_opcodes+0x690>
     5bc:      	b.ne	0x698 <sampled_opcodes+0x698>
     5c0:      	b.ne	0x6a0 <sampled_opcodes+0x6a0>
     5c4:      	b.ne	0x6a8 <sampled_opcodes+0x6a8>
     5c8:      	b.ne	0x6b4 <sampled_opcodes+0x6b4>
     5cc:      	b.ne	0x6bc <sampled_opcodes+0x6bc>
     5d0:      	b.ne	0x700 <sampled_opcodes+0x700>
     5d4:      	b.ne	0x718 <sampled_opcodes+0x718>
     5d8:      	b.ne	0x724 <sampled_opcodes+0x724>
     5dc:      	b.ne	0x73c <sampled_opcodes+0x73c>
     5e0:      	b.ne	0x744 <sampled_opcodes+0x744>
     5e4:      	b.ne	0x760 <sampled_opcodes+0x760>
     5e8:      	b.ne	0x76c <sampled_opcodes+0x76c>
     5ec:      	b.ne	0x774 <sampled_opcodes+0x774>
     5f0:      	b.ne	0x7b0 <sampled_opcodes+0x7b0>
     5f4:      	b.ne	0x7c8 <sampled_opcodes+0x7c8>
     5f8:      	b.ne	0x7e4 <sampled_opcodes+0x7e4>
     5fc:      	b.ne	0x80c <sampled_opcodes+0x80c>
     600:      	b.ne	0x814 <sampled_opcodes+0x814>
     604:      	b.ne	0x820 <sampled_opcodes+0x820>
     608:      	b.ne	0x838 <sampled_opcodes+0x838>
     60c:      	b.ne	0x88c <sampled_opcodes+0x88c>
     610:      	b.ne	0x898 <sampled_opcodes+0x898>
     614:      	b.ne	0x8a0 <sampled_opcodes+0x8a0>
     618:      	b.ne	0x8e0 <sampled_opcodes+0x8e0>
     61c:      	b.ne	0x944 <sampled_opcodes+0x944>
     620:      	b.ne	0x9d8 <sampled_opcodes+0x9d8>
     624:      	b.ne	0xb20 <sampled_opcodes+0xb20>
     628:      	b.ne	0xb9c <sampled_opcodes+0xb9c>
     62c:      	b.ne	0xbc8 <sampled_opcodes+0xbc8>
     630:      	b.ne	0xc2c <sampled_opcodes+0xc2c>
     634:      	b.ne	0x10e0 <sampled_opcodes+0x10e0>
     638:      	b.ne	0x11b0 <sampled_opcodes+0x11b0>
     63c:      	b.ne	0x11d8 <sampled_opcodes+0x11d8>
     640:      	b.ne	0x1448 <sampled_opcodes+0x1448>
     644:      	b.ne	0x1674 <sampled_opcodes+0x1674>
     648:      	b.ne	0x17dc <sampled_opcodes+0x17dc>
     64c:      	b.ne	0x1934 <sampled_opcodes+0x1934>
     650:      	b.ne	0x5d0 <sampled_opcodes+0x5d0>
     654:      	cmp	w7, w5
     658:      	cmp	w7, w6
     65c:      	cmp	w7, w8
     660:      	cmp	w22, w20
     664:      	cmp	w20, w21
     668:      	cmp	w16, w30
     66c:      	cmp	w21, #0x0
     670:      	cmp	w20, #0x41
     674:      	tst	w20, #0xff
     678:      	tst	w20, #0xffff
     67c:      	movk	w2, #0x1, lsl #16
     680:      	movk	w3, #0x1, lsl #16
     684:      	movk	w8, #0x7, lsl #16
     688:      	movk	w16, #0x8, lsl #16
     68c:      	movk	w22, #0x8, lsl #16
     690:      	movk	w25, #0xd, lsl #16
     694:      	movk	w22, #0xe, lsl #16
     698:      	movk	w24, #0xe, lsl #16
     69c:      	movk	w23, #0x10, lsl #16
     6a0:      	movk	w24, #0x10, lsl #16
     6a4:      	movk	w23, #0x11, lsl #16
     6a8:      	movk	w22, #0x2b, lsl #16
     6ac:      	movk	w20, #0x2f, lsl #16
     6b0:      	movk	w23, #0x3b, lsl #16
     6b4:      	movk	w20, #0x4e, lsl #16
     6b8:      	movk	w23, #0x4f, lsl #16
     6bc:      	movk	w20, #0x8002, lsl #16
     6c0:      	strh	w26, [x24, #0x8]
     6c4:      	strh	w20, [x19, #0x222]
     6c8:      	strh	w21, [x19, #0x222]
     6cc:      	strh	w22, [x19, #0x222]
     6d0:      	strh	w23, [x19, #0x222]
     6d4:      	strh	w24, [x19, #0x222]
     6d8:      	strh	w25, [x19, #0x222]
     6dc:      	strh	w20, [x19, #0x224]
     6e0:      	strh	w21, [x19, #0x224]
     6e4:      	strh	w22, [x19, #0x224]
     6e8:      	strh	w23, [x19, #0x224]
     6ec:      	strh	w24, [x19, #0x224]
     6f0:      	strh	w25, [x19, #0x224]
     6f4:      	strh	w26, [x19, #0x224]
     6f8:      	ldrh	w22, [x22, #0x8]
     6fc:      	ldrh	w23, [x23, #0x8]
     700:      	ldrh	w24, [x24, #0x8]
     704:      	ldrh	w25, [x25, #0x8]
     708:      	ldrh	w26, [x26, #0x8]
     70c:      	ldrh	w27, [x27, #0x8]
     710:      	ldrh	w28, [x28, #0x8]
     714:      	stlr	w0, [x30]
     718:      	stlr	w20, [x30]
     71c:      	stlr	w21, [x30]
     720:      	stlr	w22, [x30]
     724:      	stlr	w23, [x30]
     728:      	stlr	w24, [x30]
     72c:      	and	x16, x16, x20, lsr #7
     730:      	and	x16, x16, x21, lsr #7
     734:      	and	x16, x16, x22, lsr #7
     738:      	and	x16, x16, x23, lsr #7
     73c:      	and	x16, x16, x24, lsr #7
     740:      	and	x16, x16, x25, lsr #7
     744:      	add	x1, x0, x7
     748:      	add	x3, x3, x7
     74c:      	add	x4, x4, x8, lsl #32
     750:      	add	x17, x17, x16
     754:      	add	x1, x21, x19
     758:      	add	x21, x21, x19
     75c:      	add	x1, x22, x19
     760:      	add	x2, x22, x19
     764:      	add	x22, x22, x19
     768:      	add	x1, x23, x19
     76c:      	add	x23, x23, x19
     770:      	add	x1, x24, x19
     774:      	add	x24, x24, x19
     778:      	add	x1, x25, x19
     77c:      	add	x25, x25, x19
     780:      	add	x30, x17, w20, uxtw
     784:      	add	x30, x17, w21, uxtw
     788:      	add	x30, x17, w22, uxtw
     78c:      	add	x30, x17, w23, uxtw
     790:      	add	x30, x17, w24, uxtw
     794:      	add	x30, x17, w25, uxtw
     798:      	add	x30, x17, w26, uxtw
     79c:      	add	x30, x17, w27, uxtw
     7a0:      	add	x30, x17, w28, uxtw
     7a4:      	adrp	x16, 0x4dcb4000 <sampled_opcodes+0x4dcb4000>
     7a8:      	adrp	x16, 0x4ddac000 <sampled_opcodes+0x4ddac000>
     7ac:      	adrp	x16, 0x4e110000 <sampled_opcodes+0x4e110000>
     7b0:      	adrp	x16, 0x4e1b0000 <sampled_opcodes+0x4e1b0000>
     7b4:      	adrp	x16, 0x4e2e8000 <sampled_opcodes+0x4e2e8000>
     7b8:      	adrp	x16, 0x4e34c000 <sampled_opcodes+0x4e34c000>
     7bc:      	adrp	x16, 0x4e354000 <sampled_opcodes+0x4e354000>
     7c0:      	adrp	x16, 0x4e3cc000 <sampled_opcodes+0x4e3cc000>
     7c4:      	adrp	x16, 0x4e3d0000 <sampled_opcodes+0x4e3d0000>
     7c8:      	adrp	x16, 0x4e414000 <sampled_opcodes+0x4e414000>
     7cc:      	adrp	x16, 0x4e5ec000 <sampled_opcodes+0x4e5ec000>
     7d0:      	adrp	x16, 0x4e6d8000 <sampled_opcodes+0x4e6d8000>
     7d4:      	adrp	x16, 0x4e7a4000 <sampled_opcodes+0x4e7a4000>
     7d8:      	adrp	x16, 0x4ea30000 <sampled_opcodes+0x4ea30000>
     7dc:      	adrp	x16, 0x4f7dc000 <sampled_opcodes+0x4f7dc000>
     7e0:      	adrp	x16, 0x4fb5c000 <sampled_opcodes+0x4fb5c000>
     7e4:      	adrp	x16, 0x4fdc4000 <sampled_opcodes+0x4fdc4000>
     7e8:      	adrp	x16, 0x5078c000 <sampled_opcodes+0x5078c000>
     7ec:      	adrp	x7, 0x54c7c000 <sampled_opcodes+0x54c7c000>
     7f0:      	add	x3, x3, #0x10
     7f4:      	add	x7, x7, #0x1c0
     7f8:      	add	x1, x19, #0x258
     7fc:      	add	x2, x19, #0x258
     800:      	add	x20, x19, #0x258
     804:      	add	x22, x19, #0x258
     808:      	add	x24, x19, #0x258
     80c:      	add	x16, x16, #0x2f8
     810:      	add	x24, x19, #0x330
     814:      	add	x16, x16, #0x484
     818:      	add	x16, x16, #0x5c0
     81c:      	add	x16, x16, #0x5e8
     820:      	add	x16, x16, #0x900
     824:      	add	x16, x16, #0xb4c
     828:      	add	x7, x7, #0xe08
     82c:      	sxtw	x20, w20
     830:      	sxtw	x21, w20
     834:      	sxtw	x22, w20
     838:      	sxtw	x24, w20
     83c:      	sxtw	x20, w21
     840:      	sxtw	x21, w21
     844:      	sxtw	x22, w21
     848:      	sxtw	x23, w21
     84c:      	sxtw	x24, w21
     850:      	sxtw	x28, w21
     854:      	sxtw	x20, w22
     858:      	sxtw	x21, w22
     85c:      	sxtw	x22, w22
     860:      	sxtw	x21, w23
     864:      	sxtw	x23, w23
     868:      	sxtw	x26, w26
     86c:      	sxtw	x27, w27
     870:      	bl	0xfffffffffb2284e0 <sampled_opcodes+0xfffffffffb2284e0>
     874:      	bl	0xfffffffffc86a1e8 <sampled_opcodes+0xfffffffffc86a1e8>
     878:      	bl	0xfffffffffcb7b9d4 <sampled_opcodes+0xfffffffffcb7b9d4>
     87c:      	bl	0xfffffffffcc49eb4 <sampled_opcodes+0xfffffffffcc49eb4>
     880:      	mul	x25, x26, x25
     884:      	ldp	x16, x17, [x17]
     888:      	ldp	x17, x16, [x17, #0x8]
     88c:      	ldp	x16, x17, [x19, #-0x70]
     890:      	stp	xzr, x30, [sp, #-0x10]!
     894:      	mov	x28, x0
     898:      	mov	x0, x19
     89c:      	adrp	x16, 0x4dc61000 <sampled_opcodes+0x4dc61000>
     8a0:      	adrp	x16, 0x4e111000 <sampled_opcodes+0x4e111000>
     8a4:      	adrp	x16, 0x4e121000 <sampled_opcodes+0x4e121000>
     8a8:      	adrp	x16, 0x4e3cd000 <sampled_opcodes+0x4e3cd000>
     8ac:      	adrp	x16, 0x4e419000 <sampled_opcodes+0x4e419000>
     8b0:      	adrp	x16, 0x4e5dd000 <sampled_opcodes+0x4e5dd000>
     8b4:      	adrp	x16, 0x4e6a5000 <sampled_opcodes+0x4e6a5000>
     8b8:      	adrp	x16, 0x4e6d1000 <sampled_opcodes+0x4e6d1000>
     8bc:      	adrp	x16, 0x4e6d9000 <sampled_opcodes+0x4e6d9000>
     8c0:      	adrp	x16, 0x4e719000 <sampled_opcodes+0x4e719000>
     8c4:      	adrp	x16, 0x4f9c5000 <sampled_opcodes+0x4f9c5000>
     8c8:      	adrp	x16, 0x4fb5d000 <sampled_opcodes+0x4fb5d000>
     8cc:      	adrp	x16, 0x4fb8d000 <sampled_opcodes+0x4fb8d000>
     8d0:      	adrp	x16, 0x4ffed000 <sampled_opcodes+0x4ffed000>
     8d4:      	adrp	x16, 0x50411000 <sampled_opcodes+0x50411000>
     8d8:      	adrp	x16, 0x51211000 <sampled_opcodes+0x51211000>
     8dc:      	adrp	x16, 0x543a1000 <sampled_opcodes+0x543a1000>
     8e0:      	cbz	x2, 0x918 <sampled_opcodes+0x918>
     8e4:      	cbnz	x7, 0x908 <sampled_opcodes+0x908>
     8e8:      	cbnz	x7, 0xa14 <sampled_opcodes+0xa14>
     8ec:      	ldur	w20, [x19, #-0x10]
     8f0:      	ldr	w8, [x3, x16]
     8f4:      	ldapr	w1, [x30]
     8f8:      	ldapr	w2, [x30]
     8fc:      	ldapr	w20, [x30]
     900:      	ldapr	w21, [x30]
     904:      	ldapr	w22, [x30]
     908:      	str	w20, [x19]
     90c:      	str	w21, [x19]
     910:      	str	w22, [x19]
     914:      	str	w23, [x19]
     918:      	str	w23, [x24]
     91c:      	str	w20, [x19, #0x4]
     920:      	str	w21, [x19, #0x4]
     924:      	str	w22, [x19, #0x4]
     928:      	str	w23, [x19, #0x4]
     92c:      	str	w24, [x19, #0x4]
     930:      	str	w26, [x19, #0x4]
     934:      	str	w20, [x19, #0x8]
     938:      	str	w21, [x19, #0x8]
     93c:      	str	w22, [x19, #0x8]
     940:      	str	w23, [x19, #0x8]
     944:      	str	w20, [x19, #0xc]
     948:      	str	w22, [x19, #0xc]
     94c:      	str	w23, [x19, #0xc]
     950:      	str	w20, [x19, #0x10]
     954:      	str	w21, [x19, #0x10]
     958:      	str	w23, [x19, #0x10]
     95c:      	str	w20, [x19, #0x14]
     960:      	str	w21, [x19, #0x14]
     964:      	str	w22, [x19, #0x14]
     968:      	str	w23, [x19, #0x14]
     96c:      	str	w24, [x19, #0x14]
     970:      	str	w20, [x19, #0x18]
     974:      	str	w21, [x19, #0x18]
     978:      	str	w22, [x19, #0x18]
     97c:      	str	w20, [x19, #0x1c]
     980:      	str	w21, [x19, #0x1c]
     984:      	str	w22, [x19, #0x1c]
     988:      	str	w23, [x19, #0x1c]
     98c:      	str	w24, [x19, #0x1c]
     990:      	str	w25, [x19, #0x1c]
     994:      	str	w20, [x19, #0x20]
     998:      	str	w21, [x19, #0x20]
     99c:      	str	w20, [x19, #0x28]
     9a0:      	str	w21, [x19, #0x28]
     9a4:      	str	w22, [x19, #0x28]
     9a8:      	str	w23, [x19, #0x28]
     9ac:      	str	w24, [x19, #0x28]
     9b0:      	str	wzr, [x19, #0x28]
     9b4:      	str	w0, [x19, #0x2c]
     9b8:      	str	w21, [x19, #0x2c]
     9bc:      	str	w22, [x19, #0x2c]
     9c0:      	str	w24, [x19, #0x2c]
     9c4:      	str	w20, [x19, #0x34]
     9c8:      	str	w21, [x19, #0x34]
     9cc:      	str	w22, [x19, #0x34]
     9d0:      	str	wzr, [x19, #0x34]
     9d4:      	str	w20, [sp, #0x80]
     9d8:      	str	w21, [sp, #0x80]
     9dc:      	str	w21, [sp, #0x84]
     9e0:      	str	w20, [sp, #0x90]
     9e4:      	str	w20, [x19, #0x188]
     9e8:      	str	w21, [x19, #0x188]
     9ec:      	str	wzr, [x19, #0x188]
     9f0:      	str	w20, [x19, #0x228]
     9f4:      	str	w21, [x19, #0x228]
     9f8:      	str	w22, [x19, #0x228]
     9fc:      	str	w23, [x19, #0x228]
     a00:      	str	w24, [x19, #0x228]
     a04:      	str	w26, [x19, #0x228]
     a08:      	str	w27, [x19, #0x228]
     a0c:      	str	w20, [x19, #0x230]
     a10:      	str	w22, [x19, #0x230]
     a14:      	str	w24, [x19, #0x230]
     a18:      	str	w28, [x19, #0x230]
     a1c:      	str	w20, [x19, #0x4b0]
     a20:      	ldr	w7, [x7]
     a24:      	ldr	w20, [x19]
     a28:      	ldr	w21, [x19]
     a2c:      	ldr	w22, [x19]
     a30:      	ldr	w23, [x19]
     a34:      	ldr	w20, [x19, #0x4]
     a38:      	ldr	w21, [x19, #0x4]
     a3c:      	ldr	w22, [x19, #0x4]
     a40:      	ldr	w21, [x19, #0x8]
     a44:      	ldr	w22, [x19, #0x8]
     a48:      	ldr	w21, [x19, #0xc]
     a4c:      	ldr	w7, [x2, #0x10]
     a50:      	ldr	w20, [x19, #0x10]
     a54:      	ldr	w21, [x19, #0x10]
     a58:      	ldr	w23, [x19, #0x10]
     a5c:      	ldr	w7, [x2, #0x14]
     a60:      	ldr	w20, [x19, #0x14]
     a64:      	ldr	w21, [x19, #0x14]
     a68:      	ldr	w20, [x19, #0x18]
     a6c:      	ldr	w21, [x19, #0x18]
     a70:      	ldr	w22, [x19, #0x18]
     a74:      	ldr	w23, [x19, #0x18]
     a78:      	ldr	w20, [x19, #0x1c]
     a7c:      	ldr	w21, [x19, #0x1c]
     a80:      	ldr	w22, [x19, #0x1c]
     a84:      	ldr	w4, [x0, #0x20]
     a88:      	ldr	w7, [x0, #0x24]
     a8c:      	ldr	w1, [x19, #0x2c]
     a90:      	ldr	w2, [x19, #0x30]
     a94:      	ldr	w5, [x0, #0x3c]
     a98:      	ldr	w20, [x19, #0x54]
     a9c:      	ldr	w21, [x19, #0x54]
     aa0:      	ldr	w22, [x19, #0x54]
     aa4:      	ldr	w24, [x19, #0x54]
     aa8:      	ldr	w7, [x0, #0x58]
     aac:      	ldr	w20, [x19, #0x64]
     ab0:      	ldr	w22, [x19, #0x64]
     ab4:      	ldr	w23, [x19, #0x64]
     ab8:      	ldr	w24, [x19, #0x64]
     abc:      	ldr	w26, [x19, #0x64]
     ac0:      	ldr	w20, [x19, #0x74]
     ac4:      	ldr	w21, [x19, #0x74]
     ac8:      	ldr	w23, [x19, #0x74]
     acc:      	ldr	w27, [x19, #0x74]
     ad0:      	ldr	w21, [sp, #0x88]
     ad4:      	ldr	w20, [sp, #0x8c]
     ad8:      	ldr	w20, [sp, #0x90]
     adc:      	ldr	w7, [x1, #0xd4]
     ae0:      	ldr	w20, [x19, #0x188]
     ae4:      	ldr	w21, [x19, #0x188]
     ae8:      	ldr	w22, [x19, #0x188]
     aec:      	ldr	w23, [x19, #0x188]
     af0:      	ldr	w6, [x1, #0x334]
     af4:      	adrp	x16, 0x4ddda000 <sampled_opcodes+0x4ddda000>
     af8:      	adrp	x16, 0x4de82000 <sampled_opcodes+0x4de82000>
     afc:      	adrp	x16, 0x4dffe000 <sampled_opcodes+0x4dffe000>
     b00:      	adrp	x16, 0x4e132000 <sampled_opcodes+0x4e132000>
     b04:      	adrp	x16, 0x4e1ea000 <sampled_opcodes+0x4e1ea000>
     b08:      	adrp	x16, 0x4e242000 <sampled_opcodes+0x4e242000>
     b0c:      	adrp	x16, 0x4e34a000 <sampled_opcodes+0x4e34a000>
     b10:      	adrp	x16, 0x4e352000 <sampled_opcodes+0x4e352000>
     b14:      	adrp	x16, 0x4e356000 <sampled_opcodes+0x4e356000>
     b18:      	adrp	x16, 0x4e35a000 <sampled_opcodes+0x4e35a000>
     b1c:      	adrp	x16, 0x4e3b2000 <sampled_opcodes+0x4e3b2000>
     b20:      	adrp	x16, 0x4e3b6000 <sampled_opcodes+0x4e3b6000>
     b24:      	adrp	x16, 0x4e412000 <sampled_opcodes+0x4e412000>
     b28:      	adrp	x16, 0x4e416000 <sampled_opcodes+0x4e416000>
     b2c:      	adrp	x16, 0x4e51a000 <sampled_opcodes+0x4e51a000>
     b30:      	adrp	x16, 0x4e71a000 <sampled_opcodes+0x4e71a000>
     b34:      	adrp	x16, 0x4f552000 <sampled_opcodes+0x4f552000>
     b38:      	adrp	x16, 0x4ff66000 <sampled_opcodes+0x4ff66000>
     b3c:      	adrp	x16, 0x510fe000 <sampled_opcodes+0x510fe000>
     b40:      	adrp	x16, 0x54402000 <sampled_opcodes+0x54402000>
     b44:      	adrp	x7, 0x54c02000 <sampled_opcodes+0x54c02000>
     b48:      	dmb	ishld
     b4c:      	dmb	ish
     b50:      	blr	x16
     b54:      	ret
     b58:      	cmp	x7, x4
     b5c:      	adrp	x16, 0x4dd7b000 <sampled_opcodes+0x4dd7b000>
     b60:      	adrp	x16, 0x4de3b000 <sampled_opcodes+0x4de3b000>
     b64:      	adrp	x16, 0x4e04b000 <sampled_opcodes+0x4e04b000>
     b68:      	adrp	x16, 0x4e29f000 <sampled_opcodes+0x4e29f000>
     b6c:      	adrp	x16, 0x4e2b7000 <sampled_opcodes+0x4e2b7000>
     b70:      	adrp	x16, 0x4e2db000 <sampled_opcodes+0x4e2db000>
     b74:      	adrp	x16, 0x4e353000 <sampled_opcodes+0x4e353000>
     b78:      	adrp	x16, 0x4e3c3000 <sampled_opcodes+0x4e3c3000>
     b7c:      	adrp	x16, 0x4e3cb000 <sampled_opcodes+0x4e3cb000>
     b80:      	adrp	x16, 0x4fb8b000 <sampled_opcodes+0x4fb8b000>
     b84:      	adrp	x16, 0x50417000 <sampled_opcodes+0x50417000>
     b88:      	ldapr	x21, [x30]
     b8c:      	str	x23, [x20]
     b90:      	str	x24, [x22]
     b94:      	str	x25, [x22]
     b98:      	str	x26, [x23]
     b9c:      	str	x27, [x24]
     ba0:      	str	x9, [x28]
     ba4:      	str	xzr, [x19, #0x190]
     ba8:      	str	x23, [x19, #0x2f0]
     bac:      	str	x23, [x19, #0x330]
     bb0:      	str	x24, [x19, #0x3b0]
     bb4:      	str	x23, [x19, #0x3f0]
     bb8:      	str	x23, [x19, #0x430]
     bbc:      	str	x23, [x19, #0x470]
     bc0:      	str	x21, [x19, #0x4b0]
     bc4:      	str	x23, [x19, #0x4b0]
     bc8:      	str	x21, [x19, #0x4f0]
     bcc:      	str	x22, [x19, #0x4f0]
     bd0:      	str	x23, [x19, #0x4f0]
     bd4:      	str	x24, [x19, #0x4f0]
     bd8:      	ldr	x2, [x3]
     bdc:      	ldr	x22, [x20]
     be0:      	ldr	x25, [x24]
     be4:      	ldr	x27, [x26]
     be8:      	ldr	x7, [x2, #0x8]
     bec:      	ldr	x7, [x3, #0x8]
     bf0:      	ldr	x0, [x2, #0x28]
     bf4:      	ldr	x3, [x1, #0x258]
     bf8:      	ldr	x7, [x1, #0x280]
     bfc:      	ldr	x24, [x19, #0x2b8]
