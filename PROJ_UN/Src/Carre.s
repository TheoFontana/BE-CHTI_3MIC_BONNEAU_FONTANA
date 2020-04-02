area moncode
	
export timer_callback
	
proc timer_callback

	

	endp
	
	
GPIOB_BSRR	equ	0x40010C10	; Bit Set/Reset register
; mise a 1 de PB1
	ldr	r3, =GPIOB_BSRR
	mov	r1, #0x00000002
	str	r1, [r3]
; mise a zero de PB1
	ldr	r3, =GPIOB_BSRR
	mov	r1, #0x00020000
	str	r1, [r3]
; N.B. le registre BSRR est write-only, on ne peut pas le relire