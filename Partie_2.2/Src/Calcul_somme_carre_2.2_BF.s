	thumb
		
	area calcul_somme_carre, code, readonly
	import TabSin
	import TabCos
	export somme_carre_trigo
		
; r0 résutat de la somme des carrés
; r1 valeur du cos considérée
; r2 valeur du sin considérée
; r3 données des 64 sin puis cos
		
somme_carre_trigo	proc
	
	ldr	r3, =TabCos
	ldrsh	r1, [r3, r0, lsl #1] ;On récupère les cos ligne à ligne

	ldr	r3, =TabSin
	ldrsh	r2, [r3, r0, lsl #1] ;On récupère les sin ligne à ligne
	
	mov	r0,#0 ; On remet r0 à 0
	mla	r0,r1,r1,r0 ; r0 = r1*r1+r0
	mla	r0,r2,r2,r0; r0 = r2*r2+r0
	
	bx	lr
	
	endp
	end