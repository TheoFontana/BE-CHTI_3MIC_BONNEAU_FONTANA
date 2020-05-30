	AREA DFT_M2k, code, READONLY
	import TabSin
	import TabCos
	import TabSig
	export dft
		
; r0 : adresse de TabSig (pour avoir accès aux x(i))
; r1 : k
; r2 : adresses TabCos puis Tabsin
		
N EQU 64
	
calcul_somme proc
	; r3 : résultat de la somme
	; r4 : indice i
	; r5 : ligne du signal : x(i)
	; r6 : i*k (puis cos ou sin du produit)
	
	push	{lr}
	push	{r4,r5,r6}
	
	mov	r3,#0 
	mov	r4,#0
boucle
	ldrsh	r5, [r0, r4 ,LSL #1] ; on récupère x(i)
	mul	r6, r4, r1 ; Calcul de ik
	and	r6,r6, #63 ; ik Modulo 64 (equivalent modulo 2pi)
	
	ldrsh	r6, [r2, r6 ,lsl #1] ; on récupère le cos ou le sin de i*k
	
	mla	r3, r5, r6, r3 ; ajout du ième terme à la somme
	
	add	r4,#1 ; incrémentation de i (i++)
	cmp	r4,#N ; comparaison entre i et N (64)
	
	bne	boucle  ; i/=N : on continue la boucle
	beq	fin_boucle ; i=N : on sort
	
fin_boucle
	mov	r0,r3 ; on met le résultat dans r0 pour le transmettre à la fct principale (dft)
	pop	{r4,r5,r6}
	pop	{pc} ; pop (lr) + bx lr
	
	endp
	
	
	
dft proc
	; r4 et r5 : re(k)^2
	push	{lr}
	push	{r0,r1,r4,r5}
	
	ldr	r2,=TabCos
	bl	calcul_somme ; calcul de la partie réelle
	;Rajouter un point d'arret ci-dessous pour observer la partie réelle (renvoyée par la fonction dans R0)
	smull	r4,r5,r0,r0 ; on calcule la partie réelle au carré dans r4 et r5 
	
	pop	{r0,r1}
	
	ldr	r2,=TabSin
	bl	calcul_somme ; calcul de la partie imaginaire
	
	;Rajouter un point d'arret ci-dessous pour observer la partie imaginaire (renvoyée par la fonction dans R0)
	smlal	r4,r5,r0,r0 ; on fait la partie imaginaire au carré plus le carré de la partie réelle dans r4 et r5
	
	mov	r0,r5
	pop	{r4,r5}
	pop	{pc} ; pop (lr) + bx lr
	
	endp
		
end