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
	ldr	r3, .L17
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	ldr	fp, .L17+4
	ldr	r10, .L17+8
	ldr	r6, .L17+12
	ldr	r5, .L17+16
	ldr	r9, .L17+20
	ldr	r4, .L17+24
	ldr	r8, .L17+28
	ldr	r7, .L17+32
.L15:
	mov	lr, pc
	bx	fp
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldr	r1, [r5]
	ldr	r0, [r9]
	mov	r3, #5
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	ldr	r3, .L17+36
	ldr	r2, [r6]
	str	r3, [sp]
	ldr	r1, [r5]
	mov	r3, #5
	ldr	r0, [r8]
	mov	lr, pc
	bx	r4
	b	.L15
.L18:
	.align	2
.L17:
	.word	initialize
	.word	updatePaddlePosition
	.word	waitForVBlank
	.word	paddleSize
	.word	paddleY
	.word	prevPaddleX
	.word	drawRect
	.word	paddleX
	.word	32767
	.word	24319
	.size	main, .-main
	.comm	screenHeight,4,4
	.comm	screenWidth,4,4
	.comm	padding,4,4
	.comm	prevPaddleX,4,4
	.comm	paddleY,4,4
	.comm	paddleX,4,4
	.comm	paddleSize,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
