	thumb
		
TIM3_CCR3	equ	0x4000043C	; adresse registre PWM
	
	area  moncode, code, readonly
	export	timer_callback
	import etat
	get	etat.inc

; La valeur minimale est -32768, on ajoute donc cette valeur en composante continue pour avoir des valeurs positives
COMPOSANTE_CONTINUE	equ	32768
	
timer_callback proc
	; R0 : adresse de la variable état
	; R1 : valeur de etat.position (int)
	; R2 : valeur de etat.taille (int)
	; R3 : valeur de etat.son
	; R4 : etat.son[position]
	; R5 : TIM3_CCR3
	; R12 : etat.resolution
	
	push {r4,r5}
	
	ldr	r0, =etat
	ldr	r1, [R0,#E_POS] 
	ldr	r2, [R0,#E_TAI] 
	ldr	r3, [R0,#E_SON]
	ldr	r5, =TIM3_CCR3
	ldr	r12, [R0,#E_RES] 
	
	cmp	r1,r2 ; On compare la position et la taille
	bne	son
	beq	fin
	

; Si position<taille : 
son

	ldrsh	R4,[R3,R1, LSL#1] ; R4 = etat.son[position]
	add	r4,r4,#COMPOSANTE_CONTINUE ; Ajout de la composante continue
	mul	r4,r12 ; On multiplie l'échantillon par la résolution
	lsr	r4, #16 ; On divise par 2^16
	
	str	r4, [r5]
	
	add	r1, #1 ; On incrémente la position
	str	r1,[R0,#E_POS] 
	


; Si position=taille	
fin
	pop	{r4,r5}
	bx	lr
	

	endp
	end