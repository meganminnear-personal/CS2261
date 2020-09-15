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
	.global	waitForVBlank
	.arch armv4t
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
.L2:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L2
	mov	r2, #67108864
.L3:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L3
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	setBackground
	.syntax unified
	.arm
	.fpu softvfp
	.type	setBackground, %function
setBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L17
	ldr	ip, [r3]
	ldr	r1, .L17+4
	add	r0, ip, #57856
	add	r0, r0, #224
	add	r2, ip, #480
.L9:
	sub	r3, r2, #480
.L10:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L10
	add	r2, r3, #480
	cmp	r2, r0
	bne	.L9
	ldr	r2, .L17+8
	add	r1, ip, #76800
.L11:
	sub	r3, r0, #480
.L12:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r0
	bne	.L12
	add	r0, r3, #480
	cmp	r1, r0
	bne	.L11
	bx	lr
.L18:
	.align	2
.L17:
	.word	.LANCHOR0
	.word	20970
	.word	10890
	.size	setBackground, .-setBackground
	.align	2
	.global	drawThickLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawThickLine, %function
drawThickLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L27
	rsb	ip, r0, r0, lsl #4
	add	lr, r1, r2
	ldr	r0, [r4]
	add	r2, lr, ip, lsl #4
	sub	r4, r1, lr
	lsl	ip, ip, #4
	add	r0, r0, r2, lsl #1
	lsl	r4, r4, #1
	add	r5, ip, #2400
.L20:
	cmp	lr, r1
	addgt	r2, r0, r4
	ble	.L24
.L21:
	strh	r3, [r2], #2	@ movhi
	cmp	r2, r0
	bne	.L21
.L24:
	add	ip, ip, #240
	cmp	ip, r5
	add	r0, r0, #480
	bne	.L20
	pop	{r4, r5, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	.LANCHOR0
	.size	drawThickLine, .-drawThickLine
	.align	2
	.global	drawFlagPole
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFlagPole, %function
drawFlagPole:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	str	lr, [sp, #-4]!
	ldr	lr, .L33
	sub	r3, r0, #20
	rsb	ip, r0, r0, lsl #4
	rsb	r3, r3, r3, lsl #4
	ldr	r0, [lr]
	add	r3, r1, r3, lsl #4
	add	r1, r1, ip, lsl #4
	add	r3, r0, r3, lsl #1
	add	r1, r0, r1, lsl #1
.L30:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #-2]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r3, r3, #480
	cmp	r1, r3
	bne	.L30
	ldr	lr, [sp], #4
	bx	lr
.L34:
	.align	2
.L33:
	.word	.LANCHOR0
	.size	drawFlagPole, .-drawFlagPole
	.align	2
	.global	drawFlagNeutral
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFlagNeutral, %function
drawFlagNeutral:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L45
	ldr	ip, [r3]
	push	{r4, lr}
	rsb	r1, r1, r1, lsl #4
	add	r4, ip, #4288
	add	r3, r0, r1, lsl #4
	add	r4, r4, #32
	add	r4, r4, r3, lsl #1
	lsl	lr, r3, #1
	lsl	r1, r1, #4
	add	r3, ip, r3, lsl #1
.L36:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r3, r3, #480
	cmp	r3, r4
	bne	.L36
	add	r3, r0, r1
	add	r4, ip, #3840
	add	r3, r3, #242
	add	r4, r4, #4
	add	r3, ip, r3, lsl #1
	add	r4, r4, lr
.L37:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r3, r3, #480
	cmp	r3, r4
	bne	.L37
	add	r3, r0, r1
	add	r4, ip, #3360
	add	r3, r3, #484
	add	r4, r4, #8
	add	r3, ip, r3, lsl #1
	add	r4, r4, lr
.L38:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r3, r3, #480
	cmp	r4, r3
	bne	.L38
	add	r3, r0, r1
	add	r3, r3, #724
	add	r4, ip, #2880
	add	r3, r3, #2
	add	r4, r4, #12
	add	r3, ip, r3, lsl #1
	add	lr, r4, lr
.L39:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r3, r3, #480
	cmp	lr, r3
	bne	.L39
	add	r1, r1, #960
	add	r3, r0, #8
	add	r0, r0, #9
	add	r3, r3, r1
	add	r1, r0, r1
	lsl	r3, r3, #1
	lsl	r1, r1, #1
	strh	r2, [ip, r3]	@ movhi
	pop	{r4, lr}
	strh	r2, [ip, r1]	@ movhi
	bx	lr
.L46:
	.align	2
.L45:
	.word	.LANCHOR0
	.size	drawFlagNeutral, .-drawFlagNeutral
	.align	2
	.global	drawTent
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTent, %function
drawTent:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r1, #32768
	ldr	r3, .L75
	ldr	ip, [r3]
	push	{r4, r5, r6, lr}
	add	r0, ip, #38656
	add	lr, ip, #57856
	add	r2, r0, #104
	add	lr, lr, #104
.L48:
	sub	r3, r2, #240
.L49:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L49
	add	r2, r3, #480
	cmp	r2, lr
	bne	.L48
	mvn	r1, #32768
	add	lr, ip, #33792
	add	r2, lr, #148
	add	r4, r0, #84
.L52:
	sub	r3, r2, #200
.L51:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L51
	add	r2, r2, #480
	cmp	r4, r2
	bne	.L52
	add	r4, lr, #128
	mvn	lr, #32768
	add	r2, ip, #28928
	add	r1, r2, #192
.L53:
	sub	r3, r1, #160
.L54:
	strh	lr, [r3], #2	@ movhi
	cmp	r1, r3
	bne	.L54
	add	r1, r1, #480
	cmp	r4, r1
	bne	.L53
	mvn	lr, #32768
	add	r4, ip, #24064
	add	r1, r4, #236
	add	r5, r2, #172
.L57:
	sub	r3, r1, #120
.L56:
	strh	lr, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L56
	add	r1, r3, #480
	cmp	r1, r5
	bne	.L57
	mvn	lr, #32768
	add	r1, ip, #19456
	add	r4, r4, #216
	add	r1, r1, #24
.L58:
	sub	r3, r1, #80
.L59:
	strh	lr, [r3], #2	@ movhi
	cmp	r1, r3
	bne	.L59
	add	r1, r1, #480
	cmp	r4, r1
	bne	.L58
	mov	r1, #0
	add	r3, ip, #9792
	add	lr, ip, #19200
	add	r3, r3, #48
	add	lr, lr, #240
.L61:
	strh	r1, [r3]	@ movhi
	strh	r1, [r3, #-2]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	add	r3, r3, #480
	cmp	lr, r3
	bne	.L61
	mov	r1, #0
	add	r3, ip, #28672
	add	ip, ip, #38400
	add	r3, r3, #250
	add	ip, ip, #122
.L62:
	strh	r1, [r3]	@ movhi
	strh	r1, [r3, #-2]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	add	r3, r3, #480
	cmp	ip, r3
	bne	.L62
	mov	r1, #0
	add	r3, r2, #228
	add	r0, r0, #100
.L63:
	strh	r1, [r3]	@ movhi
	strh	r1, [r3, #-2]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	add	r3, r3, #480
	cmp	r0, r3
	bne	.L63
	mov	r2, #31
	mov	r1, #20
	mov	r0, #122
	bl	drawFlagNeutral
	mov	r2, #31744
	mov	r1, #60
	mov	r0, #63
	bl	drawFlagNeutral
	mov	r1, #60
	mov	r0, #180
	ldr	r2, .L75+4
	pop	{r4, r5, r6, lr}
	b	drawFlagNeutral
.L76:
	.align	2
.L75:
	.word	.LANCHOR0
	.word	32767
	.size	drawTent, .-drawTent
	.align	2
	.global	drawFlagUp
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFlagUp, %function
drawFlagUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L93
	ldr	ip, [r3]
	push	{r4, lr}
	rsb	r1, r1, r1, lsl #4
	add	r4, ip, #4288
	add	r3, r0, r1, lsl #4
	add	r4, r4, #32
	add	r4, r4, r3, lsl #1
	lsl	lr, r3, #1
	lsl	r1, r1, #4
	add	r3, ip, r3, lsl #1
.L78:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r3, r3, #480
	cmp	r3, r4
	bne	.L78
	add	r3, r0, #2
	add	r4, ip, #3840
	add	r3, r3, r1
	add	r4, r4, #4
	add	r3, ip, r3, lsl #1
	add	r4, r4, lr
.L79:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r3, r3, #480
	cmp	r3, r4
	bne	.L79
	add	r3, r0, #4
	add	r4, ip, #3360
	add	r3, r3, r1
	add	r4, r4, #8
	add	r3, ip, r3, lsl #1
	add	r4, r4, lr
.L80:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r3, r3, #480
	cmp	r4, r3
	bne	.L80
	add	r3, r0, #6
	add	r4, ip, #2880
	add	r3, r3, r1
	add	r4, r4, #12
	add	r3, ip, r3, lsl #1
	add	r4, r4, lr
.L81:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r3, r3, #480
	cmp	r4, r3
	bne	.L81
	add	r3, r0, #8
	add	r3, r3, r1
	add	r4, ip, #2416
	add	r3, ip, r3, lsl #1
	add	r4, r4, lr
.L82:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r3, r3, #480
	cmp	r4, r3
	bne	.L82
	add	r3, r0, #10
	add	r4, ip, #1936
	add	r3, r3, r1
	add	r4, r4, #4
	add	r3, ip, r3, lsl #1
	add	r4, r4, lr
.L83:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r3, r3, #480
	cmp	r4, r3
	bne	.L83
	add	r3, r0, #12
	add	r4, ip, #1456
	add	r3, r3, r1
	add	r4, r4, #8
	add	r3, ip, r3, lsl #1
	add	lr, r4, lr
.L84:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r3, r3, #480
	cmp	r3, lr
	bne	.L84
	add	r3, r1, #240
	add	lr, r0, #14
	add	r0, r0, #15
	add	r4, lr, r1
	add	r1, r0, r1
	add	lr, r3, lr
	add	r0, r3, r0
	lsl	lr, lr, #1
	lsl	r3, r4, #1
	lsl	r1, r1, #1
	lsl	r0, r0, #1
	strh	r2, [ip, r3]	@ movhi
	strh	r2, [ip, r1]	@ movhi
	strh	r2, [ip, lr]	@ movhi
	strh	r2, [ip, r0]	@ movhi
	pop	{r4, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	.LANCHOR0
	.size	drawFlagUp, .-drawFlagUp
	.align	2
	.global	drawFlagDown
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFlagDown, %function
drawFlagDown:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L109
	push	{r4, r5, r6, lr}
	ldr	lr, [r3]
	add	r4, r1, #1
	rsb	r4, r4, r4, lsl #4
	rsb	r1, r1, r1, lsl #4
	add	ip, lr, #4288
	add	r6, r0, r1, lsl #4
	add	r3, r0, r4, lsl #4
	add	r5, ip, #32
	lsl	r1, r4, #4
	add	r3, lr, r3, lsl #1
	lsl	r4, r6, #1
	add	r5, r5, r6, lsl #1
.L96:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r3, r3, #480
	cmp	r3, r5
	bne	.L96
	add	r3, r0, r1
	add	r3, r3, #242
	add	r5, ip, #36
	add	r3, lr, r3, lsl #1
	add	r5, r5, r4
.L97:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r3, r3, #480
	cmp	r3, r5
	bne	.L97
	add	r3, r0, r1
	add	r3, r3, #484
	add	r5, ip, #40
	add	r3, lr, r3, lsl #1
	add	r5, r5, r4
.L98:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r3, r3, #480
	cmp	r5, r3
	bne	.L98
	add	r3, r0, r1
	add	r3, r3, #724
	add	r3, r3, #2
	add	r5, ip, #44
	add	r3, lr, r3, lsl #1
	add	r5, r5, r4
.L99:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r3, r3, #480
	cmp	r5, r3
	bne	.L99
	add	r3, r0, r1
	add	r3, r3, #968
	add	r5, ip, #48
	add	r3, lr, r3, lsl #1
	add	r5, r5, r4
.L100:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r3, r3, #480
	cmp	r5, r3
	bne	.L100
	add	r3, r0, r1
	add	r3, r3, #1200
	add	ip, ip, #52
	add	r3, r3, #10
	add	r4, ip, r4
	add	r3, lr, r3, lsl #1
.L101:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r3, r3, #480
	cmp	r3, r4
	bne	.L101
	add	r4, r0, #12
	add	r5, r1, #1440
	add	ip, r0, #13
	add	r1, r1, #1680
	add	r3, r0, #14
	add	r0, r0, #15
	add	r6, r4, r5
	add	r3, r3, r1
	add	r4, r1, r4
	add	r5, r5, ip
	add	ip, r1, ip
	add	r1, r0, r1
	lsl	r6, r6, #1
	lsl	r4, r4, #1
	lsl	r5, r5, #1
	lsl	r0, ip, #1
	lsl	r3, r3, #1
	lsl	r1, r1, #1
	strh	r2, [lr, r6]	@ movhi
	strh	r2, [lr, r5]	@ movhi
	strh	r2, [lr, r4]	@ movhi
	strh	r2, [lr, r0]	@ movhi
	strh	r2, [lr, r3]	@ movhi
	strh	r2, [lr, r1]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L110:
	.align	2
.L109:
	.word	.LANCHOR0
	.size	drawFlagDown, .-drawFlagDown
	.align	2
	.global	updateFlag
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFlag, %function
updateFlag:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	mov	r1, #20
	push	{r4, lr}
	ldr	r2, .L120
	beq	.L117
	cmp	r0, #1
	beq	.L118
	cmp	r0, #2
	mov	r0, #122
	beq	.L119
	bl	drawFlagUp
	mov	r1, #60
	mov	r0, #63
	ldr	r2, .L120
	bl	drawFlagUp
	mov	r1, #60
	mov	r0, #180
	ldr	r2, .L120
	bl	drawFlagUp
.L116:
	mov	r2, #31
	mov	r1, #20
	mov	r0, #122
	bl	drawFlagNeutral
	mov	r2, #31744
	mov	r1, #60
	mov	r0, #63
	bl	drawFlagNeutral
	mov	r1, #60
	mov	r0, #180
	ldr	r2, .L120+4
	pop	{r4, lr}
	b	drawFlagNeutral
.L117:
	mov	r0, #122
	bl	drawFlagNeutral
	mov	r1, #60
	mov	r0, #63
	ldr	r2, .L120
	bl	drawFlagNeutral
	mov	r1, #60
	mov	r0, #180
	ldr	r2, .L120
	bl	drawFlagNeutral
	mov	r2, #31
	mov	r1, #20
	mov	r0, #122
	bl	drawFlagDown
	mov	r2, #31744
	mov	r1, #60
	mov	r0, #63
	bl	drawFlagDown
	mov	r1, #60
	mov	r0, #180
	ldr	r2, .L120+4
	pop	{r4, lr}
	b	drawFlagDown
.L119:
	bl	drawFlagNeutral
	mov	r1, #60
	mov	r0, #63
	ldr	r2, .L120
	bl	drawFlagNeutral
	mov	r1, #60
	mov	r0, #180
	ldr	r2, .L120
	bl	drawFlagNeutral
	mov	r2, #31
	mov	r1, #20
	mov	r0, #122
	bl	drawFlagUp
	mov	r2, #31744
	mov	r1, #60
	mov	r0, #63
	bl	drawFlagUp
	mov	r1, #60
	mov	r0, #180
	ldr	r2, .L120+4
	pop	{r4, lr}
	b	drawFlagUp
.L118:
	mov	r0, #122
	bl	drawFlagDown
	mov	r1, #60
	mov	r0, #63
	ldr	r2, .L120
	bl	drawFlagDown
	mov	r1, #60
	mov	r0, #180
	ldr	r2, .L120
	bl	drawFlagDown
	b	.L116
.L121:
	.align	2
.L120:
	.word	20970
	.word	32767
	.size	updateFlag, .-updateFlag
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, #67108864
	mov	r6, #0
	ldr	r2, .L131
	ldr	r3, .L131+4
	strh	r2, [r4]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L131+8
	mov	r8, r6
	mov	lr, pc
	bx	r3
	ldr	r7, .L131+12
	ldr	r9, .L131+16
.L123:
	ldrh	r3, [r4, #6]
	cmp	r3, #160
	bhi	.L123
.L124:
	ldrh	r3, [r4, #6]
	cmp	r3, #159
	bls	.L124
	umull	r3, r2, r9, r6
	bic	r3, r2, #1
	add	r3, r3, r2, lsr #1
	subs	r5, r6, r3
	bne	.L125
	mov	r0, r8
	mov	lr, pc
	bx	r7
	cmp	r8, #3
	moveq	r8, r5
	addne	r8, r8, #1
.L125:
	add	r6, r6, #1
	b	.L123
.L132:
	.align	2
.L131:
	.word	1027
	.word	setBackground
	.word	drawTent
	.word	updateFlag
	.word	-1431655765
	.size	main, .-main
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
