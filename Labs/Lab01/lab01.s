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
	.file	"lab01.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect.part.0, %function
drawRect.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L8
	rsb	r1, r1, r1, lsl #4
	ldr	ip, [r3]
	add	r0, r0, r1, lsl #4
	add	r3, ip, r0, lsl #1
	mov	r2, r3
	push	{r4, lr}
	ldr	r1, .L8+4
	add	lr, ip, #80
	lsl	r4, r0, #1
	add	lr, lr, r0, lsl #1
.L2:
	strh	r1, [r2]	@ movhi
	add	r0, r2, #23808
	add	r2, r2, #2
	cmp	r2, lr
	strh	r1, [r0, #192]	@ movhi
	bne	.L2
	add	r1, ip, #24320
	add	r1, r1, #160
	ldr	r2, .L8+4
	add	r1, r1, r4
.L3:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #80]	@ movhi
	add	r3, r3, #480
	cmp	r1, r3
	bne	.L3
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.word	32736
	.size	drawRect.part.0, .-drawRect.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLetter.part.0, %function
drawLetter.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L18
	push	{r4, r5, lr}
	ldr	r2, [r3]
	rsb	r5, r1, r1, lsl #4
	add	r4, r0, r5, lsl #4
	add	ip, r2, r4, lsl #1
	mov	r3, ip
	mvn	lr, #64512
	add	r1, r2, #14848
	add	r1, r1, #32
	add	r1, r1, r4, lsl #1
	lsl	r5, r5, #4
	lsl	r4, r4, #1
.L11:
	strh	lr, [r3]	@ movhi
	strh	lr, [r3, #60]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L11
	mvn	r1, #64512
	add	r3, r2, #7168
	add	r3, r3, #62
	add	r3, r3, r4
.L12:
	strh	r1, [ip]	@ movhi
	add	ip, ip, #480
	add	ip, ip, #2
	cmp	ip, r3
	bne	.L12
	mvn	ip, #64512
	add	r3, r0, r5
	add	r3, r3, #3600
	add	r3, r3, #15
	add	r1, r2, #60
	add	r3, r2, r3, lsl #1
	add	r2, r1, r4
.L13:
	strh	ip, [r3]	@ movhi
	sub	r3, r3, #476
	sub	r3, r3, #2
	cmp	r2, r3
	bne	.L13
	pop	{r4, r5, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
	.size	drawLetter.part.0, .-drawLetter.part.0
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
	mov	r2, #31
	mov	r1, #50
	mov	r0, #67108864
	ldr	r3, .L23
	ldr	r3, [r3]
	ldr	ip, .L23+4
	add	r3, r3, #4800
	push	{r4, lr}
	strh	ip, [r0]	@ movhi
	mov	r0, r1
	strh	r2, [r3, #40]	@ movhi
	ldr	r3, .L23+8
	mov	lr, pc
	bx	r3
	mov	r1, #100
	ldr	r4, .L23+12
	mov	r0, r1
	mov	lr, pc
	bx	r4
	mov	r1, #80
	mov	r0, #150
	mov	lr, pc
	bx	r4
.L21:
	b	.L21
.L24:
	.align	2
.L23:
	.word	.LANCHOR0
	.word	1027
	.word	drawRect.part.0
	.word	drawLetter.part.0
	.size	main, .-main
	.text
	.align	2
	.global	setPixel
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L26
	rsb	r0, r0, r0, lsl #4
	ldr	r3, [r3]
	add	r1, r1, r0, lsl #4
	lsl	r1, r1, #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L27:
	.align	2
.L26:
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #199
	cmple	r1, #109
	bxgt	lr
	b	drawRect.part.0
	.size	drawRect, .-drawRect
	.align	2
	.global	drawLetter
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLetter, %function
drawLetter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #239
	cmple	r0, #159
	bxgt	lr
	b	drawLetter.part.0
	.size	drawLetter, .-drawLetter
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
