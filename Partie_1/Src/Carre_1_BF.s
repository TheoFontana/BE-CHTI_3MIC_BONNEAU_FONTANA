	thumb
	
	area  moncode, code, readonly
	export	timer_callback
	extern drapeau

GPIOB_BSRR	equ	0x40010C10	; Bit Set/Reset register
	
	
timer_callback proc
	ldr	r0, =drapeau
	ldr	r2, [r0]
	cbz	r2, mise_a_1
	cbnz	r2, mise_a_0   

mise_a_1
; mise a 1 de PB1
	ldr	r3, =GPIOB_BSRR
	mov	r1, #0x00000002
	str	r1, [r3]
	mov	r2, #1
	str	r2, [r0]
	bx	lr

mise_a_0		
; mise a 0 de PB1
	ldr	r3, =GPIOB_BSRR
	mov	r1, #0x00020000
	str	r1, [r3]
	mov	r2, #0
	str	r2, [r0]
	bx	lr
	
; N.B. le registre BSRR est write-only, on ne peut pas le relire
	endp
	end