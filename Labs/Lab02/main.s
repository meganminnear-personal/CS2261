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
	mov	r2, #67108864
	mvn	r1, #32768
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, #0
	ldr	r0, .L4
	ldr	r3, .L4+4
	strh	r0, [r2]	@ movhi
	ldr	r2, .L4+8
	ldrh	r0, [r3, #48]
	strh	r0, [r2]	@ movhi
	mov	r10, #60
	ldrh	ip, [r3, #48]
	ldr	r2, .L4+12
	ldr	r3, .L4+16
	strh	ip, [r2]	@ movhi
	ldr	r0, .L4+20
	ldr	r4, .L4+24
	ldr	r2, .L4+28
	mov	r9, #25
	strh	r1, [r3]	@ movhi
	ldr	r3, .L4+32
	strh	r5, [r4]	@ movhi
	strh	r0, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r2, #20
	mov	lr, #50
	mov	r8, #165
	mov	ip, #15
	mov	r7, #120
	mov	r3, #1
	mov	r6, #80
	mov	r0, #70
	mov	r1, #113
	strh	r5, [r4]	@ movhi
	ldr	r4, .L4+36
	str	r10, [r4]
	ldr	r4, .L4+40
	str	r9, [r4]
	ldr	r4, .L4+44
	str	r2, [r4]
	ldr	r4, .L4+48
	str	r2, [r4]
	ldr	r4, .L4+52
	str	r2, [r4]
	ldr	r2, .L4+56
	str	lr, [r2]
	ldr	r2, .L4+60
	str	lr, [r2]
	ldr	r2, .L4+64
	str	r8, [r2]
	ldr	r2, .L4+68
	str	ip, [r2]
	ldr	r2, .L4+72
	str	ip, [r2]
	ldr	r2, .L4+76
	ldr	ip, .L4+80
	str	r7, [r2]
	ldr	r2, .L4+84
	str	r6, [ip]
	str	r3, [r2]
	ldr	lr, .L4+88
	ldr	ip, .L4+92
	ldr	r2, .L4+96
	str	r3, [lr]
	str	r3, [ip]
	str	r3, [r2]
	ldr	lr, .L4+100
	ldr	ip, .L4+104
	ldr	r2, .L4+108
	ldr	r3, .L4+112
	str	r0, [lr]
	str	r0, [ip]
	str	r1, [r2]
	str	r1, [r3]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	eColor
	.word	32736
	.word	mColor
	.word	bgColor
	.word	fillScreen
	.word	eHeight
	.word	eWidth
	.word	eRow0
	.word	eRow1
	.word	bHeight
	.word	eCol0
	.word	mWidth
	.word	eCol1
	.word	mHeight
	.word	bWidth
	.word	mRow
	.word	mCol
	.word	mRDel
	.word	mCDel
	.word	bRDel
	.word	bCDel
	.word	bRow
	.word	bOldRow
	.word	bCol
	.word	bOldCol
	.size	initialize, .-initialize
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L34
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldrh	r2, [r3]
	ldr	r3, .L34+4
	tst	r2, #1
	ldrh	ip, [r3]
	sub	sp, sp, #28
	beq	.L7
	ands	r3, ip, #1
	beq	.L32
.L7:
	ldr	r5, .L34+8
	ldr	r0, [r5]
	cmp	r0, #0
	movlt	r3, #0
	ldrlt	r2, .L34+12
	strlt	r0, [r2]
	movlt	r0, r3
	ldr	r7, .L34+16
	ldr	r2, [r7]
	strlt	r3, [r5]
	add	r3, r2, r0
	cmp	r3, #240
	ldr	r4, .L34+20
	ldrgt	r3, .L34+12
	ldr	r1, [r4]
	strgt	r0, [r3]
	rsbgt	r0, r2, #240
	strgt	r0, [r5]
	cmp	r1, #0
	movlt	r3, #0
	ldrlt	lr, .L34+24
	strlt	r1, [lr]
	movlt	r1, r3
	ldr	r6, .L34+28
	strlt	r3, [r4]
	ldr	r3, [r6]
	add	lr, r3, r1
	cmp	lr, #160
	ldrgt	lr, .L34+24
	strgt	r1, [lr]
	rsbgt	r1, r3, #160
	strgt	r1, [r4]
	tst	ip, #64
	subeq	r1, r1, #1
	streq	r1, [r4]
	beq	.L14
	tst	ip, #128
	addeq	r1, r1, #1
	streq	r1, [r4]
	bne	.L33
.L14:
	ldr	ip, .L34+32
	ldr	r9, .L34+36
	ldr	r10, .L34+40
	ldr	lr, [ip]
	ldr	fp, .L34+44
	ldr	ip, [r9]
	ldr	r8, [r10]
	ldr	fp, [fp]
	cmp	lr, #0
	rsble	ip, ip, #0
	add	r8, lr, r8
	strle	ip, [r9]
	str	fp, [sp, #20]
	cmp	r8, #240
	ldr	fp, .L34+48
	rsbgt	ip, ip, #0
	strgt	ip, [r9]
	ldr	fp, [fp]
	add	ip, lr, ip
	ldr	lr, [sp, #20]
	stm	sp, {fp, lr}
	ldr	r9, .L34+52
	ldr	lr, [r9]
	ldr	r8, .L34+56
	str	lr, [sp, #12]
	ldr	lr, [r8]
	str	lr, [sp, #8]
	ldr	lr, .L34+32
	ldr	fp, .L34+60
	str	ip, [lr]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	beq	.L19
.L31:
	ldr	r2, [r7]
	ldr	r3, [r6]
	add	r2, r2, r2, lsr #31
	add	r3, r3, r3, lsr #31
	asr	r2, r2, #1
	asr	r3, r3, #1
	rsb	r2, r2, #120
	rsb	r3, r3, #80
	str	r2, [r5]
	str	r3, [r4]
.L6:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L33:
	tst	ip, #16
	addeq	r0, r0, #1
	streq	r0, [r5]
	beq	.L14
	tst	ip, #32
	subeq	r0, r0, #1
	streq	r0, [r5]
	b	.L14
.L32:
	ldr	r2, .L34+64
	ldr	r1, .L34+68
	ldrh	r0, [r2]
	cmp	r0, r1
	mvnne	r3, #32768
	strh	r3, [r2]	@ movhi
	b	.L7
.L19:
	ldr	r2, .L34+72
	ldr	r3, .L34+76
	ldr	r0, [r9]
	ldr	r1, [r8]
	ldr	r2, [r2]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r7]
	ldr	r3, [r6]
	ldr	r1, [r4]
	ldr	r0, [r5]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	bne	.L31
	ldr	r2, .L34+80
	ldr	r3, .L34+84
	ldr	r1, .L34+32
	ldr	r2, [r2]
	ldr	r1, [r1]
	ldr	r3, [r3]
	ldr	r0, [r10]
	str	r1, [sp]
	str	r0, [sp, #8]
	str	r2, [sp, #12]
	str	r3, [sp, #4]
	ldr	r2, [r7]
	ldr	r3, [r6]
	ldr	r1, [r4]
	ldr	r0, [r5]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	beq	.L6
	ldr	r1, .L34+88
	ldrh	r3, [r1]
	cmp	r3, #0
	moveq	r0, #31
	movne	r0, #0
	ldr	r2, [r7]
	ldr	r3, [r6]
	add	r2, r2, r2, lsr #31
	add	r3, r3, r3, lsr #31
	asr	r2, r2, #1
	asr	r3, r3, #1
	rsb	r2, r2, #120
	rsb	r3, r3, #80
	str	r2, [r5]
	str	r3, [r4]
	strh	r0, [r1]	@ movhi
	b	.L6
.L35:
	.align	2
.L34:
	.word	oldButtons
	.word	buttons
	.word	bCol
	.word	bOldCol
	.word	bWidth
	.word	bRow
	.word	bOldRow
	.word	bHeight
	.word	mCol
	.word	mCDel
	.word	mWidth
	.word	eRow0
	.word	eCol0
	.word	eHeight
	.word	eWidth
	.word	collision
	.word	eColor
	.word	32767
	.word	eRow1
	.word	eCol1
	.word	mHeight
	.word	mRow
	.word	mColor
	.size	update, .-update
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L38
	ldrh	r3, [r5]
	sub	sp, sp, #12
	str	r3, [sp]
	ldr	r10, .L38+4
	ldr	r9, .L38+8
	ldr	r1, .L38+12
	ldr	r0, .L38+16
	ldr	r4, .L38+20
	ldr	r3, [r10]
	ldr	r2, [r9]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldrh	r3, [r5]
	ldr	lr, .L38+24
	str	r3, [sp]
	ldr	r8, .L38+28
	ldr	r7, .L38+32
	ldr	r5, .L38+36
	ldr	r1, [lr]
	ldr	r3, [r8]
	ldr	r2, [r7]
	ldr	r0, [r5]
	mov	lr, pc
	bx	r4
	mov	r1, #31744
	ldr	r3, [r10]
	ldr	r2, [r9]
	ldr	r6, .L38+40
	str	r1, [sp]
	ldr	r5, .L38+44
	ldr	fp, .L38+48
	ldr	r1, [r6]
	ldr	r0, [r5]
	mov	lr, pc
	bx	r4
	ldrh	r3, [fp]
	ldr	r10, .L38+52
	str	r3, [sp]
	ldr	r9, .L38+56
	ldr	r1, .L38+60
	ldr	r0, .L38+64
	ldr	r3, [r10]
	ldr	r2, [r9]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldrh	r3, [fp]
	ldr	r1, .L38+68
	str	r3, [sp]
	ldr	r0, .L38+72
	ldr	r3, [r10]
	ldr	r2, [r9]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r3, .L38+76
	ldrh	r1, [r3]
	ldr	r10, .L38+80
	str	r1, [sp]
	ldr	r9, .L38+84
	ldr	r3, [r8]
	ldr	r2, [r7]
	ldr	r1, [r10]
	ldr	r0, [r9]
	mov	lr, pc
	bx	r4
	ldr	r0, [r6]
	ldr	ip, .L38+12
	ldr	r1, [r5]
	ldr	r2, [r10]
	ldr	r3, [r9]
	str	r0, [ip]
	ldr	lr, .L38+24
	ldr	r0, .L38+16
	ldr	r5, .L38+36
	str	r1, [r0]
	str	r2, [lr]
	str	r3, [r5]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	bgColor
	.word	bHeight
	.word	bWidth
	.word	bOldRow
	.word	bOldCol
	.word	drawRect
	.word	mOldRow
	.word	mHeight
	.word	mWidth
	.word	mOldCol
	.word	bRow
	.word	bCol
	.word	eColor
	.word	eHeight
	.word	eWidth
	.word	eRow0
	.word	eCol0
	.word	eRow1
	.word	eCol1
	.word	mColor
	.word	mRow
	.word	mCol
	.size	draw, .-draw
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
	push	{r7, lr}
	ldr	r3, .L43
	mov	lr, pc
	bx	r3
	ldr	r9, .L43+4
	ldr	r8, .L43+8
	ldr	r7, .L43+12
	ldr	r6, .L43+16
	ldr	r5, .L43+20
	ldr	r4, .L43+24
.L41:
	ldrh	r3, [r4, #48]
	strh	r3, [r9]	@ movhi
	mov	lr, pc
	bx	r8
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	b	.L41
.L44:
	.align	2
.L43:
	.word	initialize
	.word	buttons
	.word	update
	.word	oldButtons
	.word	waitForVBlank
	.word	draw
	.word	67109120
	.size	main, .-main
	.comm	bWidth,4,4
	.comm	bHeight,4,4
	.comm	bCDel,4,4
	.comm	bRDel,4,4
	.comm	bOldCol,4,4
	.comm	bOldRow,4,4
	.comm	bCol,4,4
	.comm	bRow,4,4
	.comm	mColor,2,2
	.comm	mCDel,4,4
	.comm	mRDel,4,4
	.comm	mOldCol,4,4
	.comm	mOldRow,4,4
	.comm	mWidth,4,4
	.comm	mHeight,4,4
	.comm	mRow,4,4
	.comm	mCol,4,4
	.comm	eColor,2,2
	.comm	eWidth,4,4
	.comm	eHeight,4,4
	.comm	eCol1,4,4
	.comm	eCol0,4,4
	.comm	eRow1,4,4
	.comm	eRow0,4,4
	.comm	bgColor,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
