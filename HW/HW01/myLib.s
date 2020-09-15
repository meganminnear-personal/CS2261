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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	drawRect
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	add	r5, r0, r2
	cmp	r0, r5
	ldrh	ip, [sp, #16]
	bge	.L5
	ldr	r2, .L13
	add	lr, r1, r3
	ldr	r2, [r2]
	rsb	r3, lr, lr, lsl #4
	rsb	r4, r1, r1, lsl #4
	add	r3, r0, r3, lsl #4
	lsl	r4, r4, #5
	sub	r6, lr, lr, lsl #4
	add	r2, r2, r3, lsl #1
	add	r4, r4, r6, lsl #5
.L7:
	cmp	r1, lr
	addlt	r3, r2, r4
	bge	.L10
.L8:
	strh	ip, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L8
.L10:
	add	r0, r0, #1
	cmp	r0, r5
	add	r2, r2, #2
	bne	.L7
.L5:
	pop	{r4, r5, r6, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L19
	ldr	r3, [r3]
	add	r2, r3, #76800
.L16:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L16
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.size	fillScreen, .-fillScreen
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L22:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L22
	mov	r2, #67108864
.L23:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L23
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	lr, [sp, #16]
	ldr	ip, [sp, #24]
	add	ip, lr, ip
	ldr	r5, [sp, #20]
	ldr	r4, [sp, #28]
	sub	r6, ip, #1
	cmp	r6, r0
	add	r2, r0, r2
	add	r4, r5, r4
	ble	.L28
	cmp	lr, r2
	blt	.L33
.L28:
	sub	r6, r2, #1
	cmp	r6, lr
	cmpgt	ip, r0
	bgt	.L33
	cmp	ip, r0
	sub	r6, r4, #1
	movge	ip, #0
	movlt	ip, #1
	cmp	lr, r2
	movle	r2, #0
	movgt	r2, #1
	cmp	r6, r1
	mov	r0, r6
	add	r3, r1, r3
	bgt	.L35
.L31:
	cmp	r1, r4
	movlt	r1, #1
	movge	r1, #0
	cmp	r5, r3
	movlt	r1, #0
	eor	r1, r1, #1
	orr	r1, r2, r1
	orr	r1, ip, r1
	eor	r0, r1, #1
	pop	{r4, r5, r6, lr}
	bx	lr
.L35:
	cmp	r5, r3
	orrlt	ip, ip, r2
	eorlt	r0, ip, #1
	bge	.L31
	pop	{r4, r5, r6, lr}
	bx	lr
.L33:
	cmp	r1, r4
	movge	r0, #0
	movlt	r0, #1
	pop	{r4, r5, r6, lr}
	bx	lr
	.size	collision, .-collision
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
