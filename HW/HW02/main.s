	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	ldr	r2, .L4
	push	{r4, lr}
	mov	r4, #3
	strh	r2, [r3]	@ movhi
	ldr	r0, .L4+4
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	mov	r0, #234
	mov	ip, #154
	mov	lr, #58
	mov	r3, #91
	mov	r1, #151
	ldr	r2, .L4+12
	str	r4, [r2]
	ldr	r2, .L4+16
	str	r0, [r2]
	ldr	r0, .L4+20
	ldr	r2, .L4+24
	str	ip, [r0]
	str	lr, [r2]
	ldr	ip, .L4+28
	ldr	r0, .L4+32
	ldr	r2, .L4+36
	str	r3, [ip]
	str	r3, [r0]
	str	r1, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	32767
	.word	fillScreen
	.word	padding
	.word	screenWidth
	.word	screenHeight
	.word	paddleSize
	.word	paddleX
	.word	prevPaddleX
	.word	paddleY
	.size	initialize, .-initialize
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateGame, .-updateGame
	.align	2
	.global	updatePaddlePosition
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePaddlePosition, %function
updatePaddlePosition:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L12
	ldrh	r2, [r2, #48]
	ldr	r1, .L12+4
	tst	r2, #32
	ldr	r2, .L12
	ldr	r3, [r1]
	ldr	r0, .L12+8
	ldrh	r2, [r2, #48]
	str	r3, [r0]
	subeq	r3, r3, #1
	streq	r3, [r1]
	tst	r2, #16
	ldr	r2, .L12+12
	ldr	r0, [r2]
	ldr	r2, .L12+16
	addeq	r3, r3, #1
	streq	r3, [r1]
	ldr	r2, [r2]
	cmp	r0, r3
	addge	r3, r0, #1
	strge	r3, [r1]
	rsb	ip, r0, #239
	add	r3, r2, r3
	cmp	r3, ip
	rsbge	r2, r2, #239
	subge	r2, r2, r0
	strge	r2, [r1]
	bx	lr
.L13:
	.align	2
.L12:
	.word	67109120
	.word	paddleX
	.word	prevPaddleX
	.word	padding
	.word	paddleSize
	.size	updatePaddlePosition, .-updatePaddlePosition
	.align	2
	.global	updateRectPosition
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateRectPosition, %function
updateRectPosition:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L15
	ldr	r3, [r2]
	ldr	r1, .L15+4
	add	r0, r3, #1
	str	r0, [r2]
	str	r3, [r1]
	bx	lr
.L16:
	.align	2
.L15:
	.word	rectY
	.word	prevRectY
	.size	updateRectPosition, .-updateRectPosition
	.global	__aeabi_idivmod
	.align	2
	.global	drawGoodRect
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGoodRect, %function
drawGoodRect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L21
	sub	sp, sp, #8
	mov	lr, pc
	bx	r3
	ldr	r2, .L21+4
	ldr	r3, .L21+8
	ldr	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+12
	cmp	r1, #209
	str	r1, [r3]
	ble	.L18
	ldr	r2, .L21+16
	ldr	r1, [r2]
	rsb	r0, r1, #210
	str	r0, [r3]
.L19:
	ldr	r3, .L21+20
	ldr	lr, .L21+24
	ldr	r2, .L21+28
	ldr	ip, .L21+32
	str	r3, [sp]
	ldr	r4, .L21+36
	strh	r3, [lr]	@ movhi
	str	r1, [r2]
	mov	r3, #30
	mov	r2, #20
	str	r1, [ip]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L18:
	ldr	r2, .L21+16
	cmp	r1, #0
	mov	r0, r1
	ldr	r1, [r2]
	moveq	r0, r1
	streq	r1, [r3]
	b	.L19
.L22:
	.align	2
.L21:
	.word	rand
	.word	screenWidth
	.word	__aeabi_idivmod
	.word	rectX
	.word	padding
	.word	18367
	.word	.LANCHOR0
	.word	rectY
	.word	prevRectY
	.word	drawRect
	.size	drawGoodRect, .-drawGoodRect
	.align	2
	.global	drawBadRect
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBadRect, %function
drawBadRect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L27
	sub	sp, sp, #8
	mov	lr, pc
	bx	r3
	ldr	r2, .L27+4
	ldr	r3, .L27+8
	ldr	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+12
	cmp	r1, #209
	str	r1, [r3]
	ble	.L24
	ldr	r2, .L27+16
	ldr	r1, [r2]
	rsb	r0, r1, #210
	str	r0, [r3]
.L25:
	ldr	r3, .L27+20
	ldr	lr, .L27+24
	ldr	r2, .L27+28
	ldr	ip, .L27+32
	str	r3, [sp]
	ldr	r4, .L27+36
	strh	r3, [lr]	@ movhi
	str	r1, [r2]
	mov	r3, #30
	mov	r2, #20
	str	r1, [ip]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L24:
	ldr	r2, .L27+16
	cmp	r1, #0
	mov	r0, r1
	ldr	r1, [r2]
	moveq	r0, r1
	streq	r1, [r3]
	b	.L25
.L28:
	.align	2
.L27:
	.word	rand
	.word	screenWidth
	.word	__aeabi_idivmod
	.word	rectX
	.word	padding
	.word	15889
	.word	.LANCHOR0
	.word	rectY
	.word	prevRectY
	.word	drawRect
	.size	drawBadRect, .-drawBadRect
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkRects.part.0, %function
checkRects.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, .L32
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	mov	r4, r0
	ldr	r2, .L32+4
	ldr	r3, .L32+8
	ldr	r1, .L32+12
	ldr	r0, [r2]
	ldr	r1, [r1]
	mov	r2, #20
	str	r3, [sp]
	ldr	r5, .L32+16
	mov	r3, #30
	mov	lr, pc
	bx	r5
	tst	r4, #1
	bne	.L30
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	drawGoodRect
.L30:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	drawBadRect
.L33:
	.align	2
.L32:
	.word	rand
	.word	rectX
	.word	32767
	.word	rectY
	.word	drawRect
	.size	checkRects.part.0, .-checkRects.part.0
	.align	2
	.global	checkRects
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkRects, %function
checkRects:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L36
	ldr	r1, .L36+4
	ldr	r2, .L36+8
	ldr	r3, [r3]
	ldr	r1, [r1]
	ldr	r2, [r2]
	add	r3, r3, r1
	cmp	r3, r2
	bxne	lr
	b	checkRects.part.0
.L37:
	.align	2
.L36:
	.word	screenHeight
	.word	padding
	.word	rectY
	.size	checkRects, .-checkRects
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r7, fp, lr}
	ldr	r3, .L42
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	ldr	fp, .L42+4
	ldr	r10, .L42+8
	ldr	r5, .L42+12
	ldr	r9, .L42+16
	ldr	r8, .L42+20
	ldr	r7, .L42+24
	ldr	r4, .L42+28
	ldr	r6, .L42+32
	b	.L40
.L39:
	ldr	r3, .L42+36
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	add	r2, r3, #1
	str	r3, [r9]
	ldr	r3, .L42+40
	str	r2, [r5]
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+44
	ldr	r0, .L42+48
	str	r3, [sp]
	ldr	r2, [r8]
	mov	r3, #5
	ldr	r1, [r7]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r2, .L42+52
	ldr	r0, .L42+56
	str	r2, [sp]
	mov	r3, #5
	ldr	r2, [r8]
	ldr	r1, [r7]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r3, .L42+44
	mov	r2, #20
	str	r3, [sp]
	ldr	r1, [r9]
	mov	r3, #30
	ldr	r0, [r6]
	mov	lr, pc
	bx	r4
	ldr	r3, .L42+60
	ldrh	r2, [r3]
	ldr	r1, [r5]
	str	r2, [sp]
	mov	r3, #30
	mov	r2, #20
	ldr	r0, [r6]
	mov	lr, pc
	bx	r4
.L40:
	ldr	r3, [fp]
	ldr	r1, [r10]
	ldr	r2, [r5]
	add	r3, r3, r1
	cmp	r3, r2
	bne	.L39
	ldr	r3, .L42+64
	mov	lr, pc
	bx	r3
	b	.L39
.L43:
	.align	2
.L42:
	.word	initialize
	.word	screenHeight
	.word	padding
	.word	rectY
	.word	prevRectY
	.word	paddleSize
	.word	paddleY
	.word	drawRect
	.word	rectX
	.word	updatePaddlePosition
	.word	waitForVBlank
	.word	32767
	.word	prevPaddleX
	.word	24319
	.word	paddleX
	.word	.LANCHOR0
	.word	checkRects.part.0
	.size	main, .-main
	.comm	state,4,4
	.comm	prevRectY,4,4
	.comm	rectY,4,4
	.comm	rectX,4,4
	.global	rectType
	.comm	screenHeight,4,4
	.comm	screenWidth,4,4
	.comm	padding,4,4
	.comm	prevPaddleX,4,4
	.comm	paddleY,4,4
	.comm	paddleX,4,4
	.comm	paddleSize,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.data
	.align	1
	.set	.LANCHOR0,. + 0
	.type	rectType, %object
	.size	rectType, 2
rectType:
	.short	15889
	.ident	"GCC: (devkitARM release 53) 9.1.0"
